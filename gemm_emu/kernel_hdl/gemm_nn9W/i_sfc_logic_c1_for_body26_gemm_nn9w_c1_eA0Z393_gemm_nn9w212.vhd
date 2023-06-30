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

-- VHDL created from i_sfc_logic_c1_for_body26_gemm_nn9w_c1_enter393_gemm_nn9w212
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

entity i_sfc_logic_c1_for_body26_gemm_nn9w_c1_enter393_gemm_nn9w212 is
    port (
        in_c1_eni1392_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni1392_1 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi1395_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi1395_1 : out std_logic_vector(63 downto 0);  -- ufix64
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c1_for_body26_gemm_nn9w_c1_enter393_gemm_nn9w212;

architecture normal of i_sfc_logic_c1_for_body26_gemm_nn9w_c1_enter393_gemm_nn9w212 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_fp_convert_from_half is
        port (
            dataa : in std_logic_vector(15 downto 0);
            enable : in std_logic;
            stall_in : in std_logic;
            valid_in : in std_logic;
            result : out std_logic_vector(31 downto 0);
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_conv3_i_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_conv6_i_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_conv_i_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_8388607_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i64_0gr_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_convert_halftofp_conv31_hf_gemm_nn9w_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_conv31_hf_gemm_nn9w_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_conv31_hf_gemm_nn9w_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_conv31_hf_gemm_nn9w_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_conv31_hf_gemm_nn9w_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_conv31_hf_gemm_nn9w_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_conv31_hf_gemm_nn9w_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_conv31_hf_gemm_nn9w_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and2_i_gemm_nn9w_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and2_i_gemm_nn9w_vt_const_31_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_and2_i_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and2_i_gemm_nn9w_vt_select_22_b : STD_LOGIC_VECTOR (22 downto 0);
    signal i_and4_i_gemm_nn9w_vt_const_31_q : STD_LOGIC_VECTOR (22 downto 0);
    signal i_and4_i_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and4_i_gemm_nn9w_vt_select_8_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_cmp8_i_gemm_nn9w_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_cmp8_i_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_conv3_i_gemm_nn9w_vt_const_63_q : STD_LOGIC_VECTOR (40 downto 0);
    signal i_conv3_i_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_conv3_i_gemm_nn9w_vt_select_22_b : STD_LOGIC_VECTOR (22 downto 0);
    signal i_conv3_or11_i_gemm_nn9w_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_conv3_or11_i_gemm_nn9w_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_conv3_or11_i_gemm_nn9w_vt_const_63_q : STD_LOGIC_VECTOR (39 downto 0);
    signal i_conv3_or11_i_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_conv3_or11_i_gemm_nn9w_vt_select_23_b : STD_LOGIC_VECTOR (23 downto 0);
    signal i_conv3_or11_op_i_gemm_nn9w_vt_const_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_conv3_or11_op_i_gemm_nn9w_vt_const_63_q : STD_LOGIC_VECTOR (36 downto 0);
    signal i_conv3_or11_op_i_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_conv3_or11_op_i_gemm_nn9w_vt_select_26_b : STD_LOGIC_VECTOR (23 downto 0);
    signal i_conv6_i_gemm_nn9w_vt_const_63_q : STD_LOGIC_VECTOR (55 downto 0);
    signal i_conv6_i_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_conv6_i_gemm_nn9w_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_conv_i_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_conv_i_gemm_nn9w_vt_select_31_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_or11_i_gemm_nn9w_vt_const_63_q : STD_LOGIC_VECTOR (40 downto 0);
    signal i_or11_i_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_or11_i_gemm_nn9w_vt_select_22_b : STD_LOGIC_VECTOR (22 downto 0);
    signal i_or22_i_gemm_nn9w_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_or22_i_gemm_nn9w_vt_const_26_q : STD_LOGIC_VECTOR (26 downto 0);
    signal i_or22_i_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_or23_i_gemm_nn9w_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_or23_i_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_shl20_i_gemm_nn9w_vt_const_35_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_shl20_i_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_shl20_i_gemm_nn9w_vt_select_36_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_shl21_i_gemm_nn9w_vt_const_63_q : STD_LOGIC_VECTOR (28 downto 0);
    signal i_shl21_i_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_shl21_i_gemm_nn9w_vt_select_34_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_shl_i_gemm_nn9w_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_shl_i_gemm_nn9w_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_shl_i_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_shl_i_gemm_nn9w_vt_select_26_b : STD_LOGIC_VECTOR (23 downto 0);
    signal i_shr5_i_gemm_nn9w_vt_const_31_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_shr5_i_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shr5_i_gemm_nn9w_vt_select_7_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_unnamed_gemm_nn9w217_vt_const_4_q : STD_LOGIC_VECTOR (4 downto 0);
    signal i_unnamed_gemm_nn9w217_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_unnamed_gemm_nn9w217_vt_select_36_b : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0Idx1Rng16_uid112_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx1Pad16_uid113_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx1_uid114_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid116_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid116_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1Idx1Rng4_uid117_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_b : STD_LOGIC_VECTOR (27 downto 0);
    signal rightShiftStage1Idx1Pad4_uid118_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage1Idx1_uid119_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1_uid121_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid121_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2Idx1Rng2_uid122_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_b : STD_LOGIC_VECTOR (29 downto 0);
    signal rightShiftStage2Idx1Pad2_uid123_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2Idx1_uid124_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2_uid126_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid126_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage3Idx1Rng1_uid127_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage3Idx1_uid129_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage3_uid131_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage3_uid131_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal leftShiftStage0Idx1Rng2_uid137_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_in : STD_LOGIC_VECTOR (61 downto 0);
    signal leftShiftStage0Idx1Rng2_uid137_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_b : STD_LOGIC_VECTOR (61 downto 0);
    signal leftShiftStage0Idx1_uid138_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage0_uid140_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid140_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage1Idx1Rng1_uid142_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_in : STD_LOGIC_VECTOR (62 downto 0);
    signal leftShiftStage1Idx1Rng1_uid142_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_b : STD_LOGIC_VECTOR (62 downto 0);
    signal leftShiftStage1Idx1_uid143_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage1_uid145_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid145_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage0Idx1Rng16_uid151_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_in : STD_LOGIC_VECTOR (47 downto 0);
    signal leftShiftStage0Idx1Rng16_uid151_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_b : STD_LOGIC_VECTOR (47 downto 0);
    signal leftShiftStage0Idx1_uid152_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage0_uid154_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid154_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage1Idx1Pad8_uid155_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal leftShiftStage1Idx1Rng8_uid156_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_in : STD_LOGIC_VECTOR (55 downto 0);
    signal leftShiftStage1Idx1Rng8_uid156_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_b : STD_LOGIC_VECTOR (55 downto 0);
    signal leftShiftStage1Idx1_uid157_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage1_uid159_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid159_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage2Idx1Rng2_uid161_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_in : STD_LOGIC_VECTOR (61 downto 0);
    signal leftShiftStage2Idx1Rng2_uid161_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_b : STD_LOGIC_VECTOR (61 downto 0);
    signal leftShiftStage2Idx1_uid162_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage2_uid164_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage2_uid164_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage3Idx1Rng1_uid166_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_in : STD_LOGIC_VECTOR (62 downto 0);
    signal leftShiftStage3Idx1Rng1_uid166_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_b : STD_LOGIC_VECTOR (62 downto 0);
    signal leftShiftStage3Idx1_uid167_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage3_uid169_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage3_uid169_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage0Idx1Rng4_uid175_i_unnamed_gemm_nn9w218_shift_x_in : STD_LOGIC_VECTOR (59 downto 0);
    signal leftShiftStage0Idx1Rng4_uid175_i_unnamed_gemm_nn9w218_shift_x_b : STD_LOGIC_VECTOR (59 downto 0);
    signal leftShiftStage0Idx1_uid176_i_unnamed_gemm_nn9w218_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage0_uid178_i_unnamed_gemm_nn9w218_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage0_uid178_i_unnamed_gemm_nn9w218_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage1Idx1Rng1_uid180_i_unnamed_gemm_nn9w218_shift_x_in : STD_LOGIC_VECTOR (62 downto 0);
    signal leftShiftStage1Idx1Rng1_uid180_i_unnamed_gemm_nn9w218_shift_x_b : STD_LOGIC_VECTOR (62 downto 0);
    signal leftShiftStage1Idx1_uid181_i_unnamed_gemm_nn9w218_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal leftShiftStage1_uid183_i_unnamed_gemm_nn9w218_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal leftShiftStage1_uid183_i_unnamed_gemm_nn9w218_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_or11_i_gemm_nn9w_BitSelect_for_a_b : STD_LOGIC_VECTOR (22 downto 0);
    signal i_or11_i_gemm_nn9w_BitSelect_for_a_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or11_i_gemm_nn9w_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_shl20_i_gemm_nn9w_BitSelect_for_a_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_shl20_i_gemm_nn9w_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_shr5_i_gemm_nn9w_BitSelect_for_a_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_shr5_i_gemm_nn9w_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_or22_i_gemm_nn9w_vt_select_34_merged_bit_select_in : STD_LOGIC_VECTOR (36 downto 0);
    signal i_or22_i_gemm_nn9w_vt_select_34_merged_bit_select_b : STD_LOGIC_VECTOR (7 downto 0);
    signal i_or22_i_gemm_nn9w_vt_select_34_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or23_i_gemm_nn9w_vt_select_34_merged_bit_select_in : STD_LOGIC_VECTOR (36 downto 0);
    signal i_or23_i_gemm_nn9w_vt_select_34_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_or23_i_gemm_nn9w_vt_select_34_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_or22_i_gemm_nn9w_vt_select_34_merged_bit_select_b_1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist1_i_or22_i_gemm_nn9w_vt_select_34_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_and2_i_gemm_nn9w_vt_select_22_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist3_sync_in_aunroll_x_in_i_valid_2_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist3_sync_in_aunroll_x_in_i_valid_2(DELAY,198)
    redist3_sync_in_aunroll_x_in_i_valid_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist3_sync_in_aunroll_x_in_i_valid_2_q, clk => clock, aclr => resetn );

    -- i_or22_i_gemm_nn9w_vt_const_26(CONSTANT,71)
    i_or22_i_gemm_nn9w_vt_const_26_q <= "000000000000000000000000000";

    -- i_conv3_or11_op_i_gemm_nn9w_vt_const_63(CONSTANT,55)
    i_conv3_or11_op_i_gemm_nn9w_vt_const_63_q <= "0000000000000000000000000000000000000";

    -- c_i64_0gr(CONSTANT,28)
    c_i64_0gr_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- leftShiftStage1Idx1Rng1_uid142_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x(BITSELECT,141)@130
    leftShiftStage1Idx1Rng1_uid142_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_in <= leftShiftStage0_uid140_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_q(62 downto 0);
    leftShiftStage1Idx1Rng1_uid142_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_b <= leftShiftStage1Idx1Rng1_uid142_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_in(62 downto 0);

    -- leftShiftStage1Idx1_uid143_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x(BITJOIN,142)@130
    leftShiftStage1Idx1_uid143_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_q <= leftShiftStage1Idx1Rng1_uid142_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_b & GND_q;

    -- leftShiftStage0Idx1Rng2_uid137_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x(BITSELECT,136)@130
    leftShiftStage0Idx1Rng2_uid137_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_in <= i_conv3_or11_i_gemm_nn9w_vt_join_q(61 downto 0);
    leftShiftStage0Idx1Rng2_uid137_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_b <= leftShiftStage0Idx1Rng2_uid137_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_in(61 downto 0);

    -- rightShiftStage2Idx1Pad2_uid123_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x(CONSTANT,122)
    rightShiftStage2Idx1Pad2_uid123_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q <= "00";

    -- leftShiftStage0Idx1_uid138_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x(BITJOIN,137)@130
    leftShiftStage0Idx1_uid138_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_q <= leftShiftStage0Idx1Rng2_uid137_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_b & rightShiftStage2Idx1Pad2_uid123_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q;

    -- i_conv3_or11_i_gemm_nn9w_vt_const_63(CONSTANT,51)
    i_conv3_or11_i_gemm_nn9w_vt_const_63_q <= "0000000000000000000000000000000000000000";

    -- i_conv3_i_gemm_nn9w_vt_const_63(CONSTANT,47)
    i_conv3_i_gemm_nn9w_vt_const_63_q <= "00000000000000000000000000000000000000000";

    -- i_and2_i_gemm_nn9w_vt_const_31(CONSTANT,38)
    i_and2_i_gemm_nn9w_vt_const_31_q <= "000000000";

    -- c_i32_8388607(CONSTANT,27)
    c_i32_8388607_q <= "00000000011111111111111111111111";

    -- i_acl_convert_halftofp_conv31_hf_gemm_nn9w(EXTIFACE,36)@128 + 1
    i_acl_convert_halftofp_conv31_hf_gemm_nn9w_dataa <= in_c1_eni1392_1;
    i_acl_convert_halftofp_conv31_hf_gemm_nn9w_enable <= VCC_q;
    i_acl_convert_halftofp_conv31_hf_gemm_nn9w_stall_in <= GND_q;
    i_acl_convert_halftofp_conv31_hf_gemm_nn9w_valid_in <= VCC_q;
    i_acl_convert_halftofp_conv31_hf_gemm_nn9w_enable_bitsignaltemp <= i_acl_convert_halftofp_conv31_hf_gemm_nn9w_enable(0);
    i_acl_convert_halftofp_conv31_hf_gemm_nn9w_stall_in_bitsignaltemp <= i_acl_convert_halftofp_conv31_hf_gemm_nn9w_stall_in(0);
    i_acl_convert_halftofp_conv31_hf_gemm_nn9w_valid_in_bitsignaltemp <= i_acl_convert_halftofp_conv31_hf_gemm_nn9w_valid_in(0);
    thei_acl_convert_halftofp_conv31_hf_gemm_nn9w : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni1392_1,
        enable => i_acl_convert_halftofp_conv31_hf_gemm_nn9w_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_conv31_hf_gemm_nn9w_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_conv31_hf_gemm_nn9w_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_conv31_hf_gemm_nn9w_result,
        clock => clock,
        resetn => resetn
    );

    -- i_and2_i_gemm_nn9w(LOGICAL,37)@129
    i_and2_i_gemm_nn9w_q <= i_acl_convert_halftofp_conv31_hf_gemm_nn9w_result and c_i32_8388607_q;

    -- i_and2_i_gemm_nn9w_vt_select_22(BITSELECT,40)@129
    i_and2_i_gemm_nn9w_vt_select_22_b <= i_and2_i_gemm_nn9w_q(22 downto 0);

    -- redist2_i_and2_i_gemm_nn9w_vt_select_22_b_1(DELAY,197)
    redist2_i_and2_i_gemm_nn9w_vt_select_22_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_and2_i_gemm_nn9w_vt_select_22_b, xout => redist2_i_and2_i_gemm_nn9w_vt_select_22_b_1_q, clk => clock, aclr => resetn );

    -- i_and2_i_gemm_nn9w_vt_join(BITJOIN,39)@130
    i_and2_i_gemm_nn9w_vt_join_q <= i_and2_i_gemm_nn9w_vt_const_31_q & redist2_i_and2_i_gemm_nn9w_vt_select_22_b_1_q;

    -- i_conv3_i_gemm_nn9w_sel_x(BITSELECT,6)@130
    i_conv3_i_gemm_nn9w_sel_x_b <= std_logic_vector(resize(unsigned(i_and2_i_gemm_nn9w_vt_join_q(31 downto 0)), 64));

    -- i_conv3_i_gemm_nn9w_vt_select_22(BITSELECT,49)@130
    i_conv3_i_gemm_nn9w_vt_select_22_b <= i_conv3_i_gemm_nn9w_sel_x_b(22 downto 0);

    -- i_conv3_i_gemm_nn9w_vt_join(BITJOIN,48)@130
    i_conv3_i_gemm_nn9w_vt_join_q <= i_conv3_i_gemm_nn9w_vt_const_63_q & i_conv3_i_gemm_nn9w_vt_select_22_b;

    -- i_or11_i_gemm_nn9w_vt_const_63(CONSTANT,67)
    i_or11_i_gemm_nn9w_vt_const_63_q <= "00000000000000000000000000000000000000001";

    -- i_or11_i_gemm_nn9w_BitSelect_for_a(BITSELECT,187)@130
    i_or11_i_gemm_nn9w_BitSelect_for_a_b <= i_conv3_i_gemm_nn9w_vt_join_q(22 downto 0);
    i_or11_i_gemm_nn9w_BitSelect_for_a_c <= i_conv3_i_gemm_nn9w_vt_join_q(63 downto 63);

    -- i_or11_i_gemm_nn9w_join(BITJOIN,188)@130
    i_or11_i_gemm_nn9w_join_q <= i_or11_i_gemm_nn9w_BitSelect_for_a_c & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & VCC_q & i_or11_i_gemm_nn9w_BitSelect_for_a_b;

    -- i_or11_i_gemm_nn9w_vt_select_22(BITSELECT,69)@130
    i_or11_i_gemm_nn9w_vt_select_22_b <= i_or11_i_gemm_nn9w_join_q(22 downto 0);

    -- i_or11_i_gemm_nn9w_vt_join(BITJOIN,68)@130
    i_or11_i_gemm_nn9w_vt_join_q <= i_or11_i_gemm_nn9w_vt_const_63_q & i_or11_i_gemm_nn9w_vt_select_22_b;

    -- i_conv3_or11_i_gemm_nn9w(MUX,50)@130
    i_conv3_or11_i_gemm_nn9w_s <= i_cmp8_i_gemm_nn9w_q;
    i_conv3_or11_i_gemm_nn9w_combproc: PROCESS (i_conv3_or11_i_gemm_nn9w_s, i_or11_i_gemm_nn9w_vt_join_q, i_conv3_i_gemm_nn9w_vt_join_q)
    BEGIN
        CASE (i_conv3_or11_i_gemm_nn9w_s) IS
            WHEN "0" => i_conv3_or11_i_gemm_nn9w_q <= i_or11_i_gemm_nn9w_vt_join_q;
            WHEN "1" => i_conv3_or11_i_gemm_nn9w_q <= i_conv3_i_gemm_nn9w_vt_join_q;
            WHEN OTHERS => i_conv3_or11_i_gemm_nn9w_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_conv3_or11_i_gemm_nn9w_vt_select_23(BITSELECT,53)@130
    i_conv3_or11_i_gemm_nn9w_vt_select_23_b <= i_conv3_or11_i_gemm_nn9w_q(23 downto 0);

    -- i_conv3_or11_i_gemm_nn9w_vt_join(BITJOIN,52)@130
    i_conv3_or11_i_gemm_nn9w_vt_join_q <= i_conv3_or11_i_gemm_nn9w_vt_const_63_q & i_conv3_or11_i_gemm_nn9w_vt_select_23_b;

    -- leftShiftStage0_uid140_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x(MUX,139)@130
    leftShiftStage0_uid140_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_s <= VCC_q;
    leftShiftStage0_uid140_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_combproc: PROCESS (leftShiftStage0_uid140_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_s, i_conv3_or11_i_gemm_nn9w_vt_join_q, leftShiftStage0Idx1_uid138_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid140_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid140_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_q <= i_conv3_or11_i_gemm_nn9w_vt_join_q;
            WHEN "1" => leftShiftStage0_uid140_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_q <= leftShiftStage0Idx1_uid138_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid140_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid145_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x(MUX,144)@130
    leftShiftStage1_uid145_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_s <= VCC_q;
    leftShiftStage1_uid145_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_combproc: PROCESS (leftShiftStage1_uid145_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_s, leftShiftStage0_uid140_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_q, leftShiftStage1Idx1_uid143_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_q)
    BEGIN
        CASE (leftShiftStage1_uid145_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_s) IS
            WHEN "0" => leftShiftStage1_uid145_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_q <= leftShiftStage0_uid140_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_q;
            WHEN "1" => leftShiftStage1_uid145_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_q <= leftShiftStage1Idx1_uid143_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_q;
            WHEN OTHERS => leftShiftStage1_uid145_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_conv3_or11_op_i_gemm_nn9w_vt_select_26(BITSELECT,57)@130
    i_conv3_or11_op_i_gemm_nn9w_vt_select_26_b <= leftShiftStage1_uid145_i_conv3_or11_op_i_gemm_nn9w_gemm_nn9w216_shift_x_q(26 downto 3);

    -- i_conv3_or11_op_i_gemm_nn9w_vt_join(BITJOIN,56)@130
    i_conv3_or11_op_i_gemm_nn9w_vt_join_q <= i_conv3_or11_op_i_gemm_nn9w_vt_const_63_q & i_conv3_or11_op_i_gemm_nn9w_vt_select_26_b & i_conv3_or11_op_i_gemm_nn9w_vt_const_2_q;

    -- c_i32_0gr(CONSTANT,24)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- i_shr5_i_gemm_nn9w_vt_const_31(CONSTANT,99)
    i_shr5_i_gemm_nn9w_vt_const_31_q <= "000000000000000000000000";

    -- i_and4_i_gemm_nn9w_vt_const_31(CONSTANT,41)
    i_and4_i_gemm_nn9w_vt_const_31_q <= "00000000000000000000000";

    -- rightShiftStage3Idx1Rng1_uid127_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x(BITSELECT,126)@129
    rightShiftStage3Idx1Rng1_uid127_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_b <= rightShiftStage2_uid126_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q(31 downto 1);

    -- rightShiftStage3Idx1_uid129_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x(BITJOIN,128)@129
    rightShiftStage3Idx1_uid129_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q <= GND_q & rightShiftStage3Idx1Rng1_uid127_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_b;

    -- rightShiftStage2Idx1Rng2_uid122_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x(BITSELECT,121)@129
    rightShiftStage2Idx1Rng2_uid122_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_b <= rightShiftStage1_uid121_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q(31 downto 2);

    -- rightShiftStage2Idx1_uid124_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x(BITJOIN,123)@129
    rightShiftStage2Idx1_uid124_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q <= rightShiftStage2Idx1Pad2_uid123_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q & rightShiftStage2Idx1Rng2_uid122_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_b;

    -- rightShiftStage1Idx1Pad4_uid118_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x(CONSTANT,117)
    rightShiftStage1Idx1Pad4_uid118_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q <= "0000";

    -- rightShiftStage1Idx1Rng4_uid117_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x(BITSELECT,116)@129
    rightShiftStage1Idx1Rng4_uid117_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_b <= rightShiftStage0_uid116_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q(31 downto 4);

    -- rightShiftStage1Idx1_uid119_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x(BITJOIN,118)@129
    rightShiftStage1Idx1_uid119_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q <= rightShiftStage1Idx1Pad4_uid118_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q & rightShiftStage1Idx1Rng4_uid117_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_b;

    -- rightShiftStage0Idx1Pad16_uid113_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x(CONSTANT,112)
    rightShiftStage0Idx1Pad16_uid113_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q <= "0000000000000000";

    -- rightShiftStage0Idx1Rng16_uid112_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x(BITSELECT,111)@129
    rightShiftStage0Idx1Rng16_uid112_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_b <= i_acl_convert_halftofp_conv31_hf_gemm_nn9w_result(31 downto 16);

    -- rightShiftStage0Idx1_uid114_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x(BITJOIN,113)@129
    rightShiftStage0Idx1_uid114_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q <= rightShiftStage0Idx1Pad16_uid113_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q & rightShiftStage0Idx1Rng16_uid112_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_b;

    -- rightShiftStage0_uid116_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x(MUX,115)@129
    rightShiftStage0_uid116_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_s <= VCC_q;
    rightShiftStage0_uid116_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_combproc: PROCESS (rightShiftStage0_uid116_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_s, i_acl_convert_halftofp_conv31_hf_gemm_nn9w_result, rightShiftStage0Idx1_uid114_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid116_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid116_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q <= i_acl_convert_halftofp_conv31_hf_gemm_nn9w_result;
            WHEN "1" => rightShiftStage0_uid116_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q <= rightShiftStage0Idx1_uid114_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid116_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid121_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x(MUX,120)@129
    rightShiftStage1_uid121_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_s <= VCC_q;
    rightShiftStage1_uid121_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_combproc: PROCESS (rightShiftStage1_uid121_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_s, rightShiftStage0_uid116_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q, rightShiftStage1Idx1_uid119_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q)
    BEGIN
        CASE (rightShiftStage1_uid121_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_s) IS
            WHEN "0" => rightShiftStage1_uid121_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q <= rightShiftStage0_uid116_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q;
            WHEN "1" => rightShiftStage1_uid121_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q <= rightShiftStage1Idx1_uid119_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q;
            WHEN OTHERS => rightShiftStage1_uid121_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage2_uid126_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x(MUX,125)@129
    rightShiftStage2_uid126_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_s <= VCC_q;
    rightShiftStage2_uid126_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_combproc: PROCESS (rightShiftStage2_uid126_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_s, rightShiftStage1_uid121_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q, rightShiftStage2Idx1_uid124_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q)
    BEGIN
        CASE (rightShiftStage2_uid126_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_s) IS
            WHEN "0" => rightShiftStage2_uid126_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q <= rightShiftStage1_uid121_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q;
            WHEN "1" => rightShiftStage2_uid126_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q <= rightShiftStage2Idx1_uid124_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q;
            WHEN OTHERS => rightShiftStage2_uid126_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage3_uid131_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x(MUX,130)@129
    rightShiftStage3_uid131_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_s <= VCC_q;
    rightShiftStage3_uid131_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_combproc: PROCESS (rightShiftStage3_uid131_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_s, rightShiftStage2_uid126_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q, rightShiftStage3Idx1_uid129_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q)
    BEGIN
        CASE (rightShiftStage3_uid131_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_s) IS
            WHEN "0" => rightShiftStage3_uid131_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q <= rightShiftStage2_uid126_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q;
            WHEN "1" => rightShiftStage3_uid131_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q <= rightShiftStage3Idx1_uid129_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q;
            WHEN OTHERS => rightShiftStage3_uid131_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_and4_i_gemm_nn9w_vt_select_8(BITSELECT,43)@129
    i_and4_i_gemm_nn9w_vt_select_8_b <= rightShiftStage3_uid131_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q(8 downto 0);

    -- i_and4_i_gemm_nn9w_vt_join(BITJOIN,42)@129
    i_and4_i_gemm_nn9w_vt_join_q <= i_and4_i_gemm_nn9w_vt_const_31_q & i_and4_i_gemm_nn9w_vt_select_8_b;

    -- i_shr5_i_gemm_nn9w_BitSelect_for_a(BITSELECT,191)@129
    i_shr5_i_gemm_nn9w_BitSelect_for_a_b <= i_and4_i_gemm_nn9w_vt_join_q(7 downto 0);

    -- i_shr5_i_gemm_nn9w_join(BITJOIN,192)@129
    i_shr5_i_gemm_nn9w_join_q <= GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & i_shr5_i_gemm_nn9w_BitSelect_for_a_b;

    -- i_shr5_i_gemm_nn9w_vt_select_7(BITSELECT,101)@129
    i_shr5_i_gemm_nn9w_vt_select_7_b <= i_shr5_i_gemm_nn9w_join_q(7 downto 0);

    -- i_shr5_i_gemm_nn9w_vt_join(BITJOIN,100)@129
    i_shr5_i_gemm_nn9w_vt_join_q <= i_shr5_i_gemm_nn9w_vt_const_31_q & i_shr5_i_gemm_nn9w_vt_select_7_b;

    -- i_cmp8_i_gemm_nn9w(LOGICAL,45)@129 + 1
    i_cmp8_i_gemm_nn9w_qi <= "1" WHEN i_shr5_i_gemm_nn9w_vt_join_q = c_i32_0gr_q ELSE "0";
    i_cmp8_i_gemm_nn9w_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_cmp8_i_gemm_nn9w_qi, xout => i_cmp8_i_gemm_nn9w_q, clk => clock, aclr => resetn );

    -- i_shl_i_gemm_nn9w(MUX,93)@130
    i_shl_i_gemm_nn9w_s <= i_cmp8_i_gemm_nn9w_q;
    i_shl_i_gemm_nn9w_combproc: PROCESS (i_shl_i_gemm_nn9w_s, i_conv3_or11_op_i_gemm_nn9w_vt_join_q, c_i64_0gr_q)
    BEGIN
        CASE (i_shl_i_gemm_nn9w_s) IS
            WHEN "0" => i_shl_i_gemm_nn9w_q <= i_conv3_or11_op_i_gemm_nn9w_vt_join_q;
            WHEN "1" => i_shl_i_gemm_nn9w_q <= c_i64_0gr_q;
            WHEN OTHERS => i_shl_i_gemm_nn9w_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_shl_i_gemm_nn9w_vt_select_26(BITSELECT,97)@130
    i_shl_i_gemm_nn9w_vt_select_26_b <= i_shl_i_gemm_nn9w_q(26 downto 3);

    -- i_shl_i_gemm_nn9w_vt_join(BITJOIN,96)@130
    i_shl_i_gemm_nn9w_vt_join_q <= i_conv3_or11_op_i_gemm_nn9w_vt_const_63_q & i_shl_i_gemm_nn9w_vt_select_26_b & i_conv3_or11_op_i_gemm_nn9w_vt_const_2_q;

    -- leftShiftStage1Idx1Rng1_uid180_i_unnamed_gemm_nn9w218_shift_x(BITSELECT,179)@129
    leftShiftStage1Idx1Rng1_uid180_i_unnamed_gemm_nn9w218_shift_x_in <= leftShiftStage0_uid178_i_unnamed_gemm_nn9w218_shift_x_q(62 downto 0);
    leftShiftStage1Idx1Rng1_uid180_i_unnamed_gemm_nn9w218_shift_x_b <= leftShiftStage1Idx1Rng1_uid180_i_unnamed_gemm_nn9w218_shift_x_in(62 downto 0);

    -- leftShiftStage1Idx1_uid181_i_unnamed_gemm_nn9w218_shift_x(BITJOIN,180)@129
    leftShiftStage1Idx1_uid181_i_unnamed_gemm_nn9w218_shift_x_q <= leftShiftStage1Idx1Rng1_uid180_i_unnamed_gemm_nn9w218_shift_x_b & GND_q;

    -- leftShiftStage0Idx1Rng4_uid175_i_unnamed_gemm_nn9w218_shift_x(BITSELECT,174)@129
    leftShiftStage0Idx1Rng4_uid175_i_unnamed_gemm_nn9w218_shift_x_in <= i_conv_i_gemm_nn9w_vt_join_q(59 downto 0);
    leftShiftStage0Idx1Rng4_uid175_i_unnamed_gemm_nn9w218_shift_x_b <= leftShiftStage0Idx1Rng4_uid175_i_unnamed_gemm_nn9w218_shift_x_in(59 downto 0);

    -- leftShiftStage0Idx1_uid176_i_unnamed_gemm_nn9w218_shift_x(BITJOIN,175)@129
    leftShiftStage0Idx1_uid176_i_unnamed_gemm_nn9w218_shift_x_q <= leftShiftStage0Idx1Rng4_uid175_i_unnamed_gemm_nn9w218_shift_x_b & rightShiftStage1Idx1Pad4_uid118_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q;

    -- i_conv_i_gemm_nn9w_sel_x(BITSELECT,12)@129
    i_conv_i_gemm_nn9w_sel_x_b <= std_logic_vector(resize(unsigned(i_acl_convert_halftofp_conv31_hf_gemm_nn9w_result(31 downto 0)), 64));

    -- i_conv_i_gemm_nn9w_vt_select_31(BITSELECT,65)@129
    i_conv_i_gemm_nn9w_vt_select_31_b <= i_conv_i_gemm_nn9w_sel_x_b(31 downto 0);

    -- i_conv_i_gemm_nn9w_vt_join(BITJOIN,64)@129
    i_conv_i_gemm_nn9w_vt_join_q <= c_i32_0gr_q & i_conv_i_gemm_nn9w_vt_select_31_b;

    -- leftShiftStage0_uid178_i_unnamed_gemm_nn9w218_shift_x(MUX,177)@129
    leftShiftStage0_uid178_i_unnamed_gemm_nn9w218_shift_x_s <= VCC_q;
    leftShiftStage0_uid178_i_unnamed_gemm_nn9w218_shift_x_combproc: PROCESS (leftShiftStage0_uid178_i_unnamed_gemm_nn9w218_shift_x_s, i_conv_i_gemm_nn9w_vt_join_q, leftShiftStage0Idx1_uid176_i_unnamed_gemm_nn9w218_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid178_i_unnamed_gemm_nn9w218_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid178_i_unnamed_gemm_nn9w218_shift_x_q <= i_conv_i_gemm_nn9w_vt_join_q;
            WHEN "1" => leftShiftStage0_uid178_i_unnamed_gemm_nn9w218_shift_x_q <= leftShiftStage0Idx1_uid176_i_unnamed_gemm_nn9w218_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid178_i_unnamed_gemm_nn9w218_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid183_i_unnamed_gemm_nn9w218_shift_x(MUX,182)@129
    leftShiftStage1_uid183_i_unnamed_gemm_nn9w218_shift_x_s <= VCC_q;
    leftShiftStage1_uid183_i_unnamed_gemm_nn9w218_shift_x_combproc: PROCESS (leftShiftStage1_uid183_i_unnamed_gemm_nn9w218_shift_x_s, leftShiftStage0_uid178_i_unnamed_gemm_nn9w218_shift_x_q, leftShiftStage1Idx1_uid181_i_unnamed_gemm_nn9w218_shift_x_q)
    BEGIN
        CASE (leftShiftStage1_uid183_i_unnamed_gemm_nn9w218_shift_x_s) IS
            WHEN "0" => leftShiftStage1_uid183_i_unnamed_gemm_nn9w218_shift_x_q <= leftShiftStage0_uid178_i_unnamed_gemm_nn9w218_shift_x_q;
            WHEN "1" => leftShiftStage1_uid183_i_unnamed_gemm_nn9w218_shift_x_q <= leftShiftStage1Idx1_uid181_i_unnamed_gemm_nn9w218_shift_x_q;
            WHEN OTHERS => leftShiftStage1_uid183_i_unnamed_gemm_nn9w218_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_unnamed_gemm_nn9w217_vt_select_36(BITSELECT,105)@129
    i_unnamed_gemm_nn9w217_vt_select_36_b <= leftShiftStage1_uid183_i_unnamed_gemm_nn9w218_shift_x_q(36 downto 5);

    -- i_unnamed_gemm_nn9w217_vt_const_4(CONSTANT,102)
    i_unnamed_gemm_nn9w217_vt_const_4_q <= "00000";

    -- i_unnamed_gemm_nn9w217_vt_join(BITJOIN,104)@129
    i_unnamed_gemm_nn9w217_vt_join_q <= i_or22_i_gemm_nn9w_vt_const_26_q & i_unnamed_gemm_nn9w217_vt_select_36_b & i_unnamed_gemm_nn9w217_vt_const_4_q;

    -- i_shl20_i_gemm_nn9w_BitSelect_for_a(BITSELECT,189)@129
    i_shl20_i_gemm_nn9w_BitSelect_for_a_b <= i_unnamed_gemm_nn9w217_vt_join_q(36 downto 36);

    -- i_shl20_i_gemm_nn9w_join(BITJOIN,190)@129
    i_shl20_i_gemm_nn9w_join_q <= GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & i_shl20_i_gemm_nn9w_BitSelect_for_a_b & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q;

    -- i_shl20_i_gemm_nn9w_vt_select_36(BITSELECT,88)@129
    i_shl20_i_gemm_nn9w_vt_select_36_b <= i_shl20_i_gemm_nn9w_join_q(36 downto 36);

    -- i_shl20_i_gemm_nn9w_vt_const_35(CONSTANT,85)
    i_shl20_i_gemm_nn9w_vt_const_35_q <= "000000000000000000000000000000000000";

    -- i_shl20_i_gemm_nn9w_vt_join(BITJOIN,87)@129
    i_shl20_i_gemm_nn9w_vt_join_q <= i_or22_i_gemm_nn9w_vt_const_26_q & i_shl20_i_gemm_nn9w_vt_select_36_b & i_shl20_i_gemm_nn9w_vt_const_35_q;

    -- i_shl21_i_gemm_nn9w_vt_const_63(CONSTANT,90)
    i_shl21_i_gemm_nn9w_vt_const_63_q <= "00000000000000000000000000000";

    -- leftShiftStage3Idx1Rng1_uid166_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x(BITSELECT,165)@129
    leftShiftStage3Idx1Rng1_uid166_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_in <= leftShiftStage2_uid164_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q(62 downto 0);
    leftShiftStage3Idx1Rng1_uid166_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_b <= leftShiftStage3Idx1Rng1_uid166_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_in(62 downto 0);

    -- leftShiftStage3Idx1_uid167_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x(BITJOIN,166)@129
    leftShiftStage3Idx1_uid167_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q <= leftShiftStage3Idx1Rng1_uid166_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_b & GND_q;

    -- leftShiftStage2Idx1Rng2_uid161_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x(BITSELECT,160)@129
    leftShiftStage2Idx1Rng2_uid161_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_in <= leftShiftStage1_uid159_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q(61 downto 0);
    leftShiftStage2Idx1Rng2_uid161_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_b <= leftShiftStage2Idx1Rng2_uid161_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_in(61 downto 0);

    -- leftShiftStage2Idx1_uid162_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x(BITJOIN,161)@129
    leftShiftStage2Idx1_uid162_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q <= leftShiftStage2Idx1Rng2_uid161_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_b & rightShiftStage2Idx1Pad2_uid123_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q;

    -- leftShiftStage1Idx1Rng8_uid156_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x(BITSELECT,155)@129
    leftShiftStage1Idx1Rng8_uid156_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_in <= leftShiftStage0_uid154_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q(55 downto 0);
    leftShiftStage1Idx1Rng8_uid156_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_b <= leftShiftStage1Idx1Rng8_uid156_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_in(55 downto 0);

    -- leftShiftStage1Idx1Pad8_uid155_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x(CONSTANT,154)
    leftShiftStage1Idx1Pad8_uid155_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q <= "00000000";

    -- leftShiftStage1Idx1_uid157_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x(BITJOIN,156)@129
    leftShiftStage1Idx1_uid157_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q <= leftShiftStage1Idx1Rng8_uid156_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_b & leftShiftStage1Idx1Pad8_uid155_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q;

    -- leftShiftStage0Idx1Rng16_uid151_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x(BITSELECT,150)@129
    leftShiftStage0Idx1Rng16_uid151_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_in <= i_conv6_i_gemm_nn9w_vt_join_q(47 downto 0);
    leftShiftStage0Idx1Rng16_uid151_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_b <= leftShiftStage0Idx1Rng16_uid151_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_in(47 downto 0);

    -- leftShiftStage0Idx1_uid152_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x(BITJOIN,151)@129
    leftShiftStage0Idx1_uid152_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q <= leftShiftStage0Idx1Rng16_uid151_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_b & rightShiftStage0Idx1Pad16_uid113_i_and4_i_gemm_nn9w_gemm_nn9w214_shift_x_q;

    -- i_conv6_i_gemm_nn9w_vt_const_63(CONSTANT,59)
    i_conv6_i_gemm_nn9w_vt_const_63_q <= "00000000000000000000000000000000000000000000000000000000";

    -- i_conv6_i_gemm_nn9w_sel_x(BITSELECT,11)@129
    i_conv6_i_gemm_nn9w_sel_x_b <= std_logic_vector(resize(unsigned(i_shr5_i_gemm_nn9w_vt_join_q(31 downto 0)), 64));

    -- i_conv6_i_gemm_nn9w_vt_select_7(BITSELECT,61)@129
    i_conv6_i_gemm_nn9w_vt_select_7_b <= i_conv6_i_gemm_nn9w_sel_x_b(7 downto 0);

    -- i_conv6_i_gemm_nn9w_vt_join(BITJOIN,60)@129
    i_conv6_i_gemm_nn9w_vt_join_q <= i_conv6_i_gemm_nn9w_vt_const_63_q & i_conv6_i_gemm_nn9w_vt_select_7_b;

    -- leftShiftStage0_uid154_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x(MUX,153)@129
    leftShiftStage0_uid154_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_s <= VCC_q;
    leftShiftStage0_uid154_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_combproc: PROCESS (leftShiftStage0_uid154_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_s, i_conv6_i_gemm_nn9w_vt_join_q, leftShiftStage0Idx1_uid152_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q)
    BEGIN
        CASE (leftShiftStage0_uid154_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_s) IS
            WHEN "0" => leftShiftStage0_uid154_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q <= i_conv6_i_gemm_nn9w_vt_join_q;
            WHEN "1" => leftShiftStage0_uid154_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q <= leftShiftStage0Idx1_uid152_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q;
            WHEN OTHERS => leftShiftStage0_uid154_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage1_uid159_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x(MUX,158)@129
    leftShiftStage1_uid159_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_s <= VCC_q;
    leftShiftStage1_uid159_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_combproc: PROCESS (leftShiftStage1_uid159_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_s, leftShiftStage0_uid154_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q, leftShiftStage1Idx1_uid157_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q)
    BEGIN
        CASE (leftShiftStage1_uid159_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_s) IS
            WHEN "0" => leftShiftStage1_uid159_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q <= leftShiftStage0_uid154_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q;
            WHEN "1" => leftShiftStage1_uid159_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q <= leftShiftStage1Idx1_uid157_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q;
            WHEN OTHERS => leftShiftStage1_uid159_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage2_uid164_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x(MUX,163)@129
    leftShiftStage2_uid164_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_s <= VCC_q;
    leftShiftStage2_uid164_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_combproc: PROCESS (leftShiftStage2_uid164_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_s, leftShiftStage1_uid159_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q, leftShiftStage2Idx1_uid162_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q)
    BEGIN
        CASE (leftShiftStage2_uid164_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_s) IS
            WHEN "0" => leftShiftStage2_uid164_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q <= leftShiftStage1_uid159_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q;
            WHEN "1" => leftShiftStage2_uid164_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q <= leftShiftStage2Idx1_uid162_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q;
            WHEN OTHERS => leftShiftStage2_uid164_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStage3_uid169_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x(MUX,168)@129
    leftShiftStage3_uid169_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_s <= VCC_q;
    leftShiftStage3_uid169_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_combproc: PROCESS (leftShiftStage3_uid169_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_s, leftShiftStage2_uid164_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q, leftShiftStage3Idx1_uid167_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q)
    BEGIN
        CASE (leftShiftStage3_uid169_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_s) IS
            WHEN "0" => leftShiftStage3_uid169_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q <= leftShiftStage2_uid164_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q;
            WHEN "1" => leftShiftStage3_uid169_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q <= leftShiftStage3Idx1_uid167_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q;
            WHEN OTHERS => leftShiftStage3_uid169_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_shl21_i_gemm_nn9w_vt_select_34(BITSELECT,92)@129
    i_shl21_i_gemm_nn9w_vt_select_34_b <= leftShiftStage3_uid169_i_shl21_i_gemm_nn9w_gemm_nn9w219_shift_x_q(34 downto 27);

    -- i_shl21_i_gemm_nn9w_vt_join(BITJOIN,91)@129
    i_shl21_i_gemm_nn9w_vt_join_q <= i_shl21_i_gemm_nn9w_vt_const_63_q & i_shl21_i_gemm_nn9w_vt_select_34_b & i_or22_i_gemm_nn9w_vt_const_26_q;

    -- i_or22_i_gemm_nn9w(LOGICAL,70)@129
    i_or22_i_gemm_nn9w_q <= i_shl21_i_gemm_nn9w_vt_join_q or i_shl20_i_gemm_nn9w_vt_join_q;

    -- i_or22_i_gemm_nn9w_vt_select_34_merged_bit_select(BITSELECT,193)@129
    i_or22_i_gemm_nn9w_vt_select_34_merged_bit_select_in <= i_or22_i_gemm_nn9w_q(36 downto 0);
    i_or22_i_gemm_nn9w_vt_select_34_merged_bit_select_b <= i_or22_i_gemm_nn9w_vt_select_34_merged_bit_select_in(34 downto 27);
    i_or22_i_gemm_nn9w_vt_select_34_merged_bit_select_c <= i_or22_i_gemm_nn9w_vt_select_34_merged_bit_select_in(36 downto 36);

    -- redist1_i_or22_i_gemm_nn9w_vt_select_34_merged_bit_select_c_1(DELAY,196)
    redist1_i_or22_i_gemm_nn9w_vt_select_34_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or22_i_gemm_nn9w_vt_select_34_merged_bit_select_c, xout => redist1_i_or22_i_gemm_nn9w_vt_select_34_merged_bit_select_c_1_q, clk => clock, aclr => resetn );

    -- redist0_i_or22_i_gemm_nn9w_vt_select_34_merged_bit_select_b_1(DELAY,195)
    redist0_i_or22_i_gemm_nn9w_vt_select_34_merged_bit_select_b_1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or22_i_gemm_nn9w_vt_select_34_merged_bit_select_b, xout => redist0_i_or22_i_gemm_nn9w_vt_select_34_merged_bit_select_b_1_q, clk => clock, aclr => resetn );

    -- i_or22_i_gemm_nn9w_vt_join(BITJOIN,74)@130
    i_or22_i_gemm_nn9w_vt_join_q <= i_or22_i_gemm_nn9w_vt_const_26_q & redist1_i_or22_i_gemm_nn9w_vt_select_34_merged_bit_select_c_1_q & GND_q & redist0_i_or22_i_gemm_nn9w_vt_select_34_merged_bit_select_b_1_q & i_or22_i_gemm_nn9w_vt_const_26_q;

    -- i_or23_i_gemm_nn9w(LOGICAL,77)@130
    i_or23_i_gemm_nn9w_q <= i_or22_i_gemm_nn9w_vt_join_q or i_shl_i_gemm_nn9w_vt_join_q;

    -- i_or23_i_gemm_nn9w_vt_select_34_merged_bit_select(BITSELECT,194)@130
    i_or23_i_gemm_nn9w_vt_select_34_merged_bit_select_in <= i_or23_i_gemm_nn9w_q(36 downto 0);
    i_or23_i_gemm_nn9w_vt_select_34_merged_bit_select_b <= i_or23_i_gemm_nn9w_vt_select_34_merged_bit_select_in(34 downto 3);
    i_or23_i_gemm_nn9w_vt_select_34_merged_bit_select_c <= i_or23_i_gemm_nn9w_vt_select_34_merged_bit_select_in(36 downto 36);

    -- i_conv3_or11_op_i_gemm_nn9w_vt_const_2(CONSTANT,54)
    i_conv3_or11_op_i_gemm_nn9w_vt_const_2_q <= "000";

    -- i_or23_i_gemm_nn9w_vt_join(BITJOIN,81)@130
    i_or23_i_gemm_nn9w_vt_join_q <= i_or22_i_gemm_nn9w_vt_const_26_q & i_or23_i_gemm_nn9w_vt_select_34_merged_bit_select_c & GND_q & i_or23_i_gemm_nn9w_vt_select_34_merged_bit_select_b & i_conv3_or11_op_i_gemm_nn9w_vt_const_2_q;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,22)@130
    out_c1_exi1395_0 <= GND_q;
    out_c1_exi1395_1 <= i_or23_i_gemm_nn9w_vt_join_q;
    out_o_valid <= redist3_sync_in_aunroll_x_in_i_valid_2_q;

END normal;
