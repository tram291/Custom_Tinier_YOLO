-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.1 (Release Build #625)
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from bb_gemm_nn9W_B3_sr_0
-- VHDL created on Wed Jun 28 16:29:45 2023


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity bb_gemm_nn9W_B3_sr_0 is
    port (
        in_i_data_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_data_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_data_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_5 : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_data_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_data_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_data_8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_data_9 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_data_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_data_11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_data_12 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_data_13 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_data_14 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_data_15 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_data_16 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_data_17 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_data_18 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_data_19 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_data_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_data_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_data_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_5 : out std_logic_vector(63 downto 0);  -- ufix64
        out_o_data_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_data_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_data_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_data_9 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_data_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_data_11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_data_12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_data_13 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_data_14 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_data_15 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_data_16 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_data_17 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_data_18 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_data_19 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nn9W_B3_sr_0;

architecture normal of bb_gemm_nn9W_B3_sr_0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_0_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_0_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_1_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_1_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_2_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_2_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_3_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_3_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_4_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_4_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_5_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_5_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal data_mux_6_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_6_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_7_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_7_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_8_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_8_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_9_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_9_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_10_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_10_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_11_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_11_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal data_mux_12_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_12_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_13_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_13_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_14_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_14_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_15_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_15_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_16_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_16_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_17_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_17_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_18_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_18_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_19_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal data_mux_19_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sr_0_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sr_1_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sr_2_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_3_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_4_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_5_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal sr_6_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sr_7_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sr_8_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sr_9_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sr_10_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sr_11_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal sr_12_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sr_13_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sr_14_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sr_15_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sr_16_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sr_17_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sr_18_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sr_19_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal combined_valid_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_sr_valid_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sr_valid_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_and_valid_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- not_sr_valid(LOGICAL,87)
    not_sr_valid_q <= not (sr_valid_q);

    -- sr_0_x(REG,66)
    sr_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_0_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_0_x_q <= in_i_data_0;
            END IF;
        END IF;
    END PROCESS;

    -- combined_valid(LOGICAL,86)
    combined_valid_q <= in_i_valid or sr_valid_q;

    -- stall_and_valid(LOGICAL,89)
    stall_and_valid_q <= in_i_stall and combined_valid_q;

    -- sr_valid(REG,88)
    sr_valid_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_valid_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            sr_valid_q <= stall_and_valid_q;
        END IF;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- data_mux_0_x(MUX,2)
    data_mux_0_x_s <= sr_valid_q;
    data_mux_0_x_combproc: PROCESS (data_mux_0_x_s, in_i_data_0, sr_0_x_q)
    BEGIN
        CASE (data_mux_0_x_s) IS
            WHEN "0" => data_mux_0_x_q <= in_i_data_0;
            WHEN "1" => data_mux_0_x_q <= sr_0_x_q;
            WHEN OTHERS => data_mux_0_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_0(GPOUT,44)
    out_o_data_0 <= data_mux_0_x_q;

    -- sr_1_x(REG,67)
    sr_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_1_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_1_x_q <= in_i_data_1;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_1_x(MUX,3)
    data_mux_1_x_s <= sr_valid_q;
    data_mux_1_x_combproc: PROCESS (data_mux_1_x_s, in_i_data_1, sr_1_x_q)
    BEGIN
        CASE (data_mux_1_x_s) IS
            WHEN "0" => data_mux_1_x_q <= in_i_data_1;
            WHEN "1" => data_mux_1_x_q <= sr_1_x_q;
            WHEN OTHERS => data_mux_1_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_1(GPOUT,45)
    out_o_data_1 <= data_mux_1_x_q;

    -- sr_2_x(REG,68)
    sr_2_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_2_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_2_x_q <= in_i_data_2;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_2_x(MUX,4)
    data_mux_2_x_s <= sr_valid_q;
    data_mux_2_x_combproc: PROCESS (data_mux_2_x_s, in_i_data_2, sr_2_x_q)
    BEGIN
        CASE (data_mux_2_x_s) IS
            WHEN "0" => data_mux_2_x_q <= in_i_data_2;
            WHEN "1" => data_mux_2_x_q <= sr_2_x_q;
            WHEN OTHERS => data_mux_2_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_2(GPOUT,46)
    out_o_data_2 <= data_mux_2_x_q;

    -- sr_3_x(REG,69)
    sr_3_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_3_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_3_x_q <= in_i_data_3;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_3_x(MUX,5)
    data_mux_3_x_s <= sr_valid_q;
    data_mux_3_x_combproc: PROCESS (data_mux_3_x_s, in_i_data_3, sr_3_x_q)
    BEGIN
        CASE (data_mux_3_x_s) IS
            WHEN "0" => data_mux_3_x_q <= in_i_data_3;
            WHEN "1" => data_mux_3_x_q <= sr_3_x_q;
            WHEN OTHERS => data_mux_3_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_3(GPOUT,47)
    out_o_data_3 <= data_mux_3_x_q;

    -- sr_4_x(REG,70)
    sr_4_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_4_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_4_x_q <= in_i_data_4;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_4_x(MUX,6)
    data_mux_4_x_s <= sr_valid_q;
    data_mux_4_x_combproc: PROCESS (data_mux_4_x_s, in_i_data_4, sr_4_x_q)
    BEGIN
        CASE (data_mux_4_x_s) IS
            WHEN "0" => data_mux_4_x_q <= in_i_data_4;
            WHEN "1" => data_mux_4_x_q <= sr_4_x_q;
            WHEN OTHERS => data_mux_4_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_4(GPOUT,48)
    out_o_data_4 <= data_mux_4_x_q;

    -- sr_5_x(REG,71)
    sr_5_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_5_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_5_x_q <= in_i_data_5;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_5_x(MUX,7)
    data_mux_5_x_s <= sr_valid_q;
    data_mux_5_x_combproc: PROCESS (data_mux_5_x_s, in_i_data_5, sr_5_x_q)
    BEGIN
        CASE (data_mux_5_x_s) IS
            WHEN "0" => data_mux_5_x_q <= in_i_data_5;
            WHEN "1" => data_mux_5_x_q <= sr_5_x_q;
            WHEN OTHERS => data_mux_5_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_5(GPOUT,49)
    out_o_data_5 <= data_mux_5_x_q;

    -- sr_6_x(REG,72)
    sr_6_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_6_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_6_x_q <= in_i_data_6;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_6_x(MUX,8)
    data_mux_6_x_s <= sr_valid_q;
    data_mux_6_x_combproc: PROCESS (data_mux_6_x_s, in_i_data_6, sr_6_x_q)
    BEGIN
        CASE (data_mux_6_x_s) IS
            WHEN "0" => data_mux_6_x_q <= in_i_data_6;
            WHEN "1" => data_mux_6_x_q <= sr_6_x_q;
            WHEN OTHERS => data_mux_6_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_6(GPOUT,50)
    out_o_data_6 <= data_mux_6_x_q;

    -- sr_7_x(REG,73)
    sr_7_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_7_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_7_x_q <= in_i_data_7;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_7_x(MUX,9)
    data_mux_7_x_s <= sr_valid_q;
    data_mux_7_x_combproc: PROCESS (data_mux_7_x_s, in_i_data_7, sr_7_x_q)
    BEGIN
        CASE (data_mux_7_x_s) IS
            WHEN "0" => data_mux_7_x_q <= in_i_data_7;
            WHEN "1" => data_mux_7_x_q <= sr_7_x_q;
            WHEN OTHERS => data_mux_7_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_7(GPOUT,51)
    out_o_data_7 <= data_mux_7_x_q;

    -- sr_8_x(REG,74)
    sr_8_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_8_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_8_x_q <= in_i_data_8;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_8_x(MUX,10)
    data_mux_8_x_s <= sr_valid_q;
    data_mux_8_x_combproc: PROCESS (data_mux_8_x_s, in_i_data_8, sr_8_x_q)
    BEGIN
        CASE (data_mux_8_x_s) IS
            WHEN "0" => data_mux_8_x_q <= in_i_data_8;
            WHEN "1" => data_mux_8_x_q <= sr_8_x_q;
            WHEN OTHERS => data_mux_8_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_8(GPOUT,52)
    out_o_data_8 <= data_mux_8_x_q;

    -- sr_9_x(REG,75)
    sr_9_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_9_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_9_x_q <= in_i_data_9;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_9_x(MUX,11)
    data_mux_9_x_s <= sr_valid_q;
    data_mux_9_x_combproc: PROCESS (data_mux_9_x_s, in_i_data_9, sr_9_x_q)
    BEGIN
        CASE (data_mux_9_x_s) IS
            WHEN "0" => data_mux_9_x_q <= in_i_data_9;
            WHEN "1" => data_mux_9_x_q <= sr_9_x_q;
            WHEN OTHERS => data_mux_9_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_9(GPOUT,53)
    out_o_data_9 <= data_mux_9_x_q;

    -- sr_10_x(REG,76)
    sr_10_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_10_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_10_x_q <= in_i_data_10;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_10_x(MUX,12)
    data_mux_10_x_s <= sr_valid_q;
    data_mux_10_x_combproc: PROCESS (data_mux_10_x_s, in_i_data_10, sr_10_x_q)
    BEGIN
        CASE (data_mux_10_x_s) IS
            WHEN "0" => data_mux_10_x_q <= in_i_data_10;
            WHEN "1" => data_mux_10_x_q <= sr_10_x_q;
            WHEN OTHERS => data_mux_10_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_10(GPOUT,54)
    out_o_data_10 <= data_mux_10_x_q;

    -- sr_11_x(REG,77)
    sr_11_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_11_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_11_x_q <= in_i_data_11;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_11_x(MUX,13)
    data_mux_11_x_s <= sr_valid_q;
    data_mux_11_x_combproc: PROCESS (data_mux_11_x_s, in_i_data_11, sr_11_x_q)
    BEGIN
        CASE (data_mux_11_x_s) IS
            WHEN "0" => data_mux_11_x_q <= in_i_data_11;
            WHEN "1" => data_mux_11_x_q <= sr_11_x_q;
            WHEN OTHERS => data_mux_11_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_11(GPOUT,55)
    out_o_data_11 <= data_mux_11_x_q;

    -- sr_12_x(REG,78)
    sr_12_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_12_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_12_x_q <= in_i_data_12;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_12_x(MUX,14)
    data_mux_12_x_s <= sr_valid_q;
    data_mux_12_x_combproc: PROCESS (data_mux_12_x_s, in_i_data_12, sr_12_x_q)
    BEGIN
        CASE (data_mux_12_x_s) IS
            WHEN "0" => data_mux_12_x_q <= in_i_data_12;
            WHEN "1" => data_mux_12_x_q <= sr_12_x_q;
            WHEN OTHERS => data_mux_12_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_12(GPOUT,56)
    out_o_data_12 <= data_mux_12_x_q;

    -- sr_13_x(REG,79)
    sr_13_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_13_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_13_x_q <= in_i_data_13;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_13_x(MUX,15)
    data_mux_13_x_s <= sr_valid_q;
    data_mux_13_x_combproc: PROCESS (data_mux_13_x_s, in_i_data_13, sr_13_x_q)
    BEGIN
        CASE (data_mux_13_x_s) IS
            WHEN "0" => data_mux_13_x_q <= in_i_data_13;
            WHEN "1" => data_mux_13_x_q <= sr_13_x_q;
            WHEN OTHERS => data_mux_13_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_13(GPOUT,57)
    out_o_data_13 <= data_mux_13_x_q;

    -- sr_14_x(REG,80)
    sr_14_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_14_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_14_x_q <= in_i_data_14;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_14_x(MUX,16)
    data_mux_14_x_s <= sr_valid_q;
    data_mux_14_x_combproc: PROCESS (data_mux_14_x_s, in_i_data_14, sr_14_x_q)
    BEGIN
        CASE (data_mux_14_x_s) IS
            WHEN "0" => data_mux_14_x_q <= in_i_data_14;
            WHEN "1" => data_mux_14_x_q <= sr_14_x_q;
            WHEN OTHERS => data_mux_14_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_14(GPOUT,58)
    out_o_data_14 <= data_mux_14_x_q;

    -- sr_15_x(REG,81)
    sr_15_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_15_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_15_x_q <= in_i_data_15;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_15_x(MUX,17)
    data_mux_15_x_s <= sr_valid_q;
    data_mux_15_x_combproc: PROCESS (data_mux_15_x_s, in_i_data_15, sr_15_x_q)
    BEGIN
        CASE (data_mux_15_x_s) IS
            WHEN "0" => data_mux_15_x_q <= in_i_data_15;
            WHEN "1" => data_mux_15_x_q <= sr_15_x_q;
            WHEN OTHERS => data_mux_15_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_15(GPOUT,59)
    out_o_data_15 <= data_mux_15_x_q;

    -- sr_16_x(REG,82)
    sr_16_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_16_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_16_x_q <= in_i_data_16;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_16_x(MUX,18)
    data_mux_16_x_s <= sr_valid_q;
    data_mux_16_x_combproc: PROCESS (data_mux_16_x_s, in_i_data_16, sr_16_x_q)
    BEGIN
        CASE (data_mux_16_x_s) IS
            WHEN "0" => data_mux_16_x_q <= in_i_data_16;
            WHEN "1" => data_mux_16_x_q <= sr_16_x_q;
            WHEN OTHERS => data_mux_16_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_16(GPOUT,60)
    out_o_data_16 <= data_mux_16_x_q;

    -- sr_17_x(REG,83)
    sr_17_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_17_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_17_x_q <= in_i_data_17;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_17_x(MUX,19)
    data_mux_17_x_s <= sr_valid_q;
    data_mux_17_x_combproc: PROCESS (data_mux_17_x_s, in_i_data_17, sr_17_x_q)
    BEGIN
        CASE (data_mux_17_x_s) IS
            WHEN "0" => data_mux_17_x_q <= in_i_data_17;
            WHEN "1" => data_mux_17_x_q <= sr_17_x_q;
            WHEN OTHERS => data_mux_17_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_17(GPOUT,61)
    out_o_data_17 <= data_mux_17_x_q;

    -- sr_18_x(REG,84)
    sr_18_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_18_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_18_x_q <= in_i_data_18;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_18_x(MUX,20)
    data_mux_18_x_s <= sr_valid_q;
    data_mux_18_x_combproc: PROCESS (data_mux_18_x_s, in_i_data_18, sr_18_x_q)
    BEGIN
        CASE (data_mux_18_x_s) IS
            WHEN "0" => data_mux_18_x_q <= in_i_data_18;
            WHEN "1" => data_mux_18_x_q <= sr_18_x_q;
            WHEN OTHERS => data_mux_18_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_18(GPOUT,62)
    out_o_data_18 <= data_mux_18_x_q;

    -- sr_19_x(REG,85)
    sr_19_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            sr_19_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (not_sr_valid_q = "1") THEN
                sr_19_x_q <= in_i_data_19;
            END IF;
        END IF;
    END PROCESS;

    -- data_mux_19_x(MUX,21)
    data_mux_19_x_s <= sr_valid_q;
    data_mux_19_x_combproc: PROCESS (data_mux_19_x_s, in_i_data_19, sr_19_x_q)
    BEGIN
        CASE (data_mux_19_x_s) IS
            WHEN "0" => data_mux_19_x_q <= in_i_data_19;
            WHEN "1" => data_mux_19_x_q <= sr_19_x_q;
            WHEN OTHERS => data_mux_19_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_o_data_19(GPOUT,63)
    out_o_data_19 <= data_mux_19_x_q;

    -- out_o_stall(GPOUT,64)
    out_o_stall <= sr_valid_q;

    -- out_o_valid(GPOUT,65)
    out_o_valid <= combined_valid_q;

END normal;
