-------------------------------------------------------------------------------
-- display.vhd
-- Renders the captured waveforms to 640x480 VGA (12-bit colour).
--
--  y   0..31  : status bar - buffer overview (visible window, trigger and
--               cursor ticks) and a capture-state lamp
--  y  32..447 : 16 channel rows, 26 px each, hex label at left
--  y 448..479 : ruler (grid / sample ticks), cursor A-B span bar, trigger
--
-- Sample memory is split into even/odd halves so two consecutive samples can
-- be read per 100 MHz clock. With 4 clocks per pixel this lets every pixel
-- column inspect up to 8 samples: when zoomed out, a channel that changes
-- inside one column is drawn as a "busy" band instead of being aliased away.
--
-- Pixel pipeline - one stage per pixel clock-enable (pix_en, every 4 clocks).
-- Every stage is kept shallow so the design closes timing at 100 MHz
-- without multicycle constraints.
--   PA : x/y decode - row ROM, zoom mapping, region flags
--   PB : sample index, palette, font, overview bar
--   PC : cursor / trigger hits, programs the RAM read sequencer
--   PD : base colour (everything except the waveform itself)
--   PE : pick this row's channel bits out of the read result
--   PF : final colour -> VGA pins
-- hsync/vsync travel down the same pipeline, so they stay aligned.
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.la_pkg.all;

entity display is
    port (
        clk        : in  std_logic;
        -- timing
        pix_en     : in  std_logic;
        h          : in  integer range 0 to 799;
        v          : in  integer range 0 to 524;
        active     : in  std_logic;
        hsync_in   : in  std_logic;
        vsync_in   : in  std_logic;
        -- view settings
        zoom       : in  zoom_t;
        view_start : in  idx_t;
        cur_a      : in  idx_t;
        cur_b      : in  idx_t;
        trig_ch    : in  unsigned(3 downto 0);
        -- capture info
        disp_bank  : in  std_logic;
        disp_start : in  idx_t;
        disp_trig  : in  idx_t;
        cap_state  : in  std_logic_vector(1 downto 0);
        running    : in  std_logic;
        continuous : in  std_logic;
        -- sample RAM read ports (even / odd physical samples), bank & word
        ram_addr_e : out std_logic_vector(ADDR_W-1 downto 0);
        ram_addr_o : out std_logic_vector(ADDR_W-1 downto 0);
        ram_q_e    : in  sample_t;
        ram_q_o    : in  sample_t;
        -- VGA
        vga_r      : out std_logic_vector(3 downto 0);
        vga_g      : out std_logic_vector(3 downto 0);
        vga_b      : out std_logic_vector(3 downto 0);
        vga_hs     : out std_logic;
        vga_vs     : out std_logic
    );
end entity;

architecture rtl of display is

    subtype rgb_t is std_logic_vector(11 downto 0);

    -- colours (RGB 4:4:4)
    constant C_BLACK  : rgb_t := x"000";
    constant C_BG     : rgb_t := x"001";
    constant C_TOPBG  : rgb_t := x"112";
    constant C_LBLBG  : rgb_t := x"112";
    constant C_LBLTRG : rgb_t := x"512";
    constant C_GRID   : rgb_t := x"223";
    constant C_SEP    : rgb_t := x"112";
    constant C_OV_OUT : rgb_t := x"334";
    constant C_OV_IN  : rgb_t := x"88A";
    constant C_TRIG   : rgb_t := x"F22";
    constant C_CUR_A  : rgb_t := x"0EF";
    constant C_CUR_B  : rgb_t := x"F4F";
    constant C_SPAN   : rgb_t := x"552";
    constant C_RULER  : rgb_t := x"667";
    constant C_ST_IDL : rgb_t := x"2C4";   -- holding a capture
    constant C_ST_STP : rgb_t := x"555";   -- continuous mode stopped
    constant C_ST_WT  : rgb_t := x"FA0";   -- waiting for trigger
    constant C_ST_CAP : rgb_t := x"28F";   -- capturing

    type pal_t is array (0 to 7) of rgb_t;
    constant PAL : pal_t := (x"2F6", x"FD2", x"2DF", x"F82",
                             x"F6B", x"9AF", x"BF4", x"C8F");

    function dim4(c : rgb_t) return rgb_t is   -- 1/4 brightness
    begin
        return "00" & c(11 downto 10) & "00" & c(7 downto 6) & "00" & c(3 downto 2);
    end function;
    function dim2(c : rgb_t) return rgb_t is   -- 1/2 brightness
    begin
        return '0' & c(11 downto 9) & '0' & c(7 downto 5) & '0' & c(3 downto 1);
    end function;

    -- 8x8 hex-digit font -------------------------------------------------
    type glyph_t is array (0 to 7) of std_logic_vector(7 downto 0);
    type font_t  is array (0 to 15) of glyph_t;
    constant FONT : font_t := (
        (x"3C", x"66", x"6E", x"76", x"66", x"66", x"3C", x"00"),  -- 0
        (x"18", x"38", x"18", x"18", x"18", x"18", x"7E", x"00"),  -- 1
        (x"3C", x"66", x"06", x"0C", x"30", x"60", x"7E", x"00"),  -- 2
        (x"3C", x"66", x"06", x"1C", x"06", x"66", x"3C", x"00"),  -- 3
        (x"0C", x"1C", x"3C", x"6C", x"7E", x"0C", x"0C", x"00"),  -- 4
        (x"7E", x"60", x"7C", x"06", x"06", x"66", x"3C", x"00"),  -- 5
        (x"1C", x"30", x"60", x"7C", x"66", x"66", x"3C", x"00"),  -- 6
        (x"7E", x"06", x"0C", x"18", x"30", x"30", x"30", x"00"),  -- 7
        (x"3C", x"66", x"66", x"3C", x"66", x"66", x"3C", x"00"),  -- 8
        (x"3C", x"66", x"66", x"3E", x"06", x"0C", x"38", x"00"),  -- 9
        (x"18", x"3C", x"66", x"66", x"7E", x"66", x"66", x"00"),  -- A
        (x"7C", x"66", x"66", x"7C", x"66", x"66", x"7C", x"00"),  -- B
        (x"3C", x"66", x"60", x"60", x"60", x"66", x"3C", x"00"),  -- C
        (x"78", x"6C", x"66", x"66", x"66", x"6C", x"78", x"00"),  -- D
        (x"7E", x"60", x"60", x"7C", x"60", x"60", x"7E", x"00"),  -- E
        (x"7E", x"60", x"60", x"7C", x"60", x"60", x"60", x"00")); -- F

    -- y -> (channel, offset in row) lookup, built at elaboration ----------
    type row_rom_t is array (0 to 511) of integer range 0 to 31;
    function make_ch return row_rom_t is
        variable r : row_rom_t := (others => 0);
    begin
        for y in WAVE_Y0 to WAVE_Y1 - 1 loop
            r(y) := (y - WAVE_Y0) / ROW_H;
        end loop;
        return r;
    end function;
    function make_off return row_rom_t is
        variable r : row_rom_t := (others => 0);
    begin
        for y in WAVE_Y0 to WAVE_Y1 - 1 loop
            r(y) := (y - WAVE_Y0) mod ROW_H;
        end loop;
        return r;
    end function;
    constant ROW_CH  : row_rom_t := make_ch;
    constant ROW_OFF : row_rom_t := make_off;

    -- overview bar: 512 px for the whole buffer
    constant OV_X0    : integer := WAVE_X0;
    constant OV_W     : integer := 512;
    constant OV_SHIFT : integer := ADDR_W - 9;   -- samples per overview pixel
    constant OV_STEP  : integer := 2**OV_SHIFT;

    -- position inside the screen / region flags ---------------------------
    type pos_t is record
        x, y    : integer range 0 to 1023;
        active  : std_logic;
        hs, vs  : std_logic;
        r_top   : boolean;     -- status bar rows
        r_wave  : boolean;     -- channel rows
        r_rul   : boolean;     -- ruler rows
        lbl     : boolean;     -- x < WAVE_X0
        inwave  : boolean;     -- x inside trace area
        first   : boolean;     -- x = WAVE_X0
        grid    : boolean;
        ch      : integer range 0 to 15;
        ro      : integer range 0 to 31;
    end record;
    constant POS_INIT : pos_t := (0, 0, '0', '1', '1', false, false, false,
                                  false, false, false, false, 0, 0);

    -- PA
    type sa_t is record
        p       : pos_t;
        off     : integer range 0 to 8191;   -- sample offset of this column
        off_e   : integer range 0 to 8191;   -- off + samples per column
        rd_n    : integer range 1 to 4;
        rd_two  : std_logic;
        sub0    : boolean;
        ox      : integer range 0 to 1023;   -- x - OV_X0
        ov_x    : boolean;                   -- in overview bar columns
        lamp    : boolean;                   -- capture state lamp
        y_ovbar : boolean;
        y_ovcur : boolean;
        y_ovtrg : boolean;
        ro_band : boolean;                   -- ro 5..20
        ro_top  : boolean;                   -- ro 5,6
        ro_bot  : boolean;                   -- ro 19,20
        ro_mid  : boolean;                   -- ro 7..18
        ro_sep  : boolean;
        dash    : boolean;
        lbl_box : boolean;
        gx      : integer range 0 to 7;
        gy      : integer range 0 to 7;
        y_rgrid : boolean;                   -- ruler y < 454
        y_rtick : boolean;                   -- ruler y < 451
        y_rspan : boolean;                   -- ruler 458..465
        y_rtrg  : boolean;                   -- ruler y >= 468
    end record;

    -- PB
    type sb_t is record
        a       : sa_t;
        idx     : integer range 0 to 16383;
        idx_e   : integer range 0 to 16383;
        chc     : rgb_t;
        glyph   : boolean;
        trg_lbl : boolean;
        ov_in   : boolean;
        ov_a    : boolean;
        ov_b    : boolean;
        ov_t    : boolean;
    end record;

    -- PC
    type sc_t is record
        b       : sb_t;
        valid   : boolean;
        hit_a   : boolean;
        hit_b   : boolean;
        hit_t   : boolean;
        span    : boolean;
    end record;

    -- PD / PE : everything the final stage needs
    type sd_t is record
        p       : pos_t;
        base    : rgb_t;
        trace   : boolean;     -- draw waveform on this pixel
        cur_a   : boolean;     -- cursor overlays inside the channel rows
        cur_b   : boolean;
        chc     : rgb_t;
        ro_band : boolean;
        ro_top  : boolean;
        ro_bot  : boolean;
        ro_mid  : boolean;
        bhi     : std_logic;   -- filled in at PE
        blo     : std_logic;
        bfirst  : std_logic;
        blast   : std_logic;
    end record;

    signal sa : sa_t;
    signal sb : sb_t;
    signal sc : sc_t;
    signal sd, se : sd_t;

    signal gcnt : integer range 0 to 49 := 0;

    -- per-frame values, registered so they never sit in a pixel path
    signal view_end : integer range 0 to 16383 := 0;
    signal cur_lo   : idx_t := 0;
    signal cur_hi   : idx_t := 0;
    signal ov_ca    : integer range 0 to 1023 := 0;
    signal ov_cb    : integer range 0 to 1023 := 0;
    signal ov_ct    : integer range 0 to 1023 := 0;
    signal lamp_c   : rgb_t := C_ST_IDL;

    -- read sequencer
    signal rd_base : unsigned(ADDR_W-1 downto 0) := (others => '0');  -- physical sample
    signal rd_n    : integer range 1 to 4 := 1;                        -- pair reads
    signal rd_k    : integer range 0 to 4 := 4;
    signal rd_two  : std_logic := '0';     -- use both samples of each pair
    signal rd_bank : std_logic := '0';
    signal addr_e  : std_logic_vector(ADDR_W-1 downto 0) := (others => '0');
    signal addr_o  : std_logic_vector(ADDR_W-1 downto 0) := (others => '0');

    -- tag of the read in flight: valid, first, use both, start parity
    signal t0_v, t0_f, t0_two, t0_odd : std_logic := '0';
    signal t1_v, t1_f, t1_two, t1_odd : std_logic := '0';

    -- accumulators and latched result
    signal acc_hi, acc_lo, acc_first, acc_last : sample_t := (others => '0');
    signal res_hi, res_lo, res_first, res_last : sample_t := (others => '0');
    signal prev_last : std_logic := '0';

    signal rgb_r : rgb_t := (others => '0');
    signal hs_r  : std_logic := '1';
    signal vs_r  : std_logic := '1';

begin

    ---------------------------------------------------------------------------
    -- Per-frame helpers (every clock)
    ---------------------------------------------------------------------------
    process(clk)
    begin
        if rising_edge(clk) then
            view_end <= view_start + visible_samples(zoom);
            if cur_a < cur_b then
                cur_lo <= cur_a; cur_hi <= cur_b;
            else
                cur_lo <= cur_b; cur_hi <= cur_a;
            end if;
            ov_ca <= cur_a / OV_STEP;
            ov_cb <= cur_b / OV_STEP;
            ov_ct <= disp_trig / OV_STEP;
            case cap_state is
                when ST_WAIT => lamp_c <= C_ST_WT;
                when ST_PRE | ST_POST => lamp_c <= C_ST_CAP;
                when others =>
                    if continuous = '1' and running = '0' then
                        lamp_c <= C_ST_STP;
                    else
                        lamp_c <= C_ST_IDL;
                    end if;
            end case;
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- Read sequencer + accumulation (runs every clock)
    ---------------------------------------------------------------------------
    process(clk)
        variable p     : unsigned(ADDR_W-1 downto 0);
        variable wlo   : unsigned(ADDR_W-2 downto 0);
        variable whi   : unsigned(ADDR_W-2 downto 0);
        variable s0, s1v : sample_t;
        variable hi, lo, lst : sample_t;
    begin
        if rising_edge(clk) then
            -- issue read k: samples p and p+1 (p = rd_base + 2k)
            t0_v <= '0';
            if rd_k < rd_n then
                p   := rd_base + to_unsigned(2 * rd_k, ADDR_W);
                wlo := p(ADDR_W-1 downto 1);
                whi := wlo + 1;
                if p(0) = '0' then
                    addr_e <= rd_bank & std_logic_vector(wlo);
                    addr_o <= rd_bank & std_logic_vector(wlo);
                else
                    addr_o <= rd_bank & std_logic_vector(wlo);
                    addr_e <= rd_bank & std_logic_vector(whi);
                end if;
                t0_v   <= '1';
                if rd_k = 0 then t0_f <= '1'; else t0_f <= '0'; end if;
                t0_two <= rd_two;
                t0_odd <= p(0);
                rd_k   <= rd_k + 1;
            end if;

            -- tag follows the RAM's one-clock read latency
            t1_v <= t0_v; t1_f <= t0_f; t1_two <= t0_two; t1_odd <= t0_odd;

            -- accumulate
            if t1_v = '1' then
                if t1_odd = '0' then s0 := ram_q_e; s1v := ram_q_o;
                else                 s0 := ram_q_o; s1v := ram_q_e; end if;

                if t1_f = '1' then
                    -- previous column complete: latch it
                    res_hi    <= acc_hi;
                    res_lo    <= acc_lo;
                    res_first <= acc_first;
                    res_last  <= acc_last;
                    hi := s0;
                    lo := not s0;
                    acc_first <= s0;
                else
                    hi := acc_hi or s0;
                    lo := acc_lo or not s0;
                end if;
                lst := s0;
                if t1_two = '1' then
                    hi  := hi or s1v;
                    lo  := lo or not s1v;
                    lst := s1v;
                end if;
                acc_hi   <= hi;
                acc_lo   <= lo;
                acc_last <= lst;
            end if;

            -- PC programs a new column (overrides the counter update above)
            if pix_en = '1' then
                rd_k <= 0;
            end if;
        end if;
    end process;

    ram_addr_e <= addr_e;
    ram_addr_o <= addr_o;

    ---------------------------------------------------------------------------
    -- Pixel pipeline (advances on pix_en)
    ---------------------------------------------------------------------------
    process(clk)
        variable a     : sa_t;
        variable b     : sb_t;
        variable c     : sc_t;
        variable d     : sd_t;
        variable rel   : integer range 0 to 1023;
        variable span  : integer range 1 to 8;
        variable ro    : integer range 0 to 31;
        variable os    : integer range 0 to 8191;
        variable paddr : unsigned(14 downto 0);
        variable col   : rgb_t;
        variable bprev : std_logic;
        variable grow  : std_logic_vector(7 downto 0);
    begin
        if rising_edge(clk) then
            if pix_en = '1' then
                ----------------------------------------------------------------
                -- PA : decode x / y
                ----------------------------------------------------------------
                a.p.x      := h;
                a.p.y      := v;
                a.p.active := active;
                a.p.hs     := hsync_in;
                a.p.vs     := vsync_in;
                a.p.r_top  := v < WAVE_Y0;
                a.p.r_wave := v >= WAVE_Y0 and v < WAVE_Y1;
                a.p.r_rul  := v >= WAVE_Y1;
                a.p.lbl    := h < WAVE_X0;
                a.p.inwave := h >= WAVE_X0 and h < WAVE_X0 + WAVE_W;
                a.p.first  := h = WAVE_X0;
                a.p.grid   := a.p.inwave and (h = WAVE_X0 or gcnt = 49);
                if h = WAVE_X0 or gcnt = 49 then
                    gcnt <= 0;
                else
                    gcnt <= gcnt + 1;
                end if;
                if v < 512 then
                    a.p.ch := ROW_CH(v);
                    ro     := ROW_OFF(v);
                else
                    a.p.ch := 0;
                    ro     := 0;
                end if;
                a.p.ro := ro;

                if h >= WAVE_X0 then rel := h - WAVE_X0; else rel := 0; end if;
                case zoom is
                    when -3     => a.off := rel * 8;  span := 8; a.sub0 := true;
                    when -2     => a.off := rel * 4;  span := 4; a.sub0 := true;
                    when -1     => a.off := rel * 2;  span := 2; a.sub0 := true;
                    when 0      => a.off := rel;      span := 1; a.sub0 := true;
                    when 1      => a.off := rel / 2;  span := 1; a.sub0 := (rel mod 2) = 0;
                    when 2      => a.off := rel / 4;  span := 1; a.sub0 := (rel mod 4) = 0;
                    when 3      => a.off := rel / 8;  span := 1; a.sub0 := (rel mod 8) = 0;
                    when others => a.off := rel / 16; span := 1; a.sub0 := (rel mod 16) = 0;
                end case;
                a.off_e := a.off + span;
                case span is
                    when 8      => a.rd_n := 4; a.rd_two := '1';
                    when 4      => a.rd_n := 2; a.rd_two := '1';
                    when 2      => a.rd_n := 1; a.rd_two := '1';
                    when others => a.rd_n := 1; a.rd_two := '0';
                end case;

                if h >= OV_X0 then a.ox := h - OV_X0; else a.ox := 0; end if;
                a.ov_x    := h >= OV_X0 and h < OV_X0 + OV_W;
                a.lamp    := h >= 576 and h < 632 and v >= 8 and v < 24;
                a.y_ovbar := v >= 10 and v < 22;
                a.y_ovcur := v >= 6 and v < 26;
                a.y_ovtrg := (v >= 3 and v < 9) or (v >= 23 and v < 29);

                a.ro_band := ro >= 5 and ro <= 20;
                a.ro_top  := ro = 5 or ro = 6;
                a.ro_bot  := ro = 19 or ro = 20;
                a.ro_mid  := ro >= 7 and ro <= 18;
                a.ro_sep  := ro = ROW_H - 1;
                a.dash    := (v mod 4) < 2;
                a.lbl_box := h >= 12 and h < 28 and ro >= 5 and ro < 21;
                if h >= 12 and h < 28 then a.gx := (h - 12) / 2; else a.gx := 0; end if;
                if ro >= 5 and ro < 21 then a.gy := (ro - 5) / 2; else a.gy := 0; end if;

                a.y_rgrid := v < 454;
                a.y_rtick := v < 451;
                a.y_rspan := v >= 458 and v < 466;
                a.y_rtrg  := v >= 468;

                ----------------------------------------------------------------
                -- PB : sample index, palette, font, overview bar
                ----------------------------------------------------------------
                b.a     := sa;
                b.idx   := view_start + sa.off;
                b.idx_e := view_start + sa.off_e;
                b.chc   := PAL(sa.p.ch mod 8);
                grow    := FONT(sa.p.ch)(sa.gy);
                b.glyph := sa.lbl_box and grow(7 - sa.gx) = '1';
                b.trg_lbl := sa.p.ch = to_integer(trig_ch);
                os      := sa.ox * OV_STEP;
                b.ov_in := os + OV_STEP > view_start and os < view_end;
                b.ov_a  := sa.ox = ov_ca;
                b.ov_b  := sa.ox = ov_cb;
                b.ov_t  := sa.ox = ov_ct;

                ----------------------------------------------------------------
                -- PC : cursor / trigger hits, start the RAM reads
                ----------------------------------------------------------------
                c.b     := sb;
                c.valid := sb.a.p.inwave and sb.idx < DEPTH;
                c.hit_a := sb.a.p.inwave and sb.a.sub0 and cur_a >= sb.idx and cur_a < sb.idx_e;
                c.hit_b := sb.a.p.inwave and sb.a.sub0 and cur_b >= sb.idx and cur_b < sb.idx_e;
                c.hit_t := sb.a.p.inwave and sb.a.sub0 and disp_trig >= sb.idx and disp_trig < sb.idx_e;
                c.span  := sb.a.p.inwave and sb.idx_e > cur_lo and sb.idx <= cur_hi;

                paddr   := to_unsigned(disp_start + sb.idx, 15);
                rd_base <= paddr(ADDR_W-1 downto 0);
                rd_bank <= disp_bank;
                rd_n    <= sb.a.rd_n;
                rd_two  <= sb.a.rd_two;

                ----------------------------------------------------------------
                -- PD : base colour (no waveform yet)
                ----------------------------------------------------------------
                d.p       := sc.b.a.p;
                d.chc     := sc.b.chc;
                d.ro_band := sc.b.a.ro_band;
                d.ro_top  := sc.b.a.ro_top;
                d.ro_bot  := sc.b.a.ro_bot;
                d.ro_mid  := sc.b.a.ro_mid;
                d.trace   := false;
                d.cur_a   := false;
                d.cur_b   := false;
                d.bhi := '0'; d.blo := '0'; d.bfirst := '0'; d.blast := '0';

                col := C_BLACK;
                if sc.b.a.p.active = '1' then
                    if sc.b.a.p.r_top then
                        ------------------------------------------ status bar
                        col := C_TOPBG;
                        if sc.b.a.ov_x then
                            if sc.b.a.y_ovbar then
                                if sc.b.ov_in then col := C_OV_IN; else col := C_OV_OUT; end if;
                            end if;
                            if sc.b.a.y_ovcur then
                                if sc.b.ov_b then col := C_CUR_B; end if;
                                if sc.b.ov_a then col := C_CUR_A; end if;
                            end if;
                            if sc.b.a.y_ovtrg and sc.b.ov_t then col := C_TRIG; end if;
                        elsif sc.b.a.lamp then
                            col := lamp_c;
                        end if;

                    elsif sc.b.a.p.r_wave then
                        ------------------------------------------ channels
                        if sc.b.a.p.lbl then
                            if sc.b.trg_lbl then col := C_LBLTRG; else col := C_LBLBG; end if;
                            if sc.b.glyph then col := sc.b.chc; end if;
                        else
                            col := C_BG;
                            if sc.b.a.p.grid then col := C_GRID; end if;
                            if sc.b.a.ro_sep then col := C_SEP; end if;
                            if sc.hit_t and sc.b.a.dash then col := C_TRIG; end if;
                            d.trace := sc.valid;
                            d.cur_a := sc.hit_a;
                            d.cur_b := sc.hit_b;
                        end if;

                    else
                        ------------------------------------------ ruler
                        if not sc.b.a.p.lbl then
                            if sc.b.a.y_rgrid and sc.b.a.p.grid then col := C_RULER; end if;
                            if sc.b.a.y_rtick and sc.b.a.sub0 and zoom >= 2 and sc.valid then
                                col := C_GRID;
                            end if;
                            if sc.b.a.y_rspan and sc.span and sc.valid then col := C_SPAN; end if;
                            if sc.hit_t and sc.b.a.y_rtrg then col := C_TRIG; end if;
                            if not sc.b.a.y_rtrg then
                                if sc.hit_b then col := C_CUR_B; end if;
                                if sc.hit_a then col := C_CUR_A; end if;
                            end if;
                        end if;
                    end if;
                end if;
                d.base := col;

                ----------------------------------------------------------------
                -- PE : this row's channel out of the read result
                --      (res_* was latched 1 clock before this pix_en)
                ----------------------------------------------------------------
                se        <= sd;
                se.bhi    <= res_hi(sd.p.ch);
                se.blo    <= res_lo(sd.p.ch);
                se.bfirst <= res_first(sd.p.ch);
                se.blast  <= res_last(sd.p.ch);

                ----------------------------------------------------------------
                -- PF : final colour
                ----------------------------------------------------------------
                col := se.base;
                if se.trace then
                    if se.p.first then bprev := se.bfirst; else bprev := prev_last; end if;
                    if se.bhi = '1' and se.blo = '1' then
                        -- toggled inside this column: busy band
                        if se.ro_band then col := dim2(se.chc); end if;
                        if se.ro_top or se.ro_bot then col := se.chc; end if;
                    else
                        if se.bhi = '1' and se.ro_mid then col := dim4(se.chc); end if;
                        if (se.bhi = '1' and se.ro_top) or (se.bhi = '0' and se.ro_bot) then
                            col := se.chc;
                        end if;
                        if se.bfirst /= bprev and se.ro_band then col := se.chc; end if;
                    end if;
                end if;
                if se.cur_b then col := C_CUR_B; end if;
                if se.cur_a then col := C_CUR_A; end if;

                prev_last <= se.blast;
                rgb_r     <= col;
                hs_r      <= se.p.hs;
                vs_r      <= se.p.vs;

                -- advance
                sa <= a;
                sb <= b;
                sc <= c;
                sd <= d;
            end if;
        end if;
    end process;

    vga_r  <= rgb_r(11 downto 8);
    vga_g  <= rgb_r(7 downto 4);
    vga_b  <= rgb_r(3 downto 0);
    vga_hs <= hs_r;
    vga_vs <= vs_r;

end architecture;
