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

-- VHDL created from gemm_nnfW_B4_merge
-- VHDL created on Wed Jun 28 16:29:47 2023


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

entity gemm_nnfW_B4_merge is
    port (
        in_cmp380_RM39_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp380_RM39_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp88_RM37_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp88_RM37_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked32_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked32_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi6_pop1143_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi6_pop1143_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_mul1141_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul1141_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_notexit2933_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_notexit2933_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_sdiv_sh125_RM35_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_sdiv_sh125_RM35_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW3_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW3_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW4_0 : in std_logic_vector(32 downto 0);  -- ufix33
        in_unnamed_gemm_nnfW4_1 : in std_logic_vector(32 downto 0);  -- ufix33
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_cmp380_RM39 : out std_logic_vector(0 downto 0);  -- ufix1
        out_cmp88_RM37 : out std_logic_vector(0 downto 0);  -- ufix1
        out_forked32 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi6_pop1143 : out std_logic_vector(0 downto 0);  -- ufix1
        out_mul1141 : out std_logic_vector(31 downto 0);  -- ufix32
        out_notexit2933 : out std_logic_vector(0 downto 0);  -- ufix1
        out_sdiv_sh125_RM35 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW4 : out std_logic_vector(32 downto 0);  -- ufix33
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end gemm_nnfW_B4_merge;

architecture normal of gemm_nnfW_B4_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp380_RM39_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp380_RM39_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp88_RM37_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp88_RM37_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal forked32_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal forked32_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi6_pop1143_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi6_pop1143_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mul1141_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal mul1141_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal notexit2933_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal notexit2933_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sdiv_sh125_RM35_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal sdiv_sh125_RM35_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_gemm_nnfW3_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_gemm_nnfW3_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_gemm_nnfW4_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_gemm_nnfW4_mux_q : STD_LOGIC_VECTOR (32 downto 0);
    signal valid_or_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- cmp380_RM39_mux(MUX,2)
    cmp380_RM39_mux_s <= in_valid_in_0;
    cmp380_RM39_mux_combproc: PROCESS (cmp380_RM39_mux_s, in_cmp380_RM39_1, in_cmp380_RM39_0)
    BEGIN
        CASE (cmp380_RM39_mux_s) IS
            WHEN "0" => cmp380_RM39_mux_q <= in_cmp380_RM39_1;
            WHEN "1" => cmp380_RM39_mux_q <= in_cmp380_RM39_0;
            WHEN OTHERS => cmp380_RM39_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_cmp380_RM39(GPOUT,29)
    out_cmp380_RM39 <= cmp380_RM39_mux_q;

    -- cmp88_RM37_mux(MUX,3)
    cmp88_RM37_mux_s <= in_valid_in_0;
    cmp88_RM37_mux_combproc: PROCESS (cmp88_RM37_mux_s, in_cmp88_RM37_1, in_cmp88_RM37_0)
    BEGIN
        CASE (cmp88_RM37_mux_s) IS
            WHEN "0" => cmp88_RM37_mux_q <= in_cmp88_RM37_1;
            WHEN "1" => cmp88_RM37_mux_q <= in_cmp88_RM37_0;
            WHEN OTHERS => cmp88_RM37_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_cmp88_RM37(GPOUT,30)
    out_cmp88_RM37 <= cmp88_RM37_mux_q;

    -- forked32_mux(MUX,4)
    forked32_mux_s <= in_valid_in_0;
    forked32_mux_combproc: PROCESS (forked32_mux_s, in_forked32_1, in_forked32_0)
    BEGIN
        CASE (forked32_mux_s) IS
            WHEN "0" => forked32_mux_q <= in_forked32_1;
            WHEN "1" => forked32_mux_q <= in_forked32_0;
            WHEN OTHERS => forked32_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_forked32(GPOUT,31)
    out_forked32 <= forked32_mux_q;

    -- memdep_phi6_pop1143_mux(MUX,26)
    memdep_phi6_pop1143_mux_s <= in_valid_in_0;
    memdep_phi6_pop1143_mux_combproc: PROCESS (memdep_phi6_pop1143_mux_s, in_memdep_phi6_pop1143_1, in_memdep_phi6_pop1143_0)
    BEGIN
        CASE (memdep_phi6_pop1143_mux_s) IS
            WHEN "0" => memdep_phi6_pop1143_mux_q <= in_memdep_phi6_pop1143_1;
            WHEN "1" => memdep_phi6_pop1143_mux_q <= in_memdep_phi6_pop1143_0;
            WHEN OTHERS => memdep_phi6_pop1143_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_memdep_phi6_pop1143(GPOUT,32)
    out_memdep_phi6_pop1143 <= memdep_phi6_pop1143_mux_q;

    -- mul1141_mux(MUX,27)
    mul1141_mux_s <= in_valid_in_0;
    mul1141_mux_combproc: PROCESS (mul1141_mux_s, in_mul1141_1, in_mul1141_0)
    BEGIN
        CASE (mul1141_mux_s) IS
            WHEN "0" => mul1141_mux_q <= in_mul1141_1;
            WHEN "1" => mul1141_mux_q <= in_mul1141_0;
            WHEN OTHERS => mul1141_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_mul1141(GPOUT,33)
    out_mul1141 <= mul1141_mux_q;

    -- notexit2933_mux(MUX,28)
    notexit2933_mux_s <= in_valid_in_0;
    notexit2933_mux_combproc: PROCESS (notexit2933_mux_s, in_notexit2933_1, in_notexit2933_0)
    BEGIN
        CASE (notexit2933_mux_s) IS
            WHEN "0" => notexit2933_mux_q <= in_notexit2933_1;
            WHEN "1" => notexit2933_mux_q <= in_notexit2933_0;
            WHEN OTHERS => notexit2933_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_notexit2933(GPOUT,34)
    out_notexit2933 <= notexit2933_mux_q;

    -- sdiv_sh125_RM35_mux(MUX,41)
    sdiv_sh125_RM35_mux_s <= in_valid_in_0;
    sdiv_sh125_RM35_mux_combproc: PROCESS (sdiv_sh125_RM35_mux_s, in_sdiv_sh125_RM35_1, in_sdiv_sh125_RM35_0)
    BEGIN
        CASE (sdiv_sh125_RM35_mux_s) IS
            WHEN "0" => sdiv_sh125_RM35_mux_q <= in_sdiv_sh125_RM35_1;
            WHEN "1" => sdiv_sh125_RM35_mux_q <= in_sdiv_sh125_RM35_0;
            WHEN OTHERS => sdiv_sh125_RM35_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_sdiv_sh125_RM35(GPOUT,35)
    out_sdiv_sh125_RM35 <= sdiv_sh125_RM35_mux_q;

    -- valid_or(LOGICAL,46)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,42)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,36)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,43)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,37)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- unnamed_gemm_nnfW3_mux(MUX,44)
    unnamed_gemm_nnfW3_mux_s <= in_valid_in_0;
    unnamed_gemm_nnfW3_mux_combproc: PROCESS (unnamed_gemm_nnfW3_mux_s, in_unnamed_gemm_nnfW3_1, in_unnamed_gemm_nnfW3_0)
    BEGIN
        CASE (unnamed_gemm_nnfW3_mux_s) IS
            WHEN "0" => unnamed_gemm_nnfW3_mux_q <= in_unnamed_gemm_nnfW3_1;
            WHEN "1" => unnamed_gemm_nnfW3_mux_q <= in_unnamed_gemm_nnfW3_0;
            WHEN OTHERS => unnamed_gemm_nnfW3_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_unnamed_gemm_nnfW3(GPOUT,38)
    out_unnamed_gemm_nnfW3 <= unnamed_gemm_nnfW3_mux_q;

    -- unnamed_gemm_nnfW4_mux(MUX,45)
    unnamed_gemm_nnfW4_mux_s <= in_valid_in_0;
    unnamed_gemm_nnfW4_mux_combproc: PROCESS (unnamed_gemm_nnfW4_mux_s, in_unnamed_gemm_nnfW4_1, in_unnamed_gemm_nnfW4_0)
    BEGIN
        CASE (unnamed_gemm_nnfW4_mux_s) IS
            WHEN "0" => unnamed_gemm_nnfW4_mux_q <= in_unnamed_gemm_nnfW4_1;
            WHEN "1" => unnamed_gemm_nnfW4_mux_q <= in_unnamed_gemm_nnfW4_0;
            WHEN OTHERS => unnamed_gemm_nnfW4_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_unnamed_gemm_nnfW4(GPOUT,39)
    out_unnamed_gemm_nnfW4 <= unnamed_gemm_nnfW4_mux_q;

    -- out_valid_out(GPOUT,40)
    out_valid_out <= valid_or_q;

END normal;
