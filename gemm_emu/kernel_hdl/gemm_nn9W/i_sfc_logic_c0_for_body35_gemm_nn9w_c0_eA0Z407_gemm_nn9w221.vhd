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

-- VHDL created from i_sfc_logic_c0_for_body35_gemm_nn9w_c0_enter407_gemm_nn9w221
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

entity i_sfc_logic_c0_for_body35_gemm_nn9w_c0_enter407_gemm_nn9w221 is
    port (
        in_A : in std_logic_vector(63 downto 0);  -- ufix64
        in_M : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni14_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni14_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni14_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni14_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni14_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni14_5 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni14_6 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni14_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni14_8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni14_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni14_10 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni14_11 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni14_12 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni14_13 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni14_14 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11427_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11427_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi11427_2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi11427_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11427_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11427_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11427_6 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi11427_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11427_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11427_9 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi11427_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi11427_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going290_gemm_nn9w_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going290_gemm_nn9w_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_body35_gemm_nn9w_c0_enter407_gemm_nn9w221;

architecture normal of i_sfc_logic_c0_for_body35_gemm_nn9w_c0_enter407_gemm_nn9w221 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_pipeline_keep_going290_gemm_nn9w223 is
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


    component i_acl_pop_i1_cmp367_rm312_pop48_gemm_nn9w240 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_48 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_48 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_48 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_cmp75_rm310_pop47_gemm_nn9w237 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_47 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_47 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_47 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_notexit300306_pop45_gemm_nn9w267 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_45 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_45 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_45 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_phi_decision139_xor_rm65333_pop55_gemm_nn9w275 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_55 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_55 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_55 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_pop44_gemm_nn9w263 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_44 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_44 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_44 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_pop56_gemm_nn9w279 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_56 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_56 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_56 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_div_rm314_pop49_gemm_nn9w243 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_49 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_49 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_49 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_k_371_pop43_gemm_nn9w225 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_43 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_43 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_43 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_mul36332_pop54_gemm_nn9w227 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_54 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_54 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_54 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w259 is
        port (
            in_data_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_53 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_feedback_valid_in_53 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_feedback_stall_out_53 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w271 is
        port (
            in_data_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_52 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_feedback_valid_in_52 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_feedback_stall_out_52 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_cmp367_rm312_push48_gemm_nn9w251 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_48 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_48 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_48 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_cmp75_rm310_push47_gemm_nn9w253 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_47 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_47 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_47 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_notexit300306_push45_gemm_nn9w269 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_45 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_45 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_45 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_notexitcond291_gemm_nn9w257 is
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


    component i_acl_push_i1_phi_decision139_xor_rm65333_push55_gemm_nn9w277 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_55 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_55 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_55 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_push44_gemm_nn9w265 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_44 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_44 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_44 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_push56_gemm_nn9w281 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_56 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_56 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_56 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_div_rm314_push49_gemm_nn9w249 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_49 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_49 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_49 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_k_371_push43_gemm_nn9w255 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_43 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_43 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_43 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_mul36332_push54_gemm_nn9w247 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_54 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_54 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_54 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i64_conv31_hf_tofpc331_push53_gemm_nn9w261 is
        port (
            in_data_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_feedback_stall_in_53 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_feedback_out_53 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_feedback_valid_out_53 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_p1h_arrayidx30330_push52_gemm_nn9w273 is
        port (
            in_data_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_feedback_stall_in_52 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_feedback_out_52 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_feedback_valid_out_52 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_a_sync_buffer_gemm_nn9w231 is
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


    component i_syncbuf_m_sync_buffer280_gemm_nn9w234 is
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
    signal bgTrunc_i_add37_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add67_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_vscale_i31_add252_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_conv39_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_multconst_x_q : STD_LOGIC_VECTOR (61 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_3gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pipeline_keep_going290_gemm_nn9w_out_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going290_gemm_nn9w_out_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going290_gemm_nn9w_out_not_exitcond_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going290_gemm_nn9w_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_cmp367_rm312_pop48_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_cmp367_rm312_pop48_gemm_nn9w_out_feedback_stall_out_48 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_cmp75_rm310_pop47_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_cmp75_rm310_pop47_gemm_nn9w_out_feedback_stall_out_47 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_notexit300306_pop45_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_notexit300306_pop45_gemm_nn9w_out_feedback_stall_out_45 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_phi_decision139_xor_rm65333_pop55_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_phi_decision139_xor_rm65333_pop55_gemm_nn9w_out_feedback_stall_out_55 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_pop44_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_pop44_gemm_nn9w_out_feedback_stall_out_44 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_pop56_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_pop56_gemm_nn9w_out_feedback_stall_out_56 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_div_rm314_pop49_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_div_rm314_pop49_gemm_nn9w_out_feedback_stall_out_49 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_feedback_stall_out_43 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_mul36332_pop54_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_mul36332_pop54_gemm_nn9w_out_feedback_stall_out_54 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_feedback_stall_out_53 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_feedback_stall_out_52 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_cmp367_rm312_push48_gemm_nn9w_out_feedback_out_48 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_cmp367_rm312_push48_gemm_nn9w_out_feedback_valid_out_48 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_cmp75_rm310_push47_gemm_nn9w_out_feedback_out_47 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_cmp75_rm310_push47_gemm_nn9w_out_feedback_valid_out_47 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_notexit300306_push45_gemm_nn9w_out_feedback_out_45 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_notexit300306_push45_gemm_nn9w_out_feedback_valid_out_45 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_notexitcond291_gemm_nn9w_out_feedback_out_4 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_notexitcond291_gemm_nn9w_out_feedback_valid_out_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_phi_decision139_xor_rm65333_push55_gemm_nn9w_out_feedback_out_55 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_phi_decision139_xor_rm65333_push55_gemm_nn9w_out_feedback_valid_out_55 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_push44_gemm_nn9w_out_feedback_out_44 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_push44_gemm_nn9w_out_feedback_valid_out_44 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_push56_gemm_nn9w_out_feedback_out_56 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_push56_gemm_nn9w_out_feedback_valid_out_56 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_div_rm314_push49_gemm_nn9w_out_feedback_out_49 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_div_rm314_push49_gemm_nn9w_out_feedback_valid_out_49 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_k_371_push43_gemm_nn9w_out_feedback_out_43 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_k_371_push43_gemm_nn9w_out_feedback_valid_out_43 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_mul36332_push54_gemm_nn9w_out_feedback_out_54 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_mul36332_push54_gemm_nn9w_out_feedback_valid_out_54 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i64_conv31_hf_tofpc331_push53_gemm_nn9w_out_feedback_out_53 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_push_i64_conv31_hf_tofpc331_push53_gemm_nn9w_out_feedback_valid_out_53 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_p1h_arrayidx30330_push52_gemm_nn9w_out_feedback_out_52 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_push_p1h_arrayidx30330_push52_gemm_nn9w_out_feedback_valid_out_52 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add37_gemm_nn9w_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add37_gemm_nn9w_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add37_gemm_nn9w_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add37_gemm_nn9w_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add67_gemm_nn9w_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add67_gemm_nn9w_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add67_gemm_nn9w_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add67_gemm_nn9w_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_cmp2473_rm60_gemm_nn9w_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp2473_rm60_gemm_nn9w_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp2473_rm60_gemm_nn9w_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp2473_rm60_gemm_nn9w_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp33_gemm_nn9w_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp33_gemm_nn9w_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp33_gemm_nn9w_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp33_gemm_nn9w_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phi_decision147_xor_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_a_sync_buffer_gemm_nn9w_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_m_sync_buffer280_gemm_nn9w_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_gemm_nn9w229_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_unnamed_gemm_nn9w229_vt_select_63_b : STD_LOGIC_VECTOR (62 downto 0);
    signal i_unnamed_gemm_nn9w239_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gemm_nn9w242_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gemm_nn9w246_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vscale_i31_add252_gemm_nn9w_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_vscale_i31_add252_gemm_nn9w_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_vscale_i31_add252_gemm_nn9w_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_vscale_i31_add252_gemm_nn9w_q : STD_LOGIC_VECTOR (64 downto 0);
    signal leftShiftStage0Idx1Rng1_uid111_i_unnamed_gemm_nn9w230_shift_x_in : STD_LOGIC_VECTOR (62 downto 0);
    signal leftShiftStage0Idx1Rng1_uid111_i_unnamed_gemm_nn9w230_shift_x_b : STD_LOGIC_VECTOR (62 downto 0);
    signal leftShiftStage0Idx1_uid112_i_unnamed_gemm_nn9w230_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage0_uid114_i_unnamed_gemm_nn9w230_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid114_i_unnamed_gemm_nn9w230_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_join_13_q : STD_LOGIC_VECTOR (55 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_align_14_q : STD_LOGIC_VECTOR (37 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_align_14_qint : STD_LOGIC_VECTOR (37 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_join_16_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (66 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (10 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_unnamed_gemm_nn9w246_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_unnamed_gemm_nn9w242_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_data_out_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_data_out_4_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_i_acl_pop_i32_mul36332_pop54_gemm_nn9w_out_data_out_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_i_acl_pop_i32_mul36332_pop54_gemm_nn9w_out_data_out_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_data_out_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_data_out_4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist9_i_acl_pop_i32_div_rm314_pop49_gemm_nn9w_out_data_out_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_i_acl_pop_i32_div_rm314_pop49_gemm_nn9w_out_data_out_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_i_acl_pop_i1_pop56_gemm_nn9w_out_data_out_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_acl_pop_i1_pop44_gemm_nn9w_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_acl_pop_i1_pop44_gemm_nn9w_out_data_out_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_acl_pop_i1_phi_decision139_xor_rm65333_pop55_gemm_nn9w_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_acl_pop_i1_phi_decision139_xor_rm65333_pop55_gemm_nn9w_out_data_out_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_i_acl_pop_i1_notexit300306_pop45_gemm_nn9w_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_i_acl_pop_i1_notexit300306_pop45_gemm_nn9w_out_data_out_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_i_acl_pop_i1_cmp75_rm310_pop47_gemm_nn9w_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_i_acl_pop_i1_cmp367_rm312_pop48_gemm_nn9w_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_sync_in_aunroll_x_in_i_valid_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_sync_in_aunroll_x_in_i_valid_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_sync_in_aunroll_x_in_i_valid_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist24_bgTrunc_i_vscale_i31_add252_gemm_nn9w_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist25_bgTrunc_i_add67_gemm_nn9w_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_bgTrunc_i_add67_gemm_nn9w_sel_x_b_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_bgTrunc_i_add37_gemm_nn9w_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_inputreg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_mem_reset0 : std_logic;
    signal redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_mem_ia : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_mem_iq : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_mem_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_rdcnt_i : signal is true;
    signal redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_sticky_ena_q : signal is true;
    signal redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_data_out_3_inputreg_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist8_i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_data_out_4_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist20_sync_in_aunroll_x_in_i_valid_2(DELAY,162)
    redist20_sync_in_aunroll_x_in_i_valid_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist20_sync_in_aunroll_x_in_i_valid_2_q, clk => clock, aclr => resetn );

    -- redist21_sync_in_aunroll_x_in_i_valid_3(DELAY,163)
    redist21_sync_in_aunroll_x_in_i_valid_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist20_sync_in_aunroll_x_in_i_valid_2_q, xout => redist21_sync_in_aunroll_x_in_i_valid_3_q, clk => clock, aclr => resetn );

    -- redist22_sync_in_aunroll_x_in_i_valid_4(DELAY,164)
    redist22_sync_in_aunroll_x_in_i_valid_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist21_sync_in_aunroll_x_in_i_valid_3_q, xout => redist22_sync_in_aunroll_x_in_i_valid_4_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_push56_gemm_nn9w(BLACKBOX,76)@5
    -- out out_feedback_out_56@20000000
    -- out out_feedback_valid_out_56@20000000
    thei_acl_push_i1_push56_gemm_nn9w : i_acl_push_i1_push56_gemm_nn9w281
    PORT MAP (
        in_data_in => redist11_i_acl_pop_i1_pop56_gemm_nn9w_out_data_out_4_q,
        in_feedback_stall_in_56 => i_acl_pop_i1_pop56_gemm_nn9w_out_feedback_stall_out_56,
        in_stall_in => GND_q,
        in_unnamed_gemm_nn9W5 => redist0_i_unnamed_gemm_nn9w246_q_1_q,
        in_valid_in => redist22_sync_in_aunroll_x_in_i_valid_4_q,
        out_feedback_out_56 => i_acl_push_i1_push56_gemm_nn9w_out_feedback_out_56,
        out_feedback_valid_out_56 => i_acl_push_i1_push56_gemm_nn9w_out_feedback_valid_out_56,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_pop56_gemm_nn9w(BLACKBOX,64)@1
    -- out out_feedback_stall_out_56@20000000
    thei_acl_pop_i1_pop56_gemm_nn9w : i_acl_pop_i1_pop56_gemm_nn9w279
    PORT MAP (
        in_data_in => in_c0_eni14_14,
        in_dir => in_c0_eni14_1,
        in_feedback_in_56 => i_acl_push_i1_push56_gemm_nn9w_out_feedback_out_56,
        in_feedback_valid_in_56 => i_acl_push_i1_push56_gemm_nn9w_out_feedback_valid_out_56,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_pop56_gemm_nn9w_out_data_out,
        out_feedback_stall_out_56 => i_acl_pop_i1_pop56_gemm_nn9w_out_feedback_stall_out_56,
        clock => clock,
        resetn => resetn
    );

    -- redist11_i_acl_pop_i1_pop56_gemm_nn9w_out_data_out_4(DELAY,153)
    redist11_i_acl_pop_i1_pop56_gemm_nn9w_out_data_out_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_pop56_gemm_nn9w_out_data_out, xout => redist11_i_acl_pop_i1_pop56_gemm_nn9w_out_data_out_4_q, clk => clock, aclr => resetn );

    -- redist10_i_acl_pop_i32_div_rm314_pop49_gemm_nn9w_out_data_out_3(DELAY,152)
    redist10_i_acl_pop_i32_div_rm314_pop49_gemm_nn9w_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist9_i_acl_pop_i32_div_rm314_pop49_gemm_nn9w_out_data_out_2_q, xout => redist10_i_acl_pop_i32_div_rm314_pop49_gemm_nn9w_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_acl_push_i32_div_rm314_push49_gemm_nn9w(BLACKBOX,77)@4
    -- out out_feedback_out_49@20000000
    -- out out_feedback_valid_out_49@20000000
    thei_acl_push_i32_div_rm314_push49_gemm_nn9w : i_acl_push_i32_div_rm314_push49_gemm_nn9w249
    PORT MAP (
        in_data_in => redist10_i_acl_pop_i32_div_rm314_pop49_gemm_nn9w_out_data_out_3_q,
        in_feedback_stall_in_49 => i_acl_pop_i32_div_rm314_pop49_gemm_nn9w_out_feedback_stall_out_49,
        in_stall_in => GND_q,
        in_unnamed_gemm_nn9W5 => i_unnamed_gemm_nn9w246_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_49 => i_acl_push_i32_div_rm314_push49_gemm_nn9w_out_feedback_out_49,
        out_feedback_valid_out_49 => i_acl_push_i32_div_rm314_push49_gemm_nn9w_out_feedback_valid_out_49,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i32_div_rm314_pop49_gemm_nn9w(BLACKBOX,65)@1
    -- out out_feedback_stall_out_49@20000000
    thei_acl_pop_i32_div_rm314_pop49_gemm_nn9w : i_acl_pop_i32_div_rm314_pop49_gemm_nn9w243
    PORT MAP (
        in_data_in => in_c0_eni14_5,
        in_dir => in_c0_eni14_1,
        in_feedback_in_49 => i_acl_push_i32_div_rm314_push49_gemm_nn9w_out_feedback_out_49,
        in_feedback_valid_in_49 => i_acl_push_i32_div_rm314_push49_gemm_nn9w_out_feedback_valid_out_49,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_div_rm314_pop49_gemm_nn9w_out_data_out,
        out_feedback_stall_out_49 => i_acl_pop_i32_div_rm314_pop49_gemm_nn9w_out_feedback_stall_out_49,
        clock => clock,
        resetn => resetn
    );

    -- redist9_i_acl_pop_i32_div_rm314_pop49_gemm_nn9w_out_data_out_2(DELAY,151)
    redist9_i_acl_pop_i32_div_rm314_pop49_gemm_nn9w_out_data_out_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i32_div_rm314_pop49_gemm_nn9w_out_data_out, xout => redist9_i_acl_pop_i32_div_rm314_pop49_gemm_nn9w_out_data_out_2_q, clk => clock, aclr => resetn );

    -- c_i32_3gr(CONSTANT,55)
    c_i32_3gr_q <= "00000000000000000000000000000011";

    -- redist26_bgTrunc_i_add67_gemm_nn9w_sel_x_b_2(DELAY,168)
    redist26_bgTrunc_i_add67_gemm_nn9w_sel_x_b_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist25_bgTrunc_i_add67_gemm_nn9w_sel_x_b_1_q, xout => redist26_bgTrunc_i_add67_gemm_nn9w_sel_x_b_2_q, clk => clock, aclr => resetn );

    -- i_acl_push_i32_k_371_push43_gemm_nn9w(BLACKBOX,78)@4
    -- out out_feedback_out_43@20000000
    -- out out_feedback_valid_out_43@20000000
    thei_acl_push_i32_k_371_push43_gemm_nn9w : i_acl_push_i32_k_371_push43_gemm_nn9w255
    PORT MAP (
        in_data_in => redist26_bgTrunc_i_add67_gemm_nn9w_sel_x_b_2_q,
        in_feedback_stall_in_43 => i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_feedback_stall_out_43,
        in_stall_in => GND_q,
        in_unnamed_gemm_nn9W5 => i_unnamed_gemm_nn9w246_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_43 => i_acl_push_i32_k_371_push43_gemm_nn9w_out_feedback_out_43,
        out_feedback_valid_out_43 => i_acl_push_i32_k_371_push43_gemm_nn9w_out_feedback_valid_out_43,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_0gr(CONSTANT,54)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- i_acl_pop_i32_k_371_pop43_gemm_nn9w(BLACKBOX,66)@1
    -- out out_feedback_stall_out_43@20000000
    thei_acl_pop_i32_k_371_pop43_gemm_nn9w : i_acl_pop_i32_k_371_pop43_gemm_nn9w225
    PORT MAP (
        in_data_in => c_i32_0gr_q,
        in_dir => in_c0_eni14_1,
        in_feedback_in_43 => i_acl_push_i32_k_371_push43_gemm_nn9w_out_feedback_out_43,
        in_feedback_valid_in_43 => i_acl_push_i32_k_371_push43_gemm_nn9w_out_feedback_valid_out_43,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_data_out,
        out_feedback_stall_out_43 => i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_feedback_stall_out_43,
        clock => clock,
        resetn => resetn
    );

    -- redist7_i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_data_out_1(DELAY,149)
    redist7_i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_data_out, xout => redist7_i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_data_out_1_q, clk => clock, aclr => resetn );

    -- i_add67_gemm_nn9w(ADD,83)@2
    i_add67_gemm_nn9w_a <= STD_LOGIC_VECTOR("0" & redist7_i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_data_out_1_q);
    i_add67_gemm_nn9w_b <= STD_LOGIC_VECTOR("0" & c_i32_3gr_q);
    i_add67_gemm_nn9w_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add67_gemm_nn9w_a) + UNSIGNED(i_add67_gemm_nn9w_b));
    i_add67_gemm_nn9w_q <= i_add67_gemm_nn9w_o(32 downto 0);

    -- bgTrunc_i_add67_gemm_nn9w_sel_x(BITSELECT,3)@2
    bgTrunc_i_add67_gemm_nn9w_sel_x_b <= i_add67_gemm_nn9w_q(31 downto 0);

    -- redist25_bgTrunc_i_add67_gemm_nn9w_sel_x_b_1(DELAY,167)
    redist25_bgTrunc_i_add67_gemm_nn9w_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add67_gemm_nn9w_sel_x_b, xout => redist25_bgTrunc_i_add67_gemm_nn9w_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_cmp33_gemm_nn9w(COMPARE,85)@3 + 1
    i_cmp33_gemm_nn9w_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist25_bgTrunc_i_add67_gemm_nn9w_sel_x_b_1_q(31)) & redist25_bgTrunc_i_add67_gemm_nn9w_sel_x_b_1_q));
    i_cmp33_gemm_nn9w_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist9_i_acl_pop_i32_div_rm314_pop49_gemm_nn9w_out_data_out_2_q(31)) & redist9_i_acl_pop_i32_div_rm314_pop49_gemm_nn9w_out_data_out_2_q));
    i_cmp33_gemm_nn9w_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp33_gemm_nn9w_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp33_gemm_nn9w_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp33_gemm_nn9w_a) - SIGNED(i_cmp33_gemm_nn9w_b));
        END IF;
    END PROCESS;
    i_cmp33_gemm_nn9w_c(0) <= i_cmp33_gemm_nn9w_o(33);

    -- i_acl_push_i1_cmp367_rm312_push48_gemm_nn9w(BLACKBOX,70)@4
    -- out out_feedback_out_48@20000000
    -- out out_feedback_valid_out_48@20000000
    thei_acl_push_i1_cmp367_rm312_push48_gemm_nn9w : i_acl_push_i1_cmp367_rm312_push48_gemm_nn9w251
    PORT MAP (
        in_data_in => redist19_i_acl_pop_i1_cmp367_rm312_pop48_gemm_nn9w_out_data_out_3_q,
        in_feedback_stall_in_48 => i_acl_pop_i1_cmp367_rm312_pop48_gemm_nn9w_out_feedback_stall_out_48,
        in_stall_in => GND_q,
        in_unnamed_gemm_nn9W5 => i_unnamed_gemm_nn9w246_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_48 => i_acl_push_i1_cmp367_rm312_push48_gemm_nn9w_out_feedback_out_48,
        out_feedback_valid_out_48 => i_acl_push_i1_cmp367_rm312_push48_gemm_nn9w_out_feedback_valid_out_48,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_cmp367_rm312_pop48_gemm_nn9w(BLACKBOX,59)@1
    -- out out_feedback_stall_out_48@20000000
    thei_acl_pop_i1_cmp367_rm312_pop48_gemm_nn9w : i_acl_pop_i1_cmp367_rm312_pop48_gemm_nn9w240
    PORT MAP (
        in_data_in => in_c0_eni14_4,
        in_dir => in_c0_eni14_1,
        in_feedback_in_48 => i_acl_push_i1_cmp367_rm312_push48_gemm_nn9w_out_feedback_out_48,
        in_feedback_valid_in_48 => i_acl_push_i1_cmp367_rm312_push48_gemm_nn9w_out_feedback_valid_out_48,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_cmp367_rm312_pop48_gemm_nn9w_out_data_out,
        out_feedback_stall_out_48 => i_acl_pop_i1_cmp367_rm312_pop48_gemm_nn9w_out_feedback_stall_out_48,
        clock => clock,
        resetn => resetn
    );

    -- redist19_i_acl_pop_i1_cmp367_rm312_pop48_gemm_nn9w_out_data_out_3(DELAY,161)
    redist19_i_acl_pop_i1_cmp367_rm312_pop48_gemm_nn9w_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_cmp367_rm312_pop48_gemm_nn9w_out_data_out, xout => redist19_i_acl_pop_i1_cmp367_rm312_pop48_gemm_nn9w_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_syncbuf_m_sync_buffer280_gemm_nn9w(BLACKBOX,91)@0
    -- in in_i_dependence@3
    -- in in_valid_in@3
    -- out out_buffer_out@3
    -- out out_valid_out@3
    thei_syncbuf_m_sync_buffer280_gemm_nn9w : i_syncbuf_m_sync_buffer280_gemm_nn9w234
    PORT MAP (
        in_buffer_in => in_M,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist20_sync_in_aunroll_x_in_i_valid_2_q,
        out_buffer_out => i_syncbuf_m_sync_buffer280_gemm_nn9w_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_cmp2473_rm60_gemm_nn9w(COMPARE,84)@3 + 1
    i_cmp2473_rm60_gemm_nn9w_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_0gr_q(31)) & c_i32_0gr_q));
    i_cmp2473_rm60_gemm_nn9w_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_m_sync_buffer280_gemm_nn9w_out_buffer_out(31)) & i_syncbuf_m_sync_buffer280_gemm_nn9w_out_buffer_out));
    i_cmp2473_rm60_gemm_nn9w_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp2473_rm60_gemm_nn9w_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp2473_rm60_gemm_nn9w_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp2473_rm60_gemm_nn9w_a) - SIGNED(i_cmp2473_rm60_gemm_nn9w_b));
        END IF;
    END PROCESS;
    i_cmp2473_rm60_gemm_nn9w_c(0) <= i_cmp2473_rm60_gemm_nn9w_o(33);

    -- i_acl_push_i1_cmp75_rm310_push47_gemm_nn9w(BLACKBOX,71)@4
    -- out out_feedback_out_47@20000000
    -- out out_feedback_valid_out_47@20000000
    thei_acl_push_i1_cmp75_rm310_push47_gemm_nn9w : i_acl_push_i1_cmp75_rm310_push47_gemm_nn9w253
    PORT MAP (
        in_data_in => redist18_i_acl_pop_i1_cmp75_rm310_pop47_gemm_nn9w_out_data_out_3_q,
        in_feedback_stall_in_47 => i_acl_pop_i1_cmp75_rm310_pop47_gemm_nn9w_out_feedback_stall_out_47,
        in_stall_in => GND_q,
        in_unnamed_gemm_nn9W5 => i_unnamed_gemm_nn9w246_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_47 => i_acl_push_i1_cmp75_rm310_push47_gemm_nn9w_out_feedback_out_47,
        out_feedback_valid_out_47 => i_acl_push_i1_cmp75_rm310_push47_gemm_nn9w_out_feedback_valid_out_47,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_cmp75_rm310_pop47_gemm_nn9w(BLACKBOX,60)@1
    -- out out_feedback_stall_out_47@20000000
    thei_acl_pop_i1_cmp75_rm310_pop47_gemm_nn9w : i_acl_pop_i1_cmp75_rm310_pop47_gemm_nn9w237
    PORT MAP (
        in_data_in => in_c0_eni14_3,
        in_dir => in_c0_eni14_1,
        in_feedback_in_47 => i_acl_push_i1_cmp75_rm310_push47_gemm_nn9w_out_feedback_out_47,
        in_feedback_valid_in_47 => i_acl_push_i1_cmp75_rm310_push47_gemm_nn9w_out_feedback_valid_out_47,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_cmp75_rm310_pop47_gemm_nn9w_out_data_out,
        out_feedback_stall_out_47 => i_acl_pop_i1_cmp75_rm310_pop47_gemm_nn9w_out_feedback_stall_out_47,
        clock => clock,
        resetn => resetn
    );

    -- redist18_i_acl_pop_i1_cmp75_rm310_pop47_gemm_nn9w_out_data_out_3(DELAY,160)
    redist18_i_acl_pop_i1_cmp75_rm310_pop47_gemm_nn9w_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_cmp75_rm310_pop47_gemm_nn9w_out_data_out, xout => redist18_i_acl_pop_i1_cmp75_rm310_pop47_gemm_nn9w_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_unnamed_gemm_nn9w239(LOGICAL,95)@4
    i_unnamed_gemm_nn9w239_q <= redist18_i_acl_pop_i1_cmp75_rm310_pop47_gemm_nn9w_out_data_out_3_q and i_cmp2473_rm60_gemm_nn9w_c;

    -- i_unnamed_gemm_nn9w242(LOGICAL,96)@4
    i_unnamed_gemm_nn9w242_q <= i_unnamed_gemm_nn9w239_q and redist19_i_acl_pop_i1_cmp367_rm312_pop48_gemm_nn9w_out_data_out_3_q;

    -- i_unnamed_gemm_nn9w246(LOGICAL,97)@4
    i_unnamed_gemm_nn9w246_q <= i_unnamed_gemm_nn9w242_q and i_cmp33_gemm_nn9w_c;

    -- i_acl_push_i1_phi_decision139_xor_rm65333_push55_gemm_nn9w(BLACKBOX,74)@4
    -- out out_feedback_out_55@20000000
    -- out out_feedback_valid_out_55@20000000
    thei_acl_push_i1_phi_decision139_xor_rm65333_push55_gemm_nn9w : i_acl_push_i1_phi_decision139_xor_rm65333_push55_gemm_nn9w277
    PORT MAP (
        in_data_in => redist14_i_acl_pop_i1_phi_decision139_xor_rm65333_pop55_gemm_nn9w_out_data_out_3_q,
        in_feedback_stall_in_55 => i_acl_pop_i1_phi_decision139_xor_rm65333_pop55_gemm_nn9w_out_feedback_stall_out_55,
        in_stall_in => GND_q,
        in_unnamed_gemm_nn9W5 => i_unnamed_gemm_nn9w246_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_55 => i_acl_push_i1_phi_decision139_xor_rm65333_push55_gemm_nn9w_out_feedback_out_55,
        out_feedback_valid_out_55 => i_acl_push_i1_phi_decision139_xor_rm65333_push55_gemm_nn9w_out_feedback_valid_out_55,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_phi_decision139_xor_rm65333_pop55_gemm_nn9w(BLACKBOX,62)@1
    -- out out_feedback_stall_out_55@20000000
    thei_acl_pop_i1_phi_decision139_xor_rm65333_pop55_gemm_nn9w : i_acl_pop_i1_phi_decision139_xor_rm65333_pop55_gemm_nn9w275
    PORT MAP (
        in_data_in => in_c0_eni14_13,
        in_dir => in_c0_eni14_1,
        in_feedback_in_55 => i_acl_push_i1_phi_decision139_xor_rm65333_push55_gemm_nn9w_out_feedback_out_55,
        in_feedback_valid_in_55 => i_acl_push_i1_phi_decision139_xor_rm65333_push55_gemm_nn9w_out_feedback_valid_out_55,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_phi_decision139_xor_rm65333_pop55_gemm_nn9w_out_data_out,
        out_feedback_stall_out_55 => i_acl_pop_i1_phi_decision139_xor_rm65333_pop55_gemm_nn9w_out_feedback_stall_out_55,
        clock => clock,
        resetn => resetn
    );

    -- redist14_i_acl_pop_i1_phi_decision139_xor_rm65333_pop55_gemm_nn9w_out_data_out_3(DELAY,156)
    redist14_i_acl_pop_i1_phi_decision139_xor_rm65333_pop55_gemm_nn9w_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_phi_decision139_xor_rm65333_pop55_gemm_nn9w_out_data_out, xout => redist14_i_acl_pop_i1_phi_decision139_xor_rm65333_pop55_gemm_nn9w_out_data_out_3_q, clk => clock, aclr => resetn );

    -- redist15_i_acl_pop_i1_phi_decision139_xor_rm65333_pop55_gemm_nn9w_out_data_out_4(DELAY,157)
    redist15_i_acl_pop_i1_phi_decision139_xor_rm65333_pop55_gemm_nn9w_out_data_out_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist14_i_acl_pop_i1_phi_decision139_xor_rm65333_pop55_gemm_nn9w_out_data_out_3_q, xout => redist15_i_acl_pop_i1_phi_decision139_xor_rm65333_pop55_gemm_nn9w_out_data_out_4_q, clk => clock, aclr => resetn );

    -- redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_notEnable(LOGICAL,175)
    redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_nor(LOGICAL,176)
    redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_nor_q <= not (redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_notEnable_q or redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_sticky_ena_q);

    -- redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_cmpReg(REG,174)
    redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_sticky_ena(REG,177)
    redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_nor_q = "1") THEN
                redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_sticky_ena_q <= STD_LOGIC_VECTOR(redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_enaAnd(LOGICAL,178)
    redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_enaAnd_q <= redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_sticky_ena_q and VCC_q;

    -- redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_rdcnt(COUNTER,172)
    -- low=0, high=1, step=1, init=0
    redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_rdcnt_i <= redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_rdcnt_i, 1)));

    -- i_acl_push_p1h_arrayidx30330_push52_gemm_nn9w(BLACKBOX,81)@5
    -- out out_feedback_out_52@20000000
    -- out out_feedback_valid_out_52@20000000
    thei_acl_push_p1h_arrayidx30330_push52_gemm_nn9w : i_acl_push_p1h_arrayidx30330_push52_gemm_nn9w273
    PORT MAP (
        in_data_in => redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_mem_q,
        in_feedback_stall_in_52 => i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_feedback_stall_out_52,
        in_stall_in => GND_q,
        in_unnamed_gemm_nn9W5 => redist0_i_unnamed_gemm_nn9w246_q_1_q,
        in_valid_in => redist22_sync_in_aunroll_x_in_i_valid_4_q,
        out_feedback_out_52 => i_acl_push_p1h_arrayidx30330_push52_gemm_nn9w_out_feedback_out_52,
        out_feedback_valid_out_52 => i_acl_push_p1h_arrayidx30330_push52_gemm_nn9w_out_feedback_valid_out_52,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w(BLACKBOX,69)@1
    -- out out_feedback_stall_out_52@20000000
    thei_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w : i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w271
    PORT MAP (
        in_data_in => in_c0_eni14_12,
        in_dir => in_c0_eni14_1,
        in_feedback_in_52 => i_acl_push_p1h_arrayidx30330_push52_gemm_nn9w_out_feedback_out_52,
        in_feedback_valid_in_52 => i_acl_push_p1h_arrayidx30330_push52_gemm_nn9w_out_feedback_valid_out_52,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out,
        out_feedback_stall_out_52 => i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_feedback_stall_out_52,
        clock => clock,
        resetn => resetn
    );

    -- redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_inputreg(DELAY,170)
    redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_inputreg : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out, xout => redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_inputreg_q, clk => clock, aclr => resetn );

    -- redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_wraddr(REG,173)
    redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_wraddr_q <= "1";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_wraddr_q <= STD_LOGIC_VECTOR(redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_mem(DUALMEM,171)
    redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_mem_ia <= STD_LOGIC_VECTOR(redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_inputreg_q);
    redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_mem_aa <= redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_wraddr_q;
    redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_mem_ab <= redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_rdcnt_q;
    redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_mem_reset0 <= not (resetn);
    redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 64,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 64,
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
        clocken1 => redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_mem_reset0,
        clock1 => clock,
        address_a => redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_mem_aa,
        data_a => redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_mem_ab,
        q_b => redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_mem_iq
    );
    redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_mem_q <= redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_mem_iq(63 downto 0);

    -- i_acl_push_i1_notexit300306_push45_gemm_nn9w(BLACKBOX,72)@4
    -- out out_feedback_out_45@20000000
    -- out out_feedback_valid_out_45@20000000
    thei_acl_push_i1_notexit300306_push45_gemm_nn9w : i_acl_push_i1_notexit300306_push45_gemm_nn9w269
    PORT MAP (
        in_data_in => redist16_i_acl_pop_i1_notexit300306_pop45_gemm_nn9w_out_data_out_3_q,
        in_feedback_stall_in_45 => i_acl_pop_i1_notexit300306_pop45_gemm_nn9w_out_feedback_stall_out_45,
        in_stall_in => GND_q,
        in_unnamed_gemm_nn9W5 => i_unnamed_gemm_nn9w246_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_45 => i_acl_push_i1_notexit300306_push45_gemm_nn9w_out_feedback_out_45,
        out_feedback_valid_out_45 => i_acl_push_i1_notexit300306_push45_gemm_nn9w_out_feedback_valid_out_45,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_notexit300306_pop45_gemm_nn9w(BLACKBOX,61)@1
    -- out out_feedback_stall_out_45@20000000
    thei_acl_pop_i1_notexit300306_pop45_gemm_nn9w : i_acl_pop_i1_notexit300306_pop45_gemm_nn9w267
    PORT MAP (
        in_data_in => in_c0_eni14_8,
        in_dir => in_c0_eni14_1,
        in_feedback_in_45 => i_acl_push_i1_notexit300306_push45_gemm_nn9w_out_feedback_out_45,
        in_feedback_valid_in_45 => i_acl_push_i1_notexit300306_push45_gemm_nn9w_out_feedback_valid_out_45,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_notexit300306_pop45_gemm_nn9w_out_data_out,
        out_feedback_stall_out_45 => i_acl_pop_i1_notexit300306_pop45_gemm_nn9w_out_feedback_stall_out_45,
        clock => clock,
        resetn => resetn
    );

    -- redist16_i_acl_pop_i1_notexit300306_pop45_gemm_nn9w_out_data_out_3(DELAY,158)
    redist16_i_acl_pop_i1_notexit300306_pop45_gemm_nn9w_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_notexit300306_pop45_gemm_nn9w_out_data_out, xout => redist16_i_acl_pop_i1_notexit300306_pop45_gemm_nn9w_out_data_out_3_q, clk => clock, aclr => resetn );

    -- redist17_i_acl_pop_i1_notexit300306_pop45_gemm_nn9w_out_data_out_4(DELAY,159)
    redist17_i_acl_pop_i1_notexit300306_pop45_gemm_nn9w_out_data_out_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist16_i_acl_pop_i1_notexit300306_pop45_gemm_nn9w_out_data_out_3_q, xout => redist17_i_acl_pop_i1_notexit300306_pop45_gemm_nn9w_out_data_out_4_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_push44_gemm_nn9w(BLACKBOX,75)@4
    -- out out_feedback_out_44@20000000
    -- out out_feedback_valid_out_44@20000000
    thei_acl_push_i1_push44_gemm_nn9w : i_acl_push_i1_push44_gemm_nn9w265
    PORT MAP (
        in_data_in => redist12_i_acl_pop_i1_pop44_gemm_nn9w_out_data_out_3_q,
        in_feedback_stall_in_44 => i_acl_pop_i1_pop44_gemm_nn9w_out_feedback_stall_out_44,
        in_stall_in => GND_q,
        in_unnamed_gemm_nn9W5 => i_unnamed_gemm_nn9w246_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_44 => i_acl_push_i1_push44_gemm_nn9w_out_feedback_out_44,
        out_feedback_valid_out_44 => i_acl_push_i1_push44_gemm_nn9w_out_feedback_valid_out_44,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_pop44_gemm_nn9w(BLACKBOX,63)@1
    -- out out_feedback_stall_out_44@20000000
    thei_acl_pop_i1_pop44_gemm_nn9w : i_acl_pop_i1_pop44_gemm_nn9w263
    PORT MAP (
        in_data_in => in_c0_eni14_7,
        in_dir => in_c0_eni14_1,
        in_feedback_in_44 => i_acl_push_i1_push44_gemm_nn9w_out_feedback_out_44,
        in_feedback_valid_in_44 => i_acl_push_i1_push44_gemm_nn9w_out_feedback_valid_out_44,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_pop44_gemm_nn9w_out_data_out,
        out_feedback_stall_out_44 => i_acl_pop_i1_pop44_gemm_nn9w_out_feedback_stall_out_44,
        clock => clock,
        resetn => resetn
    );

    -- redist12_i_acl_pop_i1_pop44_gemm_nn9w_out_data_out_3(DELAY,154)
    redist12_i_acl_pop_i1_pop44_gemm_nn9w_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_pop44_gemm_nn9w_out_data_out, xout => redist12_i_acl_pop_i1_pop44_gemm_nn9w_out_data_out_3_q, clk => clock, aclr => resetn );

    -- redist13_i_acl_pop_i1_pop44_gemm_nn9w_out_data_out_4(DELAY,155)
    redist13_i_acl_pop_i1_pop44_gemm_nn9w_out_data_out_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist12_i_acl_pop_i1_pop44_gemm_nn9w_out_data_out_3_q, xout => redist13_i_acl_pop_i1_pop44_gemm_nn9w_out_data_out_4_q, clk => clock, aclr => resetn );

    -- i_acl_push_i64_conv31_hf_tofpc331_push53_gemm_nn9w(BLACKBOX,80)@4
    -- out out_feedback_out_53@20000000
    -- out out_feedback_valid_out_53@20000000
    thei_acl_push_i64_conv31_hf_tofpc331_push53_gemm_nn9w : i_acl_push_i64_conv31_hf_tofpc331_push53_gemm_nn9w261
    PORT MAP (
        in_data_in => redist3_i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_data_out_3_q,
        in_feedback_stall_in_53 => i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_feedback_stall_out_53,
        in_stall_in => GND_q,
        in_unnamed_gemm_nn9W5 => i_unnamed_gemm_nn9w246_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_53 => i_acl_push_i64_conv31_hf_tofpc331_push53_gemm_nn9w_out_feedback_out_53,
        out_feedback_valid_out_53 => i_acl_push_i64_conv31_hf_tofpc331_push53_gemm_nn9w_out_feedback_valid_out_53,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w(BLACKBOX,68)@1
    -- out out_feedback_stall_out_53@20000000
    thei_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w : i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w259
    PORT MAP (
        in_data_in => in_c0_eni14_6,
        in_dir => in_c0_eni14_1,
        in_feedback_in_53 => i_acl_push_i64_conv31_hf_tofpc331_push53_gemm_nn9w_out_feedback_out_53,
        in_feedback_valid_in_53 => i_acl_push_i64_conv31_hf_tofpc331_push53_gemm_nn9w_out_feedback_valid_out_53,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_data_out,
        out_feedback_stall_out_53 => i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_feedback_stall_out_53,
        clock => clock,
        resetn => resetn
    );

    -- redist3_i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_data_out_3_inputreg(DELAY,179)
    redist3_i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_data_out_3_inputreg : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_data_out, xout => redist3_i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_data_out_3_inputreg_q, clk => clock, aclr => resetn );

    -- redist3_i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_data_out_3(DELAY,145)
    redist3_i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 64, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist3_i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_data_out_3_inputreg_q, xout => redist3_i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_data_out_3_q, clk => clock, aclr => resetn );

    -- redist4_i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_data_out_4(DELAY,146)
    redist4_i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_data_out_4 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist3_i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_data_out_3_q, xout => redist4_i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_data_out_4_q, clk => clock, aclr => resetn );

    -- redist0_i_unnamed_gemm_nn9w246_q_1(DELAY,142)
    redist0_i_unnamed_gemm_nn9w246_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gemm_nn9w246_q, xout => redist0_i_unnamed_gemm_nn9w246_q_1_q, clk => clock, aclr => resetn );

    -- i_phi_decision147_xor_rm_gemm_nn9w(LOGICAL,89)@5
    i_phi_decision147_xor_rm_gemm_nn9w_q <= redist1_i_unnamed_gemm_nn9w242_q_1_q xor VCC_q;

    -- redist1_i_unnamed_gemm_nn9w242_q_1(DELAY,143)
    redist1_i_unnamed_gemm_nn9w242_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gemm_nn9w242_q, xout => redist1_i_unnamed_gemm_nn9w242_q_1_q, clk => clock, aclr => resetn );

    -- i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_multconst_x(CONSTANT,41)
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_multconst_x_q <= "00000000000000000000000000000000000000000000000000000000000000";

    -- leftShiftStage0Idx1Rng1_uid111_i_unnamed_gemm_nn9w230_shift_x(BITSELECT,110)@3
    leftShiftStage0Idx1Rng1_uid111_i_unnamed_gemm_nn9w230_shift_x_in <= i_conv39_gemm_nn9w_sel_x_b(62 downto 0);
    leftShiftStage0Idx1Rng1_uid111_i_unnamed_gemm_nn9w230_shift_x_b <= leftShiftStage0Idx1Rng1_uid111_i_unnamed_gemm_nn9w230_shift_x_in(62 downto 0);

    -- leftShiftStage0Idx1_uid112_i_unnamed_gemm_nn9w230_shift_x(BITJOIN,111)@3
    leftShiftStage0Idx1_uid112_i_unnamed_gemm_nn9w230_shift_x_q <= leftShiftStage0Idx1Rng1_uid111_i_unnamed_gemm_nn9w230_shift_x_b & GND_q;

    -- leftShiftStage0_uid114_i_unnamed_gemm_nn9w230_shift_x(MUX,113)@3
    leftShiftStage0_uid114_i_unnamed_gemm_nn9w230_shift_x_s <= VCC_q;
    leftShiftStage0_uid114_i_unnamed_gemm_nn9w230_shift_x_combproc: PROCESS (leftShiftStage0_uid114_i_unnamed_gemm_nn9w230_shift_x_s, i_conv39_gemm_nn9w_sel_x_b, leftShiftStage0Idx1_uid112_i_unnamed_gemm_nn9w230_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid114_i_unnamed_gemm_nn9w230_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid114_i_unnamed_gemm_nn9w230_shift_x_q <= i_conv39_gemm_nn9w_sel_x_b;
            WHEN "1" => leftShiftStage0_uid114_i_unnamed_gemm_nn9w230_shift_x_q <= leftShiftStage0Idx1_uid112_i_unnamed_gemm_nn9w230_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid114_i_unnamed_gemm_nn9w230_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_unnamed_gemm_nn9w229_vt_select_63(BITSELECT,94)@3
    i_unnamed_gemm_nn9w229_vt_select_63_b <= leftShiftStage0_uid114_i_unnamed_gemm_nn9w230_shift_x_q(63 downto 1);

    -- i_unnamed_gemm_nn9w229_vt_join(BITJOIN,93)@3
    i_unnamed_gemm_nn9w229_vt_join_q <= i_unnamed_gemm_nn9w229_vt_select_63_b & GND_q;

    -- redist6_i_acl_pop_i32_mul36332_pop54_gemm_nn9w_out_data_out_3(DELAY,148)
    redist6_i_acl_pop_i32_mul36332_pop54_gemm_nn9w_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist5_i_acl_pop_i32_mul36332_pop54_gemm_nn9w_out_data_out_1_q, xout => redist6_i_acl_pop_i32_mul36332_pop54_gemm_nn9w_out_data_out_3_q, clk => clock, aclr => resetn );

    -- i_acl_push_i32_mul36332_push54_gemm_nn9w(BLACKBOX,79)@4
    -- out out_feedback_out_54@20000000
    -- out out_feedback_valid_out_54@20000000
    thei_acl_push_i32_mul36332_push54_gemm_nn9w : i_acl_push_i32_mul36332_push54_gemm_nn9w247
    PORT MAP (
        in_data_in => redist6_i_acl_pop_i32_mul36332_pop54_gemm_nn9w_out_data_out_3_q,
        in_feedback_stall_in_54 => i_acl_pop_i32_mul36332_pop54_gemm_nn9w_out_feedback_stall_out_54,
        in_stall_in => GND_q,
        in_unnamed_gemm_nn9W5 => i_unnamed_gemm_nn9w246_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_54 => i_acl_push_i32_mul36332_push54_gemm_nn9w_out_feedback_out_54,
        out_feedback_valid_out_54 => i_acl_push_i32_mul36332_push54_gemm_nn9w_out_feedback_valid_out_54,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i32_mul36332_pop54_gemm_nn9w(BLACKBOX,67)@1
    -- out out_feedback_stall_out_54@20000000
    thei_acl_pop_i32_mul36332_pop54_gemm_nn9w : i_acl_pop_i32_mul36332_pop54_gemm_nn9w227
    PORT MAP (
        in_data_in => in_c0_eni14_2,
        in_dir => in_c0_eni14_1,
        in_feedback_in_54 => i_acl_push_i32_mul36332_push54_gemm_nn9w_out_feedback_out_54,
        in_feedback_valid_in_54 => i_acl_push_i32_mul36332_push54_gemm_nn9w_out_feedback_valid_out_54,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_mul36332_pop54_gemm_nn9w_out_data_out,
        out_feedback_stall_out_54 => i_acl_pop_i32_mul36332_pop54_gemm_nn9w_out_feedback_stall_out_54,
        clock => clock,
        resetn => resetn
    );

    -- redist5_i_acl_pop_i32_mul36332_pop54_gemm_nn9w_out_data_out_1(DELAY,147)
    redist5_i_acl_pop_i32_mul36332_pop54_gemm_nn9w_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i32_mul36332_pop54_gemm_nn9w_out_data_out, xout => redist5_i_acl_pop_i32_mul36332_pop54_gemm_nn9w_out_data_out_1_q, clk => clock, aclr => resetn );

    -- i_add37_gemm_nn9w(ADD,82)@2
    i_add37_gemm_nn9w_a <= STD_LOGIC_VECTOR("0" & redist7_i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_data_out_1_q);
    i_add37_gemm_nn9w_b <= STD_LOGIC_VECTOR("0" & redist5_i_acl_pop_i32_mul36332_pop54_gemm_nn9w_out_data_out_1_q);
    i_add37_gemm_nn9w_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add37_gemm_nn9w_a) + UNSIGNED(i_add37_gemm_nn9w_b));
    i_add37_gemm_nn9w_q <= i_add37_gemm_nn9w_o(32 downto 0);

    -- bgTrunc_i_add37_gemm_nn9w_sel_x(BITSELECT,2)@2
    bgTrunc_i_add37_gemm_nn9w_sel_x_b <= i_add37_gemm_nn9w_q(31 downto 0);

    -- redist27_bgTrunc_i_add37_gemm_nn9w_sel_x_b_1(DELAY,169)
    redist27_bgTrunc_i_add37_gemm_nn9w_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add37_gemm_nn9w_sel_x_b, xout => redist27_bgTrunc_i_add37_gemm_nn9w_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_conv39_gemm_nn9w_sel_x(BITSELECT,32)@3
    i_conv39_gemm_nn9w_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist27_bgTrunc_i_add37_gemm_nn9w_sel_x_b_1_q(31 downto 0)), 64)));

    -- i_vscale_i31_add252_gemm_nn9w(ADD,98)@3
    i_vscale_i31_add252_gemm_nn9w_a <= STD_LOGIC_VECTOR("0" & i_conv39_gemm_nn9w_sel_x_b);
    i_vscale_i31_add252_gemm_nn9w_b <= STD_LOGIC_VECTOR("0" & i_unnamed_gemm_nn9w229_vt_join_q);
    i_vscale_i31_add252_gemm_nn9w_o <= STD_LOGIC_VECTOR(UNSIGNED(i_vscale_i31_add252_gemm_nn9w_a) + UNSIGNED(i_vscale_i31_add252_gemm_nn9w_b));
    i_vscale_i31_add252_gemm_nn9w_q <= i_vscale_i31_add252_gemm_nn9w_o(64 downto 0);

    -- bgTrunc_i_vscale_i31_add252_gemm_nn9w_sel_x(BITSELECT,4)@3
    bgTrunc_i_vscale_i31_add252_gemm_nn9w_sel_x_b <= i_vscale_i31_add252_gemm_nn9w_q(63 downto 0);

    -- redist24_bgTrunc_i_vscale_i31_add252_gemm_nn9w_sel_x_b_1(DELAY,166)
    redist24_bgTrunc_i_vscale_i31_add252_gemm_nn9w_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_vscale_i31_add252_gemm_nn9w_sel_x_b, xout => redist24_bgTrunc_i_vscale_i31_add252_gemm_nn9w_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_bs1_merged_bit_select(BITSELECT,141)@4
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_bs1_merged_bit_select_b <= redist24_bgTrunc_i_vscale_i31_add252_gemm_nn9w_sel_x_b_1_q(17 downto 0);
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_bs1_merged_bit_select_c <= redist24_bgTrunc_i_vscale_i31_add252_gemm_nn9w_sel_x_b_1_q(63 downto 54);
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_bs1_merged_bit_select_d <= redist24_bgTrunc_i_vscale_i31_add252_gemm_nn9w_sel_x_b_1_q(35 downto 18);
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_bs1_merged_bit_select_e <= redist24_bgTrunc_i_vscale_i31_add252_gemm_nn9w_sel_x_b_1_q(53 downto 36);

    -- i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im3_shift0(BITSHIFT,138)@4
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im3_shift0_qint <= i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_bs1_merged_bit_select_c & "0";
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im3_shift0_q <= i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im3_shift0_qint(10 downto 0);

    -- i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_align_15(BITSHIFT,130)@4
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im3_shift0_q) & "0000000000000000";
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_align_15_q <= i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_align_15_qint(27 downto 0);

    -- i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im6_shift0(BITSHIFT,139)@4
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im6_shift0_qint <= i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_bs1_merged_bit_select_d & "0";
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im6_shift0_q <= i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im6_shift0_qint(18 downto 0);

    -- i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_align_14(BITSHIFT,129)@4
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im6_shift0_q) & "000000000000000000";
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_align_14_q <= i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_align_14_qint(37 downto 0);

    -- i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_join_16(BITJOIN,131)@4
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_join_16_q <= i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_align_15_q & i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_align_14_q;

    -- i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im9_shift0(BITSHIFT,140)@4
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im9_shift0_qint <= i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_bs1_merged_bit_select_e & "0";
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im9_shift0_q <= i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im9_shift0_qint(18 downto 0);

    -- i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_align_12(BITSHIFT,127)@4
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im9_shift0_q) & "0000000000000000";
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_align_12_q <= i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_align_12_qint(35 downto 0);

    -- i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im0_shift0(BITSHIFT,137)@4
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im0_shift0_qint <= i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_bs1_merged_bit_select_b & "0";
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im0_shift0_q <= i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im0_shift0_qint(18 downto 0);

    -- i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_join_13(BITJOIN,128)@4
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_join_13_q <= i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_im0_shift0_q);

    -- i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_result_add_0_0(ADD,132)@4
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_join_13_q);
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_join_16_q);
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_result_add_0_0_a) + UNSIGNED(i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_result_add_0_0_b));
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_result_add_0_0_q <= i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_result_add_0_0_o(66 downto 0);

    -- i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_extender_x(BITJOIN,40)@4
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_extender_x_q <= i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_multconst_x_q & i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_x_result_add_0_0_q(65 downto 0);

    -- i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_trunc_sel_x(BITSELECT,42)@4
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_trunc_sel_x_b <= i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_mult_extender_x_q(63 downto 0);

    -- redist23_i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_trunc_sel_x_b_1(DELAY,165)
    redist23_i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_trunc_sel_x_b, xout => redist23_i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_a_sync_buffer_gemm_nn9w(BLACKBOX,90)@0
    -- in in_i_dependence@5
    -- in in_valid_in@5
    -- out out_buffer_out@5
    -- out out_valid_out@5
    thei_syncbuf_a_sync_buffer_gemm_nn9w : i_syncbuf_a_sync_buffer_gemm_nn9w231
    PORT MAP (
        in_buffer_in => in_A,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist22_sync_in_aunroll_x_in_i_valid_4_q,
        out_buffer_out => i_syncbuf_a_sync_buffer_gemm_nn9w_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_add_x(ADD,43)@5
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_a_sync_buffer_gemm_nn9w_out_buffer_out);
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_add_x_b <= STD_LOGIC_VECTOR("0" & redist23_i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_trunc_sel_x_b_1_q);
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_add_x_a) + UNSIGNED(i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_add_x_b));
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_add_x_q <= i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_add_x_o(64 downto 0);

    -- i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_dupName_0_trunc_sel_x(BITSELECT,37)@5
    i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_dupName_0_trunc_sel_x_b <= i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_add_x_q(63 downto 0);

    -- redist8_i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_data_out_4_inputreg(DELAY,180)
    redist8_i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_data_out_4_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist7_i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_data_out_1_q, xout => redist8_i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_data_out_4_inputreg_q, clk => clock, aclr => resetn );

    -- redist8_i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_data_out_4(DELAY,150)
    redist8_i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_data_out_4 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist8_i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_data_out_4_inputreg_q, xout => redist8_i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_data_out_4_q, clk => clock, aclr => resetn );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,48)@5
    out_c0_exi11427_0 <= GND_q;
    out_c0_exi11427_1 <= redist8_i_acl_pop_i32_k_371_pop43_gemm_nn9w_out_data_out_4_q;
    out_c0_exi11427_2 <= i_vloadgep_i32_gemm_nn9w_gemm_nn9w233_dupName_0_trunc_sel_x_b;
    out_c0_exi11427_3 <= redist1_i_unnamed_gemm_nn9w242_q_1_q;
    out_c0_exi11427_4 <= i_phi_decision147_xor_rm_gemm_nn9w_q;
    out_c0_exi11427_5 <= redist0_i_unnamed_gemm_nn9w246_q_1_q;
    out_c0_exi11427_6 <= redist4_i_acl_pop_i64_conv31_hf_tofpc331_pop53_gemm_nn9w_out_data_out_4_q;
    out_c0_exi11427_7 <= redist13_i_acl_pop_i1_pop44_gemm_nn9w_out_data_out_4_q;
    out_c0_exi11427_8 <= redist17_i_acl_pop_i1_notexit300306_pop45_gemm_nn9w_out_data_out_4_q;
    out_c0_exi11427_9 <= redist2_i_acl_pop_p1h_arrayidx30330_pop52_gemm_nn9w_out_data_out_4_mem_q;
    out_c0_exi11427_10 <= redist15_i_acl_pop_i1_phi_decision139_xor_rm65333_pop55_gemm_nn9w_out_data_out_4_q;
    out_c0_exi11427_11 <= redist11_i_acl_pop_i1_pop56_gemm_nn9w_out_data_out_4_q;
    out_o_valid <= redist22_sync_in_aunroll_x_in_i_valid_4_q;

    -- i_acl_push_i1_notexitcond291_gemm_nn9w(BLACKBOX,73)@4
    -- out out_feedback_out_4@20000000
    -- out out_feedback_valid_out_4@20000000
    thei_acl_push_i1_notexitcond291_gemm_nn9w : i_acl_push_i1_notexitcond291_gemm_nn9w257
    PORT MAP (
        in_data_in => i_unnamed_gemm_nn9w246_q,
        in_feedback_stall_in_4 => i_acl_pipeline_keep_going290_gemm_nn9w_out_not_exitcond_stall_out,
        in_stall_in => GND_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_3_q,
        out_feedback_out_4 => i_acl_push_i1_notexitcond291_gemm_nn9w_out_feedback_out_4,
        out_feedback_valid_out_4 => i_acl_push_i1_notexitcond291_gemm_nn9w_out_feedback_valid_out_4,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going290_gemm_nn9w(BLACKBOX,58)@4
    -- out out_exiting_stall_out@20000000
    -- out out_exiting_valid_out@20000000
    -- out out_initeration_stall_out@20000000
    -- out out_not_exitcond_stall_out@20000000
    -- out out_pipeline_valid_out@20000000
    thei_acl_pipeline_keep_going290_gemm_nn9w : i_acl_pipeline_keep_going290_gemm_nn9w223
    PORT MAP (
        in_data_in => VCC_q,
        in_initeration_in => GND_q,
        in_initeration_valid_in => GND_q,
        in_not_exitcond_in => i_acl_push_i1_notexitcond291_gemm_nn9w_out_feedback_out_4,
        in_not_exitcond_valid_in => i_acl_push_i1_notexitcond291_gemm_nn9w_out_feedback_valid_out_4,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_stall_in => GND_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_3_q,
        out_exiting_stall_out => i_acl_pipeline_keep_going290_gemm_nn9w_out_exiting_stall_out,
        out_exiting_valid_out => i_acl_pipeline_keep_going290_gemm_nn9w_out_exiting_valid_out,
        out_not_exitcond_stall_out => i_acl_pipeline_keep_going290_gemm_nn9w_out_not_exitcond_stall_out,
        out_pipeline_valid_out => i_acl_pipeline_keep_going290_gemm_nn9w_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ext_sig_sync_out(GPOUT,57)
    out_aclp_to_limiter_i_acl_pipeline_keep_going290_gemm_nn9w_exiting_valid_out <= i_acl_pipeline_keep_going290_gemm_nn9w_out_exiting_valid_out;
    out_aclp_to_limiter_i_acl_pipeline_keep_going290_gemm_nn9w_exiting_stall_out <= i_acl_pipeline_keep_going290_gemm_nn9w_out_exiting_stall_out;

    -- pipeline_valid_out_sync(GPOUT,103)
    out_pipeline_valid_out <= i_acl_pipeline_keep_going290_gemm_nn9w_out_pipeline_valid_out;

END normal;
