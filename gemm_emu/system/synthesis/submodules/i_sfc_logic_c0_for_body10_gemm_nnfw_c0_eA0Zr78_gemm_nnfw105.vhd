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

-- VHDL created from i_sfc_logic_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw105
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

entity i_sfc_logic_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw105 is
    port (
        in_C : in std_logic_vector(63 downto 0);  -- ufix64
        in_M : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni9_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni9_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni9_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni9_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni9_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni9_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni9_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni9_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni9_8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni9_9 : in std_logic_vector(32 downto 0);  -- ufix33
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi13_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi13_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi13_2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi13_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi13_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi13_5 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi13_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi13_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi13_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi13_9 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi13_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi13_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi13_12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi13_13 : out std_logic_vector(32 downto 0);  -- ufix33
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw105;

architecture normal of i_sfc_logic_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw105 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_pipeline_keep_going23_gemm_nnfw107 is
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


    component i_acl_pop_i1_cmp380_rm39_pop17_gemm_nnfw150 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_17 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw123 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_16 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_memdep_phi6_pop1143_pop20_gemm_nnfw116 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_20 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_20 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_20 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_notexit2933_pop14_gemm_nnfw146 is
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


    component i_acl_pop_i1_pop13_gemm_nnfw142 is
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


    component i_acl_pop_i32_i_287_pop12_gemm_nnfw109 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_12 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_mul1141_pop18_gemm_nnfw111 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_18 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_18 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw118 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i33_pop19_gemm_nnfw154 is
        port (
            in_data_in : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_19 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_feedback_valid_in_19 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_feedback_stall_out_19 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_cmp380_rm39_push17_gemm_nnfw152 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_17 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_cmp88_rm37_push16_gemm_nnfw134 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_16 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_memdep_phi6_pop1143_push20_gemm_nnfw130 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_20 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_20 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_20 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_notexit2933_push14_gemm_nnfw148 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_14 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_notexitcond24_gemm_nnfw140 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_6 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_push13_gemm_nnfw144 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_13 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_i_287_push12_gemm_nnfw138 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_12 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_mul1141_push18_gemm_nnfw132 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_18 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_18 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_sdiv_sh125_rm35_push15_gemm_nnfw136 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i33_push19_gemm_nnfw156 is
        port (
            in_data_in : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_feedback_stall_in_19 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_feedback_out_19 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_feedback_valid_out_19 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_c_sync_buffer_gemm_nnfw113 is
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


    component i_syncbuf_m_sync_buffer8_gemm_nnfw126 is
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


    component i_syncbuf_m_sync_buffer_gemm_nnfw120 is
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
    signal bgTrunc_i_add12_gemm_nnfw_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_inc39_gemm_nnfw_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul20_gemm_nnfw_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_multconst_x_q : STD_LOGIC_VECTOR (61 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom13_gemm_nnfw_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pipeline_keep_going23_gemm_nnfw_out_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going23_gemm_nnfw_out_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going23_gemm_nnfw_out_not_exitcond_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going23_gemm_nnfw_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_cmp380_rm39_pop17_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_cmp380_rm39_pop17_gemm_nnfw_out_feedback_stall_out_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw_out_feedback_stall_out_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi6_pop1143_pop20_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi6_pop1143_pop20_gemm_nnfw_out_feedback_stall_out_20 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_notexit2933_pop14_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_notexit2933_pop14_gemm_nnfw_out_feedback_stall_out_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_pop13_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_pop13_gemm_nnfw_out_feedback_stall_out_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_i_287_pop12_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_i_287_pop12_gemm_nnfw_out_feedback_stall_out_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_mul1141_pop18_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_mul1141_pop18_gemm_nnfw_out_feedback_stall_out_18 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw_out_feedback_stall_out_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i33_pop19_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (32 downto 0);
    signal i_acl_pop_i33_pop19_gemm_nnfw_out_feedback_stall_out_19 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_cmp380_rm39_push17_gemm_nnfw_out_feedback_out_17 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_cmp380_rm39_push17_gemm_nnfw_out_feedback_valid_out_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_cmp88_rm37_push16_gemm_nnfw_out_feedback_out_16 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_cmp88_rm37_push16_gemm_nnfw_out_feedback_valid_out_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi6_pop1143_push20_gemm_nnfw_out_feedback_out_20 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_memdep_phi6_pop1143_push20_gemm_nnfw_out_feedback_valid_out_20 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_notexit2933_push14_gemm_nnfw_out_feedback_out_14 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_notexit2933_push14_gemm_nnfw_out_feedback_valid_out_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_notexitcond24_gemm_nnfw_out_feedback_out_6 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_notexitcond24_gemm_nnfw_out_feedback_valid_out_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_push13_gemm_nnfw_out_feedback_out_13 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_push13_gemm_nnfw_out_feedback_valid_out_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_i_287_push12_gemm_nnfw_out_feedback_out_12 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_i_287_push12_gemm_nnfw_out_feedback_valid_out_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_mul1141_push18_gemm_nnfw_out_feedback_out_18 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_mul1141_push18_gemm_nnfw_out_feedback_valid_out_18 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_sdiv_sh125_rm35_push15_gemm_nnfw_out_feedback_out_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_sdiv_sh125_rm35_push15_gemm_nnfw_out_feedback_valid_out_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i33_push19_gemm_nnfw_out_feedback_out_19 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_push_i33_push19_gemm_nnfw_out_feedback_valid_out_19 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add12_gemm_nnfw_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add12_gemm_nnfw_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add12_gemm_nnfw_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add12_gemm_nnfw_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_cmp886_rm83_gemm_nnfw_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp886_rm83_gemm_nnfw_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp886_rm83_gemm_nnfw_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp886_rm83_gemm_nnfw_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond_gemm_nnfw_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond_not_gemm_nnfw_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_inc39_gemm_nnfw_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc39_gemm_nnfw_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc39_gemm_nnfw_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc39_gemm_nnfw_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_notexit25_gemm_nnfw_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phi_decision156_xor_rm16_gemm_nnfw_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phi_decision156_xor_rm16_gemm_nnfw_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_c_sync_buffer_gemm_nnfw_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_m_sync_buffer8_gemm_nnfw_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_m_sync_buffer_gemm_nnfw_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_gemm_nnfw125_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gemm_nnfw129_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_join_13_q : STD_LOGIC_VECTOR (55 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_align_14_q : STD_LOGIC_VECTOR (37 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_align_14_qint : STD_LOGIC_VECTOR (37 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_join_16_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (66 downto 0);
    signal bgTrunc_i_mul20_gemm_nnfw_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul20_gemm_nnfw_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul20_gemm_nnfw_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul20_gemm_nnfw_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul20_gemm_nnfw_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul20_gemm_nnfw_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul20_gemm_nnfw_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul20_gemm_nnfw_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul20_gemm_nnfw_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul20_gemm_nnfw_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul20_gemm_nnfw_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul20_gemm_nnfw_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul20_gemm_nnfw_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul20_gemm_nnfw_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul20_gemm_nnfw_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul20_gemm_nnfw_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul20_gemm_nnfw_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (10 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul20_gemm_nnfw_im0_cma_reset : std_logic;
    type i_mul20_gemm_nnfw_im0_cma_a0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal i_mul20_gemm_nnfw_im0_cma_a0 : i_mul20_gemm_nnfw_im0_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of i_mul20_gemm_nnfw_im0_cma_a0 : signal is true;
    signal i_mul20_gemm_nnfw_im0_cma_c0 : i_mul20_gemm_nnfw_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul20_gemm_nnfw_im0_cma_c0 : signal is true;
    type i_mul20_gemm_nnfw_im0_cma_ptype is array(NATURAL range <>) of UNSIGNED(35 downto 0);
    signal i_mul20_gemm_nnfw_im0_cma_p : i_mul20_gemm_nnfw_im0_cma_ptype(0 to 0);
    signal i_mul20_gemm_nnfw_im0_cma_u : i_mul20_gemm_nnfw_im0_cma_ptype(0 to 0);
    signal i_mul20_gemm_nnfw_im0_cma_w : i_mul20_gemm_nnfw_im0_cma_ptype(0 to 0);
    signal i_mul20_gemm_nnfw_im0_cma_x : i_mul20_gemm_nnfw_im0_cma_ptype(0 to 0);
    signal i_mul20_gemm_nnfw_im0_cma_y : i_mul20_gemm_nnfw_im0_cma_ptype(0 to 0);
    signal i_mul20_gemm_nnfw_im0_cma_s : i_mul20_gemm_nnfw_im0_cma_ptype(0 to 0);
    signal i_mul20_gemm_nnfw_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul20_gemm_nnfw_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul20_gemm_nnfw_im0_cma_ena0 : std_logic;
    signal i_mul20_gemm_nnfw_im0_cma_ena1 : std_logic;
    signal i_mul20_gemm_nnfw_im10_cma_reset : std_logic;
    type i_mul20_gemm_nnfw_im10_cma_a0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal i_mul20_gemm_nnfw_im10_cma_a0 : i_mul20_gemm_nnfw_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul20_gemm_nnfw_im10_cma_a0 : signal is true;
    signal i_mul20_gemm_nnfw_im10_cma_c0 : i_mul20_gemm_nnfw_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul20_gemm_nnfw_im10_cma_c0 : signal is true;
    type i_mul20_gemm_nnfw_im10_cma_ptype is array(NATURAL range <>) of UNSIGNED(27 downto 0);
    signal i_mul20_gemm_nnfw_im10_cma_p : i_mul20_gemm_nnfw_im10_cma_ptype(0 to 0);
    signal i_mul20_gemm_nnfw_im10_cma_u : i_mul20_gemm_nnfw_im10_cma_ptype(0 to 0);
    signal i_mul20_gemm_nnfw_im10_cma_w : i_mul20_gemm_nnfw_im10_cma_ptype(0 to 0);
    signal i_mul20_gemm_nnfw_im10_cma_x : i_mul20_gemm_nnfw_im10_cma_ptype(0 to 0);
    signal i_mul20_gemm_nnfw_im10_cma_y : i_mul20_gemm_nnfw_im10_cma_ptype(0 to 0);
    signal i_mul20_gemm_nnfw_im10_cma_s : i_mul20_gemm_nnfw_im10_cma_ptype(0 to 0);
    signal i_mul20_gemm_nnfw_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul20_gemm_nnfw_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul20_gemm_nnfw_im10_cma_ena0 : std_logic;
    signal i_mul20_gemm_nnfw_im10_cma_ena1 : std_logic;
    signal i_mul20_gemm_nnfw_ma3_cma_reset : std_logic;
    signal i_mul20_gemm_nnfw_ma3_cma_a0 : i_mul20_gemm_nnfw_im10_cma_a0type(0 to 1);
    attribute preserve of i_mul20_gemm_nnfw_ma3_cma_a0 : signal is true;
    type i_mul20_gemm_nnfw_ma3_cma_c0type is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal i_mul20_gemm_nnfw_ma3_cma_c0 : i_mul20_gemm_nnfw_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul20_gemm_nnfw_ma3_cma_c0 : signal is true;
    type i_mul20_gemm_nnfw_ma3_cma_ltype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal i_mul20_gemm_nnfw_ma3_cma_l : i_mul20_gemm_nnfw_ma3_cma_ltype(0 to 1);
    type i_mul20_gemm_nnfw_ma3_cma_ptype is array(NATURAL range <>) of SIGNED(33 downto 0);
    signal i_mul20_gemm_nnfw_ma3_cma_p : i_mul20_gemm_nnfw_ma3_cma_ptype(0 to 1);
    type i_mul20_gemm_nnfw_ma3_cma_utype is array(NATURAL range <>) of SIGNED(34 downto 0);
    signal i_mul20_gemm_nnfw_ma3_cma_u : i_mul20_gemm_nnfw_ma3_cma_utype(0 to 1);
    signal i_mul20_gemm_nnfw_ma3_cma_w : i_mul20_gemm_nnfw_ma3_cma_utype(0 to 0);
    signal i_mul20_gemm_nnfw_ma3_cma_x : i_mul20_gemm_nnfw_ma3_cma_utype(0 to 0);
    signal i_mul20_gemm_nnfw_ma3_cma_y : i_mul20_gemm_nnfw_ma3_cma_utype(0 to 0);
    signal i_mul20_gemm_nnfw_ma3_cma_s : i_mul20_gemm_nnfw_ma3_cma_utype(0 to 0);
    signal i_mul20_gemm_nnfw_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul20_gemm_nnfw_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul20_gemm_nnfw_ma3_cma_ena0 : std_logic;
    signal i_mul20_gemm_nnfw_ma3_cma_ena1 : std_logic;
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul20_gemm_nnfw_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul20_gemm_nnfw_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal redist0_i_mul20_gemm_nnfw_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist1_i_mul20_gemm_nnfw_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist2_i_mul20_gemm_nnfw_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist3_i_phi_decision156_xor_rm16_gemm_nnfw_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_notexit25_gemm_nnfw_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_notexit25_gemm_nnfw_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_exitcond_gemm_nnfw_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_acl_pop_i33_pop19_gemm_nnfw_out_data_out_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist8_i_acl_pop_i33_pop19_gemm_nnfw_out_data_out_3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist9_i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw_out_data_out_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw_out_data_out_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_i_acl_pop_i32_mul1141_pop18_gemm_nnfw_out_data_out_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_i_acl_pop_i32_mul1141_pop18_gemm_nnfw_out_data_out_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_i_acl_pop_i32_i_287_pop12_gemm_nnfw_out_data_out_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist14_i_acl_pop_i1_pop13_gemm_nnfw_out_data_out_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_acl_pop_i1_pop13_gemm_nnfw_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_i_acl_pop_i1_notexit2933_pop14_gemm_nnfw_out_data_out_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_i_acl_pop_i1_notexit2933_pop14_gemm_nnfw_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_i_acl_pop_i1_memdep_phi6_pop1143_pop20_gemm_nnfw_out_data_out_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_i_acl_pop_i1_memdep_phi6_pop1143_pop20_gemm_nnfw_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_i_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw_out_data_out_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_i_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_i_acl_pop_i1_cmp380_rm39_pop17_gemm_nnfw_out_data_out_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_i_acl_pop_i1_cmp380_rm39_pop17_gemm_nnfw_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_sync_in_aunroll_x_in_i_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_sync_in_aunroll_x_in_i_valid_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_i_arrayidx14_gemm_nnfw_gemm_nnfw115_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist27_bgTrunc_i_add12_gemm_nnfw_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist24_sync_in_aunroll_x_in_i_valid_1(DELAY,164)
    redist24_sync_in_aunroll_x_in_i_valid_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist24_sync_in_aunroll_x_in_i_valid_1_q, clk => clock, aclr => resetn );

    -- redist25_sync_in_aunroll_x_in_i_valid_3(DELAY,165)
    redist25_sync_in_aunroll_x_in_i_valid_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist24_sync_in_aunroll_x_in_i_valid_1_q, xout => redist25_sync_in_aunroll_x_in_i_valid_3_q, clk => clock, aclr => resetn );

    -- i_syncbuf_m_sync_buffer8_gemm_nnfw(BLACKBOX,81)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_m_sync_buffer8_gemm_nnfw : i_syncbuf_m_sync_buffer8_gemm_nnfw126
    PORT MAP (
        in_buffer_in => in_M,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_m_sync_buffer8_gemm_nnfw_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_1gr(CONSTANT,48)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- i_acl_push_i32_i_287_push12_gemm_nnfw(BLACKBOX,66)@1
    -- out out_feedback_out_12@20000000
    -- out out_feedback_valid_out_12@20000000
    thei_acl_push_i32_i_287_push12_gemm_nnfw : i_acl_push_i32_i_287_push12_gemm_nnfw138
    PORT MAP (
        in_data_in => bgTrunc_i_inc39_gemm_nnfw_sel_x_b,
        in_feedback_stall_in_12 => i_acl_pop_i32_i_287_pop12_gemm_nnfw_out_feedback_stall_out_12,
        in_notexit25 => i_notexit25_gemm_nnfw_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_12 => i_acl_push_i32_i_287_push12_gemm_nnfw_out_feedback_out_12,
        out_feedback_valid_out_12 => i_acl_push_i32_i_287_push12_gemm_nnfw_out_feedback_valid_out_12,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_0gr(CONSTANT,47)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- i_acl_pop_i32_i_287_pop12_gemm_nnfw(BLACKBOX,56)@1
    -- out out_feedback_stall_out_12@20000000
    thei_acl_pop_i32_i_287_pop12_gemm_nnfw : i_acl_pop_i32_i_287_pop12_gemm_nnfw109
    PORT MAP (
        in_data_in => c_i32_0gr_q,
        in_dir => in_c0_eni9_1,
        in_feedback_in_12 => i_acl_push_i32_i_287_push12_gemm_nnfw_out_feedback_out_12,
        in_feedback_valid_in_12 => i_acl_push_i32_i_287_push12_gemm_nnfw_out_feedback_valid_out_12,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_i_287_pop12_gemm_nnfw_out_data_out,
        out_feedback_stall_out_12 => i_acl_pop_i32_i_287_pop12_gemm_nnfw_out_feedback_stall_out_12,
        clock => clock,
        resetn => resetn
    );

    -- i_inc39_gemm_nnfw(ADD,76)@1
    i_inc39_gemm_nnfw_a <= STD_LOGIC_VECTOR("0" & i_acl_pop_i32_i_287_pop12_gemm_nnfw_out_data_out);
    i_inc39_gemm_nnfw_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc39_gemm_nnfw_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc39_gemm_nnfw_a) + UNSIGNED(i_inc39_gemm_nnfw_b));
    i_inc39_gemm_nnfw_q <= i_inc39_gemm_nnfw_o(32 downto 0);

    -- bgTrunc_i_inc39_gemm_nnfw_sel_x(BITSELECT,3)@1
    bgTrunc_i_inc39_gemm_nnfw_sel_x_b <= i_inc39_gemm_nnfw_q(31 downto 0);

    -- i_exitcond_gemm_nnfw(LOGICAL,72)@1
    i_exitcond_gemm_nnfw_q <= "1" WHEN bgTrunc_i_inc39_gemm_nnfw_sel_x_b = i_syncbuf_m_sync_buffer8_gemm_nnfw_out_buffer_out ELSE "0";

    -- i_exitcond_not_gemm_nnfw(LOGICAL,73)@1
    i_exitcond_not_gemm_nnfw_q <= i_exitcond_gemm_nnfw_q xor VCC_q;

    -- i_syncbuf_m_sync_buffer_gemm_nnfw(BLACKBOX,82)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_m_sync_buffer_gemm_nnfw : i_syncbuf_m_sync_buffer_gemm_nnfw120
    PORT MAP (
        in_buffer_in => in_M,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_m_sync_buffer_gemm_nnfw_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_cmp886_rm83_gemm_nnfw(COMPARE,71)@1
    i_cmp886_rm83_gemm_nnfw_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_0gr_q(31)) & c_i32_0gr_q));
    i_cmp886_rm83_gemm_nnfw_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_m_sync_buffer_gemm_nnfw_out_buffer_out(31)) & i_syncbuf_m_sync_buffer_gemm_nnfw_out_buffer_out));
    i_cmp886_rm83_gemm_nnfw_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp886_rm83_gemm_nnfw_a) - SIGNED(i_cmp886_rm83_gemm_nnfw_b));
    i_cmp886_rm83_gemm_nnfw_c(0) <= i_cmp886_rm83_gemm_nnfw_o(33);

    -- redist20_i_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw_out_data_out_1(DELAY,160)
    redist20_i_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw_out_data_out, xout => redist20_i_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw_out_data_out_1_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_cmp88_rm37_push16_gemm_nnfw(BLACKBOX,61)@2
    -- out out_feedback_out_16@20000000
    -- out out_feedback_valid_out_16@20000000
    thei_acl_push_i1_cmp88_rm37_push16_gemm_nnfw : i_acl_push_i1_cmp88_rm37_push16_gemm_nnfw134
    PORT MAP (
        in_data_in => redist20_i_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw_out_data_out_1_q,
        in_feedback_stall_in_16 => i_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw_out_feedback_stall_out_16,
        in_notexit25 => redist4_i_notexit25_gemm_nnfw_q_1_q,
        in_stall_in => GND_q,
        in_valid_in => redist24_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_16 => i_acl_push_i1_cmp88_rm37_push16_gemm_nnfw_out_feedback_out_16,
        out_feedback_valid_out_16 => i_acl_push_i1_cmp88_rm37_push16_gemm_nnfw_out_feedback_valid_out_16,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw(BLACKBOX,52)@1
    -- out out_feedback_stall_out_16@20000000
    thei_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw : i_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw123
    PORT MAP (
        in_data_in => in_c0_eni9_5,
        in_dir => in_c0_eni9_1,
        in_feedback_in_16 => i_acl_push_i1_cmp88_rm37_push16_gemm_nnfw_out_feedback_out_16,
        in_feedback_valid_in_16 => i_acl_push_i1_cmp88_rm37_push16_gemm_nnfw_out_feedback_valid_out_16,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw_out_data_out,
        out_feedback_stall_out_16 => i_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw_out_feedback_stall_out_16,
        clock => clock,
        resetn => resetn
    );

    -- i_unnamed_gemm_nnfw125(LOGICAL,83)@1
    i_unnamed_gemm_nnfw125_q <= i_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw_out_data_out and i_cmp886_rm83_gemm_nnfw_c;

    -- i_notexit25_gemm_nnfw(LOGICAL,78)@1
    i_notexit25_gemm_nnfw_q <= i_unnamed_gemm_nnfw125_q and i_exitcond_not_gemm_nnfw_q;

    -- redist4_i_notexit25_gemm_nnfw_q_1(DELAY,144)
    redist4_i_notexit25_gemm_nnfw_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_notexit25_gemm_nnfw_q, xout => redist4_i_notexit25_gemm_nnfw_q_1_q, clk => clock, aclr => resetn );

    -- i_acl_push_i33_push19_gemm_nnfw(BLACKBOX,69)@2
    -- out out_feedback_out_19@20000000
    -- out out_feedback_valid_out_19@20000000
    thei_acl_push_i33_push19_gemm_nnfw : i_acl_push_i33_push19_gemm_nnfw156
    PORT MAP (
        in_data_in => redist7_i_acl_pop_i33_pop19_gemm_nnfw_out_data_out_1_q,
        in_feedback_stall_in_19 => i_acl_pop_i33_pop19_gemm_nnfw_out_feedback_stall_out_19,
        in_notexit25 => redist4_i_notexit25_gemm_nnfw_q_1_q,
        in_stall_in => GND_q,
        in_valid_in => redist24_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_19 => i_acl_push_i33_push19_gemm_nnfw_out_feedback_out_19,
        out_feedback_valid_out_19 => i_acl_push_i33_push19_gemm_nnfw_out_feedback_valid_out_19,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i33_pop19_gemm_nnfw(BLACKBOX,59)@1
    -- out out_feedback_stall_out_19@20000000
    thei_acl_pop_i33_pop19_gemm_nnfw : i_acl_pop_i33_pop19_gemm_nnfw154
    PORT MAP (
        in_data_in => in_c0_eni9_9,
        in_dir => in_c0_eni9_1,
        in_feedback_in_19 => i_acl_push_i33_push19_gemm_nnfw_out_feedback_out_19,
        in_feedback_valid_in_19 => i_acl_push_i33_push19_gemm_nnfw_out_feedback_valid_out_19,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i33_pop19_gemm_nnfw_out_data_out,
        out_feedback_stall_out_19 => i_acl_pop_i33_pop19_gemm_nnfw_out_feedback_stall_out_19,
        clock => clock,
        resetn => resetn
    );

    -- redist7_i_acl_pop_i33_pop19_gemm_nnfw_out_data_out_1(DELAY,147)
    redist7_i_acl_pop_i33_pop19_gemm_nnfw_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i33_pop19_gemm_nnfw_out_data_out, xout => redist7_i_acl_pop_i33_pop19_gemm_nnfw_out_data_out_1_q, clk => clock, aclr => resetn );

    -- redist8_i_acl_pop_i33_pop19_gemm_nnfw_out_data_out_3(DELAY,148)
    redist8_i_acl_pop_i33_pop19_gemm_nnfw_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 33, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist7_i_acl_pop_i33_pop19_gemm_nnfw_out_data_out_1_q, xout => redist8_i_acl_pop_i33_pop19_gemm_nnfw_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_cmp380_rm39_push17_gemm_nnfw(BLACKBOX,60)@2
    -- out out_feedback_out_17@20000000
    -- out out_feedback_valid_out_17@20000000
    thei_acl_push_i1_cmp380_rm39_push17_gemm_nnfw : i_acl_push_i1_cmp380_rm39_push17_gemm_nnfw152
    PORT MAP (
        in_data_in => redist22_i_acl_pop_i1_cmp380_rm39_pop17_gemm_nnfw_out_data_out_1_q,
        in_feedback_stall_in_17 => i_acl_pop_i1_cmp380_rm39_pop17_gemm_nnfw_out_feedback_stall_out_17,
        in_notexit25 => redist4_i_notexit25_gemm_nnfw_q_1_q,
        in_stall_in => GND_q,
        in_valid_in => redist24_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_17 => i_acl_push_i1_cmp380_rm39_push17_gemm_nnfw_out_feedback_out_17,
        out_feedback_valid_out_17 => i_acl_push_i1_cmp380_rm39_push17_gemm_nnfw_out_feedback_valid_out_17,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_cmp380_rm39_pop17_gemm_nnfw(BLACKBOX,51)@1
    -- out out_feedback_stall_out_17@20000000
    thei_acl_pop_i1_cmp380_rm39_pop17_gemm_nnfw : i_acl_pop_i1_cmp380_rm39_pop17_gemm_nnfw150
    PORT MAP (
        in_data_in => in_c0_eni9_8,
        in_dir => in_c0_eni9_1,
        in_feedback_in_17 => i_acl_push_i1_cmp380_rm39_push17_gemm_nnfw_out_feedback_out_17,
        in_feedback_valid_in_17 => i_acl_push_i1_cmp380_rm39_push17_gemm_nnfw_out_feedback_valid_out_17,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_cmp380_rm39_pop17_gemm_nnfw_out_data_out,
        out_feedback_stall_out_17 => i_acl_pop_i1_cmp380_rm39_pop17_gemm_nnfw_out_feedback_stall_out_17,
        clock => clock,
        resetn => resetn
    );

    -- redist22_i_acl_pop_i1_cmp380_rm39_pop17_gemm_nnfw_out_data_out_1(DELAY,162)
    redist22_i_acl_pop_i1_cmp380_rm39_pop17_gemm_nnfw_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_cmp380_rm39_pop17_gemm_nnfw_out_data_out, xout => redist22_i_acl_pop_i1_cmp380_rm39_pop17_gemm_nnfw_out_data_out_1_q, clk => clock, aclr => resetn );

    -- redist23_i_acl_pop_i1_cmp380_rm39_pop17_gemm_nnfw_out_data_out_3(DELAY,163)
    redist23_i_acl_pop_i1_cmp380_rm39_pop17_gemm_nnfw_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist22_i_acl_pop_i1_cmp380_rm39_pop17_gemm_nnfw_out_data_out_1_q, xout => redist23_i_acl_pop_i1_cmp380_rm39_pop17_gemm_nnfw_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_notexit2933_push14_gemm_nnfw(BLACKBOX,63)@2
    -- out out_feedback_out_14@20000000
    -- out out_feedback_valid_out_14@20000000
    thei_acl_push_i1_notexit2933_push14_gemm_nnfw : i_acl_push_i1_notexit2933_push14_gemm_nnfw148
    PORT MAP (
        in_data_in => redist16_i_acl_pop_i1_notexit2933_pop14_gemm_nnfw_out_data_out_1_q,
        in_feedback_stall_in_14 => i_acl_pop_i1_notexit2933_pop14_gemm_nnfw_out_feedback_stall_out_14,
        in_notexit25 => redist4_i_notexit25_gemm_nnfw_q_1_q,
        in_stall_in => GND_q,
        in_valid_in => redist24_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_14 => i_acl_push_i1_notexit2933_push14_gemm_nnfw_out_feedback_out_14,
        out_feedback_valid_out_14 => i_acl_push_i1_notexit2933_push14_gemm_nnfw_out_feedback_valid_out_14,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_notexit2933_pop14_gemm_nnfw(BLACKBOX,54)@1
    -- out out_feedback_stall_out_14@20000000
    thei_acl_pop_i1_notexit2933_pop14_gemm_nnfw : i_acl_pop_i1_notexit2933_pop14_gemm_nnfw146
    PORT MAP (
        in_data_in => in_c0_eni9_7,
        in_dir => in_c0_eni9_1,
        in_feedback_in_14 => i_acl_push_i1_notexit2933_push14_gemm_nnfw_out_feedback_out_14,
        in_feedback_valid_in_14 => i_acl_push_i1_notexit2933_push14_gemm_nnfw_out_feedback_valid_out_14,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_notexit2933_pop14_gemm_nnfw_out_data_out,
        out_feedback_stall_out_14 => i_acl_pop_i1_notexit2933_pop14_gemm_nnfw_out_feedback_stall_out_14,
        clock => clock,
        resetn => resetn
    );

    -- redist16_i_acl_pop_i1_notexit2933_pop14_gemm_nnfw_out_data_out_1(DELAY,156)
    redist16_i_acl_pop_i1_notexit2933_pop14_gemm_nnfw_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_notexit2933_pop14_gemm_nnfw_out_data_out, xout => redist16_i_acl_pop_i1_notexit2933_pop14_gemm_nnfw_out_data_out_1_q, clk => clock, aclr => resetn );

    -- redist17_i_acl_pop_i1_notexit2933_pop14_gemm_nnfw_out_data_out_3(DELAY,157)
    redist17_i_acl_pop_i1_notexit2933_pop14_gemm_nnfw_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist16_i_acl_pop_i1_notexit2933_pop14_gemm_nnfw_out_data_out_1_q, xout => redist17_i_acl_pop_i1_notexit2933_pop14_gemm_nnfw_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_push13_gemm_nnfw(BLACKBOX,65)@2
    -- out out_feedback_out_13@20000000
    -- out out_feedback_valid_out_13@20000000
    thei_acl_push_i1_push13_gemm_nnfw : i_acl_push_i1_push13_gemm_nnfw144
    PORT MAP (
        in_data_in => redist14_i_acl_pop_i1_pop13_gemm_nnfw_out_data_out_1_q,
        in_feedback_stall_in_13 => i_acl_pop_i1_pop13_gemm_nnfw_out_feedback_stall_out_13,
        in_notexit25 => redist4_i_notexit25_gemm_nnfw_q_1_q,
        in_stall_in => GND_q,
        in_valid_in => redist24_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_13 => i_acl_push_i1_push13_gemm_nnfw_out_feedback_out_13,
        out_feedback_valid_out_13 => i_acl_push_i1_push13_gemm_nnfw_out_feedback_valid_out_13,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_pop13_gemm_nnfw(BLACKBOX,55)@1
    -- out out_feedback_stall_out_13@20000000
    thei_acl_pop_i1_pop13_gemm_nnfw : i_acl_pop_i1_pop13_gemm_nnfw142
    PORT MAP (
        in_data_in => in_c0_eni9_6,
        in_dir => in_c0_eni9_1,
        in_feedback_in_13 => i_acl_push_i1_push13_gemm_nnfw_out_feedback_out_13,
        in_feedback_valid_in_13 => i_acl_push_i1_push13_gemm_nnfw_out_feedback_valid_out_13,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_pop13_gemm_nnfw_out_data_out,
        out_feedback_stall_out_13 => i_acl_pop_i1_pop13_gemm_nnfw_out_feedback_stall_out_13,
        clock => clock,
        resetn => resetn
    );

    -- redist14_i_acl_pop_i1_pop13_gemm_nnfw_out_data_out_1(DELAY,154)
    redist14_i_acl_pop_i1_pop13_gemm_nnfw_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_pop13_gemm_nnfw_out_data_out, xout => redist14_i_acl_pop_i1_pop13_gemm_nnfw_out_data_out_1_q, clk => clock, aclr => resetn );

    -- redist15_i_acl_pop_i1_pop13_gemm_nnfw_out_data_out_3(DELAY,155)
    redist15_i_acl_pop_i1_pop13_gemm_nnfw_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist14_i_acl_pop_i1_pop13_gemm_nnfw_out_data_out_1_q, xout => redist15_i_acl_pop_i1_pop13_gemm_nnfw_out_data_out_3_q, clk => clock, aclr => resetn );

    -- redist5_i_notexit25_gemm_nnfw_q_3(DELAY,145)
    redist5_i_notexit25_gemm_nnfw_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist4_i_notexit25_gemm_nnfw_q_1_q, xout => redist5_i_notexit25_gemm_nnfw_q_3_q, clk => clock, aclr => resetn );

    -- redist6_i_exitcond_gemm_nnfw_q_3(DELAY,146)
    redist6_i_exitcond_gemm_nnfw_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond_gemm_nnfw_q, xout => redist6_i_exitcond_gemm_nnfw_q_3_q, clk => clock, aclr => resetn );

    -- i_unnamed_gemm_nnfw129(LOGICAL,84)@4
    i_unnamed_gemm_nnfw129_q <= redist6_i_exitcond_gemm_nnfw_q_3_q or redist3_i_phi_decision156_xor_rm16_gemm_nnfw_q_3_q;

    -- i_phi_decision156_xor_rm16_gemm_nnfw(LOGICAL,79)@1 + 1
    i_phi_decision156_xor_rm16_gemm_nnfw_qi <= i_unnamed_gemm_nnfw125_q xor VCC_q;
    i_phi_decision156_xor_rm16_gemm_nnfw_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_phi_decision156_xor_rm16_gemm_nnfw_qi, xout => i_phi_decision156_xor_rm16_gemm_nnfw_q, clk => clock, aclr => resetn );

    -- redist3_i_phi_decision156_xor_rm16_gemm_nnfw_q_3(DELAY,143)
    redist3_i_phi_decision156_xor_rm16_gemm_nnfw_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_phi_decision156_xor_rm16_gemm_nnfw_q, xout => redist3_i_phi_decision156_xor_rm16_gemm_nnfw_q_3_q, clk => clock, aclr => resetn );

    -- redist21_i_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw_out_data_out_3(DELAY,161)
    redist21_i_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist20_i_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw_out_data_out_1_q, xout => redist21_i_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_mul20_gemm_nnfw_bs4(BITSELECT,118)@1
    i_mul20_gemm_nnfw_bs4_in <= STD_LOGIC_VECTOR(i_acl_pop_i32_i_287_pop12_gemm_nnfw_out_data_out(17 downto 0));
    i_mul20_gemm_nnfw_bs4_b <= STD_LOGIC_VECTOR(i_mul20_gemm_nnfw_bs4_in(17 downto 0));

    -- i_mul20_gemm_nnfw_bjA5(BITJOIN,119)@1
    i_mul20_gemm_nnfw_bjA5_q <= GND_q & i_mul20_gemm_nnfw_bs4_b;

    -- redist9_i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw_out_data_out_1(DELAY,149)
    redist9_i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw_out_data_out, xout => redist9_i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw_out_data_out_1_q, clk => clock, aclr => resetn );

    -- i_acl_push_i32_sdiv_sh125_rm35_push15_gemm_nnfw(BLACKBOX,68)@2
    -- out out_feedback_out_15@20000000
    -- out out_feedback_valid_out_15@20000000
    thei_acl_push_i32_sdiv_sh125_rm35_push15_gemm_nnfw : i_acl_push_i32_sdiv_sh125_rm35_push15_gemm_nnfw136
    PORT MAP (
        in_data_in => redist9_i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw_out_data_out_1_q,
        in_feedback_stall_in_15 => i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw_out_feedback_stall_out_15,
        in_notexit25 => redist4_i_notexit25_gemm_nnfw_q_1_q,
        in_stall_in => GND_q,
        in_valid_in => redist24_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_15 => i_acl_push_i32_sdiv_sh125_rm35_push15_gemm_nnfw_out_feedback_out_15,
        out_feedback_valid_out_15 => i_acl_push_i32_sdiv_sh125_rm35_push15_gemm_nnfw_out_feedback_valid_out_15,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw(BLACKBOX,58)@1
    -- out out_feedback_stall_out_15@20000000
    thei_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw : i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw118
    PORT MAP (
        in_data_in => in_c0_eni9_4,
        in_dir => in_c0_eni9_1,
        in_feedback_in_15 => i_acl_push_i32_sdiv_sh125_rm35_push15_gemm_nnfw_out_feedback_out_15,
        in_feedback_valid_in_15 => i_acl_push_i32_sdiv_sh125_rm35_push15_gemm_nnfw_out_feedback_valid_out_15,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw_out_data_out,
        out_feedback_stall_out_15 => i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw_out_feedback_stall_out_15,
        clock => clock,
        resetn => resetn
    );

    -- i_mul20_gemm_nnfw_bs2_merged_bit_select(BITSELECT,139)@1
    i_mul20_gemm_nnfw_bs2_merged_bit_select_b <= i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw_out_data_out(17 downto 0);
    i_mul20_gemm_nnfw_bs2_merged_bit_select_c <= i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw_out_data_out(31 downto 18);

    -- i_mul20_gemm_nnfw_bjB9(BITJOIN,123)@1
    i_mul20_gemm_nnfw_bjB9_q <= GND_q & i_mul20_gemm_nnfw_bs2_merged_bit_select_b;

    -- i_mul20_gemm_nnfw_bs7(BITSELECT,121)@1
    i_mul20_gemm_nnfw_bs7_b <= STD_LOGIC_VECTOR(i_acl_pop_i32_i_287_pop12_gemm_nnfw_out_data_out(31 downto 18));

    -- i_mul20_gemm_nnfw_ma3_cma(CHAINMULTADD,137)@1 + 2
    i_mul20_gemm_nnfw_ma3_cma_reset <= not (resetn);
    i_mul20_gemm_nnfw_ma3_cma_ena0 <= '1';
    i_mul20_gemm_nnfw_ma3_cma_ena1 <= i_mul20_gemm_nnfw_ma3_cma_ena0;
    i_mul20_gemm_nnfw_ma3_cma_l(0) <= SIGNED(RESIZE(i_mul20_gemm_nnfw_ma3_cma_a0(0),15));
    i_mul20_gemm_nnfw_ma3_cma_l(1) <= SIGNED(RESIZE(i_mul20_gemm_nnfw_ma3_cma_a0(1),15));
    i_mul20_gemm_nnfw_ma3_cma_p(0) <= i_mul20_gemm_nnfw_ma3_cma_l(0) * i_mul20_gemm_nnfw_ma3_cma_c0(0);
    i_mul20_gemm_nnfw_ma3_cma_p(1) <= i_mul20_gemm_nnfw_ma3_cma_l(1) * i_mul20_gemm_nnfw_ma3_cma_c0(1);
    i_mul20_gemm_nnfw_ma3_cma_u(0) <= RESIZE(i_mul20_gemm_nnfw_ma3_cma_p(0),35);
    i_mul20_gemm_nnfw_ma3_cma_u(1) <= RESIZE(i_mul20_gemm_nnfw_ma3_cma_p(1),35);
    i_mul20_gemm_nnfw_ma3_cma_w(0) <= i_mul20_gemm_nnfw_ma3_cma_u(0) + i_mul20_gemm_nnfw_ma3_cma_u(1);
    i_mul20_gemm_nnfw_ma3_cma_x(0) <= i_mul20_gemm_nnfw_ma3_cma_w(0);
    i_mul20_gemm_nnfw_ma3_cma_y(0) <= i_mul20_gemm_nnfw_ma3_cma_x(0);
    i_mul20_gemm_nnfw_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul20_gemm_nnfw_ma3_cma_a0 <= (others => (others => '0'));
            i_mul20_gemm_nnfw_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul20_gemm_nnfw_ma3_cma_ena0 = '1') THEN
                i_mul20_gemm_nnfw_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_mul20_gemm_nnfw_bs7_b),14);
                i_mul20_gemm_nnfw_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_mul20_gemm_nnfw_bs2_merged_bit_select_c),14);
                i_mul20_gemm_nnfw_ma3_cma_c0(0) <= RESIZE(SIGNED(i_mul20_gemm_nnfw_bjB9_q),19);
                i_mul20_gemm_nnfw_ma3_cma_c0(1) <= RESIZE(SIGNED(i_mul20_gemm_nnfw_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_mul20_gemm_nnfw_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul20_gemm_nnfw_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul20_gemm_nnfw_ma3_cma_ena1 = '1') THEN
                i_mul20_gemm_nnfw_ma3_cma_s(0) <= i_mul20_gemm_nnfw_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul20_gemm_nnfw_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul20_gemm_nnfw_ma3_cma_s(0)(33 downto 0)), xout => i_mul20_gemm_nnfw_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul20_gemm_nnfw_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul20_gemm_nnfw_ma3_cma_qq(33 downto 0));

    -- redist0_i_mul20_gemm_nnfw_ma3_cma_q_1(DELAY,140)
    redist0_i_mul20_gemm_nnfw_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul20_gemm_nnfw_ma3_cma_q, xout => redist0_i_mul20_gemm_nnfw_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul20_gemm_nnfw_align_14(BITSHIFT,128)@4
    i_mul20_gemm_nnfw_align_14_qint <= redist0_i_mul20_gemm_nnfw_ma3_cma_q_1_q & "000000000000000000";
    i_mul20_gemm_nnfw_align_14_q <= i_mul20_gemm_nnfw_align_14_qint(51 downto 0);

    -- i_mul20_gemm_nnfw_bs11(BITSELECT,125)@1
    i_mul20_gemm_nnfw_bs11_b <= i_acl_pop_i32_i_287_pop12_gemm_nnfw_out_data_out(31 downto 18);

    -- i_mul20_gemm_nnfw_im10_cma(CHAINMULTADD,136)@1 + 2
    i_mul20_gemm_nnfw_im10_cma_reset <= not (resetn);
    i_mul20_gemm_nnfw_im10_cma_ena0 <= '1';
    i_mul20_gemm_nnfw_im10_cma_ena1 <= i_mul20_gemm_nnfw_im10_cma_ena0;
    i_mul20_gemm_nnfw_im10_cma_p(0) <= i_mul20_gemm_nnfw_im10_cma_a0(0) * i_mul20_gemm_nnfw_im10_cma_c0(0);
    i_mul20_gemm_nnfw_im10_cma_u(0) <= RESIZE(i_mul20_gemm_nnfw_im10_cma_p(0),28);
    i_mul20_gemm_nnfw_im10_cma_w(0) <= i_mul20_gemm_nnfw_im10_cma_u(0);
    i_mul20_gemm_nnfw_im10_cma_x(0) <= i_mul20_gemm_nnfw_im10_cma_w(0);
    i_mul20_gemm_nnfw_im10_cma_y(0) <= i_mul20_gemm_nnfw_im10_cma_x(0);
    i_mul20_gemm_nnfw_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul20_gemm_nnfw_im10_cma_a0 <= (others => (others => '0'));
            i_mul20_gemm_nnfw_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul20_gemm_nnfw_im10_cma_ena0 = '1') THEN
                i_mul20_gemm_nnfw_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_mul20_gemm_nnfw_bs11_b),14);
                i_mul20_gemm_nnfw_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_mul20_gemm_nnfw_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul20_gemm_nnfw_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul20_gemm_nnfw_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul20_gemm_nnfw_im10_cma_ena1 = '1') THEN
                i_mul20_gemm_nnfw_im10_cma_s(0) <= i_mul20_gemm_nnfw_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul20_gemm_nnfw_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul20_gemm_nnfw_im10_cma_s(0)(27 downto 0)), xout => i_mul20_gemm_nnfw_im10_cma_qq, clk => clock, aclr => resetn );
    i_mul20_gemm_nnfw_im10_cma_q <= STD_LOGIC_VECTOR(i_mul20_gemm_nnfw_im10_cma_qq(27 downto 0));

    -- redist1_i_mul20_gemm_nnfw_im10_cma_q_1(DELAY,141)
    redist1_i_mul20_gemm_nnfw_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul20_gemm_nnfw_im10_cma_q, xout => redist1_i_mul20_gemm_nnfw_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul20_gemm_nnfw_bs1(BITSELECT,115)@1
    i_mul20_gemm_nnfw_bs1_in <= i_acl_pop_i32_i_287_pop12_gemm_nnfw_out_data_out(17 downto 0);
    i_mul20_gemm_nnfw_bs1_b <= i_mul20_gemm_nnfw_bs1_in(17 downto 0);

    -- i_mul20_gemm_nnfw_im0_cma(CHAINMULTADD,135)@1 + 2
    i_mul20_gemm_nnfw_im0_cma_reset <= not (resetn);
    i_mul20_gemm_nnfw_im0_cma_ena0 <= '1';
    i_mul20_gemm_nnfw_im0_cma_ena1 <= i_mul20_gemm_nnfw_im0_cma_ena0;
    i_mul20_gemm_nnfw_im0_cma_p(0) <= i_mul20_gemm_nnfw_im0_cma_a0(0) * i_mul20_gemm_nnfw_im0_cma_c0(0);
    i_mul20_gemm_nnfw_im0_cma_u(0) <= RESIZE(i_mul20_gemm_nnfw_im0_cma_p(0),36);
    i_mul20_gemm_nnfw_im0_cma_w(0) <= i_mul20_gemm_nnfw_im0_cma_u(0);
    i_mul20_gemm_nnfw_im0_cma_x(0) <= i_mul20_gemm_nnfw_im0_cma_w(0);
    i_mul20_gemm_nnfw_im0_cma_y(0) <= i_mul20_gemm_nnfw_im0_cma_x(0);
    i_mul20_gemm_nnfw_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul20_gemm_nnfw_im0_cma_a0 <= (others => (others => '0'));
            i_mul20_gemm_nnfw_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul20_gemm_nnfw_im0_cma_ena0 = '1') THEN
                i_mul20_gemm_nnfw_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul20_gemm_nnfw_bs1_b),18);
                i_mul20_gemm_nnfw_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_mul20_gemm_nnfw_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_mul20_gemm_nnfw_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul20_gemm_nnfw_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul20_gemm_nnfw_im0_cma_ena1 = '1') THEN
                i_mul20_gemm_nnfw_im0_cma_s(0) <= i_mul20_gemm_nnfw_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul20_gemm_nnfw_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul20_gemm_nnfw_im0_cma_s(0)(35 downto 0)), xout => i_mul20_gemm_nnfw_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul20_gemm_nnfw_im0_cma_q <= STD_LOGIC_VECTOR(i_mul20_gemm_nnfw_im0_cma_qq(35 downto 0));

    -- redist2_i_mul20_gemm_nnfw_im0_cma_q_1(DELAY,142)
    redist2_i_mul20_gemm_nnfw_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul20_gemm_nnfw_im0_cma_q, xout => redist2_i_mul20_gemm_nnfw_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul20_gemm_nnfw_join_13(BITJOIN,127)@4
    i_mul20_gemm_nnfw_join_13_q <= redist1_i_mul20_gemm_nnfw_im10_cma_q_1_q & redist2_i_mul20_gemm_nnfw_im0_cma_q_1_q;

    -- i_mul20_gemm_nnfw_result_add_0_0(ADD,130)@4
    i_mul20_gemm_nnfw_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul20_gemm_nnfw_join_13_q));
    i_mul20_gemm_nnfw_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_mul20_gemm_nnfw_align_14_q(51)) & i_mul20_gemm_nnfw_align_14_q));
    i_mul20_gemm_nnfw_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul20_gemm_nnfw_result_add_0_0_a) + SIGNED(i_mul20_gemm_nnfw_result_add_0_0_b));
    i_mul20_gemm_nnfw_result_add_0_0_q <= i_mul20_gemm_nnfw_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_mul20_gemm_nnfw_rnd_sel(BITSELECT,112)@4
    bgTrunc_i_mul20_gemm_nnfw_rnd_sel_in <= i_mul20_gemm_nnfw_result_add_0_0_q(63 downto 0);
    bgTrunc_i_mul20_gemm_nnfw_rnd_sel_b <= bgTrunc_i_mul20_gemm_nnfw_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_mul20_gemm_nnfw_sel_x(BITSELECT,4)@4
    bgTrunc_i_mul20_gemm_nnfw_sel_x_b <= bgTrunc_i_mul20_gemm_nnfw_rnd_sel_b(31 downto 0);

    -- redist10_i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw_out_data_out_3(DELAY,150)
    redist10_i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist9_i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw_out_data_out_1_q, xout => redist10_i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_memdep_phi6_pop1143_push20_gemm_nnfw(BLACKBOX,62)@2
    -- out out_feedback_out_20@20000000
    -- out out_feedback_valid_out_20@20000000
    thei_acl_push_i1_memdep_phi6_pop1143_push20_gemm_nnfw : i_acl_push_i1_memdep_phi6_pop1143_push20_gemm_nnfw130
    PORT MAP (
        in_data_in => redist18_i_acl_pop_i1_memdep_phi6_pop1143_pop20_gemm_nnfw_out_data_out_1_q,
        in_feedback_stall_in_20 => i_acl_pop_i1_memdep_phi6_pop1143_pop20_gemm_nnfw_out_feedback_stall_out_20,
        in_notexit25 => redist4_i_notexit25_gemm_nnfw_q_1_q,
        in_stall_in => GND_q,
        in_valid_in => redist24_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_20 => i_acl_push_i1_memdep_phi6_pop1143_push20_gemm_nnfw_out_feedback_out_20,
        out_feedback_valid_out_20 => i_acl_push_i1_memdep_phi6_pop1143_push20_gemm_nnfw_out_feedback_valid_out_20,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_memdep_phi6_pop1143_pop20_gemm_nnfw(BLACKBOX,53)@1
    -- out out_feedback_stall_out_20@20000000
    thei_acl_pop_i1_memdep_phi6_pop1143_pop20_gemm_nnfw : i_acl_pop_i1_memdep_phi6_pop1143_pop20_gemm_nnfw116
    PORT MAP (
        in_data_in => in_c0_eni9_3,
        in_dir => in_c0_eni9_1,
        in_feedback_in_20 => i_acl_push_i1_memdep_phi6_pop1143_push20_gemm_nnfw_out_feedback_out_20,
        in_feedback_valid_in_20 => i_acl_push_i1_memdep_phi6_pop1143_push20_gemm_nnfw_out_feedback_valid_out_20,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_memdep_phi6_pop1143_pop20_gemm_nnfw_out_data_out,
        out_feedback_stall_out_20 => i_acl_pop_i1_memdep_phi6_pop1143_pop20_gemm_nnfw_out_feedback_stall_out_20,
        clock => clock,
        resetn => resetn
    );

    -- redist18_i_acl_pop_i1_memdep_phi6_pop1143_pop20_gemm_nnfw_out_data_out_1(DELAY,158)
    redist18_i_acl_pop_i1_memdep_phi6_pop1143_pop20_gemm_nnfw_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_memdep_phi6_pop1143_pop20_gemm_nnfw_out_data_out, xout => redist18_i_acl_pop_i1_memdep_phi6_pop1143_pop20_gemm_nnfw_out_data_out_1_q, clk => clock, aclr => resetn );

    -- redist19_i_acl_pop_i1_memdep_phi6_pop1143_pop20_gemm_nnfw_out_data_out_3(DELAY,159)
    redist19_i_acl_pop_i1_memdep_phi6_pop1143_pop20_gemm_nnfw_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist18_i_acl_pop_i1_memdep_phi6_pop1143_pop20_gemm_nnfw_out_data_out_1_q, xout => redist19_i_acl_pop_i1_memdep_phi6_pop1143_pop20_gemm_nnfw_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_multconst_x(CONSTANT,33)
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_multconst_x_q <= "00000000000000000000000000000000000000000000000000000000000000";

    -- i_acl_push_i32_mul1141_push18_gemm_nnfw(BLACKBOX,67)@2
    -- out out_feedback_out_18@20000000
    -- out out_feedback_valid_out_18@20000000
    thei_acl_push_i32_mul1141_push18_gemm_nnfw : i_acl_push_i32_mul1141_push18_gemm_nnfw132
    PORT MAP (
        in_data_in => redist11_i_acl_pop_i32_mul1141_pop18_gemm_nnfw_out_data_out_1_q,
        in_feedback_stall_in_18 => i_acl_pop_i32_mul1141_pop18_gemm_nnfw_out_feedback_stall_out_18,
        in_notexit25 => redist4_i_notexit25_gemm_nnfw_q_1_q,
        in_stall_in => GND_q,
        in_valid_in => redist24_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_18 => i_acl_push_i32_mul1141_push18_gemm_nnfw_out_feedback_out_18,
        out_feedback_valid_out_18 => i_acl_push_i32_mul1141_push18_gemm_nnfw_out_feedback_valid_out_18,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i32_mul1141_pop18_gemm_nnfw(BLACKBOX,57)@1
    -- out out_feedback_stall_out_18@20000000
    thei_acl_pop_i32_mul1141_pop18_gemm_nnfw : i_acl_pop_i32_mul1141_pop18_gemm_nnfw111
    PORT MAP (
        in_data_in => in_c0_eni9_2,
        in_dir => in_c0_eni9_1,
        in_feedback_in_18 => i_acl_push_i32_mul1141_push18_gemm_nnfw_out_feedback_out_18,
        in_feedback_valid_in_18 => i_acl_push_i32_mul1141_push18_gemm_nnfw_out_feedback_valid_out_18,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_mul1141_pop18_gemm_nnfw_out_data_out,
        out_feedback_stall_out_18 => i_acl_pop_i32_mul1141_pop18_gemm_nnfw_out_feedback_stall_out_18,
        clock => clock,
        resetn => resetn
    );

    -- redist11_i_acl_pop_i32_mul1141_pop18_gemm_nnfw_out_data_out_1(DELAY,151)
    redist11_i_acl_pop_i32_mul1141_pop18_gemm_nnfw_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i32_mul1141_pop18_gemm_nnfw_out_data_out, xout => redist11_i_acl_pop_i32_mul1141_pop18_gemm_nnfw_out_data_out_1_q, clk => clock, aclr => resetn );

    -- redist13_i_acl_pop_i32_i_287_pop12_gemm_nnfw_out_data_out_1(DELAY,153)
    redist13_i_acl_pop_i32_i_287_pop12_gemm_nnfw_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i32_i_287_pop12_gemm_nnfw_out_data_out, xout => redist13_i_acl_pop_i32_i_287_pop12_gemm_nnfw_out_data_out_1_q, clk => clock, aclr => resetn );

    -- i_add12_gemm_nnfw(ADD,70)@2
    i_add12_gemm_nnfw_a <= STD_LOGIC_VECTOR("0" & redist13_i_acl_pop_i32_i_287_pop12_gemm_nnfw_out_data_out_1_q);
    i_add12_gemm_nnfw_b <= STD_LOGIC_VECTOR("0" & redist11_i_acl_pop_i32_mul1141_pop18_gemm_nnfw_out_data_out_1_q);
    i_add12_gemm_nnfw_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add12_gemm_nnfw_a) + UNSIGNED(i_add12_gemm_nnfw_b));
    i_add12_gemm_nnfw_q <= i_add12_gemm_nnfw_o(32 downto 0);

    -- bgTrunc_i_add12_gemm_nnfw_sel_x(BITSELECT,2)@2
    bgTrunc_i_add12_gemm_nnfw_sel_x_b <= i_add12_gemm_nnfw_q(31 downto 0);

    -- redist27_bgTrunc_i_add12_gemm_nnfw_sel_x_b_1(DELAY,167)
    redist27_bgTrunc_i_add12_gemm_nnfw_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add12_gemm_nnfw_sel_x_b, xout => redist27_bgTrunc_i_add12_gemm_nnfw_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_idxprom13_gemm_nnfw_sel_x(BITSELECT,39)@3
    i_idxprom13_gemm_nnfw_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist27_bgTrunc_i_add12_gemm_nnfw_sel_x_b_1_q(31 downto 0)), 64)));

    -- i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_bs1_merged_bit_select(BITSELECT,138)@3
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_bs1_merged_bit_select_b <= i_idxprom13_gemm_nnfw_sel_x_b(17 downto 0);
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_bs1_merged_bit_select_c <= i_idxprom13_gemm_nnfw_sel_x_b(63 downto 54);
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_bs1_merged_bit_select_d <= i_idxprom13_gemm_nnfw_sel_x_b(35 downto 18);
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_bs1_merged_bit_select_e <= i_idxprom13_gemm_nnfw_sel_x_b(53 downto 36);

    -- i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im3_shift0(BITSHIFT,132)@3
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im3_shift0_qint <= i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_bs1_merged_bit_select_c & "0";
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im3_shift0_q <= i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im3_shift0_qint(10 downto 0);

    -- i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_align_15(BITSHIFT,107)@3
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im3_shift0_q) & "0000000000000000";
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_align_15_q <= i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im6_shift0(BITSHIFT,133)@3
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im6_shift0_qint <= i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_bs1_merged_bit_select_d & "0";
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im6_shift0_q <= i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im6_shift0_qint(18 downto 0);

    -- i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_align_14(BITSHIFT,106)@3
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_align_14_q <= i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_align_14_qint(37 downto 0);

    -- i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_join_16(BITJOIN,108)@3
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_join_16_q <= i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_align_15_q & i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_align_14_q;

    -- i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im9_shift0(BITSHIFT,134)@3
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im9_shift0_qint <= i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_bs1_merged_bit_select_e & "0";
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im9_shift0_q <= i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im9_shift0_qint(18 downto 0);

    -- i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_align_12(BITSHIFT,104)@3
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im9_shift0_q) & "0000000000000000";
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_align_12_q <= i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im0_shift0(BITSHIFT,131)@3
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im0_shift0_qint <= i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_bs1_merged_bit_select_b & "0";
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im0_shift0_q <= i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im0_shift0_qint(18 downto 0);

    -- i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_join_13(BITJOIN,105)@3
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_join_13_q <= i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_im0_shift0_q);

    -- i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_result_add_0_0(ADD,109)@3
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_join_13_q);
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_join_16_q);
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_result_add_0_0_b));
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_result_add_0_0_q <= i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_result_add_0_0_o(66 downto 0);

    -- i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_extender_x(BITJOIN,32)@3
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_extender_x_q <= i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_multconst_x_q & i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_x_result_add_0_0_q(65 downto 0);

    -- i_arrayidx14_gemm_nnfw_gemm_nnfw115_trunc_sel_x(BITSELECT,34)@3
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_trunc_sel_x_b <= i_arrayidx14_gemm_nnfw_gemm_nnfw115_mult_extender_x_q(63 downto 0);

    -- redist26_i_arrayidx14_gemm_nnfw_gemm_nnfw115_trunc_sel_x_b_1(DELAY,166)
    redist26_i_arrayidx14_gemm_nnfw_gemm_nnfw115_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_arrayidx14_gemm_nnfw_gemm_nnfw115_trunc_sel_x_b, xout => redist26_i_arrayidx14_gemm_nnfw_gemm_nnfw115_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_c_sync_buffer_gemm_nnfw(BLACKBOX,80)@0
    -- in in_i_dependence@4
    -- in in_valid_in@4
    -- out out_buffer_out@4
    -- out out_valid_out@4
    thei_syncbuf_c_sync_buffer_gemm_nnfw : i_syncbuf_c_sync_buffer_gemm_nnfw113
    PORT MAP (
        in_buffer_in => in_C,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist25_sync_in_aunroll_x_in_i_valid_3_q,
        out_buffer_out => i_syncbuf_c_sync_buffer_gemm_nnfw_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx14_gemm_nnfw_gemm_nnfw115_add_x(ADD,35)@4
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_c_sync_buffer_gemm_nnfw_out_buffer_out);
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_add_x_b <= STD_LOGIC_VECTOR("0" & redist26_i_arrayidx14_gemm_nnfw_gemm_nnfw115_trunc_sel_x_b_1_q);
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx14_gemm_nnfw_gemm_nnfw115_add_x_a) + UNSIGNED(i_arrayidx14_gemm_nnfw_gemm_nnfw115_add_x_b));
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_add_x_q <= i_arrayidx14_gemm_nnfw_gemm_nnfw115_add_x_o(64 downto 0);

    -- i_arrayidx14_gemm_nnfw_gemm_nnfw115_dupName_0_trunc_sel_x(BITSELECT,29)@4
    i_arrayidx14_gemm_nnfw_gemm_nnfw115_dupName_0_trunc_sel_x_b <= i_arrayidx14_gemm_nnfw_gemm_nnfw115_add_x_q(63 downto 0);

    -- redist12_i_acl_pop_i32_mul1141_pop18_gemm_nnfw_out_data_out_3(DELAY,152)
    redist12_i_acl_pop_i32_mul1141_pop18_gemm_nnfw_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist11_i_acl_pop_i32_mul1141_pop18_gemm_nnfw_out_data_out_1_q, xout => redist12_i_acl_pop_i32_mul1141_pop18_gemm_nnfw_out_data_out_3_q, clk => clock, aclr => resetn );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,41)@4
    out_c0_exi13_0 <= GND_q;
    out_c0_exi13_1 <= redist12_i_acl_pop_i32_mul1141_pop18_gemm_nnfw_out_data_out_3_q;
    out_c0_exi13_2 <= i_arrayidx14_gemm_nnfw_gemm_nnfw115_dupName_0_trunc_sel_x_b;
    out_c0_exi13_3 <= redist19_i_acl_pop_i1_memdep_phi6_pop1143_pop20_gemm_nnfw_out_data_out_3_q;
    out_c0_exi13_4 <= redist10_i_acl_pop_i32_sdiv_sh125_rm35_pop15_gemm_nnfw_out_data_out_3_q;
    out_c0_exi13_5 <= bgTrunc_i_mul20_gemm_nnfw_sel_x_b;
    out_c0_exi13_6 <= redist21_i_acl_pop_i1_cmp88_rm37_pop16_gemm_nnfw_out_data_out_3_q;
    out_c0_exi13_7 <= redist3_i_phi_decision156_xor_rm16_gemm_nnfw_q_3_q;
    out_c0_exi13_8 <= i_unnamed_gemm_nnfw129_q;
    out_c0_exi13_9 <= redist5_i_notexit25_gemm_nnfw_q_3_q;
    out_c0_exi13_10 <= redist15_i_acl_pop_i1_pop13_gemm_nnfw_out_data_out_3_q;
    out_c0_exi13_11 <= redist17_i_acl_pop_i1_notexit2933_pop14_gemm_nnfw_out_data_out_3_q;
    out_c0_exi13_12 <= redist23_i_acl_pop_i1_cmp380_rm39_pop17_gemm_nnfw_out_data_out_3_q;
    out_c0_exi13_13 <= redist8_i_acl_pop_i33_pop19_gemm_nnfw_out_data_out_3_q;
    out_o_valid <= redist25_sync_in_aunroll_x_in_i_valid_3_q;

    -- i_acl_push_i1_notexitcond24_gemm_nnfw(BLACKBOX,64)@1
    -- out out_feedback_out_6@20000000
    -- out out_feedback_valid_out_6@20000000
    thei_acl_push_i1_notexitcond24_gemm_nnfw : i_acl_push_i1_notexitcond24_gemm_nnfw140
    PORT MAP (
        in_data_in => i_notexit25_gemm_nnfw_q,
        in_feedback_stall_in_6 => i_acl_pipeline_keep_going23_gemm_nnfw_out_not_exitcond_stall_out,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_6 => i_acl_push_i1_notexitcond24_gemm_nnfw_out_feedback_out_6,
        out_feedback_valid_out_6 => i_acl_push_i1_notexitcond24_gemm_nnfw_out_feedback_valid_out_6,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going23_gemm_nnfw(BLACKBOX,50)@1
    -- out out_exiting_stall_out@20000000
    -- out out_exiting_valid_out@20000000
    -- out out_initeration_stall_out@20000000
    -- out out_not_exitcond_stall_out@20000000
    -- out out_pipeline_valid_out@20000000
    thei_acl_pipeline_keep_going23_gemm_nnfw : i_acl_pipeline_keep_going23_gemm_nnfw107
    PORT MAP (
        in_data_in => VCC_q,
        in_initeration_in => GND_q,
        in_initeration_valid_in => GND_q,
        in_not_exitcond_in => i_acl_push_i1_notexitcond24_gemm_nnfw_out_feedback_out_6,
        in_not_exitcond_valid_in => i_acl_push_i1_notexitcond24_gemm_nnfw_out_feedback_valid_out_6,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_exiting_stall_out => i_acl_pipeline_keep_going23_gemm_nnfw_out_exiting_stall_out,
        out_exiting_valid_out => i_acl_pipeline_keep_going23_gemm_nnfw_out_exiting_valid_out,
        out_not_exitcond_stall_out => i_acl_pipeline_keep_going23_gemm_nnfw_out_not_exitcond_stall_out,
        out_pipeline_valid_out => i_acl_pipeline_keep_going23_gemm_nnfw_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ext_sig_sync_out(GPOUT,49)
    out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_valid_out <= i_acl_pipeline_keep_going23_gemm_nnfw_out_exiting_valid_out;
    out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_stall_out <= i_acl_pipeline_keep_going23_gemm_nnfw_out_exiting_stall_out;

    -- pipeline_valid_out_sync(GPOUT,89)
    out_pipeline_valid_out <= i_acl_pipeline_keep_going23_gemm_nnfw_out_pipeline_valid_out;

END normal;
