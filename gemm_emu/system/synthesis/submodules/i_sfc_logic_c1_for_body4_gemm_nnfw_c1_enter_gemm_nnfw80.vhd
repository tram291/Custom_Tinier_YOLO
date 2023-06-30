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

-- VHDL created from i_sfc_logic_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw80
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

entity i_sfc_logic_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw80 is
    port (
        in_c1_eni6_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni6_1 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni6_2 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni6_3 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni6_4 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni6_5 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni6_6 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni6_7 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni6_8 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni6_9 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni6_10 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni6_11 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni6_12 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni6_13 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni6_14 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni6_15 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni6_16 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni6_17 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni6_18 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni6_19 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni6_20 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni6_21 : in std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW1_0 : out std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_memdep_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_memdep_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw80;

architecture normal of i_sfc_logic_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw80 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_store_memdep_gemm_nnfw85 is
        port (
            in_i_writedata_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_4 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_5 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_6 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_7 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_8 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_9 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_10 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_11 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_12 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_13 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_14 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_15 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_writeack : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


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

















    component i_acl_pop_i1_memdep_phi_pop1050_pop27_gemm_nnfw83 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_27 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_27 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_27 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_memdep_phi_pop1050_push27_gemm_nnfw87 is
        port (
            in_c1_ene6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_27 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_27 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_27 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_dupName_0_trunc_sel_x_in : STD_LOGIC_VECTOR (64 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_multconst_x_q : STD_LOGIC_VECTOR (56 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom_gemm_nnfw_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_store_memdep_gemm_nnfw_vunroll_x_out_memdep_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_memdep_gemm_nnfw_vunroll_x_out_memdep_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_gemm_nnfw_vunroll_x_out_memdep_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal i_store_memdep_gemm_nnfw_vunroll_x_out_memdep_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_gemm_nnfw_vunroll_x_out_memdep_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_gemm_nnfw_vunroll_x_out_memdep_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_gemm_nnfw_vunroll_x_out_memdep_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i1_memdep_phi_pop1050_pop27_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi_pop1050_pop27_gemm_nnfw_out_feedback_stall_out_27 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi_pop1050_push27_gemm_nnfw_out_feedback_out_27 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_memdep_phi_pop1050_push27_gemm_nnfw_out_feedback_valid_out_27 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_arrayidx_gemm_nnfw_vt_const_5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal i_arrayidx_gemm_nnfw_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_arrayidx_gemm_nnfw_vt_select_63_b : STD_LOGIC_VECTOR (57 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_join_13_q : STD_LOGIC_VECTOR (60 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_align_14_q : STD_LOGIC_VECTOR (42 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_align_14_qint : STD_LOGIC_VECTOR (42 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_join_16_q : STD_LOGIC_VECTOR (70 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (71 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (23 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_acl_pop_i1_memdep_phi_pop1050_pop27_gemm_nnfw_out_data_out_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_sync_in_aunroll_x_in_c1_eni6_17_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_sync_in_aunroll_x_in_c1_eni6_20_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_sync_in_aunroll_x_in_i_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_i_valid_2_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist3_sync_in_aunroll_x_in_i_valid_1(DELAY,105)
    redist3_sync_in_aunroll_x_in_i_valid_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist3_sync_in_aunroll_x_in_i_valid_1_q, clk => clock, aclr => resetn );

    -- redist4_sync_in_aunroll_x_in_i_valid_2(DELAY,106)
    redist4_sync_in_aunroll_x_in_i_valid_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist3_sync_in_aunroll_x_in_i_valid_1_q, xout => redist4_sync_in_aunroll_x_in_i_valid_2_q, clk => clock, aclr => resetn );

    -- sync_out_aunroll_x(GPOUT,47)@164
    out_o_valid <= redist4_sync_in_aunroll_x_in_i_valid_2_q;
    out_unnamed_gemm_nnfW1_0 <= GND_q;

    -- redist2_sync_in_aunroll_x_in_c1_eni6_20_1(DELAY,104)
    redist2_sync_in_aunroll_x_in_c1_eni6_20_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni6_20, xout => redist2_sync_in_aunroll_x_in_c1_eni6_20_1_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_memdep_phi_pop1050_push27_gemm_nnfw(BLACKBOX,71)@162
    -- out out_feedback_out_27@20000000
    -- out out_feedback_valid_out_27@20000000
    thei_acl_push_i1_memdep_phi_pop1050_push27_gemm_nnfw : i_acl_push_i1_memdep_phi_pop1050_push27_gemm_nnfw87
    PORT MAP (
        in_c1_ene6 => in_c1_eni6_21,
        in_data_in => i_acl_pop_i1_memdep_phi_pop1050_pop27_gemm_nnfw_out_data_out,
        in_feedback_stall_in_27 => i_acl_pop_i1_memdep_phi_pop1050_pop27_gemm_nnfw_out_feedback_stall_out_27,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_27 => i_acl_push_i1_memdep_phi_pop1050_push27_gemm_nnfw_out_feedback_out_27,
        out_feedback_valid_out_27 => i_acl_push_i1_memdep_phi_pop1050_push27_gemm_nnfw_out_feedback_valid_out_27,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_memdep_phi_pop1050_pop27_gemm_nnfw(BLACKBOX,70)@162
    -- out out_feedback_stall_out_27@20000000
    thei_acl_pop_i1_memdep_phi_pop1050_pop27_gemm_nnfw : i_acl_pop_i1_memdep_phi_pop1050_pop27_gemm_nnfw83
    PORT MAP (
        in_data_in => in_c1_eni6_18,
        in_dir => in_c1_eni6_19,
        in_feedback_in_27 => i_acl_push_i1_memdep_phi_pop1050_push27_gemm_nnfw_out_feedback_out_27,
        in_feedback_valid_in_27 => i_acl_push_i1_memdep_phi_pop1050_push27_gemm_nnfw_out_feedback_valid_out_27,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_memdep_phi_pop1050_pop27_gemm_nnfw_out_data_out,
        out_feedback_stall_out_27 => i_acl_pop_i1_memdep_phi_pop1050_pop27_gemm_nnfw_out_feedback_stall_out_27,
        clock => clock,
        resetn => resetn
    );

    -- redist0_i_acl_pop_i1_memdep_phi_pop1050_pop27_gemm_nnfw_out_data_out_1(DELAY,102)
    redist0_i_acl_pop_i1_memdep_phi_pop1050_pop27_gemm_nnfw_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_memdep_phi_pop1050_pop27_gemm_nnfw_out_data_out, xout => redist0_i_acl_pop_i1_memdep_phi_pop1050_pop27_gemm_nnfw_out_data_out_1_q, clk => clock, aclr => resetn );

    -- i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_multconst_x(CONSTANT,38)
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_multconst_x_q <= "000000000000000000000000000000000000000000000000000000000";

    -- redist1_sync_in_aunroll_x_in_c1_eni6_17_1(DELAY,103)
    redist1_sync_in_aunroll_x_in_c1_eni6_17_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni6_17, xout => redist1_sync_in_aunroll_x_in_c1_eni6_17_1_q, clk => clock, aclr => resetn );

    -- i_idxprom_gemm_nnfw_sel_x(BITSELECT,44)@163
    i_idxprom_gemm_nnfw_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist1_sync_in_aunroll_x_in_c1_eni6_17_1_q(31 downto 0)), 64)));

    -- i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_bs1_merged_bit_select(BITSELECT,101)@163
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_bs1_merged_bit_select_b <= i_idxprom_gemm_nnfw_sel_x_b(17 downto 0);
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_bs1_merged_bit_select_c <= i_idxprom_gemm_nnfw_sel_x_b(63 downto 54);
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_bs1_merged_bit_select_d <= i_idxprom_gemm_nnfw_sel_x_b(35 downto 18);
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_bs1_merged_bit_select_e <= i_idxprom_gemm_nnfw_sel_x_b(53 downto 36);

    -- i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im3_shift0(BITSHIFT,98)@163
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im3_shift0_qint <= i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_bs1_merged_bit_select_c & "000000";
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im3_shift0_q <= i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im3_shift0_qint(15 downto 0);

    -- i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_align_15(BITSHIFT,93)@163
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im3_shift0_q) & "00000000000";
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_align_15_q <= i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_align_15_qint(27 downto 0);

    -- i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im6_shift0(BITSHIFT,99)@163
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im6_shift0_qint <= i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_bs1_merged_bit_select_d & "000000";
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im6_shift0_q <= i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im6_shift0_qint(23 downto 0);

    -- i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_align_14(BITSHIFT,92)@163
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im6_shift0_q) & "000000000000000000";
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_align_14_q <= i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_align_14_qint(42 downto 0);

    -- i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_join_16(BITJOIN,94)@163
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_join_16_q <= i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_align_15_q & i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_align_14_q;

    -- i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im9_shift0(BITSHIFT,100)@163
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im9_shift0_qint <= i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_bs1_merged_bit_select_e & "000000";
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im9_shift0_q <= i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im9_shift0_qint(23 downto 0);

    -- i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_align_12(BITSHIFT,90)@163
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im9_shift0_q) & "00000000000";
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_align_12_q <= i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_align_12_qint(35 downto 0);

    -- i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im0_shift0(BITSHIFT,97)@163
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im0_shift0_qint <= i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_bs1_merged_bit_select_b & "000000";
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im0_shift0_q <= i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im0_shift0_qint(23 downto 0);

    -- i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_join_13(BITJOIN,91)@163
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_join_13_q <= i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_im0_shift0_q);

    -- i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_result_add_0_0(ADD,95)@163
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_join_13_q);
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_join_16_q);
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_result_add_0_0_a) + UNSIGNED(i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_result_add_0_0_b));
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_result_add_0_0_q <= i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_result_add_0_0_o(71 downto 0);

    -- i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_extender_x(BITJOIN,37)@163
    i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_extender_x_q <= i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_multconst_x_q & i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_x_result_add_0_0_q(70 downto 0);

    -- i_arrayidx_gemm_nnfw_gemm_nnfw82_trunc_sel_x(BITSELECT,39)@163
    i_arrayidx_gemm_nnfw_gemm_nnfw82_trunc_sel_x_b <= i_arrayidx_gemm_nnfw_gemm_nnfw82_mult_extender_x_q(63 downto 0);

    -- i_arrayidx_gemm_nnfw_gemm_nnfw82_dupName_0_trunc_sel_x(BITSELECT,34)@163
    i_arrayidx_gemm_nnfw_gemm_nnfw82_dupName_0_trunc_sel_x_in <= STD_LOGIC_VECTOR("0" & i_arrayidx_gemm_nnfw_gemm_nnfw82_trunc_sel_x_b);
    i_arrayidx_gemm_nnfw_gemm_nnfw82_dupName_0_trunc_sel_x_b <= i_arrayidx_gemm_nnfw_gemm_nnfw82_dupName_0_trunc_sel_x_in(63 downto 0);

    -- i_arrayidx_gemm_nnfw_vt_select_63(BITSELECT,74)@163
    i_arrayidx_gemm_nnfw_vt_select_63_b <= i_arrayidx_gemm_nnfw_gemm_nnfw82_dupName_0_trunc_sel_x_b(63 downto 6);

    -- i_arrayidx_gemm_nnfw_vt_const_5(CONSTANT,72)
    i_arrayidx_gemm_nnfw_vt_const_5_q <= "000000";

    -- i_arrayidx_gemm_nnfw_vt_join(BITJOIN,73)@163
    i_arrayidx_gemm_nnfw_vt_join_q <= i_arrayidx_gemm_nnfw_vt_select_63_b & i_arrayidx_gemm_nnfw_vt_const_5_q;

    -- i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw(EXTIFACE,68)@162 + 1
    i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_dataa <= in_c1_eni6_16;
    i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_enable(0);
    i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_stall_in(0);
    i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni6_16,
        enable => i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_result,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw(EXTIFACE,67)@162 + 1
    i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_dataa <= in_c1_eni6_15;
    i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_enable(0);
    i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_stall_in(0);
    i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni6_15,
        enable => i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_result,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw(EXTIFACE,66)@162 + 1
    i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_dataa <= in_c1_eni6_14;
    i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_enable(0);
    i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_stall_in(0);
    i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni6_14,
        enable => i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_result,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw(EXTIFACE,65)@162 + 1
    i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_dataa <= in_c1_eni6_13;
    i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_enable(0);
    i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_stall_in(0);
    i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni6_13,
        enable => i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_result,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw(EXTIFACE,64)@162 + 1
    i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_dataa <= in_c1_eni6_12;
    i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_enable(0);
    i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_stall_in(0);
    i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni6_12,
        enable => i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_result,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw(EXTIFACE,63)@162 + 1
    i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_dataa <= in_c1_eni6_11;
    i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_enable(0);
    i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_stall_in(0);
    i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni6_11,
        enable => i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_result,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw(EXTIFACE,62)@162 + 1
    i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_dataa <= in_c1_eni6_10;
    i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_enable(0);
    i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_stall_in(0);
    i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni6_10,
        enable => i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_result,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw(EXTIFACE,61)@162 + 1
    i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_dataa <= in_c1_eni6_9;
    i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_enable(0);
    i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_stall_in(0);
    i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni6_9,
        enable => i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_result,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw(EXTIFACE,60)@162 + 1
    i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_dataa <= in_c1_eni6_8;
    i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_enable(0);
    i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_stall_in(0);
    i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni6_8,
        enable => i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_result,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw(EXTIFACE,59)@162 + 1
    i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_dataa <= in_c1_eni6_7;
    i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_enable(0);
    i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_stall_in(0);
    i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni6_7,
        enable => i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_result,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw(EXTIFACE,58)@162 + 1
    i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_dataa <= in_c1_eni6_6;
    i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_enable(0);
    i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_stall_in(0);
    i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni6_6,
        enable => i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_result,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw(EXTIFACE,57)@162 + 1
    i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_dataa <= in_c1_eni6_5;
    i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_enable(0);
    i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_stall_in(0);
    i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni6_5,
        enable => i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_result,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw(EXTIFACE,56)@162 + 1
    i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_dataa <= in_c1_eni6_4;
    i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_enable(0);
    i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_stall_in(0);
    i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni6_4,
        enable => i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_result,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw(EXTIFACE,55)@162 + 1
    i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_dataa <= in_c1_eni6_3;
    i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_enable(0);
    i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_stall_in(0);
    i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni6_3,
        enable => i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_result,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw(EXTIFACE,54)@162 + 1
    i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_dataa <= in_c1_eni6_2;
    i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_enable(0);
    i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_stall_in(0);
    i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni6_2,
        enable => i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_result,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw(EXTIFACE,69)@162 + 1
    i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_dataa <= in_c1_eni6_1;
    i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_enable(0);
    i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_stall_in(0);
    i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni6_1,
        enable => i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_result,
        clock => clock,
        resetn => resetn
    );

    -- i_store_memdep_gemm_nnfw_vunroll_x(BLACKBOX,45)@163
    -- out out_memdep_avm_address@20000000
    -- out out_memdep_avm_burstcount@20000000
    -- out out_memdep_avm_byteenable@20000000
    -- out out_memdep_avm_enable@20000000
    -- out out_memdep_avm_read@20000000
    -- out out_memdep_avm_write@20000000
    -- out out_memdep_avm_writedata@20000000
    -- out out_o_stall@164
    -- out out_o_valid@164
    -- out out_o_writeack@164
    thei_store_memdep_gemm_nnfw_vunroll_x : i_store_memdep_gemm_nnfw85
    PORT MAP (
        in_i_writedata_0 => i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nnfw_result,
        in_i_writedata_1 => i_acl_convert_halftofp_convert_from_half30_i_hf_gemm_nnfw_result,
        in_i_writedata_2 => i_acl_convert_halftofp_convert_from_half31_i_hf_gemm_nnfw_result,
        in_i_writedata_3 => i_acl_convert_halftofp_convert_from_half32_i_hf_gemm_nnfw_result,
        in_i_writedata_4 => i_acl_convert_halftofp_convert_from_half33_i_hf_gemm_nnfw_result,
        in_i_writedata_5 => i_acl_convert_halftofp_convert_from_half34_i_hf_gemm_nnfw_result,
        in_i_writedata_6 => i_acl_convert_halftofp_convert_from_half35_i_hf_gemm_nnfw_result,
        in_i_writedata_7 => i_acl_convert_halftofp_convert_from_half36_i_hf_gemm_nnfw_result,
        in_i_writedata_8 => i_acl_convert_halftofp_convert_from_half37_i_hf_gemm_nnfw_result,
        in_i_writedata_9 => i_acl_convert_halftofp_convert_from_half38_i_hf_gemm_nnfw_result,
        in_i_writedata_10 => i_acl_convert_halftofp_convert_from_half39_i_hf_gemm_nnfw_result,
        in_i_writedata_11 => i_acl_convert_halftofp_convert_from_half40_i_hf_gemm_nnfw_result,
        in_i_writedata_12 => i_acl_convert_halftofp_convert_from_half41_i_hf_gemm_nnfw_result,
        in_i_writedata_13 => i_acl_convert_halftofp_convert_from_half42_i_hf_gemm_nnfw_result,
        in_i_writedata_14 => i_acl_convert_halftofp_convert_from_half43_i_hf_gemm_nnfw_result,
        in_i_writedata_15 => i_acl_convert_halftofp_convert_from_half44_i_hf_gemm_nnfw_result,
        in_flush => in_flush,
        in_i_address => i_arrayidx_gemm_nnfw_vt_join_q,
        in_i_dependence => redist0_i_acl_pop_i1_memdep_phi_pop1050_pop27_gemm_nnfw_out_data_out_1_q,
        in_i_predicate => redist2_sync_in_aunroll_x_in_c1_eni6_20_1_q,
        in_i_stall => GND_q,
        in_i_valid => redist3_sync_in_aunroll_x_in_i_valid_1_q,
        in_memdep_avm_readdata => in_memdep_avm_readdata,
        in_memdep_avm_readdatavalid => in_memdep_avm_readdatavalid,
        in_memdep_avm_waitrequest => in_memdep_avm_waitrequest,
        in_memdep_avm_writeack => in_memdep_avm_writeack,
        out_memdep_avm_address => i_store_memdep_gemm_nnfw_vunroll_x_out_memdep_avm_address,
        out_memdep_avm_burstcount => i_store_memdep_gemm_nnfw_vunroll_x_out_memdep_avm_burstcount,
        out_memdep_avm_byteenable => i_store_memdep_gemm_nnfw_vunroll_x_out_memdep_avm_byteenable,
        out_memdep_avm_enable => i_store_memdep_gemm_nnfw_vunroll_x_out_memdep_avm_enable,
        out_memdep_avm_read => i_store_memdep_gemm_nnfw_vunroll_x_out_memdep_avm_read,
        out_memdep_avm_write => i_store_memdep_gemm_nnfw_vunroll_x_out_memdep_avm_write,
        out_memdep_avm_writedata => i_store_memdep_gemm_nnfw_vunroll_x_out_memdep_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- ext_sig_sync_out(GPOUT,53)
    out_memdep_avm_address <= i_store_memdep_gemm_nnfw_vunroll_x_out_memdep_avm_address;
    out_memdep_avm_enable <= i_store_memdep_gemm_nnfw_vunroll_x_out_memdep_avm_enable;
    out_memdep_avm_read <= i_store_memdep_gemm_nnfw_vunroll_x_out_memdep_avm_read;
    out_memdep_avm_write <= i_store_memdep_gemm_nnfw_vunroll_x_out_memdep_avm_write;
    out_memdep_avm_writedata <= i_store_memdep_gemm_nnfw_vunroll_x_out_memdep_avm_writedata;
    out_memdep_avm_byteenable <= i_store_memdep_gemm_nnfw_vunroll_x_out_memdep_avm_byteenable;
    out_memdep_avm_burstcount <= i_store_memdep_gemm_nnfw_vunroll_x_out_memdep_avm_burstcount;

END normal;
