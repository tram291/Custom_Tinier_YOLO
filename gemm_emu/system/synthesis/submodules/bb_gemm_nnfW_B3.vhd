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

-- VHDL created from bb_gemm_nnfW_B3
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

entity bb_gemm_nnfW_B3 is
    port (
        in_c0_exit621_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit621_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit621_0_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit621_0_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit621_0_4 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit621_0_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit621_0_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit621_0_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit621_0_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit621_0_9 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit621_0_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit621_0_11 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit621_0_12 : in std_logic_vector(0 downto 0);  -- ufix1
        in_A : in std_logic_vector(63 downto 0);  -- ufix64
        in_B : in std_logic_vector(63 downto 0);  -- ufix64
        in_C : in std_logic_vector(63 downto 0);  -- ufix64
        in_K : in std_logic_vector(31 downto 0);  -- ufix32
        in_M : in std_logic_vector(31 downto 0);  -- ufix32
        in_N : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe82_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_lda : in std_logic_vector(31 downto 0);  -- ufix32
        in_ldc : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_in_11 : in std_logic_vector(7 downto 0);  -- ufix8
        out_feedback_stall_out_11 : out std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_valid_in_11 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe163 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe171 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi6_pop11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW2 : out std_logic_vector(32 downto 0);  -- ufix33
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nnfW_B3;

architecture normal of bb_gemm_nnfW_B3 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component gemm_nnfW_B3_merge is
        port (
            in_c0_exit621_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit621_0_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit621_0_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit621_0_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit621_0_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit621_0_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit621_0_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit621_0_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit621_0_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit621_0_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit621_0_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit621_0_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit621_0_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe82_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit621_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit621_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit621_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit621_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit621_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit621_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit621_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit621_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit621_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit621_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit621_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit621_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit621_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe82 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nnfW_B3_stall_region is
        port (
            in_c0_exit621_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit621_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit621_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit621_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit621_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit621_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit621_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit621_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit621_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit621_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit621_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit621_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit621_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe82 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_in_11 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_ldc : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe163 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe171 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi6_pop11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW2 : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gemm_nnfW_B3_branch is
        port (
            in_c0_exe11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe163 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe171 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi6_pop11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW2 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe163 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe171 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi6_pop11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW2 : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B3_merge_aunroll_x_out_c0_exe82 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B3_merge_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B3_merge_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_stall_region_out_c0_exe11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_stall_region_out_c0_exe12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_stall_region_out_c0_exe163 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B3_stall_region_out_c0_exe171 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B3_stall_region_out_c0_exe5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_stall_region_out_c0_exe6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_stall_region_out_feedback_stall_out_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_stall_region_out_memdep_phi6_pop11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_stall_region_out_unnamed_gemm_nnfW2 : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_gemm_nnfW_B3_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B3_branch_out_c0_exe11 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B3_branch_out_c0_exe12 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B3_branch_out_c0_exe163 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B3_branch_out_c0_exe171 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B3_branch_out_c0_exe5 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B3_branch_out_c0_exe6 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B3_branch_out_memdep_phi6_pop11 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B3_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B3_branch_out_unnamed_gemm_nnfW2 : STD_LOGIC_VECTOR (32 downto 0);
    signal gemm_nnfW_B3_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- gemm_nnfW_B3_branch(BLACKBOX,31)
    thegemm_nnfW_B3_branch : gemm_nnfW_B3_branch
    PORT MAP (
        in_c0_exe11 => bb_gemm_nnfW_B3_stall_region_out_c0_exe11,
        in_c0_exe12 => bb_gemm_nnfW_B3_stall_region_out_c0_exe12,
        in_c0_exe163 => bb_gemm_nnfW_B3_stall_region_out_c0_exe163,
        in_c0_exe171 => bb_gemm_nnfW_B3_stall_region_out_c0_exe171,
        in_c0_exe5 => bb_gemm_nnfW_B3_stall_region_out_c0_exe5,
        in_c0_exe6 => bb_gemm_nnfW_B3_stall_region_out_c0_exe6,
        in_memdep_phi6_pop11 => bb_gemm_nnfW_B3_stall_region_out_memdep_phi6_pop11,
        in_stall_in_0 => in_stall_in_0,
        in_unnamed_gemm_nnfW2 => bb_gemm_nnfW_B3_stall_region_out_unnamed_gemm_nnfW2,
        in_valid_in => bb_gemm_nnfW_B3_stall_region_out_valid_out,
        out_c0_exe11 => gemm_nnfW_B3_branch_out_c0_exe11,
        out_c0_exe12 => gemm_nnfW_B3_branch_out_c0_exe12,
        out_c0_exe163 => gemm_nnfW_B3_branch_out_c0_exe163,
        out_c0_exe171 => gemm_nnfW_B3_branch_out_c0_exe171,
        out_c0_exe5 => gemm_nnfW_B3_branch_out_c0_exe5,
        out_c0_exe6 => gemm_nnfW_B3_branch_out_c0_exe6,
        out_memdep_phi6_pop11 => gemm_nnfW_B3_branch_out_memdep_phi6_pop11,
        out_stall_out => gemm_nnfW_B3_branch_out_stall_out,
        out_unnamed_gemm_nnfW2 => gemm_nnfW_B3_branch_out_unnamed_gemm_nnfW2,
        out_valid_out_0 => gemm_nnfW_B3_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- gemm_nnfW_B3_merge_aunroll_x(BLACKBOX,2)
    thegemm_nnfW_B3_merge_aunroll_x : gemm_nnfW_B3_merge
    PORT MAP (
        in_c0_exit621_0_0 => in_c0_exit621_0_0,
        in_c0_exit621_0_1 => in_c0_exit621_0_1,
        in_c0_exit621_0_2 => in_c0_exit621_0_2,
        in_c0_exit621_0_3 => in_c0_exit621_0_3,
        in_c0_exit621_0_4 => in_c0_exit621_0_4,
        in_c0_exit621_0_5 => in_c0_exit621_0_5,
        in_c0_exit621_0_6 => in_c0_exit621_0_6,
        in_c0_exit621_0_7 => in_c0_exit621_0_7,
        in_c0_exit621_0_8 => in_c0_exit621_0_8,
        in_c0_exit621_0_9 => in_c0_exit621_0_9,
        in_c0_exit621_0_10 => in_c0_exit621_0_10,
        in_c0_exit621_0_11 => in_c0_exit621_0_11,
        in_c0_exit621_0_12 => in_c0_exit621_0_12,
        in_c0_exe82_0 => in_c0_exe82_0,
        in_stall_in => bb_gemm_nnfW_B3_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_c0_exit621_0 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_0,
        out_c0_exit621_1 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_1,
        out_c0_exit621_2 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_2,
        out_c0_exit621_3 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_3,
        out_c0_exit621_4 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_4,
        out_c0_exit621_5 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_5,
        out_c0_exit621_6 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_6,
        out_c0_exit621_7 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_7,
        out_c0_exit621_8 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_8,
        out_c0_exit621_9 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_9,
        out_c0_exit621_10 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_10,
        out_c0_exit621_11 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_11,
        out_c0_exit621_12 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_12,
        out_c0_exe82 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exe82,
        out_stall_out_0 => gemm_nnfW_B3_merge_aunroll_x_out_stall_out_0,
        out_valid_out => gemm_nnfW_B3_merge_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nnfW_B3_stall_region(BLACKBOX,27)
    thebb_gemm_nnfW_B3_stall_region : bb_gemm_nnfW_B3_stall_region
    PORT MAP (
        in_c0_exit621_0 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_0,
        in_c0_exit621_1 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_1,
        in_c0_exit621_2 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_2,
        in_c0_exit621_3 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_3,
        in_c0_exit621_4 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_4,
        in_c0_exit621_5 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_5,
        in_c0_exit621_6 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_6,
        in_c0_exit621_7 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_7,
        in_c0_exit621_8 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_8,
        in_c0_exit621_9 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_9,
        in_c0_exit621_10 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_10,
        in_c0_exit621_11 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_11,
        in_c0_exit621_12 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exit621_12,
        in_c0_exe82 => gemm_nnfW_B3_merge_aunroll_x_out_c0_exe82,
        in_feedback_in_11 => in_feedback_in_11,
        in_feedback_valid_in_11 => in_feedback_valid_in_11,
        in_ldc => in_ldc,
        in_stall_in => gemm_nnfW_B3_branch_out_stall_out,
        in_valid_in => gemm_nnfW_B3_merge_aunroll_x_out_valid_out,
        out_c0_exe11 => bb_gemm_nnfW_B3_stall_region_out_c0_exe11,
        out_c0_exe12 => bb_gemm_nnfW_B3_stall_region_out_c0_exe12,
        out_c0_exe163 => bb_gemm_nnfW_B3_stall_region_out_c0_exe163,
        out_c0_exe171 => bb_gemm_nnfW_B3_stall_region_out_c0_exe171,
        out_c0_exe5 => bb_gemm_nnfW_B3_stall_region_out_c0_exe5,
        out_c0_exe6 => bb_gemm_nnfW_B3_stall_region_out_c0_exe6,
        out_feedback_stall_out_11 => bb_gemm_nnfW_B3_stall_region_out_feedback_stall_out_11,
        out_memdep_phi6_pop11 => bb_gemm_nnfW_B3_stall_region_out_memdep_phi6_pop11,
        out_stall_out => bb_gemm_nnfW_B3_stall_region_out_stall_out,
        out_unnamed_gemm_nnfW2 => bb_gemm_nnfW_B3_stall_region_out_unnamed_gemm_nnfW2,
        out_valid_out => bb_gemm_nnfW_B3_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- feedback_stall_out_11_sync(GPOUT,29)
    out_feedback_stall_out_11 <= bb_gemm_nnfW_B3_stall_region_out_feedback_stall_out_11;

    -- out_c0_exe11(GPOUT,32)
    out_c0_exe11 <= gemm_nnfW_B3_branch_out_c0_exe11;

    -- out_c0_exe12(GPOUT,33)
    out_c0_exe12 <= gemm_nnfW_B3_branch_out_c0_exe12;

    -- out_c0_exe163(GPOUT,34)
    out_c0_exe163 <= gemm_nnfW_B3_branch_out_c0_exe163;

    -- out_c0_exe171(GPOUT,35)
    out_c0_exe171 <= gemm_nnfW_B3_branch_out_c0_exe171;

    -- out_c0_exe5(GPOUT,36)
    out_c0_exe5 <= gemm_nnfW_B3_branch_out_c0_exe5;

    -- out_c0_exe6(GPOUT,37)
    out_c0_exe6 <= gemm_nnfW_B3_branch_out_c0_exe6;

    -- out_memdep_phi6_pop11(GPOUT,38)
    out_memdep_phi6_pop11 <= gemm_nnfW_B3_branch_out_memdep_phi6_pop11;

    -- out_stall_out_0(GPOUT,39)
    out_stall_out_0 <= gemm_nnfW_B3_merge_aunroll_x_out_stall_out_0;

    -- out_unnamed_gemm_nnfW2(GPOUT,40)
    out_unnamed_gemm_nnfW2 <= gemm_nnfW_B3_branch_out_unnamed_gemm_nnfW2;

    -- out_valid_out_0(GPOUT,41)
    out_valid_out_0 <= gemm_nnfW_B3_branch_out_valid_out_0;

END normal;
