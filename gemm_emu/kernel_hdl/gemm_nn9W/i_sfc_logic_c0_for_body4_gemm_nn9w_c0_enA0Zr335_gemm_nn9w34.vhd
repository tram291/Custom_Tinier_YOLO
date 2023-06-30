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

-- VHDL created from i_sfc_logic_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w34
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

entity i_sfc_logic_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w34 is
    port (
        in_B : in std_logic_vector(63 downto 0);  -- ufix64
        in_K : in std_logic_vector(31 downto 0);  -- ufix32
        in_N : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni7_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni7_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni7_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni7_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni7_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni7_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni7_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni7_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi15_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi15_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi15_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi15_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi15_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi15_5 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi15_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi15_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi15_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi15_9 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi15_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi15_11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi15_12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi15_13 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi15_14 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi15_15 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w34;

architecture normal of i_sfc_logic_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w34 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_pipeline_keep_going_gemm_nn9w40 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_initeration_in : in std_logic_vector(7 downto 0);  -- Fixed Point
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


    component i_acl_pop_i1_forked303319_pop31_gemm_nn9w88 is
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


    component i_acl_pop_i1_memdep_phi261_pop11324_pop37_gemm_nn9w73 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_37 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_37 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_37 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_notexit300322_pop35_gemm_nn9w96 is
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


    component i_acl_pop_i1_pop34_gemm_nn9w92 is
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


    component i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w55 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_33 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_33 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_33 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_k_169_pop26_gemm_nn9w59 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_26 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_26 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_26 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_lda_sync_buffer320_pop32_gemm_nn9w51 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_32 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_32 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_32 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i6_cleanups_pop30_gemm_nn9w36 is
        port (
            in_data_in : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_30 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_30 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_feedback_stall_out_30 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i6_initerations_pop29_gemm_nn9w42 is
        port (
            in_data_in : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_29 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_29 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_feedback_stall_out_29 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_forked303319_push31_gemm_nn9w90 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_31 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
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


    component i_acl_push_i1_lastiniteration_gemm_nn9w49 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_1 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_memdep_phi261_pop11324_push37_gemm_nn9w75 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_37 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_37 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_37 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_notexit300322_push35_gemm_nn9w98 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_35 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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


    component i_acl_push_i1_notexitcond_gemm_nn9w83 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_first_cleanup : in std_logic_vector(0 downto 0);  -- Fixed Point
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


    component i_acl_push_i1_push34_gemm_nn9w94 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_34 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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


    component i_acl_push_i32_j_076_pop9321_push33_gemm_nn9w57 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_33 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_33 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_33 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_k_169_push26_gemm_nn9w77 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_26 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_26 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_26 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_lda_sync_buffer320_push32_gemm_nn9w53 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_32 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_32 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_32 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i6_cleanups_push30_gemm_nn9w86 is
        port (
            in_data_in : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_feedback_stall_in_30 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_feedback_out_30 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_30 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i6_initerations_push29_gemm_nn9w45 is
        port (
            in_data_in : in std_logic_vector(5 downto 0);  -- Fixed Point
            in_feedback_stall_in_29 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_keep_going : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(5 downto 0);  -- Fixed Point
            out_feedback_out_29 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_29 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_b_sync_buffer_gemm_nn9w63 is
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


    component i_syncbuf_k_sync_buffer284_gemm_nn9w79 is
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


    component i_syncbuf_k_sync_buffer_gemm_nn9w69 is
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


    component i_syncbuf_n_sync_buffer283_gemm_nn9w66 is
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
    signal bgTrunc_i_add22_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_add_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_mul_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_vscale_i_add126_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_cleanups_shl_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (5 downto 0);
    signal i_conv_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_narrow_x_b : STD_LOGIC_VECTOR (2 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_multconst_x_q : STD_LOGIC_VECTOR (61 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_add_x_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_add_x_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_add_x_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_add_x_q : STD_LOGIC_VECTOR (64 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_2gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_3gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i6_0gr_q : STD_LOGIC_VECTOR (5 downto 0);
    signal c_i6_1gr_q : STD_LOGIC_VECTOR (5 downto 0);
    signal c_i6_31_q : STD_LOGIC_VECTOR (5 downto 0);
    signal i_acl_pipeline_keep_going_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gemm_nn9w_out_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gemm_nn9w_out_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gemm_nn9w_out_initeration_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gemm_nn9w_out_not_exitcond_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gemm_nn9w_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_forked303319_pop31_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_forked303319_pop31_gemm_nn9w_out_feedback_stall_out_31 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi261_pop11324_pop37_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi261_pop11324_pop37_gemm_nn9w_out_feedback_stall_out_37 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_notexit300322_pop35_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_notexit300322_pop35_gemm_nn9w_out_feedback_stall_out_35 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_pop34_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_pop34_gemm_nn9w_out_feedback_stall_out_34 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_feedback_stall_out_33 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_feedback_stall_out_26 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_lda_sync_buffer320_pop32_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_lda_sync_buffer320_pop32_gemm_nn9w_out_feedback_stall_out_32 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i6_cleanups_pop30_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (5 downto 0);
    signal i_acl_pop_i6_cleanups_pop30_gemm_nn9w_out_feedback_stall_out_30 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i6_initerations_pop29_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (5 downto 0);
    signal i_acl_pop_i6_initerations_pop29_gemm_nn9w_out_feedback_stall_out_29 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_forked303319_push31_gemm_nn9w_out_feedback_out_31 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_forked303319_push31_gemm_nn9w_out_feedback_valid_out_31 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_lastiniteration_gemm_nn9w_out_feedback_out_1 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_lastiniteration_gemm_nn9w_out_feedback_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi261_pop11324_push37_gemm_nn9w_out_feedback_out_37 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_memdep_phi261_pop11324_push37_gemm_nn9w_out_feedback_valid_out_37 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_notexit300322_push35_gemm_nn9w_out_feedback_out_35 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_notexit300322_push35_gemm_nn9w_out_feedback_valid_out_35 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_notexitcond_gemm_nn9w_out_feedback_out_2 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_notexitcond_gemm_nn9w_out_feedback_valid_out_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_push34_gemm_nn9w_out_feedback_out_34 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_push34_gemm_nn9w_out_feedback_valid_out_34 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_j_076_pop9321_push33_gemm_nn9w_out_feedback_out_33 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_j_076_pop9321_push33_gemm_nn9w_out_feedback_valid_out_33 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_k_169_push26_gemm_nn9w_out_feedback_out_26 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_k_169_push26_gemm_nn9w_out_feedback_valid_out_26 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_lda_sync_buffer320_push32_gemm_nn9w_out_feedback_out_32 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_lda_sync_buffer320_push32_gemm_nn9w_out_feedback_valid_out_32 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i6_cleanups_push30_gemm_nn9w_out_feedback_out_30 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i6_cleanups_push30_gemm_nn9w_out_feedback_valid_out_30 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i6_initerations_push29_gemm_nn9w_out_feedback_out_29 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i6_initerations_push29_gemm_nn9w_out_feedback_valid_out_29 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_add22_gemm_nn9w_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add22_gemm_nn9w_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add22_gemm_nn9w_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add22_gemm_nn9w_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_gemm_nn9w_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_gemm_nn9w_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_gemm_nn9w_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_add_gemm_nn9w_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_cleanups_shl_gemm_nn9w_vt_const_5_q : STD_LOGIC_VECTOR (4 downto 0);
    signal i_cleanups_shl_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (5 downto 0);
    signal i_cleanups_shl_gemm_nn9w_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp367_rm_gemm_nn9w_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp367_rm_gemm_nn9w_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp367_rm_gemm_nn9w_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp367_rm_gemm_nn9w_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp3_gemm_nn9w_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp3_gemm_nn9w_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp3_gemm_nn9w_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp3_gemm_nn9w_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp75_rm_gemm_nn9w_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp75_rm_gemm_nn9w_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp75_rm_gemm_nn9w_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_cmp75_rm_gemm_nn9w_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_first_cleanup_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_first_cleanup_xor_or_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_last_initeration_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_masked_gemm_nn9w_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_masked_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_next_initerations_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (5 downto 0);
    signal i_next_initerations_gemm_nn9w_vt_select_4_b : STD_LOGIC_VECTOR (4 downto 0);
    signal i_notcmp_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phi_decision116_xor_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_b_sync_buffer_gemm_nn9w_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_k_sync_buffer284_gemm_nn9w_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_k_sync_buffer_gemm_nn9w_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_n_sync_buffer283_gemm_nn9w_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_gemm_nn9w38_q : STD_LOGIC_VECTOR (5 downto 0);
    signal i_unnamed_gemm_nn9w38_vt_join_q : STD_LOGIC_VECTOR (5 downto 0);
    signal i_unnamed_gemm_nn9w38_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gemm_nn9w47_vt_join_q : STD_LOGIC_VECTOR (5 downto 0);
    signal i_unnamed_gemm_nn9w47_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gemm_nn9w61_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_unnamed_gemm_nn9w61_vt_select_63_b : STD_LOGIC_VECTOR (62 downto 0);
    signal i_unnamed_gemm_nn9w72_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gemm_nn9w82_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_vscale_i_add126_gemm_nn9w_a : STD_LOGIC_VECTOR (64 downto 0);
    signal i_vscale_i_add126_gemm_nn9w_b : STD_LOGIC_VECTOR (64 downto 0);
    signal i_vscale_i_add126_gemm_nn9w_o : STD_LOGIC_VECTOR (64 downto 0);
    signal i_vscale_i_add126_gemm_nn9w_q : STD_LOGIC_VECTOR (64 downto 0);
    signal i_xor_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signX_uid153_i_div1_rm_gemm_nn9w_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xOC_uid154_i_div1_rm_gemm_nn9w_b : STD_LOGIC_VECTOR (31 downto 0);
    signal xOC_uid154_i_div1_rm_gemm_nn9w_qi : STD_LOGIC_VECTOR (31 downto 0);
    signal xOC_uid154_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xTC_uid155_i_div1_rm_gemm_nn9w_a : STD_LOGIC_VECTOR (32 downto 0);
    signal xTC_uid155_i_div1_rm_gemm_nn9w_b : STD_LOGIC_VECTOR (32 downto 0);
    signal xTC_uid155_i_div1_rm_gemm_nn9w_o : STD_LOGIC_VECTOR (32 downto 0);
    signal xTC_uid155_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (32 downto 0);
    signal nx_uid156_i_div1_rm_gemm_nn9w_in : STD_LOGIC_VECTOR (31 downto 0);
    signal nx_uid156_i_div1_rm_gemm_nn9w_b : STD_LOGIC_VECTOR (31 downto 0);
    signal zCst_uid157_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (3 downto 0);
    signal newX_uid158_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (35 downto 0);
    signal qDigit_8_uid168_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rDigit_8_uid171_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (1 downto 0);
    signal y_7_uid174_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (5 downto 0);
    signal qDigit_7_uid175_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rDigit_7_uid178_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (1 downto 0);
    signal y_6_uid181_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (5 downto 0);
    signal qDigit_6_uid182_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rDigit_6_uid185_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (1 downto 0);
    signal y_5_uid188_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (5 downto 0);
    signal qDigit_5_uid189_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rDigit_5_uid192_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (1 downto 0);
    signal y_4_uid195_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (5 downto 0);
    signal qDigit_4_uid196_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rDigit_4_uid199_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (1 downto 0);
    signal y_3_uid202_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (5 downto 0);
    signal qDigit_3_uid203_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rDigit_3_uid206_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (1 downto 0);
    signal y_2_uid209_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (5 downto 0);
    signal qDigit_2_uid210_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rDigit_2_uid213_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (1 downto 0);
    signal y_1_uid216_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (5 downto 0);
    signal qDigit_1_uid217_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rDigit_1_uid220_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (1 downto 0);
    signal y_0_uid223_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (5 downto 0);
    signal qDigit_0_uid224_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (3 downto 0);
    signal resFinalIntDiv_uid230_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (35 downto 0);
    signal resFinalIntDivCmpRange_uid231_i_div1_rm_gemm_nn9w_in : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalIntDivCmpRange_uid231_i_div1_rm_gemm_nn9w_b : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalIntDivCmpOC_uid232_i_div1_rm_gemm_nn9w_b : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalIntDivCmpOC_uid232_i_div1_rm_gemm_nn9w_qi : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalIntDivCmpOC_uid232_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalIntDivCmpTC_uid233_i_div1_rm_gemm_nn9w_a : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalIntDivCmpTC_uid233_i_div1_rm_gemm_nn9w_b : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalIntDivCmpTC_uid233_i_div1_rm_gemm_nn9w_o : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalIntDivCmpTC_uid233_i_div1_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_in : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b : STD_LOGIC_VECTOR (31 downto 0);
    signal signX_uid236_i_div_rm_gemm_nn9w_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xOC_uid237_i_div_rm_gemm_nn9w_b : STD_LOGIC_VECTOR (31 downto 0);
    signal xOC_uid237_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xTC_uid238_i_div_rm_gemm_nn9w_a : STD_LOGIC_VECTOR (32 downto 0);
    signal xTC_uid238_i_div_rm_gemm_nn9w_b : STD_LOGIC_VECTOR (32 downto 0);
    signal xTC_uid238_i_div_rm_gemm_nn9w_o : STD_LOGIC_VECTOR (32 downto 0);
    signal xTC_uid238_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (32 downto 0);
    signal nx_uid239_i_div_rm_gemm_nn9w_in : STD_LOGIC_VECTOR (31 downto 0);
    signal nx_uid239_i_div_rm_gemm_nn9w_b : STD_LOGIC_VECTOR (31 downto 0);
    signal newX_uid241_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (35 downto 0);
    signal qDigit_8_uid251_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rDigit_8_uid254_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (1 downto 0);
    signal y_7_uid257_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (5 downto 0);
    signal qDigit_7_uid258_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rDigit_7_uid261_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (1 downto 0);
    signal y_6_uid264_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (5 downto 0);
    signal qDigit_6_uid265_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rDigit_6_uid268_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (1 downto 0);
    signal y_5_uid271_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (5 downto 0);
    signal qDigit_5_uid272_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rDigit_5_uid275_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (1 downto 0);
    signal y_4_uid278_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (5 downto 0);
    signal qDigit_4_uid279_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rDigit_4_uid282_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (1 downto 0);
    signal y_3_uid285_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (5 downto 0);
    signal qDigit_3_uid286_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rDigit_3_uid289_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (1 downto 0);
    signal y_2_uid292_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (5 downto 0);
    signal qDigit_2_uid293_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rDigit_2_uid296_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (1 downto 0);
    signal y_1_uid299_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (5 downto 0);
    signal qDigit_1_uid300_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rDigit_1_uid303_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (1 downto 0);
    signal y_0_uid306_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (5 downto 0);
    signal qDigit_0_uid307_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (3 downto 0);
    signal resFinalIntDiv_uid313_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (35 downto 0);
    signal resFinalIntDivCmpRange_uid314_i_div_rm_gemm_nn9w_in : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalIntDivCmpRange_uid314_i_div_rm_gemm_nn9w_b : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalIntDivCmpOC_uid315_i_div_rm_gemm_nn9w_b : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalIntDivCmpOC_uid315_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalIntDivCmpTC_uid316_i_div_rm_gemm_nn9w_a : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalIntDivCmpTC_uid316_i_div_rm_gemm_nn9w_b : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalIntDivCmpTC_uid316_i_div_rm_gemm_nn9w_o : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalIntDivCmpTC_uid316_i_div_rm_gemm_nn9w_q : STD_LOGIC_VECTOR (32 downto 0);
    signal resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_in : STD_LOGIC_VECTOR (31 downto 0);
    signal resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng1_uid323_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_in : STD_LOGIC_VECTOR (4 downto 0);
    signal leftShiftStage0Idx1Rng1_uid323_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_b : STD_LOGIC_VECTOR (4 downto 0);
    signal leftShiftStage0Idx1_uid324_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_q : STD_LOGIC_VECTOR (5 downto 0);
    signal leftShiftStageSel0Dto0_uid325_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStageSel0Dto0_uid325_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid326_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid326_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage0Idx1Rng1_uid331_i_next_initerations_gemm_nn9w_gemm_nn9w44_shift_x_b : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStage0Idx1_uid333_i_next_initerations_gemm_nn9w_gemm_nn9w44_shift_x_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage0_uid335_i_next_initerations_gemm_nn9w_gemm_nn9w44_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid335_i_next_initerations_gemm_nn9w_gemm_nn9w44_shift_x_q : STD_LOGIC_VECTOR (5 downto 0);
    signal leftShiftStage0Idx1Rng1_uid341_i_unnamed_gemm_nn9w62_shift_x_in : STD_LOGIC_VECTOR (62 downto 0);
    signal leftShiftStage0Idx1Rng1_uid341_i_unnamed_gemm_nn9w62_shift_x_b : STD_LOGIC_VECTOR (62 downto 0);
    signal leftShiftStage0Idx1_uid342_i_unnamed_gemm_nn9w62_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage0_uid344_i_unnamed_gemm_nn9w62_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid344_i_unnamed_gemm_nn9w62_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_join_13_q : STD_LOGIC_VECTOR (55 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_align_14_q : STD_LOGIC_VECTOR (37 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_align_14_qint : STD_LOGIC_VECTOR (37 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_join_16_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (66 downto 0);
    signal bgTrunc_i_mul_gemm_nn9w_rnd_sel_in : STD_LOGIC_VECTOR (63 downto 0);
    signal bgTrunc_i_mul_gemm_nn9w_rnd_sel_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul_gemm_nn9w_bs1_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_gemm_nn9w_bs1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_gemm_nn9w_bs4_in : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_gemm_nn9w_bs4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_gemm_nn9w_bjA5_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul_gemm_nn9w_bs7_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul_gemm_nn9w_bjB9_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul_gemm_nn9w_bs11_b : STD_LOGIC_VECTOR (13 downto 0);
    signal i_mul_gemm_nn9w_join_13_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_mul_gemm_nn9w_align_14_q : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul_gemm_nn9w_align_14_qint : STD_LOGIC_VECTOR (51 downto 0);
    signal i_mul_gemm_nn9w_result_add_0_0_a : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul_gemm_nn9w_result_add_0_0_b : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul_gemm_nn9w_result_add_0_0_o : STD_LOGIC_VECTOR (66 downto 0);
    signal i_mul_gemm_nn9w_result_add_0_0_q : STD_LOGIC_VECTOR (65 downto 0);
    signal i_unnamed_gemm_nn9w47_BitSelect_for_a_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gemm_nn9w47_join_q : STD_LOGIC_VECTOR (5 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (10 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (18 downto 0);
    signal i_mul_gemm_nn9w_im0_cma_reset : std_logic;
    type i_mul_gemm_nn9w_im0_cma_a0type is array(NATURAL range <>) of UNSIGNED(17 downto 0);
    signal i_mul_gemm_nn9w_im0_cma_a0 : i_mul_gemm_nn9w_im0_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of i_mul_gemm_nn9w_im0_cma_a0 : signal is true;
    signal i_mul_gemm_nn9w_im0_cma_c0 : i_mul_gemm_nn9w_im0_cma_a0type(0 to 0);
    attribute preserve of i_mul_gemm_nn9w_im0_cma_c0 : signal is true;
    type i_mul_gemm_nn9w_im0_cma_ptype is array(NATURAL range <>) of UNSIGNED(35 downto 0);
    signal i_mul_gemm_nn9w_im0_cma_p : i_mul_gemm_nn9w_im0_cma_ptype(0 to 0);
    signal i_mul_gemm_nn9w_im0_cma_u : i_mul_gemm_nn9w_im0_cma_ptype(0 to 0);
    signal i_mul_gemm_nn9w_im0_cma_w : i_mul_gemm_nn9w_im0_cma_ptype(0 to 0);
    signal i_mul_gemm_nn9w_im0_cma_x : i_mul_gemm_nn9w_im0_cma_ptype(0 to 0);
    signal i_mul_gemm_nn9w_im0_cma_y : i_mul_gemm_nn9w_im0_cma_ptype(0 to 0);
    signal i_mul_gemm_nn9w_im0_cma_s : i_mul_gemm_nn9w_im0_cma_ptype(0 to 0);
    signal i_mul_gemm_nn9w_im0_cma_qq : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul_gemm_nn9w_im0_cma_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_mul_gemm_nn9w_im0_cma_ena0 : std_logic;
    signal i_mul_gemm_nn9w_im0_cma_ena1 : std_logic;
    signal i_mul_gemm_nn9w_im10_cma_reset : std_logic;
    type i_mul_gemm_nn9w_im10_cma_a0type is array(NATURAL range <>) of UNSIGNED(13 downto 0);
    signal i_mul_gemm_nn9w_im10_cma_a0 : i_mul_gemm_nn9w_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul_gemm_nn9w_im10_cma_a0 : signal is true;
    signal i_mul_gemm_nn9w_im10_cma_c0 : i_mul_gemm_nn9w_im10_cma_a0type(0 to 0);
    attribute preserve of i_mul_gemm_nn9w_im10_cma_c0 : signal is true;
    type i_mul_gemm_nn9w_im10_cma_ptype is array(NATURAL range <>) of UNSIGNED(27 downto 0);
    signal i_mul_gemm_nn9w_im10_cma_p : i_mul_gemm_nn9w_im10_cma_ptype(0 to 0);
    signal i_mul_gemm_nn9w_im10_cma_u : i_mul_gemm_nn9w_im10_cma_ptype(0 to 0);
    signal i_mul_gemm_nn9w_im10_cma_w : i_mul_gemm_nn9w_im10_cma_ptype(0 to 0);
    signal i_mul_gemm_nn9w_im10_cma_x : i_mul_gemm_nn9w_im10_cma_ptype(0 to 0);
    signal i_mul_gemm_nn9w_im10_cma_y : i_mul_gemm_nn9w_im10_cma_ptype(0 to 0);
    signal i_mul_gemm_nn9w_im10_cma_s : i_mul_gemm_nn9w_im10_cma_ptype(0 to 0);
    signal i_mul_gemm_nn9w_im10_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul_gemm_nn9w_im10_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_mul_gemm_nn9w_im10_cma_ena0 : std_logic;
    signal i_mul_gemm_nn9w_im10_cma_ena1 : std_logic;
    signal i_mul_gemm_nn9w_ma3_cma_reset : std_logic;
    signal i_mul_gemm_nn9w_ma3_cma_a0 : i_mul_gemm_nn9w_im10_cma_a0type(0 to 1);
    attribute preserve of i_mul_gemm_nn9w_ma3_cma_a0 : signal is true;
    type i_mul_gemm_nn9w_ma3_cma_c0type is array(NATURAL range <>) of SIGNED(18 downto 0);
    signal i_mul_gemm_nn9w_ma3_cma_c0 : i_mul_gemm_nn9w_ma3_cma_c0type(0 to 1);
    attribute preserve of i_mul_gemm_nn9w_ma3_cma_c0 : signal is true;
    type i_mul_gemm_nn9w_ma3_cma_ltype is array(NATURAL range <>) of SIGNED(14 downto 0);
    signal i_mul_gemm_nn9w_ma3_cma_l : i_mul_gemm_nn9w_ma3_cma_ltype(0 to 1);
    type i_mul_gemm_nn9w_ma3_cma_ptype is array(NATURAL range <>) of SIGNED(33 downto 0);
    signal i_mul_gemm_nn9w_ma3_cma_p : i_mul_gemm_nn9w_ma3_cma_ptype(0 to 1);
    type i_mul_gemm_nn9w_ma3_cma_utype is array(NATURAL range <>) of SIGNED(34 downto 0);
    signal i_mul_gemm_nn9w_ma3_cma_u : i_mul_gemm_nn9w_ma3_cma_utype(0 to 1);
    signal i_mul_gemm_nn9w_ma3_cma_w : i_mul_gemm_nn9w_ma3_cma_utype(0 to 0);
    signal i_mul_gemm_nn9w_ma3_cma_x : i_mul_gemm_nn9w_ma3_cma_utype(0 to 0);
    signal i_mul_gemm_nn9w_ma3_cma_y : i_mul_gemm_nn9w_ma3_cma_utype(0 to 0);
    signal i_mul_gemm_nn9w_ma3_cma_s : i_mul_gemm_nn9w_ma3_cma_utype(0 to 0);
    signal i_mul_gemm_nn9w_ma3_cma_qq : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul_gemm_nn9w_ma3_cma_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_mul_gemm_nn9w_ma3_cma_ena0 : std_logic;
    signal i_mul_gemm_nn9w_ma3_cma_ena1 : std_logic;
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_d : STD_LOGIC_VECTOR (3 downto 0);
    signal chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_e : STD_LOGIC_VECTOR (3 downto 0);
    signal chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_f : STD_LOGIC_VECTOR (3 downto 0);
    signal chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_g : STD_LOGIC_VECTOR (3 downto 0);
    signal chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_h : STD_LOGIC_VECTOR (3 downto 0);
    signal chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_i : STD_LOGIC_VECTOR (3 downto 0);
    signal chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal i_mul_gemm_nn9w_bs2_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_mul_gemm_nn9w_bs2_merged_bit_select_c : STD_LOGIC_VECTOR (13 downto 0);
    signal chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_d : STD_LOGIC_VECTOR (3 downto 0);
    signal chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_e : STD_LOGIC_VECTOR (3 downto 0);
    signal chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_f : STD_LOGIC_VECTOR (3 downto 0);
    signal chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_g : STD_LOGIC_VECTOR (3 downto 0);
    signal chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_h : STD_LOGIC_VECTOR (3 downto 0);
    signal chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_i : STD_LOGIC_VECTOR (3 downto 0);
    signal chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_j : STD_LOGIC_VECTOR (3 downto 0);
    signal redist0_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_b_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist1_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist2_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_d_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist3_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_e_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist4_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_f_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist5_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_g_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist6_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_j_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist7_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_b_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist8_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist9_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_d_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist10_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_e_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist11_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_f_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist12_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_g_1_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist13_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_j_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist14_i_mul_gemm_nn9w_ma3_cma_q_1_q : STD_LOGIC_VECTOR (33 downto 0);
    signal redist15_i_mul_gemm_nn9w_im10_cma_q_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal redist16_i_mul_gemm_nn9w_im0_cma_q_1_q : STD_LOGIC_VECTOR (35 downto 0);
    signal redist17_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist19_resFinalIntDivCmpRange_uid314_i_div_rm_gemm_nn9w_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist20_qDigit_6_uid265_i_div_rm_gemm_nn9w_q_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist21_qDigit_7_uid258_i_div_rm_gemm_nn9w_q_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist22_nx_uid239_i_div_rm_gemm_nn9w_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist23_signX_uid236_i_div_rm_gemm_nn9w_b_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist26_resFinalIntDivCmpRange_uid231_i_div1_rm_gemm_nn9w_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist27_qDigit_6_uid182_i_div1_rm_gemm_nn9w_q_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist28_qDigit_7_uid175_i_div1_rm_gemm_nn9w_q_2_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist29_nx_uid156_i_div1_rm_gemm_nn9w_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist30_signX_uid153_i_div1_rm_gemm_nn9w_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_signX_uid153_i_div1_rm_gemm_nn9w_b_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist32_signX_uid153_i_div1_rm_gemm_nn9w_b_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist33_i_xor_gemm_nn9w_q_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_i_unnamed_gemm_nn9w72_q_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_i_notcmp_gemm_nn9w_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_i_masked_gemm_nn9w_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_i_first_cleanup_gemm_nn9w_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist38_i_cmp75_rm_gemm_nn9w_c_10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist39_i_cmp367_rm_gemm_nn9w_c_10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_10_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist42_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist44_i_acl_pop_i1_pop34_gemm_nn9w_out_data_out_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist45_i_acl_pop_i1_notexit300322_pop35_gemm_nn9w_out_data_out_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist46_i_acl_pop_i1_memdep_phi261_pop11324_pop37_gemm_nn9w_out_data_out_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_i_acl_pop_i1_forked303319_pop31_gemm_nn9w_out_data_out_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_i_acl_pipeline_keep_going_gemm_nn9w_out_data_out_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_i_acl_pipeline_keep_going_gemm_nn9w_out_data_out_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_sync_in_aunroll_x_in_c0_eni7_1_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist51_sync_in_aunroll_x_in_c0_eni7_1_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist53_sync_in_aunroll_x_in_c0_eni7_5_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_sync_in_aunroll_x_in_i_valid_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist55_sync_in_aunroll_x_in_i_valid_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist56_sync_in_aunroll_x_in_i_valid_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist57_i_vloadgep_i_gemm_nn9w_gemm_nn9w65_trunc_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist58_bgTrunc_i_vscale_i_add126_gemm_nn9w_sel_x_b_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist59_bgTrunc_i_mul_gemm_nn9w_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist60_bgTrunc_i_add_gemm_nn9w_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist61_bgTrunc_i_add22_gemm_nn9w_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_reset0 : std_logic;
    signal redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_rdcnt_i : signal is true;
    signal redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_sticky_ena_q : signal is true;
    signal redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_reset0 : std_logic;
    signal redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt_i : signal is true;
    signal redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt_eq : std_logic;
    attribute preserve of redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt_eq : signal is true;
    signal redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_last_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_sticky_ena_q : signal is true;
    signal redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_outputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_reset0 : std_logic;
    signal redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_rdcnt_i : signal is true;
    signal redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_sticky_ena_q : signal is true;
    signal redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_10_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_inputreg_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_reset0 : std_logic;
    signal redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt_i : signal is true;
    signal redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt_eq : std_logic;
    attribute preserve of redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt_eq : signal is true;
    signal redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_sticky_ena_q : signal is true;
    signal redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_reset0 : std_logic;
    signal redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist52_sync_in_aunroll_x_in_c0_eni7_3_5_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist52_sync_in_aunroll_x_in_c0_eni7_3_5_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve of redist52_sync_in_aunroll_x_in_c0_eni7_3_5_rdcnt_i : signal is true;
    signal redist52_sync_in_aunroll_x_in_c0_eni7_3_5_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist52_sync_in_aunroll_x_in_c0_eni7_3_5_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist52_sync_in_aunroll_x_in_c0_eni7_3_5_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_sync_in_aunroll_x_in_c0_eni7_3_5_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_sync_in_aunroll_x_in_c0_eni7_3_5_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_sync_in_aunroll_x_in_c0_eni7_3_5_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist52_sync_in_aunroll_x_in_c0_eni7_3_5_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge of redist52_sync_in_aunroll_x_in_c0_eni7_3_5_sticky_ena_q : signal is true;
    signal redist52_sync_in_aunroll_x_in_c0_eni7_3_5_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist54_sync_in_aunroll_x_in_i_valid_4(DELAY,453)
    redist54_sync_in_aunroll_x_in_i_valid_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist54_sync_in_aunroll_x_in_i_valid_4_q, clk => clock, aclr => resetn );

    -- redist55_sync_in_aunroll_x_in_i_valid_5(DELAY,454)
    redist55_sync_in_aunroll_x_in_i_valid_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist54_sync_in_aunroll_x_in_i_valid_4_q, xout => redist55_sync_in_aunroll_x_in_i_valid_5_q, clk => clock, aclr => resetn );

    -- redist56_sync_in_aunroll_x_in_i_valid_14(DELAY,455)
    redist56_sync_in_aunroll_x_in_i_valid_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 9, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist55_sync_in_aunroll_x_in_i_valid_5_q, xout => redist56_sync_in_aunroll_x_in_i_valid_14_q, clk => clock, aclr => resetn );

    -- c_i6_0gr(CONSTANT,68)
    c_i6_0gr_q <= "000000";

    -- i_cleanups_shl_gemm_nn9w_vt_const_5(CONSTANT,96)
    i_cleanups_shl_gemm_nn9w_vt_const_5_q <= "00000";

    -- c_i6_1gr(CONSTANT,69)
    c_i6_1gr_q <= "000001";

    -- redist48_i_acl_pipeline_keep_going_gemm_nn9w_out_data_out_5(DELAY,447)
    redist48_i_acl_pipeline_keep_going_gemm_nn9w_out_data_out_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pipeline_keep_going_gemm_nn9w_out_data_out, xout => redist48_i_acl_pipeline_keep_going_gemm_nn9w_out_data_out_5_q, clk => clock, aclr => resetn );

    -- leftShiftStage0Idx1Rng1_uid323_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x(BITSELECT,322)@6
    leftShiftStage0Idx1Rng1_uid323_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_in <= i_acl_pop_i6_cleanups_pop30_gemm_nn9w_out_data_out(4 downto 0);
    leftShiftStage0Idx1Rng1_uid323_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_b <= leftShiftStage0Idx1Rng1_uid323_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_in(4 downto 0);

    -- leftShiftStage0Idx1_uid324_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x(BITJOIN,323)@6
    leftShiftStage0Idx1_uid324_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_q <= leftShiftStage0Idx1Rng1_uid323_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_b & GND_q;

    -- i_xor_gemm_nn9w(LOGICAL,138)@6
    i_xor_gemm_nn9w_q <= i_first_cleanup_gemm_nn9w_q xor VCC_q;

    -- i_notcmp_gemm_nn9w(LOGICAL,117)@6
    i_notcmp_gemm_nn9w_q <= i_unnamed_gemm_nn9w82_q xor VCC_q;

    -- i_or_gemm_nn9w(LOGICAL,118)@6
    i_or_gemm_nn9w_q <= i_notcmp_gemm_nn9w_q or i_xor_gemm_nn9w_q;

    -- i_cleanups_shl_gemm_nn9w_sel_x(BITSELECT,32)@6
    i_cleanups_shl_gemm_nn9w_sel_x_b <= std_logic_vector(resize(unsigned(i_or_gemm_nn9w_q(0 downto 0)), 6));

    -- i_cleanups_shl_gemm_nn9w_vt_select_0(BITSELECT,98)@6
    i_cleanups_shl_gemm_nn9w_vt_select_0_b <= i_cleanups_shl_gemm_nn9w_sel_x_b(0 downto 0);

    -- i_cleanups_shl_gemm_nn9w_vt_join(BITJOIN,97)@6
    i_cleanups_shl_gemm_nn9w_vt_join_q <= i_cleanups_shl_gemm_nn9w_vt_const_5_q & i_cleanups_shl_gemm_nn9w_vt_select_0_b;

    -- i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_narrow_x(BITSELECT,37)@6
    i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_narrow_x_b <= i_cleanups_shl_gemm_nn9w_vt_join_q(2 downto 0);

    -- leftShiftStageSel0Dto0_uid325_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x(BITSELECT,324)@6
    leftShiftStageSel0Dto0_uid325_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_in <= i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_narrow_x_b(0 downto 0);
    leftShiftStageSel0Dto0_uid325_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_b <= leftShiftStageSel0Dto0_uid325_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_in(0 downto 0);

    -- leftShiftStage0_uid326_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x(MUX,325)@6
    leftShiftStage0_uid326_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_s <= leftShiftStageSel0Dto0_uid325_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_b;
    leftShiftStage0_uid326_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_combproc: PROCESS (leftShiftStage0_uid326_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_s, i_acl_pop_i6_cleanups_pop30_gemm_nn9w_out_data_out, leftShiftStage0Idx1_uid324_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid326_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid326_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_q <= i_acl_pop_i6_cleanups_pop30_gemm_nn9w_out_data_out;
            WHEN "1" => leftShiftStage0_uid326_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_q <= leftShiftStage0Idx1_uid324_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid326_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_acl_push_i6_cleanups_push30_gemm_nn9w(BLACKBOX,91)@6
    -- out out_feedback_out_30@20000000
    -- out out_feedback_valid_out_30@20000000
    thei_acl_push_i6_cleanups_push30_gemm_nn9w : i_acl_push_i6_cleanups_push30_gemm_nn9w86
    PORT MAP (
        in_data_in => leftShiftStage0_uid326_i_next_cleanups_gemm_nn9w_gemm_nn9w85_shift_x_q,
        in_feedback_stall_in_30 => i_acl_pop_i6_cleanups_pop30_gemm_nn9w_out_feedback_stall_out_30,
        in_keep_going => redist48_i_acl_pipeline_keep_going_gemm_nn9w_out_data_out_5_q,
        in_stall_in => GND_q,
        in_valid_in => redist55_sync_in_aunroll_x_in_i_valid_5_q,
        out_feedback_out_30 => i_acl_push_i6_cleanups_push30_gemm_nn9w_out_feedback_out_30,
        out_feedback_valid_out_30 => i_acl_push_i6_cleanups_push30_gemm_nn9w_out_feedback_valid_out_30,
        clock => clock,
        resetn => resetn
    );

    -- redist50_sync_in_aunroll_x_in_c0_eni7_1_4(DELAY,449)
    redist50_sync_in_aunroll_x_in_c0_eni7_1_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni7_1, xout => redist50_sync_in_aunroll_x_in_c0_eni7_1_4_q, clk => clock, aclr => resetn );

    -- redist51_sync_in_aunroll_x_in_c0_eni7_1_5(DELAY,450)
    redist51_sync_in_aunroll_x_in_c0_eni7_1_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist50_sync_in_aunroll_x_in_c0_eni7_1_4_q, xout => redist51_sync_in_aunroll_x_in_c0_eni7_1_5_q, clk => clock, aclr => resetn );

    -- c_i6_31(CONSTANT,70)
    c_i6_31_q <= "011111";

    -- i_acl_pop_i6_cleanups_pop30_gemm_nn9w(BLACKBOX,80)@6
    -- out out_feedback_stall_out_30@20000000
    thei_acl_pop_i6_cleanups_pop30_gemm_nn9w : i_acl_pop_i6_cleanups_pop30_gemm_nn9w36
    PORT MAP (
        in_data_in => c_i6_31_q,
        in_dir => redist51_sync_in_aunroll_x_in_c0_eni7_1_5_q,
        in_feedback_in_30 => i_acl_push_i6_cleanups_push30_gemm_nn9w_out_feedback_out_30,
        in_feedback_valid_in_30 => i_acl_push_i6_cleanups_push30_gemm_nn9w_out_feedback_valid_out_30,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist55_sync_in_aunroll_x_in_i_valid_5_q,
        out_data_out => i_acl_pop_i6_cleanups_pop30_gemm_nn9w_out_data_out,
        out_feedback_stall_out_30 => i_acl_pop_i6_cleanups_pop30_gemm_nn9w_out_feedback_stall_out_30,
        clock => clock,
        resetn => resetn
    );

    -- i_unnamed_gemm_nn9w38(LOGICAL,124)@6
    i_unnamed_gemm_nn9w38_q <= i_acl_pop_i6_cleanups_pop30_gemm_nn9w_out_data_out and c_i6_1gr_q;

    -- i_unnamed_gemm_nn9w38_vt_select_0(BITSELECT,127)@6
    i_unnamed_gemm_nn9w38_vt_select_0_b <= i_unnamed_gemm_nn9w38_q(0 downto 0);

    -- i_unnamed_gemm_nn9w38_vt_join(BITJOIN,126)@6
    i_unnamed_gemm_nn9w38_vt_join_q <= i_cleanups_shl_gemm_nn9w_vt_const_5_q & i_unnamed_gemm_nn9w38_vt_select_0_b;

    -- i_first_cleanup_gemm_nn9w(LOGICAL,108)@6
    i_first_cleanup_gemm_nn9w_q <= "1" WHEN i_unnamed_gemm_nn9w38_vt_join_q /= c_i6_0gr_q ELSE "0";

    -- i_syncbuf_k_sync_buffer284_gemm_nn9w(BLACKBOX,121)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_k_sync_buffer284_gemm_nn9w : i_syncbuf_k_sync_buffer284_gemm_nn9w79
    PORT MAP (
        in_buffer_in => in_K,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_k_sync_buffer284_gemm_nn9w_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- signX_uid236_i_div_rm_gemm_nn9w(BITSELECT,235)@1
    signX_uid236_i_div_rm_gemm_nn9w_b <= STD_LOGIC_VECTOR(i_syncbuf_k_sync_buffer284_gemm_nn9w_out_buffer_out(31 downto 31));

    -- redist23_signX_uid236_i_div_rm_gemm_nn9w_b_4(DELAY,422)
    redist23_signX_uid236_i_div_rm_gemm_nn9w_b_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => signX_uid236_i_div_rm_gemm_nn9w_b, xout => redist23_signX_uid236_i_div_rm_gemm_nn9w_b_4_q, clk => clock, aclr => resetn );

    -- zCst_uid157_i_div1_rm_gemm_nn9w(CONSTANT,156)
    zCst_uid157_i_div1_rm_gemm_nn9w_q <= "0000";

    -- xOC_uid237_i_div_rm_gemm_nn9w(LOGICAL,236)@1
    xOC_uid237_i_div_rm_gemm_nn9w_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 1 => signX_uid236_i_div_rm_gemm_nn9w_b(0)) & signX_uid236_i_div_rm_gemm_nn9w_b));
    xOC_uid237_i_div_rm_gemm_nn9w_q <= i_syncbuf_k_sync_buffer284_gemm_nn9w_out_buffer_out xor xOC_uid237_i_div_rm_gemm_nn9w_b;

    -- xTC_uid238_i_div_rm_gemm_nn9w(ADD,237)@1
    xTC_uid238_i_div_rm_gemm_nn9w_a <= STD_LOGIC_VECTOR("0" & xOC_uid237_i_div_rm_gemm_nn9w_q);
    xTC_uid238_i_div_rm_gemm_nn9w_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000" & signX_uid236_i_div_rm_gemm_nn9w_b);
    xTC_uid238_i_div_rm_gemm_nn9w_o <= STD_LOGIC_VECTOR(UNSIGNED(xTC_uid238_i_div_rm_gemm_nn9w_a) + UNSIGNED(xTC_uid238_i_div_rm_gemm_nn9w_b));
    xTC_uid238_i_div_rm_gemm_nn9w_q <= xTC_uid238_i_div_rm_gemm_nn9w_o(32 downto 0);

    -- nx_uid239_i_div_rm_gemm_nn9w(BITSELECT,238)@1
    nx_uid239_i_div_rm_gemm_nn9w_in <= xTC_uid238_i_div_rm_gemm_nn9w_q(31 downto 0);
    nx_uid239_i_div_rm_gemm_nn9w_b <= nx_uid239_i_div_rm_gemm_nn9w_in(31 downto 0);

    -- redist22_nx_uid239_i_div_rm_gemm_nn9w_b_1(DELAY,421)
    redist22_nx_uid239_i_div_rm_gemm_nn9w_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => nx_uid239_i_div_rm_gemm_nn9w_b, xout => redist22_nx_uid239_i_div_rm_gemm_nn9w_b_1_q, clk => clock, aclr => resetn );

    -- newX_uid241_i_div_rm_gemm_nn9w(BITJOIN,240)@2
    newX_uid241_i_div_rm_gemm_nn9w_q <= zCst_uid157_i_div1_rm_gemm_nn9w_q & redist22_nx_uid239_i_div_rm_gemm_nn9w_b_1_q;

    -- chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select(BITSELECT,398)@2
    chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_b <= newX_uid241_i_div_rm_gemm_nn9w_q(3 downto 0);
    chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_c <= newX_uid241_i_div_rm_gemm_nn9w_q(7 downto 4);
    chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_d <= newX_uid241_i_div_rm_gemm_nn9w_q(11 downto 8);
    chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_e <= newX_uid241_i_div_rm_gemm_nn9w_q(15 downto 12);
    chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_f <= newX_uid241_i_div_rm_gemm_nn9w_q(19 downto 16);
    chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_g <= newX_uid241_i_div_rm_gemm_nn9w_q(23 downto 20);
    chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_h <= newX_uid241_i_div_rm_gemm_nn9w_q(27 downto 24);
    chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_i <= newX_uid241_i_div_rm_gemm_nn9w_q(31 downto 28);
    chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_j <= newX_uid241_i_div_rm_gemm_nn9w_q(35 downto 32);

    -- redist6_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_j_2(DELAY,405)
    redist6_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_j_2 : dspba_delay
    GENERIC MAP ( width => 4, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_j, xout => redist6_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_j_2_q, clk => clock, aclr => resetn );

    -- qDigit_8_uid251_i_div_rm_gemm_nn9w(LOOKUP,250)@4
    qDigit_8_uid251_i_div_rm_gemm_nn9w_combproc: PROCESS (redist6_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_j_2_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist6_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_j_2_q) IS
            WHEN "0000" => qDigit_8_uid251_i_div_rm_gemm_nn9w_q <= "0000";
            WHEN "0001" => qDigit_8_uid251_i_div_rm_gemm_nn9w_q <= "0000";
            WHEN "0010" => qDigit_8_uid251_i_div_rm_gemm_nn9w_q <= "0000";
            WHEN "0011" => qDigit_8_uid251_i_div_rm_gemm_nn9w_q <= "0001";
            WHEN "0100" => qDigit_8_uid251_i_div_rm_gemm_nn9w_q <= "0001";
            WHEN "0101" => qDigit_8_uid251_i_div_rm_gemm_nn9w_q <= "0001";
            WHEN "0110" => qDigit_8_uid251_i_div_rm_gemm_nn9w_q <= "0010";
            WHEN "0111" => qDigit_8_uid251_i_div_rm_gemm_nn9w_q <= "0010";
            WHEN "1000" => qDigit_8_uid251_i_div_rm_gemm_nn9w_q <= "0010";
            WHEN "1001" => qDigit_8_uid251_i_div_rm_gemm_nn9w_q <= "0011";
            WHEN "1010" => qDigit_8_uid251_i_div_rm_gemm_nn9w_q <= "0011";
            WHEN "1011" => qDigit_8_uid251_i_div_rm_gemm_nn9w_q <= "0011";
            WHEN "1100" => qDigit_8_uid251_i_div_rm_gemm_nn9w_q <= "0100";
            WHEN "1101" => qDigit_8_uid251_i_div_rm_gemm_nn9w_q <= "0100";
            WHEN "1110" => qDigit_8_uid251_i_div_rm_gemm_nn9w_q <= "0100";
            WHEN "1111" => qDigit_8_uid251_i_div_rm_gemm_nn9w_q <= "0101";
            WHEN OTHERS => -- unreachable
                           qDigit_8_uid251_i_div_rm_gemm_nn9w_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- rDigit_8_uid254_i_div_rm_gemm_nn9w(LOOKUP,253)@2
    rDigit_8_uid254_i_div_rm_gemm_nn9w_combproc: PROCESS (chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_j)
    BEGIN
        -- Begin reserved scope level
        CASE (chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_j) IS
            WHEN "0000" => rDigit_8_uid254_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "0001" => rDigit_8_uid254_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "0010" => rDigit_8_uid254_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "0011" => rDigit_8_uid254_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "0100" => rDigit_8_uid254_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "0101" => rDigit_8_uid254_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "0110" => rDigit_8_uid254_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "0111" => rDigit_8_uid254_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "1000" => rDigit_8_uid254_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "1001" => rDigit_8_uid254_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "1010" => rDigit_8_uid254_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "1011" => rDigit_8_uid254_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "1100" => rDigit_8_uid254_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "1101" => rDigit_8_uid254_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "1110" => rDigit_8_uid254_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "1111" => rDigit_8_uid254_i_div_rm_gemm_nn9w_q <= "00";
            WHEN OTHERS => -- unreachable
                           rDigit_8_uid254_i_div_rm_gemm_nn9w_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- y_7_uid257_i_div_rm_gemm_nn9w(BITJOIN,256)@2
    y_7_uid257_i_div_rm_gemm_nn9w_q <= rDigit_8_uid254_i_div_rm_gemm_nn9w_q & chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_i;

    -- qDigit_7_uid258_i_div_rm_gemm_nn9w(LOOKUP,257)@2 + 1
    qDigit_7_uid258_i_div_rm_gemm_nn9w_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (y_7_uid257_i_div_rm_gemm_nn9w_q) IS
                WHEN "000000" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0000";
                WHEN "000001" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0000";
                WHEN "000010" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0000";
                WHEN "000011" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0001";
                WHEN "000100" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0001";
                WHEN "000101" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0001";
                WHEN "000110" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0010";
                WHEN "000111" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0010";
                WHEN "001000" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0010";
                WHEN "001001" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0011";
                WHEN "001010" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0011";
                WHEN "001011" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0011";
                WHEN "001100" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0100";
                WHEN "001101" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0100";
                WHEN "001110" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0100";
                WHEN "001111" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0101";
                WHEN "010000" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0101";
                WHEN "010001" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0101";
                WHEN "010010" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0110";
                WHEN "010011" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0110";
                WHEN "010100" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0110";
                WHEN "010101" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0111";
                WHEN "010110" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0111";
                WHEN "010111" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "0111";
                WHEN "011000" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1000";
                WHEN "011001" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1000";
                WHEN "011010" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1000";
                WHEN "011011" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1001";
                WHEN "011100" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1001";
                WHEN "011101" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1001";
                WHEN "011110" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1010";
                WHEN "011111" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1010";
                WHEN "100000" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1010";
                WHEN "100001" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1011";
                WHEN "100010" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1011";
                WHEN "100011" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1011";
                WHEN "100100" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1100";
                WHEN "100101" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1100";
                WHEN "100110" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1100";
                WHEN "100111" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1101";
                WHEN "101000" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1101";
                WHEN "101001" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1101";
                WHEN "101010" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1110";
                WHEN "101011" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1110";
                WHEN "101100" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1110";
                WHEN "101101" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1111";
                WHEN "101110" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1111";
                WHEN "101111" => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= "1111";
                WHEN OTHERS => qDigit_7_uid258_i_div_rm_gemm_nn9w_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- redist21_qDigit_7_uid258_i_div_rm_gemm_nn9w_q_2(DELAY,420)
    redist21_qDigit_7_uid258_i_div_rm_gemm_nn9w_q_2 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => qDigit_7_uid258_i_div_rm_gemm_nn9w_q, xout => redist21_qDigit_7_uid258_i_div_rm_gemm_nn9w_q_2_q, clk => clock, aclr => resetn );

    -- rDigit_7_uid261_i_div_rm_gemm_nn9w(LOOKUP,260)@2
    rDigit_7_uid261_i_div_rm_gemm_nn9w_combproc: PROCESS (y_7_uid257_i_div_rm_gemm_nn9w_q)
    BEGIN
        -- Begin reserved scope level
        CASE (y_7_uid257_i_div_rm_gemm_nn9w_q) IS
            WHEN "000000" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "000001" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "000010" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "000011" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "000100" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "000101" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "000110" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "000111" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "001000" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "001001" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "001010" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "001011" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "001100" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "001101" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "001110" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "001111" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "010000" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "010001" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "010010" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "010011" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "010100" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "010101" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "010110" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "010111" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "011000" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "011001" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "011010" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "011011" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "011100" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "011101" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "011110" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "011111" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "100000" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "100001" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "100010" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "100011" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "100100" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "100101" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "100110" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "100111" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "101000" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "101001" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "101010" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "101011" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "101100" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "101101" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "101110" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "101111" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "110000" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "110001" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "110010" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "110011" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "110100" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "110101" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "110110" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "110111" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "111000" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "111001" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "111010" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "111011" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "111100" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "111101" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "111110" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "111111" => rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= "00";
            WHEN OTHERS => -- unreachable
                           rDigit_7_uid261_i_div_rm_gemm_nn9w_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- y_6_uid264_i_div_rm_gemm_nn9w(BITJOIN,263)@2
    y_6_uid264_i_div_rm_gemm_nn9w_q <= rDigit_7_uid261_i_div_rm_gemm_nn9w_q & chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_h;

    -- qDigit_6_uid265_i_div_rm_gemm_nn9w(LOOKUP,264)@2 + 1
    qDigit_6_uid265_i_div_rm_gemm_nn9w_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (y_6_uid264_i_div_rm_gemm_nn9w_q) IS
                WHEN "000000" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0000";
                WHEN "000001" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0000";
                WHEN "000010" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0000";
                WHEN "000011" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0001";
                WHEN "000100" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0001";
                WHEN "000101" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0001";
                WHEN "000110" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0010";
                WHEN "000111" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0010";
                WHEN "001000" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0010";
                WHEN "001001" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0011";
                WHEN "001010" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0011";
                WHEN "001011" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0011";
                WHEN "001100" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0100";
                WHEN "001101" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0100";
                WHEN "001110" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0100";
                WHEN "001111" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0101";
                WHEN "010000" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0101";
                WHEN "010001" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0101";
                WHEN "010010" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0110";
                WHEN "010011" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0110";
                WHEN "010100" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0110";
                WHEN "010101" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0111";
                WHEN "010110" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0111";
                WHEN "010111" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "0111";
                WHEN "011000" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1000";
                WHEN "011001" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1000";
                WHEN "011010" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1000";
                WHEN "011011" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1001";
                WHEN "011100" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1001";
                WHEN "011101" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1001";
                WHEN "011110" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1010";
                WHEN "011111" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1010";
                WHEN "100000" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1010";
                WHEN "100001" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1011";
                WHEN "100010" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1011";
                WHEN "100011" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1011";
                WHEN "100100" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1100";
                WHEN "100101" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1100";
                WHEN "100110" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1100";
                WHEN "100111" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1101";
                WHEN "101000" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1101";
                WHEN "101001" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1101";
                WHEN "101010" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1110";
                WHEN "101011" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1110";
                WHEN "101100" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1110";
                WHEN "101101" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1111";
                WHEN "101110" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1111";
                WHEN "101111" => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= "1111";
                WHEN OTHERS => qDigit_6_uid265_i_div_rm_gemm_nn9w_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- redist20_qDigit_6_uid265_i_div_rm_gemm_nn9w_q_2(DELAY,419)
    redist20_qDigit_6_uid265_i_div_rm_gemm_nn9w_q_2 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => qDigit_6_uid265_i_div_rm_gemm_nn9w_q, xout => redist20_qDigit_6_uid265_i_div_rm_gemm_nn9w_q_2_q, clk => clock, aclr => resetn );

    -- rDigit_6_uid268_i_div_rm_gemm_nn9w(LOOKUP,267)@2 + 1
    rDigit_6_uid268_i_div_rm_gemm_nn9w_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (y_6_uid264_i_div_rm_gemm_nn9w_q) IS
                WHEN "000000" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "000001" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "000010" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "000011" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "000100" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "000101" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "000110" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "000111" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "001000" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "001001" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "001010" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "001011" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "001100" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "001101" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "001110" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "001111" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "010000" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "010001" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "010010" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "010011" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "010100" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "010101" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "010110" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "010111" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "011000" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "011001" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "011010" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "011011" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "011100" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "011101" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "011110" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "011111" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "100000" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "100001" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "100010" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "100011" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "100100" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "100101" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "100110" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "100111" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "101000" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "101001" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "101010" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "101011" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "101100" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "101101" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "101110" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "101111" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "110000" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "110001" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "110010" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "110011" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "110100" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "110101" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "110110" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "110111" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "111000" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "111001" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "111010" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "111011" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "111100" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "111101" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "111110" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "111111" => rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= "00";
                WHEN OTHERS => -- unreachable
                               rDigit_6_uid268_i_div_rm_gemm_nn9w_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- redist5_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_g_1(DELAY,404)
    redist5_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_g_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_g, xout => redist5_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_g_1_q, clk => clock, aclr => resetn );

    -- y_5_uid271_i_div_rm_gemm_nn9w(BITJOIN,270)@3
    y_5_uid271_i_div_rm_gemm_nn9w_q <= rDigit_6_uid268_i_div_rm_gemm_nn9w_q & redist5_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_g_1_q;

    -- qDigit_5_uid272_i_div_rm_gemm_nn9w(LOOKUP,271)@3 + 1
    qDigit_5_uid272_i_div_rm_gemm_nn9w_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (y_5_uid271_i_div_rm_gemm_nn9w_q) IS
                WHEN "000000" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0000";
                WHEN "000001" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0000";
                WHEN "000010" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0000";
                WHEN "000011" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0001";
                WHEN "000100" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0001";
                WHEN "000101" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0001";
                WHEN "000110" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0010";
                WHEN "000111" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0010";
                WHEN "001000" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0010";
                WHEN "001001" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0011";
                WHEN "001010" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0011";
                WHEN "001011" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0011";
                WHEN "001100" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0100";
                WHEN "001101" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0100";
                WHEN "001110" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0100";
                WHEN "001111" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0101";
                WHEN "010000" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0101";
                WHEN "010001" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0101";
                WHEN "010010" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0110";
                WHEN "010011" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0110";
                WHEN "010100" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0110";
                WHEN "010101" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0111";
                WHEN "010110" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0111";
                WHEN "010111" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "0111";
                WHEN "011000" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1000";
                WHEN "011001" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1000";
                WHEN "011010" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1000";
                WHEN "011011" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1001";
                WHEN "011100" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1001";
                WHEN "011101" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1001";
                WHEN "011110" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1010";
                WHEN "011111" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1010";
                WHEN "100000" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1010";
                WHEN "100001" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1011";
                WHEN "100010" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1011";
                WHEN "100011" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1011";
                WHEN "100100" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1100";
                WHEN "100101" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1100";
                WHEN "100110" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1100";
                WHEN "100111" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1101";
                WHEN "101000" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1101";
                WHEN "101001" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1101";
                WHEN "101010" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1110";
                WHEN "101011" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1110";
                WHEN "101100" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1110";
                WHEN "101101" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1111";
                WHEN "101110" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1111";
                WHEN "101111" => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= "1111";
                WHEN OTHERS => qDigit_5_uid272_i_div_rm_gemm_nn9w_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- rDigit_5_uid275_i_div_rm_gemm_nn9w(LOOKUP,274)@3
    rDigit_5_uid275_i_div_rm_gemm_nn9w_combproc: PROCESS (y_5_uid271_i_div_rm_gemm_nn9w_q)
    BEGIN
        -- Begin reserved scope level
        CASE (y_5_uid271_i_div_rm_gemm_nn9w_q) IS
            WHEN "000000" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "000001" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "000010" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "000011" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "000100" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "000101" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "000110" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "000111" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "001000" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "001001" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "001010" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "001011" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "001100" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "001101" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "001110" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "001111" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "010000" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "010001" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "010010" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "010011" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "010100" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "010101" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "010110" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "010111" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "011000" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "011001" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "011010" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "011011" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "011100" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "011101" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "011110" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "011111" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "100000" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "100001" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "100010" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "100011" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "100100" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "100101" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "100110" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "100111" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "101000" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "101001" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "101010" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "101011" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "101100" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "101101" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "101110" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "101111" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "110000" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "110001" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "110010" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "110011" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "110100" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "110101" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "110110" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "110111" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "111000" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "111001" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "111010" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "111011" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "111100" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "111101" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "111110" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "111111" => rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= "00";
            WHEN OTHERS => -- unreachable
                           rDigit_5_uid275_i_div_rm_gemm_nn9w_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- redist4_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_f_1(DELAY,403)
    redist4_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_f_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_f, xout => redist4_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_f_1_q, clk => clock, aclr => resetn );

    -- y_4_uid278_i_div_rm_gemm_nn9w(BITJOIN,277)@3
    y_4_uid278_i_div_rm_gemm_nn9w_q <= rDigit_5_uid275_i_div_rm_gemm_nn9w_q & redist4_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_f_1_q;

    -- qDigit_4_uid279_i_div_rm_gemm_nn9w(LOOKUP,278)@3 + 1
    qDigit_4_uid279_i_div_rm_gemm_nn9w_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (y_4_uid278_i_div_rm_gemm_nn9w_q) IS
                WHEN "000000" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0000";
                WHEN "000001" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0000";
                WHEN "000010" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0000";
                WHEN "000011" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0001";
                WHEN "000100" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0001";
                WHEN "000101" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0001";
                WHEN "000110" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0010";
                WHEN "000111" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0010";
                WHEN "001000" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0010";
                WHEN "001001" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0011";
                WHEN "001010" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0011";
                WHEN "001011" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0011";
                WHEN "001100" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0100";
                WHEN "001101" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0100";
                WHEN "001110" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0100";
                WHEN "001111" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0101";
                WHEN "010000" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0101";
                WHEN "010001" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0101";
                WHEN "010010" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0110";
                WHEN "010011" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0110";
                WHEN "010100" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0110";
                WHEN "010101" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0111";
                WHEN "010110" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0111";
                WHEN "010111" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "0111";
                WHEN "011000" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1000";
                WHEN "011001" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1000";
                WHEN "011010" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1000";
                WHEN "011011" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1001";
                WHEN "011100" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1001";
                WHEN "011101" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1001";
                WHEN "011110" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1010";
                WHEN "011111" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1010";
                WHEN "100000" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1010";
                WHEN "100001" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1011";
                WHEN "100010" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1011";
                WHEN "100011" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1011";
                WHEN "100100" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1100";
                WHEN "100101" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1100";
                WHEN "100110" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1100";
                WHEN "100111" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1101";
                WHEN "101000" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1101";
                WHEN "101001" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1101";
                WHEN "101010" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1110";
                WHEN "101011" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1110";
                WHEN "101100" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1110";
                WHEN "101101" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1111";
                WHEN "101110" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1111";
                WHEN "101111" => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= "1111";
                WHEN OTHERS => qDigit_4_uid279_i_div_rm_gemm_nn9w_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- rDigit_4_uid282_i_div_rm_gemm_nn9w(LOOKUP,281)@3 + 1
    rDigit_4_uid282_i_div_rm_gemm_nn9w_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (y_4_uid278_i_div_rm_gemm_nn9w_q) IS
                WHEN "000000" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "000001" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "000010" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "000011" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "000100" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "000101" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "000110" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "000111" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "001000" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "001001" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "001010" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "001011" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "001100" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "001101" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "001110" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "001111" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "010000" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "010001" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "010010" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "010011" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "010100" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "010101" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "010110" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "010111" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "011000" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "011001" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "011010" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "011011" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "011100" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "011101" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "011110" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "011111" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "100000" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "100001" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "100010" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "100011" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "100100" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "100101" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "100110" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "100111" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "101000" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "101001" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "101010" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "101011" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "101100" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "101101" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "101110" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "101111" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "110000" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "110001" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "110010" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "110011" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "110100" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "110101" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "110110" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "110111" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "111000" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "111001" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "111010" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "111011" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "111100" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN "111101" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "01";
                WHEN "111110" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "10";
                WHEN "111111" => rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= "00";
                WHEN OTHERS => -- unreachable
                               rDigit_4_uid282_i_div_rm_gemm_nn9w_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- redist3_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_e_2(DELAY,402)
    redist3_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_e_2 : dspba_delay
    GENERIC MAP ( width => 4, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_e, xout => redist3_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_e_2_q, clk => clock, aclr => resetn );

    -- y_3_uid285_i_div_rm_gemm_nn9w(BITJOIN,284)@4
    y_3_uid285_i_div_rm_gemm_nn9w_q <= rDigit_4_uid282_i_div_rm_gemm_nn9w_q & redist3_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_e_2_q;

    -- qDigit_3_uid286_i_div_rm_gemm_nn9w(LOOKUP,285)@4
    qDigit_3_uid286_i_div_rm_gemm_nn9w_combproc: PROCESS (y_3_uid285_i_div_rm_gemm_nn9w_q)
    BEGIN
        -- Begin reserved scope level
        CASE (y_3_uid285_i_div_rm_gemm_nn9w_q) IS
            WHEN "000000" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0000";
            WHEN "000001" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0000";
            WHEN "000010" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0000";
            WHEN "000011" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0001";
            WHEN "000100" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0001";
            WHEN "000101" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0001";
            WHEN "000110" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0010";
            WHEN "000111" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0010";
            WHEN "001000" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0010";
            WHEN "001001" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0011";
            WHEN "001010" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0011";
            WHEN "001011" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0011";
            WHEN "001100" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0100";
            WHEN "001101" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0100";
            WHEN "001110" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0100";
            WHEN "001111" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0101";
            WHEN "010000" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0101";
            WHEN "010001" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0101";
            WHEN "010010" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0110";
            WHEN "010011" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0110";
            WHEN "010100" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0110";
            WHEN "010101" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0111";
            WHEN "010110" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0111";
            WHEN "010111" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "0111";
            WHEN "011000" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1000";
            WHEN "011001" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1000";
            WHEN "011010" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1000";
            WHEN "011011" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1001";
            WHEN "011100" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1001";
            WHEN "011101" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1001";
            WHEN "011110" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1010";
            WHEN "011111" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1010";
            WHEN "100000" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1010";
            WHEN "100001" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1011";
            WHEN "100010" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1011";
            WHEN "100011" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1011";
            WHEN "100100" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1100";
            WHEN "100101" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1100";
            WHEN "100110" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1100";
            WHEN "100111" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1101";
            WHEN "101000" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1101";
            WHEN "101001" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1101";
            WHEN "101010" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1110";
            WHEN "101011" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1110";
            WHEN "101100" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1110";
            WHEN "101101" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1111";
            WHEN "101110" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1111";
            WHEN "101111" => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= "1111";
            WHEN OTHERS => qDigit_3_uid286_i_div_rm_gemm_nn9w_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- rDigit_3_uid289_i_div_rm_gemm_nn9w(LOOKUP,288)@4
    rDigit_3_uid289_i_div_rm_gemm_nn9w_combproc: PROCESS (y_3_uid285_i_div_rm_gemm_nn9w_q)
    BEGIN
        -- Begin reserved scope level
        CASE (y_3_uid285_i_div_rm_gemm_nn9w_q) IS
            WHEN "000000" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "000001" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "000010" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "000011" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "000100" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "000101" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "000110" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "000111" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "001000" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "001001" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "001010" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "001011" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "001100" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "001101" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "001110" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "001111" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "010000" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "010001" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "010010" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "010011" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "010100" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "010101" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "010110" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "010111" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "011000" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "011001" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "011010" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "011011" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "011100" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "011101" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "011110" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "011111" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "100000" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "100001" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "100010" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "100011" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "100100" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "100101" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "100110" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "100111" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "101000" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "101001" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "101010" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "101011" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "101100" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "101101" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "101110" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "101111" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "110000" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "110001" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "110010" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "110011" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "110100" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "110101" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "110110" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "110111" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "111000" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "111001" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "111010" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "111011" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "111100" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "111101" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "111110" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "111111" => rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= "00";
            WHEN OTHERS => -- unreachable
                           rDigit_3_uid289_i_div_rm_gemm_nn9w_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- redist2_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_d_2(DELAY,401)
    redist2_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_d_2 : dspba_delay
    GENERIC MAP ( width => 4, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_d, xout => redist2_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_d_2_q, clk => clock, aclr => resetn );

    -- y_2_uid292_i_div_rm_gemm_nn9w(BITJOIN,291)@4
    y_2_uid292_i_div_rm_gemm_nn9w_q <= rDigit_3_uid289_i_div_rm_gemm_nn9w_q & redist2_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_d_2_q;

    -- qDigit_2_uid293_i_div_rm_gemm_nn9w(LOOKUP,292)@4
    qDigit_2_uid293_i_div_rm_gemm_nn9w_combproc: PROCESS (y_2_uid292_i_div_rm_gemm_nn9w_q)
    BEGIN
        -- Begin reserved scope level
        CASE (y_2_uid292_i_div_rm_gemm_nn9w_q) IS
            WHEN "000000" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0000";
            WHEN "000001" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0000";
            WHEN "000010" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0000";
            WHEN "000011" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0001";
            WHEN "000100" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0001";
            WHEN "000101" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0001";
            WHEN "000110" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0010";
            WHEN "000111" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0010";
            WHEN "001000" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0010";
            WHEN "001001" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0011";
            WHEN "001010" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0011";
            WHEN "001011" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0011";
            WHEN "001100" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0100";
            WHEN "001101" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0100";
            WHEN "001110" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0100";
            WHEN "001111" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0101";
            WHEN "010000" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0101";
            WHEN "010001" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0101";
            WHEN "010010" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0110";
            WHEN "010011" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0110";
            WHEN "010100" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0110";
            WHEN "010101" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0111";
            WHEN "010110" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0111";
            WHEN "010111" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "0111";
            WHEN "011000" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1000";
            WHEN "011001" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1000";
            WHEN "011010" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1000";
            WHEN "011011" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1001";
            WHEN "011100" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1001";
            WHEN "011101" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1001";
            WHEN "011110" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1010";
            WHEN "011111" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1010";
            WHEN "100000" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1010";
            WHEN "100001" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1011";
            WHEN "100010" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1011";
            WHEN "100011" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1011";
            WHEN "100100" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1100";
            WHEN "100101" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1100";
            WHEN "100110" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1100";
            WHEN "100111" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1101";
            WHEN "101000" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1101";
            WHEN "101001" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1101";
            WHEN "101010" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1110";
            WHEN "101011" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1110";
            WHEN "101100" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1110";
            WHEN "101101" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1111";
            WHEN "101110" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1111";
            WHEN "101111" => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= "1111";
            WHEN OTHERS => qDigit_2_uid293_i_div_rm_gemm_nn9w_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- rDigit_2_uid296_i_div_rm_gemm_nn9w(LOOKUP,295)@4
    rDigit_2_uid296_i_div_rm_gemm_nn9w_combproc: PROCESS (y_2_uid292_i_div_rm_gemm_nn9w_q)
    BEGIN
        -- Begin reserved scope level
        CASE (y_2_uid292_i_div_rm_gemm_nn9w_q) IS
            WHEN "000000" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "000001" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "000010" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "000011" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "000100" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "000101" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "000110" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "000111" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "001000" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "001001" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "001010" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "001011" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "001100" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "001101" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "001110" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "001111" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "010000" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "010001" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "010010" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "010011" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "010100" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "010101" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "010110" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "010111" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "011000" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "011001" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "011010" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "011011" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "011100" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "011101" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "011110" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "011111" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "100000" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "100001" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "100010" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "100011" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "100100" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "100101" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "100110" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "100111" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "101000" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "101001" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "101010" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "101011" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "101100" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "101101" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "101110" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "101111" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "110000" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "110001" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "110010" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "110011" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "110100" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "110101" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "110110" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "110111" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "111000" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "111001" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "111010" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "111011" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "111100" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "111101" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "111110" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "111111" => rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= "00";
            WHEN OTHERS => -- unreachable
                           rDigit_2_uid296_i_div_rm_gemm_nn9w_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- redist1_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_c_2(DELAY,400)
    redist1_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_c_2 : dspba_delay
    GENERIC MAP ( width => 4, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_c, xout => redist1_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_c_2_q, clk => clock, aclr => resetn );

    -- y_1_uid299_i_div_rm_gemm_nn9w(BITJOIN,298)@4
    y_1_uid299_i_div_rm_gemm_nn9w_q <= rDigit_2_uid296_i_div_rm_gemm_nn9w_q & redist1_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_c_2_q;

    -- qDigit_1_uid300_i_div_rm_gemm_nn9w(LOOKUP,299)@4
    qDigit_1_uid300_i_div_rm_gemm_nn9w_combproc: PROCESS (y_1_uid299_i_div_rm_gemm_nn9w_q)
    BEGIN
        -- Begin reserved scope level
        CASE (y_1_uid299_i_div_rm_gemm_nn9w_q) IS
            WHEN "000000" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0000";
            WHEN "000001" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0000";
            WHEN "000010" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0000";
            WHEN "000011" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0001";
            WHEN "000100" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0001";
            WHEN "000101" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0001";
            WHEN "000110" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0010";
            WHEN "000111" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0010";
            WHEN "001000" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0010";
            WHEN "001001" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0011";
            WHEN "001010" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0011";
            WHEN "001011" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0011";
            WHEN "001100" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0100";
            WHEN "001101" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0100";
            WHEN "001110" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0100";
            WHEN "001111" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0101";
            WHEN "010000" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0101";
            WHEN "010001" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0101";
            WHEN "010010" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0110";
            WHEN "010011" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0110";
            WHEN "010100" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0110";
            WHEN "010101" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0111";
            WHEN "010110" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0111";
            WHEN "010111" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "0111";
            WHEN "011000" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1000";
            WHEN "011001" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1000";
            WHEN "011010" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1000";
            WHEN "011011" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1001";
            WHEN "011100" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1001";
            WHEN "011101" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1001";
            WHEN "011110" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1010";
            WHEN "011111" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1010";
            WHEN "100000" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1010";
            WHEN "100001" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1011";
            WHEN "100010" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1011";
            WHEN "100011" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1011";
            WHEN "100100" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1100";
            WHEN "100101" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1100";
            WHEN "100110" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1100";
            WHEN "100111" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1101";
            WHEN "101000" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1101";
            WHEN "101001" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1101";
            WHEN "101010" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1110";
            WHEN "101011" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1110";
            WHEN "101100" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1110";
            WHEN "101101" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1111";
            WHEN "101110" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1111";
            WHEN "101111" => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= "1111";
            WHEN OTHERS => qDigit_1_uid300_i_div_rm_gemm_nn9w_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- rDigit_1_uid303_i_div_rm_gemm_nn9w(LOOKUP,302)@4
    rDigit_1_uid303_i_div_rm_gemm_nn9w_combproc: PROCESS (y_1_uid299_i_div_rm_gemm_nn9w_q)
    BEGIN
        -- Begin reserved scope level
        CASE (y_1_uid299_i_div_rm_gemm_nn9w_q) IS
            WHEN "000000" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "000001" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "000010" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "000011" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "000100" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "000101" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "000110" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "000111" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "001000" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "001001" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "001010" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "001011" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "001100" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "001101" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "001110" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "001111" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "010000" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "010001" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "010010" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "010011" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "010100" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "010101" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "010110" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "010111" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "011000" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "011001" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "011010" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "011011" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "011100" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "011101" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "011110" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "011111" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "100000" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "100001" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "100010" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "100011" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "100100" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "100101" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "100110" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "100111" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "101000" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "101001" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "101010" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "101011" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "101100" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "101101" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "101110" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "101111" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "110000" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "110001" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "110010" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "110011" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "110100" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "110101" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "110110" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "110111" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "111000" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "111001" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "111010" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "111011" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "111100" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN "111101" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "01";
            WHEN "111110" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "10";
            WHEN "111111" => rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= "00";
            WHEN OTHERS => -- unreachable
                           rDigit_1_uid303_i_div_rm_gemm_nn9w_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- redist0_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_b_2(DELAY,399)
    redist0_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_b_2 : dspba_delay
    GENERIC MAP ( width => 4, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_b, xout => redist0_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_b_2_q, clk => clock, aclr => resetn );

    -- y_0_uid306_i_div_rm_gemm_nn9w(BITJOIN,305)@4
    y_0_uid306_i_div_rm_gemm_nn9w_q <= rDigit_1_uid303_i_div_rm_gemm_nn9w_q & redist0_chunk_x_0_uid242_i_div_rm_gemm_nn9w_merged_bit_select_b_2_q;

    -- qDigit_0_uid307_i_div_rm_gemm_nn9w(LOOKUP,306)@4
    qDigit_0_uid307_i_div_rm_gemm_nn9w_combproc: PROCESS (y_0_uid306_i_div_rm_gemm_nn9w_q)
    BEGIN
        -- Begin reserved scope level
        CASE (y_0_uid306_i_div_rm_gemm_nn9w_q) IS
            WHEN "000000" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0000";
            WHEN "000001" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0000";
            WHEN "000010" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0000";
            WHEN "000011" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0001";
            WHEN "000100" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0001";
            WHEN "000101" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0001";
            WHEN "000110" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0010";
            WHEN "000111" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0010";
            WHEN "001000" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0010";
            WHEN "001001" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0011";
            WHEN "001010" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0011";
            WHEN "001011" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0011";
            WHEN "001100" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0100";
            WHEN "001101" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0100";
            WHEN "001110" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0100";
            WHEN "001111" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0101";
            WHEN "010000" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0101";
            WHEN "010001" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0101";
            WHEN "010010" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0110";
            WHEN "010011" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0110";
            WHEN "010100" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0110";
            WHEN "010101" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0111";
            WHEN "010110" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0111";
            WHEN "010111" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "0111";
            WHEN "011000" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1000";
            WHEN "011001" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1000";
            WHEN "011010" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1000";
            WHEN "011011" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1001";
            WHEN "011100" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1001";
            WHEN "011101" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1001";
            WHEN "011110" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1010";
            WHEN "011111" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1010";
            WHEN "100000" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1010";
            WHEN "100001" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1011";
            WHEN "100010" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1011";
            WHEN "100011" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1011";
            WHEN "100100" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1100";
            WHEN "100101" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1100";
            WHEN "100110" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1100";
            WHEN "100111" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1101";
            WHEN "101000" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1101";
            WHEN "101001" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1101";
            WHEN "101010" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1110";
            WHEN "101011" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1110";
            WHEN "101100" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1110";
            WHEN "101101" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1111";
            WHEN "101110" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1111";
            WHEN "101111" => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= "1111";
            WHEN OTHERS => qDigit_0_uid307_i_div_rm_gemm_nn9w_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- resFinalIntDiv_uid313_i_div_rm_gemm_nn9w(BITJOIN,312)@4
    resFinalIntDiv_uid313_i_div_rm_gemm_nn9w_q <= qDigit_8_uid251_i_div_rm_gemm_nn9w_q & redist21_qDigit_7_uid258_i_div_rm_gemm_nn9w_q_2_q & redist20_qDigit_6_uid265_i_div_rm_gemm_nn9w_q_2_q & qDigit_5_uid272_i_div_rm_gemm_nn9w_q & qDigit_4_uid279_i_div_rm_gemm_nn9w_q & qDigit_3_uid286_i_div_rm_gemm_nn9w_q & qDigit_2_uid293_i_div_rm_gemm_nn9w_q & qDigit_1_uid300_i_div_rm_gemm_nn9w_q & qDigit_0_uid307_i_div_rm_gemm_nn9w_q;

    -- resFinalIntDivCmpRange_uid314_i_div_rm_gemm_nn9w(BITSELECT,313)@4
    resFinalIntDivCmpRange_uid314_i_div_rm_gemm_nn9w_in <= STD_LOGIC_VECTOR(resFinalIntDiv_uid313_i_div_rm_gemm_nn9w_q(31 downto 0));
    resFinalIntDivCmpRange_uid314_i_div_rm_gemm_nn9w_b <= STD_LOGIC_VECTOR(resFinalIntDivCmpRange_uid314_i_div_rm_gemm_nn9w_in(31 downto 0));

    -- redist19_resFinalIntDivCmpRange_uid314_i_div_rm_gemm_nn9w_b_1(DELAY,418)
    redist19_resFinalIntDivCmpRange_uid314_i_div_rm_gemm_nn9w_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => resFinalIntDivCmpRange_uid314_i_div_rm_gemm_nn9w_b, xout => redist19_resFinalIntDivCmpRange_uid314_i_div_rm_gemm_nn9w_b_1_q, clk => clock, aclr => resetn );

    -- resFinalIntDivCmpOC_uid315_i_div_rm_gemm_nn9w(LOGICAL,314)@5
    resFinalIntDivCmpOC_uid315_i_div_rm_gemm_nn9w_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 1 => redist23_signX_uid236_i_div_rm_gemm_nn9w_b_4_q(0)) & redist23_signX_uid236_i_div_rm_gemm_nn9w_b_4_q));
    resFinalIntDivCmpOC_uid315_i_div_rm_gemm_nn9w_q <= redist19_resFinalIntDivCmpRange_uid314_i_div_rm_gemm_nn9w_b_1_q xor resFinalIntDivCmpOC_uid315_i_div_rm_gemm_nn9w_b;

    -- resFinalIntDivCmpTC_uid316_i_div_rm_gemm_nn9w(ADD,315)@5
    resFinalIntDivCmpTC_uid316_i_div_rm_gemm_nn9w_a <= STD_LOGIC_VECTOR("0" & resFinalIntDivCmpOC_uid315_i_div_rm_gemm_nn9w_q);
    resFinalIntDivCmpTC_uid316_i_div_rm_gemm_nn9w_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000" & redist23_signX_uid236_i_div_rm_gemm_nn9w_b_4_q);
    resFinalIntDivCmpTC_uid316_i_div_rm_gemm_nn9w_o <= STD_LOGIC_VECTOR(UNSIGNED(resFinalIntDivCmpTC_uid316_i_div_rm_gemm_nn9w_a) + UNSIGNED(resFinalIntDivCmpTC_uid316_i_div_rm_gemm_nn9w_b));
    resFinalIntDivCmpTC_uid316_i_div_rm_gemm_nn9w_q <= resFinalIntDivCmpTC_uid316_i_div_rm_gemm_nn9w_o(32 downto 0);

    -- resFinalIntDiv_uid317_i_div_rm_gemm_nn9w(BITSELECT,316)@5
    resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_in <= STD_LOGIC_VECTOR(resFinalIntDivCmpTC_uid316_i_div_rm_gemm_nn9w_q(31 downto 0));
    resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b <= STD_LOGIC_VECTOR(resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_in(31 downto 0));

    -- redist17_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_1(DELAY,416)
    redist17_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b, xout => redist17_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_1_q, clk => clock, aclr => resetn );

    -- c_i32_3gr(CONSTANT,66)
    c_i32_3gr_q <= "00000000000000000000000000000011";

    -- i_acl_push_i32_k_169_push26_gemm_nn9w(BLACKBOX,89)@6
    -- out out_feedback_out_26@20000000
    -- out out_feedback_valid_out_26@20000000
    thei_acl_push_i32_k_169_push26_gemm_nn9w : i_acl_push_i32_k_169_push26_gemm_nn9w77
    PORT MAP (
        in_data_in => redist61_bgTrunc_i_add22_gemm_nn9w_sel_x_b_1_q,
        in_feedback_stall_in_26 => i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_feedback_stall_out_26,
        in_keep_going => redist48_i_acl_pipeline_keep_going_gemm_nn9w_out_data_out_5_q,
        in_stall_in => GND_q,
        in_valid_in => redist55_sync_in_aunroll_x_in_i_valid_5_q,
        out_feedback_out_26 => i_acl_push_i32_k_169_push26_gemm_nn9w_out_feedback_out_26,
        out_feedback_valid_out_26 => i_acl_push_i32_k_169_push26_gemm_nn9w_out_feedback_valid_out_26,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_0gr(CONSTANT,64)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- i_acl_pop_i32_k_169_pop26_gemm_nn9w(BLACKBOX,78)@5
    -- out out_feedback_stall_out_26@20000000
    thei_acl_pop_i32_k_169_pop26_gemm_nn9w : i_acl_pop_i32_k_169_pop26_gemm_nn9w59
    PORT MAP (
        in_data_in => c_i32_0gr_q,
        in_dir => redist50_sync_in_aunroll_x_in_c0_eni7_1_4_q,
        in_feedback_in_26 => i_acl_push_i32_k_169_push26_gemm_nn9w_out_feedback_out_26,
        in_feedback_valid_in_26 => i_acl_push_i32_k_169_push26_gemm_nn9w_out_feedback_valid_out_26,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist54_sync_in_aunroll_x_in_i_valid_4_q,
        out_data_out => i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out,
        out_feedback_stall_out_26 => i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_feedback_stall_out_26,
        clock => clock,
        resetn => resetn
    );

    -- i_add22_gemm_nn9w(ADD,93)@5
    i_add22_gemm_nn9w_a <= STD_LOGIC_VECTOR("0" & i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out);
    i_add22_gemm_nn9w_b <= STD_LOGIC_VECTOR("0" & c_i32_3gr_q);
    i_add22_gemm_nn9w_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add22_gemm_nn9w_a) + UNSIGNED(i_add22_gemm_nn9w_b));
    i_add22_gemm_nn9w_q <= i_add22_gemm_nn9w_o(32 downto 0);

    -- bgTrunc_i_add22_gemm_nn9w_sel_x(BITSELECT,2)@5
    bgTrunc_i_add22_gemm_nn9w_sel_x_b <= i_add22_gemm_nn9w_q(31 downto 0);

    -- redist61_bgTrunc_i_add22_gemm_nn9w_sel_x_b_1(DELAY,460)
    redist61_bgTrunc_i_add22_gemm_nn9w_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add22_gemm_nn9w_sel_x_b, xout => redist61_bgTrunc_i_add22_gemm_nn9w_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_cmp3_gemm_nn9w(COMPARE,100)@6
    i_cmp3_gemm_nn9w_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist61_bgTrunc_i_add22_gemm_nn9w_sel_x_b_1_q(31)) & redist61_bgTrunc_i_add22_gemm_nn9w_sel_x_b_1_q));
    i_cmp3_gemm_nn9w_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => redist17_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_1_q(31)) & redist17_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_1_q));
    i_cmp3_gemm_nn9w_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp3_gemm_nn9w_a) - SIGNED(i_cmp3_gemm_nn9w_b));
    i_cmp3_gemm_nn9w_c(0) <= i_cmp3_gemm_nn9w_o(33);

    -- i_syncbuf_k_sync_buffer_gemm_nn9w(BLACKBOX,122)@0
    -- in in_i_dependence@5
    -- in in_valid_in@5
    -- out out_buffer_out@5
    -- out out_valid_out@5
    thei_syncbuf_k_sync_buffer_gemm_nn9w : i_syncbuf_k_sync_buffer_gemm_nn9w69
    PORT MAP (
        in_buffer_in => in_K,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist54_sync_in_aunroll_x_in_i_valid_4_q,
        out_buffer_out => i_syncbuf_k_sync_buffer_gemm_nn9w_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_2gr(CONSTANT,65)
    c_i32_2gr_q <= "00000000000000000000000000000010";

    -- i_cmp367_rm_gemm_nn9w(COMPARE,99)@5 + 1
    i_cmp367_rm_gemm_nn9w_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_2gr_q(31)) & c_i32_2gr_q));
    i_cmp367_rm_gemm_nn9w_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_k_sync_buffer_gemm_nn9w_out_buffer_out(31)) & i_syncbuf_k_sync_buffer_gemm_nn9w_out_buffer_out));
    i_cmp367_rm_gemm_nn9w_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp367_rm_gemm_nn9w_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp367_rm_gemm_nn9w_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp367_rm_gemm_nn9w_a) - SIGNED(i_cmp367_rm_gemm_nn9w_b));
        END IF;
    END PROCESS;
    i_cmp367_rm_gemm_nn9w_c(0) <= i_cmp367_rm_gemm_nn9w_o(33);

    -- i_syncbuf_n_sync_buffer283_gemm_nn9w(BLACKBOX,123)@0
    -- in in_i_dependence@5
    -- in in_valid_in@5
    -- out out_buffer_out@5
    -- out out_valid_out@5
    thei_syncbuf_n_sync_buffer283_gemm_nn9w : i_syncbuf_n_sync_buffer283_gemm_nn9w66
    PORT MAP (
        in_buffer_in => in_N,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist54_sync_in_aunroll_x_in_i_valid_4_q,
        out_buffer_out => i_syncbuf_n_sync_buffer283_gemm_nn9w_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_cmp75_rm_gemm_nn9w(COMPARE,101)@5 + 1
    i_cmp75_rm_gemm_nn9w_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_0gr_q(31)) & c_i32_0gr_q));
    i_cmp75_rm_gemm_nn9w_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_n_sync_buffer283_gemm_nn9w_out_buffer_out(31)) & i_syncbuf_n_sync_buffer283_gemm_nn9w_out_buffer_out));
    i_cmp75_rm_gemm_nn9w_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_cmp75_rm_gemm_nn9w_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            i_cmp75_rm_gemm_nn9w_o <= STD_LOGIC_VECTOR(SIGNED(i_cmp75_rm_gemm_nn9w_a) - SIGNED(i_cmp75_rm_gemm_nn9w_b));
        END IF;
    END PROCESS;
    i_cmp75_rm_gemm_nn9w_c(0) <= i_cmp75_rm_gemm_nn9w_o(33);

    -- i_unnamed_gemm_nn9w72(LOGICAL,135)@6
    i_unnamed_gemm_nn9w72_q <= i_cmp75_rm_gemm_nn9w_c and i_cmp367_rm_gemm_nn9w_c;

    -- i_unnamed_gemm_nn9w82(LOGICAL,136)@6
    i_unnamed_gemm_nn9w82_q <= i_unnamed_gemm_nn9w72_q and i_cmp3_gemm_nn9w_c;

    -- i_acl_push_i1_notexitcond_gemm_nn9w(BLACKBOX,86)@6
    -- out out_feedback_out_2@20000000
    -- out out_feedback_valid_out_2@20000000
    thei_acl_push_i1_notexitcond_gemm_nn9w : i_acl_push_i1_notexitcond_gemm_nn9w83
    PORT MAP (
        in_data_in => i_unnamed_gemm_nn9w82_q,
        in_feedback_stall_in_2 => i_acl_pipeline_keep_going_gemm_nn9w_out_not_exitcond_stall_out,
        in_first_cleanup => i_first_cleanup_gemm_nn9w_q,
        in_stall_in => GND_q,
        in_valid_in => redist55_sync_in_aunroll_x_in_i_valid_5_q,
        out_feedback_out_2 => i_acl_push_i1_notexitcond_gemm_nn9w_out_feedback_out_2,
        out_feedback_valid_out_2 => i_acl_push_i1_notexitcond_gemm_nn9w_out_feedback_valid_out_2,
        clock => clock,
        resetn => resetn
    );

    -- rightShiftStage0Idx1Rng1_uid331_i_next_initerations_gemm_nn9w_gemm_nn9w44_shift_x(BITSELECT,330)@1
    rightShiftStage0Idx1Rng1_uid331_i_next_initerations_gemm_nn9w_gemm_nn9w44_shift_x_b <= i_acl_pop_i6_initerations_pop29_gemm_nn9w_out_data_out(5 downto 1);

    -- rightShiftStage0Idx1_uid333_i_next_initerations_gemm_nn9w_gemm_nn9w44_shift_x(BITJOIN,332)@1
    rightShiftStage0Idx1_uid333_i_next_initerations_gemm_nn9w_gemm_nn9w44_shift_x_q <= GND_q & rightShiftStage0Idx1Rng1_uid331_i_next_initerations_gemm_nn9w_gemm_nn9w44_shift_x_b;

    -- i_acl_push_i6_initerations_push29_gemm_nn9w(BLACKBOX,92)@1
    -- out out_feedback_out_29@20000000
    -- out out_feedback_valid_out_29@20000000
    thei_acl_push_i6_initerations_push29_gemm_nn9w : i_acl_push_i6_initerations_push29_gemm_nn9w45
    PORT MAP (
        in_data_in => i_next_initerations_gemm_nn9w_vt_join_q,
        in_feedback_stall_in_29 => i_acl_pop_i6_initerations_pop29_gemm_nn9w_out_feedback_stall_out_29,
        in_keep_going => i_acl_pipeline_keep_going_gemm_nn9w_out_data_out,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_29 => i_acl_push_i6_initerations_push29_gemm_nn9w_out_feedback_out_29,
        out_feedback_valid_out_29 => i_acl_push_i6_initerations_push29_gemm_nn9w_out_feedback_valid_out_29,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i6_initerations_pop29_gemm_nn9w(BLACKBOX,81)@1
    -- out out_feedback_stall_out_29@20000000
    thei_acl_pop_i6_initerations_pop29_gemm_nn9w : i_acl_pop_i6_initerations_pop29_gemm_nn9w42
    PORT MAP (
        in_data_in => c_i6_31_q,
        in_dir => in_c0_eni7_1,
        in_feedback_in_29 => i_acl_push_i6_initerations_push29_gemm_nn9w_out_feedback_out_29,
        in_feedback_valid_in_29 => i_acl_push_i6_initerations_push29_gemm_nn9w_out_feedback_valid_out_29,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i6_initerations_pop29_gemm_nn9w_out_data_out,
        out_feedback_stall_out_29 => i_acl_pop_i6_initerations_pop29_gemm_nn9w_out_feedback_stall_out_29,
        clock => clock,
        resetn => resetn
    );

    -- rightShiftStage0_uid335_i_next_initerations_gemm_nn9w_gemm_nn9w44_shift_x(MUX,334)@1
    rightShiftStage0_uid335_i_next_initerations_gemm_nn9w_gemm_nn9w44_shift_x_s <= VCC_q;
    rightShiftStage0_uid335_i_next_initerations_gemm_nn9w_gemm_nn9w44_shift_x_combproc: PROCESS (rightShiftStage0_uid335_i_next_initerations_gemm_nn9w_gemm_nn9w44_shift_x_s, i_acl_pop_i6_initerations_pop29_gemm_nn9w_out_data_out, rightShiftStage0Idx1_uid333_i_next_initerations_gemm_nn9w_gemm_nn9w44_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid335_i_next_initerations_gemm_nn9w_gemm_nn9w44_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid335_i_next_initerations_gemm_nn9w_gemm_nn9w44_shift_x_q <= i_acl_pop_i6_initerations_pop29_gemm_nn9w_out_data_out;
            WHEN "1" => rightShiftStage0_uid335_i_next_initerations_gemm_nn9w_gemm_nn9w44_shift_x_q <= rightShiftStage0Idx1_uid333_i_next_initerations_gemm_nn9w_gemm_nn9w44_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid335_i_next_initerations_gemm_nn9w_gemm_nn9w44_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_next_initerations_gemm_nn9w_vt_select_4(BITSELECT,116)@1
    i_next_initerations_gemm_nn9w_vt_select_4_b <= rightShiftStage0_uid335_i_next_initerations_gemm_nn9w_gemm_nn9w44_shift_x_q(4 downto 0);

    -- i_next_initerations_gemm_nn9w_vt_join(BITJOIN,115)@1
    i_next_initerations_gemm_nn9w_vt_join_q <= GND_q & i_next_initerations_gemm_nn9w_vt_select_4_b;

    -- i_unnamed_gemm_nn9w47_BitSelect_for_a(BITSELECT,386)@1
    i_unnamed_gemm_nn9w47_BitSelect_for_a_b <= i_next_initerations_gemm_nn9w_vt_join_q(0 downto 0);

    -- i_unnamed_gemm_nn9w47_join(BITJOIN,387)@1
    i_unnamed_gemm_nn9w47_join_q <= GND_q & GND_q & GND_q & GND_q & GND_q & i_unnamed_gemm_nn9w47_BitSelect_for_a_b;

    -- i_unnamed_gemm_nn9w47_vt_select_0(BITSELECT,131)@1
    i_unnamed_gemm_nn9w47_vt_select_0_b <= i_unnamed_gemm_nn9w47_join_q(0 downto 0);

    -- i_unnamed_gemm_nn9w47_vt_join(BITJOIN,130)@1
    i_unnamed_gemm_nn9w47_vt_join_q <= i_cleanups_shl_gemm_nn9w_vt_const_5_q & i_unnamed_gemm_nn9w47_vt_select_0_b;

    -- i_last_initeration_gemm_nn9w(LOGICAL,110)@1
    i_last_initeration_gemm_nn9w_q <= "1" WHEN i_unnamed_gemm_nn9w47_vt_join_q /= c_i6_0gr_q ELSE "0";

    -- i_acl_push_i1_lastiniteration_gemm_nn9w(BLACKBOX,83)@1
    -- out out_feedback_out_1@20000000
    -- out out_feedback_valid_out_1@20000000
    thei_acl_push_i1_lastiniteration_gemm_nn9w : i_acl_push_i1_lastiniteration_gemm_nn9w49
    PORT MAP (
        in_data_in => i_last_initeration_gemm_nn9w_q,
        in_feedback_stall_in_1 => i_acl_pipeline_keep_going_gemm_nn9w_out_initeration_stall_out,
        in_keep_going => i_acl_pipeline_keep_going_gemm_nn9w_out_data_out,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_1 => i_acl_push_i1_lastiniteration_gemm_nn9w_out_feedback_out_1,
        out_feedback_valid_out_1 => i_acl_push_i1_lastiniteration_gemm_nn9w_out_feedback_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going_gemm_nn9w(BLACKBOX,72)@1
    -- out out_exiting_stall_out@20000000
    -- out out_exiting_valid_out@20000000
    -- out out_initeration_stall_out@20000000
    -- out out_not_exitcond_stall_out@20000000
    -- out out_pipeline_valid_out@20000000
    thei_acl_pipeline_keep_going_gemm_nn9w : i_acl_pipeline_keep_going_gemm_nn9w40
    PORT MAP (
        in_data_in => in_c0_eni7_1,
        in_initeration_in => i_acl_push_i1_lastiniteration_gemm_nn9w_out_feedback_out_1,
        in_initeration_valid_in => i_acl_push_i1_lastiniteration_gemm_nn9w_out_feedback_valid_out_1,
        in_not_exitcond_in => i_acl_push_i1_notexitcond_gemm_nn9w_out_feedback_out_2,
        in_not_exitcond_valid_in => i_acl_push_i1_notexitcond_gemm_nn9w_out_feedback_valid_out_2,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pipeline_keep_going_gemm_nn9w_out_data_out,
        out_exiting_stall_out => i_acl_pipeline_keep_going_gemm_nn9w_out_exiting_stall_out,
        out_exiting_valid_out => i_acl_pipeline_keep_going_gemm_nn9w_out_exiting_valid_out,
        out_initeration_stall_out => i_acl_pipeline_keep_going_gemm_nn9w_out_initeration_stall_out,
        out_not_exitcond_stall_out => i_acl_pipeline_keep_going_gemm_nn9w_out_not_exitcond_stall_out,
        out_pipeline_valid_out => i_acl_pipeline_keep_going_gemm_nn9w_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_push_i1_notexit300322_push35_gemm_nn9w(BLACKBOX,85)@1
    -- out out_feedback_out_35@20000000
    -- out out_feedback_valid_out_35@20000000
    thei_acl_push_i1_notexit300322_push35_gemm_nn9w : i_acl_push_i1_notexit300322_push35_gemm_nn9w98
    PORT MAP (
        in_data_in => i_acl_pop_i1_notexit300322_pop35_gemm_nn9w_out_data_out,
        in_feedback_stall_in_35 => i_acl_pop_i1_notexit300322_pop35_gemm_nn9w_out_feedback_stall_out_35,
        in_keep_going => i_acl_pipeline_keep_going_gemm_nn9w_out_data_out,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_35 => i_acl_push_i1_notexit300322_push35_gemm_nn9w_out_feedback_out_35,
        out_feedback_valid_out_35 => i_acl_push_i1_notexit300322_push35_gemm_nn9w_out_feedback_valid_out_35,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_notexit300322_pop35_gemm_nn9w(BLACKBOX,75)@1
    -- out out_feedback_stall_out_35@20000000
    thei_acl_pop_i1_notexit300322_pop35_gemm_nn9w : i_acl_pop_i1_notexit300322_pop35_gemm_nn9w96
    PORT MAP (
        in_data_in => in_c0_eni7_7,
        in_dir => in_c0_eni7_1,
        in_feedback_in_35 => i_acl_push_i1_notexit300322_push35_gemm_nn9w_out_feedback_out_35,
        in_feedback_valid_in_35 => i_acl_push_i1_notexit300322_push35_gemm_nn9w_out_feedback_valid_out_35,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_notexit300322_pop35_gemm_nn9w_out_data_out,
        out_feedback_stall_out_35 => i_acl_pop_i1_notexit300322_pop35_gemm_nn9w_out_feedback_stall_out_35,
        clock => clock,
        resetn => resetn
    );

    -- redist45_i_acl_pop_i1_notexit300322_pop35_gemm_nn9w_out_data_out_14(DELAY,444)
    redist45_i_acl_pop_i1_notexit300322_pop35_gemm_nn9w_out_data_out_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 14, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_notexit300322_pop35_gemm_nn9w_out_data_out, xout => redist45_i_acl_pop_i1_notexit300322_pop35_gemm_nn9w_out_data_out_14_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_push34_gemm_nn9w(BLACKBOX,87)@1
    -- out out_feedback_out_34@20000000
    -- out out_feedback_valid_out_34@20000000
    thei_acl_push_i1_push34_gemm_nn9w : i_acl_push_i1_push34_gemm_nn9w94
    PORT MAP (
        in_data_in => i_acl_pop_i1_pop34_gemm_nn9w_out_data_out,
        in_feedback_stall_in_34 => i_acl_pop_i1_pop34_gemm_nn9w_out_feedback_stall_out_34,
        in_keep_going => i_acl_pipeline_keep_going_gemm_nn9w_out_data_out,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_34 => i_acl_push_i1_push34_gemm_nn9w_out_feedback_out_34,
        out_feedback_valid_out_34 => i_acl_push_i1_push34_gemm_nn9w_out_feedback_valid_out_34,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_pop34_gemm_nn9w(BLACKBOX,76)@1
    -- out out_feedback_stall_out_34@20000000
    thei_acl_pop_i1_pop34_gemm_nn9w : i_acl_pop_i1_pop34_gemm_nn9w92
    PORT MAP (
        in_data_in => in_c0_eni7_6,
        in_dir => in_c0_eni7_1,
        in_feedback_in_34 => i_acl_push_i1_push34_gemm_nn9w_out_feedback_out_34,
        in_feedback_valid_in_34 => i_acl_push_i1_push34_gemm_nn9w_out_feedback_valid_out_34,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_pop34_gemm_nn9w_out_data_out,
        out_feedback_stall_out_34 => i_acl_pop_i1_pop34_gemm_nn9w_out_feedback_stall_out_34,
        clock => clock,
        resetn => resetn
    );

    -- redist44_i_acl_pop_i1_pop34_gemm_nn9w_out_data_out_14(DELAY,443)
    redist44_i_acl_pop_i1_pop34_gemm_nn9w_out_data_out_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 14, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_pop34_gemm_nn9w_out_data_out, xout => redist44_i_acl_pop_i1_pop34_gemm_nn9w_out_data_out_14_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_forked303319_push31_gemm_nn9w(BLACKBOX,82)@6
    -- out out_feedback_out_31@20000000
    -- out out_feedback_valid_out_31@20000000
    thei_acl_push_i1_forked303319_push31_gemm_nn9w : i_acl_push_i1_forked303319_push31_gemm_nn9w90
    PORT MAP (
        in_data_in => i_acl_pop_i1_forked303319_pop31_gemm_nn9w_out_data_out,
        in_feedback_stall_in_31 => i_acl_pop_i1_forked303319_pop31_gemm_nn9w_out_feedback_stall_out_31,
        in_keep_going => redist48_i_acl_pipeline_keep_going_gemm_nn9w_out_data_out_5_q,
        in_stall_in => GND_q,
        in_valid_in => redist55_sync_in_aunroll_x_in_i_valid_5_q,
        out_feedback_out_31 => i_acl_push_i1_forked303319_push31_gemm_nn9w_out_feedback_out_31,
        out_feedback_valid_out_31 => i_acl_push_i1_forked303319_push31_gemm_nn9w_out_feedback_valid_out_31,
        clock => clock,
        resetn => resetn
    );

    -- redist53_sync_in_aunroll_x_in_c0_eni7_5_5(DELAY,452)
    redist53_sync_in_aunroll_x_in_c0_eni7_5_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c0_eni7_5, xout => redist53_sync_in_aunroll_x_in_c0_eni7_5_5_q, clk => clock, aclr => resetn );

    -- i_acl_pop_i1_forked303319_pop31_gemm_nn9w(BLACKBOX,73)@6
    -- out out_feedback_stall_out_31@20000000
    thei_acl_pop_i1_forked303319_pop31_gemm_nn9w : i_acl_pop_i1_forked303319_pop31_gemm_nn9w88
    PORT MAP (
        in_data_in => redist53_sync_in_aunroll_x_in_c0_eni7_5_5_q,
        in_dir => redist51_sync_in_aunroll_x_in_c0_eni7_1_5_q,
        in_feedback_in_31 => i_acl_push_i1_forked303319_push31_gemm_nn9w_out_feedback_out_31,
        in_feedback_valid_in_31 => i_acl_push_i1_forked303319_push31_gemm_nn9w_out_feedback_valid_out_31,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist55_sync_in_aunroll_x_in_i_valid_5_q,
        out_data_out => i_acl_pop_i1_forked303319_pop31_gemm_nn9w_out_data_out,
        out_feedback_stall_out_31 => i_acl_pop_i1_forked303319_pop31_gemm_nn9w_out_feedback_stall_out_31,
        clock => clock,
        resetn => resetn
    );

    -- redist47_i_acl_pop_i1_forked303319_pop31_gemm_nn9w_out_data_out_9(DELAY,446)
    redist47_i_acl_pop_i1_forked303319_pop31_gemm_nn9w_out_data_out_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 9, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_forked303319_pop31_gemm_nn9w_out_data_out, xout => redist47_i_acl_pop_i1_forked303319_pop31_gemm_nn9w_out_data_out_9_q, clk => clock, aclr => resetn );

    -- redist35_i_notcmp_gemm_nn9w_q_1(DELAY,434)
    redist35_i_notcmp_gemm_nn9w_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_notcmp_gemm_nn9w_q, xout => redist35_i_notcmp_gemm_nn9w_q_1_q, clk => clock, aclr => resetn );

    -- redist37_i_first_cleanup_gemm_nn9w_q_1(DELAY,436)
    redist37_i_first_cleanup_gemm_nn9w_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_first_cleanup_gemm_nn9w_q, xout => redist37_i_first_cleanup_gemm_nn9w_q_1_q, clk => clock, aclr => resetn );

    -- i_masked_gemm_nn9w(LOGICAL,111)@7 + 1
    i_masked_gemm_nn9w_qi <= redist37_i_first_cleanup_gemm_nn9w_q_1_q and redist35_i_notcmp_gemm_nn9w_q_1_q;
    i_masked_gemm_nn9w_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_masked_gemm_nn9w_qi, xout => i_masked_gemm_nn9w_q, clk => clock, aclr => resetn );

    -- redist36_i_masked_gemm_nn9w_q_8(DELAY,435)
    redist36_i_masked_gemm_nn9w_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_masked_gemm_nn9w_q, xout => redist36_i_masked_gemm_nn9w_q_8_q, clk => clock, aclr => resetn );

    -- redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_notEnable(LOGICAL,467)
    redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_nor(LOGICAL,468)
    redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_nor_q <= not (redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_notEnable_q or redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_sticky_ena_q);

    -- redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_last(CONSTANT,464)
    redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_last_q <= "0110";

    -- redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_cmp(LOGICAL,465)
    redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_cmp_b <= STD_LOGIC_VECTOR("0" & redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_rdcnt_q);
    redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_cmp_q <= "1" WHEN redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_last_q = redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_cmp_b ELSE "0";

    -- redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_cmpReg(REG,466)
    redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_cmpReg_q <= STD_LOGIC_VECTOR(redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_cmp_q);
        END IF;
    END PROCESS;

    -- redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_sticky_ena(REG,469)
    redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_nor_q = "1") THEN
                redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_sticky_ena_q <= STD_LOGIC_VECTOR(redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_enaAnd(LOGICAL,470)
    redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_enaAnd_q <= redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_sticky_ena_q and VCC_q;

    -- redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_rdcnt(COUNTER,462)
    -- low=0, high=7, step=1, init=0
    redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_rdcnt_i <= TO_UNSIGNED(0, 3);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_rdcnt_i <= redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_rdcnt_i, 3)));

    -- redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_wraddr(REG,463)
    redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_wraddr_q <= "111";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_wraddr_q <= STD_LOGIC_VECTOR(redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem(DUALMEM,461)
    redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_ia <= STD_LOGIC_VECTOR(redist17_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_1_q);
    redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_aa <= redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_wraddr_q;
    redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_ab <= redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_rdcnt_q;
    redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_reset0 <= not (resetn);
    redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 8,
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
        clocken1 => redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_reset0,
        clock1 => clock,
        address_a => redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_aa,
        data_a => redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_ab,
        q_b => redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_iq
    );
    redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_q <= redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_iq(31 downto 0);

    -- i_acl_push_i1_memdep_phi261_pop11324_push37_gemm_nn9w(BLACKBOX,84)@1
    -- out out_feedback_out_37@20000000
    -- out out_feedback_valid_out_37@20000000
    thei_acl_push_i1_memdep_phi261_pop11324_push37_gemm_nn9w : i_acl_push_i1_memdep_phi261_pop11324_push37_gemm_nn9w75
    PORT MAP (
        in_data_in => i_acl_pop_i1_memdep_phi261_pop11324_pop37_gemm_nn9w_out_data_out,
        in_feedback_stall_in_37 => i_acl_pop_i1_memdep_phi261_pop11324_pop37_gemm_nn9w_out_feedback_stall_out_37,
        in_keep_going => i_acl_pipeline_keep_going_gemm_nn9w_out_data_out,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_37 => i_acl_push_i1_memdep_phi261_pop11324_push37_gemm_nn9w_out_feedback_out_37,
        out_feedback_valid_out_37 => i_acl_push_i1_memdep_phi261_pop11324_push37_gemm_nn9w_out_feedback_valid_out_37,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_memdep_phi261_pop11324_pop37_gemm_nn9w(BLACKBOX,74)@1
    -- out out_feedback_stall_out_37@20000000
    thei_acl_pop_i1_memdep_phi261_pop11324_pop37_gemm_nn9w : i_acl_pop_i1_memdep_phi261_pop11324_pop37_gemm_nn9w73
    PORT MAP (
        in_data_in => in_c0_eni7_4,
        in_dir => in_c0_eni7_1,
        in_feedback_in_37 => i_acl_push_i1_memdep_phi261_pop11324_push37_gemm_nn9w_out_feedback_out_37,
        in_feedback_valid_in_37 => i_acl_push_i1_memdep_phi261_pop11324_push37_gemm_nn9w_out_feedback_valid_out_37,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_memdep_phi261_pop11324_pop37_gemm_nn9w_out_data_out,
        out_feedback_stall_out_37 => i_acl_pop_i1_memdep_phi261_pop11324_pop37_gemm_nn9w_out_feedback_stall_out_37,
        clock => clock,
        resetn => resetn
    );

    -- redist46_i_acl_pop_i1_memdep_phi261_pop11324_pop37_gemm_nn9w_out_data_out_14(DELAY,445)
    redist46_i_acl_pop_i1_memdep_phi261_pop11324_pop37_gemm_nn9w_out_data_out_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 14, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_memdep_phi261_pop11324_pop37_gemm_nn9w_out_data_out, xout => redist46_i_acl_pop_i1_memdep_phi261_pop11324_pop37_gemm_nn9w_out_data_out_14_q, clk => clock, aclr => resetn );

    -- redist33_i_xor_gemm_nn9w_q_9(DELAY,432)
    redist33_i_xor_gemm_nn9w_q_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 9, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_xor_gemm_nn9w_q, xout => redist33_i_xor_gemm_nn9w_q_9_q, clk => clock, aclr => resetn );

    -- i_phi_decision116_xor_rm_gemm_nn9w(LOGICAL,119)@15
    i_phi_decision116_xor_rm_gemm_nn9w_q <= redist34_i_unnamed_gemm_nn9w72_q_9_q xor VCC_q;

    -- i_first_cleanup_xor_or_gemm_nn9w(LOGICAL,109)@15
    i_first_cleanup_xor_or_gemm_nn9w_q <= i_phi_decision116_xor_rm_gemm_nn9w_q or redist33_i_xor_gemm_nn9w_q_9_q;

    -- redist34_i_unnamed_gemm_nn9w72_q_9(DELAY,433)
    redist34_i_unnamed_gemm_nn9w72_q_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 9, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_gemm_nn9w72_q, xout => redist34_i_unnamed_gemm_nn9w72_q_9_q, clk => clock, aclr => resetn );

    -- redist39_i_cmp367_rm_gemm_nn9w_c_10(DELAY,438)
    redist39_i_cmp367_rm_gemm_nn9w_c_10 : dspba_delay
    GENERIC MAP ( width => 1, depth => 9, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp367_rm_gemm_nn9w_c, xout => redist39_i_cmp367_rm_gemm_nn9w_c_10_q, clk => clock, aclr => resetn );

    -- redist38_i_cmp75_rm_gemm_nn9w_c_10(DELAY,437)
    redist38_i_cmp75_rm_gemm_nn9w_c_10 : dspba_delay
    GENERIC MAP ( width => 1, depth => 9, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp75_rm_gemm_nn9w_c, xout => redist38_i_cmp75_rm_gemm_nn9w_c_10_q, clk => clock, aclr => resetn );

    -- i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_multconst_x(CONSTANT,50)
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_multconst_x_q <= "00000000000000000000000000000000000000000000000000000000000000";

    -- leftShiftStage0Idx1Rng1_uid341_i_unnamed_gemm_nn9w62_shift_x(BITSELECT,340)@13
    leftShiftStage0Idx1Rng1_uid341_i_unnamed_gemm_nn9w62_shift_x_in <= i_conv_gemm_nn9w_sel_x_b(62 downto 0);
    leftShiftStage0Idx1Rng1_uid341_i_unnamed_gemm_nn9w62_shift_x_b <= leftShiftStage0Idx1Rng1_uid341_i_unnamed_gemm_nn9w62_shift_x_in(62 downto 0);

    -- leftShiftStage0Idx1_uid342_i_unnamed_gemm_nn9w62_shift_x(BITJOIN,341)@13
    leftShiftStage0Idx1_uid342_i_unnamed_gemm_nn9w62_shift_x_q <= leftShiftStage0Idx1Rng1_uid341_i_unnamed_gemm_nn9w62_shift_x_b & GND_q;

    -- leftShiftStage0_uid344_i_unnamed_gemm_nn9w62_shift_x(MUX,343)@13
    leftShiftStage0_uid344_i_unnamed_gemm_nn9w62_shift_x_s <= VCC_q;
    leftShiftStage0_uid344_i_unnamed_gemm_nn9w62_shift_x_combproc: PROCESS (leftShiftStage0_uid344_i_unnamed_gemm_nn9w62_shift_x_s, i_conv_gemm_nn9w_sel_x_b, leftShiftStage0Idx1_uid342_i_unnamed_gemm_nn9w62_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid344_i_unnamed_gemm_nn9w62_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid344_i_unnamed_gemm_nn9w62_shift_x_q <= i_conv_gemm_nn9w_sel_x_b;
            WHEN "1" => leftShiftStage0_uid344_i_unnamed_gemm_nn9w62_shift_x_q <= leftShiftStage0Idx1_uid342_i_unnamed_gemm_nn9w62_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid344_i_unnamed_gemm_nn9w62_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_unnamed_gemm_nn9w61_vt_select_63(BITSELECT,134)@13
    i_unnamed_gemm_nn9w61_vt_select_63_b <= leftShiftStage0_uid344_i_unnamed_gemm_nn9w62_shift_x_q(63 downto 1);

    -- i_unnamed_gemm_nn9w61_vt_join(BITJOIN,133)@13
    i_unnamed_gemm_nn9w61_vt_join_q <= i_unnamed_gemm_nn9w61_vt_select_63_b & GND_q;

    -- i_acl_push_i32_j_076_pop9321_push33_gemm_nn9w(BLACKBOX,88)@6
    -- out out_feedback_out_33@20000000
    -- out out_feedback_valid_out_33@20000000
    thei_acl_push_i32_j_076_pop9321_push33_gemm_nn9w : i_acl_push_i32_j_076_pop9321_push33_gemm_nn9w57
    PORT MAP (
        in_data_in => i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out,
        in_feedback_stall_in_33 => i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_feedback_stall_out_33,
        in_keep_going => redist48_i_acl_pipeline_keep_going_gemm_nn9w_out_data_out_5_q,
        in_stall_in => GND_q,
        in_valid_in => redist55_sync_in_aunroll_x_in_i_valid_5_q,
        out_feedback_out_33 => i_acl_push_i32_j_076_pop9321_push33_gemm_nn9w_out_feedback_out_33,
        out_feedback_valid_out_33 => i_acl_push_i32_j_076_pop9321_push33_gemm_nn9w_out_feedback_valid_out_33,
        clock => clock,
        resetn => resetn
    );

    -- redist52_sync_in_aunroll_x_in_c0_eni7_3_5_notEnable(LOGICAL,511)
    redist52_sync_in_aunroll_x_in_c0_eni7_3_5_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist52_sync_in_aunroll_x_in_c0_eni7_3_5_nor(LOGICAL,512)
    redist52_sync_in_aunroll_x_in_c0_eni7_3_5_nor_q <= not (redist52_sync_in_aunroll_x_in_c0_eni7_3_5_notEnable_q or redist52_sync_in_aunroll_x_in_c0_eni7_3_5_sticky_ena_q);

    -- redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_last(CONSTANT,508)
    redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_last_q <= "010";

    -- redist52_sync_in_aunroll_x_in_c0_eni7_3_5_cmp(LOGICAL,509)
    redist52_sync_in_aunroll_x_in_c0_eni7_3_5_cmp_b <= STD_LOGIC_VECTOR("0" & redist52_sync_in_aunroll_x_in_c0_eni7_3_5_rdcnt_q);
    redist52_sync_in_aunroll_x_in_c0_eni7_3_5_cmp_q <= "1" WHEN redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_last_q = redist52_sync_in_aunroll_x_in_c0_eni7_3_5_cmp_b ELSE "0";

    -- redist52_sync_in_aunroll_x_in_c0_eni7_3_5_cmpReg(REG,510)
    redist52_sync_in_aunroll_x_in_c0_eni7_3_5_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist52_sync_in_aunroll_x_in_c0_eni7_3_5_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist52_sync_in_aunroll_x_in_c0_eni7_3_5_cmpReg_q <= STD_LOGIC_VECTOR(redist52_sync_in_aunroll_x_in_c0_eni7_3_5_cmp_q);
        END IF;
    END PROCESS;

    -- redist52_sync_in_aunroll_x_in_c0_eni7_3_5_sticky_ena(REG,513)
    redist52_sync_in_aunroll_x_in_c0_eni7_3_5_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist52_sync_in_aunroll_x_in_c0_eni7_3_5_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist52_sync_in_aunroll_x_in_c0_eni7_3_5_nor_q = "1") THEN
                redist52_sync_in_aunroll_x_in_c0_eni7_3_5_sticky_ena_q <= STD_LOGIC_VECTOR(redist52_sync_in_aunroll_x_in_c0_eni7_3_5_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist52_sync_in_aunroll_x_in_c0_eni7_3_5_enaAnd(LOGICAL,514)
    redist52_sync_in_aunroll_x_in_c0_eni7_3_5_enaAnd_q <= redist52_sync_in_aunroll_x_in_c0_eni7_3_5_sticky_ena_q and VCC_q;

    -- redist52_sync_in_aunroll_x_in_c0_eni7_3_5_rdcnt(COUNTER,506)
    -- low=0, high=3, step=1, init=0
    redist52_sync_in_aunroll_x_in_c0_eni7_3_5_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist52_sync_in_aunroll_x_in_c0_eni7_3_5_rdcnt_i <= TO_UNSIGNED(0, 2);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist52_sync_in_aunroll_x_in_c0_eni7_3_5_rdcnt_i <= redist52_sync_in_aunroll_x_in_c0_eni7_3_5_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist52_sync_in_aunroll_x_in_c0_eni7_3_5_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist52_sync_in_aunroll_x_in_c0_eni7_3_5_rdcnt_i, 2)));

    -- redist52_sync_in_aunroll_x_in_c0_eni7_3_5_wraddr(REG,507)
    redist52_sync_in_aunroll_x_in_c0_eni7_3_5_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist52_sync_in_aunroll_x_in_c0_eni7_3_5_wraddr_q <= "11";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist52_sync_in_aunroll_x_in_c0_eni7_3_5_wraddr_q <= STD_LOGIC_VECTOR(redist52_sync_in_aunroll_x_in_c0_eni7_3_5_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem(DUALMEM,505)
    redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_ia <= STD_LOGIC_VECTOR(in_c0_eni7_3);
    redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_aa <= redist52_sync_in_aunroll_x_in_c0_eni7_3_5_wraddr_q;
    redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_ab <= redist52_sync_in_aunroll_x_in_c0_eni7_3_5_rdcnt_q;
    redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_reset0 <= not (resetn);
    redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_dmem : altera_syncram
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
        clocken1 => redist52_sync_in_aunroll_x_in_c0_eni7_3_5_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_reset0,
        clock1 => clock,
        address_a => redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_aa,
        data_a => redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_ab,
        q_b => redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_iq
    );
    redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_q <= redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_iq(31 downto 0);

    -- i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w(BLACKBOX,77)@6
    -- out out_feedback_stall_out_33@20000000
    thei_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w : i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w55
    PORT MAP (
        in_data_in => redist52_sync_in_aunroll_x_in_c0_eni7_3_5_mem_q,
        in_dir => redist51_sync_in_aunroll_x_in_c0_eni7_1_5_q,
        in_feedback_in_33 => i_acl_push_i32_j_076_pop9321_push33_gemm_nn9w_out_feedback_out_33,
        in_feedback_valid_in_33 => i_acl_push_i32_j_076_pop9321_push33_gemm_nn9w_out_feedback_valid_out_33,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist55_sync_in_aunroll_x_in_i_valid_5_q,
        out_data_out => i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out,
        out_feedback_stall_out_33 => i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_feedback_stall_out_33,
        clock => clock,
        resetn => resetn
    );

    -- redist42_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_2(DELAY,441)
    redist42_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_2 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out, xout => redist42_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_2_q, clk => clock, aclr => resetn );

    -- i_mul_gemm_nn9w_bs4(BITSELECT,373)@8
    i_mul_gemm_nn9w_bs4_in <= STD_LOGIC_VECTOR(redist42_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_2_q(17 downto 0));
    i_mul_gemm_nn9w_bs4_b <= STD_LOGIC_VECTOR(i_mul_gemm_nn9w_bs4_in(17 downto 0));

    -- i_mul_gemm_nn9w_bjA5(BITJOIN,374)@8
    i_mul_gemm_nn9w_bjA5_q <= GND_q & i_mul_gemm_nn9w_bs4_b;

    -- i_acl_push_i32_lda_sync_buffer320_push32_gemm_nn9w(BLACKBOX,90)@1
    -- out out_feedback_out_32@20000000
    -- out out_feedback_valid_out_32@20000000
    thei_acl_push_i32_lda_sync_buffer320_push32_gemm_nn9w : i_acl_push_i32_lda_sync_buffer320_push32_gemm_nn9w53
    PORT MAP (
        in_data_in => i_acl_pop_i32_lda_sync_buffer320_pop32_gemm_nn9w_out_data_out,
        in_feedback_stall_in_32 => i_acl_pop_i32_lda_sync_buffer320_pop32_gemm_nn9w_out_feedback_stall_out_32,
        in_keep_going => i_acl_pipeline_keep_going_gemm_nn9w_out_data_out,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_32 => i_acl_push_i32_lda_sync_buffer320_push32_gemm_nn9w_out_feedback_out_32,
        out_feedback_valid_out_32 => i_acl_push_i32_lda_sync_buffer320_push32_gemm_nn9w_out_feedback_valid_out_32,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i32_lda_sync_buffer320_pop32_gemm_nn9w(BLACKBOX,79)@1
    -- out out_feedback_stall_out_32@20000000
    thei_acl_pop_i32_lda_sync_buffer320_pop32_gemm_nn9w : i_acl_pop_i32_lda_sync_buffer320_pop32_gemm_nn9w51
    PORT MAP (
        in_data_in => in_c0_eni7_2,
        in_dir => in_c0_eni7_1,
        in_feedback_in_32 => i_acl_push_i32_lda_sync_buffer320_push32_gemm_nn9w_out_feedback_out_32,
        in_feedback_valid_in_32 => i_acl_push_i32_lda_sync_buffer320_push32_gemm_nn9w_out_feedback_valid_out_32,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_lda_sync_buffer320_pop32_gemm_nn9w_out_data_out,
        out_feedback_stall_out_32 => i_acl_pop_i32_lda_sync_buffer320_pop32_gemm_nn9w_out_feedback_stall_out_32,
        clock => clock,
        resetn => resetn
    );

    -- signX_uid153_i_div1_rm_gemm_nn9w(BITSELECT,152)@1
    signX_uid153_i_div1_rm_gemm_nn9w_b <= STD_LOGIC_VECTOR(i_acl_pop_i32_lda_sync_buffer320_pop32_gemm_nn9w_out_data_out(31 downto 31));

    -- redist30_signX_uid153_i_div1_rm_gemm_nn9w_b_1(DELAY,429)
    redist30_signX_uid153_i_div1_rm_gemm_nn9w_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => signX_uid153_i_div1_rm_gemm_nn9w_b, xout => redist30_signX_uid153_i_div1_rm_gemm_nn9w_b_1_q, clk => clock, aclr => resetn );

    -- redist31_signX_uid153_i_div1_rm_gemm_nn9w_b_5(DELAY,430)
    redist31_signX_uid153_i_div1_rm_gemm_nn9w_b_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist30_signX_uid153_i_div1_rm_gemm_nn9w_b_1_q, xout => redist31_signX_uid153_i_div1_rm_gemm_nn9w_b_5_q, clk => clock, aclr => resetn );

    -- redist32_signX_uid153_i_div1_rm_gemm_nn9w_b_6(DELAY,431)
    redist32_signX_uid153_i_div1_rm_gemm_nn9w_b_6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist31_signX_uid153_i_div1_rm_gemm_nn9w_b_5_q, xout => redist32_signX_uid153_i_div1_rm_gemm_nn9w_b_6_q, clk => clock, aclr => resetn );

    -- xOC_uid154_i_div1_rm_gemm_nn9w(LOGICAL,153)@1 + 1
    xOC_uid154_i_div1_rm_gemm_nn9w_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 1 => signX_uid153_i_div1_rm_gemm_nn9w_b(0)) & signX_uid153_i_div1_rm_gemm_nn9w_b));
    xOC_uid154_i_div1_rm_gemm_nn9w_qi <= i_acl_pop_i32_lda_sync_buffer320_pop32_gemm_nn9w_out_data_out xor xOC_uid154_i_div1_rm_gemm_nn9w_b;
    xOC_uid154_i_div1_rm_gemm_nn9w_delay : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => xOC_uid154_i_div1_rm_gemm_nn9w_qi, xout => xOC_uid154_i_div1_rm_gemm_nn9w_q, clk => clock, aclr => resetn );

    -- xTC_uid155_i_div1_rm_gemm_nn9w(ADD,154)@2
    xTC_uid155_i_div1_rm_gemm_nn9w_a <= STD_LOGIC_VECTOR("0" & xOC_uid154_i_div1_rm_gemm_nn9w_q);
    xTC_uid155_i_div1_rm_gemm_nn9w_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000" & redist30_signX_uid153_i_div1_rm_gemm_nn9w_b_1_q);
    xTC_uid155_i_div1_rm_gemm_nn9w_o <= STD_LOGIC_VECTOR(UNSIGNED(xTC_uid155_i_div1_rm_gemm_nn9w_a) + UNSIGNED(xTC_uid155_i_div1_rm_gemm_nn9w_b));
    xTC_uid155_i_div1_rm_gemm_nn9w_q <= xTC_uid155_i_div1_rm_gemm_nn9w_o(32 downto 0);

    -- nx_uid156_i_div1_rm_gemm_nn9w(BITSELECT,155)@2
    nx_uid156_i_div1_rm_gemm_nn9w_in <= xTC_uid155_i_div1_rm_gemm_nn9w_q(31 downto 0);
    nx_uid156_i_div1_rm_gemm_nn9w_b <= nx_uid156_i_div1_rm_gemm_nn9w_in(31 downto 0);

    -- redist29_nx_uid156_i_div1_rm_gemm_nn9w_b_1(DELAY,428)
    redist29_nx_uid156_i_div1_rm_gemm_nn9w_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => nx_uid156_i_div1_rm_gemm_nn9w_b, xout => redist29_nx_uid156_i_div1_rm_gemm_nn9w_b_1_q, clk => clock, aclr => resetn );

    -- newX_uid158_i_div1_rm_gemm_nn9w(BITJOIN,157)@3
    newX_uid158_i_div1_rm_gemm_nn9w_q <= zCst_uid157_i_div1_rm_gemm_nn9w_q & redist29_nx_uid156_i_div1_rm_gemm_nn9w_b_1_q;

    -- chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select(BITSELECT,396)@3
    chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_b <= newX_uid158_i_div1_rm_gemm_nn9w_q(3 downto 0);
    chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_c <= newX_uid158_i_div1_rm_gemm_nn9w_q(7 downto 4);
    chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_d <= newX_uid158_i_div1_rm_gemm_nn9w_q(11 downto 8);
    chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_e <= newX_uid158_i_div1_rm_gemm_nn9w_q(15 downto 12);
    chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_f <= newX_uid158_i_div1_rm_gemm_nn9w_q(19 downto 16);
    chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_g <= newX_uid158_i_div1_rm_gemm_nn9w_q(23 downto 20);
    chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_h <= newX_uid158_i_div1_rm_gemm_nn9w_q(27 downto 24);
    chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_i <= newX_uid158_i_div1_rm_gemm_nn9w_q(31 downto 28);
    chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_j <= newX_uid158_i_div1_rm_gemm_nn9w_q(35 downto 32);

    -- redist13_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_j_2(DELAY,412)
    redist13_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_j_2 : dspba_delay
    GENERIC MAP ( width => 4, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_j, xout => redist13_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_j_2_q, clk => clock, aclr => resetn );

    -- qDigit_8_uid168_i_div1_rm_gemm_nn9w(LOOKUP,167)@5
    qDigit_8_uid168_i_div1_rm_gemm_nn9w_combproc: PROCESS (redist13_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_j_2_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist13_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_j_2_q) IS
            WHEN "0000" => qDigit_8_uid168_i_div1_rm_gemm_nn9w_q <= "0000";
            WHEN "0001" => qDigit_8_uid168_i_div1_rm_gemm_nn9w_q <= "0000";
            WHEN "0010" => qDigit_8_uid168_i_div1_rm_gemm_nn9w_q <= "0000";
            WHEN "0011" => qDigit_8_uid168_i_div1_rm_gemm_nn9w_q <= "0001";
            WHEN "0100" => qDigit_8_uid168_i_div1_rm_gemm_nn9w_q <= "0001";
            WHEN "0101" => qDigit_8_uid168_i_div1_rm_gemm_nn9w_q <= "0001";
            WHEN "0110" => qDigit_8_uid168_i_div1_rm_gemm_nn9w_q <= "0010";
            WHEN "0111" => qDigit_8_uid168_i_div1_rm_gemm_nn9w_q <= "0010";
            WHEN "1000" => qDigit_8_uid168_i_div1_rm_gemm_nn9w_q <= "0010";
            WHEN "1001" => qDigit_8_uid168_i_div1_rm_gemm_nn9w_q <= "0011";
            WHEN "1010" => qDigit_8_uid168_i_div1_rm_gemm_nn9w_q <= "0011";
            WHEN "1011" => qDigit_8_uid168_i_div1_rm_gemm_nn9w_q <= "0011";
            WHEN "1100" => qDigit_8_uid168_i_div1_rm_gemm_nn9w_q <= "0100";
            WHEN "1101" => qDigit_8_uid168_i_div1_rm_gemm_nn9w_q <= "0100";
            WHEN "1110" => qDigit_8_uid168_i_div1_rm_gemm_nn9w_q <= "0100";
            WHEN "1111" => qDigit_8_uid168_i_div1_rm_gemm_nn9w_q <= "0101";
            WHEN OTHERS => -- unreachable
                           qDigit_8_uid168_i_div1_rm_gemm_nn9w_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- rDigit_8_uid171_i_div1_rm_gemm_nn9w(LOOKUP,170)@3
    rDigit_8_uid171_i_div1_rm_gemm_nn9w_combproc: PROCESS (chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_j)
    BEGIN
        -- Begin reserved scope level
        CASE (chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_j) IS
            WHEN "0000" => rDigit_8_uid171_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "0001" => rDigit_8_uid171_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "0010" => rDigit_8_uid171_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "0011" => rDigit_8_uid171_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "0100" => rDigit_8_uid171_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "0101" => rDigit_8_uid171_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "0110" => rDigit_8_uid171_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "0111" => rDigit_8_uid171_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "1000" => rDigit_8_uid171_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "1001" => rDigit_8_uid171_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "1010" => rDigit_8_uid171_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "1011" => rDigit_8_uid171_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "1100" => rDigit_8_uid171_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "1101" => rDigit_8_uid171_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "1110" => rDigit_8_uid171_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "1111" => rDigit_8_uid171_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN OTHERS => -- unreachable
                           rDigit_8_uid171_i_div1_rm_gemm_nn9w_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- y_7_uid174_i_div1_rm_gemm_nn9w(BITJOIN,173)@3
    y_7_uid174_i_div1_rm_gemm_nn9w_q <= rDigit_8_uid171_i_div1_rm_gemm_nn9w_q & chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_i;

    -- qDigit_7_uid175_i_div1_rm_gemm_nn9w(LOOKUP,174)@3 + 1
    qDigit_7_uid175_i_div1_rm_gemm_nn9w_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (y_7_uid174_i_div1_rm_gemm_nn9w_q) IS
                WHEN "000000" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0000";
                WHEN "000001" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0000";
                WHEN "000010" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0000";
                WHEN "000011" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0001";
                WHEN "000100" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0001";
                WHEN "000101" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0001";
                WHEN "000110" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0010";
                WHEN "000111" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0010";
                WHEN "001000" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0010";
                WHEN "001001" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0011";
                WHEN "001010" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0011";
                WHEN "001011" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0011";
                WHEN "001100" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0100";
                WHEN "001101" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0100";
                WHEN "001110" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0100";
                WHEN "001111" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0101";
                WHEN "010000" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0101";
                WHEN "010001" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0101";
                WHEN "010010" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0110";
                WHEN "010011" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0110";
                WHEN "010100" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0110";
                WHEN "010101" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0111";
                WHEN "010110" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0111";
                WHEN "010111" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "0111";
                WHEN "011000" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1000";
                WHEN "011001" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1000";
                WHEN "011010" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1000";
                WHEN "011011" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1001";
                WHEN "011100" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1001";
                WHEN "011101" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1001";
                WHEN "011110" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1010";
                WHEN "011111" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1010";
                WHEN "100000" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1010";
                WHEN "100001" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1011";
                WHEN "100010" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1011";
                WHEN "100011" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1011";
                WHEN "100100" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1100";
                WHEN "100101" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1100";
                WHEN "100110" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1100";
                WHEN "100111" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1101";
                WHEN "101000" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1101";
                WHEN "101001" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1101";
                WHEN "101010" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1110";
                WHEN "101011" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1110";
                WHEN "101100" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1110";
                WHEN "101101" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1111";
                WHEN "101110" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1111";
                WHEN "101111" => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= "1111";
                WHEN OTHERS => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- redist28_qDigit_7_uid175_i_div1_rm_gemm_nn9w_q_2(DELAY,427)
    redist28_qDigit_7_uid175_i_div1_rm_gemm_nn9w_q_2 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => qDigit_7_uid175_i_div1_rm_gemm_nn9w_q, xout => redist28_qDigit_7_uid175_i_div1_rm_gemm_nn9w_q_2_q, clk => clock, aclr => resetn );

    -- rDigit_7_uid178_i_div1_rm_gemm_nn9w(LOOKUP,177)@3
    rDigit_7_uid178_i_div1_rm_gemm_nn9w_combproc: PROCESS (y_7_uid174_i_div1_rm_gemm_nn9w_q)
    BEGIN
        -- Begin reserved scope level
        CASE (y_7_uid174_i_div1_rm_gemm_nn9w_q) IS
            WHEN "000000" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "000001" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "000010" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "000011" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "000100" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "000101" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "000110" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "000111" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "001000" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "001001" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "001010" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "001011" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "001100" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "001101" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "001110" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "001111" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "010000" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "010001" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "010010" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "010011" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "010100" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "010101" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "010110" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "010111" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "011000" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "011001" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "011010" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "011011" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "011100" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "011101" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "011110" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "011111" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "100000" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "100001" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "100010" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "100011" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "100100" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "100101" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "100110" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "100111" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "101000" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "101001" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "101010" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "101011" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "101100" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "101101" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "101110" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "101111" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "110000" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "110001" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "110010" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "110011" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "110100" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "110101" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "110110" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "110111" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "111000" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "111001" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "111010" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "111011" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "111100" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "111101" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "111110" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "111111" => rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN OTHERS => -- unreachable
                           rDigit_7_uid178_i_div1_rm_gemm_nn9w_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- y_6_uid181_i_div1_rm_gemm_nn9w(BITJOIN,180)@3
    y_6_uid181_i_div1_rm_gemm_nn9w_q <= rDigit_7_uid178_i_div1_rm_gemm_nn9w_q & chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_h;

    -- qDigit_6_uid182_i_div1_rm_gemm_nn9w(LOOKUP,181)@3 + 1
    qDigit_6_uid182_i_div1_rm_gemm_nn9w_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (y_6_uid181_i_div1_rm_gemm_nn9w_q) IS
                WHEN "000000" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0000";
                WHEN "000001" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0000";
                WHEN "000010" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0000";
                WHEN "000011" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0001";
                WHEN "000100" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0001";
                WHEN "000101" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0001";
                WHEN "000110" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0010";
                WHEN "000111" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0010";
                WHEN "001000" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0010";
                WHEN "001001" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0011";
                WHEN "001010" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0011";
                WHEN "001011" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0011";
                WHEN "001100" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0100";
                WHEN "001101" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0100";
                WHEN "001110" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0100";
                WHEN "001111" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0101";
                WHEN "010000" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0101";
                WHEN "010001" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0101";
                WHEN "010010" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0110";
                WHEN "010011" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0110";
                WHEN "010100" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0110";
                WHEN "010101" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0111";
                WHEN "010110" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0111";
                WHEN "010111" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "0111";
                WHEN "011000" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1000";
                WHEN "011001" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1000";
                WHEN "011010" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1000";
                WHEN "011011" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1001";
                WHEN "011100" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1001";
                WHEN "011101" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1001";
                WHEN "011110" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1010";
                WHEN "011111" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1010";
                WHEN "100000" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1010";
                WHEN "100001" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1011";
                WHEN "100010" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1011";
                WHEN "100011" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1011";
                WHEN "100100" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1100";
                WHEN "100101" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1100";
                WHEN "100110" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1100";
                WHEN "100111" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1101";
                WHEN "101000" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1101";
                WHEN "101001" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1101";
                WHEN "101010" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1110";
                WHEN "101011" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1110";
                WHEN "101100" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1110";
                WHEN "101101" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1111";
                WHEN "101110" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1111";
                WHEN "101111" => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= "1111";
                WHEN OTHERS => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- redist27_qDigit_6_uid182_i_div1_rm_gemm_nn9w_q_2(DELAY,426)
    redist27_qDigit_6_uid182_i_div1_rm_gemm_nn9w_q_2 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => qDigit_6_uid182_i_div1_rm_gemm_nn9w_q, xout => redist27_qDigit_6_uid182_i_div1_rm_gemm_nn9w_q_2_q, clk => clock, aclr => resetn );

    -- rDigit_6_uid185_i_div1_rm_gemm_nn9w(LOOKUP,184)@3 + 1
    rDigit_6_uid185_i_div1_rm_gemm_nn9w_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (y_6_uid181_i_div1_rm_gemm_nn9w_q) IS
                WHEN "000000" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "000001" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "000010" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "000011" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "000100" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "000101" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "000110" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "000111" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "001000" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "001001" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "001010" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "001011" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "001100" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "001101" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "001110" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "001111" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "010000" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "010001" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "010010" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "010011" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "010100" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "010101" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "010110" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "010111" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "011000" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "011001" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "011010" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "011011" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "011100" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "011101" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "011110" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "011111" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "100000" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "100001" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "100010" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "100011" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "100100" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "100101" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "100110" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "100111" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "101000" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "101001" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "101010" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "101011" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "101100" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "101101" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "101110" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "101111" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "110000" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "110001" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "110010" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "110011" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "110100" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "110101" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "110110" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "110111" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "111000" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "111001" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "111010" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "111011" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "111100" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "111101" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "111110" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "111111" => rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN OTHERS => -- unreachable
                               rDigit_6_uid185_i_div1_rm_gemm_nn9w_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- redist12_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_g_1(DELAY,411)
    redist12_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_g_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_g, xout => redist12_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_g_1_q, clk => clock, aclr => resetn );

    -- y_5_uid188_i_div1_rm_gemm_nn9w(BITJOIN,187)@4
    y_5_uid188_i_div1_rm_gemm_nn9w_q <= rDigit_6_uid185_i_div1_rm_gemm_nn9w_q & redist12_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_g_1_q;

    -- qDigit_5_uid189_i_div1_rm_gemm_nn9w(LOOKUP,188)@4 + 1
    qDigit_5_uid189_i_div1_rm_gemm_nn9w_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (y_5_uid188_i_div1_rm_gemm_nn9w_q) IS
                WHEN "000000" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0000";
                WHEN "000001" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0000";
                WHEN "000010" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0000";
                WHEN "000011" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0001";
                WHEN "000100" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0001";
                WHEN "000101" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0001";
                WHEN "000110" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0010";
                WHEN "000111" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0010";
                WHEN "001000" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0010";
                WHEN "001001" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0011";
                WHEN "001010" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0011";
                WHEN "001011" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0011";
                WHEN "001100" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0100";
                WHEN "001101" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0100";
                WHEN "001110" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0100";
                WHEN "001111" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0101";
                WHEN "010000" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0101";
                WHEN "010001" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0101";
                WHEN "010010" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0110";
                WHEN "010011" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0110";
                WHEN "010100" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0110";
                WHEN "010101" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0111";
                WHEN "010110" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0111";
                WHEN "010111" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "0111";
                WHEN "011000" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1000";
                WHEN "011001" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1000";
                WHEN "011010" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1000";
                WHEN "011011" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1001";
                WHEN "011100" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1001";
                WHEN "011101" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1001";
                WHEN "011110" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1010";
                WHEN "011111" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1010";
                WHEN "100000" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1010";
                WHEN "100001" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1011";
                WHEN "100010" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1011";
                WHEN "100011" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1011";
                WHEN "100100" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1100";
                WHEN "100101" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1100";
                WHEN "100110" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1100";
                WHEN "100111" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1101";
                WHEN "101000" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1101";
                WHEN "101001" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1101";
                WHEN "101010" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1110";
                WHEN "101011" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1110";
                WHEN "101100" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1110";
                WHEN "101101" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1111";
                WHEN "101110" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1111";
                WHEN "101111" => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= "1111";
                WHEN OTHERS => qDigit_5_uid189_i_div1_rm_gemm_nn9w_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- rDigit_5_uid192_i_div1_rm_gemm_nn9w(LOOKUP,191)@4
    rDigit_5_uid192_i_div1_rm_gemm_nn9w_combproc: PROCESS (y_5_uid188_i_div1_rm_gemm_nn9w_q)
    BEGIN
        -- Begin reserved scope level
        CASE (y_5_uid188_i_div1_rm_gemm_nn9w_q) IS
            WHEN "000000" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "000001" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "000010" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "000011" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "000100" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "000101" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "000110" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "000111" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "001000" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "001001" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "001010" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "001011" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "001100" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "001101" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "001110" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "001111" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "010000" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "010001" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "010010" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "010011" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "010100" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "010101" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "010110" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "010111" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "011000" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "011001" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "011010" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "011011" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "011100" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "011101" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "011110" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "011111" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "100000" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "100001" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "100010" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "100011" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "100100" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "100101" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "100110" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "100111" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "101000" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "101001" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "101010" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "101011" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "101100" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "101101" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "101110" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "101111" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "110000" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "110001" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "110010" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "110011" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "110100" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "110101" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "110110" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "110111" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "111000" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "111001" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "111010" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "111011" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "111100" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "111101" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "111110" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "111111" => rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN OTHERS => -- unreachable
                           rDigit_5_uid192_i_div1_rm_gemm_nn9w_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- redist11_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_f_1(DELAY,410)
    redist11_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_f_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_f, xout => redist11_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_f_1_q, clk => clock, aclr => resetn );

    -- y_4_uid195_i_div1_rm_gemm_nn9w(BITJOIN,194)@4
    y_4_uid195_i_div1_rm_gemm_nn9w_q <= rDigit_5_uid192_i_div1_rm_gemm_nn9w_q & redist11_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_f_1_q;

    -- qDigit_4_uid196_i_div1_rm_gemm_nn9w(LOOKUP,195)@4 + 1
    qDigit_4_uid196_i_div1_rm_gemm_nn9w_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (y_4_uid195_i_div1_rm_gemm_nn9w_q) IS
                WHEN "000000" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0000";
                WHEN "000001" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0000";
                WHEN "000010" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0000";
                WHEN "000011" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0001";
                WHEN "000100" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0001";
                WHEN "000101" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0001";
                WHEN "000110" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0010";
                WHEN "000111" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0010";
                WHEN "001000" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0010";
                WHEN "001001" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0011";
                WHEN "001010" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0011";
                WHEN "001011" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0011";
                WHEN "001100" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0100";
                WHEN "001101" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0100";
                WHEN "001110" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0100";
                WHEN "001111" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0101";
                WHEN "010000" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0101";
                WHEN "010001" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0101";
                WHEN "010010" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0110";
                WHEN "010011" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0110";
                WHEN "010100" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0110";
                WHEN "010101" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0111";
                WHEN "010110" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0111";
                WHEN "010111" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "0111";
                WHEN "011000" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1000";
                WHEN "011001" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1000";
                WHEN "011010" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1000";
                WHEN "011011" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1001";
                WHEN "011100" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1001";
                WHEN "011101" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1001";
                WHEN "011110" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1010";
                WHEN "011111" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1010";
                WHEN "100000" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1010";
                WHEN "100001" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1011";
                WHEN "100010" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1011";
                WHEN "100011" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1011";
                WHEN "100100" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1100";
                WHEN "100101" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1100";
                WHEN "100110" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1100";
                WHEN "100111" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1101";
                WHEN "101000" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1101";
                WHEN "101001" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1101";
                WHEN "101010" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1110";
                WHEN "101011" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1110";
                WHEN "101100" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1110";
                WHEN "101101" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1111";
                WHEN "101110" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1111";
                WHEN "101111" => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= "1111";
                WHEN OTHERS => qDigit_4_uid196_i_div1_rm_gemm_nn9w_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- rDigit_4_uid199_i_div1_rm_gemm_nn9w(LOOKUP,198)@4
    rDigit_4_uid199_i_div1_rm_gemm_nn9w_combproc: PROCESS (y_4_uid195_i_div1_rm_gemm_nn9w_q)
    BEGIN
        -- Begin reserved scope level
        CASE (y_4_uid195_i_div1_rm_gemm_nn9w_q) IS
            WHEN "000000" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "000001" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "000010" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "000011" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "000100" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "000101" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "000110" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "000111" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "001000" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "001001" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "001010" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "001011" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "001100" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "001101" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "001110" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "001111" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "010000" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "010001" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "010010" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "010011" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "010100" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "010101" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "010110" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "010111" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "011000" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "011001" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "011010" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "011011" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "011100" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "011101" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "011110" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "011111" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "100000" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "100001" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "100010" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "100011" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "100100" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "100101" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "100110" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "100111" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "101000" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "101001" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "101010" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "101011" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "101100" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "101101" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "101110" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "101111" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "110000" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "110001" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "110010" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "110011" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "110100" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "110101" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "110110" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "110111" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "111000" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "111001" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "111010" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "111011" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "111100" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "111101" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "111110" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "111111" => rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN OTHERS => -- unreachable
                           rDigit_4_uid199_i_div1_rm_gemm_nn9w_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- redist10_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_e_1(DELAY,409)
    redist10_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_e_1 : dspba_delay
    GENERIC MAP ( width => 4, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_e, xout => redist10_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_e_1_q, clk => clock, aclr => resetn );

    -- y_3_uid202_i_div1_rm_gemm_nn9w(BITJOIN,201)@4
    y_3_uid202_i_div1_rm_gemm_nn9w_q <= rDigit_4_uid199_i_div1_rm_gemm_nn9w_q & redist10_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_e_1_q;

    -- qDigit_3_uid203_i_div1_rm_gemm_nn9w(LOOKUP,202)@4 + 1
    qDigit_3_uid203_i_div1_rm_gemm_nn9w_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (y_3_uid202_i_div1_rm_gemm_nn9w_q) IS
                WHEN "000000" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0000";
                WHEN "000001" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0000";
                WHEN "000010" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0000";
                WHEN "000011" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0001";
                WHEN "000100" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0001";
                WHEN "000101" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0001";
                WHEN "000110" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0010";
                WHEN "000111" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0010";
                WHEN "001000" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0010";
                WHEN "001001" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0011";
                WHEN "001010" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0011";
                WHEN "001011" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0011";
                WHEN "001100" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0100";
                WHEN "001101" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0100";
                WHEN "001110" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0100";
                WHEN "001111" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0101";
                WHEN "010000" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0101";
                WHEN "010001" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0101";
                WHEN "010010" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0110";
                WHEN "010011" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0110";
                WHEN "010100" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0110";
                WHEN "010101" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0111";
                WHEN "010110" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0111";
                WHEN "010111" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "0111";
                WHEN "011000" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1000";
                WHEN "011001" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1000";
                WHEN "011010" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1000";
                WHEN "011011" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1001";
                WHEN "011100" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1001";
                WHEN "011101" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1001";
                WHEN "011110" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1010";
                WHEN "011111" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1010";
                WHEN "100000" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1010";
                WHEN "100001" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1011";
                WHEN "100010" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1011";
                WHEN "100011" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1011";
                WHEN "100100" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1100";
                WHEN "100101" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1100";
                WHEN "100110" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1100";
                WHEN "100111" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1101";
                WHEN "101000" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1101";
                WHEN "101001" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1101";
                WHEN "101010" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1110";
                WHEN "101011" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1110";
                WHEN "101100" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1110";
                WHEN "101101" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1111";
                WHEN "101110" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1111";
                WHEN "101111" => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= "1111";
                WHEN OTHERS => qDigit_3_uid203_i_div1_rm_gemm_nn9w_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- rDigit_3_uid206_i_div1_rm_gemm_nn9w(LOOKUP,205)@4 + 1
    rDigit_3_uid206_i_div1_rm_gemm_nn9w_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
        ELSIF (clock'EVENT AND clock = '1') THEN
            CASE (y_3_uid202_i_div1_rm_gemm_nn9w_q) IS
                WHEN "000000" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "000001" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "000010" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "000011" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "000100" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "000101" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "000110" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "000111" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "001000" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "001001" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "001010" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "001011" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "001100" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "001101" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "001110" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "001111" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "010000" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "010001" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "010010" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "010011" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "010100" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "010101" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "010110" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "010111" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "011000" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "011001" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "011010" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "011011" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "011100" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "011101" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "011110" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "011111" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "100000" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "100001" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "100010" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "100011" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "100100" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "100101" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "100110" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "100111" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "101000" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "101001" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "101010" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "101011" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "101100" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "101101" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "101110" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "101111" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "110000" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "110001" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "110010" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "110011" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "110100" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "110101" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "110110" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "110111" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "111000" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "111001" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "111010" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "111011" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "111100" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN "111101" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "01";
                WHEN "111110" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "10";
                WHEN "111111" => rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= "00";
                WHEN OTHERS => -- unreachable
                               rDigit_3_uid206_i_div1_rm_gemm_nn9w_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- redist9_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_d_2(DELAY,408)
    redist9_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_d_2 : dspba_delay
    GENERIC MAP ( width => 4, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_d, xout => redist9_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_d_2_q, clk => clock, aclr => resetn );

    -- y_2_uid209_i_div1_rm_gemm_nn9w(BITJOIN,208)@5
    y_2_uid209_i_div1_rm_gemm_nn9w_q <= rDigit_3_uid206_i_div1_rm_gemm_nn9w_q & redist9_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_d_2_q;

    -- qDigit_2_uid210_i_div1_rm_gemm_nn9w(LOOKUP,209)@5
    qDigit_2_uid210_i_div1_rm_gemm_nn9w_combproc: PROCESS (y_2_uid209_i_div1_rm_gemm_nn9w_q)
    BEGIN
        -- Begin reserved scope level
        CASE (y_2_uid209_i_div1_rm_gemm_nn9w_q) IS
            WHEN "000000" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0000";
            WHEN "000001" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0000";
            WHEN "000010" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0000";
            WHEN "000011" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0001";
            WHEN "000100" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0001";
            WHEN "000101" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0001";
            WHEN "000110" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0010";
            WHEN "000111" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0010";
            WHEN "001000" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0010";
            WHEN "001001" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0011";
            WHEN "001010" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0011";
            WHEN "001011" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0011";
            WHEN "001100" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0100";
            WHEN "001101" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0100";
            WHEN "001110" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0100";
            WHEN "001111" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0101";
            WHEN "010000" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0101";
            WHEN "010001" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0101";
            WHEN "010010" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0110";
            WHEN "010011" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0110";
            WHEN "010100" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0110";
            WHEN "010101" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0111";
            WHEN "010110" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0111";
            WHEN "010111" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "0111";
            WHEN "011000" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1000";
            WHEN "011001" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1000";
            WHEN "011010" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1000";
            WHEN "011011" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1001";
            WHEN "011100" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1001";
            WHEN "011101" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1001";
            WHEN "011110" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1010";
            WHEN "011111" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1010";
            WHEN "100000" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1010";
            WHEN "100001" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1011";
            WHEN "100010" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1011";
            WHEN "100011" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1011";
            WHEN "100100" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1100";
            WHEN "100101" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1100";
            WHEN "100110" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1100";
            WHEN "100111" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1101";
            WHEN "101000" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1101";
            WHEN "101001" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1101";
            WHEN "101010" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1110";
            WHEN "101011" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1110";
            WHEN "101100" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1110";
            WHEN "101101" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1111";
            WHEN "101110" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1111";
            WHEN "101111" => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= "1111";
            WHEN OTHERS => qDigit_2_uid210_i_div1_rm_gemm_nn9w_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- rDigit_2_uid213_i_div1_rm_gemm_nn9w(LOOKUP,212)@5
    rDigit_2_uid213_i_div1_rm_gemm_nn9w_combproc: PROCESS (y_2_uid209_i_div1_rm_gemm_nn9w_q)
    BEGIN
        -- Begin reserved scope level
        CASE (y_2_uid209_i_div1_rm_gemm_nn9w_q) IS
            WHEN "000000" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "000001" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "000010" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "000011" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "000100" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "000101" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "000110" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "000111" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "001000" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "001001" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "001010" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "001011" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "001100" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "001101" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "001110" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "001111" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "010000" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "010001" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "010010" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "010011" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "010100" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "010101" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "010110" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "010111" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "011000" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "011001" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "011010" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "011011" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "011100" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "011101" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "011110" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "011111" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "100000" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "100001" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "100010" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "100011" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "100100" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "100101" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "100110" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "100111" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "101000" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "101001" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "101010" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "101011" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "101100" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "101101" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "101110" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "101111" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "110000" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "110001" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "110010" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "110011" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "110100" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "110101" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "110110" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "110111" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "111000" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "111001" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "111010" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "111011" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "111100" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "111101" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "111110" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "111111" => rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN OTHERS => -- unreachable
                           rDigit_2_uid213_i_div1_rm_gemm_nn9w_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- redist8_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_c_2(DELAY,407)
    redist8_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_c_2 : dspba_delay
    GENERIC MAP ( width => 4, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_c, xout => redist8_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_c_2_q, clk => clock, aclr => resetn );

    -- y_1_uid216_i_div1_rm_gemm_nn9w(BITJOIN,215)@5
    y_1_uid216_i_div1_rm_gemm_nn9w_q <= rDigit_2_uid213_i_div1_rm_gemm_nn9w_q & redist8_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_c_2_q;

    -- qDigit_1_uid217_i_div1_rm_gemm_nn9w(LOOKUP,216)@5
    qDigit_1_uid217_i_div1_rm_gemm_nn9w_combproc: PROCESS (y_1_uid216_i_div1_rm_gemm_nn9w_q)
    BEGIN
        -- Begin reserved scope level
        CASE (y_1_uid216_i_div1_rm_gemm_nn9w_q) IS
            WHEN "000000" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0000";
            WHEN "000001" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0000";
            WHEN "000010" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0000";
            WHEN "000011" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0001";
            WHEN "000100" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0001";
            WHEN "000101" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0001";
            WHEN "000110" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0010";
            WHEN "000111" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0010";
            WHEN "001000" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0010";
            WHEN "001001" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0011";
            WHEN "001010" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0011";
            WHEN "001011" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0011";
            WHEN "001100" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0100";
            WHEN "001101" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0100";
            WHEN "001110" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0100";
            WHEN "001111" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0101";
            WHEN "010000" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0101";
            WHEN "010001" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0101";
            WHEN "010010" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0110";
            WHEN "010011" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0110";
            WHEN "010100" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0110";
            WHEN "010101" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0111";
            WHEN "010110" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0111";
            WHEN "010111" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "0111";
            WHEN "011000" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1000";
            WHEN "011001" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1000";
            WHEN "011010" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1000";
            WHEN "011011" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1001";
            WHEN "011100" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1001";
            WHEN "011101" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1001";
            WHEN "011110" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1010";
            WHEN "011111" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1010";
            WHEN "100000" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1010";
            WHEN "100001" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1011";
            WHEN "100010" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1011";
            WHEN "100011" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1011";
            WHEN "100100" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1100";
            WHEN "100101" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1100";
            WHEN "100110" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1100";
            WHEN "100111" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1101";
            WHEN "101000" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1101";
            WHEN "101001" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1101";
            WHEN "101010" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1110";
            WHEN "101011" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1110";
            WHEN "101100" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1110";
            WHEN "101101" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1111";
            WHEN "101110" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1111";
            WHEN "101111" => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= "1111";
            WHEN OTHERS => qDigit_1_uid217_i_div1_rm_gemm_nn9w_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- rDigit_1_uid220_i_div1_rm_gemm_nn9w(LOOKUP,219)@5
    rDigit_1_uid220_i_div1_rm_gemm_nn9w_combproc: PROCESS (y_1_uid216_i_div1_rm_gemm_nn9w_q)
    BEGIN
        -- Begin reserved scope level
        CASE (y_1_uid216_i_div1_rm_gemm_nn9w_q) IS
            WHEN "000000" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "000001" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "000010" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "000011" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "000100" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "000101" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "000110" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "000111" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "001000" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "001001" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "001010" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "001011" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "001100" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "001101" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "001110" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "001111" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "010000" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "010001" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "010010" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "010011" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "010100" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "010101" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "010110" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "010111" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "011000" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "011001" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "011010" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "011011" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "011100" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "011101" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "011110" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "011111" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "100000" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "100001" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "100010" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "100011" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "100100" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "100101" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "100110" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "100111" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "101000" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "101001" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "101010" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "101011" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "101100" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "101101" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "101110" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "101111" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "110000" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "110001" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "110010" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "110011" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "110100" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "110101" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "110110" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "110111" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "111000" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "111001" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "111010" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "111011" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "111100" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN "111101" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "01";
            WHEN "111110" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "10";
            WHEN "111111" => rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= "00";
            WHEN OTHERS => -- unreachable
                           rDigit_1_uid220_i_div1_rm_gemm_nn9w_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- redist7_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_b_2(DELAY,406)
    redist7_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_b_2 : dspba_delay
    GENERIC MAP ( width => 4, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_b, xout => redist7_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_b_2_q, clk => clock, aclr => resetn );

    -- y_0_uid223_i_div1_rm_gemm_nn9w(BITJOIN,222)@5
    y_0_uid223_i_div1_rm_gemm_nn9w_q <= rDigit_1_uid220_i_div1_rm_gemm_nn9w_q & redist7_chunk_x_0_uid159_i_div1_rm_gemm_nn9w_merged_bit_select_b_2_q;

    -- qDigit_0_uid224_i_div1_rm_gemm_nn9w(LOOKUP,223)@5
    qDigit_0_uid224_i_div1_rm_gemm_nn9w_combproc: PROCESS (y_0_uid223_i_div1_rm_gemm_nn9w_q)
    BEGIN
        -- Begin reserved scope level
        CASE (y_0_uid223_i_div1_rm_gemm_nn9w_q) IS
            WHEN "000000" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0000";
            WHEN "000001" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0000";
            WHEN "000010" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0000";
            WHEN "000011" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0001";
            WHEN "000100" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0001";
            WHEN "000101" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0001";
            WHEN "000110" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0010";
            WHEN "000111" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0010";
            WHEN "001000" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0010";
            WHEN "001001" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0011";
            WHEN "001010" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0011";
            WHEN "001011" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0011";
            WHEN "001100" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0100";
            WHEN "001101" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0100";
            WHEN "001110" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0100";
            WHEN "001111" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0101";
            WHEN "010000" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0101";
            WHEN "010001" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0101";
            WHEN "010010" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0110";
            WHEN "010011" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0110";
            WHEN "010100" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0110";
            WHEN "010101" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0111";
            WHEN "010110" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0111";
            WHEN "010111" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "0111";
            WHEN "011000" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1000";
            WHEN "011001" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1000";
            WHEN "011010" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1000";
            WHEN "011011" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1001";
            WHEN "011100" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1001";
            WHEN "011101" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1001";
            WHEN "011110" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1010";
            WHEN "011111" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1010";
            WHEN "100000" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1010";
            WHEN "100001" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1011";
            WHEN "100010" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1011";
            WHEN "100011" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1011";
            WHEN "100100" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1100";
            WHEN "100101" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1100";
            WHEN "100110" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1100";
            WHEN "100111" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1101";
            WHEN "101000" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1101";
            WHEN "101001" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1101";
            WHEN "101010" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1110";
            WHEN "101011" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1110";
            WHEN "101100" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1110";
            WHEN "101101" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1111";
            WHEN "101110" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1111";
            WHEN "101111" => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= "1111";
            WHEN OTHERS => qDigit_0_uid224_i_div1_rm_gemm_nn9w_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- resFinalIntDiv_uid230_i_div1_rm_gemm_nn9w(BITJOIN,229)@5
    resFinalIntDiv_uid230_i_div1_rm_gemm_nn9w_q <= qDigit_8_uid168_i_div1_rm_gemm_nn9w_q & redist28_qDigit_7_uid175_i_div1_rm_gemm_nn9w_q_2_q & redist27_qDigit_6_uid182_i_div1_rm_gemm_nn9w_q_2_q & qDigit_5_uid189_i_div1_rm_gemm_nn9w_q & qDigit_4_uid196_i_div1_rm_gemm_nn9w_q & qDigit_3_uid203_i_div1_rm_gemm_nn9w_q & qDigit_2_uid210_i_div1_rm_gemm_nn9w_q & qDigit_1_uid217_i_div1_rm_gemm_nn9w_q & qDigit_0_uid224_i_div1_rm_gemm_nn9w_q;

    -- resFinalIntDivCmpRange_uid231_i_div1_rm_gemm_nn9w(BITSELECT,230)@5
    resFinalIntDivCmpRange_uid231_i_div1_rm_gemm_nn9w_in <= STD_LOGIC_VECTOR(resFinalIntDiv_uid230_i_div1_rm_gemm_nn9w_q(31 downto 0));
    resFinalIntDivCmpRange_uid231_i_div1_rm_gemm_nn9w_b <= STD_LOGIC_VECTOR(resFinalIntDivCmpRange_uid231_i_div1_rm_gemm_nn9w_in(31 downto 0));

    -- redist26_resFinalIntDivCmpRange_uid231_i_div1_rm_gemm_nn9w_b_1(DELAY,425)
    redist26_resFinalIntDivCmpRange_uid231_i_div1_rm_gemm_nn9w_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => resFinalIntDivCmpRange_uid231_i_div1_rm_gemm_nn9w_b, xout => redist26_resFinalIntDivCmpRange_uid231_i_div1_rm_gemm_nn9w_b_1_q, clk => clock, aclr => resetn );

    -- resFinalIntDivCmpOC_uid232_i_div1_rm_gemm_nn9w(LOGICAL,231)@6 + 1
    resFinalIntDivCmpOC_uid232_i_div1_rm_gemm_nn9w_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 1 => redist31_signX_uid153_i_div1_rm_gemm_nn9w_b_5_q(0)) & redist31_signX_uid153_i_div1_rm_gemm_nn9w_b_5_q));
    resFinalIntDivCmpOC_uid232_i_div1_rm_gemm_nn9w_qi <= redist26_resFinalIntDivCmpRange_uid231_i_div1_rm_gemm_nn9w_b_1_q xor resFinalIntDivCmpOC_uid232_i_div1_rm_gemm_nn9w_b;
    resFinalIntDivCmpOC_uid232_i_div1_rm_gemm_nn9w_delay : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => resFinalIntDivCmpOC_uid232_i_div1_rm_gemm_nn9w_qi, xout => resFinalIntDivCmpOC_uid232_i_div1_rm_gemm_nn9w_q, clk => clock, aclr => resetn );

    -- resFinalIntDivCmpTC_uid233_i_div1_rm_gemm_nn9w(ADD,232)@7
    resFinalIntDivCmpTC_uid233_i_div1_rm_gemm_nn9w_a <= STD_LOGIC_VECTOR("0" & resFinalIntDivCmpOC_uid232_i_div1_rm_gemm_nn9w_q);
    resFinalIntDivCmpTC_uid233_i_div1_rm_gemm_nn9w_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000" & redist32_signX_uid153_i_div1_rm_gemm_nn9w_b_6_q);
    resFinalIntDivCmpTC_uid233_i_div1_rm_gemm_nn9w_o <= STD_LOGIC_VECTOR(UNSIGNED(resFinalIntDivCmpTC_uid233_i_div1_rm_gemm_nn9w_a) + UNSIGNED(resFinalIntDivCmpTC_uid233_i_div1_rm_gemm_nn9w_b));
    resFinalIntDivCmpTC_uid233_i_div1_rm_gemm_nn9w_q <= resFinalIntDivCmpTC_uid233_i_div1_rm_gemm_nn9w_o(32 downto 0);

    -- resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w(BITSELECT,233)@7
    resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_in <= STD_LOGIC_VECTOR(resFinalIntDivCmpTC_uid233_i_div1_rm_gemm_nn9w_q(31 downto 0));
    resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b <= STD_LOGIC_VECTOR(resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_in(31 downto 0));

    -- redist24_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_1(DELAY,423)
    redist24_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b, xout => redist24_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_1_q, clk => clock, aclr => resetn );

    -- i_mul_gemm_nn9w_bs2_merged_bit_select(BITSELECT,397)@8
    i_mul_gemm_nn9w_bs2_merged_bit_select_b <= redist24_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_1_q(17 downto 0);
    i_mul_gemm_nn9w_bs2_merged_bit_select_c <= redist24_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_1_q(31 downto 18);

    -- i_mul_gemm_nn9w_bjB9(BITJOIN,378)@8
    i_mul_gemm_nn9w_bjB9_q <= GND_q & i_mul_gemm_nn9w_bs2_merged_bit_select_b;

    -- i_mul_gemm_nn9w_bs7(BITSELECT,376)@8
    i_mul_gemm_nn9w_bs7_b <= STD_LOGIC_VECTOR(redist42_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_2_q(31 downto 18));

    -- i_mul_gemm_nn9w_ma3_cma(CHAINMULTADD,394)@8 + 2
    i_mul_gemm_nn9w_ma3_cma_reset <= not (resetn);
    i_mul_gemm_nn9w_ma3_cma_ena0 <= '1';
    i_mul_gemm_nn9w_ma3_cma_ena1 <= i_mul_gemm_nn9w_ma3_cma_ena0;
    i_mul_gemm_nn9w_ma3_cma_l(0) <= SIGNED(RESIZE(i_mul_gemm_nn9w_ma3_cma_a0(0),15));
    i_mul_gemm_nn9w_ma3_cma_l(1) <= SIGNED(RESIZE(i_mul_gemm_nn9w_ma3_cma_a0(1),15));
    i_mul_gemm_nn9w_ma3_cma_p(0) <= i_mul_gemm_nn9w_ma3_cma_l(0) * i_mul_gemm_nn9w_ma3_cma_c0(0);
    i_mul_gemm_nn9w_ma3_cma_p(1) <= i_mul_gemm_nn9w_ma3_cma_l(1) * i_mul_gemm_nn9w_ma3_cma_c0(1);
    i_mul_gemm_nn9w_ma3_cma_u(0) <= RESIZE(i_mul_gemm_nn9w_ma3_cma_p(0),35);
    i_mul_gemm_nn9w_ma3_cma_u(1) <= RESIZE(i_mul_gemm_nn9w_ma3_cma_p(1),35);
    i_mul_gemm_nn9w_ma3_cma_w(0) <= i_mul_gemm_nn9w_ma3_cma_u(0) + i_mul_gemm_nn9w_ma3_cma_u(1);
    i_mul_gemm_nn9w_ma3_cma_x(0) <= i_mul_gemm_nn9w_ma3_cma_w(0);
    i_mul_gemm_nn9w_ma3_cma_y(0) <= i_mul_gemm_nn9w_ma3_cma_x(0);
    i_mul_gemm_nn9w_ma3_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_gemm_nn9w_ma3_cma_a0 <= (others => (others => '0'));
            i_mul_gemm_nn9w_ma3_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_gemm_nn9w_ma3_cma_ena0 = '1') THEN
                i_mul_gemm_nn9w_ma3_cma_a0(0) <= RESIZE(UNSIGNED(i_mul_gemm_nn9w_bs7_b),14);
                i_mul_gemm_nn9w_ma3_cma_a0(1) <= RESIZE(UNSIGNED(i_mul_gemm_nn9w_bs2_merged_bit_select_c),14);
                i_mul_gemm_nn9w_ma3_cma_c0(0) <= RESIZE(SIGNED(i_mul_gemm_nn9w_bjB9_q),19);
                i_mul_gemm_nn9w_ma3_cma_c0(1) <= RESIZE(SIGNED(i_mul_gemm_nn9w_bjA5_q),19);
            END IF;
        END IF;
    END PROCESS;
    i_mul_gemm_nn9w_ma3_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_gemm_nn9w_ma3_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_gemm_nn9w_ma3_cma_ena1 = '1') THEN
                i_mul_gemm_nn9w_ma3_cma_s(0) <= i_mul_gemm_nn9w_ma3_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul_gemm_nn9w_ma3_cma_delay : dspba_delay
    GENERIC MAP ( width => 34, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul_gemm_nn9w_ma3_cma_s(0)(33 downto 0)), xout => i_mul_gemm_nn9w_ma3_cma_qq, clk => clock, aclr => resetn );
    i_mul_gemm_nn9w_ma3_cma_q <= STD_LOGIC_VECTOR(i_mul_gemm_nn9w_ma3_cma_qq(33 downto 0));

    -- redist14_i_mul_gemm_nn9w_ma3_cma_q_1(DELAY,413)
    redist14_i_mul_gemm_nn9w_ma3_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul_gemm_nn9w_ma3_cma_q, xout => redist14_i_mul_gemm_nn9w_ma3_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul_gemm_nn9w_align_14(BITSHIFT,383)@11
    i_mul_gemm_nn9w_align_14_qint <= redist14_i_mul_gemm_nn9w_ma3_cma_q_1_q & "000000000000000000";
    i_mul_gemm_nn9w_align_14_q <= i_mul_gemm_nn9w_align_14_qint(51 downto 0);

    -- i_mul_gemm_nn9w_bs11(BITSELECT,380)@8
    i_mul_gemm_nn9w_bs11_b <= redist42_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_2_q(31 downto 18);

    -- i_mul_gemm_nn9w_im10_cma(CHAINMULTADD,393)@8 + 2
    i_mul_gemm_nn9w_im10_cma_reset <= not (resetn);
    i_mul_gemm_nn9w_im10_cma_ena0 <= '1';
    i_mul_gemm_nn9w_im10_cma_ena1 <= i_mul_gemm_nn9w_im10_cma_ena0;
    i_mul_gemm_nn9w_im10_cma_p(0) <= i_mul_gemm_nn9w_im10_cma_a0(0) * i_mul_gemm_nn9w_im10_cma_c0(0);
    i_mul_gemm_nn9w_im10_cma_u(0) <= RESIZE(i_mul_gemm_nn9w_im10_cma_p(0),28);
    i_mul_gemm_nn9w_im10_cma_w(0) <= i_mul_gemm_nn9w_im10_cma_u(0);
    i_mul_gemm_nn9w_im10_cma_x(0) <= i_mul_gemm_nn9w_im10_cma_w(0);
    i_mul_gemm_nn9w_im10_cma_y(0) <= i_mul_gemm_nn9w_im10_cma_x(0);
    i_mul_gemm_nn9w_im10_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_gemm_nn9w_im10_cma_a0 <= (others => (others => '0'));
            i_mul_gemm_nn9w_im10_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_gemm_nn9w_im10_cma_ena0 = '1') THEN
                i_mul_gemm_nn9w_im10_cma_a0(0) <= RESIZE(UNSIGNED(i_mul_gemm_nn9w_bs11_b),14);
                i_mul_gemm_nn9w_im10_cma_c0(0) <= RESIZE(UNSIGNED(i_mul_gemm_nn9w_bs2_merged_bit_select_c),14);
            END IF;
        END IF;
    END PROCESS;
    i_mul_gemm_nn9w_im10_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_gemm_nn9w_im10_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_gemm_nn9w_im10_cma_ena1 = '1') THEN
                i_mul_gemm_nn9w_im10_cma_s(0) <= i_mul_gemm_nn9w_im10_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul_gemm_nn9w_im10_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul_gemm_nn9w_im10_cma_s(0)(27 downto 0)), xout => i_mul_gemm_nn9w_im10_cma_qq, clk => clock, aclr => resetn );
    i_mul_gemm_nn9w_im10_cma_q <= STD_LOGIC_VECTOR(i_mul_gemm_nn9w_im10_cma_qq(27 downto 0));

    -- redist15_i_mul_gemm_nn9w_im10_cma_q_1(DELAY,414)
    redist15_i_mul_gemm_nn9w_im10_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 28, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul_gemm_nn9w_im10_cma_q, xout => redist15_i_mul_gemm_nn9w_im10_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul_gemm_nn9w_bs1(BITSELECT,370)@8
    i_mul_gemm_nn9w_bs1_in <= redist42_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_2_q(17 downto 0);
    i_mul_gemm_nn9w_bs1_b <= i_mul_gemm_nn9w_bs1_in(17 downto 0);

    -- i_mul_gemm_nn9w_im0_cma(CHAINMULTADD,392)@8 + 2
    i_mul_gemm_nn9w_im0_cma_reset <= not (resetn);
    i_mul_gemm_nn9w_im0_cma_ena0 <= '1';
    i_mul_gemm_nn9w_im0_cma_ena1 <= i_mul_gemm_nn9w_im0_cma_ena0;
    i_mul_gemm_nn9w_im0_cma_p(0) <= i_mul_gemm_nn9w_im0_cma_a0(0) * i_mul_gemm_nn9w_im0_cma_c0(0);
    i_mul_gemm_nn9w_im0_cma_u(0) <= RESIZE(i_mul_gemm_nn9w_im0_cma_p(0),36);
    i_mul_gemm_nn9w_im0_cma_w(0) <= i_mul_gemm_nn9w_im0_cma_u(0);
    i_mul_gemm_nn9w_im0_cma_x(0) <= i_mul_gemm_nn9w_im0_cma_w(0);
    i_mul_gemm_nn9w_im0_cma_y(0) <= i_mul_gemm_nn9w_im0_cma_x(0);
    i_mul_gemm_nn9w_im0_cma_chainmultadd_input: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_gemm_nn9w_im0_cma_a0 <= (others => (others => '0'));
            i_mul_gemm_nn9w_im0_cma_c0 <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_gemm_nn9w_im0_cma_ena0 = '1') THEN
                i_mul_gemm_nn9w_im0_cma_a0(0) <= RESIZE(UNSIGNED(i_mul_gemm_nn9w_bs1_b),18);
                i_mul_gemm_nn9w_im0_cma_c0(0) <= RESIZE(UNSIGNED(i_mul_gemm_nn9w_bs2_merged_bit_select_b),18);
            END IF;
        END IF;
    END PROCESS;
    i_mul_gemm_nn9w_im0_cma_chainmultadd_output: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_mul_gemm_nn9w_im0_cma_s <= (others => (others => '0'));
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (i_mul_gemm_nn9w_im0_cma_ena1 = '1') THEN
                i_mul_gemm_nn9w_im0_cma_s(0) <= i_mul_gemm_nn9w_im0_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    i_mul_gemm_nn9w_im0_cma_delay : dspba_delay
    GENERIC MAP ( width => 36, depth => 0, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => STD_LOGIC_VECTOR(i_mul_gemm_nn9w_im0_cma_s(0)(35 downto 0)), xout => i_mul_gemm_nn9w_im0_cma_qq, clk => clock, aclr => resetn );
    i_mul_gemm_nn9w_im0_cma_q <= STD_LOGIC_VECTOR(i_mul_gemm_nn9w_im0_cma_qq(35 downto 0));

    -- redist16_i_mul_gemm_nn9w_im0_cma_q_1(DELAY,415)
    redist16_i_mul_gemm_nn9w_im0_cma_q_1 : dspba_delay
    GENERIC MAP ( width => 36, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_mul_gemm_nn9w_im0_cma_q, xout => redist16_i_mul_gemm_nn9w_im0_cma_q_1_q, clk => clock, aclr => resetn );

    -- i_mul_gemm_nn9w_join_13(BITJOIN,382)@11
    i_mul_gemm_nn9w_join_13_q <= redist15_i_mul_gemm_nn9w_im10_cma_q_1_q & redist16_i_mul_gemm_nn9w_im0_cma_q_1_q;

    -- i_mul_gemm_nn9w_result_add_0_0(ADD,385)@11
    i_mul_gemm_nn9w_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & i_mul_gemm_nn9w_join_13_q));
    i_mul_gemm_nn9w_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((66 downto 52 => i_mul_gemm_nn9w_align_14_q(51)) & i_mul_gemm_nn9w_align_14_q));
    i_mul_gemm_nn9w_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(i_mul_gemm_nn9w_result_add_0_0_a) + SIGNED(i_mul_gemm_nn9w_result_add_0_0_b));
    i_mul_gemm_nn9w_result_add_0_0_q <= i_mul_gemm_nn9w_result_add_0_0_o(65 downto 0);

    -- bgTrunc_i_mul_gemm_nn9w_rnd_sel(BITSELECT,365)@11
    bgTrunc_i_mul_gemm_nn9w_rnd_sel_in <= i_mul_gemm_nn9w_result_add_0_0_q(63 downto 0);
    bgTrunc_i_mul_gemm_nn9w_rnd_sel_b <= bgTrunc_i_mul_gemm_nn9w_rnd_sel_in(63 downto 0);

    -- bgTrunc_i_mul_gemm_nn9w_sel_x(BITSELECT,4)@11
    bgTrunc_i_mul_gemm_nn9w_sel_x_b <= bgTrunc_i_mul_gemm_nn9w_rnd_sel_b(31 downto 0);

    -- redist59_bgTrunc_i_mul_gemm_nn9w_sel_x_b_1(DELAY,458)
    redist59_bgTrunc_i_mul_gemm_nn9w_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_mul_gemm_nn9w_sel_x_b, xout => redist59_bgTrunc_i_mul_gemm_nn9w_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_notEnable(LOGICAL,489)
    redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_nor(LOGICAL,490)
    redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_nor_q <= not (redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_notEnable_q or redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_sticky_ena_q);

    -- redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_last(CONSTANT,486)
    redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_last_q <= "010";

    -- redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_cmp(LOGICAL,487)
    redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_cmp_b <= STD_LOGIC_VECTOR("0" & redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_rdcnt_q);
    redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_cmp_q <= "1" WHEN redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_last_q = redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_cmp_b ELSE "0";

    -- redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_cmpReg(REG,488)
    redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_cmpReg_q <= STD_LOGIC_VECTOR(redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_cmp_q);
        END IF;
    END PROCESS;

    -- redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_sticky_ena(REG,491)
    redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_nor_q = "1") THEN
                redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_sticky_ena_q <= STD_LOGIC_VECTOR(redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_enaAnd(LOGICAL,492)
    redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_enaAnd_q <= redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_sticky_ena_q and VCC_q;

    -- redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_rdcnt(COUNTER,484)
    -- low=0, high=3, step=1, init=0
    redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_rdcnt_i <= TO_UNSIGNED(0, 2);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_rdcnt_i <= redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_rdcnt_i, 2)));

    -- redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_inputreg(DELAY,481)
    redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out, xout => redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_inputreg_q, clk => clock, aclr => resetn );

    -- redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_wraddr(REG,485)
    redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_wraddr_q <= "11";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_wraddr_q <= STD_LOGIC_VECTOR(redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem(DUALMEM,483)
    redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_ia <= STD_LOGIC_VECTOR(redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_inputreg_q);
    redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_aa <= redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_wraddr_q;
    redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_ab <= redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_rdcnt_q;
    redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_reset0 <= not (resetn);
    redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_dmem : altera_syncram
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
        clocken1 => redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_reset0,
        clock1 => clock,
        address_a => redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_aa,
        data_a => redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_ab,
        q_b => redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_iq
    );
    redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_q <= redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_iq(31 downto 0);

    -- redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_outputreg(DELAY,482)
    redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_mem_q, xout => redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_outputreg_q, clk => clock, aclr => resetn );

    -- i_add_gemm_nn9w(ADD,94)@12
    i_add_gemm_nn9w_a <= STD_LOGIC_VECTOR("0" & redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_outputreg_q);
    i_add_gemm_nn9w_b <= STD_LOGIC_VECTOR("0" & redist59_bgTrunc_i_mul_gemm_nn9w_sel_x_b_1_q);
    i_add_gemm_nn9w_o <= STD_LOGIC_VECTOR(UNSIGNED(i_add_gemm_nn9w_a) + UNSIGNED(i_add_gemm_nn9w_b));
    i_add_gemm_nn9w_q <= i_add_gemm_nn9w_o(32 downto 0);

    -- bgTrunc_i_add_gemm_nn9w_sel_x(BITSELECT,3)@12
    bgTrunc_i_add_gemm_nn9w_sel_x_b <= i_add_gemm_nn9w_q(31 downto 0);

    -- redist60_bgTrunc_i_add_gemm_nn9w_sel_x_b_1(DELAY,459)
    redist60_bgTrunc_i_add_gemm_nn9w_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_add_gemm_nn9w_sel_x_b, xout => redist60_bgTrunc_i_add_gemm_nn9w_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_conv_gemm_nn9w_sel_x(BITSELECT,33)@13
    i_conv_gemm_nn9w_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist60_bgTrunc_i_add_gemm_nn9w_sel_x_b_1_q(31 downto 0)), 64)));

    -- i_vscale_i_add126_gemm_nn9w(ADD,137)@13
    i_vscale_i_add126_gemm_nn9w_a <= STD_LOGIC_VECTOR("0" & i_conv_gemm_nn9w_sel_x_b);
    i_vscale_i_add126_gemm_nn9w_b <= STD_LOGIC_VECTOR("0" & i_unnamed_gemm_nn9w61_vt_join_q);
    i_vscale_i_add126_gemm_nn9w_o <= STD_LOGIC_VECTOR(UNSIGNED(i_vscale_i_add126_gemm_nn9w_a) + UNSIGNED(i_vscale_i_add126_gemm_nn9w_b));
    i_vscale_i_add126_gemm_nn9w_q <= i_vscale_i_add126_gemm_nn9w_o(64 downto 0);

    -- bgTrunc_i_vscale_i_add126_gemm_nn9w_sel_x(BITSELECT,5)@13
    bgTrunc_i_vscale_i_add126_gemm_nn9w_sel_x_b <= i_vscale_i_add126_gemm_nn9w_q(63 downto 0);

    -- redist58_bgTrunc_i_vscale_i_add126_gemm_nn9w_sel_x_b_1(DELAY,457)
    redist58_bgTrunc_i_vscale_i_add126_gemm_nn9w_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_vscale_i_add126_gemm_nn9w_sel_x_b, xout => redist58_bgTrunc_i_vscale_i_add126_gemm_nn9w_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_bs1_merged_bit_select(BITSELECT,395)@14
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_bs1_merged_bit_select_b <= redist58_bgTrunc_i_vscale_i_add126_gemm_nn9w_sel_x_b_1_q(17 downto 0);
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_bs1_merged_bit_select_c <= redist58_bgTrunc_i_vscale_i_add126_gemm_nn9w_sel_x_b_1_q(63 downto 54);
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_bs1_merged_bit_select_d <= redist58_bgTrunc_i_vscale_i_add126_gemm_nn9w_sel_x_b_1_q(35 downto 18);
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_bs1_merged_bit_select_e <= redist58_bgTrunc_i_vscale_i_add126_gemm_nn9w_sel_x_b_1_q(53 downto 36);

    -- i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im3_shift0(BITSHIFT,389)@14
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im3_shift0_qint <= i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_bs1_merged_bit_select_c & "0";
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im3_shift0_q <= i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im3_shift0_qint(10 downto 0);

    -- i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_align_15(BITSHIFT,360)@14
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im3_shift0_q) & "0000000000000000";
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_align_15_q <= i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_align_15_qint(27 downto 0);

    -- i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im6_shift0(BITSHIFT,390)@14
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im6_shift0_qint <= i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_bs1_merged_bit_select_d & "0";
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im6_shift0_q <= i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im6_shift0_qint(18 downto 0);

    -- i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_align_14(BITSHIFT,359)@14
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im6_shift0_q) & "000000000000000000";
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_align_14_q <= i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_align_14_qint(37 downto 0);

    -- i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_join_16(BITJOIN,361)@14
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_join_16_q <= i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_align_15_q & i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_align_14_q;

    -- i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im9_shift0(BITSHIFT,391)@14
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im9_shift0_qint <= i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_bs1_merged_bit_select_e & "0";
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im9_shift0_q <= i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im9_shift0_qint(18 downto 0);

    -- i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_align_12(BITSHIFT,357)@14
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im9_shift0_q) & "0000000000000000";
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_align_12_q <= i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_align_12_qint(35 downto 0);

    -- i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im0_shift0(BITSHIFT,388)@14
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im0_shift0_qint <= i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_bs1_merged_bit_select_b & "0";
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im0_shift0_q <= i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im0_shift0_qint(18 downto 0);

    -- i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_join_13(BITJOIN,358)@14
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_join_13_q <= i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_im0_shift0_q);

    -- i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_result_add_0_0(ADD,362)@14
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_join_13_q);
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_join_16_q);
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_result_add_0_0_a) + UNSIGNED(i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_result_add_0_0_b));
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_result_add_0_0_q <= i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_result_add_0_0_o(66 downto 0);

    -- i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_extender_x(BITJOIN,49)@14
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_extender_x_q <= i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_multconst_x_q & i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_x_result_add_0_0_q(65 downto 0);

    -- i_vloadgep_i_gemm_nn9w_gemm_nn9w65_trunc_sel_x(BITSELECT,51)@14
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_trunc_sel_x_b <= i_vloadgep_i_gemm_nn9w_gemm_nn9w65_mult_extender_x_q(63 downto 0);

    -- redist57_i_vloadgep_i_gemm_nn9w_gemm_nn9w65_trunc_sel_x_b_1(DELAY,456)
    redist57_i_vloadgep_i_gemm_nn9w_gemm_nn9w65_trunc_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 64, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_vloadgep_i_gemm_nn9w_gemm_nn9w65_trunc_sel_x_b, xout => redist57_i_vloadgep_i_gemm_nn9w_gemm_nn9w65_trunc_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_syncbuf_b_sync_buffer_gemm_nn9w(BLACKBOX,120)@0
    -- in in_i_dependence@15
    -- in in_valid_in@15
    -- out out_buffer_out@15
    -- out out_valid_out@15
    thei_syncbuf_b_sync_buffer_gemm_nn9w : i_syncbuf_b_sync_buffer_gemm_nn9w63
    PORT MAP (
        in_buffer_in => in_B,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist56_sync_in_aunroll_x_in_i_valid_14_q,
        out_buffer_out => i_syncbuf_b_sync_buffer_gemm_nn9w_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_vloadgep_i_gemm_nn9w_gemm_nn9w65_add_x(ADD,52)@15
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_add_x_a <= STD_LOGIC_VECTOR("0" & i_syncbuf_b_sync_buffer_gemm_nn9w_out_buffer_out);
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_add_x_b <= STD_LOGIC_VECTOR("0" & redist57_i_vloadgep_i_gemm_nn9w_gemm_nn9w65_trunc_sel_x_b_1_q);
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_add_x_o <= STD_LOGIC_VECTOR(UNSIGNED(i_vloadgep_i_gemm_nn9w_gemm_nn9w65_add_x_a) + UNSIGNED(i_vloadgep_i_gemm_nn9w_gemm_nn9w65_add_x_b));
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_add_x_q <= i_vloadgep_i_gemm_nn9w_gemm_nn9w65_add_x_o(64 downto 0);

    -- i_vloadgep_i_gemm_nn9w_gemm_nn9w65_dupName_0_trunc_sel_x(BITSELECT,46)@15
    i_vloadgep_i_gemm_nn9w_gemm_nn9w65_dupName_0_trunc_sel_x_b <= i_vloadgep_i_gemm_nn9w_gemm_nn9w65_add_x_q(63 downto 0);

    -- redist41_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_10_inputreg(DELAY,493)
    redist41_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_10_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist40_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_7_outputreg_q, xout => redist41_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_10_inputreg_q, clk => clock, aclr => resetn );

    -- redist41_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_10(DELAY,440)
    redist41_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_10 : dspba_delay
    GENERIC MAP ( width => 32, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist41_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_10_inputreg_q, xout => redist41_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_10_q, clk => clock, aclr => resetn );

    -- redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_notEnable(LOGICAL,501)
    redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_nor(LOGICAL,502)
    redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_nor_q <= not (redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_notEnable_q or redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_sticky_ena_q);

    -- redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_last(CONSTANT,498)
    redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_last_q <= "011";

    -- redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_cmp(LOGICAL,499)
    redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_cmp_q <= "1" WHEN redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_last_q = redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt_q ELSE "0";

    -- redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_cmpReg(REG,500)
    redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_cmpReg_q <= STD_LOGIC_VECTOR(redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_cmp_q);
        END IF;
    END PROCESS;

    -- redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_sticky_ena(REG,503)
    redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_nor_q = "1") THEN
                redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_sticky_ena_q <= STD_LOGIC_VECTOR(redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_enaAnd(LOGICAL,504)
    redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_enaAnd_q <= redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_sticky_ena_q and VCC_q;

    -- redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt(COUNTER,496)
    -- low=0, high=4, step=1, init=0
    redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt_eq <= '1';
            ELSE
                redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt_eq <= '0';
            END IF;
            IF (redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt_eq = '1') THEN
                redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt_i <= redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt_i + 4;
            ELSE
                redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt_i <= redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt_i, 3)));

    -- redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_inputreg(DELAY,494)
    redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_inputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist42_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_2_q, xout => redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_inputreg_q, clk => clock, aclr => resetn );

    -- redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_wraddr(REG,497)
    redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_wraddr_q <= "100";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_wraddr_q <= STD_LOGIC_VECTOR(redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem(DUALMEM,495)
    redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_ia <= STD_LOGIC_VECTOR(redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_inputreg_q);
    redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_aa <= redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_wraddr_q;
    redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_ab <= redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_rdcnt_q;
    redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_reset0 <= not (resetn);
    redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_dmem : altera_syncram
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
        clocken1 => redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_reset0,
        clock1 => clock,
        address_a => redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_aa,
        data_a => redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_ab,
        q_b => redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_iq
    );
    redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_q <= redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_iq(31 downto 0);

    -- redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_notEnable(LOGICAL,477)
    redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_nor(LOGICAL,478)
    redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_nor_q <= not (redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_notEnable_q or redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_sticky_ena_q);

    -- redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_last(CONSTANT,474)
    redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_last_q <= "0100";

    -- redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_cmp(LOGICAL,475)
    redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_cmp_b <= STD_LOGIC_VECTOR("0" & redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt_q);
    redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_cmp_q <= "1" WHEN redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_last_q = redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_cmp_b ELSE "0";

    -- redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_cmpReg(REG,476)
    redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_cmpReg_q <= STD_LOGIC_VECTOR(redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_cmp_q);
        END IF;
    END PROCESS;

    -- redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_sticky_ena(REG,479)
    redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_nor_q = "1") THEN
                redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_sticky_ena_q <= STD_LOGIC_VECTOR(redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_enaAnd(LOGICAL,480)
    redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_enaAnd_q <= redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_sticky_ena_q and VCC_q;

    -- redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt(COUNTER,472)
    -- low=0, high=5, step=1, init=0
    redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt_i <= TO_UNSIGNED(0, 3);
            redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt_i = TO_UNSIGNED(4, 3)) THEN
                redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt_eq <= '1';
            ELSE
                redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt_eq <= '0';
            END IF;
            IF (redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt_eq = '1') THEN
                redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt_i <= redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt_i + 3;
            ELSE
                redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt_i <= redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt_i, 3)));

    -- redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_wraddr(REG,473)
    redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_wraddr_q <= "101";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_wraddr_q <= STD_LOGIC_VECTOR(redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem(DUALMEM,471)
    redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_ia <= STD_LOGIC_VECTOR(redist24_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_1_q);
    redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_aa <= redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_wraddr_q;
    redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_ab <= redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_rdcnt_q;
    redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_reset0 <= not (resetn);
    redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 6,
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
        clocken1 => redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_reset0,
        clock1 => clock,
        address_a => redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_aa,
        data_a => redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_ab,
        q_b => redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_iq
    );
    redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_q <= redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_iq(31 downto 0);

    -- redist49_i_acl_pipeline_keep_going_gemm_nn9w_out_data_out_14(DELAY,448)
    redist49_i_acl_pipeline_keep_going_gemm_nn9w_out_data_out_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 9, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist48_i_acl_pipeline_keep_going_gemm_nn9w_out_data_out_5_q, xout => redist49_i_acl_pipeline_keep_going_gemm_nn9w_out_data_out_14_q, clk => clock, aclr => resetn );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,57)@15
    out_c0_exi15_0 <= GND_q;
    out_c0_exi15_1 <= redist49_i_acl_pipeline_keep_going_gemm_nn9w_out_data_out_14_q;
    out_c0_exi15_2 <= redist25_resFinalIntDiv_uid234_i_div1_rm_gemm_nn9w_b_8_mem_q;
    out_c0_exi15_3 <= redist43_i_acl_pop_i32_j_076_pop9321_pop33_gemm_nn9w_out_data_out_9_mem_q;
    out_c0_exi15_4 <= redist41_i_acl_pop_i32_k_169_pop26_gemm_nn9w_out_data_out_10_q;
    out_c0_exi15_5 <= i_vloadgep_i_gemm_nn9w_gemm_nn9w65_dupName_0_trunc_sel_x_b;
    out_c0_exi15_6 <= redist38_i_cmp75_rm_gemm_nn9w_c_10_q;
    out_c0_exi15_7 <= redist39_i_cmp367_rm_gemm_nn9w_c_10_q;
    out_c0_exi15_8 <= redist34_i_unnamed_gemm_nn9w72_q_9_q;
    out_c0_exi15_9 <= i_first_cleanup_xor_or_gemm_nn9w_q;
    out_c0_exi15_10 <= redist46_i_acl_pop_i1_memdep_phi261_pop11324_pop37_gemm_nn9w_out_data_out_14_q;
    out_c0_exi15_11 <= redist18_resFinalIntDiv_uid317_i_div_rm_gemm_nn9w_b_10_mem_q;
    out_c0_exi15_12 <= redist36_i_masked_gemm_nn9w_q_8_q;
    out_c0_exi15_13 <= redist47_i_acl_pop_i1_forked303319_pop31_gemm_nn9w_out_data_out_9_q;
    out_c0_exi15_14 <= redist44_i_acl_pop_i1_pop34_gemm_nn9w_out_data_out_14_q;
    out_c0_exi15_15 <= redist45_i_acl_pop_i1_notexit300322_pop35_gemm_nn9w_out_data_out_14_q;
    out_o_valid <= redist56_sync_in_aunroll_x_in_i_valid_14_q;

    -- ext_sig_sync_out(GPOUT,71)
    out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_valid_out <= i_acl_pipeline_keep_going_gemm_nn9w_out_exiting_valid_out;
    out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_stall_out <= i_acl_pipeline_keep_going_gemm_nn9w_out_exiting_stall_out;

    -- pipeline_valid_out_sync(GPOUT,146)
    out_pipeline_valid_out <= i_acl_pipeline_keep_going_gemm_nn9w_out_pipeline_valid_out;

END normal;
