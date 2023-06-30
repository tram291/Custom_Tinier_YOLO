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

-- VHDL created from gemm_nn9W_B5_branch
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

entity gemm_nn9W_B5_branch is
    port (
        in_c0_exit428_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit428_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit428_2 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit428_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit428_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit428_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit428_6 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit428_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit428_8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit428_9 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit428_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit428_11 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit456_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit456_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit456_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit456_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit456_4 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe5433 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe7435 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe8436 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe1457 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe2458 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe3459 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi258 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi263 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi268 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit428_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit428_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit428_2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit428_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit428_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit428_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit428_6 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit428_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit428_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit428_9 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit428_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit428_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit456_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit456_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit456_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit456_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit456_4 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe7435 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe8436 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe1457 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe2458 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe3459 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi258 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi263 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi268 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end gemm_nn9W_B5_branch;

architecture normal of gemm_nn9W_B5_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit428_reg_0_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit428_reg_1_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c0_exit428_reg_2_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exit428_reg_3_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit428_reg_4_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit428_reg_5_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit428_reg_6_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exit428_reg_7_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit428_reg_8_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit428_reg_9_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exit428_reg_10_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exit428_reg_11_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exit456_reg_0_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exit456_reg_1_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exit456_reg_2_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exit456_reg_3_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exit456_reg_4_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal c0_exe5433_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe7435_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe8436_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe1457_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe2458_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe3459_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi258_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi263_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi268_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_in_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_valid_or_not_stall_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_0_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_1_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_0_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_out_1_and_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_in_1(LOGICAL,88)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- c0_exe5433_cmp(LOGICAL,76)
    c0_exe5433_cmp_q <= not (in_c0_exe5433);

    -- valid_out_1_and(LOGICAL,96)
    valid_out_1_and_q <= in_valid_in and c0_exe5433_cmp_q;

    -- valid_1_reg(REG,94)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,90)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,92)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,87)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,95)
    valid_out_0_and_q <= in_valid_in and in_c0_exe5433;

    -- valid_0_reg(REG,93)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,89)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,91)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- gemm_nn9W_B5_branch_enable(LOGICAL,82)
    gemm_nn9W_B5_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- c0_exit428_reg_0_x(REG,2)
    c0_exit428_reg_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit428_reg_0_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c0_exit428_reg_0_x_q <= in_c0_exit428_0;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit428_0(GPOUT,48)
    out_c0_exit428_0 <= c0_exit428_reg_0_x_q;

    -- c0_exit428_reg_1_x(REG,3)
    c0_exit428_reg_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit428_reg_1_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c0_exit428_reg_1_x_q <= in_c0_exit428_1;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit428_1(GPOUT,49)
    out_c0_exit428_1 <= c0_exit428_reg_1_x_q;

    -- c0_exit428_reg_2_x(REG,4)
    c0_exit428_reg_2_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit428_reg_2_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c0_exit428_reg_2_x_q <= in_c0_exit428_2;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit428_2(GPOUT,50)
    out_c0_exit428_2 <= c0_exit428_reg_2_x_q;

    -- c0_exit428_reg_3_x(REG,5)
    c0_exit428_reg_3_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit428_reg_3_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c0_exit428_reg_3_x_q <= in_c0_exit428_3;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit428_3(GPOUT,51)
    out_c0_exit428_3 <= c0_exit428_reg_3_x_q;

    -- c0_exit428_reg_4_x(REG,6)
    c0_exit428_reg_4_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit428_reg_4_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c0_exit428_reg_4_x_q <= in_c0_exit428_4;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit428_4(GPOUT,52)
    out_c0_exit428_4 <= c0_exit428_reg_4_x_q;

    -- c0_exit428_reg_5_x(REG,7)
    c0_exit428_reg_5_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit428_reg_5_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c0_exit428_reg_5_x_q <= in_c0_exit428_5;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit428_5(GPOUT,53)
    out_c0_exit428_5 <= c0_exit428_reg_5_x_q;

    -- c0_exit428_reg_6_x(REG,8)
    c0_exit428_reg_6_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit428_reg_6_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c0_exit428_reg_6_x_q <= in_c0_exit428_6;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit428_6(GPOUT,54)
    out_c0_exit428_6 <= c0_exit428_reg_6_x_q;

    -- c0_exit428_reg_7_x(REG,9)
    c0_exit428_reg_7_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit428_reg_7_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c0_exit428_reg_7_x_q <= in_c0_exit428_7;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit428_7(GPOUT,55)
    out_c0_exit428_7 <= c0_exit428_reg_7_x_q;

    -- c0_exit428_reg_8_x(REG,10)
    c0_exit428_reg_8_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit428_reg_8_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c0_exit428_reg_8_x_q <= in_c0_exit428_8;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit428_8(GPOUT,56)
    out_c0_exit428_8 <= c0_exit428_reg_8_x_q;

    -- c0_exit428_reg_9_x(REG,11)
    c0_exit428_reg_9_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit428_reg_9_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c0_exit428_reg_9_x_q <= in_c0_exit428_9;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit428_9(GPOUT,57)
    out_c0_exit428_9 <= c0_exit428_reg_9_x_q;

    -- c0_exit428_reg_10_x(REG,12)
    c0_exit428_reg_10_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit428_reg_10_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c0_exit428_reg_10_x_q <= in_c0_exit428_10;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit428_10(GPOUT,58)
    out_c0_exit428_10 <= c0_exit428_reg_10_x_q;

    -- c0_exit428_reg_11_x(REG,13)
    c0_exit428_reg_11_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exit428_reg_11_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c0_exit428_reg_11_x_q <= in_c0_exit428_11;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exit428_11(GPOUT,59)
    out_c0_exit428_11 <= c0_exit428_reg_11_x_q;

    -- c1_exit456_reg_0_x(REG,14)
    c1_exit456_reg_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit456_reg_0_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c1_exit456_reg_0_x_q <= in_c1_exit456_0;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit456_0(GPOUT,60)
    out_c1_exit456_0 <= c1_exit456_reg_0_x_q;

    -- c1_exit456_reg_1_x(REG,15)
    c1_exit456_reg_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit456_reg_1_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c1_exit456_reg_1_x_q <= in_c1_exit456_1;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit456_1(GPOUT,61)
    out_c1_exit456_1 <= c1_exit456_reg_1_x_q;

    -- c1_exit456_reg_2_x(REG,16)
    c1_exit456_reg_2_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit456_reg_2_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c1_exit456_reg_2_x_q <= in_c1_exit456_2;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit456_2(GPOUT,62)
    out_c1_exit456_2 <= c1_exit456_reg_2_x_q;

    -- c1_exit456_reg_3_x(REG,17)
    c1_exit456_reg_3_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit456_reg_3_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c1_exit456_reg_3_x_q <= in_c1_exit456_3;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit456_3(GPOUT,63)
    out_c1_exit456_3 <= c1_exit456_reg_3_x_q;

    -- c1_exit456_reg_4_x(REG,18)
    c1_exit456_reg_4_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exit456_reg_4_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c1_exit456_reg_4_x_q <= in_c1_exit456_4;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exit456_4(GPOUT,64)
    out_c1_exit456_4 <= c1_exit456_reg_4_x_q;

    -- c0_exe7435_reg(REG,77)
    c0_exe7435_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe7435_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c0_exe7435_reg_q <= in_c0_exe7435;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe7435(GPOUT,65)
    out_c0_exe7435 <= c0_exe7435_reg_q;

    -- c0_exe8436_reg(REG,78)
    c0_exe8436_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe8436_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c0_exe8436_reg_q <= in_c0_exe8436;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe8436(GPOUT,66)
    out_c0_exe8436 <= c0_exe8436_reg_q;

    -- c1_exe1457_reg(REG,79)
    c1_exe1457_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe1457_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c1_exe1457_reg_q <= in_c1_exe1457;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe1457(GPOUT,67)
    out_c1_exe1457 <= c1_exe1457_reg_q;

    -- c1_exe2458_reg(REG,80)
    c1_exe2458_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe2458_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c1_exe2458_reg_q <= in_c1_exe2458;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe2458(GPOUT,68)
    out_c1_exe2458 <= c1_exe2458_reg_q;

    -- c1_exe3459_reg(REG,81)
    c1_exe3459_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe3459_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                c1_exe3459_reg_q <= in_c1_exe3459;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe3459(GPOUT,69)
    out_c1_exe3459 <= c1_exe3459_reg_q;

    -- memdep_phi258_reg(REG,84)
    memdep_phi258_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            memdep_phi258_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                memdep_phi258_reg_q <= in_memdep_phi258;
            END IF;
        END IF;
    END PROCESS;

    -- out_memdep_phi258(GPOUT,70)
    out_memdep_phi258 <= memdep_phi258_reg_q;

    -- memdep_phi263_reg(REG,85)
    memdep_phi263_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            memdep_phi263_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                memdep_phi263_reg_q <= in_memdep_phi263;
            END IF;
        END IF;
    END PROCESS;

    -- out_memdep_phi263(GPOUT,71)
    out_memdep_phi263 <= memdep_phi263_reg_q;

    -- memdep_phi268_reg(REG,86)
    memdep_phi268_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            memdep_phi268_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B5_branch_enable_q = "1") THEN
                memdep_phi268_reg_q <= in_memdep_phi268;
            END IF;
        END IF;
    END PROCESS;

    -- out_memdep_phi268(GPOUT,72)
    out_memdep_phi268 <= memdep_phi268_reg_q;

    -- gemm_nn9W_B5_branch_enable_not(LOGICAL,83)
    gemm_nn9W_B5_branch_enable_not_q <= not (gemm_nn9W_B5_branch_enable_q);

    -- out_stall_out(GPOUT,73)
    out_stall_out <= gemm_nn9W_B5_branch_enable_not_q;

    -- out_valid_out_0(GPOUT,74)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,75)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
