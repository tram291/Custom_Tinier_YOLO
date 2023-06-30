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

-- VHDL created from gemm_nn9W_B6_branch
-- VHDL created on Wed Jun 28 16:29:46 2023


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

entity gemm_nn9W_B6_branch is
    port (
        in_c0_exe11439 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe743511 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe843613 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe145716 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe245818 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe345920 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_276 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi2584 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi2636 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi2688 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe743511 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe843613 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe145716 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe245818 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe345920 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_276 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi2584 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi2636 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi2688 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end gemm_nn9W_B6_branch;

architecture normal of gemm_nn9W_B6_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe11439_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe743511_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c0_exe843613_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe145716_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe245818_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c1_exe345920_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_branch_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_branch_enable_not_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_276_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi2584_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi2636_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi2688_reg_q : STD_LOGIC_VECTOR (0 downto 0);
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

    -- not_stall_in_1(LOGICAL,28)
    not_stall_in_1_q <= not (in_stall_in_1);

    -- c0_exe11439_cmp(LOGICAL,2)
    c0_exe11439_cmp_q <= not (in_c0_exe11439);

    -- valid_out_1_and(LOGICAL,48)
    valid_out_1_and_q <= in_valid_in and c0_exe11439_cmp_q;

    -- valid_1_reg(REG,46)
    valid_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_1_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B6_branch_enable_q = "1") THEN
                valid_1_reg_q <= valid_out_1_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_1(LOGICAL,30)
    not_valid_1_q <= not (valid_1_reg_q);

    -- not_valid_or_not_stall_1(LOGICAL,32)
    not_valid_or_not_stall_1_q <= not_valid_1_q or not_stall_in_1_q;

    -- not_stall_in_0(LOGICAL,27)
    not_stall_in_0_q <= not (in_stall_in_0);

    -- valid_out_0_and(LOGICAL,47)
    valid_out_0_and_q <= in_valid_in and in_c0_exe11439;

    -- valid_0_reg(REG,45)
    valid_0_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            valid_0_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B6_branch_enable_q = "1") THEN
                valid_0_reg_q <= valid_out_0_and_q;
            END IF;
        END IF;
    END PROCESS;

    -- not_valid_0(LOGICAL,29)
    not_valid_0_q <= not (valid_0_reg_q);

    -- not_valid_or_not_stall_0(LOGICAL,31)
    not_valid_or_not_stall_0_q <= not_valid_0_q or not_stall_in_0_q;

    -- gemm_nn9W_B6_branch_enable(LOGICAL,8)
    gemm_nn9W_B6_branch_enable_q <= not_valid_or_not_stall_0_q and not_valid_or_not_stall_1_q;

    -- c0_exe743511_reg(REG,3)
    c0_exe743511_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe743511_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B6_branch_enable_q = "1") THEN
                c0_exe743511_reg_q <= in_c0_exe743511;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe743511(GPOUT,33)
    out_c0_exe743511 <= c0_exe743511_reg_q;

    -- c0_exe843613_reg(REG,4)
    c0_exe843613_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c0_exe843613_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B6_branch_enable_q = "1") THEN
                c0_exe843613_reg_q <= in_c0_exe843613;
            END IF;
        END IF;
    END PROCESS;

    -- out_c0_exe843613(GPOUT,34)
    out_c0_exe843613 <= c0_exe843613_reg_q;

    -- c1_exe145716_reg(REG,5)
    c1_exe145716_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe145716_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B6_branch_enable_q = "1") THEN
                c1_exe145716_reg_q <= in_c1_exe145716;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe145716(GPOUT,35)
    out_c1_exe145716 <= c1_exe145716_reg_q;

    -- c1_exe245818_reg(REG,6)
    c1_exe245818_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe245818_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B6_branch_enable_q = "1") THEN
                c1_exe245818_reg_q <= in_c1_exe245818;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe245818(GPOUT,36)
    out_c1_exe245818 <= c1_exe245818_reg_q;

    -- c1_exe345920_reg(REG,7)
    c1_exe345920_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            c1_exe345920_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B6_branch_enable_q = "1") THEN
                c1_exe345920_reg_q <= in_c1_exe345920;
            END IF;
        END IF;
    END PROCESS;

    -- out_c1_exe345920(GPOUT,37)
    out_c1_exe345920 <= c1_exe345920_reg_q;

    -- memdep_276_reg(REG,23)
    memdep_276_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            memdep_276_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B6_branch_enable_q = "1") THEN
                memdep_276_reg_q <= in_memdep_276;
            END IF;
        END IF;
    END PROCESS;

    -- out_memdep_276(GPOUT,38)
    out_memdep_276 <= memdep_276_reg_q;

    -- memdep_phi2584_reg(REG,24)
    memdep_phi2584_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            memdep_phi2584_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B6_branch_enable_q = "1") THEN
                memdep_phi2584_reg_q <= in_memdep_phi2584;
            END IF;
        END IF;
    END PROCESS;

    -- out_memdep_phi2584(GPOUT,39)
    out_memdep_phi2584 <= memdep_phi2584_reg_q;

    -- memdep_phi2636_reg(REG,25)
    memdep_phi2636_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            memdep_phi2636_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B6_branch_enable_q = "1") THEN
                memdep_phi2636_reg_q <= in_memdep_phi2636;
            END IF;
        END IF;
    END PROCESS;

    -- out_memdep_phi2636(GPOUT,40)
    out_memdep_phi2636 <= memdep_phi2636_reg_q;

    -- memdep_phi2688_reg(REG,26)
    memdep_phi2688_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            memdep_phi2688_reg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (gemm_nn9W_B6_branch_enable_q = "1") THEN
                memdep_phi2688_reg_q <= in_memdep_phi2688;
            END IF;
        END IF;
    END PROCESS;

    -- out_memdep_phi2688(GPOUT,41)
    out_memdep_phi2688 <= memdep_phi2688_reg_q;

    -- gemm_nn9W_B6_branch_enable_not(LOGICAL,9)
    gemm_nn9W_B6_branch_enable_not_q <= not (gemm_nn9W_B6_branch_enable_q);

    -- out_stall_out(GPOUT,42)
    out_stall_out <= gemm_nn9W_B6_branch_enable_not_q;

    -- out_valid_out_0(GPOUT,43)
    out_valid_out_0 <= valid_0_reg_q;

    -- out_valid_out_1(GPOUT,44)
    out_valid_out_1 <= valid_1_reg_q;

END normal;
