library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity capture_to_buffer is
    generic (
        N_DIGITAL_CHANNELS : integer := 80;
        N_ANALOG_CHANNELS  : integer := 4;
        ADC_WIDTH          : integer := 10;
        DEPTH : integer := 65536
    );
    port (
        clk         : in  std_logic;
        rst         : in  std_logic;
        digital_in  : in  std_logic_vector(N_DIGITAL_CHANNELS-1 downto 0);
        analog_in   : in  std_logic_vector(N_ANALOG_CHANNELS*ADC_WIDTH-1 downto 0);
        trig_found  : in  std_logic;
        trig_addr   : in  integer range 0 to DEPTH-1;
        buffer_addr : out integer range 0 to DEPTH-1;
        digital_samples_out : out std_logic_vector(N_DIGITAL_CHANNELS-1 downto 0);
        analog_samples_out  : out std_logic_vector(N_ANALOG_CHANNELS*ADC_WIDTH-1 downto 0);
        capture_en  : in  std_logic
    );
end entity;

architecture Behavioral of capture_to_buffer is
    -- These are just RAM arrays to keep all the captured data.
    type digital_ram_type is array (0 to DEPTH-1) of std_logic_vector(N_DIGITAL_CHANNELS-1 downto 0);
    signal digital_buffer : digital_ram_type := (others => (others => '0'));

    type analog_ram_type is array (0 to DEPTH-1) of std_logic_vector(N_ANALOG_CHANNELS*ADC_WIDTH-1 downto 0);
    signal analog_buffer : analog_ram_type := (others => (others => '0'));

    signal write_ptr : integer range 0 to DEPTH-1 := 0;
    signal capturing : std_logic := '0';
begin
    -- This process does all the work for capturing samples.
    process(clk)
    begin
        if rising_edge(clk) then
            -- If we get reset, just stop and go to the beginning.
            if rst = '1' then
                capturing <= '0';
                write_ptr <= 0;
            -- If we see a trigger, start capturing from the beginning.
            elsif trig_found = '1' then
                capturing <= '1';
                write_ptr <= 0;
            -- If we're capturing and allowed to keep going, save the samples.
            elsif capturing = '1' and capture_en = '1' then
                digital_buffer(write_ptr) <= digital_in;   -- Save digital channels
                analog_buffer(write_ptr)  <= analog_in;    -- Save analog channels
                write_ptr <= write_ptr + 1;
                -- If we've filled the buffer, stop capturing.
                if write_ptr = DEPTH-1 then
                    capturing <= '0';
                end if;
            end if;
        end if;
    end process;

    -- Just output whatever is at the current write pointer. (You may want to add more readout logic later!)
    buffer_addr <= write_ptr;
    digital_samples_out <= digital_buffer(write_ptr);
    analog_samples_out  <= analog_buffer(write_ptr);
end Behavioral;