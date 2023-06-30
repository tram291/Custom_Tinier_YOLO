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

-- VHDL created from bb_gemm_nn9W_B1
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

entity bb_gemm_nn9W_B1 is
    port (
        in_feedback_in_10 : in std_logic_vector(7 downto 0);  -- ufix8
        in_feedback_in_11 : in std_logic_vector(7 downto 0);  -- ufix8
        in_feedback_in_12 : in std_logic_vector(7 downto 0);  -- ufix8
        in_feedback_in_13 : in std_logic_vector(7 downto 0);  -- ufix8
        in_feedback_in_14 : in std_logic_vector(7 downto 0);  -- ufix8
        in_feedback_in_15 : in std_logic_vector(7 downto 0);  -- ufix8
        out_feedback_stall_out_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_stall_out_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_stall_out_12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_stall_out_13 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_stall_out_14 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_stall_out_15 : out std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_valid_in_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_valid_in_11 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_valid_in_12 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_valid_in_13 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_valid_in_14 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_valid_in_15 : in std_logic_vector(0 downto 0);  -- ufix1
        in_A : in std_logic_vector(63 downto 0);  -- ufix64
        in_B : in std_logic_vector(63 downto 0);  -- ufix64
        in_C : in std_logic_vector(63 downto 0);  -- ufix64
        in_K : in std_logic_vector(31 downto 0);  -- ufix32
        in_M : in std_logic_vector(31 downto 0);  -- ufix32
        in_N : in std_logic_vector(31 downto 0);  -- ufix32
        in_forked303_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked303_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_lda : in std_logic_vector(31 downto 0);  -- ufix32
        in_ldc : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_forked303 : out std_logic_vector(0 downto 0);  -- ufix1
        out_lda_sync_buffer : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_phi261_pop11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi266_pop12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi269_pop13 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi272_pop14 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi274_pop15 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi_pop10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nn9W_B1;

architecture normal of bb_gemm_nn9W_B1 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_gemm_nn9W_B1_stall_region is
        port (
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_in_10 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_in_11 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_in_12 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_in_13 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_in_14 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_in_15 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_valid_in_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_valid_in_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_valid_in_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_valid_in_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_valid_in_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked303 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lda : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_forked303 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_lda_sync_buffer : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_phi261_pop11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi266_pop12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi269_pop13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi272_pop14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi274_pop15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi_pop10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gemm_nn9W_B1_branch is
        port (
            in_c0_exe1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked303 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lda_sync_buffer : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memdep_phi261_pop11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi266_pop12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi269_pop13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi272_pop14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi274_pop15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi_pop10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_forked303 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_lda_sync_buffer : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_phi261_pop11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi266_pop12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi269_pop13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi272_pop14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi274_pop15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi_pop10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gemm_nn9W_B1_merge is
        port (
            in_forked303_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked303_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_forked303 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_gemm_nn9W_B1_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_stall_region_out_c0_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B1_stall_region_out_c0_exe2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_stall_region_out_c0_exe3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_stall_region_out_feedback_stall_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_stall_region_out_feedback_stall_out_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_stall_region_out_feedback_stall_out_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_stall_region_out_feedback_stall_out_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_stall_region_out_feedback_stall_out_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_stall_region_out_feedback_stall_out_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_stall_region_out_forked303 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_stall_region_out_lda_sync_buffer : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B1_stall_region_out_memdep_phi261_pop11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_stall_region_out_memdep_phi266_pop12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_stall_region_out_memdep_phi269_pop13 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_stall_region_out_memdep_phi272_pop14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_stall_region_out_memdep_phi274_pop15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_stall_region_out_memdep_phi_pop10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_stall_region_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B1_branch_out_c0_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B1_branch_out_c0_exe2 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B1_branch_out_c0_exe3 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B1_branch_out_forked303 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B1_branch_out_lda_sync_buffer : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B1_branch_out_memdep_phi261_pop11 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B1_branch_out_memdep_phi266_pop12 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B1_branch_out_memdep_phi269_pop13 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B1_branch_out_memdep_phi272_pop14 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B1_branch_out_memdep_phi274_pop15 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B1_branch_out_memdep_phi_pop10 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B1_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B1_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B1_merge_out_forked303 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B1_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B1_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B1_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- gemm_nn9W_B1_branch(BLACKBOX,21)
    thegemm_nn9W_B1_branch : gemm_nn9W_B1_branch
    PORT MAP (
        in_c0_exe1 => bb_gemm_nn9W_B1_stall_region_out_c0_exe1,
        in_c0_exe2 => bb_gemm_nn9W_B1_stall_region_out_c0_exe2,
        in_c0_exe3 => bb_gemm_nn9W_B1_stall_region_out_c0_exe3,
        in_forked303 => bb_gemm_nn9W_B1_stall_region_out_forked303,
        in_lda_sync_buffer => bb_gemm_nn9W_B1_stall_region_out_lda_sync_buffer,
        in_memdep_phi261_pop11 => bb_gemm_nn9W_B1_stall_region_out_memdep_phi261_pop11,
        in_memdep_phi266_pop12 => bb_gemm_nn9W_B1_stall_region_out_memdep_phi266_pop12,
        in_memdep_phi269_pop13 => bb_gemm_nn9W_B1_stall_region_out_memdep_phi269_pop13,
        in_memdep_phi272_pop14 => bb_gemm_nn9W_B1_stall_region_out_memdep_phi272_pop14,
        in_memdep_phi274_pop15 => bb_gemm_nn9W_B1_stall_region_out_memdep_phi274_pop15,
        in_memdep_phi_pop10 => bb_gemm_nn9W_B1_stall_region_out_memdep_phi_pop10,
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_gemm_nn9W_B1_stall_region_out_valid_out,
        out_c0_exe1 => gemm_nn9W_B1_branch_out_c0_exe1,
        out_c0_exe2 => gemm_nn9W_B1_branch_out_c0_exe2,
        out_c0_exe3 => gemm_nn9W_B1_branch_out_c0_exe3,
        out_forked303 => gemm_nn9W_B1_branch_out_forked303,
        out_lda_sync_buffer => gemm_nn9W_B1_branch_out_lda_sync_buffer,
        out_memdep_phi261_pop11 => gemm_nn9W_B1_branch_out_memdep_phi261_pop11,
        out_memdep_phi266_pop12 => gemm_nn9W_B1_branch_out_memdep_phi266_pop12,
        out_memdep_phi269_pop13 => gemm_nn9W_B1_branch_out_memdep_phi269_pop13,
        out_memdep_phi272_pop14 => gemm_nn9W_B1_branch_out_memdep_phi272_pop14,
        out_memdep_phi274_pop15 => gemm_nn9W_B1_branch_out_memdep_phi274_pop15,
        out_memdep_phi_pop10 => gemm_nn9W_B1_branch_out_memdep_phi_pop10,
        out_stall_out => gemm_nn9W_B1_branch_out_stall_out,
        out_valid_out_0 => gemm_nn9W_B1_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- gemm_nn9W_B1_merge(BLACKBOX,22)
    thegemm_nn9W_B1_merge : gemm_nn9W_B1_merge
    PORT MAP (
        in_forked303_0 => in_forked303_0,
        in_forked303_1 => in_forked303_1,
        in_stall_in => bb_gemm_nn9W_B1_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_forked303 => gemm_nn9W_B1_merge_out_forked303,
        out_stall_out_0 => gemm_nn9W_B1_merge_out_stall_out_0,
        out_stall_out_1 => gemm_nn9W_B1_merge_out_stall_out_1,
        out_valid_out => gemm_nn9W_B1_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nn9W_B1_stall_region(BLACKBOX,2)
    thebb_gemm_nn9W_B1_stall_region : bb_gemm_nn9W_B1_stall_region
    PORT MAP (
        in_N => in_N,
        in_feedback_in_10 => in_feedback_in_10,
        in_feedback_in_11 => in_feedback_in_11,
        in_feedback_in_12 => in_feedback_in_12,
        in_feedback_in_13 => in_feedback_in_13,
        in_feedback_in_14 => in_feedback_in_14,
        in_feedback_in_15 => in_feedback_in_15,
        in_feedback_valid_in_10 => in_feedback_valid_in_10,
        in_feedback_valid_in_11 => in_feedback_valid_in_11,
        in_feedback_valid_in_12 => in_feedback_valid_in_12,
        in_feedback_valid_in_13 => in_feedback_valid_in_13,
        in_feedback_valid_in_14 => in_feedback_valid_in_14,
        in_feedback_valid_in_15 => in_feedback_valid_in_15,
        in_forked303 => gemm_nn9W_B1_merge_out_forked303,
        in_lda => in_lda,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_stall_in => gemm_nn9W_B1_branch_out_stall_out,
        in_valid_in => gemm_nn9W_B1_merge_out_valid_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_stall_out => bb_gemm_nn9W_B1_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_valid_out => bb_gemm_nn9W_B1_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_valid_out,
        out_c0_exe1 => bb_gemm_nn9W_B1_stall_region_out_c0_exe1,
        out_c0_exe2 => bb_gemm_nn9W_B1_stall_region_out_c0_exe2,
        out_c0_exe3 => bb_gemm_nn9W_B1_stall_region_out_c0_exe3,
        out_feedback_stall_out_10 => bb_gemm_nn9W_B1_stall_region_out_feedback_stall_out_10,
        out_feedback_stall_out_11 => bb_gemm_nn9W_B1_stall_region_out_feedback_stall_out_11,
        out_feedback_stall_out_12 => bb_gemm_nn9W_B1_stall_region_out_feedback_stall_out_12,
        out_feedback_stall_out_13 => bb_gemm_nn9W_B1_stall_region_out_feedback_stall_out_13,
        out_feedback_stall_out_14 => bb_gemm_nn9W_B1_stall_region_out_feedback_stall_out_14,
        out_feedback_stall_out_15 => bb_gemm_nn9W_B1_stall_region_out_feedback_stall_out_15,
        out_forked303 => bb_gemm_nn9W_B1_stall_region_out_forked303,
        out_lda_sync_buffer => bb_gemm_nn9W_B1_stall_region_out_lda_sync_buffer,
        out_memdep_phi261_pop11 => bb_gemm_nn9W_B1_stall_region_out_memdep_phi261_pop11,
        out_memdep_phi266_pop12 => bb_gemm_nn9W_B1_stall_region_out_memdep_phi266_pop12,
        out_memdep_phi269_pop13 => bb_gemm_nn9W_B1_stall_region_out_memdep_phi269_pop13,
        out_memdep_phi272_pop14 => bb_gemm_nn9W_B1_stall_region_out_memdep_phi272_pop14,
        out_memdep_phi274_pop15 => bb_gemm_nn9W_B1_stall_region_out_memdep_phi274_pop15,
        out_memdep_phi_pop10 => bb_gemm_nn9W_B1_stall_region_out_memdep_phi_pop10,
        out_pipeline_valid_out => bb_gemm_nn9W_B1_stall_region_out_pipeline_valid_out,
        out_stall_out => bb_gemm_nn9W_B1_stall_region_out_stall_out,
        out_valid_out => bb_gemm_nn9W_B1_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- feedback_stall_out_10_sync(GPOUT,9)
    out_feedback_stall_out_10 <= bb_gemm_nn9W_B1_stall_region_out_feedback_stall_out_10;

    -- feedback_stall_out_11_sync(GPOUT,10)
    out_feedback_stall_out_11 <= bb_gemm_nn9W_B1_stall_region_out_feedback_stall_out_11;

    -- feedback_stall_out_12_sync(GPOUT,11)
    out_feedback_stall_out_12 <= bb_gemm_nn9W_B1_stall_region_out_feedback_stall_out_12;

    -- feedback_stall_out_13_sync(GPOUT,12)
    out_feedback_stall_out_13 <= bb_gemm_nn9W_B1_stall_region_out_feedback_stall_out_13;

    -- feedback_stall_out_14_sync(GPOUT,13)
    out_feedback_stall_out_14 <= bb_gemm_nn9W_B1_stall_region_out_feedback_stall_out_14;

    -- feedback_stall_out_15_sync(GPOUT,14)
    out_feedback_stall_out_15 <= bb_gemm_nn9W_B1_stall_region_out_feedback_stall_out_15;

    -- out_c0_exe1(GPOUT,36)
    out_c0_exe1 <= gemm_nn9W_B1_branch_out_c0_exe1;

    -- out_c0_exe2(GPOUT,37)
    out_c0_exe2 <= gemm_nn9W_B1_branch_out_c0_exe2;

    -- out_c0_exe3(GPOUT,38)
    out_c0_exe3 <= gemm_nn9W_B1_branch_out_c0_exe3;

    -- out_exiting_stall_out(GPOUT,39)
    out_exiting_stall_out <= bb_gemm_nn9W_B1_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_stall_out;

    -- out_exiting_valid_out(GPOUT,40)
    out_exiting_valid_out <= bb_gemm_nn9W_B1_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_valid_out;

    -- out_forked303(GPOUT,41)
    out_forked303 <= gemm_nn9W_B1_branch_out_forked303;

    -- out_lda_sync_buffer(GPOUT,42)
    out_lda_sync_buffer <= gemm_nn9W_B1_branch_out_lda_sync_buffer;

    -- out_memdep_phi261_pop11(GPOUT,43)
    out_memdep_phi261_pop11 <= gemm_nn9W_B1_branch_out_memdep_phi261_pop11;

    -- out_memdep_phi266_pop12(GPOUT,44)
    out_memdep_phi266_pop12 <= gemm_nn9W_B1_branch_out_memdep_phi266_pop12;

    -- out_memdep_phi269_pop13(GPOUT,45)
    out_memdep_phi269_pop13 <= gemm_nn9W_B1_branch_out_memdep_phi269_pop13;

    -- out_memdep_phi272_pop14(GPOUT,46)
    out_memdep_phi272_pop14 <= gemm_nn9W_B1_branch_out_memdep_phi272_pop14;

    -- out_memdep_phi274_pop15(GPOUT,47)
    out_memdep_phi274_pop15 <= gemm_nn9W_B1_branch_out_memdep_phi274_pop15;

    -- out_memdep_phi_pop10(GPOUT,48)
    out_memdep_phi_pop10 <= gemm_nn9W_B1_branch_out_memdep_phi_pop10;

    -- out_stall_out_0(GPOUT,49)
    out_stall_out_0 <= gemm_nn9W_B1_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,50)
    out_stall_out_1 <= gemm_nn9W_B1_merge_out_stall_out_1;

    -- out_valid_out_0(GPOUT,51)
    out_valid_out_0 <= gemm_nn9W_B1_branch_out_valid_out_0;

    -- pipeline_valid_out_sync(GPOUT,53)
    out_pipeline_valid_out <= bb_gemm_nn9W_B1_stall_region_out_pipeline_valid_out;

END normal;
