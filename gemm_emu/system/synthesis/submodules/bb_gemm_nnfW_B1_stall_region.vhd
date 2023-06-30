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

-- VHDL created from bb_gemm_nnfW_B1_stall_region
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

entity bb_gemm_nnfW_B1_stall_region is
    port (
        in_lda : in std_logic_vector(31 downto 0);  -- ufix32
        in_forked : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_forked : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi_pop10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_sdiv_add124_RM : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_in_10 : in std_logic_vector(7 downto 0);  -- ufix8
        out_feedback_stall_out_10 : out std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_valid_in_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_N : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nnfW_B1_stall_region;

architecture normal of bb_gemm_nnfW_B1_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component gemm_nnfW_B1_merge_reg is
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


    component i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw is
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
            out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw24 is
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


    component i_syncbuf_lda_sync_buffer15_gemm_nnfw2 is
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


    component i_syncbuf_lda_sync_buffer_gemm_nnfw4 is
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
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B1_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B1_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_c0_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_c0_exit_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_c0_exit_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i32_15_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw_out_feedback_stall_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sdiv_add124_rm_gemm_nnfw_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sdiv_add124_rm_gemm_nnfw_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sdiv_add124_rm_gemm_nnfw_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sdiv_add124_rm_gemm_nnfw_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sdiv_and123_rm_gemm_nnfw_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sdiv_and123_rm_gemm_nnfw_vt_const_31_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_sdiv_and123_rm_gemm_nnfw_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sdiv_and123_rm_gemm_nnfw_vt_select_3_b : STD_LOGIC_VECTOR (3 downto 0);
    signal i_syncbuf_lda_sync_buffer15_gemm_nnfw_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_lda_sync_buffer15_gemm_nnfw_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_lda_sync_buffer15_gemm_nnfw_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_lda_sync_buffer_gemm_nnfw_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_lda_sync_buffer_gemm_nnfw_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_lda_sync_buffer_gemm_nnfw_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal xMSB_uid51_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal seMsb_to16_uid53_in : STD_LOGIC_VECTOR (15 downto 0);
    signal seMsb_to16_uid53_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx1Rng16_uid54_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx1_uid55_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid57_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid57_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to8_uid58_in : STD_LOGIC_VECTOR (7 downto 0);
    signal seMsb_to8_uid58_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage1Idx1Rng8_uid59_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b : STD_LOGIC_VECTOR (23 downto 0);
    signal rightShiftStage1Idx1_uid60_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1_uid62_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid62_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to4_uid63_in : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to4_uid63_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage2Idx1Rng4_uid64_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage2Idx1_uid65_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2_uid67_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid67_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to2_uid68_in : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to2_uid68_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage3Idx1Rng2_uid69_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal rightShiftStage3Idx1_uid70_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage3_uid72_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage3_uid72_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage4Idx1Rng1_uid73_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage4Idx1_uid74_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage4_uid76_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage4_uid76_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_gemm_nnfW_B1_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nnfW_B1_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_q : STD_LOGIC_VECTOR (33 downto 0);
    signal bubble_select_i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_syncbuf_lda_sync_buffer15_gemm_nnfw_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_lda_sync_buffer15_gemm_nnfw_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_lda_sync_buffer_gemm_nnfw_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_lda_sync_buffer_gemm_nnfw_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_sdiv_and123_rm_gemm_nnfw_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_sdiv_and123_rm_gemm_nnfw_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_sdiv_and123_rm_gemm_nnfw_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_sdiv_and123_rm_gemm_nnfw_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_D0 : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- bubble_join_gemm_nnfW_B1_merge_reg_aunroll_x(BITJOIN,86)
    bubble_join_gemm_nnfW_B1_merge_reg_aunroll_x_q <= gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_gemm_nnfW_B1_merge_reg_aunroll_x(BITSELECT,87)
    bubble_select_gemm_nnfW_B1_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B1_merge_reg_aunroll_x_q(0 downto 0));

    -- redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0(REG,81)
    redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backEN = "1") THEN
                redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_q <= STD_LOGIC_VECTOR(bubble_select_gemm_nnfW_B1_merge_reg_aunroll_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1(STALLENABLE,148)
    -- Valid signal propagation
    SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V0 <= SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_0;
    SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V1 <= SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_1;
    -- Stall signal propagation
    SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_0 <= SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_backStall and SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_0;
    SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_1 <= i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw_out_stall_out and SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_1;
    -- Backward Enable generation
    SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or0 <= SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_0;
    SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN <= not (SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_1 or SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_v_s_0 <= SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN and SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V;
    -- Backward Stall generation
    SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backStall <= not (SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN);
    SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_0 <= (others => '0');
            SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN = "0") THEN
                SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_0 <= SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_0 and SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_0;
            ELSE
                SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_0 <= SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_v_s_0;
            END IF;

            IF (SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN = "0") THEN
                SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_1 <= SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_1 and SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_s_tv_1;
            ELSE
                SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_R_v_1 <= SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1(STALLREG,195)
    SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid <= (others => '0');
            SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid <= SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backStall and (SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid or SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_i_valid);

            IF (SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_data0 <= STD_LOGIC_VECTOR(redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_i_valid <= SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_V0;
    -- Stall signal propagation
    SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backStall <= SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid or not (SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_i_valid);

    -- Valid
    SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V <= SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid WHEN SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid = "1" ELSE SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_i_valid;

    SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_D0 <= SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_data0 WHEN SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_r_valid = "1" ELSE redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_q;

    -- SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0(STALLENABLE,147)
    -- Valid signal propagation
    SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_V0 <= SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_0 <= SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backStall and SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backEN <= not (SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_v_s_0 <= SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backEN and SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_V2;
    -- Backward Stall generation
    SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backStall <= not (SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_v_s_0);
    SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backEN = "0") THEN
                SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0 <= SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0 and SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_s_tv_0;
            ELSE
                SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_R_v_0 <= SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg(STALLREG,194)
    SR_bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_r_valid <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_r_valid <= bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_backStall and (SR_bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_r_valid or SR_bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_i_valid);

            IF (SR_bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_r_valid = "0") THEN
                -- Data(s)
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_i_valid <= SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_V0;
    -- Stall signal propagation
    SR_bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_backStall <= SR_bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_r_valid or not (SR_bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_i_valid);

    -- Valid
    SR_bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_V <= SR_bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_r_valid WHEN SR_bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_r_valid = "1" ELSE SR_bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_i_valid;


    -- SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw(STALLENABLE,122)
    SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_fromReg0 <= (others => '0');
            SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_fromReg0 <= SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_toReg0;
            -- Succesor 1
            SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_fromReg1 <= SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_consumed0 <= (not (SR_bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_backStall) and SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_wireValid) or SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_fromReg0;
    SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_consumed1 <= (not (SE_i_sdiv_and123_rm_gemm_nnfw_backStall) and SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_wireValid) or SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_fromReg1;
    -- Consuming
    SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_StallValid <= SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_backStall and SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_wireValid;
    SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_toReg0 <= SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_StallValid and SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_consumed0;
    SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_toReg1 <= SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_StallValid and SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_consumed1;
    -- Backward Stall generation
    SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_or0 <= SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_consumed0;
    SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_wireStall <= not (SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_consumed1 and SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_or0);
    SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_backStall <= SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_wireStall;
    -- Valid signal propagation
    SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_V0 <= SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_wireValid and not (SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_fromReg0);
    SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_V1 <= SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_wireValid and not (SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_wireValid <= i_syncbuf_lda_sync_buffer15_gemm_nnfw_out_valid_out;

    -- i_syncbuf_lda_sync_buffer15_gemm_nnfw(BLACKBOX,38)@3
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_lda_sync_buffer15_gemm_nnfw : i_syncbuf_lda_sync_buffer15_gemm_nnfw2
    PORT MAP (
        in_buffer_in => in_lda,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_backStall,
        in_valid_in => SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_V0,
        out_buffer_out => i_syncbuf_lda_sync_buffer15_gemm_nnfw_out_buffer_out,
        out_stall_out => i_syncbuf_lda_sync_buffer15_gemm_nnfw_out_stall_out,
        out_valid_out => i_syncbuf_lda_sync_buffer15_gemm_nnfw_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1(STALLENABLE,156)
    -- Valid signal propagation
    SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_V0 <= SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_backStall <= i_syncbuf_lda_sync_buffer15_gemm_nnfw_out_stall_out or not (SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_wireValid <= bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_valid_out;

    -- bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg(STALLFIFO,189)
    bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_valid_in <= SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_V0;
    bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_stall_in <= SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_backStall;
    bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp <= bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_valid_in(0);
    bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp <= bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_stall_in(0);
    bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_valid_out(0) <= bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp;
    bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_stall_out(0) <= bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp;
    thebubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,125)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= gemm_nnfW_B1_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,107)
    bubble_join_stall_entry_q <= in_forked;

    -- bubble_select_stall_entry(BITSELECT,108)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(0 downto 0));

    -- gemm_nnfW_B1_merge_reg_aunroll_x(BLACKBOX,14)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thegemm_nnfW_B1_merge_reg_aunroll_x : gemm_nnfW_B1_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_b,
        in_stall_in => SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0,
        out_stall_out => gemm_nnfW_B1_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => gemm_nnfW_B1_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_gemm_nnfW_B1_merge_reg_aunroll_x(STALLENABLE,112)
    SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_fromReg2 <= (others => '0');
            SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_fromReg3 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_fromReg0 <= SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_fromReg1 <= SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_fromReg2 <= SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_fromReg3 <= SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_toReg3;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_consumed0 <= (not (bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_1_reg_stall_out) and SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_fromReg0;
    SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_consumed1 <= (not (bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_stall_out) and SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_fromReg1;
    SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_consumed2 <= (not (SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_0_backStall) and SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_fromReg2;
    SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_consumed3 <= (not (i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_o_stall) and SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_fromReg3;
    -- Consuming
    SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_StallValid <= SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_backStall and SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_wireValid;
    SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_toReg0 <= SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_StallValid and SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_consumed0;
    SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_toReg1 <= SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_StallValid and SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_consumed1;
    SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_toReg2 <= SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_StallValid and SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_consumed2;
    SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_toReg3 <= SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_StallValid and SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_consumed3;
    -- Backward Stall generation
    SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_or0 <= SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_consumed0;
    SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_or1 <= SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_consumed1 and SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_or0;
    SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_or2 <= SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_consumed2 and SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_or1;
    SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_wireStall <= not (SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_consumed3 and SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_or2);
    SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_backStall <= SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_V0 <= SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_fromReg0);
    SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_V1 <= SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_fromReg1);
    SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_V2 <= SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_fromReg2);
    SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_V3 <= SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_fromReg3);
    -- Computing multiple Valid(s)
    SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_wireValid <= gemm_nnfW_B1_merge_reg_aunroll_x_out_valid_out;

    -- bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg(STALLFIFO,190)
    bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_valid_in <= SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_V1;
    bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_stall_in <= SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_backStall;
    bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_valid_in_bitsignaltemp <= bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_valid_in(0);
    bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_stall_in_bitsignaltemp <= bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_stall_in(0);
    bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_valid_out(0) <= bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_valid_out_bitsignaltemp;
    bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_stall_out(0) <= bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_stall_out_bitsignaltemp;
    thebubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 3,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2(STALLENABLE,158)
    -- Valid signal propagation
    SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_V0 <= SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_backStall <= i_syncbuf_lda_sync_buffer_gemm_nnfw_out_stall_out or not (SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_wireValid <= bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_reg_valid_out;

    -- SR_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg(STALLREG,193)
    SR_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_r_valid <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_r_valid <= bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_backStall and (SR_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_r_valid or SR_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_i_valid);

            IF (SR_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_r_valid = "0") THEN
                -- Data(s)
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_i_valid <= SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_V0;
    -- Stall signal propagation
    SR_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_backStall <= SR_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_r_valid or not (SR_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_i_valid);

    -- Valid
    SR_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_V <= SR_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_r_valid WHEN SR_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_r_valid = "1" ELSE SR_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_i_valid;


    -- SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw(STALLENABLE,124)
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_fromReg0 <= (others => '0');
            SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_fromReg0 <= SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_toReg0;
            -- Succesor 1
            SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_fromReg1 <= SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_consumed0 <= (not (SR_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_backStall) and SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_wireValid) or SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_fromReg0;
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_consumed1 <= (not (SE_i_sdiv_and123_rm_gemm_nnfw_backStall) and SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_wireValid) or SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_fromReg1;
    -- Consuming
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_StallValid <= SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_backStall and SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_wireValid;
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_toReg0 <= SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_StallValid and SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_consumed0;
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_toReg1 <= SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_StallValid and SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_consumed1;
    -- Backward Stall generation
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_or0 <= SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_consumed0;
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_wireStall <= not (SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_consumed1 and SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_or0);
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_backStall <= SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_wireStall;
    -- Valid signal propagation
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_V0 <= SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_wireValid and not (SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_fromReg0);
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_V1 <= SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_wireValid and not (SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_wireValid <= i_syncbuf_lda_sync_buffer_gemm_nnfw_out_valid_out;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_syncbuf_lda_sync_buffer_gemm_nnfw(BLACKBOX,39)@3
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_lda_sync_buffer_gemm_nnfw : i_syncbuf_lda_sync_buffer_gemm_nnfw4
    PORT MAP (
        in_buffer_in => in_lda,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_backStall,
        in_valid_in => SE_out_bubble_out_gemm_nnfW_B1_merge_reg_aunroll_x_2_V0,
        out_buffer_out => i_syncbuf_lda_sync_buffer_gemm_nnfw_out_buffer_out,
        out_stall_out => i_syncbuf_lda_sync_buffer_gemm_nnfw_out_stall_out,
        out_valid_out => i_syncbuf_lda_sync_buffer_gemm_nnfw_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_syncbuf_lda_sync_buffer_gemm_nnfw(BITJOIN,103)
    bubble_join_i_syncbuf_lda_sync_buffer_gemm_nnfw_q <= i_syncbuf_lda_sync_buffer_gemm_nnfw_out_buffer_out;

    -- bubble_select_i_syncbuf_lda_sync_buffer_gemm_nnfw(BITSELECT,104)
    bubble_select_i_syncbuf_lda_sync_buffer_gemm_nnfw_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_lda_sync_buffer_gemm_nnfw_q(31 downto 0));

    -- i_sdiv_and123_rm_gemm_nnfw_vt_const_31(CONSTANT,35)
    i_sdiv_and123_rm_gemm_nnfw_vt_const_31_q <= "0000000000000000000000000000";

    -- c_i32_15(CONSTANT,24)
    c_i32_15_q <= "00000000000000000000000000001111";

    -- bubble_join_i_syncbuf_lda_sync_buffer15_gemm_nnfw(BITJOIN,99)
    bubble_join_i_syncbuf_lda_sync_buffer15_gemm_nnfw_q <= i_syncbuf_lda_sync_buffer15_gemm_nnfw_out_buffer_out;

    -- bubble_select_i_syncbuf_lda_sync_buffer15_gemm_nnfw(BITSELECT,100)
    bubble_select_i_syncbuf_lda_sync_buffer15_gemm_nnfw_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_lda_sync_buffer15_gemm_nnfw_q(31 downto 0));

    -- xMSB_uid51_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x(BITSELECT,50)@3
    xMSB_uid51_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b <= STD_LOGIC_VECTOR(bubble_select_i_syncbuf_lda_sync_buffer15_gemm_nnfw_b(31 downto 31));

    -- rightShiftStage4Idx1Rng1_uid73_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x(BITSELECT,72)@3
    rightShiftStage4Idx1Rng1_uid73_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b <= rightShiftStage3_uid72_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q(31 downto 1);

    -- rightShiftStage4Idx1_uid74_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x(BITJOIN,73)@3
    rightShiftStage4Idx1_uid74_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q <= xMSB_uid51_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b & rightShiftStage4Idx1Rng1_uid73_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b;

    -- seMsb_to2_uid68(BITSELECT,67)@3
    seMsb_to2_uid68_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => xMSB_uid51_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b(0)) & xMSB_uid51_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b));
    seMsb_to2_uid68_b <= STD_LOGIC_VECTOR(seMsb_to2_uid68_in(1 downto 0));

    -- rightShiftStage3Idx1Rng2_uid69_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x(BITSELECT,68)@3
    rightShiftStage3Idx1Rng2_uid69_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b <= rightShiftStage2_uid67_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q(31 downto 2);

    -- rightShiftStage3Idx1_uid70_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x(BITJOIN,69)@3
    rightShiftStage3Idx1_uid70_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q <= seMsb_to2_uid68_b & rightShiftStage3Idx1Rng2_uid69_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b;

    -- seMsb_to4_uid63(BITSELECT,62)@3
    seMsb_to4_uid63_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 1 => xMSB_uid51_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b(0)) & xMSB_uid51_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b));
    seMsb_to4_uid63_b <= STD_LOGIC_VECTOR(seMsb_to4_uid63_in(3 downto 0));

    -- rightShiftStage2Idx1Rng4_uid64_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x(BITSELECT,63)@3
    rightShiftStage2Idx1Rng4_uid64_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b <= rightShiftStage1_uid62_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q(31 downto 4);

    -- rightShiftStage2Idx1_uid65_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x(BITJOIN,64)@3
    rightShiftStage2Idx1_uid65_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q <= seMsb_to4_uid63_b & rightShiftStage2Idx1Rng4_uid64_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b;

    -- seMsb_to8_uid58(BITSELECT,57)@3
    seMsb_to8_uid58_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 1 => xMSB_uid51_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b(0)) & xMSB_uid51_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b));
    seMsb_to8_uid58_b <= STD_LOGIC_VECTOR(seMsb_to8_uid58_in(7 downto 0));

    -- rightShiftStage1Idx1Rng8_uid59_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x(BITSELECT,58)@3
    rightShiftStage1Idx1Rng8_uid59_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b <= rightShiftStage0_uid57_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q(31 downto 8);

    -- rightShiftStage1Idx1_uid60_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x(BITJOIN,59)@3
    rightShiftStage1Idx1_uid60_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q <= seMsb_to8_uid58_b & rightShiftStage1Idx1Rng8_uid59_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b;

    -- seMsb_to16_uid53(BITSELECT,52)@3
    seMsb_to16_uid53_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 1 => xMSB_uid51_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b(0)) & xMSB_uid51_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b));
    seMsb_to16_uid53_b <= STD_LOGIC_VECTOR(seMsb_to16_uid53_in(15 downto 0));

    -- rightShiftStage0Idx1Rng16_uid54_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x(BITSELECT,53)@3
    rightShiftStage0Idx1Rng16_uid54_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b <= bubble_select_i_syncbuf_lda_sync_buffer15_gemm_nnfw_b(31 downto 16);

    -- rightShiftStage0Idx1_uid55_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x(BITJOIN,54)@3
    rightShiftStage0Idx1_uid55_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q <= seMsb_to16_uid53_b & rightShiftStage0Idx1Rng16_uid54_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_b;

    -- rightShiftStage0_uid57_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x(MUX,56)@3
    rightShiftStage0_uid57_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_s <= VCC_q;
    rightShiftStage0_uid57_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_combproc: PROCESS (rightShiftStage0_uid57_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_s, bubble_select_i_syncbuf_lda_sync_buffer15_gemm_nnfw_b, rightShiftStage0Idx1_uid55_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid57_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid57_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q <= bubble_select_i_syncbuf_lda_sync_buffer15_gemm_nnfw_b;
            WHEN "1" => rightShiftStage0_uid57_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q <= rightShiftStage0Idx1_uid55_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid57_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid62_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x(MUX,61)@3
    rightShiftStage1_uid62_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_s <= VCC_q;
    rightShiftStage1_uid62_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_combproc: PROCESS (rightShiftStage1_uid62_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_s, rightShiftStage0_uid57_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q, rightShiftStage1Idx1_uid60_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q)
    BEGIN
        CASE (rightShiftStage1_uid62_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_s) IS
            WHEN "0" => rightShiftStage1_uid62_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q <= rightShiftStage0_uid57_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q;
            WHEN "1" => rightShiftStage1_uid62_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q <= rightShiftStage1Idx1_uid60_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q;
            WHEN OTHERS => rightShiftStage1_uid62_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage2_uid67_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x(MUX,66)@3
    rightShiftStage2_uid67_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_s <= VCC_q;
    rightShiftStage2_uid67_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_combproc: PROCESS (rightShiftStage2_uid67_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_s, rightShiftStage1_uid62_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q, rightShiftStage2Idx1_uid65_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q)
    BEGIN
        CASE (rightShiftStage2_uid67_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_s) IS
            WHEN "0" => rightShiftStage2_uid67_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q <= rightShiftStage1_uid62_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q;
            WHEN "1" => rightShiftStage2_uid67_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q <= rightShiftStage2Idx1_uid65_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q;
            WHEN OTHERS => rightShiftStage2_uid67_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage3_uid72_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x(MUX,71)@3
    rightShiftStage3_uid72_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_s <= VCC_q;
    rightShiftStage3_uid72_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_combproc: PROCESS (rightShiftStage3_uid72_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_s, rightShiftStage2_uid67_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q, rightShiftStage3Idx1_uid70_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q)
    BEGIN
        CASE (rightShiftStage3_uid72_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_s) IS
            WHEN "0" => rightShiftStage3_uid72_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q <= rightShiftStage2_uid67_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q;
            WHEN "1" => rightShiftStage3_uid72_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q <= rightShiftStage3Idx1_uid70_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q;
            WHEN OTHERS => rightShiftStage3_uid72_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- rightShiftStage4_uid76_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x(MUX,75)@3
    rightShiftStage4_uid76_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_s <= VCC_q;
    rightShiftStage4_uid76_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_combproc: PROCESS (rightShiftStage4_uid76_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_s, rightShiftStage3_uid72_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q, rightShiftStage4Idx1_uid74_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q)
    BEGIN
        CASE (rightShiftStage4_uid76_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_s) IS
            WHEN "0" => rightShiftStage4_uid76_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q <= rightShiftStage3_uid72_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q;
            WHEN "1" => rightShiftStage4_uid76_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q <= rightShiftStage4Idx1_uid74_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q;
            WHEN OTHERS => rightShiftStage4_uid76_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_sdiv_and123_rm_gemm_nnfw(LOGICAL,34)@3
    i_sdiv_and123_rm_gemm_nnfw_q <= rightShiftStage4_uid76_i_sdiv_mask122_rm_gemm_nnfw_gemm_nnfw26_shift_x_q and c_i32_15_q;

    -- i_sdiv_and123_rm_gemm_nnfw_vt_select_3(BITSELECT,37)@3
    i_sdiv_and123_rm_gemm_nnfw_vt_select_3_b <= i_sdiv_and123_rm_gemm_nnfw_q(3 downto 0);

    -- i_sdiv_and123_rm_gemm_nnfw_vt_join(BITJOIN,36)@3
    i_sdiv_and123_rm_gemm_nnfw_vt_join_q <= i_sdiv_and123_rm_gemm_nnfw_vt_const_31_q & i_sdiv_and123_rm_gemm_nnfw_vt_select_3_b;

    -- i_sdiv_add124_rm_gemm_nnfw(ADD,33)@3
    i_sdiv_add124_rm_gemm_nnfw_a <= STD_LOGIC_VECTOR("0" & i_sdiv_and123_rm_gemm_nnfw_vt_join_q);
    i_sdiv_add124_rm_gemm_nnfw_b <= STD_LOGIC_VECTOR("0" & bubble_select_i_syncbuf_lda_sync_buffer_gemm_nnfw_b);
    i_sdiv_add124_rm_gemm_nnfw_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sdiv_add124_rm_gemm_nnfw_a) + UNSIGNED(i_sdiv_add124_rm_gemm_nnfw_b));
    i_sdiv_add124_rm_gemm_nnfw_q <= i_sdiv_add124_rm_gemm_nnfw_o(32 downto 0);

    -- bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x(BITSELECT,2)@3
    bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b <= i_sdiv_add124_rm_gemm_nnfw_q(31 downto 0);

    -- SE_i_sdiv_and123_rm_gemm_nnfw(STALLENABLE,118)
    -- Valid signal propagation
    SE_i_sdiv_and123_rm_gemm_nnfw_V0 <= SE_i_sdiv_and123_rm_gemm_nnfw_wireValid;
    -- Backward Stall generation
    SE_i_sdiv_and123_rm_gemm_nnfw_backStall <= SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_backStall or not (SE_i_sdiv_and123_rm_gemm_nnfw_wireValid);
    -- Computing multiple Valid(s)
    SE_i_sdiv_and123_rm_gemm_nnfw_and0 <= SE_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_V1;
    SE_i_sdiv_and123_rm_gemm_nnfw_wireValid <= SE_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_V1 and SE_i_sdiv_and123_rm_gemm_nnfw_and0;

    -- SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0(STALLREG,196)
    SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_r_valid <= (others => '0');
            SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_r_valid <= SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_backStall and (SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_r_valid or SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_i_valid);

            IF (SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_r_data0 <= STD_LOGIC_VECTOR(bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_i_valid <= SE_i_sdiv_and123_rm_gemm_nnfw_V0;
    -- Stall signal propagation
    SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_backStall <= SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_r_valid or not (SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_i_valid);

    -- Valid
    SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_V <= SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_r_valid WHEN SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_r_valid = "1" ELSE SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_i_valid;

    SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_D0 <= SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_r_data0 WHEN SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_r_valid = "1" ELSE bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b;

    -- SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0(STALLENABLE,150)
    -- Valid signal propagation
    SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_V0 <= SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_s_tv_0 <= SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_backStall and SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_backEN <= not (SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_v_s_0 <= SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_backEN and SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_V;
    -- Backward Stall generation
    SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_backStall <= not (SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_backEN);
    SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_backEN = "0") THEN
                SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_R_v_0 <= SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_R_v_0 and SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_s_tv_0;
            ELSE
                SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_R_v_0 <= SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0(STALLENABLE,149)
    -- Valid signal propagation
    SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_V0 <= SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_R_v_0;
    -- Stall signal propagation
    SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_s_tv_0 <= SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_backStall and SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_R_v_0;
    -- Backward Enable generation
    SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_backEN <= not (SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_v_s_0 <= SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_backEN and SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V0;
    -- Backward Stall generation
    SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_backStall <= not (SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_v_s_0);
    SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_backEN = "0") THEN
                SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_R_v_0 <= SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_R_v_0 and SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_s_tv_0;
            ELSE
                SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_R_v_0 <= SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x(BLACKBOX,21)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit_0@4
    -- out out_c0_exit_1@4
    -- out out_c0_exit_2@4
    -- out out_c0_exit_3@4
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_stall_out@20000000
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_valid_out@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@4
    -- out out_pipeline_valid_out@20000000
    thei_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x : i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw
    PORT MAP (
        in_c0_eni1_0 => GND_q,
        in_c0_eni1_1 => bubble_select_gemm_nnfW_B1_merge_reg_aunroll_x_b,
        in_N => in_N,
        in_i_stall => SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_backStall,
        in_i_valid => SE_out_gemm_nnfW_B1_merge_reg_aunroll_x_V3,
        in_pipeline_stall_in => in_pipeline_stall_in,
        out_c0_exit_1 => i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_c0_exit_1,
        out_c0_exit_2 => i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_c0_exit_2,
        out_c0_exit_3 => i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_c0_exit_3,
        out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_stall_out => i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_valid_out => i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_valid_out,
        out_o_stall => i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_o_valid,
        out_pipeline_valid_out => i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1(REG,82)
    redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_backEN = "1") THEN
                redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_q <= STD_LOGIC_VECTOR(SR_SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_D0);
            END IF;
        END IF;
    END PROCESS;

    -- i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw(BLACKBOX,32)@3
    -- in in_stall_in@20000000
    -- out out_data_out@4
    -- out out_feedback_stall_out_10@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@4
    thei_acl_pop_i1_memdep_phi_pop10_gemm_nnfw : i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw24
    PORT MAP (
        in_data_in => GND_q,
        in_dir => redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_q,
        in_feedback_in_10 => in_feedback_in_10,
        in_feedback_valid_in_10 => in_feedback_valid_in_10,
        in_predicate => GND_q,
        in_stall_in => SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_backStall,
        in_valid_in => SE_redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_V1,
        out_data_out => i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw_out_data_out,
        out_feedback_stall_out_10 => i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw_out_feedback_stall_out_10,
        out_stall_out => i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw_out_stall_out,
        out_valid_out => i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg(STALLENABLE,191)
    -- Valid signal propagation
    bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_V0 <= bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_R_v_0;
    -- Stall signal propagation
    bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_s_tv_0 <= SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_backStall and bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_R_v_0;
    -- Backward Enable generation
    bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_backEN <= not (bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_v_s_0 <= bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_backEN and SR_bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_V;
    -- Backward Stall generation
    bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_backStall <= not (bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_backEN);
    bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_backEN = "0") THEN
                bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_R_v_0 <= bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_R_v_0 and bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_s_tv_0;
            ELSE
                bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_R_v_0 <= bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg(STALLENABLE,192)
    -- Valid signal propagation
    bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_V0 <= bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_R_v_0;
    -- Stall signal propagation
    bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_s_tv_0 <= SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_backStall and bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_R_v_0;
    -- Backward Enable generation
    bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_backEN <= not (bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_v_s_0 <= bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_backEN and SR_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_V;
    -- Backward Stall generation
    bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_backStall <= not (bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_backEN);
    bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_backEN = "0") THEN
                bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_R_v_0 <= bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_R_v_0 and bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_s_tv_0;
            ELSE
                bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_R_v_0 <= bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1(STALLENABLE,182)
    -- Valid signal propagation
    SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_V0 <= SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_backStall <= in_stall_in or not (SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_and0 <= bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_reg_V0;
    SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_and1 <= bubble_out_i_syncbuf_lda_sync_buffer15_gemm_nnfw_1_reg_V0 and SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_and0;
    SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_and2 <= i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw_out_valid_out and SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_and1;
    SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_and3 <= i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_o_valid and SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_and2;
    SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_and4 <= SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_V0 and SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_and3;
    SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_wireValid <= SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_V0 and SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_and4;

    -- redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0(REG,84)
    redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_backEN = "1") THEN
                redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw(BITJOIN,95)
    bubble_join_i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw_q <= i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw_out_data_out;

    -- bubble_select_i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw(BITSELECT,96)
    bubble_select_i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw_b <= STD_LOGIC_VECTOR(bubble_join_i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw_q(0 downto 0));

    -- redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0(REG,83)
    redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_backEN = "1") THEN
                redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_q <= STD_LOGIC_VECTOR(redist0_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_2_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x(BITJOIN,91)
    bubble_join_i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_q <= i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_c0_exit_3 & i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_c0_exit_2 & i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_c0_exit_1;

    -- bubble_select_i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x(BITSELECT,92)
    bubble_select_i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_q(31 downto 0));
    bubble_select_i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_q(32 downto 32));
    bubble_select_i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_q(33 downto 33));

    -- dupName_0_sync_out_x(GPOUT,7)@4
    out_c0_exe1 <= bubble_select_i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_b;
    out_c0_exe2 <= bubble_select_i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_c;
    out_c0_exe3 <= bubble_select_i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_d;
    out_forked <= redist1_gemm_nnfW_B1_merge_reg_aunroll_x_out_data_out_0_3_0_q;
    out_memdep_phi_pop10 <= bubble_select_i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw_b;
    out_sdiv_add124_RM <= redist2_bgTrunc_i_sdiv_add124_rm_gemm_nnfw_sel_x_b_1_0_q;
    out_valid_out <= SE_out_bubble_out_i_syncbuf_lda_sync_buffer_gemm_nnfw_1_V0;

    -- ext_sig_sync_out(GPOUT,28)
    out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_valid_out <= i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_valid_out;
    out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_stall_out <= i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_stall_out;

    -- feedback_stall_out_10_sync(GPOUT,30)
    out_feedback_stall_out_10 <= i_acl_pop_i1_memdep_phi_pop10_gemm_nnfw_out_feedback_stall_out_10;

    -- pipeline_valid_out_sync(GPOUT,43)
    out_pipeline_valid_out <= i_sfc_c0_for_cond2_preheader_gemm_nnfw_c0_enter_gemm_nnfw_aunroll_x_out_pipeline_valid_out;

    -- sync_out(GPOUT,48)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
