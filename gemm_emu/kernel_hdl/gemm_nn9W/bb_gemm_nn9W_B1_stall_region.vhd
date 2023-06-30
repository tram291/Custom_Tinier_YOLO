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

-- VHDL created from bb_gemm_nn9W_B1_stall_region
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

entity bb_gemm_nn9W_B1_stall_region is
    port (
        in_lda : in std_logic_vector(31 downto 0);  -- ufix32
        in_forked303 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_forked303 : out std_logic_vector(0 downto 0);  -- ufix1
        out_lda_sync_buffer : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_phi261_pop11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi266_pop12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi269_pop13 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi272_pop14 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi274_pop15 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi_pop10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
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
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_N : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nn9W_B1_stall_region;

architecture normal of bb_gemm_nn9W_B1_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component gemm_nn9W_B1_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w is
        port (
            in_c0_eni1_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni1_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w24 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_11 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w26 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_12 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w28 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_13 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w30 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_14 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w32 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_15 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w22 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_10 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_lda_sync_buffer_gemm_nn9w2 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component acl_valid_fifo_counter is
        generic (
            DEPTH : INTEGER := 0;
            ASYNC_RESET : INTEGER := 1;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            valid_out : out std_logic;
            stall_out : out std_logic;
            full : out std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B1_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B1_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_c0_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_c0_exit_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_c0_exit_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w_out_feedback_stall_out_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w_out_feedback_stall_out_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w_out_feedback_stall_out_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w_out_feedback_stall_out_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w_out_feedback_stall_out_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w_out_feedback_stall_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_lda_sync_buffer_gemm_nn9w_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_lda_sync_buffer_gemm_nn9w_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_lda_sync_buffer_gemm_nn9w_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_gemm_nn9W_B1_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nn9W_B1_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_q : STD_LOGIC_VECTOR (33 downto 0);
    signal bubble_select_i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_syncbuf_lda_sync_buffer_gemm_nn9w_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_lda_sync_buffer_gemm_nn9w_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp : std_logic;
    signal SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_D0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,124)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= gemm_nn9W_B1_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- SE_out_bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1(STALLENABLE,134)
    -- Valid signal propagation
    SE_out_bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_V0 <= SE_out_bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_backStall <= i_syncbuf_lda_sync_buffer_gemm_nn9w_out_stall_out or not (SE_out_bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_wireValid <= bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_valid_out;

    -- bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg(STALLFIFO,189)
    bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_valid_in <= SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_V0;
    bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_stall_in <= SE_out_bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_backStall;
    bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp <= bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_valid_in(0);
    bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp <= bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_stall_in(0);
    bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_valid_out(0) <= bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp;
    bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_stall_out(0) <= bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp;
    thebubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 4,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_gemm_nn9W_B1_merge_reg_aunroll_x(STALLENABLE,107)
    SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_fromReg2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_fromReg0 <= SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_fromReg1 <= SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_fromReg2 <= SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_toReg2;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_consumed0 <= (not (bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_reg_stall_out) and SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_fromReg0;
    SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_consumed1 <= (not (SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backStall) and SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_fromReg1;
    SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_consumed2 <= (not (i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_o_stall) and SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_fromReg2;
    -- Consuming
    SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_StallValid <= SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_backStall and SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_wireValid;
    SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_toReg0 <= SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_StallValid and SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_consumed0;
    SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_toReg1 <= SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_StallValid and SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_consumed1;
    SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_toReg2 <= SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_StallValid and SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_consumed2;
    -- Backward Stall generation
    SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_or0 <= SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_consumed0;
    SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_or1 <= SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_consumed1 and SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_or0;
    SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_wireStall <= not (SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_consumed2 and SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_or1);
    SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_backStall <= SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_V0 <= SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_fromReg0);
    SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_V1 <= SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_fromReg1);
    SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_V2 <= SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_fromReg2);
    -- Computing multiple Valid(s)
    SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_wireValid <= gemm_nn9W_B1_merge_reg_aunroll_x_out_valid_out;

    -- bubble_join_stall_entry(BITJOIN,103)
    bubble_join_stall_entry_q <= in_forked303;

    -- bubble_select_stall_entry(BITSELECT,104)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(0 downto 0));

    -- gemm_nn9W_B1_merge_reg_aunroll_x(BLACKBOX,21)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thegemm_nn9W_B1_merge_reg_aunroll_x : gemm_nn9W_B1_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_b,
        in_stall_in => SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0,
        out_stall_out => gemm_nn9W_B1_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => gemm_nn9W_B1_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_gemm_nn9W_B1_merge_reg_aunroll_x(BITJOIN,67)
    bubble_join_gemm_nn9W_B1_merge_reg_aunroll_x_q <= gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_gemm_nn9W_B1_merge_reg_aunroll_x(BITSELECT,68)
    bubble_select_gemm_nn9W_B1_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_gemm_nn9W_B1_merge_reg_aunroll_x_q(0 downto 0));

    -- redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0(REG,63)
    redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backEN = "1") THEN
                redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_q <= STD_LOGIC_VECTOR(bubble_select_gemm_nn9W_B1_merge_reg_aunroll_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0(STALLENABLE,126)
    -- Valid signal propagation
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_V0 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_0 <= SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backStall and SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backEN <= not (SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_v_s_0 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backEN and SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_V1;
    -- Backward Stall generation
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backStall <= not (SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_v_s_0);
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backEN = "0") THEN
                SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0 and SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_0;
            ELSE
                SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1(STALLREG,190)
    SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid <= (others => '0');
            SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backStall and (SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid or SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_i_valid);

            IF (SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_data0 <= STD_LOGIC_VECTOR(redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_i_valid <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_V0;
    -- Stall signal propagation
    SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backStall <= SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid or not (SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_i_valid);

    -- Valid
    SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V <= SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid WHEN SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid = "1" ELSE SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_i_valid;

    SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_D0 <= SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_data0 WHEN SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid = "1" ELSE redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_0_q;

    -- redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1(REG,64)
    redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN = "1") THEN
                redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_q <= STD_LOGIC_VECTOR(SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_D0);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1(STALLENABLE,127)
    -- Valid signal propagation
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V0 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_0;
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V1 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_1;
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V2 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_2;
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V3 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_3;
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V4 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_4;
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V5 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_5;
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V6 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_6;
    -- Stall signal propagation
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_0 <= SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_backStall and SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_0;
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_1 <= i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w_out_stall_out and SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_1;
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_2 <= i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w_out_stall_out and SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_2;
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_3 <= i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w_out_stall_out and SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_3;
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_4 <= i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w_out_stall_out and SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_4;
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_5 <= i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w_out_stall_out and SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_5;
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_6 <= i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w_out_stall_out and SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_6;
    -- Backward Enable generation
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or0 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_0;
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or1 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_1 or SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or0;
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or2 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_2 or SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or1;
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or3 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_3 or SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or2;
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or4 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_4 or SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or3;
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or5 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_5 or SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or4;
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN <= not (SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_6 or SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or5);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_v_s_0 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN and SR_SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V;
    -- Backward Stall generation
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backStall <= not (SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN);
    SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_0 <= (others => '0');
            SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_1 <= (others => '0');
            SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_2 <= (others => '0');
            SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_3 <= (others => '0');
            SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_4 <= (others => '0');
            SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_5 <= (others => '0');
            SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_6 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN = "0") THEN
                SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_0 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_0 and SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_0;
            ELSE
                SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_0 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_v_s_0;
            END IF;

            IF (SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN = "0") THEN
                SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_1 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_1 and SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_1;
            ELSE
                SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_1 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_v_s_0;
            END IF;

            IF (SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN = "0") THEN
                SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_2 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_2 and SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_2;
            ELSE
                SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_2 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_v_s_0;
            END IF;

            IF (SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN = "0") THEN
                SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_3 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_3 and SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_3;
            ELSE
                SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_3 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_v_s_0;
            END IF;

            IF (SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN = "0") THEN
                SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_4 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_4 and SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_4;
            ELSE
                SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_4 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_v_s_0;
            END IF;

            IF (SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN = "0") THEN
                SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_5 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_5 and SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_5;
            ELSE
                SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_5 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_v_s_0;
            END IF;

            IF (SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN = "0") THEN
                SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_6 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_6 and SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_6;
            ELSE
                SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_6 <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0(STALLREG,191)
    SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_r_valid <= (others => '0');
            SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_r_valid <= SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_backStall and (SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_r_valid or SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_i_valid);

            IF (SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_r_data0 <= STD_LOGIC_VECTOR(redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_i_valid <= SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V0;
    -- Stall signal propagation
    SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_backStall <= SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_r_valid or not (SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_i_valid);

    -- Valid
    SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_V <= SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_r_valid WHEN SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_r_valid = "1" ELSE SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_i_valid;

    SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_D0 <= SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_r_data0 WHEN SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_r_valid = "1" ELSE redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_q;

    -- SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0(STALLENABLE,128)
    -- Valid signal propagation
    SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_V0 <= SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_R_v_0;
    -- Stall signal propagation
    SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_s_tv_0 <= SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_backStall and SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_R_v_0;
    -- Backward Enable generation
    SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_backEN <= not (SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_v_s_0 <= SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_backEN and SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_V;
    -- Backward Stall generation
    SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_backStall <= not (SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_backEN);
    SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_backEN = "0") THEN
                SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_R_v_0 <= SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_R_v_0 and SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_s_tv_0;
            ELSE
                SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_R_v_0 <= SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x(BLACKBOX,22)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit_0@4
    -- out out_c0_exit_1@4
    -- out out_c0_exit_2@4
    -- out out_c0_exit_3@4
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_stall_out@20000000
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_valid_out@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@4
    -- out out_pipeline_valid_out@20000000
    thei_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x : i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w
    PORT MAP (
        in_c0_eni1_0 => GND_q,
        in_c0_eni1_1 => bubble_select_gemm_nn9W_B1_merge_reg_aunroll_x_b,
        in_N => in_N,
        in_i_stall => SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_backStall,
        in_i_valid => SE_out_gemm_nn9W_B1_merge_reg_aunroll_x_V2,
        in_pipeline_stall_in => in_pipeline_stall_in,
        out_c0_exit_1 => i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_c0_exit_1,
        out_c0_exit_2 => i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_c0_exit_2,
        out_c0_exit_3 => i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_c0_exit_3,
        out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_stall_out => i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_valid_out => i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_valid_out,
        out_o_stall => i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_o_valid,
        out_pipeline_valid_out => i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w(BLACKBOX,45)@3
    -- in in_stall_in@20000000
    -- out out_data_out@4
    -- out out_feedback_stall_out_11@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@4
    thei_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w : i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w24
    PORT MAP (
        in_data_in => GND_q,
        in_dir => redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_q,
        in_feedback_in_11 => in_feedback_in_11,
        in_feedback_valid_in_11 => in_feedback_valid_in_11,
        in_predicate => GND_q,
        in_stall_in => SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_backStall,
        in_valid_in => SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V1,
        out_data_out => i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w_out_data_out,
        out_feedback_stall_out_11 => i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w_out_feedback_stall_out_11,
        out_stall_out => i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w_out_stall_out,
        out_valid_out => i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w(BLACKBOX,46)@3
    -- in in_stall_in@20000000
    -- out out_data_out@4
    -- out out_feedback_stall_out_12@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@4
    thei_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w : i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w26
    PORT MAP (
        in_data_in => GND_q,
        in_dir => redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_q,
        in_feedback_in_12 => in_feedback_in_12,
        in_feedback_valid_in_12 => in_feedback_valid_in_12,
        in_predicate => GND_q,
        in_stall_in => SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_backStall,
        in_valid_in => SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V2,
        out_data_out => i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w_out_data_out,
        out_feedback_stall_out_12 => i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w_out_feedback_stall_out_12,
        out_stall_out => i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w_out_stall_out,
        out_valid_out => i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w(BLACKBOX,47)@3
    -- in in_stall_in@20000000
    -- out out_data_out@4
    -- out out_feedback_stall_out_13@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@4
    thei_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w : i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w28
    PORT MAP (
        in_data_in => GND_q,
        in_dir => redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_q,
        in_feedback_in_13 => in_feedback_in_13,
        in_feedback_valid_in_13 => in_feedback_valid_in_13,
        in_predicate => GND_q,
        in_stall_in => SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_backStall,
        in_valid_in => SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V3,
        out_data_out => i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w_out_data_out,
        out_feedback_stall_out_13 => i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w_out_feedback_stall_out_13,
        out_stall_out => i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w_out_stall_out,
        out_valid_out => i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w(BLACKBOX,48)@3
    -- in in_stall_in@20000000
    -- out out_data_out@4
    -- out out_feedback_stall_out_14@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@4
    thei_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w : i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w30
    PORT MAP (
        in_data_in => GND_q,
        in_dir => redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_q,
        in_feedback_in_14 => in_feedback_in_14,
        in_feedback_valid_in_14 => in_feedback_valid_in_14,
        in_predicate => GND_q,
        in_stall_in => SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_backStall,
        in_valid_in => SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V4,
        out_data_out => i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w_out_data_out,
        out_feedback_stall_out_14 => i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w_out_feedback_stall_out_14,
        out_stall_out => i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w_out_stall_out,
        out_valid_out => i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w(BLACKBOX,49)@3
    -- in in_stall_in@20000000
    -- out out_data_out@4
    -- out out_feedback_stall_out_15@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@4
    thei_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w : i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w32
    PORT MAP (
        in_data_in => GND_q,
        in_dir => redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_q,
        in_feedback_in_15 => in_feedback_in_15,
        in_feedback_valid_in_15 => in_feedback_valid_in_15,
        in_predicate => GND_q,
        in_stall_in => SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_backStall,
        in_valid_in => SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V5,
        out_data_out => i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w_out_data_out,
        out_feedback_stall_out_15 => i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w_out_feedback_stall_out_15,
        out_stall_out => i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w_out_stall_out,
        out_valid_out => i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w(BLACKBOX,50)@3
    -- in in_stall_in@20000000
    -- out out_data_out@4
    -- out out_feedback_stall_out_10@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@4
    thei_acl_pop_i1_memdep_phi_pop10_gemm_nn9w : i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w22
    PORT MAP (
        in_data_in => GND_q,
        in_dir => redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_q,
        in_feedback_in_10 => in_feedback_in_10,
        in_feedback_valid_in_10 => in_feedback_valid_in_10,
        in_predicate => GND_q,
        in_stall_in => SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_backStall,
        in_valid_in => SE_redist0_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V6,
        out_data_out => i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w_out_data_out,
        out_feedback_stall_out_10 => i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w_out_feedback_stall_out_10,
        out_stall_out => i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w_out_stall_out,
        out_valid_out => i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_lda_sync_buffer_gemm_nn9w(BLACKBOX,51)@4
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_lda_sync_buffer_gemm_nn9w : i_syncbuf_lda_sync_buffer_gemm_nn9w2
    PORT MAP (
        in_buffer_in => in_lda,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_backStall,
        in_valid_in => SE_out_bubble_out_gemm_nn9W_B1_merge_reg_aunroll_x_1_V0,
        out_buffer_out => i_syncbuf_lda_sync_buffer_gemm_nn9w_out_buffer_out,
        out_stall_out => i_syncbuf_lda_sync_buffer_gemm_nn9w_out_stall_out,
        out_valid_out => i_syncbuf_lda_sync_buffer_gemm_nn9w_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w(STALLENABLE,123)
    -- Valid signal propagation
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_V0 <= SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_backStall <= in_stall_in or not (SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and0 <= i_syncbuf_lda_sync_buffer_gemm_nn9w_out_valid_out;
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and1 <= i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w_out_valid_out and SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and0;
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and2 <= i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w_out_valid_out and SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and1;
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and3 <= i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w_out_valid_out and SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and2;
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and4 <= i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w_out_valid_out and SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and3;
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and5 <= i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w_out_valid_out and SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and4;
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and6 <= i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w_out_valid_out and SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and5;
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and7 <= i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_o_valid and SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and6;
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_wireValid <= SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_V0 and SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_and7;

    -- bubble_join_i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w(BITJOIN,95)
    bubble_join_i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w_q <= i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w_out_data_out;

    -- bubble_select_i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w(BITSELECT,96)
    bubble_select_i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w_b <= STD_LOGIC_VECTOR(bubble_join_i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w_q(0 downto 0));

    -- bubble_join_i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w(BITJOIN,91)
    bubble_join_i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w_q <= i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w_out_data_out;

    -- bubble_select_i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w(BITSELECT,92)
    bubble_select_i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w_b <= STD_LOGIC_VECTOR(bubble_join_i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w_q(0 downto 0));

    -- bubble_join_i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w(BITJOIN,87)
    bubble_join_i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w_q <= i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w_out_data_out;

    -- bubble_select_i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w(BITSELECT,88)
    bubble_select_i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w_b <= STD_LOGIC_VECTOR(bubble_join_i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w_q(0 downto 0));

    -- bubble_join_i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w(BITJOIN,83)
    bubble_join_i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w_q <= i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w_out_data_out;

    -- bubble_select_i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w(BITSELECT,84)
    bubble_select_i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w_b <= STD_LOGIC_VECTOR(bubble_join_i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w_q(0 downto 0));

    -- bubble_join_i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w(BITJOIN,79)
    bubble_join_i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w_q <= i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w_out_data_out;

    -- bubble_select_i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w(BITSELECT,80)
    bubble_select_i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w_b <= STD_LOGIC_VECTOR(bubble_join_i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w_q(0 downto 0));

    -- bubble_join_i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w(BITJOIN,75)
    bubble_join_i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w_q <= i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w_out_data_out;

    -- bubble_select_i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w(BITSELECT,76)
    bubble_select_i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w_b <= STD_LOGIC_VECTOR(bubble_join_i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w_q(0 downto 0));

    -- bubble_join_i_syncbuf_lda_sync_buffer_gemm_nn9w(BITJOIN,99)
    bubble_join_i_syncbuf_lda_sync_buffer_gemm_nn9w_q <= i_syncbuf_lda_sync_buffer_gemm_nn9w_out_buffer_out;

    -- bubble_select_i_syncbuf_lda_sync_buffer_gemm_nn9w(BITSELECT,100)
    bubble_select_i_syncbuf_lda_sync_buffer_gemm_nn9w_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_lda_sync_buffer_gemm_nn9w_q(31 downto 0));

    -- redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0(REG,65)
    redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_backEN = "1") THEN
                redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_q <= STD_LOGIC_VECTOR(SR_SE_redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x(BITJOIN,71)
    bubble_join_i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_q <= i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_c0_exit_3 & i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_c0_exit_2 & i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_c0_exit_1;

    -- bubble_select_i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x(BITSELECT,72)
    bubble_select_i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_q(31 downto 0));
    bubble_select_i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_q(32 downto 32));
    bubble_select_i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_q(33 downto 33));

    -- dupName_0_sync_out_x(GPOUT,6)@4
    out_c0_exe1 <= bubble_select_i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_b;
    out_c0_exe2 <= bubble_select_i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_c;
    out_c0_exe3 <= bubble_select_i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_d;
    out_forked303 <= redist1_gemm_nn9W_B1_merge_reg_aunroll_x_out_data_out_0_3_0_q;
    out_lda_sync_buffer <= bubble_select_i_syncbuf_lda_sync_buffer_gemm_nn9w_b;
    out_memdep_phi261_pop11 <= bubble_select_i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w_b;
    out_memdep_phi266_pop12 <= bubble_select_i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w_b;
    out_memdep_phi269_pop13 <= bubble_select_i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w_b;
    out_memdep_phi272_pop14 <= bubble_select_i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w_b;
    out_memdep_phi274_pop15 <= bubble_select_i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w_b;
    out_memdep_phi_pop10 <= bubble_select_i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w_b;
    out_valid_out <= SE_out_i_syncbuf_lda_sync_buffer_gemm_nn9w_V0;

    -- ext_sig_sync_out(GPOUT,26)
    out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_valid_out <= i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_valid_out;
    out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_stall_out <= i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_stall_out;

    -- feedback_stall_out_10_sync(GPOUT,33)
    out_feedback_stall_out_10 <= i_acl_pop_i1_memdep_phi_pop10_gemm_nn9w_out_feedback_stall_out_10;

    -- feedback_stall_out_11_sync(GPOUT,34)
    out_feedback_stall_out_11 <= i_acl_pop_i1_memdep_phi261_pop11_gemm_nn9w_out_feedback_stall_out_11;

    -- feedback_stall_out_12_sync(GPOUT,35)
    out_feedback_stall_out_12 <= i_acl_pop_i1_memdep_phi266_pop12_gemm_nn9w_out_feedback_stall_out_12;

    -- feedback_stall_out_13_sync(GPOUT,36)
    out_feedback_stall_out_13 <= i_acl_pop_i1_memdep_phi269_pop13_gemm_nn9w_out_feedback_stall_out_13;

    -- feedback_stall_out_14_sync(GPOUT,37)
    out_feedback_stall_out_14 <= i_acl_pop_i1_memdep_phi272_pop14_gemm_nn9w_out_feedback_stall_out_14;

    -- feedback_stall_out_15_sync(GPOUT,38)
    out_feedback_stall_out_15 <= i_acl_pop_i1_memdep_phi274_pop15_gemm_nn9w_out_feedback_stall_out_15;

    -- pipeline_valid_out_sync(GPOUT,55)
    out_pipeline_valid_out <= i_sfc_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w_aunroll_x_out_pipeline_valid_out;

    -- sync_out(GPOUT,60)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
