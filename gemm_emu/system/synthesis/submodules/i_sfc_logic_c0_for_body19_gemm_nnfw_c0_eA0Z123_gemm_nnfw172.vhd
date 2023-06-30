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

-- VHDL created from i_sfc_logic_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw172
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

entity i_sfc_logic_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw172 is
    port (
        in_A : in std_logic_vector(63 downto 0);  -- ufix64
        in_M : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni15_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni15_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni15_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni15_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni15_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni15_5 : in std_logic_vector(32 downto 0);  -- ufix33
        in_c0_eni15_6 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni15_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni15_8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni15_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni15_10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni15_11 : in std_logic_vector(32 downto 0);  -- ufix33
        in_c0_eni15_12 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni15_13 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni15_14 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni15_15 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11143_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11143_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi11143_2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi11143_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11143_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11143_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11143_6 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi11143_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11143_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11143_9 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi11143_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11143_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw172;

architecture normal of i_sfc_logic_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw172 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_pipeline_keep_going19_gemm_nnfw174 is
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


    component i_acl_pop_i1_cmp380_rm40_pop35_gemm_nnfw190 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_35 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_35 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_35 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_cmp88_rm38_pop34_gemm_nnfw187 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_34 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_34 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_34 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_notexit2934_pop32_gemm_nnfw217 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_32 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_32 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_32 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_phi_decision156_xor_rm1655_pop42_gemm_nnfw225 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_42 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_42 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_42 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_pop31_gemm_nnfw213 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_31 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_31 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_31 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_pop43_gemm_nnfw229 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_43 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_43 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_43 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_k_384_pop30_gemm_nnfw176 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_30 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_30 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_30 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_mul2054_pop41_gemm_nnfw178 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_41 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_41 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_41 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw193 is
        port (
            in_data_in : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_28 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_feedback_valid_in_28 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_feedback_stall_out_28 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i64_conv15_hf_tofpc53_pop40_gemm_nnfw209 is
        port (
            in_data_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_40 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_feedback_valid_in_40 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_feedback_stall_out_40 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_p1h_arrayidx1452_pop39_gemm_nnfw221 is
        port (
            in_data_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_39 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_feedback_valid_in_39 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_feedback_stall_out_39 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_cmp380_rm40_push35_gemm_nnfw199 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_35 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_35 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_35 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_cmp88_rm38_push34_gemm_nnfw201 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_34 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_34 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_34 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_notexit2934_push32_gemm_nnfw219 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fanout_adaptor : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_32 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_32 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_32 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_notexitcond20_gemm_nnfw207 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_4 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_phi_decision156_xor_rm1655_push42_gemm_nnfw227 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fanout_adaptor : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_42 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_42 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_42 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_push31_gemm_nnfw215 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fanout_adaptor : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_31 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_31 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_31 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_push43_gemm_nnfw231 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fanout_adaptor : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_43 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_43 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_43 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_k_384_push30_gemm_nnfw203 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_fanout_adaptor : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_30 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_30 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_30 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_mul2054_push41_gemm_nnfw197 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_fanout_adaptor : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_41 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_41 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_41 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i33_fpgaindvars_iv_push28_gemm_nnfw205 is
        port (
            in_data_in : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_feedback_stall_in_28 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_feedback_out_28 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_feedback_valid_out_28 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i64_conv15_hf_tofpc53_push40_gemm_nnfw211 is
        port (
            in_data_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_fanout_adaptor : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_40 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_feedback_out_40 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_feedback_valid_out_40 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_p1h_arrayidx1452_push39_gemm_nnfw223 is
        port (
            in_data_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_fanout_adaptor : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_39 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_feedback_out_39 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_feedback_valid_out_39 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_a_sync_buffer_gemm_nnfw181 is
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


    component i_syncbuf_m_sync_buffer9_gemm_nnfw184 is
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
    signal bgTrunc_i_add21_gemm_nnfw_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_fpgaindvars_iv_next_gemm_nnfw_sel_x_b : STD_LOGIC_VECTOR (32 downto 0);
    signal bgTrunc_i_inc31_gemm_nnfw_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv23_gemm_nnfw_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_multconst_x_q : STD_LOGIC_VECTOR (61 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i33_1gr_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_acl_pipeline_keep_going19_gemm_nnfw_out_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going19_gemm_nnfw_out_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going19_gemm_nnfw_out_not_exitcond_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going19_gemm_nnfw_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_cmp380_rm40_pop35_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_cmp380_rm40_pop35_gemm_nnfw_out_feedback_stall_out_35 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_cmp88_rm38_pop34_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_cmp88_rm38_pop34_gemm_nnfw_out_feedback_stall_out_34 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_notexit2934_pop32_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_notexit2934_pop32_gemm_nnfw_out_feedback_stall_out_32 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_phi_decision156_xor_rm1655_pop42_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_phi_decision156_xor_rm1655_pop42_gemm_nnfw_out_feedback_stall_out_42 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_pop31_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_pop31_gemm_nnfw_out_feedback_stall_out_31 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_pop43_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_pop43_gemm_nnfw_out_feedback_stall_out_43 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_k_384_pop30_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_k_384_pop30_gemm_nnfw_out_feedback_stall_out_30 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_mul2054_pop41_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_mul2054_pop41_gemm_nnfw_out_feedback_stall_out_41 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (32 downto 0);
    signal i_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw_out_feedback_stall_out_28 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i64_conv15_hf_tofpc53_pop40_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_pop_i64_conv15_hf_tofpc53_pop40_gemm_nnfw_out_feedback_stall_out_40 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_p1h_arrayidx1452_pop39_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_pop_p1h_arrayidx1452_pop39_gemm_nnfw_out_feedback_stall_out_39 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_cmp380_rm40_push35_gemm_nnfw_out_feedback_out_35 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_cmp380_rm40_push35_gemm_nnfw_out_feedback_valid_out_35 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_cmp88_rm38_push34_gemm_nnfw_out_feedback_out_34 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_cmp88_rm38_push34_gemm_nnfw_out_feedback_valid_out_34 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_notexit2934_push32_gemm_nnfw_out_feedback_out_32 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_notexit2934_push32_gemm_nnfw_out_feedback_valid_out_32 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_notexitcond20_gemm_nnfw_out_feedback_out_4 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_notexitcond20_gemm_nnfw_out_feedback_valid_out_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_phi_decision156_xor_rm1655_push42_gemm_nnfw_out_feedback_out_42 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_phi_decision156_xor_rm1655_push42_gemm_nnfw_out_feedback_valid_out_42 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_push31_gemm_nnfw_out_feedback_out_31 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_push31_gemm_nnfw_out_feedback_valid_out_31 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_push43_gemm_nnfw_out_feedback_out_43 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_push43_gemm_nnfw_out_feedback_valid_out_43 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_k_384_push30_gemm_nnfw_out_feedback_out_30 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_k_384_push30_gemm_nnfw_out_feedback_valid_out_30 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_mul2054_push41_gemm_nnfw_out_feedback_out_41 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_mul2054_push41_gemm_nnfw_out_feedback_valid_out_41 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i33_fpgaindvars_iv_push28_gemm_nnfw_out_feedback_out_28 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_push_i33_fpgaindvars_iv_push28_gemm_nnfw_out_feedback_valid_out_28 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i64_conv15_hf_tofpc53_push40_gemm_nnfw_out_feedback_out_40 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_push_i64_conv15_hf_tofpc53_push40_gemm_nnfw_out_feedback_valid_out_40 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_p1h_arrayidx1452_push39_gemm_nnfw_out_feedback_out_39 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_push_p1h_arrayidx1452_push39_gemm_nnfw_out_feedback_valid_out_39 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add21_gemm_nnfw_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add21_gemm_nnfw_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add21_gemm_nnfw_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add21_gemm_nnfw_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_cmp886_rm8_gemm_nnfw_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp886_rm8_gemm_nnfw_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp886_rm8_gemm_nnfw_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp886_rm8_gemm_nnfw_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond16_gemm_nnfw_a : STD_LOGIC_VECTOR (34 downto 0);
    signal i_exitcond16_gemm_nnfw_b : STD_LOGIC_VECTOR (34 downto 0);
    signal i_exitcond16_gemm_nnfw_o : STD_LOGIC_VECTOR (34 downto 0);
    signal i_exitcond16_gemm_nnfw_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_fpgaindvars_iv_next_gemm_nnfw_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_fpgaindvars_iv_next_gemm_nnfw_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_fpgaindvars_iv_next_gemm_nnfw_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_fpgaindvars_iv_next_gemm_nnfw_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_inc31_gemm_nnfw_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc31_gemm_nnfw_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc31_gemm_nnfw_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc31_gemm_nnfw_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_phi_decision164_xor_rm_gemm_nnfw_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_a_sync_buffer_gemm_nnfw_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_m_sync_buffer9_gemm_nnfw_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_gemm_nnfw189_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gemm_nnfw192_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gemm_nnfw196_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vscale_i1_gemm_nnfw_vt_const_3_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_vscale_i1_gemm_nnfw_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_vscale_i1_gemm_nnfw_vt_select_63_b : STD_LOGIC_VECTOR (59 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_join_13_q : STD_LOGIC_VECTOR (55 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_align_14_q : STD_LOGIC_VECTOR (37 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_align_14_qint : STD_LOGIC_VECTOR (37 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_join_16_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (66 downto 0);
    signal leftShiftStage0Idx1Rng4_uid130_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x_in : STD_LOGIC_VECTOR (59 downto 0);
    signal leftShiftStage0Idx1Rng4_uid130_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x_b : STD_LOGIC_VECTOR (59 downto 0);
    signal leftShiftStage0Idx1_uid131_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage0_uid133_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid133_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (10 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_unnamed_gemm_nnfw196_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_unnamed_gemm_nnfw192_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_acl_pop_p1h_arrayidx1452_pop39_gemm_nnfw_out_data_out_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_i_acl_pop_i64_conv15_hf_tofpc53_pop40_gemm_nnfw_out_data_out_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_i_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw_out_data_out_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist5_i_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw_out_data_out_2_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist6_i_acl_pop_i32_mul2054_pop41_gemm_nnfw_out_data_out_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_i_acl_pop_i32_mul2054_pop41_gemm_nnfw_out_data_out_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_i_acl_pop_i32_k_384_pop30_gemm_nnfw_out_data_out_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_i_acl_pop_i32_k_384_pop30_gemm_nnfw_out_data_out_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_i_acl_pop_i1_pop43_gemm_nnfw_out_data_out_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_acl_pop_i1_pop43_gemm_nnfw_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_acl_pop_i1_pop31_gemm_nnfw_out_data_out_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_acl_pop_i1_pop31_gemm_nnfw_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_acl_pop_i1_phi_decision156_xor_rm1655_pop42_gemm_nnfw_out_data_out_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_acl_pop_i1_phi_decision156_xor_rm1655_pop42_gemm_nnfw_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_i_acl_pop_i1_notexit2934_pop32_gemm_nnfw_out_data_out_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_i_acl_pop_i1_notexit2934_pop32_gemm_nnfw_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_i_acl_pop_i1_cmp88_rm38_pop34_gemm_nnfw_out_data_out_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_i_acl_pop_i1_cmp380_rm40_pop35_gemm_nnfw_out_data_out_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_sync_in_aunroll_x_in_i_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_sync_in_aunroll_x_in_i_valid_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_sync_in_aunroll_x_in_i_valid_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist24_bgTrunc_i_add21_gemm_nnfw_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_acl_pop_p1h_arrayidx1452_pop39_gemm_nnfw_out_data_out_3_inputreg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_i_acl_pop_i64_conv15_hf_tofpc53_pop40_gemm_nnfw_out_data_out_3_inputreg_q : STD_LOGIC_VECTOR (63 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist20_sync_in_aunroll_x_in_i_valid_1(DELAY,163)
    redist20_sync_in_aunroll_x_in_i_valid_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist20_sync_in_aunroll_x_in_i_valid_1_q, clk => clock, aclr => resetn );

    -- redist21_sync_in_aunroll_x_in_i_valid_2(DELAY,164)
    redist21_sync_in_aunroll_x_in_i_valid_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist20_sync_in_aunroll_x_in_i_valid_1_q, xout => redist21_sync_in_aunroll_x_in_i_valid_2_q, clk => clock, aclr => resetn );

    -- redist22_sync_in_aunroll_x_in_i_valid_3(DELAY,165)
    redist22_sync_in_aunroll_x_in_i_valid_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist21_sync_in_aunroll_x_in_i_valid_2_q, xout => redist22_sync_in_aunroll_x_in_i_valid_3_q, clk => clock, aclr => resetn );

    -- redist5_i_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw_out_data_out_2(DELAY,148)
    redist5_i_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw_out_data_out_2 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist4_i_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw_out_data_out_1_q, xout => redist5_i_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw_out_data_out_2_q, clk => clock, aclr => resetn );

    -- i_fpgaindvars_iv_next_gemm_nnfw(ADD,88)@3
    i_fpgaindvars_iv_next_gemm_nnfw_a <= STD_LOGIC_VECTOR("0" & redist5_i_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw_out_data_out_2_q);
    i_fpgaindvars_iv_next_gemm_nnfw_b <= STD_LOGIC_VECTOR("0" & c_i33_1gr_q);
    i_fpgaindvars_iv_next_gemm_nnfw_o <= STD_LOGIC_VECTOR(UNSIGNED(i_fpgaindvars_iv_next_gemm_nnfw_a) + UNSIGNED(i_fpgaindvars_iv_next_gemm_nnfw_b));
    i_fpgaindvars_iv_next_gemm_nnfw_q <= i_fpgaindvars_iv_next_gemm_nnfw_o(33 downto 0);

    -- bgTrunc_i_fpgaindvars_iv_next_gemm_nnfw_sel_x(BITSELECT,3)@3
    bgTrunc_i_fpgaindvars_iv_next_gemm_nnfw_sel_x_b <= i_fpgaindvars_iv_next_gemm_nnfw_q(32 downto 0);

    -- i_acl_push_i33_fpgaindvars_iv_push28_gemm_nnfw(BLACKBOX,80)@3
    -- out out_feedback_out_28@20000000
    -- out out_feedback_valid_out_28@20000000
    thei_acl_push_i33_fpgaindvars_iv_push28_gemm_nnfw : i_acl_push_i33_fpgaindvars_iv_push28_gemm_nnfw205
    PORT MAP (
        in_data_in => bgTrunc_i_fpgaindvars_iv_next_gemm_nnfw_sel_x_b,
        in_feedback_stall_in_28 => i_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw_out_feedback_stall_out_28,
        in_stall_in => GND_q,
        in_unnamed_gemm_nnfW11 => i_unnamed_gemm_nnfw196_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_28 => i_acl_push_i33_fpgaindvars_iv_push28_gemm_nnfw_out_feedback_out_28,
        out_feedback_valid_out_28 => i_acl_push_i33_fpgaindvars_iv_push28_gemm_nnfw_out_feedback_valid_out_28,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw(BLACKBOX,68)@1
    -- out out_feedback_stall_out_28@20000000
    thei_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw : i_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw193
    PORT MAP (
        in_data_in => in_c0_eni15_5,
        in_dir => in_c0_eni15_1,
        in_feedback_in_28 => i_acl_push_i33_fpgaindvars_iv_push28_gemm_nnfw_out_feedback_out_28,
        in_feedback_valid_in_28 => i_acl_push_i33_fpgaindvars_iv_push28_gemm_nnfw_out_feedback_valid_out_28,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw_out_data_out,
        out_feedback_stall_out_28 => i_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw_out_feedback_stall_out_28,
        clock => clock,
        resetn => resetn
    );

    -- redist4_i_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw_out_data_out_1(DELAY,147)
    redist4_i_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw_out_data_out, xout => redist4_i_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw_out_data_out_1_q, clk => clock, aclr => resetn );

    -- c_i33_1gr(CONSTANT,56)
    c_i33_1gr_q <= "111111111111111111111111111111111";

    -- i_exitcond16_gemm_nnfw(COMPARE,87)@2 + 1
    i_exitcond16_gemm_nnfw_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => c_i33_1gr_q(32)) & c_i33_1gr_q));
    i_exitcond16_gemm_nnfw_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist4_i_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw_out_data_out_1_q(32)) & redist4_i_acl_pop_i33_fpgaindvars_iv_pop28_gemm_nnfw_out_data_out_1_q));
    i_exitcond16_gemm_nnfw_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_exitcond16_gemm_nnfw_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_exitcond16_gemm_nnfw_o <= STD_LOGIC_VECTOR(SIGNED(i_exitcond16_gemm_nnfw_a) - SIGNED(i_exitcond16_gemm_nnfw_b));
        END IF;
    END PROCESS;
    i_exitcond16_gemm_nnfw_c(0) <= i_exitcond16_gemm_nnfw_o(34);

    -- i_acl_push_i1_cmp380_rm40_push35_gemm_nnfw(BLACKBOX,71)@3
    -- out out_feedback_out_35@20000000
    -- out out_feedback_valid_out_35@20000000
    thei_acl_push_i1_cmp380_rm40_push35_gemm_nnfw : i_acl_push_i1_cmp380_rm40_push35_gemm_nnfw199
    PORT MAP (
        in_data_in => redist19_i_acl_pop_i1_cmp380_rm40_pop35_gemm_nnfw_out_data_out_2_q,
        in_feedback_stall_in_35 => i_acl_pop_i1_cmp380_rm40_pop35_gemm_nnfw_out_feedback_stall_out_35,
        in_stall_in => GND_q,
        in_unnamed_gemm_nnfW11 => i_unnamed_gemm_nnfw196_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_35 => i_acl_push_i1_cmp380_rm40_push35_gemm_nnfw_out_feedback_out_35,
        out_feedback_valid_out_35 => i_acl_push_i1_cmp380_rm40_push35_gemm_nnfw_out_feedback_valid_out_35,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_cmp380_rm40_pop35_gemm_nnfw(BLACKBOX,60)@1
    -- out out_feedback_stall_out_35@20000000
    thei_acl_pop_i1_cmp380_rm40_pop35_gemm_nnfw : i_acl_pop_i1_cmp380_rm40_pop35_gemm_nnfw190
    PORT MAP (
        in_data_in => in_c0_eni15_4,
        in_dir => in_c0_eni15_1,
        in_feedback_in_35 => i_acl_push_i1_cmp380_rm40_push35_gemm_nnfw_out_feedback_out_35,
        in_feedback_valid_in_35 => i_acl_push_i1_cmp380_rm40_push35_gemm_nnfw_out_feedback_valid_out_35,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_cmp380_rm40_pop35_gemm_nnfw_out_data_out,
        out_feedback_stall_out_35 => i_acl_pop_i1_cmp380_rm40_pop35_gemm_nnfw_out_feedback_stall_out_35,
        clock => clock,
        resetn => resetn
    );

    -- redist19_i_acl_pop_i1_cmp380_rm40_pop35_gemm_nnfw_out_data_out_2(DELAY,162)
    redist19_i_acl_pop_i1_cmp380_rm40_pop35_gemm_nnfw_out_data_out_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_cmp380_rm40_pop35_gemm_nnfw_out_data_out, xout => redist19_i_acl_pop_i1_cmp380_rm40_pop35_gemm_nnfw_out_data_out_2_q, clk => clock, aclr => resetn );

    -- i_syncbuf_m_sync_buffer9_gemm_nnfw(BLACKBOX,93)@0
    -- in in_i_dependence@2
    -- in in_valid_in@2
    -- out out_buffer_out@2
    -- out out_valid_out@2
    thei_syncbuf_m_sync_buffer9_gemm_nnfw : i_syncbuf_m_sync_buffer9_gemm_nnfw184
    PORT MAP (
        in_buffer_in => in_M,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist20_sync_in_aunroll_x_in_i_valid_1_q,
        out_buffer_out => i_syncbuf_m_sync_buffer9_gemm_nnfw_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_0gr(CONSTANT,54)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- i_cmp886_rm8_gemm_nnfw(COMPARE,84)@2 + 1
    i_cmp886_rm8_gemm_nnfw_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_0gr_q(31)) & c_i32_0gr_q));
    i_cmp886_rm8_gemm_nnfw_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_m_sync_buffer9_gemm_nnfw_out_buffer_out(31)) & i_syncbuf_m_sync_buffer9_gemm_nnfw_out_buffer_out));
    i_cmp886_rm8_gemm_nnfw_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp886_rm8_gemm_nnfw_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp886_rm8_gemm_nnfw_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp886_rm8_gemm_nnfw_a) - SIGNED(i_cmp886_rm8_gemm_nnfw_b));
        END IF;
    END PROCESS;
    i_cmp886_rm8_gemm_nnfw_c(0) <= i_cmp886_rm8_gemm_nnfw_o(33);

    -- i_acl_push_i1_cmp88_rm38_push34_gemm_nnfw(BLACKBOX,72)@3
    -- out out_feedback_out_34@20000000
    -- out out_feedback_valid_out_34@20000000
    thei_acl_push_i1_cmp88_rm38_push34_gemm_nnfw : i_acl_push_i1_cmp88_rm38_push34_gemm_nnfw201
    PORT MAP (
        in_data_in => redist18_i_acl_pop_i1_cmp88_rm38_pop34_gemm_nnfw_out_data_out_2_q,
        in_feedback_stall_in_34 => i_acl_pop_i1_cmp88_rm38_pop34_gemm_nnfw_out_feedback_stall_out_34,
        in_stall_in => GND_q,
        in_unnamed_gemm_nnfW11 => i_unnamed_gemm_nnfw196_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_34 => i_acl_push_i1_cmp88_rm38_push34_gemm_nnfw_out_feedback_out_34,
        out_feedback_valid_out_34 => i_acl_push_i1_cmp88_rm38_push34_gemm_nnfw_out_feedback_valid_out_34,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_cmp88_rm38_pop34_gemm_nnfw(BLACKBOX,61)@1
    -- out out_feedback_stall_out_34@20000000
    thei_acl_pop_i1_cmp88_rm38_pop34_gemm_nnfw : i_acl_pop_i1_cmp88_rm38_pop34_gemm_nnfw187
    PORT MAP (
        in_data_in => in_c0_eni15_3,
        in_dir => in_c0_eni15_1,
        in_feedback_in_34 => i_acl_push_i1_cmp88_rm38_push34_gemm_nnfw_out_feedback_out_34,
        in_feedback_valid_in_34 => i_acl_push_i1_cmp88_rm38_push34_gemm_nnfw_out_feedback_valid_out_34,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_cmp88_rm38_pop34_gemm_nnfw_out_data_out,
        out_feedback_stall_out_34 => i_acl_pop_i1_cmp88_rm38_pop34_gemm_nnfw_out_feedback_stall_out_34,
        clock => clock,
        resetn => resetn
    );

    -- redist18_i_acl_pop_i1_cmp88_rm38_pop34_gemm_nnfw_out_data_out_2(DELAY,161)
    redist18_i_acl_pop_i1_cmp88_rm38_pop34_gemm_nnfw_out_data_out_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_cmp88_rm38_pop34_gemm_nnfw_out_data_out, xout => redist18_i_acl_pop_i1_cmp88_rm38_pop34_gemm_nnfw_out_data_out_2_q, clk => clock, aclr => resetn );

    -- i_unnamed_gemm_nnfw189(LOGICAL,94)@3
    i_unnamed_gemm_nnfw189_q <= redist18_i_acl_pop_i1_cmp88_rm38_pop34_gemm_nnfw_out_data_out_2_q and i_cmp886_rm8_gemm_nnfw_c;

    -- i_unnamed_gemm_nnfw192(LOGICAL,95)@3
    i_unnamed_gemm_nnfw192_q <= i_unnamed_gemm_nnfw189_q and redist19_i_acl_pop_i1_cmp380_rm40_pop35_gemm_nnfw_out_data_out_2_q;

    -- i_unnamed_gemm_nnfw196(LOGICAL,96)@3
    i_unnamed_gemm_nnfw196_q <= i_unnamed_gemm_nnfw192_q and i_exitcond16_gemm_nnfw_c;

    -- i_acl_push_i1_push43_gemm_nnfw(BLACKBOX,77)@3
    -- out out_feedback_out_43@20000000
    -- out out_feedback_valid_out_43@20000000
    thei_acl_push_i1_push43_gemm_nnfw : i_acl_push_i1_push43_gemm_nnfw231
    PORT MAP (
        in_data_in => redist10_i_acl_pop_i1_pop43_gemm_nnfw_out_data_out_2_q,
        in_fanout_adaptor => i_unnamed_gemm_nnfw196_q,
        in_feedback_stall_in_43 => i_acl_pop_i1_pop43_gemm_nnfw_out_feedback_stall_out_43,
        in_stall_in => GND_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_43 => i_acl_push_i1_push43_gemm_nnfw_out_feedback_out_43,
        out_feedback_valid_out_43 => i_acl_push_i1_push43_gemm_nnfw_out_feedback_valid_out_43,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_pop43_gemm_nnfw(BLACKBOX,65)@1
    -- out out_feedback_stall_out_43@20000000
    thei_acl_pop_i1_pop43_gemm_nnfw : i_acl_pop_i1_pop43_gemm_nnfw229
    PORT MAP (
        in_data_in => in_c0_eni15_15,
        in_dir => in_c0_eni15_1,
        in_feedback_in_43 => i_acl_push_i1_push43_gemm_nnfw_out_feedback_out_43,
        in_feedback_valid_in_43 => i_acl_push_i1_push43_gemm_nnfw_out_feedback_valid_out_43,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_pop43_gemm_nnfw_out_data_out,
        out_feedback_stall_out_43 => i_acl_pop_i1_pop43_gemm_nnfw_out_feedback_stall_out_43,
        clock => clock,
        resetn => resetn
    );

    -- redist10_i_acl_pop_i1_pop43_gemm_nnfw_out_data_out_2(DELAY,153)
    redist10_i_acl_pop_i1_pop43_gemm_nnfw_out_data_out_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_pop43_gemm_nnfw_out_data_out, xout => redist10_i_acl_pop_i1_pop43_gemm_nnfw_out_data_out_2_q, clk => clock, aclr => resetn );

    -- redist11_i_acl_pop_i1_pop43_gemm_nnfw_out_data_out_3(DELAY,154)
    redist11_i_acl_pop_i1_pop43_gemm_nnfw_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist10_i_acl_pop_i1_pop43_gemm_nnfw_out_data_out_2_q, xout => redist11_i_acl_pop_i1_pop43_gemm_nnfw_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_phi_decision156_xor_rm1655_push42_gemm_nnfw(BLACKBOX,75)@3
    -- out out_feedback_out_42@20000000
    -- out out_feedback_valid_out_42@20000000
    thei_acl_push_i1_phi_decision156_xor_rm1655_push42_gemm_nnfw : i_acl_push_i1_phi_decision156_xor_rm1655_push42_gemm_nnfw227
    PORT MAP (
        in_data_in => redist14_i_acl_pop_i1_phi_decision156_xor_rm1655_pop42_gemm_nnfw_out_data_out_2_q,
        in_fanout_adaptor => i_unnamed_gemm_nnfw196_q,
        in_feedback_stall_in_42 => i_acl_pop_i1_phi_decision156_xor_rm1655_pop42_gemm_nnfw_out_feedback_stall_out_42,
        in_stall_in => GND_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_42 => i_acl_push_i1_phi_decision156_xor_rm1655_push42_gemm_nnfw_out_feedback_out_42,
        out_feedback_valid_out_42 => i_acl_push_i1_phi_decision156_xor_rm1655_push42_gemm_nnfw_out_feedback_valid_out_42,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_phi_decision156_xor_rm1655_pop42_gemm_nnfw(BLACKBOX,63)@1
    -- out out_feedback_stall_out_42@20000000
    thei_acl_pop_i1_phi_decision156_xor_rm1655_pop42_gemm_nnfw : i_acl_pop_i1_phi_decision156_xor_rm1655_pop42_gemm_nnfw225
    PORT MAP (
        in_data_in => in_c0_eni15_14,
        in_dir => in_c0_eni15_1,
        in_feedback_in_42 => i_acl_push_i1_phi_decision156_xor_rm1655_push42_gemm_nnfw_out_feedback_out_42,
        in_feedback_valid_in_42 => i_acl_push_i1_phi_decision156_xor_rm1655_push42_gemm_nnfw_out_feedback_valid_out_42,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_phi_decision156_xor_rm1655_pop42_gemm_nnfw_out_data_out,
        out_feedback_stall_out_42 => i_acl_pop_i1_phi_decision156_xor_rm1655_pop42_gemm_nnfw_out_feedback_stall_out_42,
        clock => clock,
        resetn => resetn
    );

    -- redist14_i_acl_pop_i1_phi_decision156_xor_rm1655_pop42_gemm_nnfw_out_data_out_2(DELAY,157)
    redist14_i_acl_pop_i1_phi_decision156_xor_rm1655_pop42_gemm_nnfw_out_data_out_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_phi_decision156_xor_rm1655_pop42_gemm_nnfw_out_data_out, xout => redist14_i_acl_pop_i1_phi_decision156_xor_rm1655_pop42_gemm_nnfw_out_data_out_2_q, clk => clock, aclr => resetn );

    -- redist15_i_acl_pop_i1_phi_decision156_xor_rm1655_pop42_gemm_nnfw_out_data_out_3(DELAY,158)
    redist15_i_acl_pop_i1_phi_decision156_xor_rm1655_pop42_gemm_nnfw_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist14_i_acl_pop_i1_phi_decision156_xor_rm1655_pop42_gemm_nnfw_out_data_out_2_q, xout => redist15_i_acl_pop_i1_phi_decision156_xor_rm1655_pop42_gemm_nnfw_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_acl_push_p1h_arrayidx1452_push39_gemm_nnfw(BLACKBOX,82)@4
    -- out out_feedback_out_39@20000000
    -- out out_feedback_valid_out_39@20000000
    thei_acl_push_p1h_arrayidx1452_push39_gemm_nnfw : i_acl_push_p1h_arrayidx1452_push39_gemm_nnfw223
    PORT MAP (
        in_data_in => redist2_i_acl_pop_p1h_arrayidx1452_pop39_gemm_nnfw_out_data_out_3_q,
        in_fanout_adaptor => redist0_i_unnamed_gemm_nnfw196_q_1_q,
        in_feedback_stall_in_39 => i_acl_pop_p1h_arrayidx1452_pop39_gemm_nnfw_out_feedback_stall_out_39,
        in_stall_in => GND_q,
        in_valid_in => redist22_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_39 => i_acl_push_p1h_arrayidx1452_push39_gemm_nnfw_out_feedback_out_39,
        out_feedback_valid_out_39 => i_acl_push_p1h_arrayidx1452_push39_gemm_nnfw_out_feedback_valid_out_39,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_p1h_arrayidx1452_pop39_gemm_nnfw(BLACKBOX,70)@1
    -- out out_feedback_stall_out_39@20000000
    thei_acl_pop_p1h_arrayidx1452_pop39_gemm_nnfw : i_acl_pop_p1h_arrayidx1452_pop39_gemm_nnfw221
    PORT MAP (
        in_data_in => in_c0_eni15_13,
        in_dir => in_c0_eni15_1,
        in_feedback_in_39 => i_acl_push_p1h_arrayidx1452_push39_gemm_nnfw_out_feedback_out_39,
        in_feedback_valid_in_39 => i_acl_push_p1h_arrayidx1452_push39_gemm_nnfw_out_feedback_valid_out_39,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_p1h_arrayidx1452_pop39_gemm_nnfw_out_data_out,
        out_feedback_stall_out_39 => i_acl_pop_p1h_arrayidx1452_pop39_gemm_nnfw_out_feedback_stall_out_39,
        clock => clock,
        resetn => resetn
    );

    -- redist2_i_acl_pop_p1h_arrayidx1452_pop39_gemm_nnfw_out_data_out_3_inputreg(DELAY,168)
    redist2_i_acl_pop_p1h_arrayidx1452_pop39_gemm_nnfw_out_data_out_3_inputreg : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_p1h_arrayidx1452_pop39_gemm_nnfw_out_data_out, xout => redist2_i_acl_pop_p1h_arrayidx1452_pop39_gemm_nnfw_out_data_out_3_inputreg_q, clk => clock, aclr => resetn );

    -- redist2_i_acl_pop_p1h_arrayidx1452_pop39_gemm_nnfw_out_data_out_3(DELAY,145)
    redist2_i_acl_pop_p1h_arrayidx1452_pop39_gemm_nnfw_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 64, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist2_i_acl_pop_p1h_arrayidx1452_pop39_gemm_nnfw_out_data_out_3_inputreg_q, xout => redist2_i_acl_pop_p1h_arrayidx1452_pop39_gemm_nnfw_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_notexit2934_push32_gemm_nnfw(BLACKBOX,73)@3
    -- out out_feedback_out_32@20000000
    -- out out_feedback_valid_out_32@20000000
    thei_acl_push_i1_notexit2934_push32_gemm_nnfw : i_acl_push_i1_notexit2934_push32_gemm_nnfw219
    PORT MAP (
        in_data_in => redist16_i_acl_pop_i1_notexit2934_pop32_gemm_nnfw_out_data_out_2_q,
        in_fanout_adaptor => i_unnamed_gemm_nnfw196_q,
        in_feedback_stall_in_32 => i_acl_pop_i1_notexit2934_pop32_gemm_nnfw_out_feedback_stall_out_32,
        in_stall_in => GND_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_32 => i_acl_push_i1_notexit2934_push32_gemm_nnfw_out_feedback_out_32,
        out_feedback_valid_out_32 => i_acl_push_i1_notexit2934_push32_gemm_nnfw_out_feedback_valid_out_32,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_notexit2934_pop32_gemm_nnfw(BLACKBOX,62)@1
    -- out out_feedback_stall_out_32@20000000
    thei_acl_pop_i1_notexit2934_pop32_gemm_nnfw : i_acl_pop_i1_notexit2934_pop32_gemm_nnfw217
    PORT MAP (
        in_data_in => in_c0_eni15_8,
        in_dir => in_c0_eni15_1,
        in_feedback_in_32 => i_acl_push_i1_notexit2934_push32_gemm_nnfw_out_feedback_out_32,
        in_feedback_valid_in_32 => i_acl_push_i1_notexit2934_push32_gemm_nnfw_out_feedback_valid_out_32,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_notexit2934_pop32_gemm_nnfw_out_data_out,
        out_feedback_stall_out_32 => i_acl_pop_i1_notexit2934_pop32_gemm_nnfw_out_feedback_stall_out_32,
        clock => clock,
        resetn => resetn
    );

    -- redist16_i_acl_pop_i1_notexit2934_pop32_gemm_nnfw_out_data_out_2(DELAY,159)
    redist16_i_acl_pop_i1_notexit2934_pop32_gemm_nnfw_out_data_out_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_notexit2934_pop32_gemm_nnfw_out_data_out, xout => redist16_i_acl_pop_i1_notexit2934_pop32_gemm_nnfw_out_data_out_2_q, clk => clock, aclr => resetn );

    -- redist17_i_acl_pop_i1_notexit2934_pop32_gemm_nnfw_out_data_out_3(DELAY,160)
    redist17_i_acl_pop_i1_notexit2934_pop32_gemm_nnfw_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist16_i_acl_pop_i1_notexit2934_pop32_gemm_nnfw_out_data_out_2_q, xout => redist17_i_acl_pop_i1_notexit2934_pop32_gemm_nnfw_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_push31_gemm_nnfw(BLACKBOX,76)@3
    -- out out_feedback_out_31@20000000
    -- out out_feedback_valid_out_31@20000000
    thei_acl_push_i1_push31_gemm_nnfw : i_acl_push_i1_push31_gemm_nnfw215
    PORT MAP (
        in_data_in => redist12_i_acl_pop_i1_pop31_gemm_nnfw_out_data_out_2_q,
        in_fanout_adaptor => i_unnamed_gemm_nnfw196_q,
        in_feedback_stall_in_31 => i_acl_pop_i1_pop31_gemm_nnfw_out_feedback_stall_out_31,
        in_stall_in => GND_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_31 => i_acl_push_i1_push31_gemm_nnfw_out_feedback_out_31,
        out_feedback_valid_out_31 => i_acl_push_i1_push31_gemm_nnfw_out_feedback_valid_out_31,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_pop31_gemm_nnfw(BLACKBOX,64)@1
    -- out out_feedback_stall_out_31@20000000
    thei_acl_pop_i1_pop31_gemm_nnfw : i_acl_pop_i1_pop31_gemm_nnfw213
    PORT MAP (
        in_data_in => in_c0_eni15_7,
        in_dir => in_c0_eni15_1,
        in_feedback_in_31 => i_acl_push_i1_push31_gemm_nnfw_out_feedback_out_31,
        in_feedback_valid_in_31 => i_acl_push_i1_push31_gemm_nnfw_out_feedback_valid_out_31,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_pop31_gemm_nnfw_out_data_out,
        out_feedback_stall_out_31 => i_acl_pop_i1_pop31_gemm_nnfw_out_feedback_stall_out_31,
        clock => clock,
        resetn => resetn
    );

    -- redist12_i_acl_pop_i1_pop31_gemm_nnfw_out_data_out_2(DELAY,155)
    redist12_i_acl_pop_i1_pop31_gemm_nnfw_out_data_out_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_pop31_gemm_nnfw_out_data_out, xout => redist12_i_acl_pop_i1_pop31_gemm_nnfw_out_data_out_2_q, clk => clock, aclr => resetn );

    -- redist13_i_acl_pop_i1_pop31_gemm_nnfw_out_data_out_3(DELAY,156)
    redist13_i_acl_pop_i1_pop31_gemm_nnfw_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist12_i_acl_pop_i1_pop31_gemm_nnfw_out_data_out_2_q, xout => redist13_i_acl_pop_i1_pop31_gemm_nnfw_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_acl_push_i64_conv15_hf_tofpc53_push40_gemm_nnfw(BLACKBOX,81)@4
    -- out out_feedback_out_40@20000000
    -- out out_feedback_valid_out_40@20000000
    thei_acl_push_i64_conv15_hf_tofpc53_push40_gemm_nnfw : i_acl_push_i64_conv15_hf_tofpc53_push40_gemm_nnfw211
    PORT MAP (
        in_data_in => redist3_i_acl_pop_i64_conv15_hf_tofpc53_pop40_gemm_nnfw_out_data_out_3_q,
        in_fanout_adaptor => redist0_i_unnamed_gemm_nnfw196_q_1_q,
        in_feedback_stall_in_40 => i_acl_pop_i64_conv15_hf_tofpc53_pop40_gemm_nnfw_out_feedback_stall_out_40,
        in_stall_in => GND_q,
        in_valid_in => redist22_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_40 => i_acl_push_i64_conv15_hf_tofpc53_push40_gemm_nnfw_out_feedback_out_40,
        out_feedback_valid_out_40 => i_acl_push_i64_conv15_hf_tofpc53_push40_gemm_nnfw_out_feedback_valid_out_40,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i64_conv15_hf_tofpc53_pop40_gemm_nnfw(BLACKBOX,69)@1
    -- out out_feedback_stall_out_40@20000000
    thei_acl_pop_i64_conv15_hf_tofpc53_pop40_gemm_nnfw : i_acl_pop_i64_conv15_hf_tofpc53_pop40_gemm_nnfw209
    PORT MAP (
        in_data_in => in_c0_eni15_6,
        in_dir => in_c0_eni15_1,
        in_feedback_in_40 => i_acl_push_i64_conv15_hf_tofpc53_push40_gemm_nnfw_out_feedback_out_40,
        in_feedback_valid_in_40 => i_acl_push_i64_conv15_hf_tofpc53_push40_gemm_nnfw_out_feedback_valid_out_40,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i64_conv15_hf_tofpc53_pop40_gemm_nnfw_out_data_out,
        out_feedback_stall_out_40 => i_acl_pop_i64_conv15_hf_tofpc53_pop40_gemm_nnfw_out_feedback_stall_out_40,
        clock => clock,
        resetn => resetn
    );

    -- redist3_i_acl_pop_i64_conv15_hf_tofpc53_pop40_gemm_nnfw_out_data_out_3_inputreg(DELAY,169)
    redist3_i_acl_pop_i64_conv15_hf_tofpc53_pop40_gemm_nnfw_out_data_out_3_inputreg : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i64_conv15_hf_tofpc53_pop40_gemm_nnfw_out_data_out, xout => redist3_i_acl_pop_i64_conv15_hf_tofpc53_pop40_gemm_nnfw_out_data_out_3_inputreg_q, clk => clock, aclr => resetn );

    -- redist3_i_acl_pop_i64_conv15_hf_tofpc53_pop40_gemm_nnfw_out_data_out_3(DELAY,146)
    redist3_i_acl_pop_i64_conv15_hf_tofpc53_pop40_gemm_nnfw_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 64, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist3_i_acl_pop_i64_conv15_hf_tofpc53_pop40_gemm_nnfw_out_data_out_3_inputreg_q, xout => redist3_i_acl_pop_i64_conv15_hf_tofpc53_pop40_gemm_nnfw_out_data_out_3_q, clk => clock, aclr => resetn );

    -- redist0_i_unnamed_gemm_nnfw196_q_1(DELAY,143)
    redist0_i_unnamed_gemm_nnfw196_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gemm_nnfw196_q, xout => redist0_i_unnamed_gemm_nnfw196_q_1_q, clk => clock, aclr => resetn );

    -- i_phi_decision164_xor_rm_gemm_nnfw(LOGICAL,91)@4
    i_phi_decision164_xor_rm_gemm_nnfw_q <= redist1_i_unnamed_gemm_nnfw192_q_1_q xor VCC_q;

    -- redist1_i_unnamed_gemm_nnfw192_q_1(DELAY,144)
    redist1_i_unnamed_gemm_nnfw192_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gemm_nnfw192_q, xout => redist1_i_unnamed_gemm_nnfw192_q_1_q, clk => clock, aclr => resetn );

    -- i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_multconst_x(CONSTANT,37)
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_multconst_x_q <= "00000000000000000000000000000000000000000000000000000000000000";

    -- leftShiftStage0Idx1Rng4_uid130_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x(BITSELECT,129)@3
    leftShiftStage0Idx1Rng4_uid130_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x_in <= i_conv23_gemm_nnfw_sel_x_b(59 downto 0);
    leftShiftStage0Idx1Rng4_uid130_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x_b <= leftShiftStage0Idx1Rng4_uid130_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x_in(59 downto 0);

    -- leftShiftStage0Idx1_uid131_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x(BITJOIN,130)@3
    leftShiftStage0Idx1_uid131_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x_q <= leftShiftStage0Idx1Rng4_uid130_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x_b & i_vscale_i1_gemm_nnfw_vt_const_3_q;

    -- redist7_i_acl_pop_i32_mul2054_pop41_gemm_nnfw_out_data_out_2(DELAY,150)
    redist7_i_acl_pop_i32_mul2054_pop41_gemm_nnfw_out_data_out_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist6_i_acl_pop_i32_mul2054_pop41_gemm_nnfw_out_data_out_1_q, xout => redist7_i_acl_pop_i32_mul2054_pop41_gemm_nnfw_out_data_out_2_q, clk => clock, aclr => resetn );

    -- i_acl_push_i32_mul2054_push41_gemm_nnfw(BLACKBOX,79)@3
    -- out out_feedback_out_41@20000000
    -- out out_feedback_valid_out_41@20000000
    thei_acl_push_i32_mul2054_push41_gemm_nnfw : i_acl_push_i32_mul2054_push41_gemm_nnfw197
    PORT MAP (
        in_data_in => redist7_i_acl_pop_i32_mul2054_pop41_gemm_nnfw_out_data_out_2_q,
        in_fanout_adaptor => i_unnamed_gemm_nnfw196_q,
        in_feedback_stall_in_41 => i_acl_pop_i32_mul2054_pop41_gemm_nnfw_out_feedback_stall_out_41,
        in_stall_in => GND_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_41 => i_acl_push_i32_mul2054_push41_gemm_nnfw_out_feedback_out_41,
        out_feedback_valid_out_41 => i_acl_push_i32_mul2054_push41_gemm_nnfw_out_feedback_valid_out_41,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i32_mul2054_pop41_gemm_nnfw(BLACKBOX,67)@1
    -- out out_feedback_stall_out_41@20000000
    thei_acl_pop_i32_mul2054_pop41_gemm_nnfw : i_acl_pop_i32_mul2054_pop41_gemm_nnfw178
    PORT MAP (
        in_data_in => in_c0_eni15_2,
        in_dir => in_c0_eni15_1,
        in_feedback_in_41 => i_acl_push_i32_mul2054_push41_gemm_nnfw_out_feedback_out_41,
        in_feedback_valid_in_41 => i_acl_push_i32_mul2054_push41_gemm_nnfw_out_feedback_valid_out_41,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_mul2054_pop41_gemm_nnfw_out_data_out,
        out_feedback_stall_out_41 => i_acl_pop_i32_mul2054_pop41_gemm_nnfw_out_feedback_stall_out_41,
        clock => clock,
        resetn => resetn
    );

    -- redist6_i_acl_pop_i32_mul2054_pop41_gemm_nnfw_out_data_out_1(DELAY,149)
    redist6_i_acl_pop_i32_mul2054_pop41_gemm_nnfw_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i32_mul2054_pop41_gemm_nnfw_out_data_out, xout => redist6_i_acl_pop_i32_mul2054_pop41_gemm_nnfw_out_data_out_1_q, clk => clock, aclr => resetn );

    -- c_i32_1gr(CONSTANT,55)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- i_inc31_gemm_nnfw(ADD,89)@4
    i_inc31_gemm_nnfw_a <= STD_LOGIC_VECTOR("0" & redist9_i_acl_pop_i32_k_384_pop30_gemm_nnfw_out_data_out_3_q);
    i_inc31_gemm_nnfw_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc31_gemm_nnfw_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc31_gemm_nnfw_a) + UNSIGNED(i_inc31_gemm_nnfw_b));
    i_inc31_gemm_nnfw_q <= i_inc31_gemm_nnfw_o(32 downto 0);

    -- bgTrunc_i_inc31_gemm_nnfw_sel_x(BITSELECT,4)@4
    bgTrunc_i_inc31_gemm_nnfw_sel_x_b <= i_inc31_gemm_nnfw_q(31 downto 0);

    -- i_acl_push_i32_k_384_push30_gemm_nnfw(BLACKBOX,78)@4
    -- out out_feedback_out_30@20000000
    -- out out_feedback_valid_out_30@20000000
    thei_acl_push_i32_k_384_push30_gemm_nnfw : i_acl_push_i32_k_384_push30_gemm_nnfw203
    PORT MAP (
        in_data_in => bgTrunc_i_inc31_gemm_nnfw_sel_x_b,
        in_fanout_adaptor => redist0_i_unnamed_gemm_nnfw196_q_1_q,
        in_feedback_stall_in_30 => i_acl_pop_i32_k_384_pop30_gemm_nnfw_out_feedback_stall_out_30,
        in_stall_in => GND_q,
        in_valid_in => redist22_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_30 => i_acl_push_i32_k_384_push30_gemm_nnfw_out_feedback_out_30,
        out_feedback_valid_out_30 => i_acl_push_i32_k_384_push30_gemm_nnfw_out_feedback_valid_out_30,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i32_k_384_pop30_gemm_nnfw(BLACKBOX,66)@1
    -- out out_feedback_stall_out_30@20000000
    thei_acl_pop_i32_k_384_pop30_gemm_nnfw : i_acl_pop_i32_k_384_pop30_gemm_nnfw176
    PORT MAP (
        in_data_in => c_i32_0gr_q,
        in_dir => in_c0_eni15_1,
        in_feedback_in_30 => i_acl_push_i32_k_384_push30_gemm_nnfw_out_feedback_out_30,
        in_feedback_valid_in_30 => i_acl_push_i32_k_384_push30_gemm_nnfw_out_feedback_valid_out_30,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_k_384_pop30_gemm_nnfw_out_data_out,
        out_feedback_stall_out_30 => i_acl_pop_i32_k_384_pop30_gemm_nnfw_out_feedback_stall_out_30,
        clock => clock,
        resetn => resetn
    );

    -- redist8_i_acl_pop_i32_k_384_pop30_gemm_nnfw_out_data_out_1(DELAY,151)
    redist8_i_acl_pop_i32_k_384_pop30_gemm_nnfw_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i32_k_384_pop30_gemm_nnfw_out_data_out, xout => redist8_i_acl_pop_i32_k_384_pop30_gemm_nnfw_out_data_out_1_q, clk => clock, aclr => resetn );

    -- i_add21_gemm_nnfw(ADD,83)@2
    i_add21_gemm_nnfw_a <= STD_LOGIC_VECTOR("0" & redist8_i_acl_pop_i32_k_384_pop30_gemm_nnfw_out_data_out_1_q);
    i_add21_gemm_nnfw_b <= STD_LOGIC_VECTOR("0" & redist6_i_acl_pop_i32_mul2054_pop41_gemm_nnfw_out_data_out_1_q);
    i_add21_gemm_nnfw_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add21_gemm_nnfw_a) + UNSIGNED(i_add21_gemm_nnfw_b));
    i_add21_gemm_nnfw_q <= i_add21_gemm_nnfw_o(32 downto 0);

    -- bgTrunc_i_add21_gemm_nnfw_sel_x(BITSELECT,2)@2
    bgTrunc_i_add21_gemm_nnfw_sel_x_b <= i_add21_gemm_nnfw_q(31 downto 0);

    -- redist24_bgTrunc_i_add21_gemm_nnfw_sel_x_b_1(DELAY,167)
    redist24_bgTrunc_i_add21_gemm_nnfw_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add21_gemm_nnfw_sel_x_b, xout => redist24_bgTrunc_i_add21_gemm_nnfw_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_conv23_gemm_nnfw_sel_x(BITSELECT,32)@3
    i_conv23_gemm_nnfw_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist24_bgTrunc_i_add21_gemm_nnfw_sel_x_b_1_q(31 downto 0)), 64)));

    -- leftShiftStage0_uid133_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x(MUX,132)@3
    leftShiftStage0_uid133_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x_s <= VCC_q;
    leftShiftStage0_uid133_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x_combproc: PROCESS (leftShiftStage0_uid133_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x_s, i_conv23_gemm_nnfw_sel_x_b, leftShiftStage0Idx1_uid131_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid133_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid133_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x_q <= i_conv23_gemm_nnfw_sel_x_b;
            WHEN "1" => leftShiftStage0_uid133_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x_q <= leftShiftStage0Idx1_uid131_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid133_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_vscale_i1_gemm_nnfw_vt_select_63(BITSELECT,99)@3
    i_vscale_i1_gemm_nnfw_vt_select_63_b <= leftShiftStage0_uid133_i_vscale_i1_gemm_nnfw_gemm_nnfw180_shift_x_q(63 downto 4);

    -- i_vscale_i1_gemm_nnfw_vt_const_3(CONSTANT,97)
    i_vscale_i1_gemm_nnfw_vt_const_3_q <= "0000";

    -- i_vscale_i1_gemm_nnfw_vt_join(BITJOIN,98)@3
    i_vscale_i1_gemm_nnfw_vt_join_q <= i_vscale_i1_gemm_nnfw_vt_select_63_b & i_vscale_i1_gemm_nnfw_vt_const_3_q;

    -- i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_bs1_merged_bit_select(BITSELECT,142)@3
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_bs1_merged_bit_select_b <= i_vscale_i1_gemm_nnfw_vt_join_q(17 downto 0);
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_bs1_merged_bit_select_c <= i_vscale_i1_gemm_nnfw_vt_join_q(63 downto 54);
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_bs1_merged_bit_select_d <= i_vscale_i1_gemm_nnfw_vt_join_q(35 downto 18);
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_bs1_merged_bit_select_e <= i_vscale_i1_gemm_nnfw_vt_join_q(53 downto 36);

    -- i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im3_shift0(BITSHIFT,139)@3
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im3_shift0_qint <= i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_bs1_merged_bit_select_c & "0";
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im3_shift0_q <= i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im3_shift0_qint(10 downto 0);

    -- i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_align_15(BITSHIFT,122)@3
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im3_shift0_q) & "0000000000000000";
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_align_15_q <= i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_align_15_qint(27 downto 0);

    -- i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im6_shift0(BITSHIFT,140)@3
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im6_shift0_qint <= i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_bs1_merged_bit_select_d & "0";
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im6_shift0_q <= i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im6_shift0_qint(18 downto 0);

    -- i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_align_14(BITSHIFT,121)@3
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im6_shift0_q) & "000000000000000000";
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_align_14_q <= i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_align_14_qint(37 downto 0);

    -- i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_join_16(BITJOIN,123)@3
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_join_16_q <= i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_align_15_q & i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_align_14_q;

    -- i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im9_shift0(BITSHIFT,141)@3
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im9_shift0_qint <= i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_bs1_merged_bit_select_e & "0";
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im9_shift0_q <= i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im9_shift0_qint(18 downto 0);

    -- i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_align_12(BITSHIFT,119)@3
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im9_shift0_q) & "0000000000000000";
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_align_12_q <= i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_align_12_qint(35 downto 0);

    -- i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im0_shift0(BITSHIFT,138)@3
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im0_shift0_qint <= i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_bs1_merged_bit_select_b & "0";
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im0_shift0_q <= i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im0_shift0_qint(18 downto 0);

    -- i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_join_13(BITJOIN,120)@3
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_join_13_q <= i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_im0_shift0_q);

    -- i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_result_add_0_0(ADD,124)@3
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_join_13_q);
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_join_16_q);
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_result_add_0_0_a) + UNSIGNED(i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_result_add_0_0_b));
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_result_add_0_0_q <= i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_result_add_0_0_o(66 downto 0);

    -- i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_extender_x(BITJOIN,36)@3
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_extender_x_q <= i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_multconst_x_q & i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_x_result_add_0_0_q(65 downto 0);

    -- i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_trunc_sel_x(BITSELECT,38)@3
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_trunc_sel_x_b <= i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_mult_extender_x_q(63 downto 0);

    -- redist23_i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_trunc_sel_x_b_1(DELAY,166)
    redist23_i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_trunc_sel_x_b, xout => redist23_i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_a_sync_buffer_gemm_nnfw(BLACKBOX,92)@0
    -- in in_i_dependence@4
    -- in in_valid_in@4
    -- out out_buffer_out@4
    -- out out_valid_out@4
    thei_syncbuf_a_sync_buffer_gemm_nnfw : i_syncbuf_a_sync_buffer_gemm_nnfw181
    PORT MAP (
        in_buffer_in => in_A,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist22_sync_in_aunroll_x_in_i_valid_3_q,
        out_buffer_out => i_syncbuf_a_sync_buffer_gemm_nnfw_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_add_x(ADD,39)@4
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_a_sync_buffer_gemm_nnfw_out_buffer_out);
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_add_x_b <= STD_LOGIC_VECTOR("0" & redist23_i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_trunc_sel_x_b_1_q);
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_add_x_a) + UNSIGNED(i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_add_x_b));
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_add_x_q <= i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_add_x_o(64 downto 0);

    -- i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_dupName_0_trunc_sel_x(BITSELECT,33)@4
    i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_dupName_0_trunc_sel_x_b <= i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_add_x_q(63 downto 0);

    -- redist9_i_acl_pop_i32_k_384_pop30_gemm_nnfw_out_data_out_3(DELAY,152)
    redist9_i_acl_pop_i32_k_384_pop30_gemm_nnfw_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist8_i_acl_pop_i32_k_384_pop30_gemm_nnfw_out_data_out_1_q, xout => redist9_i_acl_pop_i32_k_384_pop30_gemm_nnfw_out_data_out_3_q, clk => clock, aclr => resetn );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,48)@4
    out_c0_exi11143_0 <= GND_q;
    out_c0_exi11143_1 <= redist9_i_acl_pop_i32_k_384_pop30_gemm_nnfw_out_data_out_3_q;
    out_c0_exi11143_2 <= i_vloadgep_i2_gemm_nnfw_gemm_nnfw183_dupName_0_trunc_sel_x_b;
    out_c0_exi11143_3 <= redist1_i_unnamed_gemm_nnfw192_q_1_q;
    out_c0_exi11143_4 <= i_phi_decision164_xor_rm_gemm_nnfw_q;
    out_c0_exi11143_5 <= redist0_i_unnamed_gemm_nnfw196_q_1_q;
    out_c0_exi11143_6 <= redist3_i_acl_pop_i64_conv15_hf_tofpc53_pop40_gemm_nnfw_out_data_out_3_q;
    out_c0_exi11143_7 <= redist13_i_acl_pop_i1_pop31_gemm_nnfw_out_data_out_3_q;
    out_c0_exi11143_8 <= redist17_i_acl_pop_i1_notexit2934_pop32_gemm_nnfw_out_data_out_3_q;
    out_c0_exi11143_9 <= redist2_i_acl_pop_p1h_arrayidx1452_pop39_gemm_nnfw_out_data_out_3_q;
    out_c0_exi11143_10 <= redist15_i_acl_pop_i1_phi_decision156_xor_rm1655_pop42_gemm_nnfw_out_data_out_3_q;
    out_c0_exi11143_11 <= redist11_i_acl_pop_i1_pop43_gemm_nnfw_out_data_out_3_q;
    out_o_valid <= redist22_sync_in_aunroll_x_in_i_valid_3_q;

    -- i_acl_push_i1_notexitcond20_gemm_nnfw(BLACKBOX,74)@4
    -- out out_feedback_out_4@20000000
    -- out out_feedback_valid_out_4@20000000
    thei_acl_push_i1_notexitcond20_gemm_nnfw : i_acl_push_i1_notexitcond20_gemm_nnfw207
    PORT MAP (
        in_data_in => redist0_i_unnamed_gemm_nnfw196_q_1_q,
        in_feedback_stall_in_4 => i_acl_pipeline_keep_going19_gemm_nnfw_out_not_exitcond_stall_out,
        in_stall_in => GND_q,
        in_valid_in => redist22_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_4 => i_acl_push_i1_notexitcond20_gemm_nnfw_out_feedback_out_4,
        out_feedback_valid_out_4 => i_acl_push_i1_notexitcond20_gemm_nnfw_out_feedback_valid_out_4,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going19_gemm_nnfw(BLACKBOX,59)@4
    -- out out_exiting_stall_out@20000000
    -- out out_exiting_valid_out@20000000
    -- out out_initeration_stall_out@20000000
    -- out out_not_exitcond_stall_out@20000000
    -- out out_pipeline_valid_out@20000000
    thei_acl_pipeline_keep_going19_gemm_nnfw : i_acl_pipeline_keep_going19_gemm_nnfw174
    PORT MAP (
        in_data_in => VCC_q,
        in_initeration_in => GND_q,
        in_initeration_valid_in => GND_q,
        in_not_exitcond_in => i_acl_push_i1_notexitcond20_gemm_nnfw_out_feedback_out_4,
        in_not_exitcond_valid_in => i_acl_push_i1_notexitcond20_gemm_nnfw_out_feedback_valid_out_4,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_stall_in => GND_q,
        in_valid_in => redist22_sync_in_aunroll_x_in_i_valid_3_q,
        out_exiting_stall_out => i_acl_pipeline_keep_going19_gemm_nnfw_out_exiting_stall_out,
        out_exiting_valid_out => i_acl_pipeline_keep_going19_gemm_nnfw_out_exiting_valid_out,
        out_not_exitcond_stall_out => i_acl_pipeline_keep_going19_gemm_nnfw_out_not_exitcond_stall_out,
        out_pipeline_valid_out => i_acl_pipeline_keep_going19_gemm_nnfw_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ext_sig_sync_out(GPOUT,58)
    out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_valid_out <= i_acl_pipeline_keep_going19_gemm_nnfw_out_exiting_valid_out;
    out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_stall_out <= i_acl_pipeline_keep_going19_gemm_nnfw_out_exiting_stall_out;

    -- pipeline_valid_out_sync(GPOUT,104)
    out_pipeline_valid_out <= i_acl_pipeline_keep_going19_gemm_nnfw_out_pipeline_valid_out;

END normal;
