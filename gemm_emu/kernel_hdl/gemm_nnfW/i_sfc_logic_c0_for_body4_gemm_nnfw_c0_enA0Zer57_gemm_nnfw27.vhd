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

-- VHDL created from i_sfc_logic_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw27
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

entity i_sfc_logic_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw27 is
    port (
        in_B : in std_logic_vector(63 downto 0);  -- ufix64
        in_K : in std_logic_vector(31 downto 0);  -- ufix32
        in_N : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni6_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni6_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni6_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni6_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni6_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni6_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni6_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi12_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi12_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi12_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi12_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi12_4 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi12_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi12_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi12_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi12_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi12_9 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi12_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi12_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi12_12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nnfw_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nnfw_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw27;

architecture normal of i_sfc_logic_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw27 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_pipeline_keep_going_gemm_nnfw29 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_initeration_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_initeration_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_not_exitcond_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_not_exitcond_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_initeration_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_not_exitcond_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_forked46_pop22_gemm_nnfw65 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_22 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_22 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_22 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_notexit2949_pop26_gemm_nnfw73 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_26 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_26 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_26 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_pop25_gemm_nnfw69 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_25 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_25 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw34 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_24 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_24 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_k_182_pop21_gemm_nnfw36 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_21 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_21 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_sdiv_add124_rm47_pop23_gemm_nnfw31 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_23 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_23 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_23 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_forked46_push22_gemm_nnfw67 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_22 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_22 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_22 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_notexit2949_push26_gemm_nnfw75 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_26 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_26 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_26 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_notexitcond_gemm_nnfw63 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_2 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_push25_gemm_nnfw71 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_25 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_25 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_j_089_pop948_push24_gemm_nnfw57 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_24 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_24 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_k_182_push21_gemm_nnfw61 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_21 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_21 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_sdiv_add124_rm47_push23_gemm_nnfw59 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_23 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_23 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_23 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_b_sync_buffer_gemm_nnfw39 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_k_sync_buffer13_gemm_nnfw52 is
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


    component i_syncbuf_k_sync_buffer14_gemm_nnfw49 is
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


    component i_syncbuf_k_sync_buffer_gemm_nnfw45 is
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


    component i_syncbuf_n_sync_buffer12_gemm_nnfw42 is
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


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_add_gemm_nnfw_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_inc6_gemm_nnfw_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul_gemm_nnfw_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_sdiv_add_rm_gemm_nnfw_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv_gemm_nnfw_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_multconst_x_q : STD_LOGIC_VECTOR (61 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_15_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pipeline_keep_going_gemm_nnfw_out_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gemm_nnfw_out_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gemm_nnfw_out_not_exitcond_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gemm_nnfw_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_forked46_pop22_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_forked46_pop22_gemm_nnfw_out_feedback_stall_out_22 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_notexit2949_pop26_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_notexit2949_pop26_gemm_nnfw_out_feedback_stall_out_26 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_pop25_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_pop25_gemm_nnfw_out_feedback_stall_out_25 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_feedback_stall_out_24 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_feedback_stall_out_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_sdiv_add124_rm47_pop23_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_sdiv_add124_rm47_pop23_gemm_nnfw_out_feedback_stall_out_23 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_forked46_push22_gemm_nnfw_out_feedback_out_22 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_forked46_push22_gemm_nnfw_out_feedback_valid_out_22 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_notexit2949_push26_gemm_nnfw_out_feedback_out_26 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_notexit2949_push26_gemm_nnfw_out_feedback_valid_out_26 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_notexitcond_gemm_nnfw_out_feedback_out_2 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_notexitcond_gemm_nnfw_out_feedback_valid_out_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_push25_gemm_nnfw_out_feedback_out_25 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_push25_gemm_nnfw_out_feedback_valid_out_25 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_j_089_pop948_push24_gemm_nnfw_out_feedback_out_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_j_089_pop948_push24_gemm_nnfw_out_feedback_valid_out_24 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_k_182_push21_gemm_nnfw_out_feedback_out_21 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_k_182_push21_gemm_nnfw_out_feedback_valid_out_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_sdiv_add124_rm47_push23_gemm_nnfw_out_feedback_out_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_sdiv_add124_rm47_push23_gemm_nnfw_out_feedback_valid_out_23 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add_gemm_nnfw_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_gemm_nnfw_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_gemm_nnfw_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_gemm_nnfw_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_cmp380_rm_gemm_nnfw_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp380_rm_gemm_nnfw_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp380_rm_gemm_nnfw_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp380_rm_gemm_nnfw_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp3_gemm_nnfw_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp3_gemm_nnfw_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp3_gemm_nnfw_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp3_gemm_nnfw_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp88_rm_gemm_nnfw_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp88_rm_gemm_nnfw_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp88_rm_gemm_nnfw_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp88_rm_gemm_nnfw_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_inc6_gemm_nnfw_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc6_gemm_nnfw_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc6_gemm_nnfw_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc6_gemm_nnfw_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_phi_decision134_xor_rm_gemm_nnfw_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phi_decision134_xor_rm_gemm_nnfw_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sdiv_add_rm_gemm_nnfw_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sdiv_add_rm_gemm_nnfw_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sdiv_add_rm_gemm_nnfw_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sdiv_add_rm_gemm_nnfw_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sdiv_and_rm_gemm_nnfw_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sdiv_and_rm_gemm_nnfw_vt_const_31_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_sdiv_and_rm_gemm_nnfw_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sdiv_and_rm_gemm_nnfw_vt_select_3_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_syncbuf_b_sync_buffer_gemm_nnfw_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_k_sync_buffer13_gemm_nnfw_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_k_sync_buffer14_gemm_nnfw_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_k_sync_buffer_gemm_nnfw_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_n_sync_buffer12_gemm_nnfw_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_gemm_nnfw48_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gemm_nnfw56_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vscale_i_gemm_nnfw_vt_const_3_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_vscale_i_gemm_nnfw_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_vscale_i_gemm_nnfw_vt_select_63_b : STD_LOGIC_VECTOR (59 downto 0);
    signal xMSB_uid124_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal seMsb_to16_uid126_in : STD_LOGIC_VECTOR (15 downto 0);
    signal seMsb_to16_uid126_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx1Rng16_uid127_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx1_uid128_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid130_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid130_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to8_uid131_in : STD_LOGIC_VECTOR (7 downto 0);
    signal seMsb_to8_uid131_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage1Idx1Rng8_uid132_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage1Idx1_uid133_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1_uid135_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid135_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to4_uid136_in : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to4_uid136_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage2Idx1Rng4_uid137_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage2Idx1_uid138_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2_uid140_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid140_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to2_uid141_in : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to2_uid141_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage3Idx1Rng2_uid142_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal rightShiftStage3Idx1_uid143_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage3_uid145_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage3_uid145_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage4Idx1Rng1_uid146_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage4Idx1_uid147_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage4_uid149_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage4_uid149_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xMSB_uid152_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal seMsb_to4_uid154_in : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to4_uid154_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage0Idx1Rng4_uid155_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_b : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage0Idx1_uid156_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xMSB_uid161_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal seMsb_to4_uid163_in : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to4_uid163_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage0Idx1Rng4_uid164_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_b : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage0Idx1_uid165_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_join_13_q : STD_LOGIC_VECTOR (55 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_align_14_q : STD_LOGIC_VECTOR (37 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_align_14_qint : STD_LOGIC_VECTOR (37 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_join_16_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (66 downto 0);
    signal leftShiftStage0Idx1Rng4_uid191_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x_in : STD_LOGIC_VECTOR (59 downto 0);
    signal leftShiftStage0Idx1Rng4_uid191_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x_b : STD_LOGIC_VECTOR (59 downto 0);
    signal leftShiftStage0Idx1_uid192_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage0_uid194_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid194_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul_gemm_nnfw_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul_gemm_nnfw_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul_gemm_nnfw_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_gemm_nnfw_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_gemm_nnfw_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_gemm_nnfw_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_gemm_nnfw_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul_gemm_nnfw_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul_gemm_nnfw_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul_gemm_nnfw_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul_gemm_nnfw_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul_gemm_nnfw_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul_gemm_nnfw_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul_gemm_nnfw_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul_gemm_nnfw_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul_gemm_nnfw_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul_gemm_nnfw_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (10 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul_gemm_nnfw_im0_cma_reset : std_logic;
    type i_mul_gemm_nnfw_im0_cma_a0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal i_mul_gemm_nnfw_im0_cma_a0 : i_mul_gemm_nnfw_im0_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of i_mul_gemm_nnfw_im0_cma_a0 : signal is true;
    signal i_mul_gemm_nnfw_im0_cma_c0 : i_mul_gemm_nnfw_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul_gemm_nnfw_im0_cma_c0 : signal is true;
    type i_mul_gemm_nnfw_im0_cma_ptype is array(NATURAL range <>) of UNSIGNED(35 downto 0);
    signal i_mul_gemm_nnfw_im0_cma_p : i_mul_gemm_nnfw_im0_cma_ptype(0 to 0);
    signal i_mul_gemm_nnfw_im0_cma_u : i_mul_gemm_nnfw_im0_cma_ptype(0 to 0);
    signal i_mul_gemm_nnfw_im0_cma_w : i_mul_gemm_nnfw_im0_cma_ptype(0 to 0);
    signal i_mul_gemm_nnfw_im0_cma_x : i_mul_gemm_nnfw_im0_cma_ptype(0 to 0);
    signal i_mul_gemm_nnfw_im0_cma_y : i_mul_gemm_nnfw_im0_cma_ptype(0 to 0);
    signal i_mul_gemm_nnfw_im0_cma_s : i_mul_gemm_nnfw_im0_cma_ptype(0 to 0);
    signal i_mul_gemm_nnfw_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul_gemm_nnfw_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul_gemm_nnfw_im0_cma_ena0 : std_logic;
    signal i_mul_gemm_nnfw_im0_cma_ena1 : std_logic;
    signal i_mul_gemm_nnfw_im10_cma_reset : std_logic;
    type i_mul_gemm_nnfw_im10_cma_a0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal i_mul_gemm_nnfw_im10_cma_a0 : i_mul_gemm_nnfw_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul_gemm_nnfw_im10_cma_a0 : signal is true;
    signal i_mul_gemm_nnfw_im10_cma_c0 : i_mul_gemm_nnfw_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul_gemm_nnfw_im10_cma_c0 : signal is true;
    type i_mul_gemm_nnfw_im10_cma_ptype is array(NATURAL range <>) of UNSIGNED(27 downto 0);
    signal i_mul_gemm_nnfw_im10_cma_p : i_mul_gemm_nnfw_im10_cma_ptype(0 to 0);
    signal i_mul_gemm_nnfw_im10_cma_u : i_mul_gemm_nnfw_im10_cma_ptype(0 to 0);
    signal i_mul_gemm_nnfw_im10_cma_w : i_mul_gemm_nnfw_im10_cma_ptype(0 to 0);
    signal i_mul_gemm_nnfw_im10_cma_x : i_mul_gemm_nnfw_im10_cma_ptype(0 to 0);
    signal i_mul_gemm_nnfw_im10_cma_y : i_mul_gemm_nnfw_im10_cma_ptype(0 to 0);
    signal i_mul_gemm_nnfw_im10_cma_s : i_mul_gemm_nnfw_im10_cma_ptype(0 to 0);
    signal i_mul_gemm_nnfw_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul_gemm_nnfw_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul_gemm_nnfw_im10_cma_ena0 : std_logic;
    signal i_mul_gemm_nnfw_im10_cma_ena1 : std_logic;
    signal i_mul_gemm_nnfw_ma3_cma_reset : std_logic;
    signal i_mul_gemm_nnfw_ma3_cma_a0 : i_mul_gemm_nnfw_im10_cma_a0type(0 to 1);
    attribute preserve of i_mul_gemm_nnfw_ma3_cma_a0 : signal is true;
    type i_mul_gemm_nnfw_ma3_cma_c0type is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal i_mul_gemm_nnfw_ma3_cma_c0 : i_mul_gemm_nnfw_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul_gemm_nnfw_ma3_cma_c0 : signal is true;
    type i_mul_gemm_nnfw_ma3_cma_ltype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal i_mul_gemm_nnfw_ma3_cma_l : i_mul_gemm_nnfw_ma3_cma_ltype(0 to 1);
    type i_mul_gemm_nnfw_ma3_cma_ptype is array(NATURAL range <>) of SIGNED(33 downto 0);
    signal i_mul_gemm_nnfw_ma3_cma_p : i_mul_gemm_nnfw_ma3_cma_ptype(0 to 1);
    type i_mul_gemm_nnfw_ma3_cma_utype is array(NATURAL range <>) of SIGNED(34 downto 0);
    signal i_mul_gemm_nnfw_ma3_cma_u : i_mul_gemm_nnfw_ma3_cma_utype(0 to 1);
    signal i_mul_gemm_nnfw_ma3_cma_w : i_mul_gemm_nnfw_ma3_cma_utype(0 to 0);
    signal i_mul_gemm_nnfw_ma3_cma_x : i_mul_gemm_nnfw_ma3_cma_utype(0 to 0);
    signal i_mul_gemm_nnfw_ma3_cma_y : i_mul_gemm_nnfw_ma3_cma_utype(0 to 0);
    signal i_mul_gemm_nnfw_ma3_cma_s : i_mul_gemm_nnfw_ma3_cma_utype(0 to 0);
    signal i_mul_gemm_nnfw_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul_gemm_nnfw_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul_gemm_nnfw_ma3_cma_ena0 : std_logic;
    signal i_mul_gemm_nnfw_ma3_cma_ena1 : std_logic;
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_gemm_nnfw_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_gemm_nnfw_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal redist0_i_mul_gemm_nnfw_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist1_i_mul_gemm_nnfw_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist2_i_mul_gemm_nnfw_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist5_i_unnamed_gemm_nnfw56_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_unnamed_gemm_nnfw56_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_phi_decision134_xor_rm_gemm_nnfw_q_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_cmp88_rm_gemm_nnfw_c_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_cmp380_rm_gemm_nnfw_c_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_6_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_i_acl_pop_i1_pop25_gemm_nnfw_out_data_out_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_acl_pop_i1_pop25_gemm_nnfw_out_data_out_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_i_acl_pop_i1_notexit2949_pop26_gemm_nnfw_out_data_out_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_i_acl_pop_i1_notexit2949_pop26_gemm_nnfw_out_data_out_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_i_acl_pop_i1_forked46_pop22_gemm_nnfw_out_data_out_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_i_acl_pop_i1_forked46_pop22_gemm_nnfw_out_data_out_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_sync_in_aunroll_x_in_i_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_sync_in_aunroll_x_in_i_valid_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_i_vloadgep_i_gemm_nnfw_gemm_nnfw41_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist23_bgTrunc_i_mul_gemm_nnfw_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist24_bgTrunc_i_add_gemm_nnfw_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_reset0 : std_logic;
    signal redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_rdcnt_i : signal is true;
    signal redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_sticky_ena_q : signal is true;
    signal redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_reset0 : std_logic;
    signal redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt_i : signal is true;
    signal redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt_eq : std_logic;
    attribute preserve of redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt_eq : signal is true;
    signal redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_sticky_ena_q : signal is true;
    signal redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_mem_reset0 : std_logic;
    signal redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_rdcnt_i : signal is true;
    signal redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_sticky_ena_q : signal is true;
    signal redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_reset0 : std_logic;
    signal redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt_i : signal is true;
    signal redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt_eq : std_logic;
    attribute preserve of redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt_eq : signal is true;
    signal redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_last_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_sticky_ena_q : signal is true;
    signal redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist20_sync_in_aunroll_x_in_i_valid_1(DELAY,246)
    redist20_sync_in_aunroll_x_in_i_valid_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist20_sync_in_aunroll_x_in_i_valid_1_q, clk => clock, aclr => resetn );

    -- redist21_sync_in_aunroll_x_in_i_valid_6(DELAY,247)
    redist21_sync_in_aunroll_x_in_i_valid_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist20_sync_in_aunroll_x_in_i_valid_1_q, xout => redist21_sync_in_aunroll_x_in_i_valid_6_q, clk => clock, aclr => resetn );

    -- xMSB_uid161_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x(BITSELECT,160)@1
    xMSB_uid161_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_b <= STD_LOGIC_VECTOR(bgTrunc_i_sdiv_add_rm_gemm_nnfw_sel_x_b(31 downto 31));

    -- seMsb_to4_uid163(BITSELECT,162)@1
    seMsb_to4_uid163_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 1 => xMSB_uid161_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_b(0)) & xMSB_uid161_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_b));
    seMsb_to4_uid163_b <= STD_LOGIC_VECTOR(seMsb_to4_uid163_in(3 downto 0));

    -- rightShiftStage0Idx1Rng4_uid164_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x(BITSELECT,163)@1
    rightShiftStage0Idx1Rng4_uid164_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_b <= bgTrunc_i_sdiv_add_rm_gemm_nnfw_sel_x_b(31 downto 4);

    -- rightShiftStage0Idx1_uid165_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x(BITJOIN,164)@1
    rightShiftStage0Idx1_uid165_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q <= seMsb_to4_uid163_b & rightShiftStage0Idx1Rng4_uid164_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_b;

    -- i_syncbuf_k_sync_buffer13_gemm_nnfw(BLACKBOX,104)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_k_sync_buffer13_gemm_nnfw : i_syncbuf_k_sync_buffer13_gemm_nnfw52
    PORT MAP (
        in_buffer_in => in_K,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_k_sync_buffer13_gemm_nnfw_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_sdiv_and_rm_gemm_nnfw_vt_const_31(CONSTANT,100)
    i_sdiv_and_rm_gemm_nnfw_vt_const_31_q <= "0000000000000000000000000000";

    -- c_i32_15(CONSTANT,68)
    c_i32_15_q <= "00000000000000000000000000001111";

    -- i_syncbuf_k_sync_buffer14_gemm_nnfw(BLACKBOX,105)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_k_sync_buffer14_gemm_nnfw : i_syncbuf_k_sync_buffer14_gemm_nnfw49
    PORT MAP (
        in_buffer_in => in_K,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_k_sync_buffer14_gemm_nnfw_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- xMSB_uid124_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x(BITSELECT,123)@1
    xMSB_uid124_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b <= STD_LOGIC_VECTOR(i_syncbuf_k_sync_buffer14_gemm_nnfw_out_buffer_out(31 downto 31));

    -- rightShiftStage4Idx1Rng1_uid146_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x(BITSELECT,145)@1
    rightShiftStage4Idx1Rng1_uid146_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b <= rightShiftStage3_uid145_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q(31 downto 1);

    -- rightShiftStage4Idx1_uid147_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x(BITJOIN,146)@1
    rightShiftStage4Idx1_uid147_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q <= xMSB_uid124_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b & rightShiftStage4Idx1Rng1_uid146_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b;

    -- seMsb_to2_uid141(BITSELECT,140)@1
    seMsb_to2_uid141_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => xMSB_uid124_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b(0)) & xMSB_uid124_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b));
    seMsb_to2_uid141_b <= STD_LOGIC_VECTOR(seMsb_to2_uid141_in(1 downto 0));

    -- rightShiftStage3Idx1Rng2_uid142_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x(BITSELECT,141)@1
    rightShiftStage3Idx1Rng2_uid142_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b <= rightShiftStage2_uid140_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q(31 downto 2);

    -- rightShiftStage3Idx1_uid143_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x(BITJOIN,142)@1
    rightShiftStage3Idx1_uid143_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q <= seMsb_to2_uid141_b & rightShiftStage3Idx1Rng2_uid142_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b;

    -- seMsb_to4_uid136(BITSELECT,135)@1
    seMsb_to4_uid136_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 1 => xMSB_uid124_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b(0)) & xMSB_uid124_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b));
    seMsb_to4_uid136_b <= STD_LOGIC_VECTOR(seMsb_to4_uid136_in(3 downto 0));

    -- rightShiftStage2Idx1Rng4_uid137_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x(BITSELECT,136)@1
    rightShiftStage2Idx1Rng4_uid137_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b <= rightShiftStage1_uid135_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q(31 downto 4);

    -- rightShiftStage2Idx1_uid138_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x(BITJOIN,137)@1
    rightShiftStage2Idx1_uid138_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q <= seMsb_to4_uid136_b & rightShiftStage2Idx1Rng4_uid137_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b;

    -- seMsb_to8_uid131(BITSELECT,130)@1
    seMsb_to8_uid131_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 1 => xMSB_uid124_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b(0)) & xMSB_uid124_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b));
    seMsb_to8_uid131_b <= STD_LOGIC_VECTOR(seMsb_to8_uid131_in(7 downto 0));

    -- rightShiftStage1Idx1Rng8_uid132_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x(BITSELECT,131)@1
    rightShiftStage1Idx1Rng8_uid132_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b <= rightShiftStage0_uid130_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q(31 downto 8);

    -- rightShiftStage1Idx1_uid133_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x(BITJOIN,132)@1
    rightShiftStage1Idx1_uid133_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q <= seMsb_to8_uid131_b & rightShiftStage1Idx1Rng8_uid132_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b;

    -- seMsb_to16_uid126(BITSELECT,125)@1
    seMsb_to16_uid126_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 1 => xMSB_uid124_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b(0)) & xMSB_uid124_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b));
    seMsb_to16_uid126_b <= STD_LOGIC_VECTOR(seMsb_to16_uid126_in(15 downto 0));

    -- rightShiftStage0Idx1Rng16_uid127_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x(BITSELECT,126)@1
    rightShiftStage0Idx1Rng16_uid127_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b <= i_syncbuf_k_sync_buffer14_gemm_nnfw_out_buffer_out(31 downto 16);

    -- rightShiftStage0Idx1_uid128_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x(BITJOIN,127)@1
    rightShiftStage0Idx1_uid128_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q <= seMsb_to16_uid126_b & rightShiftStage0Idx1Rng16_uid127_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_b;

    -- rightShiftStage0_uid130_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x(MUX,129)@1
    rightShiftStage0_uid130_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_s <= VCC_q;
    rightShiftStage0_uid130_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_combproc: PROCESS (rightShiftStage0_uid130_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_s, i_syncbuf_k_sync_buffer14_gemm_nnfw_out_buffer_out, rightShiftStage0Idx1_uid128_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid130_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid130_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q <= i_syncbuf_k_sync_buffer14_gemm_nnfw_out_buffer_out;
            WHEN "1" => rightShiftStage0_uid130_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q <= rightShiftStage0Idx1_uid128_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid130_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid135_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x(MUX,134)@1
    rightShiftStage1_uid135_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_s <= VCC_q;
    rightShiftStage1_uid135_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_combproc: PROCESS (rightShiftStage1_uid135_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_s, rightShiftStage0_uid130_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q, rightShiftStage1Idx1_uid133_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q)
    BEGIN
        CASE (rightShiftStage1_uid135_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_s) IS
            WHEN "0" => rightShiftStage1_uid135_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q <= rightShiftStage0_uid130_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q;
            WHEN "1" => rightShiftStage1_uid135_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q <= rightShiftStage1Idx1_uid133_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q;
            WHEN OTHERS => rightShiftStage1_uid135_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage2_uid140_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x(MUX,139)@1
    rightShiftStage2_uid140_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_s <= VCC_q;
    rightShiftStage2_uid140_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_combproc: PROCESS (rightShiftStage2_uid140_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_s, rightShiftStage1_uid135_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q, rightShiftStage2Idx1_uid138_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q)
    BEGIN
        CASE (rightShiftStage2_uid140_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_s) IS
            WHEN "0" => rightShiftStage2_uid140_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q <= rightShiftStage1_uid135_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q;
            WHEN "1" => rightShiftStage2_uid140_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q <= rightShiftStage2Idx1_uid138_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q;
            WHEN OTHERS => rightShiftStage2_uid140_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage3_uid145_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x(MUX,144)@1
    rightShiftStage3_uid145_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_s <= VCC_q;
    rightShiftStage3_uid145_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_combproc: PROCESS (rightShiftStage3_uid145_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_s, rightShiftStage2_uid140_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q, rightShiftStage3Idx1_uid143_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q)
    BEGIN
        CASE (rightShiftStage3_uid145_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_s) IS
            WHEN "0" => rightShiftStage3_uid145_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q <= rightShiftStage2_uid140_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q;
            WHEN "1" => rightShiftStage3_uid145_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q <= rightShiftStage3Idx1_uid143_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q;
            WHEN OTHERS => rightShiftStage3_uid145_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage4_uid149_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x(MUX,148)@1
    rightShiftStage4_uid149_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_s <= VCC_q;
    rightShiftStage4_uid149_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_combproc: PROCESS (rightShiftStage4_uid149_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_s, rightShiftStage3_uid145_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q, rightShiftStage4Idx1_uid147_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q)
    BEGIN
        CASE (rightShiftStage4_uid149_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_s) IS
            WHEN "0" => rightShiftStage4_uid149_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q <= rightShiftStage3_uid145_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q;
            WHEN "1" => rightShiftStage4_uid149_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q <= rightShiftStage4Idx1_uid147_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q;
            WHEN OTHERS => rightShiftStage4_uid149_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_sdiv_and_rm_gemm_nnfw(LOGICAL,99)@1
    i_sdiv_and_rm_gemm_nnfw_q <= rightShiftStage4_uid149_i_sdiv_mask_rm_gemm_nnfw_gemm_nnfw51_shift_x_q and c_i32_15_q;

    -- i_sdiv_and_rm_gemm_nnfw_vt_select_3(BITSELECT,102)@1
    i_sdiv_and_rm_gemm_nnfw_vt_select_3_b <= i_sdiv_and_rm_gemm_nnfw_q(3 downto 0);

    -- i_sdiv_and_rm_gemm_nnfw_vt_join(BITJOIN,101)@1
    i_sdiv_and_rm_gemm_nnfw_vt_join_q <= i_sdiv_and_rm_gemm_nnfw_vt_const_31_q & i_sdiv_and_rm_gemm_nnfw_vt_select_3_b;

    -- i_sdiv_add_rm_gemm_nnfw(ADD,98)@1
    i_sdiv_add_rm_gemm_nnfw_a <= STD_LOGIC_VECTOR("0" & i_sdiv_and_rm_gemm_nnfw_vt_join_q);
    i_sdiv_add_rm_gemm_nnfw_b <= STD_LOGIC_VECTOR("0" & i_syncbuf_k_sync_buffer13_gemm_nnfw_out_buffer_out);
    i_sdiv_add_rm_gemm_nnfw_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sdiv_add_rm_gemm_nnfw_a) + UNSIGNED(i_sdiv_add_rm_gemm_nnfw_b));
    i_sdiv_add_rm_gemm_nnfw_q <= i_sdiv_add_rm_gemm_nnfw_o(32 downto 0);

    -- bgTrunc_i_sdiv_add_rm_gemm_nnfw_sel_x(BITSELECT,5)@1
    bgTrunc_i_sdiv_add_rm_gemm_nnfw_sel_x_b <= i_sdiv_add_rm_gemm_nnfw_q(31 downto 0);

    -- rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x(MUX,166)@1
    rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_s <= VCC_q;
    rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_combproc: PROCESS (rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_s, bgTrunc_i_sdiv_add_rm_gemm_nnfw_sel_x_b, rightShiftStage0Idx1_uid165_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q <= bgTrunc_i_sdiv_add_rm_gemm_nnfw_sel_x_b;
            WHEN "1" => rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q <= rightShiftStage0Idx1_uid165_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- c_i32_1gr(CONSTANT,69)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- i_acl_push_i32_k_182_push21_gemm_nnfw(BLACKBOX,86)@1
    -- out out_feedback_out_21@20000000
    -- out out_feedback_valid_out_21@20000000
    thei_acl_push_i32_k_182_push21_gemm_nnfw : i_acl_push_i32_k_182_push21_gemm_nnfw61
    PORT MAP (
        in_data_in => bgTrunc_i_inc6_gemm_nnfw_sel_x_b,
        in_feedback_stall_in_21 => i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_feedback_stall_out_21,
        in_stall_in => GND_q,
        in_unnamed_gemm_nnfW10 => i_unnamed_gemm_nnfw56_q,
        in_valid_in => in_i_valid,
        out_feedback_out_21 => i_acl_push_i32_k_182_push21_gemm_nnfw_out_feedback_out_21,
        out_feedback_valid_out_21 => i_acl_push_i32_k_182_push21_gemm_nnfw_out_feedback_valid_out_21,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_0gr(CONSTANT,67)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- i_acl_pop_i32_k_182_pop21_gemm_nnfw(BLACKBOX,79)@1
    -- out out_feedback_stall_out_21@20000000
    thei_acl_pop_i32_k_182_pop21_gemm_nnfw : i_acl_pop_i32_k_182_pop21_gemm_nnfw36
    PORT MAP (
        in_data_in => c_i32_0gr_q,
        in_dir => in_c0_eni6_2,
        in_feedback_in_21 => i_acl_push_i32_k_182_push21_gemm_nnfw_out_feedback_out_21,
        in_feedback_valid_in_21 => i_acl_push_i32_k_182_push21_gemm_nnfw_out_feedback_valid_out_21,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out,
        out_feedback_stall_out_21 => i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_feedback_stall_out_21,
        clock => clock,
        resetn => resetn
    );

    -- i_inc6_gemm_nnfw(ADD,94)@1
    i_inc6_gemm_nnfw_a <= STD_LOGIC_VECTOR("0" & i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out);
    i_inc6_gemm_nnfw_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc6_gemm_nnfw_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc6_gemm_nnfw_a) + UNSIGNED(i_inc6_gemm_nnfw_b));
    i_inc6_gemm_nnfw_q <= i_inc6_gemm_nnfw_o(32 downto 0);

    -- bgTrunc_i_inc6_gemm_nnfw_sel_x(BITSELECT,3)@1
    bgTrunc_i_inc6_gemm_nnfw_sel_x_b <= i_inc6_gemm_nnfw_q(31 downto 0);

    -- i_cmp3_gemm_nnfw(COMPARE,90)@1
    i_cmp3_gemm_nnfw_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => bgTrunc_i_inc6_gemm_nnfw_sel_x_b(31)) & bgTrunc_i_inc6_gemm_nnfw_sel_x_b));
    i_cmp3_gemm_nnfw_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q(31)) & rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q));
    i_cmp3_gemm_nnfw_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp3_gemm_nnfw_a) - SIGNED(i_cmp3_gemm_nnfw_b));
    i_cmp3_gemm_nnfw_c(0) <= i_cmp3_gemm_nnfw_o(33);

    -- i_syncbuf_k_sync_buffer_gemm_nnfw(BLACKBOX,106)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_k_sync_buffer_gemm_nnfw : i_syncbuf_k_sync_buffer_gemm_nnfw45
    PORT MAP (
        in_buffer_in => in_K,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_k_sync_buffer_gemm_nnfw_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_cmp380_rm_gemm_nnfw(COMPARE,89)@1
    i_cmp380_rm_gemm_nnfw_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_15_q(31)) & c_i32_15_q));
    i_cmp380_rm_gemm_nnfw_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_k_sync_buffer_gemm_nnfw_out_buffer_out(31)) & i_syncbuf_k_sync_buffer_gemm_nnfw_out_buffer_out));
    i_cmp380_rm_gemm_nnfw_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp380_rm_gemm_nnfw_a) - SIGNED(i_cmp380_rm_gemm_nnfw_b));
    i_cmp380_rm_gemm_nnfw_c(0) <= i_cmp380_rm_gemm_nnfw_o(33);

    -- i_syncbuf_n_sync_buffer12_gemm_nnfw(BLACKBOX,107)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_n_sync_buffer12_gemm_nnfw : i_syncbuf_n_sync_buffer12_gemm_nnfw42
    PORT MAP (
        in_buffer_in => in_N,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_n_sync_buffer12_gemm_nnfw_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_cmp88_rm_gemm_nnfw(COMPARE,91)@1
    i_cmp88_rm_gemm_nnfw_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_0gr_q(31)) & c_i32_0gr_q));
    i_cmp88_rm_gemm_nnfw_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_n_sync_buffer12_gemm_nnfw_out_buffer_out(31)) & i_syncbuf_n_sync_buffer12_gemm_nnfw_out_buffer_out));
    i_cmp88_rm_gemm_nnfw_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp88_rm_gemm_nnfw_a) - SIGNED(i_cmp88_rm_gemm_nnfw_b));
    i_cmp88_rm_gemm_nnfw_c(0) <= i_cmp88_rm_gemm_nnfw_o(33);

    -- i_unnamed_gemm_nnfw48(LOGICAL,108)@1
    i_unnamed_gemm_nnfw48_q <= i_cmp88_rm_gemm_nnfw_c and i_cmp380_rm_gemm_nnfw_c;

    -- i_unnamed_gemm_nnfw56(LOGICAL,109)@1
    i_unnamed_gemm_nnfw56_q <= i_unnamed_gemm_nnfw48_q and i_cmp3_gemm_nnfw_c;

    -- redist5_i_unnamed_gemm_nnfw56_q_1(DELAY,231)
    redist5_i_unnamed_gemm_nnfw56_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gemm_nnfw56_q, xout => redist5_i_unnamed_gemm_nnfw56_q_1_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_notexit2949_push26_gemm_nnfw(BLACKBOX,82)@2
    -- out out_feedback_out_26@20000000
    -- out out_feedback_valid_out_26@20000000
    thei_acl_push_i1_notexit2949_push26_gemm_nnfw : i_acl_push_i1_notexit2949_push26_gemm_nnfw75
    PORT MAP (
        in_data_in => redist16_i_acl_pop_i1_notexit2949_pop26_gemm_nnfw_out_data_out_1_q,
        in_feedback_stall_in_26 => i_acl_pop_i1_notexit2949_pop26_gemm_nnfw_out_feedback_stall_out_26,
        in_stall_in => GND_q,
        in_unnamed_gemm_nnfW10 => redist5_i_unnamed_gemm_nnfw56_q_1_q,
        in_valid_in => redist20_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_26 => i_acl_push_i1_notexit2949_push26_gemm_nnfw_out_feedback_out_26,
        out_feedback_valid_out_26 => i_acl_push_i1_notexit2949_push26_gemm_nnfw_out_feedback_valid_out_26,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_notexit2949_pop26_gemm_nnfw(BLACKBOX,76)@1
    -- out out_feedback_stall_out_26@20000000
    thei_acl_pop_i1_notexit2949_pop26_gemm_nnfw : i_acl_pop_i1_notexit2949_pop26_gemm_nnfw73
    PORT MAP (
        in_data_in => in_c0_eni6_6,
        in_dir => in_c0_eni6_2,
        in_feedback_in_26 => i_acl_push_i1_notexit2949_push26_gemm_nnfw_out_feedback_out_26,
        in_feedback_valid_in_26 => i_acl_push_i1_notexit2949_push26_gemm_nnfw_out_feedback_valid_out_26,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_notexit2949_pop26_gemm_nnfw_out_data_out,
        out_feedback_stall_out_26 => i_acl_pop_i1_notexit2949_pop26_gemm_nnfw_out_feedback_stall_out_26,
        clock => clock,
        resetn => resetn
    );

    -- redist16_i_acl_pop_i1_notexit2949_pop26_gemm_nnfw_out_data_out_1(DELAY,242)
    redist16_i_acl_pop_i1_notexit2949_pop26_gemm_nnfw_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_notexit2949_pop26_gemm_nnfw_out_data_out, xout => redist16_i_acl_pop_i1_notexit2949_pop26_gemm_nnfw_out_data_out_1_q, clk => clock, aclr => resetn );

    -- redist17_i_acl_pop_i1_notexit2949_pop26_gemm_nnfw_out_data_out_6(DELAY,243)
    redist17_i_acl_pop_i1_notexit2949_pop26_gemm_nnfw_out_data_out_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist16_i_acl_pop_i1_notexit2949_pop26_gemm_nnfw_out_data_out_1_q, xout => redist17_i_acl_pop_i1_notexit2949_pop26_gemm_nnfw_out_data_out_6_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_push25_gemm_nnfw(BLACKBOX,84)@2
    -- out out_feedback_out_25@20000000
    -- out out_feedback_valid_out_25@20000000
    thei_acl_push_i1_push25_gemm_nnfw : i_acl_push_i1_push25_gemm_nnfw71
    PORT MAP (
        in_data_in => redist14_i_acl_pop_i1_pop25_gemm_nnfw_out_data_out_1_q,
        in_feedback_stall_in_25 => i_acl_pop_i1_pop25_gemm_nnfw_out_feedback_stall_out_25,
        in_stall_in => GND_q,
        in_unnamed_gemm_nnfW10 => redist5_i_unnamed_gemm_nnfw56_q_1_q,
        in_valid_in => redist20_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_25 => i_acl_push_i1_push25_gemm_nnfw_out_feedback_out_25,
        out_feedback_valid_out_25 => i_acl_push_i1_push25_gemm_nnfw_out_feedback_valid_out_25,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_pop25_gemm_nnfw(BLACKBOX,77)@1
    -- out out_feedback_stall_out_25@20000000
    thei_acl_pop_i1_pop25_gemm_nnfw : i_acl_pop_i1_pop25_gemm_nnfw69
    PORT MAP (
        in_data_in => in_c0_eni6_5,
        in_dir => in_c0_eni6_2,
        in_feedback_in_25 => i_acl_push_i1_push25_gemm_nnfw_out_feedback_out_25,
        in_feedback_valid_in_25 => i_acl_push_i1_push25_gemm_nnfw_out_feedback_valid_out_25,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_pop25_gemm_nnfw_out_data_out,
        out_feedback_stall_out_25 => i_acl_pop_i1_pop25_gemm_nnfw_out_feedback_stall_out_25,
        clock => clock,
        resetn => resetn
    );

    -- redist14_i_acl_pop_i1_pop25_gemm_nnfw_out_data_out_1(DELAY,240)
    redist14_i_acl_pop_i1_pop25_gemm_nnfw_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_pop25_gemm_nnfw_out_data_out, xout => redist14_i_acl_pop_i1_pop25_gemm_nnfw_out_data_out_1_q, clk => clock, aclr => resetn );

    -- redist15_i_acl_pop_i1_pop25_gemm_nnfw_out_data_out_6(DELAY,241)
    redist15_i_acl_pop_i1_pop25_gemm_nnfw_out_data_out_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist14_i_acl_pop_i1_pop25_gemm_nnfw_out_data_out_1_q, xout => redist15_i_acl_pop_i1_pop25_gemm_nnfw_out_data_out_6_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_forked46_push22_gemm_nnfw(BLACKBOX,81)@2
    -- out out_feedback_out_22@20000000
    -- out out_feedback_valid_out_22@20000000
    thei_acl_push_i1_forked46_push22_gemm_nnfw : i_acl_push_i1_forked46_push22_gemm_nnfw67
    PORT MAP (
        in_data_in => redist18_i_acl_pop_i1_forked46_pop22_gemm_nnfw_out_data_out_1_q,
        in_feedback_stall_in_22 => i_acl_pop_i1_forked46_pop22_gemm_nnfw_out_feedback_stall_out_22,
        in_stall_in => GND_q,
        in_unnamed_gemm_nnfW10 => redist5_i_unnamed_gemm_nnfw56_q_1_q,
        in_valid_in => redist20_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_22 => i_acl_push_i1_forked46_push22_gemm_nnfw_out_feedback_out_22,
        out_feedback_valid_out_22 => i_acl_push_i1_forked46_push22_gemm_nnfw_out_feedback_valid_out_22,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_forked46_pop22_gemm_nnfw(BLACKBOX,75)@1
    -- out out_feedback_stall_out_22@20000000
    thei_acl_pop_i1_forked46_pop22_gemm_nnfw : i_acl_pop_i1_forked46_pop22_gemm_nnfw65
    PORT MAP (
        in_data_in => in_c0_eni6_4,
        in_dir => in_c0_eni6_2,
        in_feedback_in_22 => i_acl_push_i1_forked46_push22_gemm_nnfw_out_feedback_out_22,
        in_feedback_valid_in_22 => i_acl_push_i1_forked46_push22_gemm_nnfw_out_feedback_valid_out_22,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_forked46_pop22_gemm_nnfw_out_data_out,
        out_feedback_stall_out_22 => i_acl_pop_i1_forked46_pop22_gemm_nnfw_out_feedback_stall_out_22,
        clock => clock,
        resetn => resetn
    );

    -- redist18_i_acl_pop_i1_forked46_pop22_gemm_nnfw_out_data_out_1(DELAY,244)
    redist18_i_acl_pop_i1_forked46_pop22_gemm_nnfw_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_forked46_pop22_gemm_nnfw_out_data_out, xout => redist18_i_acl_pop_i1_forked46_pop22_gemm_nnfw_out_data_out_1_q, clk => clock, aclr => resetn );

    -- redist19_i_acl_pop_i1_forked46_pop22_gemm_nnfw_out_data_out_6(DELAY,245)
    redist19_i_acl_pop_i1_forked46_pop22_gemm_nnfw_out_data_out_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist18_i_acl_pop_i1_forked46_pop22_gemm_nnfw_out_data_out_1_q, xout => redist19_i_acl_pop_i1_forked46_pop22_gemm_nnfw_out_data_out_6_q, clk => clock, aclr => resetn );

    -- redist6_i_unnamed_gemm_nnfw56_q_6(DELAY,232)
    redist6_i_unnamed_gemm_nnfw56_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist5_i_unnamed_gemm_nnfw56_q_1_q, xout => redist6_i_unnamed_gemm_nnfw56_q_6_q, clk => clock, aclr => resetn );

    -- redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_notEnable(LOGICAL,258)
    redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_nor(LOGICAL,259)
    redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_nor_q <= not (redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_notEnable_q or redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_sticky_ena_q);

    -- redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_last(CONSTANT,255)
    redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_last_q <= "010";

    -- redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_cmp(LOGICAL,256)
    redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_cmp_b <= STD_LOGIC_VECTOR("0" & redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_rdcnt_q);
    redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_cmp_q <= "1" WHEN redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_last_q = redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_cmp_b ELSE "0";

    -- redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_cmpReg(REG,257)
    redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_cmpReg_q <= STD_LOGIC_VECTOR(redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_cmp_q);
        END IF;
    END PROCESS;

    -- redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_sticky_ena(REG,260)
    redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_nor_q = "1") THEN
                redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_sticky_ena_q <= STD_LOGIC_VECTOR(redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_enaAnd(LOGICAL,261)
    redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_enaAnd_q <= redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_sticky_ena_q and VCC_q;

    -- redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_rdcnt(COUNTER,253)
    -- low=0, high=3, step=1, init=0
    redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_rdcnt_i <= TO_UNSIGNED(0, 2);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_rdcnt_i <= redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_rdcnt_i, 2)));

    -- redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_inputreg(DELAY,251)
    redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q, xout => redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_inputreg_q, clk => clock, aclr => resetn );

    -- redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_wraddr(REG,254)
    redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_wraddr_q <= "11";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_wraddr_q <= STD_LOGIC_VECTOR(redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem(DUALMEM,252)
    redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_ia <= STD_LOGIC_VECTOR(redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_inputreg_q);
    redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_aa <= redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_wraddr_q;
    redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_ab <= redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_rdcnt_q;
    redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_reset0 <= not (resetn);
    redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 32,
        widthad_b => 2,
        numwords_b => 4,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_reset0,
        clock1 => clock,
        address_a => redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_aa,
        data_a => redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_ab,
        q_b => redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_iq
    );
    redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_q <= redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_iq(31 downto 0);

    -- i_phi_decision134_xor_rm_gemm_nnfw(LOGICAL,97)@1 + 1
    i_phi_decision134_xor_rm_gemm_nnfw_qi <= i_unnamed_gemm_nnfw48_q xor VCC_q;
    i_phi_decision134_xor_rm_gemm_nnfw_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_phi_decision134_xor_rm_gemm_nnfw_qi, xout => i_phi_decision134_xor_rm_gemm_nnfw_q, clk => clock, aclr => resetn );

    -- redist7_i_phi_decision134_xor_rm_gemm_nnfw_q_6(DELAY,233)
    redist7_i_phi_decision134_xor_rm_gemm_nnfw_q_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_phi_decision134_xor_rm_gemm_nnfw_q, xout => redist7_i_phi_decision134_xor_rm_gemm_nnfw_q_6_q, clk => clock, aclr => resetn );

    -- redist9_i_cmp380_rm_gemm_nnfw_c_6(DELAY,235)
    redist9_i_cmp380_rm_gemm_nnfw_c_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp380_rm_gemm_nnfw_c, xout => redist9_i_cmp380_rm_gemm_nnfw_c_6_q, clk => clock, aclr => resetn );

    -- redist8_i_cmp88_rm_gemm_nnfw_c_6(DELAY,234)
    redist8_i_cmp88_rm_gemm_nnfw_c_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp88_rm_gemm_nnfw_c, xout => redist8_i_cmp88_rm_gemm_nnfw_c_6_q, clk => clock, aclr => resetn );

    -- i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_multconst_x(CONSTANT,49)
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_multconst_x_q <= "00000000000000000000000000000000000000000000000000000000000000";

    -- leftShiftStage0Idx1Rng4_uid191_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x(BITSELECT,190)@6
    leftShiftStage0Idx1Rng4_uid191_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x_in <= i_conv_gemm_nnfw_sel_x_b(59 downto 0);
    leftShiftStage0Idx1Rng4_uid191_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x_b <= leftShiftStage0Idx1Rng4_uid191_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x_in(59 downto 0);

    -- leftShiftStage0Idx1_uid192_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x(BITJOIN,191)@6
    leftShiftStage0Idx1_uid192_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x_q <= leftShiftStage0Idx1Rng4_uid191_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x_b & i_vscale_i_gemm_nnfw_vt_const_3_q;

    -- redist12_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_1(DELAY,238)
    redist12_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out, xout => redist12_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_1_q, clk => clock, aclr => resetn );

    -- i_acl_push_i32_j_089_pop948_push24_gemm_nnfw(BLACKBOX,85)@2
    -- out out_feedback_out_24@20000000
    -- out out_feedback_valid_out_24@20000000
    thei_acl_push_i32_j_089_pop948_push24_gemm_nnfw : i_acl_push_i32_j_089_pop948_push24_gemm_nnfw57
    PORT MAP (
        in_data_in => redist12_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_1_q,
        in_feedback_stall_in_24 => i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_feedback_stall_out_24,
        in_stall_in => GND_q,
        in_unnamed_gemm_nnfW10 => redist5_i_unnamed_gemm_nnfw56_q_1_q,
        in_valid_in => redist20_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_24 => i_acl_push_i32_j_089_pop948_push24_gemm_nnfw_out_feedback_out_24,
        out_feedback_valid_out_24 => i_acl_push_i32_j_089_pop948_push24_gemm_nnfw_out_feedback_valid_out_24,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw(BLACKBOX,78)@1
    -- out out_feedback_stall_out_24@20000000
    thei_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw : i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw34
    PORT MAP (
        in_data_in => in_c0_eni6_3,
        in_dir => in_c0_eni6_2,
        in_feedback_in_24 => i_acl_push_i32_j_089_pop948_push24_gemm_nnfw_out_feedback_out_24,
        in_feedback_valid_in_24 => i_acl_push_i32_j_089_pop948_push24_gemm_nnfw_out_feedback_valid_out_24,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out,
        out_feedback_stall_out_24 => i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_feedback_stall_out_24,
        clock => clock,
        resetn => resetn
    );

    -- i_mul_gemm_nnfw_bs4(BITSELECT,204)@1
    i_mul_gemm_nnfw_bs4_in <= STD_LOGIC_VECTOR(i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out(17 downto 0));
    i_mul_gemm_nnfw_bs4_b <= STD_LOGIC_VECTOR(i_mul_gemm_nnfw_bs4_in(17 downto 0));

    -- i_mul_gemm_nnfw_bjA5(BITJOIN,205)@1
    i_mul_gemm_nnfw_bjA5_q <= GND_q & i_mul_gemm_nnfw_bs4_b;

    -- xMSB_uid152_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x(BITSELECT,151)@1
    xMSB_uid152_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_b <= STD_LOGIC_VECTOR(i_acl_pop_i32_sdiv_add124_rm47_pop23_gemm_nnfw_out_data_out(31 downto 31));

    -- seMsb_to4_uid154(BITSELECT,153)@1
    seMsb_to4_uid154_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 1 => xMSB_uid152_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_b(0)) & xMSB_uid152_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_b));
    seMsb_to4_uid154_b <= STD_LOGIC_VECTOR(seMsb_to4_uid154_in(3 downto 0));

    -- rightShiftStage0Idx1Rng4_uid155_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x(BITSELECT,154)@1
    rightShiftStage0Idx1Rng4_uid155_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_b <= i_acl_pop_i32_sdiv_add124_rm47_pop23_gemm_nnfw_out_data_out(31 downto 4);

    -- rightShiftStage0Idx1_uid156_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x(BITJOIN,155)@1
    rightShiftStage0Idx1_uid156_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q <= seMsb_to4_uid154_b & rightShiftStage0Idx1Rng4_uid155_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_b;

    -- i_acl_push_i32_sdiv_add124_rm47_push23_gemm_nnfw(BLACKBOX,87)@1
    -- out out_feedback_out_23@20000000
    -- out out_feedback_valid_out_23@20000000
    thei_acl_push_i32_sdiv_add124_rm47_push23_gemm_nnfw : i_acl_push_i32_sdiv_add124_rm47_push23_gemm_nnfw59
    PORT MAP (
        in_data_in => i_acl_pop_i32_sdiv_add124_rm47_pop23_gemm_nnfw_out_data_out,
        in_feedback_stall_in_23 => i_acl_pop_i32_sdiv_add124_rm47_pop23_gemm_nnfw_out_feedback_stall_out_23,
        in_stall_in => GND_q,
        in_unnamed_gemm_nnfW10 => i_unnamed_gemm_nnfw56_q,
        in_valid_in => in_i_valid,
        out_feedback_out_23 => i_acl_push_i32_sdiv_add124_rm47_push23_gemm_nnfw_out_feedback_out_23,
        out_feedback_valid_out_23 => i_acl_push_i32_sdiv_add124_rm47_push23_gemm_nnfw_out_feedback_valid_out_23,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i32_sdiv_add124_rm47_pop23_gemm_nnfw(BLACKBOX,80)@1
    -- out out_feedback_stall_out_23@20000000
    thei_acl_pop_i32_sdiv_add124_rm47_pop23_gemm_nnfw : i_acl_pop_i32_sdiv_add124_rm47_pop23_gemm_nnfw31
    PORT MAP (
        in_data_in => in_c0_eni6_1,
        in_dir => in_c0_eni6_2,
        in_feedback_in_23 => i_acl_push_i32_sdiv_add124_rm47_push23_gemm_nnfw_out_feedback_out_23,
        in_feedback_valid_in_23 => i_acl_push_i32_sdiv_add124_rm47_push23_gemm_nnfw_out_feedback_valid_out_23,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_sdiv_add124_rm47_pop23_gemm_nnfw_out_data_out,
        out_feedback_stall_out_23 => i_acl_pop_i32_sdiv_add124_rm47_pop23_gemm_nnfw_out_feedback_stall_out_23,
        clock => clock,
        resetn => resetn
    );

    -- rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x(MUX,157)@1
    rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_s <= VCC_q;
    rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_combproc: PROCESS (rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_s, i_acl_pop_i32_sdiv_add124_rm47_pop23_gemm_nnfw_out_data_out, rightShiftStage0Idx1_uid156_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q <= i_acl_pop_i32_sdiv_add124_rm47_pop23_gemm_nnfw_out_data_out;
            WHEN "1" => rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q <= rightShiftStage0Idx1_uid156_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_mul_gemm_nnfw_bs2_merged_bit_select(BITSELECT,225)@1
    i_mul_gemm_nnfw_bs2_merged_bit_select_b <= rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q(17 downto 0);
    i_mul_gemm_nnfw_bs2_merged_bit_select_c <= rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q(31 downto 18);

    -- i_mul_gemm_nnfw_bjB9(BITJOIN,209)@1
    i_mul_gemm_nnfw_bjB9_q <= GND_q & i_mul_gemm_nnfw_bs2_merged_bit_select_b;

    -- i_mul_gemm_nnfw_bs7(BITSELECT,207)@1
    i_mul_gemm_nnfw_bs7_b <= STD_LOGIC_VECTOR(i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out(31 downto 18));

    -- i_mul_gemm_nnfw_ma3_cma(CHAINMULTADD,223)@1 + 2
    i_mul_gemm_nnfw_ma3_cma_reset <= not (resetn);
    i_mul_gemm_nnfw_ma3_cma_ena0 <= '1';
    i_mul_gemm_nnfw_ma3_cma_ena1 <= i_mul_gemm_nnfw_ma3_cma_ena0;
    i_mul_gemm_nnfw_ma3_cma_l(0) <= SIGNED(RESIZE(i_mul_gemm_nnfw_ma3_cma_a0(0),15));
    i_mul_gemm_nnfw_ma3_cma_l(1) <= SIGNED(RESIZE(i_mul_gemm_nnfw_ma3_cma_a0(1),15));
    i_mul_gemm_nnfw_ma3_cma_p(0) <= i_mul_gemm_nnfw_ma3_cma_l(0) * i_mul_gemm_nnfw_ma3_cma_c0(0);
    i_mul_gemm_nnfw_ma3_cma_p(1) <= i_mul_gemm_nnfw_ma3_cma_l(1) * i_mul_gemm_nnfw_ma3_cma_c0(1);
    i_mul_gemm_nnfw_ma3_cma_u(0) <= RESIZE(i_mul_gemm_nnfw_ma3_cma_p(0),35);
    i_mul_gemm_nnfw_ma3_cma_u(1) <= RESIZE(i_mul_gemm_nnfw_ma3_cma_p(1),35);
    i_mul_gemm_nnfw_ma3_cma_w(0) <= i_mul_gemm_nnfw_ma3_cma_u(0) + i_mul_gemm_nnfw_ma3_cma_u(1);
    i_mul_gemm_nnfw_ma3_cma_x(0) <= i_mul_gemm_nnfw_ma3_cma_w(0);
    i_mul_gemm_nnfw_ma3_cma_y(0) <= i_mul_gemm_nnfw_ma3_cma_x(0);
    i_mul_gemm_nnfw_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_gemm_nnfw_ma3_cma_a0 <= (others => (others => '0'));
            i_mul_gemm_nnfw_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_gemm_nnfw_ma3_cma_ena0 = '1') THEN
                i_mul_gemm_nnfw_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_mul_gemm_nnfw_bs7_b),14);
                i_mul_gemm_nnfw_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_mul_gemm_nnfw_bs2_merged_bit_select_c),14);
                i_mul_gemm_nnfw_ma3_cma_c0(0) <= RESIZE(SIGNED(i_mul_gemm_nnfw_bjB9_q),19);
                i_mul_gemm_nnfw_ma3_cma_c0(1) <= RESIZE(SIGNED(i_mul_gemm_nnfw_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_mul_gemm_nnfw_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_gemm_nnfw_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_gemm_nnfw_ma3_cma_ena1 = '1') THEN
                i_mul_gemm_nnfw_ma3_cma_s(0) <= i_mul_gemm_nnfw_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul_gemm_nnfw_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul_gemm_nnfw_ma3_cma_s(0)(33 downto 0)), xout => i_mul_gemm_nnfw_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul_gemm_nnfw_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul_gemm_nnfw_ma3_cma_qq(33 downto 0));

    -- redist0_i_mul_gemm_nnfw_ma3_cma_q_1(DELAY,226)
    redist0_i_mul_gemm_nnfw_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul_gemm_nnfw_ma3_cma_q, xout => redist0_i_mul_gemm_nnfw_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul_gemm_nnfw_align_14(BITSHIFT,214)@4
    i_mul_gemm_nnfw_align_14_qint <= redist0_i_mul_gemm_nnfw_ma3_cma_q_1_q & "000000000000000000";
    i_mul_gemm_nnfw_align_14_q <= i_mul_gemm_nnfw_align_14_qint(51 downto 0);

    -- i_mul_gemm_nnfw_bs11(BITSELECT,211)@1
    i_mul_gemm_nnfw_bs11_b <= i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out(31 downto 18);

    -- i_mul_gemm_nnfw_im10_cma(CHAINMULTADD,222)@1 + 2
    i_mul_gemm_nnfw_im10_cma_reset <= not (resetn);
    i_mul_gemm_nnfw_im10_cma_ena0 <= '1';
    i_mul_gemm_nnfw_im10_cma_ena1 <= i_mul_gemm_nnfw_im10_cma_ena0;
    i_mul_gemm_nnfw_im10_cma_p(0) <= i_mul_gemm_nnfw_im10_cma_a0(0) * i_mul_gemm_nnfw_im10_cma_c0(0);
    i_mul_gemm_nnfw_im10_cma_u(0) <= RESIZE(i_mul_gemm_nnfw_im10_cma_p(0),28);
    i_mul_gemm_nnfw_im10_cma_w(0) <= i_mul_gemm_nnfw_im10_cma_u(0);
    i_mul_gemm_nnfw_im10_cma_x(0) <= i_mul_gemm_nnfw_im10_cma_w(0);
    i_mul_gemm_nnfw_im10_cma_y(0) <= i_mul_gemm_nnfw_im10_cma_x(0);
    i_mul_gemm_nnfw_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_gemm_nnfw_im10_cma_a0 <= (others => (others => '0'));
            i_mul_gemm_nnfw_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_gemm_nnfw_im10_cma_ena0 = '1') THEN
                i_mul_gemm_nnfw_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_mul_gemm_nnfw_bs11_b),14);
                i_mul_gemm_nnfw_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_mul_gemm_nnfw_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul_gemm_nnfw_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_gemm_nnfw_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_gemm_nnfw_im10_cma_ena1 = '1') THEN
                i_mul_gemm_nnfw_im10_cma_s(0) <= i_mul_gemm_nnfw_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul_gemm_nnfw_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul_gemm_nnfw_im10_cma_s(0)(27 downto 0)), xout => i_mul_gemm_nnfw_im10_cma_qq, clk => clock, aclr => resetn );
    i_mul_gemm_nnfw_im10_cma_q <= STD_LOGIC_VECTOR(i_mul_gemm_nnfw_im10_cma_qq(27 downto 0));

    -- redist1_i_mul_gemm_nnfw_im10_cma_q_1(DELAY,227)
    redist1_i_mul_gemm_nnfw_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul_gemm_nnfw_im10_cma_q, xout => redist1_i_mul_gemm_nnfw_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul_gemm_nnfw_bs1(BITSELECT,201)@1
    i_mul_gemm_nnfw_bs1_in <= i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out(17 downto 0);
    i_mul_gemm_nnfw_bs1_b <= i_mul_gemm_nnfw_bs1_in(17 downto 0);

    -- i_mul_gemm_nnfw_im0_cma(CHAINMULTADD,221)@1 + 2
    i_mul_gemm_nnfw_im0_cma_reset <= not (resetn);
    i_mul_gemm_nnfw_im0_cma_ena0 <= '1';
    i_mul_gemm_nnfw_im0_cma_ena1 <= i_mul_gemm_nnfw_im0_cma_ena0;
    i_mul_gemm_nnfw_im0_cma_p(0) <= i_mul_gemm_nnfw_im0_cma_a0(0) * i_mul_gemm_nnfw_im0_cma_c0(0);
    i_mul_gemm_nnfw_im0_cma_u(0) <= RESIZE(i_mul_gemm_nnfw_im0_cma_p(0),36);
    i_mul_gemm_nnfw_im0_cma_w(0) <= i_mul_gemm_nnfw_im0_cma_u(0);
    i_mul_gemm_nnfw_im0_cma_x(0) <= i_mul_gemm_nnfw_im0_cma_w(0);
    i_mul_gemm_nnfw_im0_cma_y(0) <= i_mul_gemm_nnfw_im0_cma_x(0);
    i_mul_gemm_nnfw_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_gemm_nnfw_im0_cma_a0 <= (others => (others => '0'));
            i_mul_gemm_nnfw_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_gemm_nnfw_im0_cma_ena0 = '1') THEN
                i_mul_gemm_nnfw_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul_gemm_nnfw_bs1_b),18);
                i_mul_gemm_nnfw_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_mul_gemm_nnfw_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_mul_gemm_nnfw_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_gemm_nnfw_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_gemm_nnfw_im0_cma_ena1 = '1') THEN
                i_mul_gemm_nnfw_im0_cma_s(0) <= i_mul_gemm_nnfw_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul_gemm_nnfw_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul_gemm_nnfw_im0_cma_s(0)(35 downto 0)), xout => i_mul_gemm_nnfw_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul_gemm_nnfw_im0_cma_q <= STD_LOGIC_VECTOR(i_mul_gemm_nnfw_im0_cma_qq(35 downto 0));

    -- redist2_i_mul_gemm_nnfw_im0_cma_q_1(DELAY,228)
    redist2_i_mul_gemm_nnfw_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul_gemm_nnfw_im0_cma_q, xout => redist2_i_mul_gemm_nnfw_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul_gemm_nnfw_join_13(BITJOIN,213)@4
    i_mul_gemm_nnfw_join_13_q <= redist1_i_mul_gemm_nnfw_im10_cma_q_1_q & redist2_i_mul_gemm_nnfw_im0_cma_q_1_q;

    -- i_mul_gemm_nnfw_result_add_0_0(ADD,216)@4
    i_mul_gemm_nnfw_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul_gemm_nnfw_join_13_q));
    i_mul_gemm_nnfw_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_mul_gemm_nnfw_align_14_q(51)) & i_mul_gemm_nnfw_align_14_q));
    i_mul_gemm_nnfw_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul_gemm_nnfw_result_add_0_0_a) + SIGNED(i_mul_gemm_nnfw_result_add_0_0_b));
    i_mul_gemm_nnfw_result_add_0_0_q <= i_mul_gemm_nnfw_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_mul_gemm_nnfw_rnd_sel(BITSELECT,197)@4
    bgTrunc_i_mul_gemm_nnfw_rnd_sel_in <= i_mul_gemm_nnfw_result_add_0_0_q(63 downto 0);
    bgTrunc_i_mul_gemm_nnfw_rnd_sel_b <= bgTrunc_i_mul_gemm_nnfw_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_mul_gemm_nnfw_sel_x(BITSELECT,4)@4
    bgTrunc_i_mul_gemm_nnfw_sel_x_b <= bgTrunc_i_mul_gemm_nnfw_rnd_sel_b(31 downto 0);

    -- redist23_bgTrunc_i_mul_gemm_nnfw_sel_x_b_1(DELAY,249)
    redist23_bgTrunc_i_mul_gemm_nnfw_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_mul_gemm_nnfw_sel_x_b, xout => redist23_bgTrunc_i_mul_gemm_nnfw_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_notEnable(LOGICAL,277)
    redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_nor(LOGICAL,278)
    redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_nor_q <= not (redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_notEnable_q or redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_sticky_ena_q);

    -- redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_cmpReg(REG,276)
    redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_sticky_ena(REG,279)
    redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_nor_q = "1") THEN
                redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_sticky_ena_q <= STD_LOGIC_VECTOR(redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_enaAnd(LOGICAL,280)
    redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_enaAnd_q <= redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_sticky_ena_q and VCC_q;

    -- redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_rdcnt(COUNTER,274)
    -- low=0, high=1, step=1, init=0
    redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_rdcnt_i <= redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_rdcnt_i, 1)));

    -- redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_wraddr(REG,275)
    redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_wraddr_q <= "1";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_wraddr_q <= STD_LOGIC_VECTOR(redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_mem(DUALMEM,273)
    redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_mem_ia <= STD_LOGIC_VECTOR(i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out);
    redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_mem_aa <= redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_wraddr_q;
    redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_mem_ab <= redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_rdcnt_q;
    redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_mem_reset0 <= not (resetn);
    redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 32,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_mem_reset0,
        clock1 => clock,
        address_a => redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_mem_aa,
        data_a => redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_mem_ab,
        q_b => redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_mem_iq
    );
    redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_mem_q <= redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_mem_iq(31 downto 0);

    -- redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_outputreg(DELAY,272)
    redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_mem_q, xout => redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_outputreg_q, clk => clock, aclr => resetn );

    -- i_add_gemm_nnfw(ADD,88)@5
    i_add_gemm_nnfw_a <= STD_LOGIC_VECTOR("0" & redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_outputreg_q);
    i_add_gemm_nnfw_b <= STD_LOGIC_VECTOR("0" & redist23_bgTrunc_i_mul_gemm_nnfw_sel_x_b_1_q);
    i_add_gemm_nnfw_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_gemm_nnfw_a) + UNSIGNED(i_add_gemm_nnfw_b));
    i_add_gemm_nnfw_q <= i_add_gemm_nnfw_o(32 downto 0);

    -- bgTrunc_i_add_gemm_nnfw_sel_x(BITSELECT,2)@5
    bgTrunc_i_add_gemm_nnfw_sel_x_b <= i_add_gemm_nnfw_q(31 downto 0);

    -- redist24_bgTrunc_i_add_gemm_nnfw_sel_x_b_1(DELAY,250)
    redist24_bgTrunc_i_add_gemm_nnfw_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add_gemm_nnfw_sel_x_b, xout => redist24_bgTrunc_i_add_gemm_nnfw_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_conv_gemm_nnfw_sel_x(BITSELECT,26)@6
    i_conv_gemm_nnfw_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist24_bgTrunc_i_add_gemm_nnfw_sel_x_b_1_q(31 downto 0)), 64)));

    -- leftShiftStage0_uid194_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x(MUX,193)@6
    leftShiftStage0_uid194_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x_s <= VCC_q;
    leftShiftStage0_uid194_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x_combproc: PROCESS (leftShiftStage0_uid194_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x_s, i_conv_gemm_nnfw_sel_x_b, leftShiftStage0Idx1_uid192_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid194_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid194_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x_q <= i_conv_gemm_nnfw_sel_x_b;
            WHEN "1" => leftShiftStage0_uid194_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x_q <= leftShiftStage0Idx1_uid192_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid194_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_vscale_i_gemm_nnfw_vt_select_63(BITSELECT,112)@6
    i_vscale_i_gemm_nnfw_vt_select_63_b <= leftShiftStage0_uid194_i_vscale_i_gemm_nnfw_gemm_nnfw38_shift_x_q(63 downto 4);

    -- i_vscale_i_gemm_nnfw_vt_const_3(CONSTANT,110)
    i_vscale_i_gemm_nnfw_vt_const_3_q <= "0000";

    -- i_vscale_i_gemm_nnfw_vt_join(BITJOIN,111)@6
    i_vscale_i_gemm_nnfw_vt_join_q <= i_vscale_i_gemm_nnfw_vt_select_63_b & i_vscale_i_gemm_nnfw_vt_const_3_q;

    -- i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_bs1_merged_bit_select(BITSELECT,224)@6
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_bs1_merged_bit_select_b <= i_vscale_i_gemm_nnfw_vt_join_q(17 downto 0);
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_bs1_merged_bit_select_c <= i_vscale_i_gemm_nnfw_vt_join_q(63 downto 54);
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_bs1_merged_bit_select_d <= i_vscale_i_gemm_nnfw_vt_join_q(35 downto 18);
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_bs1_merged_bit_select_e <= i_vscale_i_gemm_nnfw_vt_join_q(53 downto 36);

    -- i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im3_shift0(BITSHIFT,218)@6
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im3_shift0_qint <= i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_bs1_merged_bit_select_c & "0";
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im3_shift0_q <= i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im3_shift0_qint(10 downto 0);

    -- i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_align_15(BITSHIFT,183)@6
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im3_shift0_q) & "0000000000000000";
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_align_15_q <= i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_align_15_qint(27 downto 0);

    -- i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im6_shift0(BITSHIFT,219)@6
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im6_shift0_qint <= i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_bs1_merged_bit_select_d & "0";
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im6_shift0_q <= i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im6_shift0_qint(18 downto 0);

    -- i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_align_14(BITSHIFT,182)@6
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im6_shift0_q) & "000000000000000000";
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_align_14_q <= i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_align_14_qint(37 downto 0);

    -- i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_join_16(BITJOIN,184)@6
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_join_16_q <= i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_align_15_q & i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_align_14_q;

    -- i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im9_shift0(BITSHIFT,220)@6
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im9_shift0_qint <= i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_bs1_merged_bit_select_e & "0";
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im9_shift0_q <= i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im9_shift0_qint(18 downto 0);

    -- i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_align_12(BITSHIFT,180)@6
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im9_shift0_q) & "0000000000000000";
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_align_12_q <= i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_align_12_qint(35 downto 0);

    -- i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im0_shift0(BITSHIFT,217)@6
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im0_shift0_qint <= i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_bs1_merged_bit_select_b & "0";
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im0_shift0_q <= i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im0_shift0_qint(18 downto 0);

    -- i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_join_13(BITJOIN,181)@6
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_join_13_q <= i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_im0_shift0_q);

    -- i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_result_add_0_0(ADD,185)@6
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_join_13_q);
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_join_16_q);
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_result_add_0_0_a) + UNSIGNED(i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_result_add_0_0_b));
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_result_add_0_0_q <= i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_result_add_0_0_o(66 downto 0);

    -- i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_extender_x(BITJOIN,48)@6
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_extender_x_q <= i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_multconst_x_q & i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_x_result_add_0_0_q(65 downto 0);

    -- i_vloadgep_i_gemm_nnfw_gemm_nnfw41_trunc_sel_x(BITSELECT,50)@6
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_trunc_sel_x_b <= i_vloadgep_i_gemm_nnfw_gemm_nnfw41_mult_extender_x_q(63 downto 0);

    -- redist22_i_vloadgep_i_gemm_nnfw_gemm_nnfw41_trunc_sel_x_b_1(DELAY,248)
    redist22_i_vloadgep_i_gemm_nnfw_gemm_nnfw41_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_vloadgep_i_gemm_nnfw_gemm_nnfw41_trunc_sel_x_b, xout => redist22_i_vloadgep_i_gemm_nnfw_gemm_nnfw41_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_b_sync_buffer_gemm_nnfw(BLACKBOX,103)@0
    -- in in_i_dependence@7
    -- in in_valid_in@7
    -- out out_buffer_out@7
    -- out out_valid_out@7
    thei_syncbuf_b_sync_buffer_gemm_nnfw : i_syncbuf_b_sync_buffer_gemm_nnfw39
    PORT MAP (
        in_buffer_in => in_B,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_6_q,
        out_buffer_out => i_syncbuf_b_sync_buffer_gemm_nnfw_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_vloadgep_i_gemm_nnfw_gemm_nnfw41_add_x(ADD,51)@7
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_b_sync_buffer_gemm_nnfw_out_buffer_out);
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_add_x_b <= STD_LOGIC_VECTOR("0" & redist22_i_vloadgep_i_gemm_nnfw_gemm_nnfw41_trunc_sel_x_b_1_q);
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_vloadgep_i_gemm_nnfw_gemm_nnfw41_add_x_a) + UNSIGNED(i_vloadgep_i_gemm_nnfw_gemm_nnfw41_add_x_b));
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_add_x_q <= i_vloadgep_i_gemm_nnfw_gemm_nnfw41_add_x_o(64 downto 0);

    -- i_vloadgep_i_gemm_nnfw_gemm_nnfw41_dupName_0_trunc_sel_x(BITSELECT,45)@7
    i_vloadgep_i_gemm_nnfw_gemm_nnfw41_dupName_0_trunc_sel_x_b <= i_vloadgep_i_gemm_nnfw_gemm_nnfw41_add_x_q(63 downto 0);

    -- redist11_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_6(DELAY,237)
    redist11_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_6 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist10_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_4_outputreg_q, xout => redist11_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_6_q, clk => clock, aclr => resetn );

    -- redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_notEnable(LOGICAL,288)
    redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_nor(LOGICAL,289)
    redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_nor_q <= not (redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_notEnable_q or redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_sticky_ena_q);

    -- redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_last(CONSTANT,285)
    redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_last_q <= "01";

    -- redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_cmp(LOGICAL,286)
    redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_cmp_q <= "1" WHEN redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_last_q = redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt_q ELSE "0";

    -- redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_cmpReg(REG,287)
    redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_cmpReg_q <= STD_LOGIC_VECTOR(redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_cmp_q);
        END IF;
    END PROCESS;

    -- redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_sticky_ena(REG,290)
    redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_nor_q = "1") THEN
                redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_sticky_ena_q <= STD_LOGIC_VECTOR(redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_enaAnd(LOGICAL,291)
    redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_enaAnd_q <= redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_sticky_ena_q and VCC_q;

    -- redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt(COUNTER,283)
    -- low=0, high=2, step=1, init=0
    redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt_i <= TO_UNSIGNED(0, 2);
            redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt_eq <= '1';
            ELSE
                redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt_eq <= '0';
            END IF;
            IF (redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt_eq = '1') THEN
                redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt_i <= redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt_i + 2;
            ELSE
                redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt_i <= redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt_i, 2)));

    -- redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_inputreg(DELAY,281)
    redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist12_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_1_q, xout => redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_inputreg_q, clk => clock, aclr => resetn );

    -- redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_wraddr(REG,284)
    redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_wraddr_q <= "10";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_wraddr_q <= STD_LOGIC_VECTOR(redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem(DUALMEM,282)
    redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_ia <= STD_LOGIC_VECTOR(redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_inputreg_q);
    redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_aa <= redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_wraddr_q;
    redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_ab <= redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_rdcnt_q;
    redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_reset0 <= not (resetn);
    redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 32,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_reset0,
        clock1 => clock,
        address_a => redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_aa,
        data_a => redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_ab,
        q_b => redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_iq
    );
    redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_q <= redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_iq(31 downto 0);

    -- redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_notEnable(LOGICAL,268)
    redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_nor(LOGICAL,269)
    redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_nor_q <= not (redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_notEnable_q or redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_sticky_ena_q);

    -- redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_last(CONSTANT,265)
    redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_last_q <= "011";

    -- redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_cmp(LOGICAL,266)
    redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_cmp_q <= "1" WHEN redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_last_q = redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt_q ELSE "0";

    -- redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_cmpReg(REG,267)
    redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_cmpReg_q <= STD_LOGIC_VECTOR(redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_cmp_q);
        END IF;
    END PROCESS;

    -- redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_sticky_ena(REG,270)
    redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_nor_q = "1") THEN
                redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_sticky_ena_q <= STD_LOGIC_VECTOR(redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_enaAnd(LOGICAL,271)
    redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_enaAnd_q <= redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_sticky_ena_q and VCC_q;

    -- redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt(COUNTER,263)
    -- low=0, high=4, step=1, init=0
    redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt_eq <= '1';
            ELSE
                redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt_eq <= '0';
            END IF;
            IF (redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt_eq = '1') THEN
                redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt_i <= redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt_i + 4;
            ELSE
                redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt_i <= redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt_i, 3)));

    -- redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_wraddr(REG,264)
    redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_wraddr_q <= "100";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_wraddr_q <= STD_LOGIC_VECTOR(redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem(DUALMEM,262)
    redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_ia <= STD_LOGIC_VECTOR(rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q);
    redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_aa <= redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_wraddr_q;
    redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_ab <= redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_rdcnt_q;
    redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_reset0 <= not (resetn);
    redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 5,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_reset0,
        clock1 => clock,
        address_a => redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_aa,
        data_a => redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_ab,
        q_b => redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_iq
    );
    redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_q <= redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_iq(31 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,60)@7
    out_c0_exi12_0 <= GND_q;
    out_c0_exi12_1 <= redist4_rightShiftStage0_uid158_i_sdiv_sh125_rm_gemm_nnfw_gemm_nnfw33_shift_x_q_6_mem_q;
    out_c0_exi12_2 <= redist13_i_acl_pop_i32_j_089_pop948_pop24_gemm_nnfw_out_data_out_6_mem_q;
    out_c0_exi12_3 <= redist11_i_acl_pop_i32_k_182_pop21_gemm_nnfw_out_data_out_6_q;
    out_c0_exi12_4 <= i_vloadgep_i_gemm_nnfw_gemm_nnfw41_dupName_0_trunc_sel_x_b;
    out_c0_exi12_5 <= redist8_i_cmp88_rm_gemm_nnfw_c_6_q;
    out_c0_exi12_6 <= redist9_i_cmp380_rm_gemm_nnfw_c_6_q;
    out_c0_exi12_7 <= redist7_i_phi_decision134_xor_rm_gemm_nnfw_q_6_q;
    out_c0_exi12_8 <= redist3_rightShiftStage0_uid167_i_sdiv_sh_rm_gemm_nnfw_gemm_nnfw54_shift_x_q_6_mem_q;
    out_c0_exi12_9 <= redist6_i_unnamed_gemm_nnfw56_q_6_q;
    out_c0_exi12_10 <= redist19_i_acl_pop_i1_forked46_pop22_gemm_nnfw_out_data_out_6_q;
    out_c0_exi12_11 <= redist15_i_acl_pop_i1_pop25_gemm_nnfw_out_data_out_6_q;
    out_c0_exi12_12 <= redist17_i_acl_pop_i1_notexit2949_pop26_gemm_nnfw_out_data_out_6_q;
    out_o_valid <= redist21_sync_in_aunroll_x_in_i_valid_6_q;

    -- i_acl_push_i1_notexitcond_gemm_nnfw(BLACKBOX,83)@1
    -- out out_feedback_out_2@20000000
    -- out out_feedback_valid_out_2@20000000
    thei_acl_push_i1_notexitcond_gemm_nnfw : i_acl_push_i1_notexitcond_gemm_nnfw63
    PORT MAP (
        in_data_in => i_unnamed_gemm_nnfw56_q,
        in_feedback_stall_in_2 => i_acl_pipeline_keep_going_gemm_nnfw_out_not_exitcond_stall_out,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_2 => i_acl_push_i1_notexitcond_gemm_nnfw_out_feedback_out_2,
        out_feedback_valid_out_2 => i_acl_push_i1_notexitcond_gemm_nnfw_out_feedback_valid_out_2,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going_gemm_nnfw(BLACKBOX,74)@1
    -- out out_exiting_stall_out@20000000
    -- out out_exiting_valid_out@20000000
    -- out out_initeration_stall_out@20000000
    -- out out_not_exitcond_stall_out@20000000
    -- out out_pipeline_valid_out@20000000
    thei_acl_pipeline_keep_going_gemm_nnfw : i_acl_pipeline_keep_going_gemm_nnfw29
    PORT MAP (
        in_data_in => VCC_q,
        in_initeration_in => GND_q,
        in_initeration_valid_in => GND_q,
        in_not_exitcond_in => i_acl_push_i1_notexitcond_gemm_nnfw_out_feedback_out_2,
        in_not_exitcond_valid_in => i_acl_push_i1_notexitcond_gemm_nnfw_out_feedback_valid_out_2,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_exiting_stall_out => i_acl_pipeline_keep_going_gemm_nnfw_out_exiting_stall_out,
        out_exiting_valid_out => i_acl_pipeline_keep_going_gemm_nnfw_out_exiting_valid_out,
        out_not_exitcond_stall_out => i_acl_pipeline_keep_going_gemm_nnfw_out_not_exitcond_stall_out,
        out_pipeline_valid_out => i_acl_pipeline_keep_going_gemm_nnfw_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ext_sig_sync_out(GPOUT,73)
    out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nnfw_exiting_valid_out <= i_acl_pipeline_keep_going_gemm_nnfw_out_exiting_valid_out;
    out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nnfw_exiting_stall_out <= i_acl_pipeline_keep_going_gemm_nnfw_out_exiting_stall_out;

    -- pipeline_valid_out_sync(GPOUT,118)
    out_pipeline_valid_out <= i_acl_pipeline_keep_going_gemm_nnfw_out_pipeline_valid_out;

END normal;
