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

-- VHDL created from i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154
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

entity i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154 is
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
        in_c0_eni9_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi13377_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi13377_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi13377_2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi13377_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi13377_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi13377_5 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi13377_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi13377_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi13377_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi13377_9 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi13377_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi13377_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi13377_12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi13377_13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154;

architecture normal of i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_pipeline_keep_going294_gemm_nn9w156 is
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


    component i_acl_pop_i1_cmp367_rm311_pop22_gemm_nn9w199 is
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


    component i_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w172 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_21 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_21 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_memdep_phi277_pop16317_pop25_gemm_nn9w165 is
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


    component i_acl_pop_i1_notexit300305_pop19_gemm_nn9w195 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_19 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_19 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_19 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_pop18_gemm_nn9w191 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_18 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_18 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w167 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_20 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_20 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_20 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_div_rm313_pop23_gemm_nn9w203 is
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


    component i_acl_pop_i32_i_274_pop17_gemm_nn9w158 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_mul27315_pop24_gemm_nn9w160 is
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


    component i_acl_push_i1_cmp367_rm311_push22_gemm_nn9w201 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_22 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit296 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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


    component i_acl_push_i1_cmp75_rm309_push21_gemm_nn9w183 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit296 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_21 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_21 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_memdep_phi277_pop16317_push25_gemm_nn9w179 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_25 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit296 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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


    component i_acl_push_i1_notexit300305_push19_gemm_nn9w197 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_19 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit296 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_19 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_19 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_notexitcond295_gemm_nn9w189 is
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


    component i_acl_push_i1_push18_gemm_nn9w193 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit296 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_18 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_18 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_div1_rm307_push20_gemm_nn9w185 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_20 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit296 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_20 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_20 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_div_rm313_push23_gemm_nn9w205 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_23 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit296 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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


    component i_acl_push_i32_i_274_push17_gemm_nn9w187 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit296 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_17 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_mul27315_push24_gemm_nn9w181 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_24 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit296 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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


    component i_syncbuf_c_sync_buffer_gemm_nn9w162 is
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


    component i_syncbuf_m_sync_buffer279_gemm_nn9w175 is
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


    component i_syncbuf_m_sync_buffer_gemm_nn9w169 is
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
    signal bgTrunc_i_add28_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_inc75_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul36_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_multconst_x_q : STD_LOGIC_VECTOR (61 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_idxprom29_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pipeline_keep_going294_gemm_nn9w_out_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going294_gemm_nn9w_out_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going294_gemm_nn9w_out_not_exitcond_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going294_gemm_nn9w_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_cmp367_rm311_pop22_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_cmp367_rm311_pop22_gemm_nn9w_out_feedback_stall_out_22 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w_out_feedback_stall_out_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi277_pop16317_pop25_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi277_pop16317_pop25_gemm_nn9w_out_feedback_stall_out_25 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_notexit300305_pop19_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_notexit300305_pop19_gemm_nn9w_out_feedback_stall_out_19 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_pop18_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_pop18_gemm_nn9w_out_feedback_stall_out_18 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w_out_feedback_stall_out_20 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_feedback_stall_out_23 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_i_274_pop17_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_i_274_pop17_gemm_nn9w_out_feedback_stall_out_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_mul27315_pop24_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_mul27315_pop24_gemm_nn9w_out_feedback_stall_out_24 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_cmp367_rm311_push22_gemm_nn9w_out_feedback_out_22 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_cmp367_rm311_push22_gemm_nn9w_out_feedback_valid_out_22 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_cmp75_rm309_push21_gemm_nn9w_out_feedback_out_21 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_cmp75_rm309_push21_gemm_nn9w_out_feedback_valid_out_21 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi277_pop16317_push25_gemm_nn9w_out_feedback_out_25 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_memdep_phi277_pop16317_push25_gemm_nn9w_out_feedback_valid_out_25 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_notexit300305_push19_gemm_nn9w_out_feedback_out_19 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_notexit300305_push19_gemm_nn9w_out_feedback_valid_out_19 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_notexitcond295_gemm_nn9w_out_feedback_out_6 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_notexitcond295_gemm_nn9w_out_feedback_valid_out_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_push18_gemm_nn9w_out_feedback_out_18 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_push18_gemm_nn9w_out_feedback_valid_out_18 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_div1_rm307_push20_gemm_nn9w_out_feedback_out_20 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_div1_rm307_push20_gemm_nn9w_out_feedback_valid_out_20 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_div_rm313_push23_gemm_nn9w_out_feedback_out_23 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_div_rm313_push23_gemm_nn9w_out_feedback_valid_out_23 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_i_274_push17_gemm_nn9w_out_feedback_out_17 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_i_274_push17_gemm_nn9w_out_feedback_valid_out_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_mul27315_push24_gemm_nn9w_out_feedback_out_24 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_mul27315_push24_gemm_nn9w_out_feedback_valid_out_24 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add28_gemm_nn9w_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add28_gemm_nn9w_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add28_gemm_nn9w_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add28_gemm_nn9w_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_cmp2473_rm60255_gemm_nn9w_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp2473_rm60255_gemm_nn9w_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp2473_rm60255_gemm_nn9w_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp2473_rm60255_gemm_nn9w_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond_not_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_inc75_gemm_nn9w_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc75_gemm_nn9w_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc75_gemm_nn9w_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc75_gemm_nn9w_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_notexit296_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phi_decision139_xor_rm65_gemm_nn9w_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phi_decision139_xor_rm65_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_c_sync_buffer_gemm_nn9w_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_m_sync_buffer279_gemm_nn9w_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_m_sync_buffer_gemm_nn9w_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_gemm_nn9w174_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gemm_nn9w178_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_join_13_q : STD_LOGIC_VECTOR (55 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_align_14_q : STD_LOGIC_VECTOR (37 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_align_14_qint : STD_LOGIC_VECTOR (37 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_join_16_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (66 downto 0);
    signal bgTrunc_i_mul36_gemm_nn9w_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul36_gemm_nn9w_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul36_gemm_nn9w_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul36_gemm_nn9w_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul36_gemm_nn9w_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul36_gemm_nn9w_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul36_gemm_nn9w_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul36_gemm_nn9w_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul36_gemm_nn9w_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul36_gemm_nn9w_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul36_gemm_nn9w_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul36_gemm_nn9w_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul36_gemm_nn9w_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul36_gemm_nn9w_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul36_gemm_nn9w_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul36_gemm_nn9w_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul36_gemm_nn9w_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (10 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul36_gemm_nn9w_im0_cma_reset : std_logic;
    type i_mul36_gemm_nn9w_im0_cma_a0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal i_mul36_gemm_nn9w_im0_cma_a0 : i_mul36_gemm_nn9w_im0_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of i_mul36_gemm_nn9w_im0_cma_a0 : signal is true;
    signal i_mul36_gemm_nn9w_im0_cma_c0 : i_mul36_gemm_nn9w_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul36_gemm_nn9w_im0_cma_c0 : signal is true;
    type i_mul36_gemm_nn9w_im0_cma_ptype is array(NATURAL range <>) of UNSIGNED(35 downto 0);
    signal i_mul36_gemm_nn9w_im0_cma_p : i_mul36_gemm_nn9w_im0_cma_ptype(0 to 0);
    signal i_mul36_gemm_nn9w_im0_cma_u : i_mul36_gemm_nn9w_im0_cma_ptype(0 to 0);
    signal i_mul36_gemm_nn9w_im0_cma_w : i_mul36_gemm_nn9w_im0_cma_ptype(0 to 0);
    signal i_mul36_gemm_nn9w_im0_cma_x : i_mul36_gemm_nn9w_im0_cma_ptype(0 to 0);
    signal i_mul36_gemm_nn9w_im0_cma_y : i_mul36_gemm_nn9w_im0_cma_ptype(0 to 0);
    signal i_mul36_gemm_nn9w_im0_cma_s : i_mul36_gemm_nn9w_im0_cma_ptype(0 to 0);
    signal i_mul36_gemm_nn9w_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul36_gemm_nn9w_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul36_gemm_nn9w_im0_cma_ena0 : std_logic;
    signal i_mul36_gemm_nn9w_im0_cma_ena1 : std_logic;
    signal i_mul36_gemm_nn9w_im10_cma_reset : std_logic;
    type i_mul36_gemm_nn9w_im10_cma_a0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal i_mul36_gemm_nn9w_im10_cma_a0 : i_mul36_gemm_nn9w_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul36_gemm_nn9w_im10_cma_a0 : signal is true;
    signal i_mul36_gemm_nn9w_im10_cma_c0 : i_mul36_gemm_nn9w_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul36_gemm_nn9w_im10_cma_c0 : signal is true;
    type i_mul36_gemm_nn9w_im10_cma_ptype is array(NATURAL range <>) of UNSIGNED(27 downto 0);
    signal i_mul36_gemm_nn9w_im10_cma_p : i_mul36_gemm_nn9w_im10_cma_ptype(0 to 0);
    signal i_mul36_gemm_nn9w_im10_cma_u : i_mul36_gemm_nn9w_im10_cma_ptype(0 to 0);
    signal i_mul36_gemm_nn9w_im10_cma_w : i_mul36_gemm_nn9w_im10_cma_ptype(0 to 0);
    signal i_mul36_gemm_nn9w_im10_cma_x : i_mul36_gemm_nn9w_im10_cma_ptype(0 to 0);
    signal i_mul36_gemm_nn9w_im10_cma_y : i_mul36_gemm_nn9w_im10_cma_ptype(0 to 0);
    signal i_mul36_gemm_nn9w_im10_cma_s : i_mul36_gemm_nn9w_im10_cma_ptype(0 to 0);
    signal i_mul36_gemm_nn9w_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul36_gemm_nn9w_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul36_gemm_nn9w_im10_cma_ena0 : std_logic;
    signal i_mul36_gemm_nn9w_im10_cma_ena1 : std_logic;
    signal i_mul36_gemm_nn9w_ma3_cma_reset : std_logic;
    signal i_mul36_gemm_nn9w_ma3_cma_a0 : i_mul36_gemm_nn9w_im10_cma_a0type(0 to 1);
    attribute preserve of i_mul36_gemm_nn9w_ma3_cma_a0 : signal is true;
    type i_mul36_gemm_nn9w_ma3_cma_c0type is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal i_mul36_gemm_nn9w_ma3_cma_c0 : i_mul36_gemm_nn9w_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul36_gemm_nn9w_ma3_cma_c0 : signal is true;
    type i_mul36_gemm_nn9w_ma3_cma_ltype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal i_mul36_gemm_nn9w_ma3_cma_l : i_mul36_gemm_nn9w_ma3_cma_ltype(0 to 1);
    type i_mul36_gemm_nn9w_ma3_cma_ptype is array(NATURAL range <>) of SIGNED(33 downto 0);
    signal i_mul36_gemm_nn9w_ma3_cma_p : i_mul36_gemm_nn9w_ma3_cma_ptype(0 to 1);
    type i_mul36_gemm_nn9w_ma3_cma_utype is array(NATURAL range <>) of SIGNED(34 downto 0);
    signal i_mul36_gemm_nn9w_ma3_cma_u : i_mul36_gemm_nn9w_ma3_cma_utype(0 to 1);
    signal i_mul36_gemm_nn9w_ma3_cma_w : i_mul36_gemm_nn9w_ma3_cma_utype(0 to 0);
    signal i_mul36_gemm_nn9w_ma3_cma_x : i_mul36_gemm_nn9w_ma3_cma_utype(0 to 0);
    signal i_mul36_gemm_nn9w_ma3_cma_y : i_mul36_gemm_nn9w_ma3_cma_utype(0 to 0);
    signal i_mul36_gemm_nn9w_ma3_cma_s : i_mul36_gemm_nn9w_ma3_cma_utype(0 to 0);
    signal i_mul36_gemm_nn9w_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul36_gemm_nn9w_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul36_gemm_nn9w_ma3_cma_ena0 : std_logic;
    signal i_mul36_gemm_nn9w_ma3_cma_ena1 : std_logic;
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul36_gemm_nn9w_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul36_gemm_nn9w_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal redist0_i_mul36_gemm_nn9w_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist1_i_mul36_gemm_nn9w_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist2_i_mul36_gemm_nn9w_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist3_i_phi_decision139_xor_rm65_gemm_nn9w_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_notexit296_gemm_nn9w_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_notexit296_gemm_nn9w_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_exitcond_gemm_nn9w_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_acl_pop_i32_mul27315_pop24_gemm_nn9w_out_data_out_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_i_acl_pop_i32_mul27315_pop24_gemm_nn9w_out_data_out_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_i_acl_pop_i32_i_274_pop17_gemm_nn9w_out_data_out_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w_out_data_out_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w_out_data_out_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_i_acl_pop_i1_pop18_gemm_nn9w_out_data_out_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_acl_pop_i1_pop18_gemm_nn9w_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_acl_pop_i1_notexit300305_pop19_gemm_nn9w_out_data_out_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_i_acl_pop_i1_notexit300305_pop19_gemm_nn9w_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_i_acl_pop_i1_memdep_phi277_pop16317_pop25_gemm_nn9w_out_data_out_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_i_acl_pop_i1_memdep_phi277_pop16317_pop25_gemm_nn9w_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_i_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w_out_data_out_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_i_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_i_acl_pop_i1_cmp367_rm311_pop22_gemm_nn9w_out_data_out_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_i_acl_pop_i1_cmp367_rm311_pop22_gemm_nn9w_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_sync_in_aunroll_x_in_i_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_sync_in_aunroll_x_in_i_valid_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_i_arrayidx30_gemm_nn9w_gemm_nn9w164_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist26_bgTrunc_i_add28_gemm_nn9w_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_mem_reset0 : std_logic;
    signal redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_rdcnt_i : signal is true;
    signal redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_sticky_ena_q : signal is true;
    signal redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist23_sync_in_aunroll_x_in_i_valid_1(DELAY,163)
    redist23_sync_in_aunroll_x_in_i_valid_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist23_sync_in_aunroll_x_in_i_valid_1_q, clk => clock, aclr => resetn );

    -- redist24_sync_in_aunroll_x_in_i_valid_3(DELAY,164)
    redist24_sync_in_aunroll_x_in_i_valid_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist23_sync_in_aunroll_x_in_i_valid_1_q, xout => redist24_sync_in_aunroll_x_in_i_valid_3_q, clk => clock, aclr => resetn );

    -- redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_notEnable(LOGICAL,171)
    redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_nor(LOGICAL,172)
    redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_nor_q <= not (redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_notEnable_q or redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_sticky_ena_q);

    -- redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_cmpReg(REG,170)
    redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_sticky_ena(REG,173)
    redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_nor_q = "1") THEN
                redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_sticky_ena_q <= STD_LOGIC_VECTOR(redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_enaAnd(LOGICAL,174)
    redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_enaAnd_q <= redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_sticky_ena_q and VCC_q;

    -- redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_rdcnt(COUNTER,168)
    -- low=0, high=1, step=1, init=0
    redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_rdcnt_i <= redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_rdcnt_i, 1)));

    -- i_syncbuf_m_sync_buffer279_gemm_nn9w(BLACKBOX,81)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_m_sync_buffer279_gemm_nn9w : i_syncbuf_m_sync_buffer279_gemm_nn9w175
    PORT MAP (
        in_buffer_in => in_M,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_m_sync_buffer279_gemm_nn9w_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_1gr(CONSTANT,48)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- i_acl_push_i32_i_274_push17_gemm_nn9w(BLACKBOX,68)@1
    -- out out_feedback_out_17@20000000
    -- out out_feedback_valid_out_17@20000000
    thei_acl_push_i32_i_274_push17_gemm_nn9w : i_acl_push_i32_i_274_push17_gemm_nn9w187
    PORT MAP (
        in_data_in => bgTrunc_i_inc75_gemm_nn9w_sel_x_b,
        in_feedback_stall_in_17 => i_acl_pop_i32_i_274_pop17_gemm_nn9w_out_feedback_stall_out_17,
        in_notexit296 => i_notexit296_gemm_nn9w_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_17 => i_acl_push_i32_i_274_push17_gemm_nn9w_out_feedback_out_17,
        out_feedback_valid_out_17 => i_acl_push_i32_i_274_push17_gemm_nn9w_out_feedback_valid_out_17,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_0gr(CONSTANT,47)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- i_acl_pop_i32_i_274_pop17_gemm_nn9w(BLACKBOX,58)@1
    -- out out_feedback_stall_out_17@20000000
    thei_acl_pop_i32_i_274_pop17_gemm_nn9w : i_acl_pop_i32_i_274_pop17_gemm_nn9w158
    PORT MAP (
        in_data_in => c_i32_0gr_q,
        in_dir => in_c0_eni9_1,
        in_feedback_in_17 => i_acl_push_i32_i_274_push17_gemm_nn9w_out_feedback_out_17,
        in_feedback_valid_in_17 => i_acl_push_i32_i_274_push17_gemm_nn9w_out_feedback_valid_out_17,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_i_274_pop17_gemm_nn9w_out_data_out,
        out_feedback_stall_out_17 => i_acl_pop_i32_i_274_pop17_gemm_nn9w_out_feedback_stall_out_17,
        clock => clock,
        resetn => resetn
    );

    -- i_inc75_gemm_nn9w(ADD,76)@1
    i_inc75_gemm_nn9w_a <= STD_LOGIC_VECTOR("0" & i_acl_pop_i32_i_274_pop17_gemm_nn9w_out_data_out);
    i_inc75_gemm_nn9w_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc75_gemm_nn9w_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc75_gemm_nn9w_a) + UNSIGNED(i_inc75_gemm_nn9w_b));
    i_inc75_gemm_nn9w_q <= i_inc75_gemm_nn9w_o(32 downto 0);

    -- bgTrunc_i_inc75_gemm_nn9w_sel_x(BITSELECT,3)@1
    bgTrunc_i_inc75_gemm_nn9w_sel_x_b <= i_inc75_gemm_nn9w_q(31 downto 0);

    -- i_exitcond_gemm_nn9w(LOGICAL,72)@1
    i_exitcond_gemm_nn9w_q <= "1" WHEN bgTrunc_i_inc75_gemm_nn9w_sel_x_b = i_syncbuf_m_sync_buffer279_gemm_nn9w_out_buffer_out ELSE "0";

    -- i_exitcond_not_gemm_nn9w(LOGICAL,73)@1
    i_exitcond_not_gemm_nn9w_q <= i_exitcond_gemm_nn9w_q xor VCC_q;

    -- i_syncbuf_m_sync_buffer_gemm_nn9w(BLACKBOX,82)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_m_sync_buffer_gemm_nn9w : i_syncbuf_m_sync_buffer_gemm_nn9w169
    PORT MAP (
        in_buffer_in => in_M,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_m_sync_buffer_gemm_nn9w_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_cmp2473_rm60255_gemm_nn9w(COMPARE,71)@1
    i_cmp2473_rm60255_gemm_nn9w_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_0gr_q(31)) & c_i32_0gr_q));
    i_cmp2473_rm60255_gemm_nn9w_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_m_sync_buffer_gemm_nn9w_out_buffer_out(31)) & i_syncbuf_m_sync_buffer_gemm_nn9w_out_buffer_out));
    i_cmp2473_rm60255_gemm_nn9w_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp2473_rm60255_gemm_nn9w_a) - SIGNED(i_cmp2473_rm60255_gemm_nn9w_b));
    i_cmp2473_rm60255_gemm_nn9w_c(0) <= i_cmp2473_rm60255_gemm_nn9w_o(33);

    -- redist4_i_notexit296_gemm_nn9w_q_1(DELAY,144)
    redist4_i_notexit296_gemm_nn9w_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_notexit296_gemm_nn9w_q, xout => redist4_i_notexit296_gemm_nn9w_q_1_q, clk => clock, aclr => resetn );

    -- redist19_i_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w_out_data_out_1(DELAY,159)
    redist19_i_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w_out_data_out, xout => redist19_i_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w_out_data_out_1_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_cmp75_rm309_push21_gemm_nn9w(BLACKBOX,61)@2
    -- out out_feedback_out_21@20000000
    -- out out_feedback_valid_out_21@20000000
    thei_acl_push_i1_cmp75_rm309_push21_gemm_nn9w : i_acl_push_i1_cmp75_rm309_push21_gemm_nn9w183
    PORT MAP (
        in_data_in => redist19_i_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w_out_data_out_1_q,
        in_feedback_stall_in_21 => i_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w_out_feedback_stall_out_21,
        in_notexit296 => redist4_i_notexit296_gemm_nn9w_q_1_q,
        in_stall_in => GND_q,
        in_valid_in => redist23_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_21 => i_acl_push_i1_cmp75_rm309_push21_gemm_nn9w_out_feedback_out_21,
        out_feedback_valid_out_21 => i_acl_push_i1_cmp75_rm309_push21_gemm_nn9w_out_feedback_valid_out_21,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w(BLACKBOX,52)@1
    -- out out_feedback_stall_out_21@20000000
    thei_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w : i_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w172
    PORT MAP (
        in_data_in => in_c0_eni9_5,
        in_dir => in_c0_eni9_1,
        in_feedback_in_21 => i_acl_push_i1_cmp75_rm309_push21_gemm_nn9w_out_feedback_out_21,
        in_feedback_valid_in_21 => i_acl_push_i1_cmp75_rm309_push21_gemm_nn9w_out_feedback_valid_out_21,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w_out_data_out,
        out_feedback_stall_out_21 => i_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w_out_feedback_stall_out_21,
        clock => clock,
        resetn => resetn
    );

    -- i_unnamed_gemm_nn9w174(LOGICAL,83)@1
    i_unnamed_gemm_nn9w174_q <= i_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w_out_data_out and i_cmp2473_rm60255_gemm_nn9w_c;

    -- i_notexit296_gemm_nn9w(LOGICAL,78)@1
    i_notexit296_gemm_nn9w_q <= i_unnamed_gemm_nn9w174_q and i_exitcond_not_gemm_nn9w_q;

    -- i_acl_push_i32_div_rm313_push23_gemm_nn9w(BLACKBOX,67)@1
    -- out out_feedback_out_23@20000000
    -- out out_feedback_valid_out_23@20000000
    thei_acl_push_i32_div_rm313_push23_gemm_nn9w : i_acl_push_i32_div_rm313_push23_gemm_nn9w205
    PORT MAP (
        in_data_in => i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out,
        in_feedback_stall_in_23 => i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_feedback_stall_out_23,
        in_notexit296 => i_notexit296_gemm_nn9w_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_23 => i_acl_push_i32_div_rm313_push23_gemm_nn9w_out_feedback_out_23,
        out_feedback_valid_out_23 => i_acl_push_i32_div_rm313_push23_gemm_nn9w_out_feedback_valid_out_23,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i32_div_rm313_pop23_gemm_nn9w(BLACKBOX,57)@1
    -- out out_feedback_stall_out_23@20000000
    thei_acl_pop_i32_div_rm313_pop23_gemm_nn9w : i_acl_pop_i32_div_rm313_pop23_gemm_nn9w203
    PORT MAP (
        in_data_in => in_c0_eni9_9,
        in_dir => in_c0_eni9_1,
        in_feedback_in_23 => i_acl_push_i32_div_rm313_push23_gemm_nn9w_out_feedback_out_23,
        in_feedback_valid_in_23 => i_acl_push_i32_div_rm313_push23_gemm_nn9w_out_feedback_valid_out_23,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out,
        out_feedback_stall_out_23 => i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_feedback_stall_out_23,
        clock => clock,
        resetn => resetn
    );

    -- redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_wraddr(REG,169)
    redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_wraddr_q <= "1";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_wraddr_q <= STD_LOGIC_VECTOR(redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_mem(DUALMEM,167)
    redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_mem_ia <= STD_LOGIC_VECTOR(i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out);
    redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_mem_aa <= redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_wraddr_q;
    redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_mem_ab <= redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_rdcnt_q;
    redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_mem_reset0 <= not (resetn);
    redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_mem_dmem : altera_syncram
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
        clocken1 => redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_mem_reset0,
        clock1 => clock,
        address_a => redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_mem_aa,
        data_a => redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_mem_ab,
        q_b => redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_mem_iq
    );
    redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_mem_q <= redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_mem_iq(31 downto 0);

    -- i_acl_push_i1_cmp367_rm311_push22_gemm_nn9w(BLACKBOX,60)@2
    -- out out_feedback_out_22@20000000
    -- out out_feedback_valid_out_22@20000000
    thei_acl_push_i1_cmp367_rm311_push22_gemm_nn9w : i_acl_push_i1_cmp367_rm311_push22_gemm_nn9w201
    PORT MAP (
        in_data_in => redist21_i_acl_pop_i1_cmp367_rm311_pop22_gemm_nn9w_out_data_out_1_q,
        in_feedback_stall_in_22 => i_acl_pop_i1_cmp367_rm311_pop22_gemm_nn9w_out_feedback_stall_out_22,
        in_notexit296 => redist4_i_notexit296_gemm_nn9w_q_1_q,
        in_stall_in => GND_q,
        in_valid_in => redist23_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_22 => i_acl_push_i1_cmp367_rm311_push22_gemm_nn9w_out_feedback_out_22,
        out_feedback_valid_out_22 => i_acl_push_i1_cmp367_rm311_push22_gemm_nn9w_out_feedback_valid_out_22,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_cmp367_rm311_pop22_gemm_nn9w(BLACKBOX,51)@1
    -- out out_feedback_stall_out_22@20000000
    thei_acl_pop_i1_cmp367_rm311_pop22_gemm_nn9w : i_acl_pop_i1_cmp367_rm311_pop22_gemm_nn9w199
    PORT MAP (
        in_data_in => in_c0_eni9_8,
        in_dir => in_c0_eni9_1,
        in_feedback_in_22 => i_acl_push_i1_cmp367_rm311_push22_gemm_nn9w_out_feedback_out_22,
        in_feedback_valid_in_22 => i_acl_push_i1_cmp367_rm311_push22_gemm_nn9w_out_feedback_valid_out_22,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_cmp367_rm311_pop22_gemm_nn9w_out_data_out,
        out_feedback_stall_out_22 => i_acl_pop_i1_cmp367_rm311_pop22_gemm_nn9w_out_feedback_stall_out_22,
        clock => clock,
        resetn => resetn
    );

    -- redist21_i_acl_pop_i1_cmp367_rm311_pop22_gemm_nn9w_out_data_out_1(DELAY,161)
    redist21_i_acl_pop_i1_cmp367_rm311_pop22_gemm_nn9w_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_cmp367_rm311_pop22_gemm_nn9w_out_data_out, xout => redist21_i_acl_pop_i1_cmp367_rm311_pop22_gemm_nn9w_out_data_out_1_q, clk => clock, aclr => resetn );

    -- redist22_i_acl_pop_i1_cmp367_rm311_pop22_gemm_nn9w_out_data_out_3(DELAY,162)
    redist22_i_acl_pop_i1_cmp367_rm311_pop22_gemm_nn9w_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist21_i_acl_pop_i1_cmp367_rm311_pop22_gemm_nn9w_out_data_out_1_q, xout => redist22_i_acl_pop_i1_cmp367_rm311_pop22_gemm_nn9w_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_notexit300305_push19_gemm_nn9w(BLACKBOX,63)@2
    -- out out_feedback_out_19@20000000
    -- out out_feedback_valid_out_19@20000000
    thei_acl_push_i1_notexit300305_push19_gemm_nn9w : i_acl_push_i1_notexit300305_push19_gemm_nn9w197
    PORT MAP (
        in_data_in => redist15_i_acl_pop_i1_notexit300305_pop19_gemm_nn9w_out_data_out_1_q,
        in_feedback_stall_in_19 => i_acl_pop_i1_notexit300305_pop19_gemm_nn9w_out_feedback_stall_out_19,
        in_notexit296 => redist4_i_notexit296_gemm_nn9w_q_1_q,
        in_stall_in => GND_q,
        in_valid_in => redist23_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_19 => i_acl_push_i1_notexit300305_push19_gemm_nn9w_out_feedback_out_19,
        out_feedback_valid_out_19 => i_acl_push_i1_notexit300305_push19_gemm_nn9w_out_feedback_valid_out_19,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_notexit300305_pop19_gemm_nn9w(BLACKBOX,54)@1
    -- out out_feedback_stall_out_19@20000000
    thei_acl_pop_i1_notexit300305_pop19_gemm_nn9w : i_acl_pop_i1_notexit300305_pop19_gemm_nn9w195
    PORT MAP (
        in_data_in => in_c0_eni9_7,
        in_dir => in_c0_eni9_1,
        in_feedback_in_19 => i_acl_push_i1_notexit300305_push19_gemm_nn9w_out_feedback_out_19,
        in_feedback_valid_in_19 => i_acl_push_i1_notexit300305_push19_gemm_nn9w_out_feedback_valid_out_19,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_notexit300305_pop19_gemm_nn9w_out_data_out,
        out_feedback_stall_out_19 => i_acl_pop_i1_notexit300305_pop19_gemm_nn9w_out_feedback_stall_out_19,
        clock => clock,
        resetn => resetn
    );

    -- redist15_i_acl_pop_i1_notexit300305_pop19_gemm_nn9w_out_data_out_1(DELAY,155)
    redist15_i_acl_pop_i1_notexit300305_pop19_gemm_nn9w_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_notexit300305_pop19_gemm_nn9w_out_data_out, xout => redist15_i_acl_pop_i1_notexit300305_pop19_gemm_nn9w_out_data_out_1_q, clk => clock, aclr => resetn );

    -- redist16_i_acl_pop_i1_notexit300305_pop19_gemm_nn9w_out_data_out_3(DELAY,156)
    redist16_i_acl_pop_i1_notexit300305_pop19_gemm_nn9w_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist15_i_acl_pop_i1_notexit300305_pop19_gemm_nn9w_out_data_out_1_q, xout => redist16_i_acl_pop_i1_notexit300305_pop19_gemm_nn9w_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_push18_gemm_nn9w(BLACKBOX,65)@2
    -- out out_feedback_out_18@20000000
    -- out out_feedback_valid_out_18@20000000
    thei_acl_push_i1_push18_gemm_nn9w : i_acl_push_i1_push18_gemm_nn9w193
    PORT MAP (
        in_data_in => redist13_i_acl_pop_i1_pop18_gemm_nn9w_out_data_out_1_q,
        in_feedback_stall_in_18 => i_acl_pop_i1_pop18_gemm_nn9w_out_feedback_stall_out_18,
        in_notexit296 => redist4_i_notexit296_gemm_nn9w_q_1_q,
        in_stall_in => GND_q,
        in_valid_in => redist23_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_18 => i_acl_push_i1_push18_gemm_nn9w_out_feedback_out_18,
        out_feedback_valid_out_18 => i_acl_push_i1_push18_gemm_nn9w_out_feedback_valid_out_18,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_pop18_gemm_nn9w(BLACKBOX,55)@1
    -- out out_feedback_stall_out_18@20000000
    thei_acl_pop_i1_pop18_gemm_nn9w : i_acl_pop_i1_pop18_gemm_nn9w191
    PORT MAP (
        in_data_in => in_c0_eni9_6,
        in_dir => in_c0_eni9_1,
        in_feedback_in_18 => i_acl_push_i1_push18_gemm_nn9w_out_feedback_out_18,
        in_feedback_valid_in_18 => i_acl_push_i1_push18_gemm_nn9w_out_feedback_valid_out_18,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_pop18_gemm_nn9w_out_data_out,
        out_feedback_stall_out_18 => i_acl_pop_i1_pop18_gemm_nn9w_out_feedback_stall_out_18,
        clock => clock,
        resetn => resetn
    );

    -- redist13_i_acl_pop_i1_pop18_gemm_nn9w_out_data_out_1(DELAY,153)
    redist13_i_acl_pop_i1_pop18_gemm_nn9w_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_pop18_gemm_nn9w_out_data_out, xout => redist13_i_acl_pop_i1_pop18_gemm_nn9w_out_data_out_1_q, clk => clock, aclr => resetn );

    -- redist14_i_acl_pop_i1_pop18_gemm_nn9w_out_data_out_3(DELAY,154)
    redist14_i_acl_pop_i1_pop18_gemm_nn9w_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist13_i_acl_pop_i1_pop18_gemm_nn9w_out_data_out_1_q, xout => redist14_i_acl_pop_i1_pop18_gemm_nn9w_out_data_out_3_q, clk => clock, aclr => resetn );

    -- redist5_i_notexit296_gemm_nn9w_q_3(DELAY,145)
    redist5_i_notexit296_gemm_nn9w_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist4_i_notexit296_gemm_nn9w_q_1_q, xout => redist5_i_notexit296_gemm_nn9w_q_3_q, clk => clock, aclr => resetn );

    -- redist6_i_exitcond_gemm_nn9w_q_3(DELAY,146)
    redist6_i_exitcond_gemm_nn9w_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_exitcond_gemm_nn9w_q, xout => redist6_i_exitcond_gemm_nn9w_q_3_q, clk => clock, aclr => resetn );

    -- i_unnamed_gemm_nn9w178(LOGICAL,84)@4
    i_unnamed_gemm_nn9w178_q <= redist6_i_exitcond_gemm_nn9w_q_3_q or redist3_i_phi_decision139_xor_rm65_gemm_nn9w_q_3_q;

    -- i_phi_decision139_xor_rm65_gemm_nn9w(LOGICAL,79)@1 + 1
    i_phi_decision139_xor_rm65_gemm_nn9w_qi <= i_unnamed_gemm_nn9w174_q xor VCC_q;
    i_phi_decision139_xor_rm65_gemm_nn9w_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_phi_decision139_xor_rm65_gemm_nn9w_qi, xout => i_phi_decision139_xor_rm65_gemm_nn9w_q, clk => clock, aclr => resetn );

    -- redist3_i_phi_decision139_xor_rm65_gemm_nn9w_q_3(DELAY,143)
    redist3_i_phi_decision139_xor_rm65_gemm_nn9w_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_phi_decision139_xor_rm65_gemm_nn9w_q, xout => redist3_i_phi_decision139_xor_rm65_gemm_nn9w_q_3_q, clk => clock, aclr => resetn );

    -- redist20_i_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w_out_data_out_3(DELAY,160)
    redist20_i_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist19_i_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w_out_data_out_1_q, xout => redist20_i_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_mul36_gemm_nn9w_bs4(BITSELECT,118)@1
    i_mul36_gemm_nn9w_bs4_in <= STD_LOGIC_VECTOR(i_acl_pop_i32_i_274_pop17_gemm_nn9w_out_data_out(17 downto 0));
    i_mul36_gemm_nn9w_bs4_b <= STD_LOGIC_VECTOR(i_mul36_gemm_nn9w_bs4_in(17 downto 0));

    -- i_mul36_gemm_nn9w_bjA5(BITJOIN,119)@1
    i_mul36_gemm_nn9w_bjA5_q <= GND_q & i_mul36_gemm_nn9w_bs4_b;

    -- redist11_i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w_out_data_out_1(DELAY,151)
    redist11_i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w_out_data_out, xout => redist11_i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w_out_data_out_1_q, clk => clock, aclr => resetn );

    -- i_acl_push_i32_div1_rm307_push20_gemm_nn9w(BLACKBOX,66)@2
    -- out out_feedback_out_20@20000000
    -- out out_feedback_valid_out_20@20000000
    thei_acl_push_i32_div1_rm307_push20_gemm_nn9w : i_acl_push_i32_div1_rm307_push20_gemm_nn9w185
    PORT MAP (
        in_data_in => redist11_i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w_out_data_out_1_q,
        in_feedback_stall_in_20 => i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w_out_feedback_stall_out_20,
        in_notexit296 => redist4_i_notexit296_gemm_nn9w_q_1_q,
        in_stall_in => GND_q,
        in_valid_in => redist23_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_20 => i_acl_push_i32_div1_rm307_push20_gemm_nn9w_out_feedback_out_20,
        out_feedback_valid_out_20 => i_acl_push_i32_div1_rm307_push20_gemm_nn9w_out_feedback_valid_out_20,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w(BLACKBOX,56)@1
    -- out out_feedback_stall_out_20@20000000
    thei_acl_pop_i32_div1_rm307_pop20_gemm_nn9w : i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w167
    PORT MAP (
        in_data_in => in_c0_eni9_4,
        in_dir => in_c0_eni9_1,
        in_feedback_in_20 => i_acl_push_i32_div1_rm307_push20_gemm_nn9w_out_feedback_out_20,
        in_feedback_valid_in_20 => i_acl_push_i32_div1_rm307_push20_gemm_nn9w_out_feedback_valid_out_20,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w_out_data_out,
        out_feedback_stall_out_20 => i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w_out_feedback_stall_out_20,
        clock => clock,
        resetn => resetn
    );

    -- i_mul36_gemm_nn9w_bs2_merged_bit_select(BITSELECT,139)@1
    i_mul36_gemm_nn9w_bs2_merged_bit_select_b <= i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w_out_data_out(17 downto 0);
    i_mul36_gemm_nn9w_bs2_merged_bit_select_c <= i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w_out_data_out(31 downto 18);

    -- i_mul36_gemm_nn9w_bjB9(BITJOIN,123)@1
    i_mul36_gemm_nn9w_bjB9_q <= GND_q & i_mul36_gemm_nn9w_bs2_merged_bit_select_b;

    -- i_mul36_gemm_nn9w_bs7(BITSELECT,121)@1
    i_mul36_gemm_nn9w_bs7_b <= STD_LOGIC_VECTOR(i_acl_pop_i32_i_274_pop17_gemm_nn9w_out_data_out(31 downto 18));

    -- i_mul36_gemm_nn9w_ma3_cma(CHAINMULTADD,137)@1 + 2
    i_mul36_gemm_nn9w_ma3_cma_reset <= not (resetn);
    i_mul36_gemm_nn9w_ma3_cma_ena0 <= '1';
    i_mul36_gemm_nn9w_ma3_cma_ena1 <= i_mul36_gemm_nn9w_ma3_cma_ena0;
    i_mul36_gemm_nn9w_ma3_cma_l(0) <= SIGNED(RESIZE(i_mul36_gemm_nn9w_ma3_cma_a0(0),15));
    i_mul36_gemm_nn9w_ma3_cma_l(1) <= SIGNED(RESIZE(i_mul36_gemm_nn9w_ma3_cma_a0(1),15));
    i_mul36_gemm_nn9w_ma3_cma_p(0) <= i_mul36_gemm_nn9w_ma3_cma_l(0) * i_mul36_gemm_nn9w_ma3_cma_c0(0);
    i_mul36_gemm_nn9w_ma3_cma_p(1) <= i_mul36_gemm_nn9w_ma3_cma_l(1) * i_mul36_gemm_nn9w_ma3_cma_c0(1);
    i_mul36_gemm_nn9w_ma3_cma_u(0) <= RESIZE(i_mul36_gemm_nn9w_ma3_cma_p(0),35);
    i_mul36_gemm_nn9w_ma3_cma_u(1) <= RESIZE(i_mul36_gemm_nn9w_ma3_cma_p(1),35);
    i_mul36_gemm_nn9w_ma3_cma_w(0) <= i_mul36_gemm_nn9w_ma3_cma_u(0) + i_mul36_gemm_nn9w_ma3_cma_u(1);
    i_mul36_gemm_nn9w_ma3_cma_x(0) <= i_mul36_gemm_nn9w_ma3_cma_w(0);
    i_mul36_gemm_nn9w_ma3_cma_y(0) <= i_mul36_gemm_nn9w_ma3_cma_x(0);
    i_mul36_gemm_nn9w_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul36_gemm_nn9w_ma3_cma_a0 <= (others => (others => '0'));
            i_mul36_gemm_nn9w_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul36_gemm_nn9w_ma3_cma_ena0 = '1') THEN
                i_mul36_gemm_nn9w_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_mul36_gemm_nn9w_bs7_b),14);
                i_mul36_gemm_nn9w_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_mul36_gemm_nn9w_bs2_merged_bit_select_c),14);
                i_mul36_gemm_nn9w_ma3_cma_c0(0) <= RESIZE(SIGNED(i_mul36_gemm_nn9w_bjB9_q),19);
                i_mul36_gemm_nn9w_ma3_cma_c0(1) <= RESIZE(SIGNED(i_mul36_gemm_nn9w_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_mul36_gemm_nn9w_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul36_gemm_nn9w_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul36_gemm_nn9w_ma3_cma_ena1 = '1') THEN
                i_mul36_gemm_nn9w_ma3_cma_s(0) <= i_mul36_gemm_nn9w_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul36_gemm_nn9w_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul36_gemm_nn9w_ma3_cma_s(0)(33 downto 0)), xout => i_mul36_gemm_nn9w_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul36_gemm_nn9w_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul36_gemm_nn9w_ma3_cma_qq(33 downto 0));

    -- redist0_i_mul36_gemm_nn9w_ma3_cma_q_1(DELAY,140)
    redist0_i_mul36_gemm_nn9w_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul36_gemm_nn9w_ma3_cma_q, xout => redist0_i_mul36_gemm_nn9w_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul36_gemm_nn9w_align_14(BITSHIFT,128)@4
    i_mul36_gemm_nn9w_align_14_qint <= redist0_i_mul36_gemm_nn9w_ma3_cma_q_1_q & "000000000000000000";
    i_mul36_gemm_nn9w_align_14_q <= i_mul36_gemm_nn9w_align_14_qint(51 downto 0);

    -- i_mul36_gemm_nn9w_bs11(BITSELECT,125)@1
    i_mul36_gemm_nn9w_bs11_b <= i_acl_pop_i32_i_274_pop17_gemm_nn9w_out_data_out(31 downto 18);

    -- i_mul36_gemm_nn9w_im10_cma(CHAINMULTADD,136)@1 + 2
    i_mul36_gemm_nn9w_im10_cma_reset <= not (resetn);
    i_mul36_gemm_nn9w_im10_cma_ena0 <= '1';
    i_mul36_gemm_nn9w_im10_cma_ena1 <= i_mul36_gemm_nn9w_im10_cma_ena0;
    i_mul36_gemm_nn9w_im10_cma_p(0) <= i_mul36_gemm_nn9w_im10_cma_a0(0) * i_mul36_gemm_nn9w_im10_cma_c0(0);
    i_mul36_gemm_nn9w_im10_cma_u(0) <= RESIZE(i_mul36_gemm_nn9w_im10_cma_p(0),28);
    i_mul36_gemm_nn9w_im10_cma_w(0) <= i_mul36_gemm_nn9w_im10_cma_u(0);
    i_mul36_gemm_nn9w_im10_cma_x(0) <= i_mul36_gemm_nn9w_im10_cma_w(0);
    i_mul36_gemm_nn9w_im10_cma_y(0) <= i_mul36_gemm_nn9w_im10_cma_x(0);
    i_mul36_gemm_nn9w_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul36_gemm_nn9w_im10_cma_a0 <= (others => (others => '0'));
            i_mul36_gemm_nn9w_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul36_gemm_nn9w_im10_cma_ena0 = '1') THEN
                i_mul36_gemm_nn9w_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_mul36_gemm_nn9w_bs11_b),14);
                i_mul36_gemm_nn9w_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_mul36_gemm_nn9w_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul36_gemm_nn9w_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul36_gemm_nn9w_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul36_gemm_nn9w_im10_cma_ena1 = '1') THEN
                i_mul36_gemm_nn9w_im10_cma_s(0) <= i_mul36_gemm_nn9w_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul36_gemm_nn9w_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul36_gemm_nn9w_im10_cma_s(0)(27 downto 0)), xout => i_mul36_gemm_nn9w_im10_cma_qq, clk => clock, aclr => resetn );
    i_mul36_gemm_nn9w_im10_cma_q <= STD_LOGIC_VECTOR(i_mul36_gemm_nn9w_im10_cma_qq(27 downto 0));

    -- redist1_i_mul36_gemm_nn9w_im10_cma_q_1(DELAY,141)
    redist1_i_mul36_gemm_nn9w_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul36_gemm_nn9w_im10_cma_q, xout => redist1_i_mul36_gemm_nn9w_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul36_gemm_nn9w_bs1(BITSELECT,115)@1
    i_mul36_gemm_nn9w_bs1_in <= i_acl_pop_i32_i_274_pop17_gemm_nn9w_out_data_out(17 downto 0);
    i_mul36_gemm_nn9w_bs1_b <= i_mul36_gemm_nn9w_bs1_in(17 downto 0);

    -- i_mul36_gemm_nn9w_im0_cma(CHAINMULTADD,135)@1 + 2
    i_mul36_gemm_nn9w_im0_cma_reset <= not (resetn);
    i_mul36_gemm_nn9w_im0_cma_ena0 <= '1';
    i_mul36_gemm_nn9w_im0_cma_ena1 <= i_mul36_gemm_nn9w_im0_cma_ena0;
    i_mul36_gemm_nn9w_im0_cma_p(0) <= i_mul36_gemm_nn9w_im0_cma_a0(0) * i_mul36_gemm_nn9w_im0_cma_c0(0);
    i_mul36_gemm_nn9w_im0_cma_u(0) <= RESIZE(i_mul36_gemm_nn9w_im0_cma_p(0),36);
    i_mul36_gemm_nn9w_im0_cma_w(0) <= i_mul36_gemm_nn9w_im0_cma_u(0);
    i_mul36_gemm_nn9w_im0_cma_x(0) <= i_mul36_gemm_nn9w_im0_cma_w(0);
    i_mul36_gemm_nn9w_im0_cma_y(0) <= i_mul36_gemm_nn9w_im0_cma_x(0);
    i_mul36_gemm_nn9w_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul36_gemm_nn9w_im0_cma_a0 <= (others => (others => '0'));
            i_mul36_gemm_nn9w_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul36_gemm_nn9w_im0_cma_ena0 = '1') THEN
                i_mul36_gemm_nn9w_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul36_gemm_nn9w_bs1_b),18);
                i_mul36_gemm_nn9w_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_mul36_gemm_nn9w_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_mul36_gemm_nn9w_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul36_gemm_nn9w_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul36_gemm_nn9w_im0_cma_ena1 = '1') THEN
                i_mul36_gemm_nn9w_im0_cma_s(0) <= i_mul36_gemm_nn9w_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul36_gemm_nn9w_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul36_gemm_nn9w_im0_cma_s(0)(35 downto 0)), xout => i_mul36_gemm_nn9w_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul36_gemm_nn9w_im0_cma_q <= STD_LOGIC_VECTOR(i_mul36_gemm_nn9w_im0_cma_qq(35 downto 0));

    -- redist2_i_mul36_gemm_nn9w_im0_cma_q_1(DELAY,142)
    redist2_i_mul36_gemm_nn9w_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul36_gemm_nn9w_im0_cma_q, xout => redist2_i_mul36_gemm_nn9w_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul36_gemm_nn9w_join_13(BITJOIN,127)@4
    i_mul36_gemm_nn9w_join_13_q <= redist1_i_mul36_gemm_nn9w_im10_cma_q_1_q & redist2_i_mul36_gemm_nn9w_im0_cma_q_1_q;

    -- i_mul36_gemm_nn9w_result_add_0_0(ADD,130)@4
    i_mul36_gemm_nn9w_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul36_gemm_nn9w_join_13_q));
    i_mul36_gemm_nn9w_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_mul36_gemm_nn9w_align_14_q(51)) & i_mul36_gemm_nn9w_align_14_q));
    i_mul36_gemm_nn9w_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul36_gemm_nn9w_result_add_0_0_a) + SIGNED(i_mul36_gemm_nn9w_result_add_0_0_b));
    i_mul36_gemm_nn9w_result_add_0_0_q <= i_mul36_gemm_nn9w_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_mul36_gemm_nn9w_rnd_sel(BITSELECT,112)@4
    bgTrunc_i_mul36_gemm_nn9w_rnd_sel_in <= i_mul36_gemm_nn9w_result_add_0_0_q(63 downto 0);
    bgTrunc_i_mul36_gemm_nn9w_rnd_sel_b <= bgTrunc_i_mul36_gemm_nn9w_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_mul36_gemm_nn9w_sel_x(BITSELECT,4)@4
    bgTrunc_i_mul36_gemm_nn9w_sel_x_b <= bgTrunc_i_mul36_gemm_nn9w_rnd_sel_b(31 downto 0);

    -- redist12_i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w_out_data_out_3(DELAY,152)
    redist12_i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist11_i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w_out_data_out_1_q, xout => redist12_i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_memdep_phi277_pop16317_push25_gemm_nn9w(BLACKBOX,62)@2
    -- out out_feedback_out_25@20000000
    -- out out_feedback_valid_out_25@20000000
    thei_acl_push_i1_memdep_phi277_pop16317_push25_gemm_nn9w : i_acl_push_i1_memdep_phi277_pop16317_push25_gemm_nn9w179
    PORT MAP (
        in_data_in => redist17_i_acl_pop_i1_memdep_phi277_pop16317_pop25_gemm_nn9w_out_data_out_1_q,
        in_feedback_stall_in_25 => i_acl_pop_i1_memdep_phi277_pop16317_pop25_gemm_nn9w_out_feedback_stall_out_25,
        in_notexit296 => redist4_i_notexit296_gemm_nn9w_q_1_q,
        in_stall_in => GND_q,
        in_valid_in => redist23_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_25 => i_acl_push_i1_memdep_phi277_pop16317_push25_gemm_nn9w_out_feedback_out_25,
        out_feedback_valid_out_25 => i_acl_push_i1_memdep_phi277_pop16317_push25_gemm_nn9w_out_feedback_valid_out_25,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_memdep_phi277_pop16317_pop25_gemm_nn9w(BLACKBOX,53)@1
    -- out out_feedback_stall_out_25@20000000
    thei_acl_pop_i1_memdep_phi277_pop16317_pop25_gemm_nn9w : i_acl_pop_i1_memdep_phi277_pop16317_pop25_gemm_nn9w165
    PORT MAP (
        in_data_in => in_c0_eni9_3,
        in_dir => in_c0_eni9_1,
        in_feedback_in_25 => i_acl_push_i1_memdep_phi277_pop16317_push25_gemm_nn9w_out_feedback_out_25,
        in_feedback_valid_in_25 => i_acl_push_i1_memdep_phi277_pop16317_push25_gemm_nn9w_out_feedback_valid_out_25,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_memdep_phi277_pop16317_pop25_gemm_nn9w_out_data_out,
        out_feedback_stall_out_25 => i_acl_pop_i1_memdep_phi277_pop16317_pop25_gemm_nn9w_out_feedback_stall_out_25,
        clock => clock,
        resetn => resetn
    );

    -- redist17_i_acl_pop_i1_memdep_phi277_pop16317_pop25_gemm_nn9w_out_data_out_1(DELAY,157)
    redist17_i_acl_pop_i1_memdep_phi277_pop16317_pop25_gemm_nn9w_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_memdep_phi277_pop16317_pop25_gemm_nn9w_out_data_out, xout => redist17_i_acl_pop_i1_memdep_phi277_pop16317_pop25_gemm_nn9w_out_data_out_1_q, clk => clock, aclr => resetn );

    -- redist18_i_acl_pop_i1_memdep_phi277_pop16317_pop25_gemm_nn9w_out_data_out_3(DELAY,158)
    redist18_i_acl_pop_i1_memdep_phi277_pop16317_pop25_gemm_nn9w_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist17_i_acl_pop_i1_memdep_phi277_pop16317_pop25_gemm_nn9w_out_data_out_1_q, xout => redist18_i_acl_pop_i1_memdep_phi277_pop16317_pop25_gemm_nn9w_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_multconst_x(CONSTANT,33)
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_multconst_x_q <= "00000000000000000000000000000000000000000000000000000000000000";

    -- i_acl_push_i32_mul27315_push24_gemm_nn9w(BLACKBOX,69)@2
    -- out out_feedback_out_24@20000000
    -- out out_feedback_valid_out_24@20000000
    thei_acl_push_i32_mul27315_push24_gemm_nn9w : i_acl_push_i32_mul27315_push24_gemm_nn9w181
    PORT MAP (
        in_data_in => redist7_i_acl_pop_i32_mul27315_pop24_gemm_nn9w_out_data_out_1_q,
        in_feedback_stall_in_24 => i_acl_pop_i32_mul27315_pop24_gemm_nn9w_out_feedback_stall_out_24,
        in_notexit296 => redist4_i_notexit296_gemm_nn9w_q_1_q,
        in_stall_in => GND_q,
        in_valid_in => redist23_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_24 => i_acl_push_i32_mul27315_push24_gemm_nn9w_out_feedback_out_24,
        out_feedback_valid_out_24 => i_acl_push_i32_mul27315_push24_gemm_nn9w_out_feedback_valid_out_24,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i32_mul27315_pop24_gemm_nn9w(BLACKBOX,59)@1
    -- out out_feedback_stall_out_24@20000000
    thei_acl_pop_i32_mul27315_pop24_gemm_nn9w : i_acl_pop_i32_mul27315_pop24_gemm_nn9w160
    PORT MAP (
        in_data_in => in_c0_eni9_2,
        in_dir => in_c0_eni9_1,
        in_feedback_in_24 => i_acl_push_i32_mul27315_push24_gemm_nn9w_out_feedback_out_24,
        in_feedback_valid_in_24 => i_acl_push_i32_mul27315_push24_gemm_nn9w_out_feedback_valid_out_24,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_mul27315_pop24_gemm_nn9w_out_data_out,
        out_feedback_stall_out_24 => i_acl_pop_i32_mul27315_pop24_gemm_nn9w_out_feedback_stall_out_24,
        clock => clock,
        resetn => resetn
    );

    -- redist7_i_acl_pop_i32_mul27315_pop24_gemm_nn9w_out_data_out_1(DELAY,147)
    redist7_i_acl_pop_i32_mul27315_pop24_gemm_nn9w_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i32_mul27315_pop24_gemm_nn9w_out_data_out, xout => redist7_i_acl_pop_i32_mul27315_pop24_gemm_nn9w_out_data_out_1_q, clk => clock, aclr => resetn );

    -- redist9_i_acl_pop_i32_i_274_pop17_gemm_nn9w_out_data_out_1(DELAY,149)
    redist9_i_acl_pop_i32_i_274_pop17_gemm_nn9w_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i32_i_274_pop17_gemm_nn9w_out_data_out, xout => redist9_i_acl_pop_i32_i_274_pop17_gemm_nn9w_out_data_out_1_q, clk => clock, aclr => resetn );

    -- i_add28_gemm_nn9w(ADD,70)@2
    i_add28_gemm_nn9w_a <= STD_LOGIC_VECTOR("0" & redist9_i_acl_pop_i32_i_274_pop17_gemm_nn9w_out_data_out_1_q);
    i_add28_gemm_nn9w_b <= STD_LOGIC_VECTOR("0" & redist7_i_acl_pop_i32_mul27315_pop24_gemm_nn9w_out_data_out_1_q);
    i_add28_gemm_nn9w_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add28_gemm_nn9w_a) + UNSIGNED(i_add28_gemm_nn9w_b));
    i_add28_gemm_nn9w_q <= i_add28_gemm_nn9w_o(32 downto 0);

    -- bgTrunc_i_add28_gemm_nn9w_sel_x(BITSELECT,2)@2
    bgTrunc_i_add28_gemm_nn9w_sel_x_b <= i_add28_gemm_nn9w_q(31 downto 0);

    -- redist26_bgTrunc_i_add28_gemm_nn9w_sel_x_b_1(DELAY,166)
    redist26_bgTrunc_i_add28_gemm_nn9w_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add28_gemm_nn9w_sel_x_b, xout => redist26_bgTrunc_i_add28_gemm_nn9w_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_idxprom29_gemm_nn9w_sel_x(BITSELECT,39)@3
    i_idxprom29_gemm_nn9w_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist26_bgTrunc_i_add28_gemm_nn9w_sel_x_b_1_q(31 downto 0)), 64)));

    -- i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_bs1_merged_bit_select(BITSELECT,138)@3
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_bs1_merged_bit_select_b <= i_idxprom29_gemm_nn9w_sel_x_b(17 downto 0);
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_bs1_merged_bit_select_c <= i_idxprom29_gemm_nn9w_sel_x_b(63 downto 54);
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_bs1_merged_bit_select_d <= i_idxprom29_gemm_nn9w_sel_x_b(35 downto 18);
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_bs1_merged_bit_select_e <= i_idxprom29_gemm_nn9w_sel_x_b(53 downto 36);

    -- i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im3_shift0(BITSHIFT,132)@3
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im3_shift0_qint <= i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_bs1_merged_bit_select_c & "0";
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im3_shift0_q <= i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im3_shift0_qint(10 downto 0);

    -- i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_align_15(BITSHIFT,107)@3
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im3_shift0_q) & "0000000000000000";
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_align_15_q <= i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im6_shift0(BITSHIFT,133)@3
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im6_shift0_qint <= i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_bs1_merged_bit_select_d & "0";
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im6_shift0_q <= i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im6_shift0_qint(18 downto 0);

    -- i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_align_14(BITSHIFT,106)@3
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_align_14_q <= i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_align_14_qint(37 downto 0);

    -- i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_join_16(BITJOIN,108)@3
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_join_16_q <= i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_align_15_q & i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_align_14_q;

    -- i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im9_shift0(BITSHIFT,134)@3
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im9_shift0_qint <= i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_bs1_merged_bit_select_e & "0";
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im9_shift0_q <= i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im9_shift0_qint(18 downto 0);

    -- i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_align_12(BITSHIFT,104)@3
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im9_shift0_q) & "0000000000000000";
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_align_12_q <= i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im0_shift0(BITSHIFT,131)@3
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im0_shift0_qint <= i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_bs1_merged_bit_select_b & "0";
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im0_shift0_q <= i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im0_shift0_qint(18 downto 0);

    -- i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_join_13(BITJOIN,105)@3
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_join_13_q <= i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_im0_shift0_q);

    -- i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_result_add_0_0(ADD,109)@3
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_join_13_q);
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_join_16_q);
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_result_add_0_0_b));
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_result_add_0_0_q <= i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_result_add_0_0_o(66 downto 0);

    -- i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_extender_x(BITJOIN,32)@3
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_extender_x_q <= i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_multconst_x_q & i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_x_result_add_0_0_q(65 downto 0);

    -- i_arrayidx30_gemm_nn9w_gemm_nn9w164_trunc_sel_x(BITSELECT,34)@3
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_trunc_sel_x_b <= i_arrayidx30_gemm_nn9w_gemm_nn9w164_mult_extender_x_q(63 downto 0);

    -- redist25_i_arrayidx30_gemm_nn9w_gemm_nn9w164_trunc_sel_x_b_1(DELAY,165)
    redist25_i_arrayidx30_gemm_nn9w_gemm_nn9w164_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_arrayidx30_gemm_nn9w_gemm_nn9w164_trunc_sel_x_b, xout => redist25_i_arrayidx30_gemm_nn9w_gemm_nn9w164_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_c_sync_buffer_gemm_nn9w(BLACKBOX,80)@0
    -- in in_i_dependence@4
    -- in in_valid_in@4
    -- out out_buffer_out@4
    -- out out_valid_out@4
    thei_syncbuf_c_sync_buffer_gemm_nn9w : i_syncbuf_c_sync_buffer_gemm_nn9w162
    PORT MAP (
        in_buffer_in => in_C,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist24_sync_in_aunroll_x_in_i_valid_3_q,
        out_buffer_out => i_syncbuf_c_sync_buffer_gemm_nn9w_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_arrayidx30_gemm_nn9w_gemm_nn9w164_add_x(ADD,35)@4
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_c_sync_buffer_gemm_nn9w_out_buffer_out);
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_add_x_b <= STD_LOGIC_VECTOR("0" & redist25_i_arrayidx30_gemm_nn9w_gemm_nn9w164_trunc_sel_x_b_1_q);
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx30_gemm_nn9w_gemm_nn9w164_add_x_a) + UNSIGNED(i_arrayidx30_gemm_nn9w_gemm_nn9w164_add_x_b));
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_add_x_q <= i_arrayidx30_gemm_nn9w_gemm_nn9w164_add_x_o(64 downto 0);

    -- i_arrayidx30_gemm_nn9w_gemm_nn9w164_dupName_0_trunc_sel_x(BITSELECT,29)@4
    i_arrayidx30_gemm_nn9w_gemm_nn9w164_dupName_0_trunc_sel_x_b <= i_arrayidx30_gemm_nn9w_gemm_nn9w164_add_x_q(63 downto 0);

    -- redist8_i_acl_pop_i32_mul27315_pop24_gemm_nn9w_out_data_out_3(DELAY,148)
    redist8_i_acl_pop_i32_mul27315_pop24_gemm_nn9w_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist7_i_acl_pop_i32_mul27315_pop24_gemm_nn9w_out_data_out_1_q, xout => redist8_i_acl_pop_i32_mul27315_pop24_gemm_nn9w_out_data_out_3_q, clk => clock, aclr => resetn );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,41)@4
    out_c0_exi13377_0 <= GND_q;
    out_c0_exi13377_1 <= redist8_i_acl_pop_i32_mul27315_pop24_gemm_nn9w_out_data_out_3_q;
    out_c0_exi13377_2 <= i_arrayidx30_gemm_nn9w_gemm_nn9w164_dupName_0_trunc_sel_x_b;
    out_c0_exi13377_3 <= redist18_i_acl_pop_i1_memdep_phi277_pop16317_pop25_gemm_nn9w_out_data_out_3_q;
    out_c0_exi13377_4 <= redist12_i_acl_pop_i32_div1_rm307_pop20_gemm_nn9w_out_data_out_3_q;
    out_c0_exi13377_5 <= bgTrunc_i_mul36_gemm_nn9w_sel_x_b;
    out_c0_exi13377_6 <= redist20_i_acl_pop_i1_cmp75_rm309_pop21_gemm_nn9w_out_data_out_3_q;
    out_c0_exi13377_7 <= redist3_i_phi_decision139_xor_rm65_gemm_nn9w_q_3_q;
    out_c0_exi13377_8 <= i_unnamed_gemm_nn9w178_q;
    out_c0_exi13377_9 <= redist5_i_notexit296_gemm_nn9w_q_3_q;
    out_c0_exi13377_10 <= redist14_i_acl_pop_i1_pop18_gemm_nn9w_out_data_out_3_q;
    out_c0_exi13377_11 <= redist16_i_acl_pop_i1_notexit300305_pop19_gemm_nn9w_out_data_out_3_q;
    out_c0_exi13377_12 <= redist22_i_acl_pop_i1_cmp367_rm311_pop22_gemm_nn9w_out_data_out_3_q;
    out_c0_exi13377_13 <= redist10_i_acl_pop_i32_div_rm313_pop23_gemm_nn9w_out_data_out_3_mem_q;
    out_o_valid <= redist24_sync_in_aunroll_x_in_i_valid_3_q;

    -- i_acl_push_i1_notexitcond295_gemm_nn9w(BLACKBOX,64)@1
    -- out out_feedback_out_6@20000000
    -- out out_feedback_valid_out_6@20000000
    thei_acl_push_i1_notexitcond295_gemm_nn9w : i_acl_push_i1_notexitcond295_gemm_nn9w189
    PORT MAP (
        in_data_in => i_notexit296_gemm_nn9w_q,
        in_feedback_stall_in_6 => i_acl_pipeline_keep_going294_gemm_nn9w_out_not_exitcond_stall_out,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_6 => i_acl_push_i1_notexitcond295_gemm_nn9w_out_feedback_out_6,
        out_feedback_valid_out_6 => i_acl_push_i1_notexitcond295_gemm_nn9w_out_feedback_valid_out_6,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going294_gemm_nn9w(BLACKBOX,50)@1
    -- out out_exiting_stall_out@20000000
    -- out out_exiting_valid_out@20000000
    -- out out_initeration_stall_out@20000000
    -- out out_not_exitcond_stall_out@20000000
    -- out out_pipeline_valid_out@20000000
    thei_acl_pipeline_keep_going294_gemm_nn9w : i_acl_pipeline_keep_going294_gemm_nn9w156
    PORT MAP (
        in_data_in => VCC_q,
        in_initeration_in => GND_q,
        in_initeration_valid_in => GND_q,
        in_not_exitcond_in => i_acl_push_i1_notexitcond295_gemm_nn9w_out_feedback_out_6,
        in_not_exitcond_valid_in => i_acl_push_i1_notexitcond295_gemm_nn9w_out_feedback_valid_out_6,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_exiting_stall_out => i_acl_pipeline_keep_going294_gemm_nn9w_out_exiting_stall_out,
        out_exiting_valid_out => i_acl_pipeline_keep_going294_gemm_nn9w_out_exiting_valid_out,
        out_not_exitcond_stall_out => i_acl_pipeline_keep_going294_gemm_nn9w_out_not_exitcond_stall_out,
        out_pipeline_valid_out => i_acl_pipeline_keep_going294_gemm_nn9w_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ext_sig_sync_out(GPOUT,49)
    out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_valid_out <= i_acl_pipeline_keep_going294_gemm_nn9w_out_exiting_valid_out;
    out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_stall_out <= i_acl_pipeline_keep_going294_gemm_nn9w_out_exiting_stall_out;

    -- pipeline_valid_out_sync(GPOUT,89)
    out_pipeline_valid_out <= i_acl_pipeline_keep_going294_gemm_nn9w_out_pipeline_valid_out;

END normal;
