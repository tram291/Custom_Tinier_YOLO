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

-- VHDL created from gemm_nnfW_B5_merge
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

entity gemm_nnfW_B5_merge is
    port (
        in_Cn_285_rep_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_Cn_285_rep_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx1452_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx1452_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_cmp380_RM40_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp380_RM40_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp88_RM38_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp88_RM38_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_conv15_hf_tofpc53_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_conv15_hf_tofpc53_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_forked51_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked51_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv_0 : in std_logic_vector(32 downto 0);  -- ufix33
        in_fpgaindvars_iv_1 : in std_logic_vector(32 downto 0);  -- ufix33
        in_memdep_phi6_pop1144_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi6_pop1144_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_mul1142_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul1142_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul2054_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul2054_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_notexit2934_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_notexit2934_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_phi_decision156_xor_RM1655_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_phi_decision156_xor_RM1655_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_sdiv_sh125_RM36_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_sdiv_sh125_RM36_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW6_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW6_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW7_0 : in std_logic_vector(32 downto 0);  -- ufix33
        in_unnamed_gemm_nnfW7_1 : in std_logic_vector(32 downto 0);  -- ufix33
        in_unnamed_gemm_nnfW8_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW8_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_Cn_285_rep : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx1452 : out std_logic_vector(63 downto 0);  -- ufix64
        out_cmp380_RM40 : out std_logic_vector(0 downto 0);  -- ufix1
        out_cmp88_RM38 : out std_logic_vector(0 downto 0);  -- ufix1
        out_conv15_hf_tofpc53 : out std_logic_vector(63 downto 0);  -- ufix64
        out_forked51 : out std_logic_vector(0 downto 0);  -- ufix1
        out_fpgaindvars_iv : out std_logic_vector(32 downto 0);  -- ufix33
        out_memdep_phi6_pop1144 : out std_logic_vector(0 downto 0);  -- ufix1
        out_mul1142 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mul2054 : out std_logic_vector(31 downto 0);  -- ufix32
        out_notexit2934 : out std_logic_vector(0 downto 0);  -- ufix1
        out_phi_decision156_xor_RM1655 : out std_logic_vector(0 downto 0);  -- ufix1
        out_sdiv_sh125_RM36 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW7 : out std_logic_vector(32 downto 0);  -- ufix33
        out_unnamed_gemm_nnfW8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end gemm_nnfW_B5_merge;

architecture normal of gemm_nnfW_B5_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Cn_285_rep_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Cn_285_rep_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx1452_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx1452_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal cmp380_RM40_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp380_RM40_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp88_RM38_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp88_RM38_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal conv15_hf_tofpc53_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal conv15_hf_tofpc53_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal forked51_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal forked51_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fpgaindvars_iv_mux_q : STD_LOGIC_VECTOR (32 downto 0);
    signal memdep_phi6_pop1144_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi6_pop1144_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mul1142_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal mul1142_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal mul2054_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal mul2054_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal notexit2934_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal notexit2934_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal phi_decision156_xor_RM1655_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal phi_decision156_xor_RM1655_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sdiv_sh125_RM36_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal sdiv_sh125_RM36_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_gemm_nnfW6_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_gemm_nnfW6_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_gemm_nnfW7_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_gemm_nnfW7_mux_q : STD_LOGIC_VECTOR (32 downto 0);
    signal unnamed_gemm_nnfW8_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_gemm_nnfW8_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_or_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- Cn_285_rep_mux(MUX,2)
    Cn_285_rep_mux_s <= in_valid_in_0;
    Cn_285_rep_mux_combproc: PROCESS (Cn_285_rep_mux_s, in_Cn_285_rep_1, in_Cn_285_rep_0)
    BEGIN
        CASE (Cn_285_rep_mux_s) IS
            WHEN "0" => Cn_285_rep_mux_q <= in_Cn_285_rep_1;
            WHEN "1" => Cn_285_rep_mux_q <= in_Cn_285_rep_0;
            WHEN OTHERS => Cn_285_rep_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_Cn_285_rep(GPOUT,48)
    out_Cn_285_rep <= Cn_285_rep_mux_q;

    -- arrayidx1452_mux(MUX,3)
    arrayidx1452_mux_s <= in_valid_in_0;
    arrayidx1452_mux_combproc: PROCESS (arrayidx1452_mux_s, in_arrayidx1452_1, in_arrayidx1452_0)
    BEGIN
        CASE (arrayidx1452_mux_s) IS
            WHEN "0" => arrayidx1452_mux_q <= in_arrayidx1452_1;
            WHEN "1" => arrayidx1452_mux_q <= in_arrayidx1452_0;
            WHEN OTHERS => arrayidx1452_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx1452(GPOUT,49)
    out_arrayidx1452 <= arrayidx1452_mux_q;

    -- cmp380_RM40_mux(MUX,4)
    cmp380_RM40_mux_s <= in_valid_in_0;
    cmp380_RM40_mux_combproc: PROCESS (cmp380_RM40_mux_s, in_cmp380_RM40_1, in_cmp380_RM40_0)
    BEGIN
        CASE (cmp380_RM40_mux_s) IS
            WHEN "0" => cmp380_RM40_mux_q <= in_cmp380_RM40_1;
            WHEN "1" => cmp380_RM40_mux_q <= in_cmp380_RM40_0;
            WHEN OTHERS => cmp380_RM40_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_cmp380_RM40(GPOUT,50)
    out_cmp380_RM40 <= cmp380_RM40_mux_q;

    -- cmp88_RM38_mux(MUX,5)
    cmp88_RM38_mux_s <= in_valid_in_0;
    cmp88_RM38_mux_combproc: PROCESS (cmp88_RM38_mux_s, in_cmp88_RM38_1, in_cmp88_RM38_0)
    BEGIN
        CASE (cmp88_RM38_mux_s) IS
            WHEN "0" => cmp88_RM38_mux_q <= in_cmp88_RM38_1;
            WHEN "1" => cmp88_RM38_mux_q <= in_cmp88_RM38_0;
            WHEN OTHERS => cmp88_RM38_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_cmp88_RM38(GPOUT,51)
    out_cmp88_RM38 <= cmp88_RM38_mux_q;

    -- conv15_hf_tofpc53_mux(MUX,6)
    conv15_hf_tofpc53_mux_s <= in_valid_in_0;
    conv15_hf_tofpc53_mux_combproc: PROCESS (conv15_hf_tofpc53_mux_s, in_conv15_hf_tofpc53_1, in_conv15_hf_tofpc53_0)
    BEGIN
        CASE (conv15_hf_tofpc53_mux_s) IS
            WHEN "0" => conv15_hf_tofpc53_mux_q <= in_conv15_hf_tofpc53_1;
            WHEN "1" => conv15_hf_tofpc53_mux_q <= in_conv15_hf_tofpc53_0;
            WHEN OTHERS => conv15_hf_tofpc53_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_conv15_hf_tofpc53(GPOUT,52)
    out_conv15_hf_tofpc53 <= conv15_hf_tofpc53_mux_q;

    -- forked51_mux(MUX,7)
    forked51_mux_s <= in_valid_in_0;
    forked51_mux_combproc: PROCESS (forked51_mux_s, in_forked51_1, in_forked51_0)
    BEGIN
        CASE (forked51_mux_s) IS
            WHEN "0" => forked51_mux_q <= in_forked51_1;
            WHEN "1" => forked51_mux_q <= in_forked51_0;
            WHEN OTHERS => forked51_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_forked51(GPOUT,53)
    out_forked51 <= forked51_mux_q;

    -- fpgaindvars_iv_mux(MUX,8)
    fpgaindvars_iv_mux_s <= in_valid_in_0;
    fpgaindvars_iv_mux_combproc: PROCESS (fpgaindvars_iv_mux_s, in_fpgaindvars_iv_1, in_fpgaindvars_iv_0)
    BEGIN
        CASE (fpgaindvars_iv_mux_s) IS
            WHEN "0" => fpgaindvars_iv_mux_q <= in_fpgaindvars_iv_1;
            WHEN "1" => fpgaindvars_iv_mux_q <= in_fpgaindvars_iv_0;
            WHEN OTHERS => fpgaindvars_iv_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_fpgaindvars_iv(GPOUT,54)
    out_fpgaindvars_iv <= fpgaindvars_iv_mux_q;

    -- memdep_phi6_pop1144_mux(MUX,44)
    memdep_phi6_pop1144_mux_s <= in_valid_in_0;
    memdep_phi6_pop1144_mux_combproc: PROCESS (memdep_phi6_pop1144_mux_s, in_memdep_phi6_pop1144_1, in_memdep_phi6_pop1144_0)
    BEGIN
        CASE (memdep_phi6_pop1144_mux_s) IS
            WHEN "0" => memdep_phi6_pop1144_mux_q <= in_memdep_phi6_pop1144_1;
            WHEN "1" => memdep_phi6_pop1144_mux_q <= in_memdep_phi6_pop1144_0;
            WHEN OTHERS => memdep_phi6_pop1144_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_memdep_phi6_pop1144(GPOUT,55)
    out_memdep_phi6_pop1144 <= memdep_phi6_pop1144_mux_q;

    -- mul1142_mux(MUX,45)
    mul1142_mux_s <= in_valid_in_0;
    mul1142_mux_combproc: PROCESS (mul1142_mux_s, in_mul1142_1, in_mul1142_0)
    BEGIN
        CASE (mul1142_mux_s) IS
            WHEN "0" => mul1142_mux_q <= in_mul1142_1;
            WHEN "1" => mul1142_mux_q <= in_mul1142_0;
            WHEN OTHERS => mul1142_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_mul1142(GPOUT,56)
    out_mul1142 <= mul1142_mux_q;

    -- mul2054_mux(MUX,46)
    mul2054_mux_s <= in_valid_in_0;
    mul2054_mux_combproc: PROCESS (mul2054_mux_s, in_mul2054_1, in_mul2054_0)
    BEGIN
        CASE (mul2054_mux_s) IS
            WHEN "0" => mul2054_mux_q <= in_mul2054_1;
            WHEN "1" => mul2054_mux_q <= in_mul2054_0;
            WHEN OTHERS => mul2054_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_mul2054(GPOUT,57)
    out_mul2054 <= mul2054_mux_q;

    -- notexit2934_mux(MUX,47)
    notexit2934_mux_s <= in_valid_in_0;
    notexit2934_mux_combproc: PROCESS (notexit2934_mux_s, in_notexit2934_1, in_notexit2934_0)
    BEGIN
        CASE (notexit2934_mux_s) IS
            WHEN "0" => notexit2934_mux_q <= in_notexit2934_1;
            WHEN "1" => notexit2934_mux_q <= in_notexit2934_0;
            WHEN OTHERS => notexit2934_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_notexit2934(GPOUT,58)
    out_notexit2934 <= notexit2934_mux_q;

    -- phi_decision156_xor_RM1655_mux(MUX,67)
    phi_decision156_xor_RM1655_mux_s <= in_valid_in_0;
    phi_decision156_xor_RM1655_mux_combproc: PROCESS (phi_decision156_xor_RM1655_mux_s, in_phi_decision156_xor_RM1655_1, in_phi_decision156_xor_RM1655_0)
    BEGIN
        CASE (phi_decision156_xor_RM1655_mux_s) IS
            WHEN "0" => phi_decision156_xor_RM1655_mux_q <= in_phi_decision156_xor_RM1655_1;
            WHEN "1" => phi_decision156_xor_RM1655_mux_q <= in_phi_decision156_xor_RM1655_0;
            WHEN OTHERS => phi_decision156_xor_RM1655_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_phi_decision156_xor_RM1655(GPOUT,59)
    out_phi_decision156_xor_RM1655 <= phi_decision156_xor_RM1655_mux_q;

    -- sdiv_sh125_RM36_mux(MUX,68)
    sdiv_sh125_RM36_mux_s <= in_valid_in_0;
    sdiv_sh125_RM36_mux_combproc: PROCESS (sdiv_sh125_RM36_mux_s, in_sdiv_sh125_RM36_1, in_sdiv_sh125_RM36_0)
    BEGIN
        CASE (sdiv_sh125_RM36_mux_s) IS
            WHEN "0" => sdiv_sh125_RM36_mux_q <= in_sdiv_sh125_RM36_1;
            WHEN "1" => sdiv_sh125_RM36_mux_q <= in_sdiv_sh125_RM36_0;
            WHEN OTHERS => sdiv_sh125_RM36_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_sdiv_sh125_RM36(GPOUT,60)
    out_sdiv_sh125_RM36 <= sdiv_sh125_RM36_mux_q;

    -- valid_or(LOGICAL,74)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,69)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,61)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,70)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,62)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- unnamed_gemm_nnfW6_mux(MUX,71)
    unnamed_gemm_nnfW6_mux_s <= in_valid_in_0;
    unnamed_gemm_nnfW6_mux_combproc: PROCESS (unnamed_gemm_nnfW6_mux_s, in_unnamed_gemm_nnfW6_1, in_unnamed_gemm_nnfW6_0)
    BEGIN
        CASE (unnamed_gemm_nnfW6_mux_s) IS
            WHEN "0" => unnamed_gemm_nnfW6_mux_q <= in_unnamed_gemm_nnfW6_1;
            WHEN "1" => unnamed_gemm_nnfW6_mux_q <= in_unnamed_gemm_nnfW6_0;
            WHEN OTHERS => unnamed_gemm_nnfW6_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_unnamed_gemm_nnfW6(GPOUT,63)
    out_unnamed_gemm_nnfW6 <= unnamed_gemm_nnfW6_mux_q;

    -- unnamed_gemm_nnfW7_mux(MUX,72)
    unnamed_gemm_nnfW7_mux_s <= in_valid_in_0;
    unnamed_gemm_nnfW7_mux_combproc: PROCESS (unnamed_gemm_nnfW7_mux_s, in_unnamed_gemm_nnfW7_1, in_unnamed_gemm_nnfW7_0)
    BEGIN
        CASE (unnamed_gemm_nnfW7_mux_s) IS
            WHEN "0" => unnamed_gemm_nnfW7_mux_q <= in_unnamed_gemm_nnfW7_1;
            WHEN "1" => unnamed_gemm_nnfW7_mux_q <= in_unnamed_gemm_nnfW7_0;
            WHEN OTHERS => unnamed_gemm_nnfW7_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_unnamed_gemm_nnfW7(GPOUT,64)
    out_unnamed_gemm_nnfW7 <= unnamed_gemm_nnfW7_mux_q;

    -- unnamed_gemm_nnfW8_mux(MUX,73)
    unnamed_gemm_nnfW8_mux_s <= in_valid_in_0;
    unnamed_gemm_nnfW8_mux_combproc: PROCESS (unnamed_gemm_nnfW8_mux_s, in_unnamed_gemm_nnfW8_1, in_unnamed_gemm_nnfW8_0)
    BEGIN
        CASE (unnamed_gemm_nnfW8_mux_s) IS
            WHEN "0" => unnamed_gemm_nnfW8_mux_q <= in_unnamed_gemm_nnfW8_1;
            WHEN "1" => unnamed_gemm_nnfW8_mux_q <= in_unnamed_gemm_nnfW8_0;
            WHEN OTHERS => unnamed_gemm_nnfW8_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_unnamed_gemm_nnfW8(GPOUT,65)
    out_unnamed_gemm_nnfW8 <= unnamed_gemm_nnfW8_mux_q;

    -- out_valid_out(GPOUT,66)
    out_valid_out <= valid_or_q;

END normal;
