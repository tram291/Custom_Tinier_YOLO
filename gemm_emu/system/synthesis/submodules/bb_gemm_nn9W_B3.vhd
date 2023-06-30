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

-- VHDL created from bb_gemm_nn9W_B3
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

entity bb_gemm_nn9W_B3 is
    port (
        in_c0_exit3401_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit3401_0_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit3401_0_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit3401_0_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit3401_0_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit3401_0_5 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit3401_0_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit3401_0_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit3401_0_8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit3401_0_9 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit3401_0_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit3401_0_11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit3401_0_12 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit3401_0_13 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit3401_0_14 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit3401_0_15 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit2_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit2_0_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit2_0_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit2_0_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_A : in std_logic_vector(63 downto 0);  -- ufix64
        in_B : in std_logic_vector(63 downto 0);  -- ufix64
        in_C : in std_logic_vector(63 downto 0);  -- ufix64
        in_K : in std_logic_vector(31 downto 0);  -- ufix32
        in_M : in std_logic_vector(31 downto 0);  -- ufix32
        in_N : in std_logic_vector(31 downto 0);  -- ufix32
        in_lda : in std_logic_vector(31 downto 0);  -- ufix32
        in_ldc : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_in_16 : in std_logic_vector(7 downto 0);  -- ufix8
        out_feedback_stall_out_16 : out std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_valid_in_16 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1349 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe14 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe15 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2342 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi277_pop16 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nn9W_B3;

architecture normal of bb_gemm_nn9W_B3 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component gemm_nn9W_B3_merge is
        port (
            in_c0_exit3401_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_0_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_0_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit3401_0_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit3401_0_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit3401_0_5 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit3401_0_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_0_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_0_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_0_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_0_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_0_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit3401_0_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_0_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_0_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_0_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit2_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit2_0_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit2_0_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit2_0_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit3401_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit3401_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit3401_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit3401_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit3401_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit3401_5 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit3401_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit3401_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit3401_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit3401_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit3401_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit3401_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit3401_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit3401_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit3401_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit3401_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit2_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit2_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit2_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit2_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nn9W_B3_stall_region is
        port (
            in_c0_exit3401_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit3401_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit3401_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit3401_5 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit3401_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit3401_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit2_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit2_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit2_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit2_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_16 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_ldc : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1349 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2342 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi277_pop16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gemm_nn9W_B3_branch is
        port (
            in_c0_exe11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1349 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe2342 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi277_pop16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1349 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2342 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi277_pop16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_5 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_merge_aunroll_x_out_c1_exit2_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_merge_aunroll_x_out_c1_exit2_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_merge_aunroll_x_out_c1_exit2_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_merge_aunroll_x_out_c1_exit2_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_merge_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_merge_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_stall_region_out_c0_exe11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B3_stall_region_out_c0_exe1349 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B3_stall_region_out_c0_exe14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_stall_region_out_c0_exe15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_stall_region_out_c0_exe2342 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B3_stall_region_out_c0_exe6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_stall_region_out_c0_exe7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_stall_region_out_c1_exe1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_stall_region_out_c1_exe2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_stall_region_out_c1_exe3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_stall_region_out_feedback_stall_out_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_stall_region_out_memdep_phi277_pop16 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_branch_out_c0_exe11 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B3_branch_out_c0_exe1349 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B3_branch_out_c0_exe14 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_branch_out_c0_exe15 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_branch_out_c0_exe2342 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B3_branch_out_c0_exe6 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_branch_out_c0_exe7 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_branch_out_c1_exe1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_branch_out_c1_exe2 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_branch_out_c1_exe3 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_branch_out_memdep_phi277_pop16 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B3_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- gemm_nn9W_B3_branch(BLACKBOX,37)
    thegemm_nn9W_B3_branch : gemm_nn9W_B3_branch
    PORT MAP (
        in_c0_exe11 => bb_gemm_nn9W_B3_stall_region_out_c0_exe11,
        in_c0_exe1349 => bb_gemm_nn9W_B3_stall_region_out_c0_exe1349,
        in_c0_exe14 => bb_gemm_nn9W_B3_stall_region_out_c0_exe14,
        in_c0_exe15 => bb_gemm_nn9W_B3_stall_region_out_c0_exe15,
        in_c0_exe2342 => bb_gemm_nn9W_B3_stall_region_out_c0_exe2342,
        in_c0_exe6 => bb_gemm_nn9W_B3_stall_region_out_c0_exe6,
        in_c0_exe7 => bb_gemm_nn9W_B3_stall_region_out_c0_exe7,
        in_c1_exe1 => bb_gemm_nn9W_B3_stall_region_out_c1_exe1,
        in_c1_exe2 => bb_gemm_nn9W_B3_stall_region_out_c1_exe2,
        in_c1_exe3 => bb_gemm_nn9W_B3_stall_region_out_c1_exe3,
        in_memdep_phi277_pop16 => bb_gemm_nn9W_B3_stall_region_out_memdep_phi277_pop16,
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_gemm_nn9W_B3_stall_region_out_valid_out,
        out_c0_exe11 => gemm_nn9W_B3_branch_out_c0_exe11,
        out_c0_exe1349 => gemm_nn9W_B3_branch_out_c0_exe1349,
        out_c0_exe14 => gemm_nn9W_B3_branch_out_c0_exe14,
        out_c0_exe15 => gemm_nn9W_B3_branch_out_c0_exe15,
        out_c0_exe2342 => gemm_nn9W_B3_branch_out_c0_exe2342,
        out_c0_exe6 => gemm_nn9W_B3_branch_out_c0_exe6,
        out_c0_exe7 => gemm_nn9W_B3_branch_out_c0_exe7,
        out_c1_exe1 => gemm_nn9W_B3_branch_out_c1_exe1,
        out_c1_exe2 => gemm_nn9W_B3_branch_out_c1_exe2,
        out_c1_exe3 => gemm_nn9W_B3_branch_out_c1_exe3,
        out_memdep_phi277_pop16 => gemm_nn9W_B3_branch_out_memdep_phi277_pop16,
        out_stall_out => gemm_nn9W_B3_branch_out_stall_out,
        out_valid_out_0 => gemm_nn9W_B3_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- gemm_nn9W_B3_merge_aunroll_x(BLACKBOX,2)
    thegemm_nn9W_B3_merge_aunroll_x : gemm_nn9W_B3_merge
    PORT MAP (
        in_c0_exit3401_0_0 => in_c0_exit3401_0_0,
        in_c0_exit3401_0_1 => in_c0_exit3401_0_1,
        in_c0_exit3401_0_2 => in_c0_exit3401_0_2,
        in_c0_exit3401_0_3 => in_c0_exit3401_0_3,
        in_c0_exit3401_0_4 => in_c0_exit3401_0_4,
        in_c0_exit3401_0_5 => in_c0_exit3401_0_5,
        in_c0_exit3401_0_6 => in_c0_exit3401_0_6,
        in_c0_exit3401_0_7 => in_c0_exit3401_0_7,
        in_c0_exit3401_0_8 => in_c0_exit3401_0_8,
        in_c0_exit3401_0_9 => in_c0_exit3401_0_9,
        in_c0_exit3401_0_10 => in_c0_exit3401_0_10,
        in_c0_exit3401_0_11 => in_c0_exit3401_0_11,
        in_c0_exit3401_0_12 => in_c0_exit3401_0_12,
        in_c0_exit3401_0_13 => in_c0_exit3401_0_13,
        in_c0_exit3401_0_14 => in_c0_exit3401_0_14,
        in_c0_exit3401_0_15 => in_c0_exit3401_0_15,
        in_c1_exit2_0_0 => in_c1_exit2_0_0,
        in_c1_exit2_0_1 => in_c1_exit2_0_1,
        in_c1_exit2_0_2 => in_c1_exit2_0_2,
        in_c1_exit2_0_3 => in_c1_exit2_0_3,
        in_stall_in => bb_gemm_nn9W_B3_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_c0_exit3401_0 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_0,
        out_c0_exit3401_1 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_1,
        out_c0_exit3401_2 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_2,
        out_c0_exit3401_3 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_3,
        out_c0_exit3401_4 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_4,
        out_c0_exit3401_5 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_5,
        out_c0_exit3401_6 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_6,
        out_c0_exit3401_7 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_7,
        out_c0_exit3401_8 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_8,
        out_c0_exit3401_9 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_9,
        out_c0_exit3401_10 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_10,
        out_c0_exit3401_11 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_11,
        out_c0_exit3401_12 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_12,
        out_c0_exit3401_13 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_13,
        out_c0_exit3401_14 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_14,
        out_c0_exit3401_15 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_15,
        out_c1_exit2_0 => gemm_nn9W_B3_merge_aunroll_x_out_c1_exit2_0,
        out_c1_exit2_1 => gemm_nn9W_B3_merge_aunroll_x_out_c1_exit2_1,
        out_c1_exit2_2 => gemm_nn9W_B3_merge_aunroll_x_out_c1_exit2_2,
        out_c1_exit2_3 => gemm_nn9W_B3_merge_aunroll_x_out_c1_exit2_3,
        out_stall_out_0 => gemm_nn9W_B3_merge_aunroll_x_out_stall_out_0,
        out_valid_out => gemm_nn9W_B3_merge_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nn9W_B3_stall_region(BLACKBOX,33)
    thebb_gemm_nn9W_B3_stall_region : bb_gemm_nn9W_B3_stall_region
    PORT MAP (
        in_c0_exit3401_0 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_0,
        in_c0_exit3401_1 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_1,
        in_c0_exit3401_2 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_2,
        in_c0_exit3401_3 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_3,
        in_c0_exit3401_4 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_4,
        in_c0_exit3401_5 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_5,
        in_c0_exit3401_6 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_6,
        in_c0_exit3401_7 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_7,
        in_c0_exit3401_8 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_8,
        in_c0_exit3401_9 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_9,
        in_c0_exit3401_10 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_10,
        in_c0_exit3401_11 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_11,
        in_c0_exit3401_12 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_12,
        in_c0_exit3401_13 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_13,
        in_c0_exit3401_14 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_14,
        in_c0_exit3401_15 => gemm_nn9W_B3_merge_aunroll_x_out_c0_exit3401_15,
        in_c1_exit2_0 => gemm_nn9W_B3_merge_aunroll_x_out_c1_exit2_0,
        in_c1_exit2_1 => gemm_nn9W_B3_merge_aunroll_x_out_c1_exit2_1,
        in_c1_exit2_2 => gemm_nn9W_B3_merge_aunroll_x_out_c1_exit2_2,
        in_c1_exit2_3 => gemm_nn9W_B3_merge_aunroll_x_out_c1_exit2_3,
        in_feedback_in_16 => in_feedback_in_16,
        in_feedback_valid_in_16 => in_feedback_valid_in_16,
        in_ldc => in_ldc,
        in_stall_in => gemm_nn9W_B3_branch_out_stall_out,
        in_valid_in => gemm_nn9W_B3_merge_aunroll_x_out_valid_out,
        out_c0_exe11 => bb_gemm_nn9W_B3_stall_region_out_c0_exe11,
        out_c0_exe1349 => bb_gemm_nn9W_B3_stall_region_out_c0_exe1349,
        out_c0_exe14 => bb_gemm_nn9W_B3_stall_region_out_c0_exe14,
        out_c0_exe15 => bb_gemm_nn9W_B3_stall_region_out_c0_exe15,
        out_c0_exe2342 => bb_gemm_nn9W_B3_stall_region_out_c0_exe2342,
        out_c0_exe6 => bb_gemm_nn9W_B3_stall_region_out_c0_exe6,
        out_c0_exe7 => bb_gemm_nn9W_B3_stall_region_out_c0_exe7,
        out_c1_exe1 => bb_gemm_nn9W_B3_stall_region_out_c1_exe1,
        out_c1_exe2 => bb_gemm_nn9W_B3_stall_region_out_c1_exe2,
        out_c1_exe3 => bb_gemm_nn9W_B3_stall_region_out_c1_exe3,
        out_feedback_stall_out_16 => bb_gemm_nn9W_B3_stall_region_out_feedback_stall_out_16,
        out_memdep_phi277_pop16 => bb_gemm_nn9W_B3_stall_region_out_memdep_phi277_pop16,
        out_stall_out => bb_gemm_nn9W_B3_stall_region_out_stall_out,
        out_valid_out => bb_gemm_nn9W_B3_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- feedback_stall_out_16_sync(GPOUT,35)
    out_feedback_stall_out_16 <= bb_gemm_nn9W_B3_stall_region_out_feedback_stall_out_16;

    -- out_c0_exe11(GPOUT,38)
    out_c0_exe11 <= gemm_nn9W_B3_branch_out_c0_exe11;

    -- out_c0_exe1349(GPOUT,39)
    out_c0_exe1349 <= gemm_nn9W_B3_branch_out_c0_exe1349;

    -- out_c0_exe14(GPOUT,40)
    out_c0_exe14 <= gemm_nn9W_B3_branch_out_c0_exe14;

    -- out_c0_exe15(GPOUT,41)
    out_c0_exe15 <= gemm_nn9W_B3_branch_out_c0_exe15;

    -- out_c0_exe2342(GPOUT,42)
    out_c0_exe2342 <= gemm_nn9W_B3_branch_out_c0_exe2342;

    -- out_c0_exe6(GPOUT,43)
    out_c0_exe6 <= gemm_nn9W_B3_branch_out_c0_exe6;

    -- out_c0_exe7(GPOUT,44)
    out_c0_exe7 <= gemm_nn9W_B3_branch_out_c0_exe7;

    -- out_c1_exe1(GPOUT,45)
    out_c1_exe1 <= gemm_nn9W_B3_branch_out_c1_exe1;

    -- out_c1_exe2(GPOUT,46)
    out_c1_exe2 <= gemm_nn9W_B3_branch_out_c1_exe2;

    -- out_c1_exe3(GPOUT,47)
    out_c1_exe3 <= gemm_nn9W_B3_branch_out_c1_exe3;

    -- out_memdep_phi277_pop16(GPOUT,48)
    out_memdep_phi277_pop16 <= gemm_nn9W_B3_branch_out_memdep_phi277_pop16;

    -- out_stall_out_0(GPOUT,49)
    out_stall_out_0 <= gemm_nn9W_B3_merge_aunroll_x_out_stall_out_0;

    -- out_valid_out_0(GPOUT,50)
    out_valid_out_0 <= gemm_nn9W_B3_branch_out_valid_out_0;

END normal;
