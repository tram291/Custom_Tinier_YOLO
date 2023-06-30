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

-- VHDL created from bb_gemm_nn9W_B2_stall_region
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

entity bb_gemm_nn9W_B2_stall_region is
    port (
        out_c0_exe12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit340_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit340_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit340_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit340_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit340_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit340_5 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit340_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit340_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit340_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit340_9 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit340_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit340_11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit340_12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit340_13 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit340_14 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit340_15 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_B_load_0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memcoalesce_B_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_B_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_B_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_B_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memcoalesce_B_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_B_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_K : in std_logic_vector(31 downto 0);  -- ufix32
        in_forked : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked303319 : in std_logic_vector(0 downto 0);  -- ufix1
        in_j_076_pop9321 : in std_logic_vector(31 downto 0);  -- ufix32
        in_lda_sync_buffer320 : in std_logic_vector(31 downto 0);  -- ufix32
        in_memdep_phi261_pop11324 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi266_pop12325 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi269_pop13326 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi272_pop14327 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi274_pop15328 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi_pop10323 : in std_logic_vector(0 downto 0);  -- ufix1
        in_notexit300322 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_259_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_259_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_259_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_259_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_N : in std_logic_vector(31 downto 0);  -- ufix32
        in_memdep_264_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_264_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_264_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_264_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_259_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_259_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_259_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_259_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_259_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_259_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_259_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_264_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_264_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_264_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_264_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_264_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_264_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_264_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_B_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_B_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_B_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_B_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_B : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nn9W_B2_stall_region;

architecture normal of bb_gemm_nn9W_B2_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component gemm_nn9W_B2_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_memcoalesce_b_load_0_gemm_nn9w101 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_B_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_B_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_B_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_B_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata_0 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_1 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_2 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_3 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_4 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_5 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_6 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_7 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_8 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_9 : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_o_readdata_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_readdata_11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w is
        port (
            in_c0_eni7_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni7_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni7_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni7_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni7_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni7_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni7_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni7_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_B : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_K : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit340_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit340_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit340_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit340_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit340_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit340_5 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit340_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit340_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit340_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit340_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit340_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit340_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit340_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit340_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit340_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit340_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w is
        port (
            in_c1_eni12_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni12_1 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni12_2 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni12_3 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni12_4 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni12_5 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni12_6 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni12_7 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni12_8 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni12_9 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni12_10 : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_c1_eni12_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni12_12 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_eni12_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni12_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni12_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni12_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni12_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni12_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni12_19 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni12_20 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni12_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni12_22 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni12_23 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe1341 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_259_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_259_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_259_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_259_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_264_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_264_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_264_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_264_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_259_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_259_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_259_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_259_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_259_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_259_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_259_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_memdep_264_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_264_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_264_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_264_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_264_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_264_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_264_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_memdep_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component acl_data_fifo is
        generic (
            DEPTH : INTEGER := 0;
            DATA_WIDTH : INTEGER := 32;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0;
            IMPL : STRING := "ram"
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            data_in : in std_logic_vector(DATA_WIDTH - 1 downto 0);
            valid_out : out std_logic;
            stall_out : out std_logic;
            data_out : out std_logic_vector(DATA_WIDTH - 1 downto 0);
            full : out std_logic;
            almost_full : out std_logic
        );
    end component;
























    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_4 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_5 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_6 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_7 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_8 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_9 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_11 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_memcoalesce_B_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_memcoalesce_B_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_memcoalesce_B_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_memcoalesce_B_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_memcoalesce_B_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_memcoalesce_B_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_memcoalesce_B_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_c1_exit_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_c1_exit_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_c1_exit_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_c1_exit_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_259_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_259_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_259_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_259_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_259_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_259_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_259_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_264_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_264_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_264_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_264_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_264_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_264_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_264_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_gemm_nn9W_B2_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (73 downto 0);
    signal bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_i : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_j : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_k : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_l : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_m : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_q : STD_LOGIC_VECTOR (255 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_c : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_d : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_e : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_f : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_g : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_h : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_i : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_j : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_k : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_l : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_m : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q : STD_LOGIC_VECTOR (202 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_g : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_i : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_j : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_k : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_l : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_m : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_n : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_o : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_p : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_q : STD_LOGIC_VECTOR (3 downto 0);
    signal bubble_select_i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_e : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (73 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_i : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_j : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_k : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_l : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_m : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V16 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and14 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and15 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_data_in : STD_LOGIC_VECTOR (255 downto 0);
    signal bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_stall_out_bitsignaltemp : std_logic;
    signal bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_data_out : STD_LOGIC_VECTOR (255 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_D0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4(STALLENABLE,269)
    -- Valid signal propagation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_V0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_R_v_0;
    -- Stall signal propagation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_s_tv_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_backStall and SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_R_v_0;
    -- Backward Enable generation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_backEN <= not (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_v_s_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_backEN and SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_V;
    -- Backward Stall generation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_backStall <= not (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_backEN);
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_backEN = "0") THEN
                SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_R_v_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_R_v_0 and SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_s_tv_0;
            ELSE
                SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_R_v_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2(STALLENABLE,267)
    -- Valid signal propagation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_V0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_R_v_0;
    -- Stall signal propagation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_s_tv_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_backStall and SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_R_v_0;
    -- Backward Enable generation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_backEN <= not (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_v_s_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_backEN and SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_V;
    -- Backward Stall generation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_backStall <= not (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_backEN);
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_backEN = "0") THEN
                SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_R_v_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_R_v_0 and SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_s_tv_0;
            ELSE
                SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_R_v_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0(STALLENABLE,265)
    -- Valid signal propagation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_V0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_R_v_0;
    -- Stall signal propagation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_s_tv_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_backStall and SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_R_v_0;
    -- Backward Enable generation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_backEN <= not (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_v_s_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_backEN and SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_V;
    -- Backward Stall generation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_backStall <= not (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_backEN);
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_backEN = "0") THEN
                SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_R_v_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_R_v_0 and SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_s_tv_0;
            ELSE
                SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_R_v_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo(BITJOIN,167)
    bubble_join_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_q <= redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_data_out;

    -- bubble_select_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo(BITSELECT,168)
    bubble_select_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_q(0 downto 0));

    -- redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0(REG,96)
    redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_backEN = "1") THEN
                redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_q <= STD_LOGIC_VECTOR(SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1(REG,97)
    redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_backEN = "1") THEN
                redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_q <= STD_LOGIC_VECTOR(redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2(REG,98)
    redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_backEN = "1") THEN
                redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_q <= STD_LOGIC_VECTOR(SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3(REG,99)
    redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_backEN = "1") THEN
                redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_q <= STD_LOGIC_VECTOR(redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4(REG,100)
    redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_backEN = "1") THEN
                redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_q <= STD_LOGIC_VECTOR(SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5(REG,101)
    redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_backEN = "1") THEN
                redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_q <= STD_LOGIC_VECTOR(redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6(STALLREG,422)
    SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_r_valid <= (others => '0');
            SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_r_valid <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_backStall and (SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_r_valid or SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_i_valid);

            IF (SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_r_data0 <= STD_LOGIC_VECTOR(redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_i_valid <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_V0;
    -- Stall signal propagation
    SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_backStall <= SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_r_valid or not (SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_i_valid);

    -- Valid
    SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_V <= SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_r_valid WHEN SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_r_valid = "1" ELSE SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_i_valid;

    SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_D0 <= SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_r_data0 WHEN SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_r_valid = "1" ELSE redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_q;

    -- SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5(STALLENABLE,261)
    -- Valid signal propagation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_V0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_R_v_0;
    -- Stall signal propagation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_s_tv_0 <= SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_backStall and SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_R_v_0;
    -- Backward Enable generation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_backEN <= not (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_v_s_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_backEN and SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_V0;
    -- Backward Stall generation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_backStall <= not (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_v_s_0);
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_backEN = "0") THEN
                SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_R_v_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_R_v_0 and SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_s_tv_0;
            ELSE
                SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_R_v_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4(STALLENABLE,260)
    -- Valid signal propagation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_V0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_R_v_0;
    -- Stall signal propagation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_s_tv_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_5_backStall and SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_R_v_0;
    -- Backward Enable generation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_backEN <= not (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_v_s_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_backEN and SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_V;
    -- Backward Stall generation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_backStall <= not (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_backEN);
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_backEN = "0") THEN
                SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_R_v_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_R_v_0 and SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_s_tv_0;
            ELSE
                SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_R_v_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4(STALLREG,421)
    SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_r_valid <= (others => '0');
            SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_r_valid <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_backStall and (SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_r_valid or SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_i_valid);

            IF (SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_r_data0 <= STD_LOGIC_VECTOR(redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_i_valid <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_V0;
    -- Stall signal propagation
    SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_backStall <= SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_r_valid or not (SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_i_valid);

    -- Valid
    SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_V <= SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_r_valid WHEN SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_r_valid = "1" ELSE SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_i_valid;

    SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_D0 <= SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_r_data0 WHEN SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_r_valid = "1" ELSE redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_q;

    -- SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3(STALLENABLE,259)
    -- Valid signal propagation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_V0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_R_v_0;
    -- Stall signal propagation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_s_tv_0 <= SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_4_backStall and SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_R_v_0;
    -- Backward Enable generation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_backEN <= not (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_v_s_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_backEN and SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_V0;
    -- Backward Stall generation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_backStall <= not (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_v_s_0);
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_backEN = "0") THEN
                SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_R_v_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_R_v_0 and SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_s_tv_0;
            ELSE
                SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_R_v_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2(STALLENABLE,258)
    -- Valid signal propagation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_V0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_R_v_0;
    -- Stall signal propagation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_s_tv_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_3_backStall and SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_R_v_0;
    -- Backward Enable generation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_backEN <= not (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_v_s_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_backEN and SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_V;
    -- Backward Stall generation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_backStall <= not (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_backEN);
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_backEN = "0") THEN
                SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_R_v_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_R_v_0 and SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_s_tv_0;
            ELSE
                SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_R_v_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2(STALLREG,420)
    SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_r_valid <= (others => '0');
            SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_r_valid <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_backStall and (SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_r_valid or SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_i_valid);

            IF (SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_r_data0 <= STD_LOGIC_VECTOR(redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_i_valid <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_V0;
    -- Stall signal propagation
    SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_backStall <= SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_r_valid or not (SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_i_valid);

    -- Valid
    SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_V <= SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_r_valid WHEN SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_r_valid = "1" ELSE SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_i_valid;

    SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_D0 <= SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_r_data0 WHEN SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_r_valid = "1" ELSE redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_q;

    -- SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1(STALLENABLE,257)
    -- Valid signal propagation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_V0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_R_v_0;
    -- Stall signal propagation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_s_tv_0 <= SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_2_backStall and SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_R_v_0;
    -- Backward Enable generation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_backEN <= not (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_v_s_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_backEN and SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_V0;
    -- Backward Stall generation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_backStall <= not (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_v_s_0);
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_backEN = "0") THEN
                SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_R_v_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_R_v_0 and SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_s_tv_0;
            ELSE
                SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_R_v_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0(STALLENABLE,256)
    -- Valid signal propagation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_V0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_R_v_0;
    -- Stall signal propagation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_s_tv_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_1_backStall and SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_R_v_0;
    -- Backward Enable generation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_backEN <= not (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_v_s_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_backEN and SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_V;
    -- Backward Stall generation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_backStall <= not (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_backEN);
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_backEN = "0") THEN
                SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_R_v_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_R_v_0 and SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_s_tv_0;
            ELSE
                SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_R_v_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0(STALLREG,419)
    SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_r_valid <= (others => '0');
            SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_r_valid <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_backStall and (SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_r_valid or SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_i_valid);

            IF (SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_r_data0 <= STD_LOGIC_VECTOR(bubble_select_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_i_valid <= SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_V1;
    -- Stall signal propagation
    SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_backStall <= SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_r_valid or not (SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_i_valid);

    -- Valid
    SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_V <= SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_r_valid WHEN SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_r_valid = "1" ELSE SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_i_valid;

    SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_D0 <= SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_r_data0 WHEN SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_r_valid = "1" ELSE bubble_select_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_b;

    -- redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo(STALLFIFO,95)
    redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V10;
    redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_stall_in <= SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_backStall;
    redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_k;
    redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_valid_in_bitsignaltemp <= redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_valid_in(0);
    redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_stall_in_bitsignaltemp <= redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_stall_in(0);
    redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_valid_out(0) <= redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_valid_out_bitsignaltemp;
    redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_stall_out(0) <= redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_stall_out_bitsignaltemp;
    theredist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 153,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_valid_in_bitsignaltemp,
        stall_in => redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_k,
        valid_out => redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_valid_out_bitsignaltemp,
        stall_out => redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_stall_out_bitsignaltemp,
        data_out => redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo(STALLENABLE,255)
    SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_fromReg0 <= (others => '0');
            SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_fromReg0 <= SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_toReg0;
            -- Succesor 1
            SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_fromReg1 <= SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_consumed0 <= (not (SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_backStall) and SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_wireValid) or SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_fromReg0;
    SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_consumed1 <= (not (SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_0_backStall) and SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_wireValid) or SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_fromReg1;
    -- Consuming
    SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_StallValid <= SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_backStall and SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_wireValid;
    SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_toReg0 <= SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_StallValid and SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_consumed0;
    SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_toReg1 <= SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_StallValid and SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_or0 <= SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_consumed0;
    SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_wireStall <= not (SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_consumed1 and SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_or0);
    SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_backStall <= SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_V0 <= SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_wireValid and not (SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_fromReg0);
    SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_V1 <= SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_wireValid and not (SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_wireValid <= redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_valid_out;

    -- bubble_join_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo(BITJOIN,164)
    bubble_join_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_q <= redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_data_out;

    -- bubble_select_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo(BITSELECT,165)
    bubble_select_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_q(0 downto 0));

    -- redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0(REG,88)
    redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_backEN = "1") THEN
                redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_q <= STD_LOGIC_VECTOR(SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1(REG,89)
    redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_backEN = "1") THEN
                redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_q <= STD_LOGIC_VECTOR(redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2(REG,90)
    redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_backEN = "1") THEN
                redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_q <= STD_LOGIC_VECTOR(SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3(REG,91)
    redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_backEN = "1") THEN
                redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_q <= STD_LOGIC_VECTOR(redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4(REG,92)
    redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_backEN = "1") THEN
                redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_q <= STD_LOGIC_VECTOR(SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5(REG,93)
    redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_backEN = "1") THEN
                redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_q <= STD_LOGIC_VECTOR(redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6(STALLREG,418)
    SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_r_valid <= (others => '0');
            SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_r_valid <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_backStall and (SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_r_valid or SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_i_valid);

            IF (SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_r_data0 <= STD_LOGIC_VECTOR(redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_i_valid <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_V0;
    -- Stall signal propagation
    SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_backStall <= SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_r_valid or not (SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_i_valid);

    -- Valid
    SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_V <= SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_r_valid WHEN SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_r_valid = "1" ELSE SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_i_valid;

    SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_D0 <= SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_r_data0 WHEN SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_r_valid = "1" ELSE redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_q;

    -- SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5(STALLENABLE,252)
    -- Valid signal propagation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_V0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_R_v_0;
    -- Stall signal propagation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_s_tv_0 <= SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_backStall and SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_R_v_0;
    -- Backward Enable generation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_backEN <= not (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_v_s_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_backEN and SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_V0;
    -- Backward Stall generation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_backStall <= not (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_v_s_0);
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_backEN = "0") THEN
                SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_R_v_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_R_v_0 and SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_s_tv_0;
            ELSE
                SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_R_v_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4(STALLENABLE,251)
    -- Valid signal propagation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_V0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_R_v_0;
    -- Stall signal propagation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_s_tv_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_5_backStall and SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_R_v_0;
    -- Backward Enable generation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_backEN <= not (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_v_s_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_backEN and SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_V;
    -- Backward Stall generation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_backStall <= not (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_backEN);
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_backEN = "0") THEN
                SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_R_v_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_R_v_0 and SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_s_tv_0;
            ELSE
                SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_R_v_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4(STALLREG,417)
    SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_r_valid <= (others => '0');
            SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_r_valid <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_backStall and (SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_r_valid or SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_i_valid);

            IF (SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_r_data0 <= STD_LOGIC_VECTOR(redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_i_valid <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_V0;
    -- Stall signal propagation
    SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_backStall <= SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_r_valid or not (SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_i_valid);

    -- Valid
    SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_V <= SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_r_valid WHEN SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_r_valid = "1" ELSE SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_i_valid;

    SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_D0 <= SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_r_data0 WHEN SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_r_valid = "1" ELSE redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_q;

    -- SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3(STALLENABLE,250)
    -- Valid signal propagation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_V0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_R_v_0;
    -- Stall signal propagation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_s_tv_0 <= SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_4_backStall and SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_R_v_0;
    -- Backward Enable generation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_backEN <= not (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_v_s_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_backEN and SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_V0;
    -- Backward Stall generation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_backStall <= not (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_v_s_0);
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_backEN = "0") THEN
                SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_R_v_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_R_v_0 and SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_s_tv_0;
            ELSE
                SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_R_v_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2(STALLENABLE,249)
    -- Valid signal propagation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_V0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_R_v_0;
    -- Stall signal propagation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_s_tv_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_3_backStall and SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_R_v_0;
    -- Backward Enable generation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_backEN <= not (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_v_s_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_backEN and SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_V;
    -- Backward Stall generation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_backStall <= not (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_backEN);
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_backEN = "0") THEN
                SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_R_v_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_R_v_0 and SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_s_tv_0;
            ELSE
                SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_R_v_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2(STALLREG,416)
    SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_r_valid <= (others => '0');
            SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_r_valid <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_backStall and (SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_r_valid or SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_i_valid);

            IF (SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_r_data0 <= STD_LOGIC_VECTOR(redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_i_valid <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_V0;
    -- Stall signal propagation
    SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_backStall <= SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_r_valid or not (SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_i_valid);

    -- Valid
    SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_V <= SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_r_valid WHEN SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_r_valid = "1" ELSE SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_i_valid;

    SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_D0 <= SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_r_data0 WHEN SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_r_valid = "1" ELSE redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_q;

    -- SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1(STALLENABLE,248)
    -- Valid signal propagation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_V0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_R_v_0;
    -- Stall signal propagation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_s_tv_0 <= SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_2_backStall and SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_R_v_0;
    -- Backward Enable generation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_backEN <= not (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_v_s_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_backEN and SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_V0;
    -- Backward Stall generation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_backStall <= not (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_v_s_0);
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_backEN = "0") THEN
                SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_R_v_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_R_v_0 and SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_s_tv_0;
            ELSE
                SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_R_v_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0(STALLENABLE,247)
    -- Valid signal propagation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_V0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_R_v_0;
    -- Stall signal propagation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_s_tv_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_1_backStall and SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_R_v_0;
    -- Backward Enable generation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_backEN <= not (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_v_s_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_backEN and SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_V;
    -- Backward Stall generation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_backStall <= not (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_backEN);
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_backEN = "0") THEN
                SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_R_v_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_R_v_0 and SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_s_tv_0;
            ELSE
                SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_R_v_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0(STALLREG,415)
    SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_r_valid <= (others => '0');
            SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_r_valid <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_backStall and (SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_r_valid or SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_i_valid);

            IF (SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_r_data0 <= STD_LOGIC_VECTOR(bubble_select_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_i_valid <= SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_V1;
    -- Stall signal propagation
    SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_backStall <= SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_r_valid or not (SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_i_valid);

    -- Valid
    SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_V <= SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_r_valid WHEN SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_r_valid = "1" ELSE SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_i_valid;

    SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_D0 <= SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_r_data0 WHEN SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_r_valid = "1" ELSE bubble_select_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_b;

    -- redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo(STALLFIFO,87)
    redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V9;
    redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_stall_in <= SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_backStall;
    redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_j;
    redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_valid_in_bitsignaltemp <= redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_valid_in(0);
    redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_stall_in_bitsignaltemp <= redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_stall_in(0);
    redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_valid_out(0) <= redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_valid_out_bitsignaltemp;
    redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_stall_out(0) <= redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_stall_out_bitsignaltemp;
    theredist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 153,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_valid_in_bitsignaltemp,
        stall_in => redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_j,
        valid_out => redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_valid_out_bitsignaltemp,
        stall_out => redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_stall_out_bitsignaltemp,
        data_out => redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo(STALLENABLE,246)
    SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_fromReg0 <= (others => '0');
            SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_fromReg0 <= SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_toReg0;
            -- Succesor 1
            SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_fromReg1 <= SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_consumed0 <= (not (SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_backStall) and SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_wireValid) or SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_fromReg0;
    SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_consumed1 <= (not (SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_0_backStall) and SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_wireValid) or SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_fromReg1;
    -- Consuming
    SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_StallValid <= SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_backStall and SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_wireValid;
    SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_toReg0 <= SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_StallValid and SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_consumed0;
    SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_toReg1 <= SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_StallValid and SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_or0 <= SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_consumed0;
    SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_wireStall <= not (SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_consumed1 and SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_or0);
    SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_backStall <= SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_V0 <= SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_wireValid and not (SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_fromReg0);
    SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_V1 <= SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_wireValid and not (SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_wireValid <= redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_valid_out;

    -- bubble_join_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo(BITJOIN,152)
    bubble_join_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_q <= redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_data_out;

    -- bubble_select_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo(BITSELECT,153)
    bubble_select_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_q(31 downto 0));

    -- redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0(REG,77)
    redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_backEN = "1") THEN
                redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_q <= STD_LOGIC_VECTOR(SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1(REG,78)
    redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_backEN = "1") THEN
                redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_q <= STD_LOGIC_VECTOR(redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2(REG,79)
    redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_backEN = "1") THEN
                redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_q <= STD_LOGIC_VECTOR(SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3(REG,80)
    redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_backEN = "1") THEN
                redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_q <= STD_LOGIC_VECTOR(redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4(REG,81)
    redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_backEN = "1") THEN
                redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_q <= STD_LOGIC_VECTOR(SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5(REG,82)
    redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_backEN = "1") THEN
                redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_q <= STD_LOGIC_VECTOR(redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6(STALLREG,414)
    SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_r_valid <= (others => '0');
            SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_r_valid <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_backStall and (SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_r_valid or SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_i_valid);

            IF (SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_r_data0 <= STD_LOGIC_VECTOR(redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_i_valid <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_V0;
    -- Stall signal propagation
    SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_backStall <= SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_r_valid or not (SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_i_valid);

    -- Valid
    SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_V <= SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_r_valid WHEN SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_r_valid = "1" ELSE SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_i_valid;

    SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_D0 <= SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_r_data0 WHEN SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_r_valid = "1" ELSE redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_q;

    -- SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5(STALLENABLE,237)
    -- Valid signal propagation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_V0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_R_v_0;
    -- Stall signal propagation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_s_tv_0 <= SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_backStall and SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_R_v_0;
    -- Backward Enable generation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_backEN <= not (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_v_s_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_backEN and SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_V0;
    -- Backward Stall generation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_backStall <= not (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_v_s_0);
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_backEN = "0") THEN
                SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_R_v_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_R_v_0 and SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_s_tv_0;
            ELSE
                SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_R_v_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4(STALLENABLE,236)
    -- Valid signal propagation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_V0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_R_v_0;
    -- Stall signal propagation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_s_tv_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_5_backStall and SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_R_v_0;
    -- Backward Enable generation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_backEN <= not (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_v_s_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_backEN and SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_V;
    -- Backward Stall generation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_backStall <= not (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_backEN);
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_backEN = "0") THEN
                SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_R_v_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_R_v_0 and SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_s_tv_0;
            ELSE
                SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_R_v_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4(STALLREG,413)
    SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_r_valid <= (others => '0');
            SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_r_valid <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_backStall and (SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_r_valid or SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_i_valid);

            IF (SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_r_data0 <= STD_LOGIC_VECTOR(redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_i_valid <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_V0;
    -- Stall signal propagation
    SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_backStall <= SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_r_valid or not (SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_i_valid);

    -- Valid
    SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_V <= SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_r_valid WHEN SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_r_valid = "1" ELSE SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_i_valid;

    SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_D0 <= SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_r_data0 WHEN SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_r_valid = "1" ELSE redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_q;

    -- SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3(STALLENABLE,235)
    -- Valid signal propagation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_V0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_R_v_0;
    -- Stall signal propagation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_s_tv_0 <= SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_4_backStall and SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_R_v_0;
    -- Backward Enable generation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_backEN <= not (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_v_s_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_backEN and SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_V0;
    -- Backward Stall generation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_backStall <= not (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_v_s_0);
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_backEN = "0") THEN
                SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_R_v_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_R_v_0 and SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_s_tv_0;
            ELSE
                SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_R_v_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2(STALLENABLE,234)
    -- Valid signal propagation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_V0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_R_v_0;
    -- Stall signal propagation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_s_tv_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_3_backStall and SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_R_v_0;
    -- Backward Enable generation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_backEN <= not (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_v_s_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_backEN and SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_V;
    -- Backward Stall generation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_backStall <= not (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_backEN);
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_backEN = "0") THEN
                SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_R_v_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_R_v_0 and SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_s_tv_0;
            ELSE
                SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_R_v_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2(STALLREG,412)
    SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_r_valid <= (others => '0');
            SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_r_valid <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_backStall and (SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_r_valid or SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_i_valid);

            IF (SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_r_data0 <= STD_LOGIC_VECTOR(redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_i_valid <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_V0;
    -- Stall signal propagation
    SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_backStall <= SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_r_valid or not (SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_i_valid);

    -- Valid
    SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_V <= SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_r_valid WHEN SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_r_valid = "1" ELSE SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_i_valid;

    SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_D0 <= SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_r_data0 WHEN SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_r_valid = "1" ELSE redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_q;

    -- SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1(STALLENABLE,233)
    -- Valid signal propagation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_V0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_R_v_0;
    -- Stall signal propagation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_s_tv_0 <= SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_2_backStall and SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_R_v_0;
    -- Backward Enable generation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_backEN <= not (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_v_s_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_backEN and SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_V0;
    -- Backward Stall generation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_backStall <= not (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_v_s_0);
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_backEN = "0") THEN
                SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_R_v_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_R_v_0 and SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_s_tv_0;
            ELSE
                SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_R_v_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0(STALLENABLE,232)
    -- Valid signal propagation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_V0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_R_v_0;
    -- Stall signal propagation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_s_tv_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_1_backStall and SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_R_v_0;
    -- Backward Enable generation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_backEN <= not (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_v_s_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_backEN and SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_V;
    -- Backward Stall generation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_backStall <= not (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_backEN);
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_backEN = "0") THEN
                SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_R_v_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_R_v_0 and SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_s_tv_0;
            ELSE
                SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_R_v_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0(STALLREG,411)
    SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_r_valid <= (others => '0');
            SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_r_valid <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_backStall and (SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_r_valid or SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_i_valid);

            IF (SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_r_data0 <= STD_LOGIC_VECTOR(bubble_select_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_i_valid <= SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_V1;
    -- Stall signal propagation
    SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_backStall <= SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_r_valid or not (SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_i_valid);

    -- Valid
    SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_V <= SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_r_valid WHEN SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_r_valid = "1" ELSE SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_i_valid;

    SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_D0 <= SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_r_data0 WHEN SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_r_valid = "1" ELSE bubble_select_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_b;

    -- redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo(STALLFIFO,76)
    redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V5;
    redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_stall_in <= SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_backStall;
    redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_f;
    redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_valid_in_bitsignaltemp <= redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_valid_in(0);
    redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_stall_in_bitsignaltemp <= redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_stall_in(0);
    redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_valid_out(0) <= redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_valid_out_bitsignaltemp;
    redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_stall_out(0) <= redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_stall_out_bitsignaltemp;
    theredist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 153,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_f,
        valid_out => redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_stall_out_bitsignaltemp,
        data_out => redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo(STALLENABLE,231)
    SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_fromReg0 <= (others => '0');
            SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_fromReg0 <= SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_toReg0;
            -- Succesor 1
            SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_fromReg1 <= SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_consumed0 <= (not (SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_backStall) and SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_wireValid) or SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_fromReg0;
    SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_consumed1 <= (not (SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_0_backStall) and SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_wireValid) or SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_fromReg1;
    -- Consuming
    SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_StallValid <= SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_backStall and SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_wireValid;
    SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_toReg0 <= SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_StallValid and SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_consumed0;
    SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_toReg1 <= SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_StallValid and SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_or0 <= SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_consumed0;
    SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_wireStall <= not (SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_consumed1 and SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_or0);
    SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_backStall <= SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_V0 <= SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_wireValid and not (SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_fromReg0);
    SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_V1 <= SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_wireValid and not (SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_wireValid <= redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_valid_out;

    -- bubble_join_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo(BITJOIN,143)
    bubble_join_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_q <= redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_data_out;

    -- bubble_select_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo(BITSELECT,144)
    bubble_select_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_q(0 downto 0));

    -- redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0(REG,67)
    redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_backEN = "1") THEN
                redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_q <= STD_LOGIC_VECTOR(SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1(REG,68)
    redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_backEN = "1") THEN
                redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_q <= STD_LOGIC_VECTOR(redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2(REG,69)
    redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_backEN = "1") THEN
                redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_q <= STD_LOGIC_VECTOR(SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3(REG,70)
    redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_backEN = "1") THEN
                redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_q <= STD_LOGIC_VECTOR(redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4(REG,71)
    redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_backEN = "1") THEN
                redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_q <= STD_LOGIC_VECTOR(SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5(REG,72)
    redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_backEN = "1") THEN
                redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_q <= STD_LOGIC_VECTOR(redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6(STALLREG,410)
    SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_r_valid <= (others => '0');
            SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_r_valid <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_backStall and (SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_r_valid or SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_i_valid);

            IF (SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_r_data0 <= STD_LOGIC_VECTOR(redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_i_valid <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_V0;
    -- Stall signal propagation
    SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_backStall <= SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_r_valid or not (SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_i_valid);

    -- Valid
    SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_V <= SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_r_valid WHEN SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_r_valid = "1" ELSE SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_i_valid;

    SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_D0 <= SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_r_data0 WHEN SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_r_valid = "1" ELSE redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_q;

    -- SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5(STALLENABLE,224)
    -- Valid signal propagation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_V0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_R_v_0;
    -- Stall signal propagation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_s_tv_0 <= SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_backStall and SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_R_v_0;
    -- Backward Enable generation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_backEN <= not (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_v_s_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_backEN and SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_V0;
    -- Backward Stall generation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_backStall <= not (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_v_s_0);
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_backEN = "0") THEN
                SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_R_v_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_R_v_0 and SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_s_tv_0;
            ELSE
                SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_R_v_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4(STALLENABLE,223)
    -- Valid signal propagation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_V0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_R_v_0;
    -- Stall signal propagation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_s_tv_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_5_backStall and SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_R_v_0;
    -- Backward Enable generation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_backEN <= not (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_v_s_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_backEN and SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_V;
    -- Backward Stall generation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_backStall <= not (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_backEN);
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_backEN = "0") THEN
                SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_R_v_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_R_v_0 and SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_s_tv_0;
            ELSE
                SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_R_v_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4(STALLREG,409)
    SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_r_valid <= (others => '0');
            SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_r_valid <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_backStall and (SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_r_valid or SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_i_valid);

            IF (SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_r_data0 <= STD_LOGIC_VECTOR(redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_i_valid <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_V0;
    -- Stall signal propagation
    SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_backStall <= SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_r_valid or not (SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_i_valid);

    -- Valid
    SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_V <= SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_r_valid WHEN SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_r_valid = "1" ELSE SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_i_valid;

    SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_D0 <= SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_r_data0 WHEN SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_r_valid = "1" ELSE redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_q;

    -- SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3(STALLENABLE,222)
    -- Valid signal propagation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_V0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_R_v_0;
    -- Stall signal propagation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_s_tv_0 <= SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_4_backStall and SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_R_v_0;
    -- Backward Enable generation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_backEN <= not (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_v_s_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_backEN and SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_V0;
    -- Backward Stall generation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_backStall <= not (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_v_s_0);
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_backEN = "0") THEN
                SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_R_v_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_R_v_0 and SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_s_tv_0;
            ELSE
                SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_R_v_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2(STALLENABLE,221)
    -- Valid signal propagation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_V0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_R_v_0;
    -- Stall signal propagation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_s_tv_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_3_backStall and SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_R_v_0;
    -- Backward Enable generation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_backEN <= not (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_v_s_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_backEN and SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_V;
    -- Backward Stall generation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_backStall <= not (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_backEN);
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_backEN = "0") THEN
                SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_R_v_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_R_v_0 and SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_s_tv_0;
            ELSE
                SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_R_v_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2(STALLREG,408)
    SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_r_valid <= (others => '0');
            SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_r_valid <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_backStall and (SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_r_valid or SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_i_valid);

            IF (SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_r_data0 <= STD_LOGIC_VECTOR(redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_i_valid <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_V0;
    -- Stall signal propagation
    SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_backStall <= SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_r_valid or not (SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_i_valid);

    -- Valid
    SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_V <= SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_r_valid WHEN SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_r_valid = "1" ELSE SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_i_valid;

    SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_D0 <= SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_r_data0 WHEN SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_r_valid = "1" ELSE redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_q;

    -- SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1(STALLENABLE,220)
    -- Valid signal propagation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_V0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_R_v_0;
    -- Stall signal propagation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_s_tv_0 <= SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_2_backStall and SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_R_v_0;
    -- Backward Enable generation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_backEN <= not (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_v_s_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_backEN and SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_V0;
    -- Backward Stall generation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_backStall <= not (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_v_s_0);
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_backEN = "0") THEN
                SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_R_v_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_R_v_0 and SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_s_tv_0;
            ELSE
                SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_R_v_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0(STALLENABLE,219)
    -- Valid signal propagation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_V0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_R_v_0;
    -- Stall signal propagation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_s_tv_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_1_backStall and SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_R_v_0;
    -- Backward Enable generation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_backEN <= not (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_v_s_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_backEN and SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_V;
    -- Backward Stall generation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_backStall <= not (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_backEN);
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_backEN = "0") THEN
                SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_R_v_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_R_v_0 and SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_s_tv_0;
            ELSE
                SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_R_v_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0(STALLREG,407)
    SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_r_valid <= (others => '0');
            SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_r_valid <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_backStall and (SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_r_valid or SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_i_valid);

            IF (SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_r_data0 <= STD_LOGIC_VECTOR(bubble_select_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_i_valid <= SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_V1;
    -- Stall signal propagation
    SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_backStall <= SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_r_valid or not (SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_i_valid);

    -- Valid
    SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_V <= SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_r_valid WHEN SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_r_valid = "1" ELSE SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_i_valid;

    SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_D0 <= SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_r_data0 WHEN SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_r_valid = "1" ELSE bubble_select_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_b;

    -- redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo(STALLFIFO,66)
    redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V2;
    redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_stall_in <= SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_backStall;
    redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_c;
    redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_valid_in_bitsignaltemp <= redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_valid_in(0);
    redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_stall_in_bitsignaltemp <= redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_stall_in(0);
    redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_valid_out(0) <= redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_valid_out_bitsignaltemp;
    redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_stall_out(0) <= redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_stall_out_bitsignaltemp;
    theredist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 153,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_c,
        valid_out => redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_stall_out_bitsignaltemp,
        data_out => redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo(STALLENABLE,218)
    SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_fromReg0 <= (others => '0');
            SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_fromReg0 <= SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_toReg0;
            -- Succesor 1
            SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_fromReg1 <= SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_consumed0 <= (not (SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_backStall) and SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_wireValid) or SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_fromReg0;
    SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_consumed1 <= (not (SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_0_backStall) and SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_wireValid) or SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_fromReg1;
    -- Consuming
    SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_StallValid <= SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_backStall and SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_wireValid;
    SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_toReg0 <= SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_StallValid and SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_consumed0;
    SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_toReg1 <= SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_StallValid and SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_or0 <= SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_consumed0;
    SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_wireStall <= not (SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_consumed1 and SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_or0);
    SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_backStall <= SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_V0 <= SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_wireValid and not (SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_fromReg0);
    SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_V1 <= SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_wireValid and not (SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_wireValid <= redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_valid_out;

    -- i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x(BLACKBOX,21)@18
    -- in in_i_stall@20000000
    -- out out_o_readdata_0@170
    -- out out_o_readdata_1@170
    -- out out_o_readdata_2@170
    -- out out_o_readdata_3@170
    -- out out_o_readdata_4@170
    -- out out_o_readdata_5@170
    -- out out_o_readdata_6@170
    -- out out_o_readdata_7@170
    -- out out_o_readdata_8@170
    -- out out_o_readdata_9@170
    -- out out_o_readdata_10@170
    -- out out_o_readdata_11@170
    -- out out_memcoalesce_B_load_0_avm_address@20000000
    -- out out_memcoalesce_B_load_0_avm_burstcount@20000000
    -- out out_memcoalesce_B_load_0_avm_byteenable@20000000
    -- out out_memcoalesce_B_load_0_avm_enable@20000000
    -- out out_memcoalesce_B_load_0_avm_read@20000000
    -- out out_memcoalesce_B_load_0_avm_write@20000000
    -- out out_memcoalesce_B_load_0_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@170
    thei_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x : i_load_memcoalesce_b_load_0_gemm_nn9w101
    PORT MAP (
        in_flush => in_flush,
        in_i_address => bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_g,
        in_i_predicate => bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_k,
        in_i_stall => SE_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_backStall,
        in_i_valid => SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V0,
        in_memcoalesce_B_load_0_avm_readdata => in_memcoalesce_B_load_0_avm_readdata,
        in_memcoalesce_B_load_0_avm_readdatavalid => in_memcoalesce_B_load_0_avm_readdatavalid,
        in_memcoalesce_B_load_0_avm_waitrequest => in_memcoalesce_B_load_0_avm_waitrequest,
        in_memcoalesce_B_load_0_avm_writeack => in_memcoalesce_B_load_0_avm_writeack,
        out_o_readdata_0 => i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_1,
        out_o_readdata_2 => i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_2,
        out_o_readdata_3 => i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_3,
        out_o_readdata_4 => i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_4,
        out_o_readdata_5 => i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_5,
        out_o_readdata_6 => i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_6,
        out_o_readdata_7 => i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_7,
        out_o_readdata_8 => i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_8,
        out_o_readdata_9 => i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_9,
        out_o_readdata_10 => i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_10,
        out_o_readdata_11 => i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_11,
        out_memcoalesce_B_load_0_avm_address => i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_memcoalesce_B_load_0_avm_address,
        out_memcoalesce_B_load_0_avm_burstcount => i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_memcoalesce_B_load_0_avm_burstcount,
        out_memcoalesce_B_load_0_avm_byteenable => i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_memcoalesce_B_load_0_avm_byteenable,
        out_memcoalesce_B_load_0_avm_enable => i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_memcoalesce_B_load_0_avm_enable,
        out_memcoalesce_B_load_0_avm_read => i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_memcoalesce_B_load_0_avm_read,
        out_memcoalesce_B_load_0_avm_write => i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_memcoalesce_B_load_0_avm_write,
        out_memcoalesce_B_load_0_avm_writedata => i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_memcoalesce_B_load_0_avm_writedata,
        out_o_stall => i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_stall,
        out_o_valid => i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x(BITJOIN,126)
    bubble_join_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_q <= i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_11 & i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_10 & i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_9 & i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_8 & i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_7 & i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_6 & i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_5 & i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_4 & i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_3 & i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_2 & i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_1 & i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_readdata_0;

    -- SE_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x(STALLENABLE,208)
    -- Valid signal propagation
    SE_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_V0 <= SE_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_backStall <= bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_stall_out or not (SE_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_wireValid <= i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_valid;

    -- bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg(STALLFIFO,406)
    bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_valid_in <= SE_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_V0;
    bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_stall_in <= SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_backStall;
    bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_data_in <= bubble_join_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_q;
    bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_valid_in_bitsignaltemp <= bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_valid_in(0);
    bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_stall_in_bitsignaltemp <= bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_stall_in(0);
    bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_valid_out(0) <= bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_valid_out_bitsignaltemp;
    bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_stall_out(0) <= bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_stall_out_bitsignaltemp;
    thebubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg : acl_data_fifo
    GENERIC MAP (
        DEPTH => 29,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 256,
        IMPL => "zl_ram"
    )
    PORT MAP (
        valid_in => bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_stall_in_bitsignaltemp,
        data_in => bubble_join_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_q,
        valid_out => bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_stall_out_bitsignaltemp,
        data_out => bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data(STALLENABLE,299)
    -- Valid signal propagation
    SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_V0 <= SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_backStall <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_o_stall or not (SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and0 <= bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_valid_out;
    SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and1 <= redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_valid_out and SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and0;
    SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and2 <= redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_valid_out and SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and1;
    SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and3 <= redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_valid_out and SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and2;
    SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and4 <= redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_valid_out and SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and3;
    SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and5 <= redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_valid_out and SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and4;
    SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and6 <= redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_valid_out and SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and5;
    SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and7 <= SE_out_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_V0 and SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and6;
    SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and8 <= SE_out_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_V0 and SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and7;
    SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and9 <= SE_out_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_V0 and SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and8;
    SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and10 <= SE_out_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_V0 and SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and9;
    SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_wireValid <= SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_V0 and SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_and10;

    -- redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo(STALLFIFO,121)
    redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_valid_in <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_V6;
    redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_stall_in <= SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_backStall;
    redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_data_in <= bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_m;
    redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_valid_in_bitsignaltemp <= redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_valid_in(0);
    redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_stall_in_bitsignaltemp <= redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_stall_in(0);
    redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_valid_out(0) <= redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_valid_out_bitsignaltemp;
    redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_stall_out(0) <= redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_stall_out_bitsignaltemp;
    theredist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 170,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_valid_in_bitsignaltemp,
        stall_in => redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_m,
        valid_out => redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_valid_out_bitsignaltemp,
        stall_out => redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_stall_out_bitsignaltemp,
        data_out => redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo(STALLFIFO,120)
    redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_valid_in <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_V5;
    redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_stall_in <= SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_backStall;
    redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_data_in <= bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_l;
    redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_valid_in_bitsignaltemp <= redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_valid_in(0);
    redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_stall_in_bitsignaltemp <= redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_stall_in(0);
    redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_valid_out(0) <= redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_valid_out_bitsignaltemp;
    redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_stall_out(0) <= redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_stall_out_bitsignaltemp;
    theredist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 170,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_valid_in_bitsignaltemp,
        stall_in => redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_l,
        valid_out => redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_valid_out_bitsignaltemp,
        stall_out => redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_stall_out_bitsignaltemp,
        data_out => redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo(STALLFIFO,119)
    redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_valid_in <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_V4;
    redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_stall_in <= SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_backStall;
    redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_data_in <= bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_k;
    redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_valid_in_bitsignaltemp <= redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_valid_in(0);
    redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_stall_in_bitsignaltemp <= redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_stall_in(0);
    redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_valid_out(0) <= redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_valid_out_bitsignaltemp;
    redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_stall_out(0) <= redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_stall_out_bitsignaltemp;
    theredist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 170,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_valid_in_bitsignaltemp,
        stall_in => redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_k,
        valid_out => redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_valid_out_bitsignaltemp,
        stall_out => redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_stall_out_bitsignaltemp,
        data_out => redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo(STALLFIFO,118)
    redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_valid_in <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_V3;
    redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_stall_in <= SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_backStall;
    redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_data_in <= bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_j;
    redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_valid_in_bitsignaltemp <= redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_valid_in(0);
    redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_stall_in_bitsignaltemp <= redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_stall_in(0);
    redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_valid_out(0) <= redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_valid_out_bitsignaltemp;
    redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_stall_out(0) <= redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_stall_out_bitsignaltemp;
    theredist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 170,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_valid_in_bitsignaltemp,
        stall_in => redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_j,
        valid_out => redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_valid_out_bitsignaltemp,
        stall_out => redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_stall_out_bitsignaltemp,
        data_out => redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo(STALLFIFO,117)
    redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_valid_in <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_V2;
    redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_stall_in <= SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_backStall;
    redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_data_in <= bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_h;
    redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_valid_in_bitsignaltemp <= redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_valid_in(0);
    redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_stall_in_bitsignaltemp <= redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_stall_in(0);
    redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_valid_out(0) <= redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_valid_out_bitsignaltemp;
    redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_stall_out(0) <= redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_stall_out_bitsignaltemp;
    theredist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 170,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_valid_in_bitsignaltemp,
        stall_in => redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_h,
        valid_out => redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_valid_out_bitsignaltemp,
        stall_out => redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_stall_out_bitsignaltemp,
        data_out => redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo(STALLFIFO,116)
    redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_valid_in <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_V1;
    redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_stall_in <= SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_backStall;
    redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_data_in <= bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_b;
    redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_valid_in_bitsignaltemp <= redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_valid_in(0);
    redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_stall_in_bitsignaltemp <= redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_stall_in(0);
    redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_valid_out(0) <= redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_valid_out_bitsignaltemp;
    redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_stall_out(0) <= redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_stall_out_bitsignaltemp;
    theredist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 170,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_valid_in_bitsignaltemp,
        stall_in => redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_b,
        valid_out => redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_valid_out_bitsignaltemp,
        stall_out => redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_stall_out_bitsignaltemp,
        data_out => redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,213)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= gemm_nn9W_B2_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,136)
    bubble_join_stall_entry_q <= in_unnamed_gemm_nn9W0 & in_notexit300322 & in_memdep_phi_pop10323 & in_memdep_phi274_pop15328 & in_memdep_phi272_pop14327 & in_memdep_phi269_pop13326 & in_memdep_phi266_pop12325 & in_memdep_phi261_pop11324 & in_lda_sync_buffer320 & in_j_076_pop9321 & in_forked303319 & in_forked;

    -- bubble_select_stall_entry(BITSELECT,137)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(0 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1 downto 1));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(33 downto 2));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(65 downto 34));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(66 downto 66));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(67 downto 67));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(68 downto 68));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(69 downto 69));
    bubble_select_stall_entry_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(70 downto 70));
    bubble_select_stall_entry_k <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(71 downto 71));
    bubble_select_stall_entry_l <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(72 downto 72));
    bubble_select_stall_entry_m <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(73 downto 73));

    -- gemm_nn9W_B2_merge_reg_aunroll_x(BLACKBOX,20)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_data_out_4@1
    -- out out_data_out_5@1
    -- out out_data_out_6@1
    -- out out_data_out_7@1
    -- out out_data_out_8@1
    -- out out_data_out_9@1
    -- out out_data_out_10@1
    -- out out_data_out_11@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thegemm_nn9W_B2_merge_reg_aunroll_x : gemm_nn9W_B2_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_b,
        in_data_in_1 => bubble_select_stall_entry_c,
        in_data_in_2 => bubble_select_stall_entry_e,
        in_data_in_3 => bubble_select_stall_entry_d,
        in_data_in_4 => bubble_select_stall_entry_m,
        in_data_in_5 => bubble_select_stall_entry_l,
        in_data_in_6 => bubble_select_stall_entry_k,
        in_data_in_7 => bubble_select_stall_entry_f,
        in_data_in_8 => bubble_select_stall_entry_g,
        in_data_in_9 => bubble_select_stall_entry_h,
        in_data_in_10 => bubble_select_stall_entry_i,
        in_data_in_11 => bubble_select_stall_entry_j,
        in_stall_in => SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_5,
        out_data_out_6 => gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6,
        out_data_out_7 => gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_7,
        out_data_out_8 => gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8,
        out_data_out_9 => gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9,
        out_data_out_10 => gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10,
        out_data_out_11 => gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11,
        out_stall_out => gemm_nn9W_B2_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => gemm_nn9W_B2_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_gemm_nn9W_B2_merge_reg_aunroll_x(STALLENABLE,206)
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg2 <= (others => '0');
            SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg3 <= (others => '0');
            SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg4 <= (others => '0');
            SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg5 <= (others => '0');
            SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg6 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg0 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg1 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg2 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg3 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg4 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_toReg4;
            -- Succesor 5
            SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg5 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_toReg5;
            -- Succesor 6
            SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg6 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_toReg6;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed0 <= (not (i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_o_stall) and SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg0;
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed1 <= (not (redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_stall_out) and SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg1;
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed2 <= (not (redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_stall_out) and SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg2;
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed3 <= (not (redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_stall_out) and SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg3;
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed4 <= (not (redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_stall_out) and SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg4;
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed5 <= (not (redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_stall_out) and SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg5;
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed6 <= (not (redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_stall_out) and SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg6;
    -- Consuming
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_StallValid <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_backStall and SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_wireValid;
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_toReg0 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_StallValid and SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed0;
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_toReg1 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_StallValid and SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed1;
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_toReg2 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_StallValid and SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed2;
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_toReg3 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_StallValid and SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed3;
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_toReg4 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_StallValid and SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed4;
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_toReg5 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_StallValid and SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed5;
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_toReg6 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_StallValid and SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed6;
    -- Backward Stall generation
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_or0 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed0;
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_or1 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed1 and SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_or0;
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_or2 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed2 and SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_or1;
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_or3 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed3 and SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_or2;
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_or4 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed4 and SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_or3;
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_or5 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed5 and SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_or4;
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_wireStall <= not (SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_consumed6 and SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_or5);
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_backStall <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_V0 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg0);
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_V1 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg1);
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_V2 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg2);
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_V3 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg3);
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_V4 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg4);
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_V5 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg5);
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_V6 <= SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_fromReg6);
    -- Computing multiple Valid(s)
    SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_wireValid <= gemm_nn9W_B2_merge_reg_aunroll_x_out_valid_out;

    -- bubble_join_gemm_nn9W_B2_merge_reg_aunroll_x(BITJOIN,123)
    bubble_join_gemm_nn9W_B2_merge_reg_aunroll_x_q <= gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11 & gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10 & gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9 & gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8 & gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_7 & gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6 & gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_5 & gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_4 & gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_3 & gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_2 & gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_1 & gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x(BITSELECT,124)
    bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_gemm_nn9W_B2_merge_reg_aunroll_x_q(0 downto 0));
    bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_gemm_nn9W_B2_merge_reg_aunroll_x_q(1 downto 1));
    bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_gemm_nn9W_B2_merge_reg_aunroll_x_q(33 downto 2));
    bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_gemm_nn9W_B2_merge_reg_aunroll_x_q(65 downto 34));
    bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_gemm_nn9W_B2_merge_reg_aunroll_x_q(66 downto 66));
    bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_gemm_nn9W_B2_merge_reg_aunroll_x_q(67 downto 67));
    bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_gemm_nn9W_B2_merge_reg_aunroll_x_q(68 downto 68));
    bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_gemm_nn9W_B2_merge_reg_aunroll_x_q(69 downto 69));
    bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_gemm_nn9W_B2_merge_reg_aunroll_x_q(70 downto 70));
    bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_gemm_nn9W_B2_merge_reg_aunroll_x_q(71 downto 71));
    bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_gemm_nn9W_B2_merge_reg_aunroll_x_q(72 downto 72));
    bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_gemm_nn9W_B2_merge_reg_aunroll_x_q(73 downto 73));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x(BLACKBOX,22)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit340_0@18
    -- out out_c0_exit340_1@18
    -- out out_c0_exit340_2@18
    -- out out_c0_exit340_3@18
    -- out out_c0_exit340_4@18
    -- out out_c0_exit340_5@18
    -- out out_c0_exit340_6@18
    -- out out_c0_exit340_7@18
    -- out out_c0_exit340_8@18
    -- out out_c0_exit340_9@18
    -- out out_c0_exit340_10@18
    -- out out_c0_exit340_11@18
    -- out out_c0_exit340_12@18
    -- out out_c0_exit340_13@18
    -- out out_c0_exit340_14@18
    -- out out_c0_exit340_15@18
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_stall_out@20000000
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_valid_out@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@18
    -- out out_pipeline_valid_out@20000000
    thei_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x : i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w
    PORT MAP (
        in_c0_eni7_0 => GND_q,
        in_c0_eni7_1 => bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_b,
        in_c0_eni7_2 => bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_d,
        in_c0_eni7_3 => bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_e,
        in_c0_eni7_4 => bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_i,
        in_c0_eni7_5 => bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_c,
        in_c0_eni7_6 => bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_f,
        in_c0_eni7_7 => bubble_select_gemm_nn9W_B2_merge_reg_aunroll_x_g,
        in_B => in_B,
        in_K => in_K,
        in_N => in_N,
        in_i_stall => SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_backStall,
        in_i_valid => SE_out_gemm_nn9W_B2_merge_reg_aunroll_x_V0,
        in_pipeline_stall_in => in_pipeline_stall_in,
        out_c0_exit340_0 => i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0,
        out_c0_exit340_1 => i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1,
        out_c0_exit340_2 => i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2,
        out_c0_exit340_3 => i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3,
        out_c0_exit340_4 => i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4,
        out_c0_exit340_5 => i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5,
        out_c0_exit340_6 => i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6,
        out_c0_exit340_7 => i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7,
        out_c0_exit340_8 => i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8,
        out_c0_exit340_9 => i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9,
        out_c0_exit340_10 => i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10,
        out_c0_exit340_11 => i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11,
        out_c0_exit340_12 => i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12,
        out_c0_exit340_13 => i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13,
        out_c0_exit340_14 => i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14,
        out_c0_exit340_15 => i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15,
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_stall_out => i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_valid_out => i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_valid_out,
        out_o_stall => i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_o_valid,
        out_pipeline_valid_out => i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x(BITJOIN,129)
    bubble_join_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q <= i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15 & i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14 & i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13 & i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12 & i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11 & i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10 & i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9 & i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8 & i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7 & i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6 & i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5 & i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4 & i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3 & i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2 & i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1 & i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0;

    -- bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x(BITSELECT,130)
    bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q(0 downto 0));
    bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q(1 downto 1));
    bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q(33 downto 2));
    bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q(65 downto 34));
    bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q(97 downto 66));
    bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q(161 downto 98));
    bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q(162 downto 162));
    bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q(163 downto 163));
    bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q(164 downto 164));
    bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q(165 downto 165));
    bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q(166 downto 166));
    bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q(198 downto 167));
    bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q(199 downto 199));
    bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q(200 downto 200));
    bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_p <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q(201 downto 201));
    bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q(202 downto 202));

    -- SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x(STALLENABLE,210)
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg0 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg1 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg2 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg3 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg4 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg5 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg6 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg7 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg8 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg9 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg10 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg11 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg12 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg13 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg14 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg15 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg16 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg0 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg1 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg2 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg3 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg4 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg4;
            -- Succesor 5
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg5 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg5;
            -- Succesor 6
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg6 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg6;
            -- Succesor 7
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg7 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg7;
            -- Succesor 8
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg8 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg8;
            -- Succesor 9
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg9 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg9;
            -- Succesor 10
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg10 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg10;
            -- Succesor 11
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg11 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg11;
            -- Succesor 12
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg12 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg12;
            -- Succesor 13
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg13 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg13;
            -- Succesor 14
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg14 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg14;
            -- Succesor 15
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg15 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg15;
            -- Succesor 16
            SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg16 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg16;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed0 <= (not (i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_o_stall) and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg0;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed1 <= (not (redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg1;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed2 <= (not (redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg2;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed3 <= (not (redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg3;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed4 <= (not (redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg4;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed5 <= (not (redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg5;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed6 <= (not (redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg6;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed7 <= (not (redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg7;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed8 <= (not (redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg8;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed9 <= (not (redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg9;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed10 <= (not (redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg10;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed11 <= (not (redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg11;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed12 <= (not (redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg12;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed13 <= (not (redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg13;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed14 <= (not (redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg14;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed15 <= (not (redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg15;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed16 <= (not (redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg16;
    -- Consuming
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_StallValid <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_backStall and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg0 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed0;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg1 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed1;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg2 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed2;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg3 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed3;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg4 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed4;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg5 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed5;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg6 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed6;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg7 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed7;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg8 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed8;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg9 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed9;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg10 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed10;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg11 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed11;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg12 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed12;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg13 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed13;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg14 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed14;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg15 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed15;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_toReg16 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed16;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or0 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed0;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or1 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed1 and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or0;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or2 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed2 and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or1;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or3 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed3 and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or2;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or4 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed4 and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or3;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or5 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed5 and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or4;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or6 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed6 and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or5;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or7 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed7 and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or6;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or8 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed8 and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or7;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or9 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed9 and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or8;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or10 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed10 and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or9;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or11 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed11 and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or10;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or12 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed12 and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or11;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or13 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed13 and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or12;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or14 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed14 and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or13;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or15 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed15 and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or14;
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireStall <= not (SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_consumed16 and SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_or15);
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_backStall <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V0 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg0);
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V1 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg1);
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V2 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg2);
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V3 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg3);
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V4 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg4);
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V5 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg5);
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V6 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg6);
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V7 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg7);
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V8 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg8);
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V9 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg9);
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V10 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg10);
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V11 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg11);
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V12 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg12);
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V13 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg13);
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V14 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg14);
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V15 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg15);
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V16 <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_fromReg16);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_wireValid <= i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_o_valid;

    -- redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo(STALLFIFO,103)
    redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V11;
    redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_stall_in <= SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_backStall;
    redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_l;
    redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_valid_in_bitsignaltemp <= redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_valid_in(0);
    redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_stall_in_bitsignaltemp <= redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_stall_in(0);
    redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_valid_out(0) <= redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_valid_out_bitsignaltemp;
    redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_stall_out(0) <= redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_stall_out_bitsignaltemp;
    theredist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 153,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_valid_in_bitsignaltemp,
        stall_in => redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_l,
        valid_out => redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_valid_out_bitsignaltemp,
        stall_out => redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_stall_out_bitsignaltemp,
        data_out => redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo(BITJOIN,170)
    bubble_join_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_q <= redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_data_out;

    -- bubble_select_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo(BITSELECT,171)
    bubble_select_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_q(0 downto 0));

    -- SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo(STALLENABLE,264)
    SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_fromReg0 <= (others => '0');
            SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_fromReg0 <= SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_toReg0;
            -- Succesor 1
            SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_fromReg1 <= SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_consumed0 <= (not (SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_backStall) and SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_wireValid) or SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_fromReg0;
    SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_consumed1 <= (not (SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_backStall) and SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_wireValid) or SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_fromReg1;
    -- Consuming
    SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_StallValid <= SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_backStall and SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_wireValid;
    SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_toReg0 <= SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_StallValid and SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_consumed0;
    SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_toReg1 <= SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_StallValid and SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_or0 <= SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_consumed0;
    SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_wireStall <= not (SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_consumed1 and SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_or0);
    SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_backStall <= SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_V0 <= SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_wireValid and not (SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_fromReg0);
    SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_V1 <= SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_wireValid and not (SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_wireValid <= redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_valid_out;

    -- SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0(STALLREG,423)
    SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_r_valid <= (others => '0');
            SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_r_valid <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_backStall and (SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_r_valid or SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_i_valid);

            IF (SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_r_data0 <= STD_LOGIC_VECTOR(bubble_select_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_i_valid <= SE_out_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_V1;
    -- Stall signal propagation
    SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_backStall <= SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_r_valid or not (SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_i_valid);

    -- Valid
    SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_V <= SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_r_valid WHEN SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_r_valid = "1" ELSE SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_i_valid;

    SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_D0 <= SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_r_data0 WHEN SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_r_valid = "1" ELSE bubble_select_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_b;

    -- redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0(REG,104)
    redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_backEN = "1") THEN
                redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_q <= STD_LOGIC_VECTOR(SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1(REG,105)
    redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_backEN = "1") THEN
                redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_q <= STD_LOGIC_VECTOR(redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1(STALLENABLE,266)
    -- Valid signal propagation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_V0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_R_v_0;
    -- Stall signal propagation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_s_tv_0 <= SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_backStall and SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_R_v_0;
    -- Backward Enable generation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_backEN <= not (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_v_s_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_backEN and SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_0_V0;
    -- Backward Stall generation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_backStall <= not (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_v_s_0);
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_backEN = "0") THEN
                SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_R_v_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_R_v_0 and SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_s_tv_0;
            ELSE
                SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_R_v_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2(STALLREG,424)
    SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_r_valid <= (others => '0');
            SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_r_valid <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_backStall and (SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_r_valid or SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_i_valid);

            IF (SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_r_data0 <= STD_LOGIC_VECTOR(redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_i_valid <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_V0;
    -- Stall signal propagation
    SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_backStall <= SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_r_valid or not (SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_i_valid);

    -- Valid
    SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_V <= SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_r_valid WHEN SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_r_valid = "1" ELSE SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_i_valid;

    SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_D0 <= SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_r_data0 WHEN SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_r_valid = "1" ELSE redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_1_q;

    -- redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2(REG,106)
    redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_backEN = "1") THEN
                redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_q <= STD_LOGIC_VECTOR(SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3(REG,107)
    redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_backEN = "1") THEN
                redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_q <= STD_LOGIC_VECTOR(redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3(STALLENABLE,268)
    -- Valid signal propagation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_V0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_R_v_0;
    -- Stall signal propagation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_s_tv_0 <= SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_backStall and SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_R_v_0;
    -- Backward Enable generation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_backEN <= not (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_v_s_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_backEN and SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_2_V0;
    -- Backward Stall generation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_backStall <= not (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_v_s_0);
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_backEN = "0") THEN
                SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_R_v_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_R_v_0 and SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_s_tv_0;
            ELSE
                SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_R_v_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4(STALLREG,425)
    SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_r_valid <= (others => '0');
            SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_r_valid <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_backStall and (SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_r_valid or SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_i_valid);

            IF (SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_r_data0 <= STD_LOGIC_VECTOR(redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_i_valid <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_V0;
    -- Stall signal propagation
    SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_backStall <= SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_r_valid or not (SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_i_valid);

    -- Valid
    SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_V <= SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_r_valid WHEN SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_r_valid = "1" ELSE SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_i_valid;

    SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_D0 <= SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_r_data0 WHEN SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_r_valid = "1" ELSE redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_3_q;

    -- redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4(REG,108)
    redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_backEN = "1") THEN
                redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_q <= STD_LOGIC_VECTOR(SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5(REG,109)
    redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_backEN = "1") THEN
                redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_q <= STD_LOGIC_VECTOR(redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5(STALLENABLE,270)
    -- Valid signal propagation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_V0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_R_v_0;
    -- Stall signal propagation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_s_tv_0 <= SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_backStall and SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_R_v_0;
    -- Backward Enable generation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_backEN <= not (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_v_s_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_backEN and SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_4_V0;
    -- Backward Stall generation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_backStall <= not (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_v_s_0);
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_backEN = "0") THEN
                SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_R_v_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_R_v_0 and SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_s_tv_0;
            ELSE
                SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_R_v_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6(STALLREG,426)
    SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_r_valid <= (others => '0');
            SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_r_valid <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_backStall and (SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_r_valid or SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_i_valid);

            IF (SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_r_data0 <= STD_LOGIC_VECTOR(redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_i_valid <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_V0;
    -- Stall signal propagation
    SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_backStall <= SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_r_valid or not (SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_i_valid);

    -- Valid
    SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_V <= SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_r_valid WHEN SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_r_valid = "1" ELSE SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_i_valid;

    SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_D0 <= SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_r_data0 WHEN SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_r_valid = "1" ELSE redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_5_q;

    -- SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6(STALLENABLE,271)
    -- Valid signal propagation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_V0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_R_v_0;
    -- Stall signal propagation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_s_tv_0 <= SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_backStall and SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_R_v_0;
    -- Backward Enable generation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_backEN <= not (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_v_s_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_backEN and SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_V;
    -- Backward Stall generation
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_backStall <= not (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_backEN);
    SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_backEN = "0") THEN
                SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_R_v_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_R_v_0 and SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_s_tv_0;
            ELSE
                SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_R_v_0 <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6(STALLENABLE,262)
    -- Valid signal propagation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_V0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_R_v_0;
    -- Stall signal propagation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_s_tv_0 <= SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_backStall and SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_R_v_0;
    -- Backward Enable generation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_backEN <= not (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_v_s_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_backEN and SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_V;
    -- Backward Stall generation
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_backStall <= not (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_backEN);
    SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_backEN = "0") THEN
                SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_R_v_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_R_v_0 and SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_s_tv_0;
            ELSE
                SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_R_v_0 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6(STALLENABLE,253)
    -- Valid signal propagation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_V0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_R_v_0;
    -- Stall signal propagation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_s_tv_0 <= SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_backStall and SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_R_v_0;
    -- Backward Enable generation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_backEN <= not (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_v_s_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_backEN and SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_V;
    -- Backward Stall generation
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_backStall <= not (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_backEN);
    SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_backEN = "0") THEN
                SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_R_v_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_R_v_0 and SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_s_tv_0;
            ELSE
                SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_R_v_0 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6(STALLENABLE,238)
    -- Valid signal propagation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_V0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_R_v_0;
    -- Stall signal propagation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_s_tv_0 <= SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_backStall and SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_R_v_0;
    -- Backward Enable generation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_backEN <= not (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_v_s_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_backEN and SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_V;
    -- Backward Stall generation
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_backStall <= not (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_backEN);
    SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_backEN = "0") THEN
                SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_R_v_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_R_v_0 and SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_s_tv_0;
            ELSE
                SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_R_v_0 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6(STALLENABLE,225)
    -- Valid signal propagation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_V0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_R_v_0;
    -- Stall signal propagation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_s_tv_0 <= SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_backStall and SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_R_v_0;
    -- Backward Enable generation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_backEN <= not (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_v_s_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_backEN and SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_V;
    -- Backward Stall generation
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_backStall <= not (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_backEN);
    SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_backEN = "0") THEN
                SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_R_v_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_R_v_0 and SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_s_tv_0;
            ELSE
                SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_R_v_0 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo(BITJOIN,191)
    bubble_join_redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_q <= redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_data_out;

    -- bubble_select_redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo(BITSELECT,192)
    bubble_select_redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_q(0 downto 0));

    -- bubble_join_redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo(BITJOIN,203)
    bubble_join_redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_q <= redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_data_out;

    -- bubble_select_redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo(BITSELECT,204)
    bubble_select_redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_q(0 downto 0));

    -- bubble_join_redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo(BITJOIN,200)
    bubble_join_redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_q <= redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_data_out;

    -- bubble_select_redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo(BITSELECT,201)
    bubble_select_redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_q(0 downto 0));

    -- bubble_join_redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo(BITJOIN,197)
    bubble_join_redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_q <= redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_data_out;

    -- bubble_select_redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo(BITSELECT,198)
    bubble_select_redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_q(0 downto 0));

    -- bubble_join_redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo(BITJOIN,194)
    bubble_join_redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_q <= redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_data_out;

    -- bubble_select_redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo(BITSELECT,195)
    bubble_select_redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_q(0 downto 0));

    -- bubble_join_redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo(BITJOIN,188)
    bubble_join_redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_q <= redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_data_out;

    -- bubble_select_redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo(BITSELECT,189)
    bubble_select_redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_q(0 downto 0));

    -- bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x(BITSELECT,127)
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_data_out(15 downto 0));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_data_out(31 downto 16));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_data_out(47 downto 32));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_data_out(63 downto 48));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_data_out(79 downto 64));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_data_out(95 downto 80));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_data_out(111 downto 96));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_data_out(127 downto 112));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_data_out(143 downto 128));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_data_out(159 downto 144));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_data_out(191 downto 160));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_reg_data_out(255 downto 192));

    -- i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x(BLACKBOX,23)@170
    -- in in_i_stall@20000000
    -- out out_c1_exit_0@177
    -- out out_c1_exit_1@177
    -- out out_c1_exit_2@177
    -- out out_c1_exit_3@177
    -- out out_memdep_259_avm_address@20000000
    -- out out_memdep_259_avm_burstcount@20000000
    -- out out_memdep_259_avm_byteenable@20000000
    -- out out_memdep_259_avm_enable@20000000
    -- out out_memdep_259_avm_read@20000000
    -- out out_memdep_259_avm_write@20000000
    -- out out_memdep_259_avm_writedata@20000000
    -- out out_memdep_264_avm_address@20000000
    -- out out_memdep_264_avm_burstcount@20000000
    -- out out_memdep_264_avm_byteenable@20000000
    -- out out_memdep_264_avm_enable@20000000
    -- out out_memdep_264_avm_read@20000000
    -- out out_memdep_264_avm_write@20000000
    -- out out_memdep_264_avm_writedata@20000000
    -- out out_memdep_avm_address@20000000
    -- out out_memdep_avm_burstcount@20000000
    -- out out_memdep_avm_byteenable@20000000
    -- out out_memdep_avm_enable@20000000
    -- out out_memdep_avm_read@20000000
    -- out out_memdep_avm_write@20000000
    -- out out_memdep_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@177
    thei_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x : i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w
    PORT MAP (
        in_c1_eni12_0 => GND_q,
        in_c1_eni12_1 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_b,
        in_c1_eni12_2 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_c,
        in_c1_eni12_3 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_d,
        in_c1_eni12_4 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_e,
        in_c1_eni12_5 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_f,
        in_c1_eni12_6 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_g,
        in_c1_eni12_7 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_h,
        in_c1_eni12_8 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_i,
        in_c1_eni12_9 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_j,
        in_c1_eni12_10 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_k,
        in_c1_eni12_11 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_l,
        in_c1_eni12_12 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_m,
        in_c1_eni12_13 => bubble_select_redist5_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_152_fifo_b,
        in_c1_eni12_14 => bubble_select_redist10_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_152_fifo_b,
        in_c1_eni12_15 => bubble_select_redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_b,
        in_c1_eni12_16 => bubble_select_redist14_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_152_fifo_b,
        in_c1_eni12_17 => bubble_select_redist23_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_8_169_fifo_b,
        in_c1_eni12_18 => bubble_select_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_b,
        in_c1_eni12_19 => bubble_select_redist24_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_9_169_fifo_b,
        in_c1_eni12_20 => bubble_select_redist25_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_10_169_fifo_b,
        in_c1_eni12_21 => bubble_select_redist26_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_11_169_fifo_b,
        in_c1_eni12_22 => bubble_select_redist12_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_152_fifo_b,
        in_c1_eni12_23 => bubble_select_redist22_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_6_169_fifo_b,
        in_c0_exe1341 => bubble_select_redist1_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_152_fifo_b,
        in_flush => in_flush,
        in_forked => bubble_select_redist21_gemm_nn9W_B2_merge_reg_aunroll_x_out_data_out_0_169_fifo_b,
        in_i_stall => SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_backStall,
        in_i_valid => SE_out_bubble_out_i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_data_V0,
        in_memdep_259_avm_readdata => in_memdep_259_avm_readdata,
        in_memdep_259_avm_readdatavalid => in_memdep_259_avm_readdatavalid,
        in_memdep_259_avm_waitrequest => in_memdep_259_avm_waitrequest,
        in_memdep_259_avm_writeack => in_memdep_259_avm_writeack,
        in_memdep_264_avm_readdata => in_memdep_264_avm_readdata,
        in_memdep_264_avm_readdatavalid => in_memdep_264_avm_readdatavalid,
        in_memdep_264_avm_waitrequest => in_memdep_264_avm_waitrequest,
        in_memdep_264_avm_writeack => in_memdep_264_avm_writeack,
        in_memdep_avm_readdata => in_memdep_avm_readdata,
        in_memdep_avm_readdatavalid => in_memdep_avm_readdatavalid,
        in_memdep_avm_waitrequest => in_memdep_avm_waitrequest,
        in_memdep_avm_writeack => in_memdep_avm_writeack,
        out_c1_exit_0 => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_c1_exit_0,
        out_c1_exit_1 => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_c1_exit_1,
        out_c1_exit_2 => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_c1_exit_2,
        out_c1_exit_3 => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_c1_exit_3,
        out_memdep_259_avm_address => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_259_avm_address,
        out_memdep_259_avm_burstcount => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_259_avm_burstcount,
        out_memdep_259_avm_byteenable => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_259_avm_byteenable,
        out_memdep_259_avm_enable => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_259_avm_enable,
        out_memdep_259_avm_read => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_259_avm_read,
        out_memdep_259_avm_write => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_259_avm_write,
        out_memdep_259_avm_writedata => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_259_avm_writedata,
        out_memdep_264_avm_address => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_264_avm_address,
        out_memdep_264_avm_burstcount => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_264_avm_burstcount,
        out_memdep_264_avm_byteenable => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_264_avm_byteenable,
        out_memdep_264_avm_enable => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_264_avm_enable,
        out_memdep_264_avm_read => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_264_avm_read,
        out_memdep_264_avm_write => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_264_avm_write,
        out_memdep_264_avm_writedata => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_264_avm_writedata,
        out_memdep_avm_address => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_avm_address,
        out_memdep_avm_burstcount => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_avm_burstcount,
        out_memdep_avm_byteenable => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_avm_byteenable,
        out_memdep_avm_enable => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_avm_enable,
        out_memdep_avm_read => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_avm_read,
        out_memdep_avm_write => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_avm_write,
        out_memdep_avm_writedata => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_avm_writedata,
        out_o_stall => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo(STALLFIFO,65)
    redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V1;
    redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_stall_in <= SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_backStall;
    redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_b;
    redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_valid_in_bitsignaltemp <= redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_valid_in(0);
    redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_stall_in_bitsignaltemp <= redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_stall_in(0);
    redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_valid_out(0) <= redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_valid_out_bitsignaltemp;
    redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_stall_out(0) <= redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_stall_out_bitsignaltemp;
    theredist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 160,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_b,
        valid_out => redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_stall_out_bitsignaltemp,
        data_out => redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo(STALLFIFO,74)
    redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V3;
    redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_stall_in <= SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_backStall;
    redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_d;
    redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_valid_in_bitsignaltemp <= redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_valid_in(0);
    redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_stall_in_bitsignaltemp <= redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_stall_in(0);
    redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_valid_out(0) <= redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_valid_out_bitsignaltemp;
    redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_stall_out(0) <= redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_stall_out_bitsignaltemp;
    theredist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 160,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_valid_in_bitsignaltemp,
        stall_in => redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_d,
        valid_out => redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_valid_out_bitsignaltemp,
        stall_out => redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_stall_out_bitsignaltemp,
        data_out => redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo(STALLFIFO,75)
    redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V4;
    redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_stall_in <= SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_backStall;
    redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_e;
    redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_valid_in_bitsignaltemp <= redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_valid_in(0);
    redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_stall_in_bitsignaltemp <= redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_stall_in(0);
    redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_valid_out(0) <= redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_valid_out_bitsignaltemp;
    redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_stall_out(0) <= redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_stall_out_bitsignaltemp;
    theredist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 160,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_valid_in_bitsignaltemp,
        stall_in => redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_e,
        valid_out => redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_valid_out_bitsignaltemp,
        stall_out => redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_stall_out_bitsignaltemp,
        data_out => redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo(STALLFIFO,84)
    redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V6;
    redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_stall_in <= SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_backStall;
    redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_g;
    redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_valid_in_bitsignaltemp <= redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_valid_in(0);
    redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_stall_in_bitsignaltemp <= redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_stall_in(0);
    redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_valid_out(0) <= redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_valid_out_bitsignaltemp;
    redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_stall_out(0) <= redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_stall_out_bitsignaltemp;
    theredist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 160,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_valid_in_bitsignaltemp,
        stall_in => redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_g,
        valid_out => redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_valid_out_bitsignaltemp,
        stall_out => redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_stall_out_bitsignaltemp,
        data_out => redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo(STALLFIFO,85)
    redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V7;
    redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_stall_in <= SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_backStall;
    redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_h;
    redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_valid_in_bitsignaltemp <= redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_valid_in(0);
    redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_stall_in_bitsignaltemp <= redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_stall_in(0);
    redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_valid_out(0) <= redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_valid_out_bitsignaltemp;
    redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_stall_out(0) <= redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_stall_out_bitsignaltemp;
    theredist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 160,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_valid_in_bitsignaltemp,
        stall_in => redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_h,
        valid_out => redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_valid_out_bitsignaltemp,
        stall_out => redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_stall_out_bitsignaltemp,
        data_out => redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo(STALLFIFO,86)
    redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V8;
    redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_stall_in <= SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_backStall;
    redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_i;
    redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_valid_in_bitsignaltemp <= redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_valid_in(0);
    redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_stall_in_bitsignaltemp <= redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_stall_in(0);
    redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_valid_out(0) <= redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_valid_out_bitsignaltemp;
    redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_stall_out(0) <= redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_stall_out_bitsignaltemp;
    theredist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 160,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_valid_in_bitsignaltemp,
        stall_in => redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_i,
        valid_out => redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_valid_out_bitsignaltemp,
        stall_out => redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_stall_out_bitsignaltemp,
        data_out => redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo(STALLFIFO,111)
    redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V12;
    redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_stall_in <= SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_backStall;
    redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_m;
    redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_valid_in_bitsignaltemp <= redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_valid_in(0);
    redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_stall_in_bitsignaltemp <= redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_stall_in(0);
    redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_valid_out(0) <= redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_valid_out_bitsignaltemp;
    redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_stall_out(0) <= redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_stall_out_bitsignaltemp;
    theredist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 160,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_valid_in_bitsignaltemp,
        stall_in => redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_m,
        valid_out => redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_valid_out_bitsignaltemp,
        stall_out => redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_stall_out_bitsignaltemp,
        data_out => redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo(STALLFIFO,112)
    redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V13;
    redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_stall_in <= SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_backStall;
    redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_n;
    redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_valid_in_bitsignaltemp <= redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_valid_in(0);
    redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_stall_in_bitsignaltemp <= redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_stall_in(0);
    redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_valid_out(0) <= redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_valid_out_bitsignaltemp;
    redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_stall_out(0) <= redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_stall_out_bitsignaltemp;
    theredist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 160,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_valid_in_bitsignaltemp,
        stall_in => redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_n,
        valid_out => redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_valid_out_bitsignaltemp,
        stall_out => redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_stall_out_bitsignaltemp,
        data_out => redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo(STALLFIFO,113)
    redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V14;
    redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_stall_in <= SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_backStall;
    redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_o;
    redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_valid_in_bitsignaltemp <= redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_valid_in(0);
    redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_stall_in_bitsignaltemp <= redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_stall_in(0);
    redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_valid_out(0) <= redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_valid_out_bitsignaltemp;
    redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_stall_out(0) <= redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_stall_out_bitsignaltemp;
    theredist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 160,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_valid_in_bitsignaltemp,
        stall_in => redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_o,
        valid_out => redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_valid_out_bitsignaltemp,
        stall_out => redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_stall_out_bitsignaltemp,
        data_out => redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo(STALLFIFO,114)
    redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V15;
    redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_stall_in <= SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_backStall;
    redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_p;
    redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_valid_in_bitsignaltemp <= redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_valid_in(0);
    redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_stall_in_bitsignaltemp <= redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_stall_in(0);
    redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_valid_out(0) <= redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_valid_out_bitsignaltemp;
    redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_stall_out(0) <= redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_stall_out_bitsignaltemp;
    theredist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 160,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_valid_in_bitsignaltemp,
        stall_in => redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_p,
        valid_out => redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_valid_out_bitsignaltemp,
        stall_out => redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_stall_out_bitsignaltemp,
        data_out => redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo(STALLFIFO,115)
    redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_V16;
    redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_stall_in <= SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_backStall;
    redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q;
    redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_valid_in_bitsignaltemp <= redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_valid_in(0);
    redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_stall_in_bitsignaltemp <= redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_stall_in(0);
    redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_valid_out(0) <= redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_valid_out_bitsignaltemp;
    redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_stall_out(0) <= redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_stall_out_bitsignaltemp;
    theredist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 160,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_valid_in_bitsignaltemp,
        stall_in => redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_q,
        valid_out => redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_valid_out_bitsignaltemp,
        stall_out => redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_stall_out_bitsignaltemp,
        data_out => redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo(STALLENABLE,281)
    -- Valid signal propagation
    SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_V0 <= SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_backStall <= in_stall_in or not (SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and0 <= redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_valid_out;
    SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and1 <= redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_valid_out and SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and0;
    SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and2 <= redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_valid_out and SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and1;
    SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and3 <= redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_valid_out and SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and2;
    SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and4 <= redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_valid_out and SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and3;
    SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and5 <= redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_valid_out and SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and4;
    SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and6 <= redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_valid_out and SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and5;
    SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and7 <= redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_valid_out and SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and6;
    SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and8 <= redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_valid_out and SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and7;
    SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and9 <= redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_valid_out and SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and8;
    SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and10 <= redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_valid_out and SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and9;
    SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and11 <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_o_valid and SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and10;
    SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and12 <= SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_V0 and SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and11;
    SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and13 <= SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_V0 and SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and12;
    SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and14 <= SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_V0 and SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and13;
    SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and15 <= SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_V0 and SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and14;
    SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_wireValid <= SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_V0 and SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_and15;

    -- bubble_join_i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x(BITJOIN,132)
    bubble_join_i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_q <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_c1_exit_3 & i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_c1_exit_2 & i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_c1_exit_1 & i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_c1_exit_0;

    -- bubble_select_i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x(BITSELECT,133)
    bubble_select_i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_q(0 downto 0));
    bubble_select_i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_q(1 downto 1));
    bubble_select_i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_q(2 downto 2));
    bubble_select_i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_q(3 downto 3));

    -- bubble_join_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo(BITJOIN,185)
    bubble_join_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_q <= redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_data_out;

    -- bubble_select_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo(BITSELECT,186)
    bubble_select_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_q(0 downto 0));

    -- bubble_join_redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo(BITJOIN,182)
    bubble_join_redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_q <= redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_data_out;

    -- bubble_select_redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo(BITSELECT,183)
    bubble_select_redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_q(0 downto 0));

    -- bubble_join_redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo(BITJOIN,179)
    bubble_join_redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_q <= redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_data_out;

    -- bubble_select_redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo(BITSELECT,180)
    bubble_select_redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_q(0 downto 0));

    -- bubble_join_redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo(BITJOIN,173)
    bubble_join_redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_q <= redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_data_out;

    -- bubble_select_redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo(BITSELECT,174)
    bubble_select_redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_q(31 downto 0));

    -- redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6(REG,110)
    redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_backEN = "1") THEN
                redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_q <= STD_LOGIC_VECTOR(SR_SE_redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6(REG,102)
    redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_backEN = "1") THEN
                redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_q <= STD_LOGIC_VECTOR(SR_SE_redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6(REG,94)
    redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_backEN = "1") THEN
                redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_q <= STD_LOGIC_VECTOR(SR_SE_redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo(BITJOIN,161)
    bubble_join_redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_q <= redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_data_out;

    -- bubble_select_redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo(BITSELECT,162)
    bubble_select_redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_q(0 downto 0));

    -- bubble_join_redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo(BITJOIN,158)
    bubble_join_redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_q <= redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_data_out;

    -- bubble_select_redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo(BITSELECT,159)
    bubble_select_redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_q(0 downto 0));

    -- bubble_join_redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo(BITJOIN,155)
    bubble_join_redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_q <= redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_data_out;

    -- bubble_select_redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo(BITSELECT,156)
    bubble_select_redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_q(63 downto 0));

    -- redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6(REG,83)
    redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_backEN = "1") THEN
                redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_q <= STD_LOGIC_VECTOR(SR_SE_redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo(BITJOIN,149)
    bubble_join_redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_q <= redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_data_out;

    -- bubble_select_redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo(BITSELECT,150)
    bubble_select_redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_q(31 downto 0));

    -- bubble_join_redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo(BITJOIN,146)
    bubble_join_redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_q <= redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_data_out;

    -- bubble_select_redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo(BITSELECT,147)
    bubble_select_redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_q(31 downto 0));

    -- redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6(REG,73)
    redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_backEN = "1") THEN
                redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_q <= STD_LOGIC_VECTOR(SR_SE_redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo(BITJOIN,140)
    bubble_join_redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_q <= redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_data_out;

    -- bubble_select_redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo(BITSELECT,141)
    bubble_select_redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_q(0 downto 0));

    -- bubble_join_redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo(BITJOIN,176)
    bubble_join_redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_q <= redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_data_out;

    -- bubble_select_redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo(BITSELECT,177)
    bubble_select_redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_q(0 downto 0));

    -- dupName_0_sync_out_aunroll_x(GPOUT,2)@177
    out_c0_exe12 <= bubble_select_redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_b;
    out_c0_exit340_0 <= bubble_select_redist0_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_0_159_fifo_b;
    out_c0_exit340_1 <= redist2_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_1_159_6_q;
    out_c0_exit340_2 <= bubble_select_redist3_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_2_159_fifo_b;
    out_c0_exit340_3 <= bubble_select_redist4_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_3_159_fifo_b;
    out_c0_exit340_4 <= redist6_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_4_159_6_q;
    out_c0_exit340_5 <= bubble_select_redist7_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_5_159_fifo_b;
    out_c0_exit340_6 <= bubble_select_redist8_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_6_159_fifo_b;
    out_c0_exit340_7 <= bubble_select_redist9_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_7_159_fifo_b;
    out_c0_exit340_8 <= redist11_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_8_159_6_q;
    out_c0_exit340_9 <= redist13_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_9_159_6_q;
    out_c0_exit340_10 <= redist15_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_10_159_6_q;
    out_c0_exit340_11 <= bubble_select_redist16_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_11_159_fifo_b;
    out_c0_exit340_12 <= bubble_select_redist17_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_12_159_fifo_b;
    out_c0_exit340_13 <= bubble_select_redist18_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_13_159_fifo_b;
    out_c0_exit340_14 <= bubble_select_redist19_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_14_159_fifo_b;
    out_c0_exit340_15 <= bubble_select_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_b;
    out_c1_exit_0 <= bubble_select_i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_b;
    out_c1_exit_1 <= bubble_select_i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_c;
    out_c1_exit_2 <= bubble_select_i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_d;
    out_c1_exit_3 <= bubble_select_i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_e;
    out_valid_out <= SE_out_redist20_i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_c0_exit340_15_159_fifo_V0;

    -- dupName_0_ext_sig_sync_out_x(GPOUT,4)
    out_memcoalesce_B_load_0_avm_address <= i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_memcoalesce_B_load_0_avm_address;
    out_memcoalesce_B_load_0_avm_enable <= i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_memcoalesce_B_load_0_avm_enable;
    out_memcoalesce_B_load_0_avm_read <= i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_memcoalesce_B_load_0_avm_read;
    out_memcoalesce_B_load_0_avm_write <= i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_memcoalesce_B_load_0_avm_write;
    out_memcoalesce_B_load_0_avm_writedata <= i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_memcoalesce_B_load_0_avm_writedata;
    out_memcoalesce_B_load_0_avm_byteenable <= i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_memcoalesce_B_load_0_avm_byteenable;
    out_memcoalesce_B_load_0_avm_burstcount <= i_load_memcoalesce_b_load_0_gemm_nn9w_aunroll_x_out_memcoalesce_B_load_0_avm_burstcount;

    -- dupName_1_ext_sig_sync_out_x(GPOUT,10)
    out_memdep_avm_address <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_avm_address;
    out_memdep_avm_enable <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_avm_enable;
    out_memdep_avm_read <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_avm_read;
    out_memdep_avm_write <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_avm_write;
    out_memdep_avm_writedata <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_avm_writedata;
    out_memdep_avm_byteenable <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_avm_byteenable;
    out_memdep_avm_burstcount <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_avm_burstcount;

    -- dupName_2_ext_sig_sync_out_x(GPOUT,15)
    out_memdep_259_avm_address <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_259_avm_address;
    out_memdep_259_avm_enable <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_259_avm_enable;
    out_memdep_259_avm_read <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_259_avm_read;
    out_memdep_259_avm_write <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_259_avm_write;
    out_memdep_259_avm_writedata <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_259_avm_writedata;
    out_memdep_259_avm_byteenable <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_259_avm_byteenable;
    out_memdep_259_avm_burstcount <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_259_avm_burstcount;

    -- dupName_3_ext_sig_sync_out_x(GPOUT,19)
    out_memdep_264_avm_address <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_264_avm_address;
    out_memdep_264_avm_enable <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_264_avm_enable;
    out_memdep_264_avm_read <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_264_avm_read;
    out_memdep_264_avm_write <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_264_avm_write;
    out_memdep_264_avm_writedata <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_264_avm_writedata;
    out_memdep_264_avm_byteenable <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_264_avm_byteenable;
    out_memdep_264_avm_burstcount <= i_sfc_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w_aunroll_x_out_memdep_264_avm_burstcount;

    -- ext_sig_sync_out(GPOUT,28)
    out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_valid_out <= i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_valid_out;
    out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_stall_out <= i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_stall_out;

    -- pipeline_valid_out_sync(GPOUT,32)
    out_pipeline_valid_out <= i_sfc_c0_for_body4_gemm_nn9w_c0_enter335_gemm_nn9w_aunroll_x_out_pipeline_valid_out;

    -- sync_out(GPOUT,37)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
