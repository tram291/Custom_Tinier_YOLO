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

-- VHDL created from bb_gemm_nnfW_B5_stall_region
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

entity bb_gemm_nnfW_B5_stall_region is
    port (
        out_c0_exe5149 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe7151 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe8152 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit144_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit144_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit144_2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit144_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit144_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit144_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit144_6 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit144_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit144_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit144_9 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit144_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit144_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe1171 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit170_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit170_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit170_2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW9_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_gemm_nnfW9_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW9_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW9_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_A_load_0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memcoalesce_A_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_A_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_A_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_A_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memcoalesce_A_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_A_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_M : in std_logic_vector(31 downto 0);  -- ufix32
        in_Cn_285_rep : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx1452 : in std_logic_vector(63 downto 0);  -- ufix64
        in_cmp380_RM40 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp88_RM38 : in std_logic_vector(0 downto 0);  -- ufix1
        in_conv15_hf_tofpc53 : in std_logic_vector(63 downto 0);  -- ufix64
        in_forked51 : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv : in std_logic_vector(32 downto 0);  -- ufix33
        in_memdep_phi6_pop1144 : in std_logic_vector(0 downto 0);  -- ufix1
        in_mul1142 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul2054 : in std_logic_vector(31 downto 0);  -- ufix32
        in_notexit2934 : in std_logic_vector(0 downto 0);  -- ufix1
        in_phi_decision156_xor_RM1655 : in std_logic_vector(0 downto 0);  -- ufix1
        in_sdiv_sh125_RM36 : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_gemm_nnfW6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW7 : in std_logic_vector(32 downto 0);  -- ufix33
        in_unnamed_gemm_nnfW8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW9_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_gemm_nnfW9_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW9_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW9_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW9_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_unnamed_gemm_nnfW9_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_gemm_nnfW9_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_A_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_A_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_A_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_A_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_A : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nnfW_B5_stall_region;

architecture normal of bb_gemm_nnfW_B5_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component gemm_nnfW_B5_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_8 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_data_in_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_11 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_12 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_8 : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_data_out_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_12 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_memcoalesce_a_load_0_gemm_nnfw234 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_A_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_A_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_A_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_A_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata_0 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_1 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_2 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_3 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_4 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_5 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_6 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_7 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_8 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_9 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_10 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_11 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_12 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_13 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_14 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_15 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_memcoalesce_A_load_0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw is
        port (
            in_c0_eni15_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni15_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni15_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni15_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni15_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni15_5 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_c0_eni15_6 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni15_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni15_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni15_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni15_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni15_11 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_c0_eni15_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni15_13 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni15_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni15_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_A : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit144_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit144_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit144_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit144_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit144_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit144_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit144_6 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit144_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit144_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit144_9 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit144_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit144_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw is
        port (
            in_c1_eni6161_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni6161_1 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6161_2 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6161_3 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6161_4 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6161_5 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6161_6 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6161_7 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6161_8 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6161_9 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6161_10 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6161_11 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6161_12 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6161_13 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6161_14 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6161_15 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6161_16 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6161_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni6161_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni6161_19 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_eni6161_20 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni6161_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe5149 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked51 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW9_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW9_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW9_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW9_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit170_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit170_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit170_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW9_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW9_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW9_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW9_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW9_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW9_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW9_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
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
    signal gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (32 downto 0);
    signal gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (32 downto 0);
    signal gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_12 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_4 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_5 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_6 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_7 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_8 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_9 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_10 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_11 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_12 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_13 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_14 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_15 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_A_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_A_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_A_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_A_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_A_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_A_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_A_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_c1_exit170_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_c1_exit170_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_c1_exit170_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_unnamed_gemm_nnfW9_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_unnamed_gemm_nnfW9_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_unnamed_gemm_nnfW9_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_unnamed_gemm_nnfW9_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_unnamed_gemm_nnfW9_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_unnamed_gemm_nnfW9_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_unnamed_gemm_nnfW9_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_gemm_nnfW_B5_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (361 downto 0);
    signal bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (32 downto 0);
    signal bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_j : STD_LOGIC_VECTOR (32 downto 0);
    signal bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_k : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_l : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_m : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_n : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_o : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_p : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_q : STD_LOGIC_VECTOR (255 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_c : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_d : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_e : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_f : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_g : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_h : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_i : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_j : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_k : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_l : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_m : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_n : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_o : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_p : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_join_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_q : STD_LOGIC_VECTOR (231 downto 0);
    signal bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_e : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_f : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_h : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_i : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_j : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_k : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_l : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_m : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_q : STD_LOGIC_VECTOR (65 downto 0);
    signal bubble_select_i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_d : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (361 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (32 downto 0);
    signal bubble_select_stall_entry_i : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_l : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_m : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_n : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_o : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_p : STD_LOGIC_VECTOR (32 downto 0);
    signal bubble_select_stall_entry_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,143)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= gemm_nnfW_B5_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,81)
    bubble_join_stall_entry_q <= in_unnamed_gemm_nnfW8 & in_unnamed_gemm_nnfW7 & in_unnamed_gemm_nnfW6 & in_sdiv_sh125_RM36 & in_phi_decision156_xor_RM1655 & in_notexit2934 & in_mul2054 & in_mul1142 & in_memdep_phi6_pop1144 & in_fpgaindvars_iv & in_forked51 & in_conv15_hf_tofpc53 & in_cmp88_RM38 & in_cmp380_RM40 & in_arrayidx1452 & in_Cn_285_rep;

    -- bubble_select_stall_entry(BITSELECT,82)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(63 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(127 downto 64));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(128 downto 128));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(129 downto 129));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(193 downto 130));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(194 downto 194));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(227 downto 195));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(228 downto 228));
    bubble_select_stall_entry_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(260 downto 229));
    bubble_select_stall_entry_k <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(292 downto 261));
    bubble_select_stall_entry_l <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(293 downto 293));
    bubble_select_stall_entry_m <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(294 downto 294));
    bubble_select_stall_entry_n <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(326 downto 295));
    bubble_select_stall_entry_o <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(327 downto 327));
    bubble_select_stall_entry_p <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(360 downto 328));
    bubble_select_stall_entry_q <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(361 downto 361));

    -- gemm_nnfW_B5_merge_reg_aunroll_x(BLACKBOX,15)@0
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
    -- out out_data_out_12@1
    -- out out_data_out_13@1
    -- out out_data_out_14@1
    -- out out_data_out_15@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thegemm_nnfW_B5_merge_reg_aunroll_x : gemm_nnfW_B5_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_h,
        in_data_in_1 => bubble_select_stall_entry_b,
        in_data_in_2 => bubble_select_stall_entry_o,
        in_data_in_3 => bubble_select_stall_entry_l,
        in_data_in_4 => bubble_select_stall_entry_n,
        in_data_in_5 => bubble_select_stall_entry_e,
        in_data_in_6 => bubble_select_stall_entry_d,
        in_data_in_7 => bubble_select_stall_entry_j,
        in_data_in_8 => bubble_select_stall_entry_p,
        in_data_in_9 => bubble_select_stall_entry_i,
        in_data_in_10 => bubble_select_stall_entry_g,
        in_data_in_11 => bubble_select_stall_entry_c,
        in_data_in_12 => bubble_select_stall_entry_f,
        in_data_in_13 => bubble_select_stall_entry_k,
        in_data_in_14 => bubble_select_stall_entry_m,
        in_data_in_15 => bubble_select_stall_entry_q,
        in_stall_in => SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_5,
        out_data_out_6 => gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_6,
        out_data_out_7 => gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_7,
        out_data_out_8 => gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_8,
        out_data_out_9 => gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_9,
        out_data_out_10 => gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10,
        out_data_out_11 => gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_11,
        out_data_out_12 => gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_12,
        out_data_out_13 => gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_13,
        out_data_out_14 => gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_14,
        out_data_out_15 => gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_15,
        out_stall_out => gemm_nnfW_B5_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => gemm_nnfW_B5_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_gemm_nnfW_B5_merge_reg_aunroll_x(STALLENABLE,136)
    SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_fromReg2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_fromReg0 <= SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_fromReg1 <= SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_fromReg2 <= SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_toReg2;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_consumed0 <= (not (i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_o_stall) and SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_fromReg0;
    SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_consumed1 <= (not (redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_stall_out) and SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_fromReg1;
    SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_consumed2 <= (not (redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_stall_out) and SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_fromReg2;
    -- Consuming
    SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_StallValid <= SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_backStall and SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_wireValid;
    SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_toReg0 <= SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_StallValid and SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_consumed0;
    SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_toReg1 <= SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_StallValid and SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_consumed1;
    SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_toReg2 <= SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_StallValid and SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_consumed2;
    -- Backward Stall generation
    SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_or0 <= SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_consumed0;
    SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_or1 <= SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_consumed1 and SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_or0;
    SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_wireStall <= not (SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_consumed2 and SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_or1);
    SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_backStall <= SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_V0 <= SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_fromReg0);
    SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_V1 <= SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_fromReg1);
    SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_V2 <= SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_fromReg2);
    -- Computing multiple Valid(s)
    SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_wireValid <= gemm_nnfW_B5_merge_reg_aunroll_x_out_valid_out;

    -- bubble_join_gemm_nnfW_B5_merge_reg_aunroll_x(BITJOIN,68)
    bubble_join_gemm_nnfW_B5_merge_reg_aunroll_x_q <= gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_15 & gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_14 & gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_13 & gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_12 & gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_11 & gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10 & gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_9 & gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_8 & gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_7 & gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_6 & gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_5 & gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_4 & gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_3 & gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_2 & gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1 & gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x(BITSELECT,69)
    bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B5_merge_reg_aunroll_x_q(32 downto 0));
    bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B5_merge_reg_aunroll_x_q(96 downto 33));
    bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B5_merge_reg_aunroll_x_q(97 downto 97));
    bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B5_merge_reg_aunroll_x_q(98 downto 98));
    bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B5_merge_reg_aunroll_x_q(130 downto 99));
    bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B5_merge_reg_aunroll_x_q(131 downto 131));
    bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B5_merge_reg_aunroll_x_q(132 downto 132));
    bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B5_merge_reg_aunroll_x_q(164 downto 133));
    bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B5_merge_reg_aunroll_x_q(197 downto 165));
    bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B5_merge_reg_aunroll_x_q(198 downto 198));
    bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B5_merge_reg_aunroll_x_q(199 downto 199));
    bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B5_merge_reg_aunroll_x_q(263 downto 200));
    bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B5_merge_reg_aunroll_x_q(327 downto 264));
    bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B5_merge_reg_aunroll_x_q(359 downto 328));
    bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_p <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B5_merge_reg_aunroll_x_q(360 downto 360));
    bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_q <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B5_merge_reg_aunroll_x_q(361 downto 361));

    -- i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x(BLACKBOX,17)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit144_0@7
    -- out out_c0_exit144_1@7
    -- out out_c0_exit144_2@7
    -- out out_c0_exit144_3@7
    -- out out_c0_exit144_4@7
    -- out out_c0_exit144_5@7
    -- out out_c0_exit144_6@7
    -- out out_c0_exit144_7@7
    -- out out_c0_exit144_8@7
    -- out out_c0_exit144_9@7
    -- out out_c0_exit144_10@7
    -- out out_c0_exit144_11@7
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_stall_out@20000000
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_valid_out@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@7
    -- out out_pipeline_valid_out@20000000
    thei_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x : i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw
    PORT MAP (
        in_c0_eni15_0 => GND_q,
        in_c0_eni15_1 => bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_l,
        in_c0_eni15_2 => bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_o,
        in_c0_eni15_3 => bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_g,
        in_c0_eni15_4 => bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_h,
        in_c0_eni15_5 => bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_b,
        in_c0_eni15_6 => bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_n,
        in_c0_eni15_7 => bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_d,
        in_c0_eni15_8 => bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_e,
        in_c0_eni15_9 => bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_f,
        in_c0_eni15_10 => bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_i,
        in_c0_eni15_11 => bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_j,
        in_c0_eni15_12 => bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_k,
        in_c0_eni15_13 => bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_m,
        in_c0_eni15_14 => bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_p,
        in_c0_eni15_15 => bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_q,
        in_A => in_A,
        in_M => in_M,
        in_i_stall => SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_backStall,
        in_i_valid => SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_V0,
        in_pipeline_stall_in => in_pipeline_stall_in,
        out_c0_exit144_0 => i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0,
        out_c0_exit144_1 => i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1,
        out_c0_exit144_2 => i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2,
        out_c0_exit144_3 => i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3,
        out_c0_exit144_4 => i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4,
        out_c0_exit144_5 => i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5,
        out_c0_exit144_6 => i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6,
        out_c0_exit144_7 => i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7,
        out_c0_exit144_8 => i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8,
        out_c0_exit144_9 => i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9,
        out_c0_exit144_10 => i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10,
        out_c0_exit144_11 => i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11,
        out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_stall_out => i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_valid_out => i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_valid_out,
        out_o_stall => i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_o_valid,
        out_pipeline_valid_out => i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x(BITJOIN,74)
    bubble_join_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_q <= i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11 & i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10 & i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9 & i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8 & i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7 & i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6 & i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5 & i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4 & i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3 & i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2 & i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1 & i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0;

    -- bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x(BITSELECT,75)
    bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_q(0 downto 0));
    bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_q(32 downto 1));
    bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_q(96 downto 33));
    bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_q(97 downto 97));
    bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_q(98 downto 98));
    bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_q(99 downto 99));
    bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_q(163 downto 100));
    bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_q(164 downto 164));
    bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_q(165 downto 165));
    bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_q(229 downto 166));
    bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_q(230 downto 230));
    bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_q(231 downto 231));

    -- redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo(STALLFIFO,55)
    redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_valid_in <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V5;
    redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_stall_in <= SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_backStall;
    redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_data_in <= bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_f;
    redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_valid_in_bitsignaltemp <= redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_valid_in(0);
    redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_stall_in_bitsignaltemp <= redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_stall_in(0);
    redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_valid_out(0) <= redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_valid_out_bitsignaltemp;
    redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_stall_out(0) <= redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_stall_out_bitsignaltemp;
    theredist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 153,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_f,
        valid_out => redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_stall_out_bitsignaltemp,
        data_out => redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo(STALLFIFO,51)
    redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_valid_in <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V2;
    redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_stall_in <= SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_backStall;
    redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_data_in <= bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_c;
    redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_valid_in_bitsignaltemp <= redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_valid_in(0);
    redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_stall_in_bitsignaltemp <= redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_stall_in(0);
    redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_valid_out(0) <= redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_valid_out_bitsignaltemp;
    redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_stall_out(0) <= redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_stall_out_bitsignaltemp;
    theredist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 153,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_c,
        valid_out => redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_stall_out_bitsignaltemp,
        data_out => redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x(STALLENABLE,140)
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg0 <= (others => '0');
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg1 <= (others => '0');
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg2 <= (others => '0');
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg3 <= (others => '0');
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg4 <= (others => '0');
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg5 <= (others => '0');
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg6 <= (others => '0');
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg7 <= (others => '0');
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg8 <= (others => '0');
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg9 <= (others => '0');
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg10 <= (others => '0');
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg11 <= (others => '0');
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg12 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg0 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg1 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg2 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg3 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg4 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg4;
            -- Succesor 5
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg5 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg5;
            -- Succesor 6
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg6 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg6;
            -- Succesor 7
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg7 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg7;
            -- Succesor 8
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg8 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg8;
            -- Succesor 9
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg9 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg9;
            -- Succesor 10
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg10 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg10;
            -- Succesor 11
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg11 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg11;
            -- Succesor 12
            SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg12 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg12;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed0 <= (not (i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_stall) and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg0;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed1 <= (not (redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_stall_out) and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg1;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed2 <= (not (redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_stall_out) and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg2;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed3 <= (not (redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_stall_out) and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg3;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed4 <= (not (redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_stall_out) and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg4;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed5 <= (not (redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_stall_out) and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg5;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed6 <= (not (redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_stall_out) and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg6;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed7 <= (not (redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_stall_out) and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg7;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed8 <= (not (redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_stall_out) and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg8;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed9 <= (not (redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_stall_out) and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg9;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed10 <= (not (redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_stall_out) and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg10;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed11 <= (not (redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_stall_out) and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg11;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed12 <= (not (redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_stall_out) and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg12;
    -- Consuming
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_StallValid <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_backStall and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg0 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed0;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg1 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed1;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg2 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed2;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg3 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed3;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg4 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed4;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg5 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed5;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg6 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed6;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg7 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed7;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg8 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed8;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg9 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed9;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg10 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed10;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg11 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed11;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_toReg12 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed12;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or0 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed0;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or1 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed1 and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or0;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or2 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed2 and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or1;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or3 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed3 and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or2;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or4 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed4 and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or3;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or5 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed5 and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or4;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or6 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed6 and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or5;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or7 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed7 and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or6;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or8 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed8 and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or7;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or9 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed9 and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or8;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or10 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed10 and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or9;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or11 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed11 and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or10;
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireStall <= not (SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_consumed12 and SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_or11);
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_backStall <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V0 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg0);
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V1 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg1);
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V2 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg2);
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V3 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg3);
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V4 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg4);
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V5 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg5);
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V6 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg6);
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V7 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg7);
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V8 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg8);
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V9 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg9);
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V10 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg10);
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V11 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg11);
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V12 <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_fromReg12);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_wireValid <= i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_o_valid;

    -- redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo(STALLFIFO,57)
    redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_valid_in <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V6;
    redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_stall_in <= SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_backStall;
    redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_data_in <= bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_g;
    redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_valid_in_bitsignaltemp <= redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_valid_in(0);
    redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_stall_in_bitsignaltemp <= redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_stall_in(0);
    redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_valid_out(0) <= redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_valid_out_bitsignaltemp;
    redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_stall_out(0) <= redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_stall_out_bitsignaltemp;
    theredist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 153,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_valid_in_bitsignaltemp,
        stall_in => redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_g,
        valid_out => redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_valid_out_bitsignaltemp,
        stall_out => redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_stall_out_bitsignaltemp,
        data_out => redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo(STALLENABLE,160)
    SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_fromReg0 <= (others => '0');
            SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_fromReg0 <= SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_toReg0;
            -- Succesor 1
            SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_fromReg1 <= SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_consumed0 <= (not (SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_backStall) and SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_wireValid) or SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_fromReg0;
    SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_consumed1 <= (not (redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_stall_out) and SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_wireValid) or SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_fromReg1;
    -- Consuming
    SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_StallValid <= SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_backStall and SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_wireValid;
    SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_toReg0 <= SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_StallValid and SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_consumed0;
    SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_toReg1 <= SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_StallValid and SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_or0 <= SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_consumed0;
    SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_wireStall <= not (SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_consumed1 and SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_or0);
    SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_backStall <= SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_V0 <= SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_wireValid and not (SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_fromReg0);
    SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_V1 <= SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_wireValid and not (SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_wireValid <= redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_valid_out;

    -- SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo(STALLENABLE,156)
    SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_fromReg0 <= (others => '0');
            SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_fromReg0 <= SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_toReg0;
            -- Succesor 1
            SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_fromReg1 <= SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_consumed0 <= (not (SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_backStall) and SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_wireValid) or SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_fromReg0;
    SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_consumed1 <= (not (redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_stall_out) and SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_wireValid) or SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_fromReg1;
    -- Consuming
    SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_StallValid <= SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_backStall and SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_wireValid;
    SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_toReg0 <= SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_StallValid and SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_consumed0;
    SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_toReg1 <= SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_StallValid and SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_or0 <= SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_consumed0;
    SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_wireStall <= not (SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_consumed1 and SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_or0);
    SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_backStall <= SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_V0 <= SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_wireValid and not (SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_fromReg0);
    SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_V1 <= SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_wireValid and not (SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_wireValid <= redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_valid_out;

    -- SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo(STALLENABLE,148)
    SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_fromReg0 <= (others => '0');
            SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_fromReg0 <= SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_toReg0;
            -- Succesor 1
            SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_fromReg1 <= SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_consumed0 <= (not (SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_backStall) and SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_wireValid) or SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_fromReg0;
    SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_consumed1 <= (not (redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_stall_out) and SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_wireValid) or SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_fromReg1;
    -- Consuming
    SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_StallValid <= SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_backStall and SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_wireValid;
    SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_toReg0 <= SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_StallValid and SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_consumed0;
    SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_toReg1 <= SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_StallValid and SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_or0 <= SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_consumed0;
    SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_wireStall <= not (SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_consumed1 and SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_or0);
    SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_backStall <= SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_V0 <= SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_wireValid and not (SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_fromReg0);
    SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_V1 <= SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_wireValid and not (SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_wireValid <= redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_valid_out;

    -- i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x(BLACKBOX,16)@7
    -- in in_i_stall@20000000
    -- out out_o_readdata_0@159
    -- out out_o_readdata_1@159
    -- out out_o_readdata_2@159
    -- out out_o_readdata_3@159
    -- out out_o_readdata_4@159
    -- out out_o_readdata_5@159
    -- out out_o_readdata_6@159
    -- out out_o_readdata_7@159
    -- out out_o_readdata_8@159
    -- out out_o_readdata_9@159
    -- out out_o_readdata_10@159
    -- out out_o_readdata_11@159
    -- out out_o_readdata_12@159
    -- out out_o_readdata_13@159
    -- out out_o_readdata_14@159
    -- out out_o_readdata_15@159
    -- out out_memcoalesce_A_load_0_avm_address@20000000
    -- out out_memcoalesce_A_load_0_avm_burstcount@20000000
    -- out out_memcoalesce_A_load_0_avm_byteenable@20000000
    -- out out_memcoalesce_A_load_0_avm_enable@20000000
    -- out out_memcoalesce_A_load_0_avm_read@20000000
    -- out out_memcoalesce_A_load_0_avm_write@20000000
    -- out out_memcoalesce_A_load_0_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@159
    thei_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x : i_load_memcoalesce_a_load_0_gemm_nnfw234
    PORT MAP (
        in_flush => in_flush,
        in_i_address => bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_d,
        in_i_predicate => bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_f,
        in_i_stall => SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_backStall,
        in_i_valid => SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V0,
        in_memcoalesce_A_load_0_avm_readdata => in_memcoalesce_A_load_0_avm_readdata,
        in_memcoalesce_A_load_0_avm_readdatavalid => in_memcoalesce_A_load_0_avm_readdatavalid,
        in_memcoalesce_A_load_0_avm_waitrequest => in_memcoalesce_A_load_0_avm_waitrequest,
        in_memcoalesce_A_load_0_avm_writeack => in_memcoalesce_A_load_0_avm_writeack,
        out_o_readdata_0 => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_1,
        out_o_readdata_2 => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_2,
        out_o_readdata_3 => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_3,
        out_o_readdata_4 => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_4,
        out_o_readdata_5 => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_5,
        out_o_readdata_6 => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_6,
        out_o_readdata_7 => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_7,
        out_o_readdata_8 => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_8,
        out_o_readdata_9 => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_9,
        out_o_readdata_10 => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_10,
        out_o_readdata_11 => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_11,
        out_o_readdata_12 => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_12,
        out_o_readdata_13 => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_13,
        out_o_readdata_14 => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_14,
        out_o_readdata_15 => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_15,
        out_memcoalesce_A_load_0_avm_address => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_A_load_0_avm_address,
        out_memcoalesce_A_load_0_avm_burstcount => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_A_load_0_avm_burstcount,
        out_memcoalesce_A_load_0_avm_byteenable => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_A_load_0_avm_byteenable,
        out_memcoalesce_A_load_0_avm_enable => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_A_load_0_avm_enable,
        out_memcoalesce_A_load_0_avm_read => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_A_load_0_avm_read,
        out_memcoalesce_A_load_0_avm_write => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_A_load_0_avm_write,
        out_memcoalesce_A_load_0_avm_writedata => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_A_load_0_avm_writedata,
        out_o_stall => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_stall,
        out_o_valid => i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo(STALLFIFO,65)
    redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_valid_in <= SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_V1;
    redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_stall_in <= SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_backStall;
    redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_data_in <= bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_c;
    redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_valid_in_bitsignaltemp <= redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_valid_in(0);
    redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_stall_in_bitsignaltemp <= redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_stall_in(0);
    redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_valid_out(0) <= redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_valid_out_bitsignaltemp;
    redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_stall_out(0) <= redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_stall_out_bitsignaltemp;
    theredist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 159,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_valid_in_bitsignaltemp,
        stall_in => redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_c,
        valid_out => redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_valid_out_bitsignaltemp,
        stall_out => redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_stall_out_bitsignaltemp,
        data_out => redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo(STALLFIFO,66)
    redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_valid_in <= SE_out_gemm_nnfW_B5_merge_reg_aunroll_x_V2;
    redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_stall_in <= SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_backStall;
    redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_data_in <= bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_l;
    redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_valid_in_bitsignaltemp <= redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_valid_in(0);
    redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_stall_in_bitsignaltemp <= redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_stall_in(0);
    redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_valid_out(0) <= redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_valid_out_bitsignaltemp;
    redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_stall_out(0) <= redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_stall_out_bitsignaltemp;
    theredist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 159,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_valid_in_bitsignaltemp,
        stall_in => redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_gemm_nnfW_B5_merge_reg_aunroll_x_l,
        valid_out => redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_valid_out_bitsignaltemp,
        stall_out => redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_stall_out_bitsignaltemp,
        data_out => redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo(STALLENABLE,178)
    -- Valid signal propagation
    SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_V0 <= SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_backStall <= i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_o_stall or not (SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_and0 <= redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_valid_out;
    SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_and1 <= redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_valid_out and SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_and0;
    SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_and2 <= i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_valid and SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_and1;
    SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_and3 <= SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_V0 and SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_and2;
    SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_and4 <= SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_V0 and SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_and3;
    SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_wireValid <= SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_V0 and SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_and4;

    -- bubble_join_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo(BITJOIN,106)
    bubble_join_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_q <= redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_data_out;

    -- bubble_select_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo(BITSELECT,107)
    bubble_select_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_q(0 downto 0));

    -- bubble_join_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo(BITJOIN,133)
    bubble_join_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_q <= redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_data_out;

    -- bubble_select_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo(BITSELECT,134)
    bubble_select_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_q(0 downto 0));

    -- bubble_join_redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo(BITJOIN,130)
    bubble_join_redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_q <= redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_data_out;

    -- bubble_select_redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo(BITSELECT,131)
    bubble_select_redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_q(63 downto 0));

    -- bubble_join_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo(BITJOIN,100)
    bubble_join_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_q <= redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_data_out;

    -- bubble_select_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo(BITSELECT,101)
    bubble_select_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_q(0 downto 0));

    -- bubble_join_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo(BITJOIN,88)
    bubble_join_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_q <= redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_data_out;

    -- bubble_select_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo(BITSELECT,89)
    bubble_select_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_q(31 downto 0));

    -- bubble_join_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x(BITJOIN,71)
    bubble_join_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_q <= i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_15 & i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_14 & i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_13 & i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_12 & i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_11 & i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_10 & i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_9 & i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_8 & i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_7 & i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_6 & i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_5 & i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_4 & i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_3 & i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_2 & i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_1 & i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_o_readdata_0;

    -- bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x(BITSELECT,72)
    bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_q(15 downto 0));
    bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_q(31 downto 16));
    bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_q(47 downto 32));
    bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_q(63 downto 48));
    bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_q(79 downto 64));
    bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_q(95 downto 80));
    bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_q(111 downto 96));
    bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_q(127 downto 112));
    bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_q(143 downto 128));
    bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_q(159 downto 144));
    bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_q(175 downto 160));
    bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_q(191 downto 176));
    bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_q(207 downto 192));
    bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_q(223 downto 208));
    bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_p <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_q(239 downto 224));
    bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_q <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_q(255 downto 240));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x(BLACKBOX,18)@159
    -- in in_i_stall@20000000
    -- out out_c1_exit170_0@237
    -- out out_c1_exit170_1@237
    -- out out_c1_exit170_2@237
    -- out out_o_stall@20000000
    -- out out_o_valid@237
    -- out out_unnamed_gemm_nnfW9_avm_address@20000000
    -- out out_unnamed_gemm_nnfW9_avm_burstcount@20000000
    -- out out_unnamed_gemm_nnfW9_avm_byteenable@20000000
    -- out out_unnamed_gemm_nnfW9_avm_enable@20000000
    -- out out_unnamed_gemm_nnfW9_avm_read@20000000
    -- out out_unnamed_gemm_nnfW9_avm_write@20000000
    -- out out_unnamed_gemm_nnfW9_avm_writedata@20000000
    thei_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x : i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw
    PORT MAP (
        in_c1_eni6161_0 => GND_q,
        in_c1_eni6161_1 => bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_b,
        in_c1_eni6161_2 => bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_c,
        in_c1_eni6161_3 => bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_d,
        in_c1_eni6161_4 => bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_e,
        in_c1_eni6161_5 => bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_f,
        in_c1_eni6161_6 => bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_g,
        in_c1_eni6161_7 => bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_h,
        in_c1_eni6161_8 => bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_i,
        in_c1_eni6161_9 => bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_j,
        in_c1_eni6161_10 => bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_k,
        in_c1_eni6161_11 => bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_l,
        in_c1_eni6161_12 => bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_m,
        in_c1_eni6161_13 => bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_n,
        in_c1_eni6161_14 => bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_o,
        in_c1_eni6161_15 => bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_p,
        in_c1_eni6161_16 => bubble_select_i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_q,
        in_c1_eni6161_17 => bubble_select_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_b,
        in_c1_eni6161_18 => bubble_select_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_b,
        in_c1_eni6161_19 => bubble_select_redist15_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_1_158_fifo_b,
        in_c1_eni6161_20 => bubble_select_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_b,
        in_c1_eni6161_21 => bubble_select_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_b,
        in_c0_exe5149 => bubble_select_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_b,
        in_flush => in_flush,
        in_forked51 => bubble_select_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_b,
        in_i_stall => SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_backStall,
        in_i_valid => SE_out_redist16_gemm_nnfW_B5_merge_reg_aunroll_x_out_data_out_10_158_fifo_V0,
        in_unnamed_gemm_nnfW9_avm_readdata => in_unnamed_gemm_nnfW9_avm_readdata,
        in_unnamed_gemm_nnfW9_avm_readdatavalid => in_unnamed_gemm_nnfW9_avm_readdatavalid,
        in_unnamed_gemm_nnfW9_avm_waitrequest => in_unnamed_gemm_nnfW9_avm_waitrequest,
        in_unnamed_gemm_nnfW9_avm_writeack => in_unnamed_gemm_nnfW9_avm_writeack,
        out_c1_exit170_0 => i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_c1_exit170_0,
        out_c1_exit170_1 => i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_c1_exit170_1,
        out_c1_exit170_2 => i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_c1_exit170_2,
        out_o_stall => i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_o_valid,
        out_unnamed_gemm_nnfW9_avm_address => i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_unnamed_gemm_nnfW9_avm_address,
        out_unnamed_gemm_nnfW9_avm_burstcount => i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_unnamed_gemm_nnfW9_avm_burstcount,
        out_unnamed_gemm_nnfW9_avm_byteenable => i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_unnamed_gemm_nnfW9_avm_byteenable,
        out_unnamed_gemm_nnfW9_avm_enable => i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_unnamed_gemm_nnfW9_avm_enable,
        out_unnamed_gemm_nnfW9_avm_read => i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_unnamed_gemm_nnfW9_avm_read,
        out_unnamed_gemm_nnfW9_avm_write => i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_unnamed_gemm_nnfW9_avm_write,
        out_unnamed_gemm_nnfW9_avm_writedata => i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_unnamed_gemm_nnfW9_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo(STALLFIFO,50)
    redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_valid_in <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V1;
    redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_stall_in <= SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_backStall;
    redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_data_in <= bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_b;
    redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_valid_in_bitsignaltemp <= redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_valid_in(0);
    redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_stall_in_bitsignaltemp <= redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_stall_in(0);
    redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_valid_out(0) <= redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_valid_out_bitsignaltemp;
    redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_stall_out(0) <= redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_stall_out_bitsignaltemp;
    theredist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 231,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_b,
        valid_out => redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_stall_out_bitsignaltemp,
        data_out => redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo(STALLFIFO,52)
    redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_valid_in <= SE_out_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_V1;
    redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_stall_in <= SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_backStall;
    redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_data_in <= bubble_select_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_b;
    redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_valid_in_bitsignaltemp <= redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_valid_in(0);
    redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_stall_in_bitsignaltemp <= redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_stall_in(0);
    redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_valid_out(0) <= redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_valid_out_bitsignaltemp;
    redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_stall_out(0) <= redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_stall_out_bitsignaltemp;
    theredist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 79,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_valid_in_bitsignaltemp,
        stall_in => redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist1_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_152_fifo_b,
        valid_out => redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_valid_out_bitsignaltemp,
        stall_out => redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_stall_out_bitsignaltemp,
        data_out => redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo(STALLFIFO,53)
    redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_valid_in <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V3;
    redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_stall_in <= SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_backStall;
    redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_data_in <= bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_d;
    redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_valid_in_bitsignaltemp <= redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_valid_in(0);
    redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_stall_in_bitsignaltemp <= redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_stall_in(0);
    redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_valid_out(0) <= redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_valid_out_bitsignaltemp;
    redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_stall_out(0) <= redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_stall_out_bitsignaltemp;
    theredist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 231,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_valid_in_bitsignaltemp,
        stall_in => redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_d,
        valid_out => redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_valid_out_bitsignaltemp,
        stall_out => redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_stall_out_bitsignaltemp,
        data_out => redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo(STALLFIFO,54)
    redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_valid_in <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V4;
    redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_stall_in <= SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_backStall;
    redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_data_in <= bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_e;
    redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_valid_in_bitsignaltemp <= redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_valid_in(0);
    redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_stall_in_bitsignaltemp <= redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_stall_in(0);
    redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_valid_out(0) <= redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_valid_out_bitsignaltemp;
    redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_stall_out(0) <= redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_stall_out_bitsignaltemp;
    theredist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 231,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_valid_in_bitsignaltemp,
        stall_in => redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_e,
        valid_out => redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_valid_out_bitsignaltemp,
        stall_out => redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_stall_out_bitsignaltemp,
        data_out => redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo(STALLFIFO,56)
    redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_valid_in <= SE_out_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_V1;
    redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_stall_in <= SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_backStall;
    redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_data_in <= bubble_select_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_b;
    redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_valid_in_bitsignaltemp <= redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_valid_in(0);
    redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_stall_in_bitsignaltemp <= redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_stall_in(0);
    redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_valid_out(0) <= redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_valid_out_bitsignaltemp;
    redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_stall_out(0) <= redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_stall_out_bitsignaltemp;
    theredist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 79,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_valid_in_bitsignaltemp,
        stall_in => redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist5_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_152_fifo_b,
        valid_out => redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_valid_out_bitsignaltemp,
        stall_out => redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_stall_out_bitsignaltemp,
        data_out => redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo(STALLFIFO,58)
    redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_valid_in <= SE_out_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_V1;
    redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_stall_in <= SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_backStall;
    redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_data_in <= bubble_select_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_b;
    redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_valid_in_bitsignaltemp <= redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_valid_in(0);
    redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_stall_in_bitsignaltemp <= redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_stall_in(0);
    redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_valid_out(0) <= redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_valid_out_bitsignaltemp;
    redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_stall_out(0) <= redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_stall_out_bitsignaltemp;
    theredist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 79,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_valid_in_bitsignaltemp,
        stall_in => redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_redist7_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_152_fifo_b,
        valid_out => redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_valid_out_bitsignaltemp,
        stall_out => redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_stall_out_bitsignaltemp,
        data_out => redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo(STALLFIFO,59)
    redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_valid_in <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V7;
    redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_stall_in <= SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_backStall;
    redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_data_in <= bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_h;
    redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_valid_in_bitsignaltemp <= redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_valid_in(0);
    redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_stall_in_bitsignaltemp <= redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_stall_in(0);
    redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_valid_out(0) <= redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_valid_out_bitsignaltemp;
    redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_stall_out(0) <= redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_stall_out_bitsignaltemp;
    theredist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 231,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_valid_in_bitsignaltemp,
        stall_in => redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_h,
        valid_out => redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_valid_out_bitsignaltemp,
        stall_out => redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_stall_out_bitsignaltemp,
        data_out => redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo(STALLFIFO,60)
    redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_valid_in <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V8;
    redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_stall_in <= SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_backStall;
    redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_data_in <= bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_i;
    redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_valid_in_bitsignaltemp <= redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_valid_in(0);
    redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_stall_in_bitsignaltemp <= redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_stall_in(0);
    redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_valid_out(0) <= redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_valid_out_bitsignaltemp;
    redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_stall_out(0) <= redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_stall_out_bitsignaltemp;
    theredist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 231,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_valid_in_bitsignaltemp,
        stall_in => redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_i,
        valid_out => redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_valid_out_bitsignaltemp,
        stall_out => redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_stall_out_bitsignaltemp,
        data_out => redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo(STALLFIFO,61)
    redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_valid_in <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V9;
    redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_stall_in <= SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_backStall;
    redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_data_in <= bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_j;
    redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_valid_in_bitsignaltemp <= redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_valid_in(0);
    redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_stall_in_bitsignaltemp <= redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_stall_in(0);
    redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_valid_out(0) <= redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_valid_out_bitsignaltemp;
    redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_stall_out(0) <= redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_stall_out_bitsignaltemp;
    theredist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 231,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_valid_in_bitsignaltemp,
        stall_in => redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_j,
        valid_out => redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_valid_out_bitsignaltemp,
        stall_out => redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_stall_out_bitsignaltemp,
        data_out => redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo(STALLFIFO,62)
    redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_valid_in <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V10;
    redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_stall_in <= SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_backStall;
    redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_data_in <= bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_k;
    redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_valid_in_bitsignaltemp <= redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_valid_in(0);
    redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_stall_in_bitsignaltemp <= redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_stall_in(0);
    redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_valid_out(0) <= redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_valid_out_bitsignaltemp;
    redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_stall_out(0) <= redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_stall_out_bitsignaltemp;
    theredist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 231,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_valid_in_bitsignaltemp,
        stall_in => redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_k,
        valid_out => redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_valid_out_bitsignaltemp,
        stall_out => redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_stall_out_bitsignaltemp,
        data_out => redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo(STALLFIFO,63)
    redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_valid_in <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V11;
    redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_stall_in <= SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_backStall;
    redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_data_in <= bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_l;
    redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_valid_in_bitsignaltemp <= redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_valid_in(0);
    redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_stall_in_bitsignaltemp <= redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_stall_in(0);
    redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_valid_out(0) <= redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_valid_out_bitsignaltemp;
    redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_stall_out(0) <= redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_stall_out_bitsignaltemp;
    theredist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 231,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_valid_in_bitsignaltemp,
        stall_in => redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_l,
        valid_out => redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_valid_out_bitsignaltemp,
        stall_out => redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_stall_out_bitsignaltemp,
        data_out => redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo(STALLFIFO,64)
    redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_valid_in <= SE_out_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_V12;
    redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_stall_in <= SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_backStall;
    redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_data_in <= bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_m;
    redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_valid_in_bitsignaltemp <= redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_valid_in(0);
    redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_stall_in_bitsignaltemp <= redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_stall_in(0);
    redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_valid_out(0) <= redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_valid_out_bitsignaltemp;
    redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_stall_out(0) <= redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_stall_out_bitsignaltemp;
    theredist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 231,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_valid_in_bitsignaltemp,
        stall_in => redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_m,
        valid_out => redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_valid_out_bitsignaltemp,
        stall_out => redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_stall_out_bitsignaltemp,
        data_out => redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo(STALLENABLE,174)
    -- Valid signal propagation
    SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_V0 <= SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_backStall <= in_stall_in or not (SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and0 <= redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_valid_out;
    SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and1 <= redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_valid_out and SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and0;
    SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and2 <= redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_valid_out and SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and1;
    SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and3 <= redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_valid_out and SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and2;
    SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and4 <= redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_valid_out and SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and3;
    SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and5 <= redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_valid_out and SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and4;
    SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and6 <= redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_valid_out and SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and5;
    SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and7 <= redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_valid_out and SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and6;
    SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and8 <= redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_valid_out and SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and7;
    SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and9 <= redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_valid_out and SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and8;
    SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and10 <= redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_valid_out and SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and9;
    SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and11 <= redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_valid_out and SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and10;
    SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_wireValid <= i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_o_valid and SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_and11;

    -- bubble_join_i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x(BITJOIN,77)
    bubble_join_i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_q <= i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_c1_exit170_2 & i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_c1_exit170_1 & i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_c1_exit170_0;

    -- bubble_select_i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x(BITSELECT,78)
    bubble_select_i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_q(0 downto 0));
    bubble_select_i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_q(1 downto 1));
    bubble_select_i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_q(65 downto 2));

    -- bubble_join_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo(BITJOIN,127)
    bubble_join_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_q <= redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_data_out;

    -- bubble_select_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo(BITSELECT,128)
    bubble_select_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_q(0 downto 0));

    -- bubble_join_redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo(BITJOIN,124)
    bubble_join_redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_q <= redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_data_out;

    -- bubble_select_redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo(BITSELECT,125)
    bubble_select_redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_q(0 downto 0));

    -- bubble_join_redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo(BITJOIN,121)
    bubble_join_redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_q <= redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_data_out;

    -- bubble_select_redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo(BITSELECT,122)
    bubble_select_redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_q(63 downto 0));

    -- bubble_join_redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo(BITJOIN,112)
    bubble_join_redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_q <= redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_data_out;

    -- bubble_select_redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo(BITSELECT,113)
    bubble_select_redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_q(63 downto 0));

    -- bubble_join_redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo(BITJOIN,103)
    bubble_join_redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_q <= redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_data_out;

    -- bubble_select_redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo(BITSELECT,104)
    bubble_select_redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_q(0 downto 0));

    -- bubble_join_redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo(BITJOIN,97)
    bubble_join_redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_q <= redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_data_out;

    -- bubble_select_redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo(BITSELECT,98)
    bubble_select_redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_q(0 downto 0));

    -- bubble_join_redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo(BITJOIN,94)
    bubble_join_redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_q <= redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_data_out;

    -- bubble_select_redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo(BITSELECT,95)
    bubble_select_redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_q(63 downto 0));

    -- bubble_join_redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo(BITJOIN,91)
    bubble_join_redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_q <= redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_data_out;

    -- bubble_select_redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo(BITSELECT,92)
    bubble_select_redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_q(31 downto 0));

    -- bubble_join_redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo(BITJOIN,85)
    bubble_join_redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_q <= redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_data_out;

    -- bubble_select_redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo(BITSELECT,86)
    bubble_select_redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_q(0 downto 0));

    -- bubble_join_redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo(BITJOIN,118)
    bubble_join_redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_q <= redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_data_out;

    -- bubble_select_redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo(BITSELECT,119)
    bubble_select_redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_q(0 downto 0));

    -- bubble_join_redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo(BITJOIN,115)
    bubble_join_redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_q <= redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_data_out;

    -- bubble_select_redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo(BITSELECT,116)
    bubble_select_redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_q(0 downto 0));

    -- bubble_join_redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo(BITJOIN,109)
    bubble_join_redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_q <= redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_data_out;

    -- bubble_select_redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo(BITSELECT,110)
    bubble_select_redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_q(0 downto 0));

    -- dupName_0_sync_out_aunroll_x(GPOUT,2)@237
    out_c0_exe5149 <= bubble_select_redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_b;
    out_c0_exe7151 <= bubble_select_redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_b;
    out_c0_exe8152 <= bubble_select_redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_b;
    out_c0_exit144_0 <= bubble_select_redist0_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_0_230_fifo_b;
    out_c0_exit144_1 <= bubble_select_redist2_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_1_230_fifo_b;
    out_c0_exit144_2 <= bubble_select_redist3_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_2_230_fifo_b;
    out_c0_exit144_3 <= bubble_select_redist4_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_3_230_fifo_b;
    out_c0_exit144_4 <= bubble_select_redist6_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_4_230_fifo_b;
    out_c0_exit144_5 <= bubble_select_redist8_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_5_230_fifo_b;
    out_c0_exit144_6 <= bubble_select_redist9_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_6_230_fifo_b;
    out_c0_exit144_7 <= bubble_select_redist10_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_7_230_fifo_b;
    out_c0_exit144_8 <= bubble_select_redist11_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_8_230_fifo_b;
    out_c0_exit144_9 <= bubble_select_redist12_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_9_230_fifo_b;
    out_c0_exit144_10 <= bubble_select_redist13_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_10_230_fifo_b;
    out_c0_exit144_11 <= bubble_select_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_b;
    out_c1_exe1171 <= bubble_select_i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_c;
    out_c1_exit170_0 <= bubble_select_i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_b;
    out_c1_exit170_1 <= bubble_select_i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_c;
    out_c1_exit170_2 <= bubble_select_i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_d;
    out_valid_out <= SE_out_redist14_i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_c0_exit144_11_230_fifo_V0;

    -- dupName_0_ext_sig_sync_out_x(GPOUT,4)
    out_memcoalesce_A_load_0_avm_address <= i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_A_load_0_avm_address;
    out_memcoalesce_A_load_0_avm_enable <= i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_A_load_0_avm_enable;
    out_memcoalesce_A_load_0_avm_read <= i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_A_load_0_avm_read;
    out_memcoalesce_A_load_0_avm_write <= i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_A_load_0_avm_write;
    out_memcoalesce_A_load_0_avm_writedata <= i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_A_load_0_avm_writedata;
    out_memcoalesce_A_load_0_avm_byteenable <= i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_A_load_0_avm_byteenable;
    out_memcoalesce_A_load_0_avm_burstcount <= i_load_memcoalesce_a_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_A_load_0_avm_burstcount;

    -- dupName_1_ext_sig_sync_out_x(GPOUT,9)
    out_unnamed_gemm_nnfW9_avm_address <= i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_unnamed_gemm_nnfW9_avm_address;
    out_unnamed_gemm_nnfW9_avm_enable <= i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_unnamed_gemm_nnfW9_avm_enable;
    out_unnamed_gemm_nnfW9_avm_read <= i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_unnamed_gemm_nnfW9_avm_read;
    out_unnamed_gemm_nnfW9_avm_write <= i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_unnamed_gemm_nnfW9_avm_write;
    out_unnamed_gemm_nnfW9_avm_writedata <= i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_unnamed_gemm_nnfW9_avm_writedata;
    out_unnamed_gemm_nnfW9_avm_byteenable <= i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_unnamed_gemm_nnfW9_avm_byteenable;
    out_unnamed_gemm_nnfW9_avm_burstcount <= i_sfc_c1_for_body19_gemm_nnfw_c1_enter162_gemm_nnfw_aunroll_x_out_unnamed_gemm_nnfW9_avm_burstcount;

    -- ext_sig_sync_out(GPOUT,23)
    out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_valid_out <= i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_valid_out;
    out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_stall_out <= i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_stall_out;

    -- pipeline_valid_out_sync(GPOUT,27)
    out_pipeline_valid_out <= i_sfc_c0_for_body19_gemm_nnfw_c0_enter123_gemm_nnfw_aunroll_x_out_pipeline_valid_out;

    -- sync_out(GPOUT,32)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
