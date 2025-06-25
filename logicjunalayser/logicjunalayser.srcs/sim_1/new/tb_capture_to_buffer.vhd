library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_capture_to_buffer is
end entity;

architecture Behavioral of tb_capture_to_buffer is

    constant N_DIGITAL_CHANNELS : integer := 80;
    constant N_ANALOG_CHANNELS  : integer := 4;
    constant ADC_WIDTH          : integer := 10;
    constant DEPTH              : integer := 65536;

    -- Signals to connect to DUT
    signal clk         : std_logic := '0';
    signal rst         : std_logic := '0';
    signal digital_in  : std_logic_vector(N_DIGITAL_CHANNELS-1 downto 0) := (others => '0');
    signal analog_in   : std_logic_vector(N_ANALOG_CHANNELS*ADC_WIDTH-1 downto 0) := (others => '0');
    signal trig_found  : std_logic := '0';
    signal trig_addr   : integer range 0 to DEPTH-1 := 0;
    signal buffer_addr : integer range 0 to DEPTH-1;
    signal digital_samples_out : std_logic_vector(N_DIGITAL_CHANNELS-1 downto 0);
    signal analog_samples_out  : std_logic_vector(N_ANALOG_CHANNELS*ADC_WIDTH-1 downto 0);
    signal capture_en  : std_logic := '1';

begin

    DUT: entity work.capture_to_buffer
        generic map(
            N_DIGITAL_CHANNELS => N_DIGITAL_CHANNELS,
            N_ANALOG_CHANNELS  => N_ANALOG_CHANNELS,
            ADC_WIDTH          => ADC_WIDTH,
            DEPTH              => DEPTH
        )
        port map(
            clk         => clk,
            rst         => rst,
            digital_in  => digital_in,
            analog_in   => analog_in,
            trig_found  => trig_found,
            trig_addr   => trig_addr,
            buffer_addr => buffer_addr,
            digital_samples_out => digital_samples_out,
            analog_samples_out  => analog_samples_out,
            capture_en  => capture_en
        );

    clk_process: process
    begin
        loop
            clk <= '0'; wait for 5 ns;
            clk <= '1'; wait for 5 ns;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
        variable dig_sample : std_logic_vector(N_DIGITAL_CHANNELS-1 downto 0);
        variable ana_sample : std_logic_vector(N_ANALOG_CHANNELS*ADC_WIDTH-1 downto 0);
    begin
        -- Initial reset
        rst <= '1';
        wait for 20 ns;
        rst <= '0';
        wait for 20 ns;

        -- Wait for a bit before triggering
        wait for 20 ns;

        -- Trigger the capture
        trig_found <= '1';
        wait for 10 ns;
        trig_found <= '0';

        -- Provide sample data for a reasonable number of clock cycles
        for i in 0 to 20 loop  -- Use 20 to keep simulation manageable
            -- Digital: just binary count
            dig_sample := std_logic_vector(to_unsigned(i, N_DIGITAL_CHANNELS));
            digital_in <= dig_sample;

            -- Analog: make some changing pattern
            for ach in 0 to N_ANALOG_CHANNELS-1 loop
                ana_sample((ach+1)*ADC_WIDTH-1 downto ach*ADC_WIDTH) := std_logic_vector(to_unsigned(i*10+ach, ADC_WIDTH));
            end loop;
            analog_in <= ana_sample;

            wait for 10 ns; -- one clock cycle
        end loop;

        -- Wait to let capture stop
        wait for 100 ns;

        wait;
    end process;

end Behavioral;