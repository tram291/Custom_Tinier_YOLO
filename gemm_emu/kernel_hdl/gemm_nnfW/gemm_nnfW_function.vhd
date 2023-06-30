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

-- VHDL created from gemm_nnfW_function
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

entity gemm_nnfW_function is
    port (
        in_arg_A : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_ALPHA : in std_logic_vector(31 downto 0);  -- float32_m23
        in_arg_B : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_C : in std_logic_vector(63 downto 0);  -- ufix64
        in_arg_K : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_M : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_N : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_lda : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_ldb : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_ldc : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_memcoalesce_A_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_A_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_A_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_A_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_B_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_B_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_B_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_B_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_5_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memdep_5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_5_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_start : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW5_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_gemm_nnfW5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW5_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW9_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_gemm_nnfW9_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW9_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW9_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_A_load_0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memcoalesce_A_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memcoalesce_A_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_A_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_A_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_A_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_A_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memcoalesce_B_load_0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memcoalesce_B_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memcoalesce_B_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_B_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_B_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_B_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_B_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memdep_5_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memdep_5_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memdep_5_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_5_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_5_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_5_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_5_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memdep_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_o_active_memdep_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW5_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_gemm_nnfW5_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_gemm_nnfW5_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_gemm_nnfW5_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW5_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW5_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW5_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_gemm_nnfW9_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_gemm_nnfW9_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW9_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_gemm_nnfW9_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW9_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW9_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW9_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end gemm_nnfW_function;

architecture normal of gemm_nnfW_function is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_gemm_nnfW_B1_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nnfW_B2 is
        port (
            in_A : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_B : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_C : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_K : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked45_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked45_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked46_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked46_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_j_089_pop948_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_089_pop948_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_lda : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_ldc : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_B_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_B_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_B_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_B_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi_pop1050_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi_pop1050_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit2949_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit2949_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_sdiv_add124_RM47_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_sdiv_add124_RM47_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW0_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit62_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit62_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit62_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit62_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit62_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit62_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit62_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit62_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit62_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit62_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit62_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit62_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit62_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_memdep_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nnfW_B2_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nnfW_B3 is
        port (
            in_c0_exit621_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit621_0_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit621_0_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit621_0_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit621_0_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit621_0_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit621_0_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit621_0_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit621_0_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit621_0_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit621_0_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit621_0_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit621_0_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_A : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_B : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_C : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_K : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe82_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_in_11 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lda : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_ldc : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe163 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe171 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi6_pop11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW2 : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nnfW_B3_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nnfW_B4_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nnfW_B5 is
        port (
            in_A : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_B : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_C : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_Cn_285_rep_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_Cn_285_rep_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_K : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arrayidx1452_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx1452_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_cmp380_RM40_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp380_RM40_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp88_RM38_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp88_RM38_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_conv15_hf_tofpc53_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_conv15_hf_tofpc53_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked51_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked51_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_0 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_1 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_lda : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_ldc : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_A_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_A_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_A_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_A_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi6_pop1144_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi6_pop1144_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_mul1142_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul1142_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul2054_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul2054_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_notexit2934_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit2934_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_phi_decision156_xor_RM1655_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_phi_decision156_xor_RM1655_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_sdiv_sh125_RM36_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_sdiv_sh125_RM36_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW6_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW6_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW7_0 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW7_1 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW8_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW8_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW9_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW9_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW9_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW9_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_c1_exit170_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit170_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit170_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe7151 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe8152 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe1171 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW9_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW9_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW9_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW9_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW9_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW9_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW9_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nnfW_B5_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_12 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_12 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nnfW_B6 is
        port (
            in_c0_exit1443_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1443_0_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1443_0_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit1443_0_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1443_0_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1443_0_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1443_0_6 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit1443_0_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1443_0_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1443_0_9 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit1443_0_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1443_0_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit1708_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit1708_0_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit1708_0_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_A : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_B : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_C : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_K : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe71515_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe81527_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe117110_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lda : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_ldc : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memdep_5_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memdep_5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_5_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe71515 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe81527 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe117110 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_memdep_5_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_5_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memdep_5_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memdep_5_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_5_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_5_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_5_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_5_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nnfW_B6_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_16 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_16 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nnfW_B7_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nnfW_B8_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nnfW_B0 is
        port (
            in_A : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_B : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_C : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_K : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_in_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lda : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_ldc : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nnfW_B1 is
        port (
            in_A : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_B : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_C : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_K : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_in_10 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lda : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_ldc : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_forked : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi_pop10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_sdiv_add124_RM : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nnfW_B4 is
        port (
            in_A : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_B : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_C : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_K : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_cmp380_RM39_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp380_RM39_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp88_RM37_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp88_RM37_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked32_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked32_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lda : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_ldc : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memdep_phi6_pop1143_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi6_pop1143_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_mul1141_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul1141_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_notexit2933_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit2933_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_sdiv_sh125_RM35_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_sdiv_sh125_RM35_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW3_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW3_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW4_0 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW4_1 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW5_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW5_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe10107 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11108 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe12109 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe13 : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_c0_exe198 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe299 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe3100 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe4101 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe5102 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe6103 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe7104 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe8105 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW5_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW5_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW5_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW5_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW5_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW5_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW5_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nnfW_B7 is
        port (
            in_A : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_B : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_C : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_K : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe71514_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe81526_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe11719_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lda : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_ldc : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memdep_511_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_10 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_11 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_valid_out_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nnfW_B8 is
        port (
            in_feedback_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pipeline_keep_going19_gemm_nnfw_sr is
        port (
            in_i_data : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pipeline_keep_going19_gemm_nnfw_valid_fifo is
        port (
            in_data_in : in std_logic_vector(1 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(1 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pipeline_keep_going23_gemm_nnfw_sr is
        port (
            in_i_data : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pipeline_keep_going23_gemm_nnfw_valid_fifo is
        port (
            in_data_in : in std_logic_vector(1 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(1 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pipeline_keep_going27_gemm_nnfw_sr is
        port (
            in_i_data : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pipeline_keep_going27_gemm_nnfw_valid_fifo is
        port (
            in_data_in : in std_logic_vector(1 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(1 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pipeline_keep_going_gemm_nnfw_sr is
        port (
            in_i_data : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pipeline_keep_going_gemm_nnfw_valid_fifo is
        port (
            in_data_in : in std_logic_vector(1 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(1 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_gemm_nnfW0 is
        port (
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_gemm_nnfW1 is
        port (
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component loop_limiter_gemm_nnfW2 is
        port (
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid_exit : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B1_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B1_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B1_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_c0_exe8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_memcoalesce_B_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_memcoalesce_B_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_memcoalesce_B_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_memcoalesce_B_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_memcoalesce_B_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_memcoalesce_B_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_memcoalesce_B_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_memdep_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_memdep_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_memdep_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_memdep_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_memdep_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_memdep_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_memdep_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_aunroll_x_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_aunroll_x_out_c0_exe11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_aunroll_x_out_c0_exe12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_aunroll_x_out_c0_exe163 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B3_aunroll_x_out_c0_exe171 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B3_aunroll_x_out_c0_exe5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_aunroll_x_out_c0_exe6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_aunroll_x_out_feedback_stall_out_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_aunroll_x_out_memdep_phi6_pop11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_aunroll_x_out_unnamed_gemm_nnfW2 : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_gemm_nnfW_B3_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_6 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_9 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_c1_exit170_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_c1_exit170_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_c1_exit170_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_c0_exe7151 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_c0_exe8152 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_c1_exe1171 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_memcoalesce_A_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_memcoalesce_A_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_memcoalesce_A_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_memcoalesce_A_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_memcoalesce_A_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_memcoalesce_A_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_memcoalesce_A_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_unnamed_gemm_nnfW9_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_unnamed_gemm_nnfW9_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_unnamed_gemm_nnfW9_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_unnamed_gemm_nnfW9_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_unnamed_gemm_nnfW9_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_unnamed_gemm_nnfW9_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_unnamed_gemm_nnfW9_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_gemm_nnfW_B5_aunroll_x_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_aunroll_x_out_c0_exe71515 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_aunroll_x_out_c0_exe81527 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_aunroll_x_out_c1_exe117110 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_aunroll_x_out_lsu_memdep_5_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_aunroll_x_out_memdep_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_aunroll_x_out_memdep_5_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_gemm_nnfW_B6_aunroll_x_out_memdep_5_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_gemm_nnfW_B6_aunroll_x_out_memdep_5_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B6_aunroll_x_out_memdep_5_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_aunroll_x_out_memdep_5_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_aunroll_x_out_memdep_5_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_aunroll_x_out_memdep_5_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_gemm_nnfW_B6_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B7_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B7_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B7_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B7_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B7_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B7_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B8_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B8_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_c_i2_0gr_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal dupName_0_c_i32_undef_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_c_i33_undef_x_q : STD_LOGIC_VECTOR (32 downto 0);
    signal dupName_0_c_i64_undef_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B0_out_feedback_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B0_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B0_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B1_out_c0_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B1_out_c0_exe2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B1_out_c0_exe3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B1_out_feedback_stall_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B1_out_forked : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B1_out_memdep_phi_pop10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B1_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B1_out_sdiv_add124_RM : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B1_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B1_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B1_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_out_c0_exe10107 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_out_c0_exe11108 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_out_c0_exe12109 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_out_c0_exe13 : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_gemm_nnfW_B4_out_c0_exe198 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B4_out_c0_exe299 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B4_out_c0_exe3100 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_out_c0_exe4101 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B4_out_c0_exe5102 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B4_out_c0_exe6103 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_out_c0_exe7104 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_out_c0_exe8105 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_out_c1_exe1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B4_out_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_out_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_out_unnamed_gemm_nnfW5_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_gemm_nnfW_B4_out_unnamed_gemm_nnfW5_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_gemm_nnfW_B4_out_unnamed_gemm_nnfW5_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B4_out_unnamed_gemm_nnfW5_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_out_unnamed_gemm_nnfW5_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_out_unnamed_gemm_nnfW5_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_out_unnamed_gemm_nnfW5_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_gemm_nnfW_B4_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B7_out_feedback_out_10 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gemm_nnfW_B7_out_feedback_out_11 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gemm_nnfW_B7_out_feedback_valid_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B7_out_feedback_valid_out_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B7_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B7_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B8_out_feedback_out_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gemm_nnfW_B8_out_feedback_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B8_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B8_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going19_gemm_nnfw_sr_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going19_gemm_nnfw_sr_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going19_gemm_nnfw_valid_fifo_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going19_gemm_nnfw_valid_fifo_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going23_gemm_nnfw_sr_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going23_gemm_nnfw_sr_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going23_gemm_nnfw_valid_fifo_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going23_gemm_nnfw_valid_fifo_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going27_gemm_nnfw_sr_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going27_gemm_nnfw_sr_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going27_gemm_nnfw_valid_fifo_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going27_gemm_nnfw_valid_fifo_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gemm_nnfw_sr_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gemm_nnfw_sr_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gemm_nnfw_valid_fifo_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gemm_nnfw_valid_fifo_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_gemm_nnfW0_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_gemm_nnfW0_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_gemm_nnfW1_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_gemm_nnfW1_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_gemm_nnfW2_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_gemm_nnfW2_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- dupName_0_c_i2_0gr_x(CONSTANT,17)
    dupName_0_c_i2_0gr_x_q <= "00";

    -- i_acl_pipeline_keep_going19_gemm_nnfw_valid_fifo(BLACKBOX,70)
    thei_acl_pipeline_keep_going19_gemm_nnfw_valid_fifo : i_acl_pipeline_keep_going19_gemm_nnfw_valid_fifo
    PORT MAP (
        in_data_in => dupName_0_c_i2_0gr_x_q,
        in_stall_in => bb_gemm_nnfW_B5_aunroll_x_out_stall_out_0,
        in_valid_in => i_acl_pipeline_keep_going19_gemm_nnfw_sr_out_o_valid,
        out_stall_out => i_acl_pipeline_keep_going19_gemm_nnfw_valid_fifo_out_stall_out,
        out_valid_out => i_acl_pipeline_keep_going19_gemm_nnfw_valid_fifo_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- bb_gemm_nnfW_B1_sr_1_aunroll_x(BLACKBOX,2)
    thebb_gemm_nnfW_B1_sr_1_aunroll_x : bb_gemm_nnfW_B1_sr_1
    PORT MAP (
        in_i_data_0 => VCC_q,
        in_i_stall => bb_gemm_nnfW_B1_out_stall_out_1,
        in_i_valid => bb_gemm_nnfW_B0_out_valid_out_0,
        out_o_data_0 => bb_gemm_nnfW_B1_sr_1_aunroll_x_out_o_data_0,
        out_o_stall => bb_gemm_nnfW_B1_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_gemm_nnfW_B1_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nnfW_B0(BLACKBOX,56)
    thebb_gemm_nnfW_B0 : bb_gemm_nnfW_B0
    PORT MAP (
        in_A => in_arg_A,
        in_B => in_arg_B,
        in_C => in_arg_C,
        in_K => in_arg_K,
        in_M => in_arg_M,
        in_N => in_arg_N,
        in_feedback_in_0 => bb_gemm_nnfW_B8_out_feedback_out_0,
        in_feedback_valid_in_0 => bb_gemm_nnfW_B8_out_feedback_valid_out_0,
        in_lda => in_arg_lda,
        in_ldc => in_arg_ldc,
        in_stall_in_0 => bb_gemm_nnfW_B1_sr_1_aunroll_x_out_o_stall,
        in_valid_in_0 => in_valid_in,
        out_feedback_stall_out_0 => bb_gemm_nnfW_B0_out_feedback_stall_out_0,
        out_stall_out_0 => bb_gemm_nnfW_B0_out_stall_out_0,
        out_valid_out_0 => bb_gemm_nnfW_B0_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nnfW_B8(BLACKBOX,60)
    thebb_gemm_nnfW_B8 : bb_gemm_nnfW_B8
    PORT MAP (
        in_feedback_stall_in_0 => bb_gemm_nnfW_B0_out_feedback_stall_out_0,
        in_stall_in_0 => in_stall_in,
        in_valid_in_0 => bb_gemm_nnfW_B8_sr_0_aunroll_x_out_o_valid,
        out_feedback_out_0 => bb_gemm_nnfW_B8_out_feedback_out_0,
        out_feedback_valid_out_0 => bb_gemm_nnfW_B8_out_feedback_valid_out_0,
        out_stall_out_0 => bb_gemm_nnfW_B8_out_stall_out_0,
        out_valid_out_0 => bb_gemm_nnfW_B8_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nnfW_B8_sr_0_aunroll_x(BLACKBOX,13)
    thebb_gemm_nnfW_B8_sr_0_aunroll_x : bb_gemm_nnfW_B8_sr_0
    PORT MAP (
        in_i_data_0 => GND_q,
        in_i_stall => bb_gemm_nnfW_B8_out_stall_out_0,
        in_i_valid => bb_gemm_nnfW_B7_out_valid_out_0,
        out_o_stall => bb_gemm_nnfW_B8_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_gemm_nnfW_B8_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going23_gemm_nnfw_valid_fifo(BLACKBOX,72)
    thei_acl_pipeline_keep_going23_gemm_nnfw_valid_fifo : i_acl_pipeline_keep_going23_gemm_nnfw_valid_fifo
    PORT MAP (
        in_data_in => dupName_0_c_i2_0gr_x_q,
        in_stall_in => bb_gemm_nnfW_B4_out_stall_out_0,
        in_valid_in => i_acl_pipeline_keep_going23_gemm_nnfw_sr_out_o_valid,
        out_stall_out => i_acl_pipeline_keep_going23_gemm_nnfw_valid_fifo_out_stall_out,
        out_valid_out => i_acl_pipeline_keep_going23_gemm_nnfw_valid_fifo_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_gemm_nnfW2(BLACKBOX,122)
    theloop_limiter_gemm_nnfW2 : loop_limiter_gemm_nnfW2
    PORT MAP (
        in_i_stall => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_gemm_nnfW_B5_aunroll_x_out_exiting_stall_out,
        in_i_valid => bb_gemm_nnfW_B4_out_valid_out_0,
        in_i_valid_exit => bb_gemm_nnfW_B5_aunroll_x_out_exiting_valid_out,
        out_o_stall => loop_limiter_gemm_nnfW2_out_o_stall,
        out_o_valid => loop_limiter_gemm_nnfW2_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going23_gemm_nnfw_sr(BLACKBOX,71)
    thei_acl_pipeline_keep_going23_gemm_nnfw_sr : i_acl_pipeline_keep_going23_gemm_nnfw_sr
    PORT MAP (
        in_i_data => GND_q,
        in_i_stall => i_acl_pipeline_keep_going23_gemm_nnfw_valid_fifo_out_stall_out,
        in_i_valid => bb_gemm_nnfW_B4_out_pipeline_valid_out,
        out_o_stall => i_acl_pipeline_keep_going23_gemm_nnfw_sr_out_o_stall,
        out_o_valid => i_acl_pipeline_keep_going23_gemm_nnfw_sr_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nnfW_B4(BLACKBOX,58)
    thebb_gemm_nnfW_B4 : bb_gemm_nnfW_B4
    PORT MAP (
        in_A => in_arg_A,
        in_B => in_arg_B,
        in_C => in_arg_C,
        in_K => in_arg_K,
        in_M => in_arg_M,
        in_N => in_arg_N,
        in_cmp380_RM39_0 => GND_q,
        in_cmp380_RM39_1 => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_5,
        in_cmp88_RM37_0 => GND_q,
        in_cmp88_RM37_1 => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_4,
        in_flush => in_start,
        in_forked32_0 => GND_q,
        in_forked32_1 => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_0,
        in_lda => in_arg_lda,
        in_ldc => in_arg_ldc,
        in_memdep_phi6_pop1143_0 => GND_q,
        in_memdep_phi6_pop1143_1 => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_8,
        in_mul1141_0 => dupName_0_c_i32_undef_x_q,
        in_mul1141_1 => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_6,
        in_notexit2933_0 => GND_q,
        in_notexit2933_1 => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_2,
        in_pipeline_stall_in => i_acl_pipeline_keep_going23_gemm_nnfw_sr_out_o_stall,
        in_sdiv_sh125_RM35_0 => dupName_0_c_i32_undef_x_q,
        in_sdiv_sh125_RM35_1 => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_3,
        in_stall_in_0 => loop_limiter_gemm_nnfW2_out_o_stall,
        in_unnamed_gemm_nnfW3_0 => GND_q,
        in_unnamed_gemm_nnfW3_1 => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_1,
        in_unnamed_gemm_nnfW4_0 => dupName_0_c_i33_undef_x_q,
        in_unnamed_gemm_nnfW4_1 => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_7,
        in_unnamed_gemm_nnfW5_avm_readdata => in_unnamed_gemm_nnfW5_avm_readdata,
        in_unnamed_gemm_nnfW5_avm_readdatavalid => in_unnamed_gemm_nnfW5_avm_readdatavalid,
        in_unnamed_gemm_nnfW5_avm_waitrequest => in_unnamed_gemm_nnfW5_avm_waitrequest,
        in_unnamed_gemm_nnfW5_avm_writeack => in_unnamed_gemm_nnfW5_avm_writeack,
        in_valid_in_0 => i_acl_pipeline_keep_going23_gemm_nnfw_valid_fifo_out_valid_out,
        in_valid_in_1 => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_valid,
        out_c0_exe10107 => bb_gemm_nnfW_B4_out_c0_exe10107,
        out_c0_exe11108 => bb_gemm_nnfW_B4_out_c0_exe11108,
        out_c0_exe12109 => bb_gemm_nnfW_B4_out_c0_exe12109,
        out_c0_exe13 => bb_gemm_nnfW_B4_out_c0_exe13,
        out_c0_exe198 => bb_gemm_nnfW_B4_out_c0_exe198,
        out_c0_exe299 => bb_gemm_nnfW_B4_out_c0_exe299,
        out_c0_exe3100 => bb_gemm_nnfW_B4_out_c0_exe3100,
        out_c0_exe4101 => bb_gemm_nnfW_B4_out_c0_exe4101,
        out_c0_exe5102 => bb_gemm_nnfW_B4_out_c0_exe5102,
        out_c0_exe6103 => bb_gemm_nnfW_B4_out_c0_exe6103,
        out_c0_exe7104 => bb_gemm_nnfW_B4_out_c0_exe7104,
        out_c0_exe8105 => bb_gemm_nnfW_B4_out_c0_exe8105,
        out_c1_exe1 => bb_gemm_nnfW_B4_out_c1_exe1,
        out_exiting_stall_out => bb_gemm_nnfW_B4_out_exiting_stall_out,
        out_exiting_valid_out => bb_gemm_nnfW_B4_out_exiting_valid_out,
        out_pipeline_valid_out => bb_gemm_nnfW_B4_out_pipeline_valid_out,
        out_stall_out_0 => bb_gemm_nnfW_B4_out_stall_out_0,
        out_stall_out_1 => bb_gemm_nnfW_B4_out_stall_out_1,
        out_unnamed_gemm_nnfW5_avm_address => bb_gemm_nnfW_B4_out_unnamed_gemm_nnfW5_avm_address,
        out_unnamed_gemm_nnfW5_avm_burstcount => bb_gemm_nnfW_B4_out_unnamed_gemm_nnfW5_avm_burstcount,
        out_unnamed_gemm_nnfW5_avm_byteenable => bb_gemm_nnfW_B4_out_unnamed_gemm_nnfW5_avm_byteenable,
        out_unnamed_gemm_nnfW5_avm_enable => bb_gemm_nnfW_B4_out_unnamed_gemm_nnfW5_avm_enable,
        out_unnamed_gemm_nnfW5_avm_read => bb_gemm_nnfW_B4_out_unnamed_gemm_nnfW5_avm_read,
        out_unnamed_gemm_nnfW5_avm_write => bb_gemm_nnfW_B4_out_unnamed_gemm_nnfW5_avm_write,
        out_unnamed_gemm_nnfW5_avm_writedata => bb_gemm_nnfW_B4_out_unnamed_gemm_nnfW5_avm_writedata,
        out_valid_out_0 => bb_gemm_nnfW_B4_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nnfW_B4_sr_1_aunroll_x(BLACKBOX,7)
    thebb_gemm_nnfW_B4_sr_1_aunroll_x : bb_gemm_nnfW_B4_sr_1
    PORT MAP (
        in_i_data_0 => VCC_q,
        in_i_data_1 => bb_gemm_nnfW_B3_aunroll_x_out_c0_exe11,
        in_i_data_2 => bb_gemm_nnfW_B3_aunroll_x_out_c0_exe12,
        in_i_data_3 => bb_gemm_nnfW_B3_aunroll_x_out_c0_exe163,
        in_i_data_4 => bb_gemm_nnfW_B3_aunroll_x_out_c0_exe5,
        in_i_data_5 => bb_gemm_nnfW_B3_aunroll_x_out_c0_exe6,
        in_i_data_6 => bb_gemm_nnfW_B3_aunroll_x_out_c0_exe171,
        in_i_data_7 => bb_gemm_nnfW_B3_aunroll_x_out_unnamed_gemm_nnfW2,
        in_i_data_8 => bb_gemm_nnfW_B3_aunroll_x_out_memdep_phi6_pop11,
        in_i_stall => bb_gemm_nnfW_B4_out_stall_out_1,
        in_i_valid => loop_limiter_gemm_nnfW0_out_o_valid,
        out_o_data_0 => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_data_8,
        out_o_stall => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_gemm_nnfW0(BLACKBOX,120)
    theloop_limiter_gemm_nnfW0 : loop_limiter_gemm_nnfW0
    PORT MAP (
        in_i_stall => bb_gemm_nnfW_B4_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_gemm_nnfW_B4_out_exiting_stall_out,
        in_i_valid => bb_gemm_nnfW_B3_aunroll_x_out_valid_out_0,
        in_i_valid_exit => bb_gemm_nnfW_B4_out_exiting_valid_out,
        out_o_stall => loop_limiter_gemm_nnfW0_out_o_stall,
        out_o_valid => loop_limiter_gemm_nnfW0_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going_gemm_nnfw_valid_fifo(BLACKBOX,76)
    thei_acl_pipeline_keep_going_gemm_nnfw_valid_fifo : i_acl_pipeline_keep_going_gemm_nnfw_valid_fifo
    PORT MAP (
        in_data_in => dupName_0_c_i2_0gr_x_q,
        in_stall_in => bb_gemm_nnfW_B2_aunroll_x_out_stall_out_0,
        in_valid_in => i_acl_pipeline_keep_going_gemm_nnfw_sr_out_o_valid,
        out_stall_out => i_acl_pipeline_keep_going_gemm_nnfw_valid_fifo_out_stall_out,
        out_valid_out => i_acl_pipeline_keep_going_gemm_nnfw_valid_fifo_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going_gemm_nnfw_sr(BLACKBOX,75)
    thei_acl_pipeline_keep_going_gemm_nnfw_sr : i_acl_pipeline_keep_going_gemm_nnfw_sr
    PORT MAP (
        in_i_data => GND_q,
        in_i_stall => i_acl_pipeline_keep_going_gemm_nnfw_valid_fifo_out_stall_out,
        in_i_valid => bb_gemm_nnfW_B2_aunroll_x_out_pipeline_valid_out,
        out_o_stall => i_acl_pipeline_keep_going_gemm_nnfw_sr_out_o_stall,
        out_o_valid => i_acl_pipeline_keep_going_gemm_nnfw_sr_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_gemm_nnfW1(BLACKBOX,121)
    theloop_limiter_gemm_nnfW1 : loop_limiter_gemm_nnfW1
    PORT MAP (
        in_i_stall => bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_gemm_nnfW_B2_aunroll_x_out_exiting_stall_out,
        in_i_valid => bb_gemm_nnfW_B1_out_valid_out_0,
        in_i_valid_exit => bb_gemm_nnfW_B2_aunroll_x_out_exiting_valid_out,
        out_o_stall => loop_limiter_gemm_nnfW1_out_o_stall,
        out_o_valid => loop_limiter_gemm_nnfW1_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nnfW_B2_sr_1_aunroll_x(BLACKBOX,4)
    thebb_gemm_nnfW_B2_sr_1_aunroll_x : bb_gemm_nnfW_B2_sr_1
    PORT MAP (
        in_i_data_0 => VCC_q,
        in_i_data_1 => bb_gemm_nnfW_B1_out_forked,
        in_i_data_2 => bb_gemm_nnfW_B1_out_sdiv_add124_RM,
        in_i_data_3 => bb_gemm_nnfW_B1_out_c0_exe1,
        in_i_data_4 => bb_gemm_nnfW_B1_out_c0_exe2,
        in_i_data_5 => bb_gemm_nnfW_B1_out_c0_exe3,
        in_i_data_6 => bb_gemm_nnfW_B1_out_memdep_phi_pop10,
        in_i_stall => bb_gemm_nnfW_B2_aunroll_x_out_stall_out_1,
        in_i_valid => loop_limiter_gemm_nnfW1_out_o_valid,
        out_o_data_0 => bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_data_6,
        out_o_stall => bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nnfW_B2_aunroll_x(BLACKBOX,3)
    thebb_gemm_nnfW_B2_aunroll_x : bb_gemm_nnfW_B2
    PORT MAP (
        in_A => in_arg_A,
        in_B => in_arg_B,
        in_C => in_arg_C,
        in_K => in_arg_K,
        in_M => in_arg_M,
        in_N => in_arg_N,
        in_flush => in_start,
        in_forked45_0 => GND_q,
        in_forked45_1 => bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_data_0,
        in_forked46_0 => GND_q,
        in_forked46_1 => bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_data_1,
        in_j_089_pop948_0 => dupName_0_c_i32_undef_x_q,
        in_j_089_pop948_1 => bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_data_3,
        in_lda => in_arg_lda,
        in_ldc => in_arg_ldc,
        in_memcoalesce_B_load_0_avm_readdata => in_memcoalesce_B_load_0_avm_readdata,
        in_memcoalesce_B_load_0_avm_readdatavalid => in_memcoalesce_B_load_0_avm_readdatavalid,
        in_memcoalesce_B_load_0_avm_waitrequest => in_memcoalesce_B_load_0_avm_waitrequest,
        in_memcoalesce_B_load_0_avm_writeack => in_memcoalesce_B_load_0_avm_writeack,
        in_memdep_avm_readdata => in_memdep_avm_readdata,
        in_memdep_avm_readdatavalid => in_memdep_avm_readdatavalid,
        in_memdep_avm_waitrequest => in_memdep_avm_waitrequest,
        in_memdep_avm_writeack => in_memdep_avm_writeack,
        in_memdep_phi_pop1050_0 => GND_q,
        in_memdep_phi_pop1050_1 => bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_data_6,
        in_notexit2949_0 => GND_q,
        in_notexit2949_1 => bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_data_5,
        in_pipeline_stall_in => i_acl_pipeline_keep_going_gemm_nnfw_sr_out_o_stall,
        in_sdiv_add124_RM47_0 => dupName_0_c_i32_undef_x_q,
        in_sdiv_add124_RM47_1 => bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_data_2,
        in_stall_in_0 => GND_q,
        in_stall_in_1 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_stall,
        in_unnamed_gemm_nnfW0_0 => GND_q,
        in_unnamed_gemm_nnfW0_1 => bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_data_4,
        in_valid_in_0 => i_acl_pipeline_keep_going_gemm_nnfw_valid_fifo_out_valid_out,
        in_valid_in_1 => bb_gemm_nnfW_B2_sr_1_aunroll_x_out_o_valid,
        out_c0_exit62_0 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_0,
        out_c0_exit62_1 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_1,
        out_c0_exit62_2 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_2,
        out_c0_exit62_3 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_3,
        out_c0_exit62_4 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_4,
        out_c0_exit62_5 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_5,
        out_c0_exit62_6 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_6,
        out_c0_exit62_7 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_7,
        out_c0_exit62_8 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_8,
        out_c0_exit62_9 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_9,
        out_c0_exit62_10 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_10,
        out_c0_exit62_11 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_11,
        out_c0_exit62_12 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_12,
        out_c0_exe8 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exe8,
        out_exiting_stall_out => bb_gemm_nnfW_B2_aunroll_x_out_exiting_stall_out,
        out_exiting_valid_out => bb_gemm_nnfW_B2_aunroll_x_out_exiting_valid_out,
        out_memcoalesce_B_load_0_avm_address => bb_gemm_nnfW_B2_aunroll_x_out_memcoalesce_B_load_0_avm_address,
        out_memcoalesce_B_load_0_avm_burstcount => bb_gemm_nnfW_B2_aunroll_x_out_memcoalesce_B_load_0_avm_burstcount,
        out_memcoalesce_B_load_0_avm_byteenable => bb_gemm_nnfW_B2_aunroll_x_out_memcoalesce_B_load_0_avm_byteenable,
        out_memcoalesce_B_load_0_avm_enable => bb_gemm_nnfW_B2_aunroll_x_out_memcoalesce_B_load_0_avm_enable,
        out_memcoalesce_B_load_0_avm_read => bb_gemm_nnfW_B2_aunroll_x_out_memcoalesce_B_load_0_avm_read,
        out_memcoalesce_B_load_0_avm_write => bb_gemm_nnfW_B2_aunroll_x_out_memcoalesce_B_load_0_avm_write,
        out_memcoalesce_B_load_0_avm_writedata => bb_gemm_nnfW_B2_aunroll_x_out_memcoalesce_B_load_0_avm_writedata,
        out_memdep_avm_address => bb_gemm_nnfW_B2_aunroll_x_out_memdep_avm_address,
        out_memdep_avm_burstcount => bb_gemm_nnfW_B2_aunroll_x_out_memdep_avm_burstcount,
        out_memdep_avm_byteenable => bb_gemm_nnfW_B2_aunroll_x_out_memdep_avm_byteenable,
        out_memdep_avm_enable => bb_gemm_nnfW_B2_aunroll_x_out_memdep_avm_enable,
        out_memdep_avm_read => bb_gemm_nnfW_B2_aunroll_x_out_memdep_avm_read,
        out_memdep_avm_write => bb_gemm_nnfW_B2_aunroll_x_out_memdep_avm_write,
        out_memdep_avm_writedata => bb_gemm_nnfW_B2_aunroll_x_out_memdep_avm_writedata,
        out_pipeline_valid_out => bb_gemm_nnfW_B2_aunroll_x_out_pipeline_valid_out,
        out_stall_out_0 => bb_gemm_nnfW_B2_aunroll_x_out_stall_out_0,
        out_stall_out_1 => bb_gemm_nnfW_B2_aunroll_x_out_stall_out_1,
        out_valid_out_1 => bb_gemm_nnfW_B2_aunroll_x_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nnfW_B3_sr_0_aunroll_x(BLACKBOX,6)
    thebb_gemm_nnfW_B3_sr_0_aunroll_x : bb_gemm_nnfW_B3_sr_0
    PORT MAP (
        in_i_data_0 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_0,
        in_i_data_1 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_1,
        in_i_data_2 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_2,
        in_i_data_3 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_3,
        in_i_data_4 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_4,
        in_i_data_5 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_5,
        in_i_data_6 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_6,
        in_i_data_7 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_7,
        in_i_data_8 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_8,
        in_i_data_9 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_9,
        in_i_data_10 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_10,
        in_i_data_11 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_11,
        in_i_data_12 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exit62_12,
        in_i_data_13 => bb_gemm_nnfW_B2_aunroll_x_out_c0_exe8,
        in_i_stall => bb_gemm_nnfW_B3_aunroll_x_out_stall_out_0,
        in_i_valid => bb_gemm_nnfW_B2_aunroll_x_out_valid_out_1,
        out_o_data_0 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_13,
        out_o_stall => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nnfW_B3_aunroll_x(BLACKBOX,5)
    thebb_gemm_nnfW_B3_aunroll_x : bb_gemm_nnfW_B3
    PORT MAP (
        in_c0_exit621_0_0 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_0,
        in_c0_exit621_0_1 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_1,
        in_c0_exit621_0_2 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_2,
        in_c0_exit621_0_3 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_3,
        in_c0_exit621_0_4 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_4,
        in_c0_exit621_0_5 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_5,
        in_c0_exit621_0_6 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_6,
        in_c0_exit621_0_7 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_7,
        in_c0_exit621_0_8 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_8,
        in_c0_exit621_0_9 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_9,
        in_c0_exit621_0_10 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_10,
        in_c0_exit621_0_11 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_11,
        in_c0_exit621_0_12 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_12,
        in_A => in_arg_A,
        in_B => in_arg_B,
        in_C => in_arg_C,
        in_K => in_arg_K,
        in_M => in_arg_M,
        in_N => in_arg_N,
        in_c0_exe82_0 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_data_13,
        in_feedback_in_11 => bb_gemm_nnfW_B7_out_feedback_out_11,
        in_feedback_valid_in_11 => bb_gemm_nnfW_B7_out_feedback_valid_out_11,
        in_lda => in_arg_lda,
        in_ldc => in_arg_ldc,
        in_stall_in_0 => loop_limiter_gemm_nnfW0_out_o_stall,
        in_valid_in_0 => bb_gemm_nnfW_B3_sr_0_aunroll_x_out_o_valid,
        out_c0_exe11 => bb_gemm_nnfW_B3_aunroll_x_out_c0_exe11,
        out_c0_exe12 => bb_gemm_nnfW_B3_aunroll_x_out_c0_exe12,
        out_c0_exe163 => bb_gemm_nnfW_B3_aunroll_x_out_c0_exe163,
        out_c0_exe171 => bb_gemm_nnfW_B3_aunroll_x_out_c0_exe171,
        out_c0_exe5 => bb_gemm_nnfW_B3_aunroll_x_out_c0_exe5,
        out_c0_exe6 => bb_gemm_nnfW_B3_aunroll_x_out_c0_exe6,
        out_feedback_stall_out_11 => bb_gemm_nnfW_B3_aunroll_x_out_feedback_stall_out_11,
        out_memdep_phi6_pop11 => bb_gemm_nnfW_B3_aunroll_x_out_memdep_phi6_pop11,
        out_stall_out_0 => bb_gemm_nnfW_B3_aunroll_x_out_stall_out_0,
        out_unnamed_gemm_nnfW2 => bb_gemm_nnfW_B3_aunroll_x_out_unnamed_gemm_nnfW2,
        out_valid_out_0 => bb_gemm_nnfW_B3_aunroll_x_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going27_gemm_nnfw_valid_fifo(BLACKBOX,74)
    thei_acl_pipeline_keep_going27_gemm_nnfw_valid_fifo : i_acl_pipeline_keep_going27_gemm_nnfw_valid_fifo
    PORT MAP (
        in_data_in => dupName_0_c_i2_0gr_x_q,
        in_stall_in => bb_gemm_nnfW_B1_out_stall_out_0,
        in_valid_in => i_acl_pipeline_keep_going27_gemm_nnfw_sr_out_o_valid,
        out_stall_out => i_acl_pipeline_keep_going27_gemm_nnfw_valid_fifo_out_stall_out,
        out_valid_out => i_acl_pipeline_keep_going27_gemm_nnfw_valid_fifo_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going27_gemm_nnfw_sr(BLACKBOX,73)
    thei_acl_pipeline_keep_going27_gemm_nnfw_sr : i_acl_pipeline_keep_going27_gemm_nnfw_sr
    PORT MAP (
        in_i_data => GND_q,
        in_i_stall => i_acl_pipeline_keep_going27_gemm_nnfw_valid_fifo_out_stall_out,
        in_i_valid => bb_gemm_nnfW_B1_out_pipeline_valid_out,
        out_o_stall => i_acl_pipeline_keep_going27_gemm_nnfw_sr_out_o_stall,
        out_o_valid => i_acl_pipeline_keep_going27_gemm_nnfw_sr_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nnfW_B1(BLACKBOX,57)
    thebb_gemm_nnfW_B1 : bb_gemm_nnfW_B1
    PORT MAP (
        in_A => in_arg_A,
        in_B => in_arg_B,
        in_C => in_arg_C,
        in_K => in_arg_K,
        in_M => in_arg_M,
        in_N => in_arg_N,
        in_feedback_in_10 => bb_gemm_nnfW_B7_out_feedback_out_10,
        in_feedback_valid_in_10 => bb_gemm_nnfW_B7_out_feedback_valid_out_10,
        in_forked_0 => GND_q,
        in_forked_1 => bb_gemm_nnfW_B1_sr_1_aunroll_x_out_o_data_0,
        in_lda => in_arg_lda,
        in_ldc => in_arg_ldc,
        in_pipeline_stall_in => i_acl_pipeline_keep_going27_gemm_nnfw_sr_out_o_stall,
        in_stall_in_0 => loop_limiter_gemm_nnfW1_out_o_stall,
        in_valid_in_0 => i_acl_pipeline_keep_going27_gemm_nnfw_valid_fifo_out_valid_out,
        in_valid_in_1 => bb_gemm_nnfW_B1_sr_1_aunroll_x_out_o_valid,
        out_c0_exe1 => bb_gemm_nnfW_B1_out_c0_exe1,
        out_c0_exe2 => bb_gemm_nnfW_B1_out_c0_exe2,
        out_c0_exe3 => bb_gemm_nnfW_B1_out_c0_exe3,
        out_feedback_stall_out_10 => bb_gemm_nnfW_B1_out_feedback_stall_out_10,
        out_forked => bb_gemm_nnfW_B1_out_forked,
        out_memdep_phi_pop10 => bb_gemm_nnfW_B1_out_memdep_phi_pop10,
        out_pipeline_valid_out => bb_gemm_nnfW_B1_out_pipeline_valid_out,
        out_sdiv_add124_RM => bb_gemm_nnfW_B1_out_sdiv_add124_RM,
        out_stall_out_0 => bb_gemm_nnfW_B1_out_stall_out_0,
        out_stall_out_1 => bb_gemm_nnfW_B1_out_stall_out_1,
        out_valid_out_0 => bb_gemm_nnfW_B1_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nnfW_B7(BLACKBOX,59)
    thebb_gemm_nnfW_B7 : bb_gemm_nnfW_B7
    PORT MAP (
        in_A => in_arg_A,
        in_B => in_arg_B,
        in_C => in_arg_C,
        in_K => in_arg_K,
        in_M => in_arg_M,
        in_N => in_arg_N,
        in_c0_exe71514_0 => bb_gemm_nnfW_B7_sr_0_aunroll_x_out_o_data_0,
        in_c0_exe81526_0 => bb_gemm_nnfW_B7_sr_0_aunroll_x_out_o_data_1,
        in_c1_exe11719_0 => bb_gemm_nnfW_B7_sr_0_aunroll_x_out_o_data_2,
        in_feedback_stall_in_10 => bb_gemm_nnfW_B1_out_feedback_stall_out_10,
        in_feedback_stall_in_11 => bb_gemm_nnfW_B3_aunroll_x_out_feedback_stall_out_11,
        in_lda => in_arg_lda,
        in_ldc => in_arg_ldc,
        in_memdep_511_0 => bb_gemm_nnfW_B7_sr_0_aunroll_x_out_o_data_3,
        in_stall_in_0 => bb_gemm_nnfW_B8_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => GND_q,
        in_valid_in_0 => bb_gemm_nnfW_B7_sr_0_aunroll_x_out_o_valid,
        out_feedback_out_10 => bb_gemm_nnfW_B7_out_feedback_out_10,
        out_feedback_out_11 => bb_gemm_nnfW_B7_out_feedback_out_11,
        out_feedback_valid_out_10 => bb_gemm_nnfW_B7_out_feedback_valid_out_10,
        out_feedback_valid_out_11 => bb_gemm_nnfW_B7_out_feedback_valid_out_11,
        out_stall_out_0 => bb_gemm_nnfW_B7_out_stall_out_0,
        out_valid_out_0 => bb_gemm_nnfW_B7_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nnfW_B7_sr_0_aunroll_x(BLACKBOX,12)
    thebb_gemm_nnfW_B7_sr_0_aunroll_x : bb_gemm_nnfW_B7_sr_0
    PORT MAP (
        in_i_data_0 => bb_gemm_nnfW_B6_aunroll_x_out_c0_exe71515,
        in_i_data_1 => bb_gemm_nnfW_B6_aunroll_x_out_c0_exe81527,
        in_i_data_2 => bb_gemm_nnfW_B6_aunroll_x_out_c1_exe117110,
        in_i_data_3 => bb_gemm_nnfW_B6_aunroll_x_out_memdep_5,
        in_i_stall => bb_gemm_nnfW_B7_out_stall_out_0,
        in_i_valid => bb_gemm_nnfW_B6_aunroll_x_out_valid_out_0,
        out_o_data_0 => bb_gemm_nnfW_B7_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_gemm_nnfW_B7_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_gemm_nnfW_B7_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_gemm_nnfW_B7_sr_0_aunroll_x_out_o_data_3,
        out_o_stall => bb_gemm_nnfW_B7_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_gemm_nnfW_B7_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nnfW_B6_aunroll_x(BLACKBOX,10)
    thebb_gemm_nnfW_B6_aunroll_x : bb_gemm_nnfW_B6
    PORT MAP (
        in_c0_exit1443_0_0 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_0,
        in_c0_exit1443_0_1 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_1,
        in_c0_exit1443_0_2 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_2,
        in_c0_exit1443_0_3 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_3,
        in_c0_exit1443_0_4 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_4,
        in_c0_exit1443_0_5 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_5,
        in_c0_exit1443_0_6 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_6,
        in_c0_exit1443_0_7 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_7,
        in_c0_exit1443_0_8 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_8,
        in_c0_exit1443_0_9 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_9,
        in_c0_exit1443_0_10 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_10,
        in_c0_exit1443_0_11 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_11,
        in_c1_exit1708_0_0 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_14,
        in_c1_exit1708_0_1 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_15,
        in_c1_exit1708_0_2 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_16,
        in_A => in_arg_A,
        in_B => in_arg_B,
        in_C => in_arg_C,
        in_K => in_arg_K,
        in_M => in_arg_M,
        in_N => in_arg_N,
        in_c0_exe71515_0 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_12,
        in_c0_exe81527_0 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_13,
        in_c1_exe117110_0 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_17,
        in_flush => in_start,
        in_lda => in_arg_lda,
        in_ldc => in_arg_ldc,
        in_memdep_5_avm_readdata => in_memdep_5_avm_readdata,
        in_memdep_5_avm_readdatavalid => in_memdep_5_avm_readdatavalid,
        in_memdep_5_avm_waitrequest => in_memdep_5_avm_waitrequest,
        in_memdep_5_avm_writeack => in_memdep_5_avm_writeack,
        in_stall_in_0 => bb_gemm_nnfW_B7_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => GND_q,
        in_valid_in_0 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_valid,
        out_c0_exe71515 => bb_gemm_nnfW_B6_aunroll_x_out_c0_exe71515,
        out_c0_exe81527 => bb_gemm_nnfW_B6_aunroll_x_out_c0_exe81527,
        out_c1_exe117110 => bb_gemm_nnfW_B6_aunroll_x_out_c1_exe117110,
        out_lsu_memdep_5_o_active => bb_gemm_nnfW_B6_aunroll_x_out_lsu_memdep_5_o_active,
        out_memdep_5 => bb_gemm_nnfW_B6_aunroll_x_out_memdep_5,
        out_memdep_5_avm_address => bb_gemm_nnfW_B6_aunroll_x_out_memdep_5_avm_address,
        out_memdep_5_avm_burstcount => bb_gemm_nnfW_B6_aunroll_x_out_memdep_5_avm_burstcount,
        out_memdep_5_avm_byteenable => bb_gemm_nnfW_B6_aunroll_x_out_memdep_5_avm_byteenable,
        out_memdep_5_avm_enable => bb_gemm_nnfW_B6_aunroll_x_out_memdep_5_avm_enable,
        out_memdep_5_avm_read => bb_gemm_nnfW_B6_aunroll_x_out_memdep_5_avm_read,
        out_memdep_5_avm_write => bb_gemm_nnfW_B6_aunroll_x_out_memdep_5_avm_write,
        out_memdep_5_avm_writedata => bb_gemm_nnfW_B6_aunroll_x_out_memdep_5_avm_writedata,
        out_stall_out_0 => bb_gemm_nnfW_B6_aunroll_x_out_stall_out_0,
        out_valid_out_0 => bb_gemm_nnfW_B6_aunroll_x_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nnfW_B6_sr_0_aunroll_x(BLACKBOX,11)
    thebb_gemm_nnfW_B6_sr_0_aunroll_x : bb_gemm_nnfW_B6_sr_0
    PORT MAP (
        in_i_data_0 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_0,
        in_i_data_1 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_1,
        in_i_data_2 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_2,
        in_i_data_3 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_3,
        in_i_data_4 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_4,
        in_i_data_5 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_5,
        in_i_data_6 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_6,
        in_i_data_7 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_7,
        in_i_data_8 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_8,
        in_i_data_9 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_9,
        in_i_data_10 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_10,
        in_i_data_11 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_11,
        in_i_data_12 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exe7151,
        in_i_data_13 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exe8152,
        in_i_data_14 => bb_gemm_nnfW_B5_aunroll_x_out_c1_exit170_0,
        in_i_data_15 => bb_gemm_nnfW_B5_aunroll_x_out_c1_exit170_1,
        in_i_data_16 => bb_gemm_nnfW_B5_aunroll_x_out_c1_exit170_2,
        in_i_data_17 => bb_gemm_nnfW_B5_aunroll_x_out_c1_exe1171,
        in_i_stall => bb_gemm_nnfW_B6_aunroll_x_out_stall_out_0,
        in_i_valid => bb_gemm_nnfW_B5_aunroll_x_out_valid_out_1,
        out_o_data_0 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_data_17,
        out_o_stall => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going19_gemm_nnfw_sr(BLACKBOX,69)
    thei_acl_pipeline_keep_going19_gemm_nnfw_sr : i_acl_pipeline_keep_going19_gemm_nnfw_sr
    PORT MAP (
        in_i_data => GND_q,
        in_i_stall => i_acl_pipeline_keep_going19_gemm_nnfw_valid_fifo_out_stall_out,
        in_i_valid => bb_gemm_nnfW_B5_aunroll_x_out_pipeline_valid_out,
        out_o_stall => i_acl_pipeline_keep_going19_gemm_nnfw_sr_out_o_stall,
        out_o_valid => i_acl_pipeline_keep_going19_gemm_nnfw_sr_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_c_i32_undef_x(CONSTANT,18)
    dupName_0_c_i32_undef_x_q <= "00000000000000000000000000000000";

    -- dupName_0_c_i33_undef_x(CONSTANT,19)
    dupName_0_c_i33_undef_x_q <= "000000000000000000000000000000000";

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- bb_gemm_nnfW_B5_sr_1_aunroll_x(BLACKBOX,9)
    thebb_gemm_nnfW_B5_sr_1_aunroll_x : bb_gemm_nnfW_B5_sr_1
    PORT MAP (
        in_i_data_0 => bb_gemm_nnfW_B4_out_c0_exe13,
        in_i_data_1 => bb_gemm_nnfW_B4_out_c1_exe1,
        in_i_data_2 => bb_gemm_nnfW_B4_out_c0_exe10107,
        in_i_data_3 => bb_gemm_nnfW_B4_out_c0_exe11108,
        in_i_data_4 => bb_gemm_nnfW_B4_out_c0_exe4101,
        in_i_data_5 => bb_gemm_nnfW_B4_out_c0_exe6103,
        in_i_data_6 => bb_gemm_nnfW_B4_out_c0_exe12109,
        in_i_data_7 => bb_gemm_nnfW_B4_out_c0_exe198,
        in_i_data_8 => bb_gemm_nnfW_B4_out_c0_exe13,
        in_i_data_9 => bb_gemm_nnfW_B4_out_c0_exe3100,
        in_i_data_10 => VCC_q,
        in_i_data_11 => bb_gemm_nnfW_B4_out_c0_exe299,
        in_i_data_12 => bb_gemm_nnfW_B4_out_c1_exe1,
        in_i_data_13 => bb_gemm_nnfW_B4_out_c0_exe5102,
        in_i_data_14 => bb_gemm_nnfW_B4_out_c0_exe7104,
        in_i_data_15 => bb_gemm_nnfW_B4_out_c0_exe8105,
        in_i_stall => bb_gemm_nnfW_B5_aunroll_x_out_stall_out_1,
        in_i_valid => loop_limiter_gemm_nnfW2_out_o_valid,
        out_o_data_0 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_15,
        out_o_stall => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_c_i64_undef_x(CONSTANT,20)
    dupName_0_c_i64_undef_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- bb_gemm_nnfW_B5_aunroll_x(BLACKBOX,8)
    thebb_gemm_nnfW_B5_aunroll_x : bb_gemm_nnfW_B5
    PORT MAP (
        in_A => in_arg_A,
        in_B => in_arg_B,
        in_C => in_arg_C,
        in_Cn_285_rep_0 => dupName_0_c_i64_undef_x_q,
        in_Cn_285_rep_1 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_1,
        in_K => in_arg_K,
        in_M => in_arg_M,
        in_N => in_arg_N,
        in_arrayidx1452_0 => dupName_0_c_i64_undef_x_q,
        in_arrayidx1452_1 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_11,
        in_cmp380_RM40_0 => GND_q,
        in_cmp380_RM40_1 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_6,
        in_cmp88_RM38_0 => GND_q,
        in_cmp88_RM38_1 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_5,
        in_conv15_hf_tofpc53_0 => dupName_0_c_i64_undef_x_q,
        in_conv15_hf_tofpc53_1 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_12,
        in_flush => in_start,
        in_forked51_0 => GND_q,
        in_forked51_1 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_10,
        in_fpgaindvars_iv_0 => dupName_0_c_i33_undef_x_q,
        in_fpgaindvars_iv_1 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_0,
        in_lda => in_arg_lda,
        in_ldc => in_arg_ldc,
        in_memcoalesce_A_load_0_avm_readdata => in_memcoalesce_A_load_0_avm_readdata,
        in_memcoalesce_A_load_0_avm_readdatavalid => in_memcoalesce_A_load_0_avm_readdatavalid,
        in_memcoalesce_A_load_0_avm_waitrequest => in_memcoalesce_A_load_0_avm_waitrequest,
        in_memcoalesce_A_load_0_avm_writeack => in_memcoalesce_A_load_0_avm_writeack,
        in_memdep_phi6_pop1144_0 => GND_q,
        in_memdep_phi6_pop1144_1 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_9,
        in_mul1142_0 => dupName_0_c_i32_undef_x_q,
        in_mul1142_1 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_7,
        in_mul2054_0 => dupName_0_c_i32_undef_x_q,
        in_mul2054_1 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_13,
        in_notexit2934_0 => GND_q,
        in_notexit2934_1 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_3,
        in_phi_decision156_xor_RM1655_0 => GND_q,
        in_phi_decision156_xor_RM1655_1 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_14,
        in_pipeline_stall_in => i_acl_pipeline_keep_going19_gemm_nnfw_sr_out_o_stall,
        in_sdiv_sh125_RM36_0 => dupName_0_c_i32_undef_x_q,
        in_sdiv_sh125_RM36_1 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_4,
        in_stall_in_0 => GND_q,
        in_stall_in_1 => bb_gemm_nnfW_B6_sr_0_aunroll_x_out_o_stall,
        in_unnamed_gemm_nnfW6_0 => GND_q,
        in_unnamed_gemm_nnfW6_1 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_2,
        in_unnamed_gemm_nnfW7_0 => dupName_0_c_i33_undef_x_q,
        in_unnamed_gemm_nnfW7_1 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_8,
        in_unnamed_gemm_nnfW8_0 => GND_q,
        in_unnamed_gemm_nnfW8_1 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_data_15,
        in_unnamed_gemm_nnfW9_avm_readdata => in_unnamed_gemm_nnfW9_avm_readdata,
        in_unnamed_gemm_nnfW9_avm_readdatavalid => in_unnamed_gemm_nnfW9_avm_readdatavalid,
        in_unnamed_gemm_nnfW9_avm_waitrequest => in_unnamed_gemm_nnfW9_avm_waitrequest,
        in_unnamed_gemm_nnfW9_avm_writeack => in_unnamed_gemm_nnfW9_avm_writeack,
        in_valid_in_0 => i_acl_pipeline_keep_going19_gemm_nnfw_valid_fifo_out_valid_out,
        in_valid_in_1 => bb_gemm_nnfW_B5_sr_1_aunroll_x_out_o_valid,
        out_c0_exit144_0 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_0,
        out_c0_exit144_1 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_1,
        out_c0_exit144_2 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_2,
        out_c0_exit144_3 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_3,
        out_c0_exit144_4 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_4,
        out_c0_exit144_5 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_5,
        out_c0_exit144_6 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_6,
        out_c0_exit144_7 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_7,
        out_c0_exit144_8 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_8,
        out_c0_exit144_9 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_9,
        out_c0_exit144_10 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_10,
        out_c0_exit144_11 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exit144_11,
        out_c1_exit170_0 => bb_gemm_nnfW_B5_aunroll_x_out_c1_exit170_0,
        out_c1_exit170_1 => bb_gemm_nnfW_B5_aunroll_x_out_c1_exit170_1,
        out_c1_exit170_2 => bb_gemm_nnfW_B5_aunroll_x_out_c1_exit170_2,
        out_c0_exe7151 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exe7151,
        out_c0_exe8152 => bb_gemm_nnfW_B5_aunroll_x_out_c0_exe8152,
        out_c1_exe1171 => bb_gemm_nnfW_B5_aunroll_x_out_c1_exe1171,
        out_exiting_stall_out => bb_gemm_nnfW_B5_aunroll_x_out_exiting_stall_out,
        out_exiting_valid_out => bb_gemm_nnfW_B5_aunroll_x_out_exiting_valid_out,
        out_memcoalesce_A_load_0_avm_address => bb_gemm_nnfW_B5_aunroll_x_out_memcoalesce_A_load_0_avm_address,
        out_memcoalesce_A_load_0_avm_burstcount => bb_gemm_nnfW_B5_aunroll_x_out_memcoalesce_A_load_0_avm_burstcount,
        out_memcoalesce_A_load_0_avm_byteenable => bb_gemm_nnfW_B5_aunroll_x_out_memcoalesce_A_load_0_avm_byteenable,
        out_memcoalesce_A_load_0_avm_enable => bb_gemm_nnfW_B5_aunroll_x_out_memcoalesce_A_load_0_avm_enable,
        out_memcoalesce_A_load_0_avm_read => bb_gemm_nnfW_B5_aunroll_x_out_memcoalesce_A_load_0_avm_read,
        out_memcoalesce_A_load_0_avm_write => bb_gemm_nnfW_B5_aunroll_x_out_memcoalesce_A_load_0_avm_write,
        out_memcoalesce_A_load_0_avm_writedata => bb_gemm_nnfW_B5_aunroll_x_out_memcoalesce_A_load_0_avm_writedata,
        out_pipeline_valid_out => bb_gemm_nnfW_B5_aunroll_x_out_pipeline_valid_out,
        out_stall_out_0 => bb_gemm_nnfW_B5_aunroll_x_out_stall_out_0,
        out_stall_out_1 => bb_gemm_nnfW_B5_aunroll_x_out_stall_out_1,
        out_unnamed_gemm_nnfW9_avm_address => bb_gemm_nnfW_B5_aunroll_x_out_unnamed_gemm_nnfW9_avm_address,
        out_unnamed_gemm_nnfW9_avm_burstcount => bb_gemm_nnfW_B5_aunroll_x_out_unnamed_gemm_nnfW9_avm_burstcount,
        out_unnamed_gemm_nnfW9_avm_byteenable => bb_gemm_nnfW_B5_aunroll_x_out_unnamed_gemm_nnfW9_avm_byteenable,
        out_unnamed_gemm_nnfW9_avm_enable => bb_gemm_nnfW_B5_aunroll_x_out_unnamed_gemm_nnfW9_avm_enable,
        out_unnamed_gemm_nnfW9_avm_read => bb_gemm_nnfW_B5_aunroll_x_out_unnamed_gemm_nnfW9_avm_read,
        out_unnamed_gemm_nnfW9_avm_write => bb_gemm_nnfW_B5_aunroll_x_out_unnamed_gemm_nnfW9_avm_write,
        out_unnamed_gemm_nnfW9_avm_writedata => bb_gemm_nnfW_B5_aunroll_x_out_unnamed_gemm_nnfW9_avm_writedata,
        out_valid_out_1 => bb_gemm_nnfW_B5_aunroll_x_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_memcoalesce_A_load_0_avm_address(GPOUT,123)
    out_memcoalesce_A_load_0_avm_address <= bb_gemm_nnfW_B5_aunroll_x_out_memcoalesce_A_load_0_avm_address;

    -- out_memcoalesce_A_load_0_avm_burstcount(GPOUT,124)
    out_memcoalesce_A_load_0_avm_burstcount <= bb_gemm_nnfW_B5_aunroll_x_out_memcoalesce_A_load_0_avm_burstcount;

    -- out_memcoalesce_A_load_0_avm_byteenable(GPOUT,125)
    out_memcoalesce_A_load_0_avm_byteenable <= bb_gemm_nnfW_B5_aunroll_x_out_memcoalesce_A_load_0_avm_byteenable;

    -- out_memcoalesce_A_load_0_avm_enable(GPOUT,126)
    out_memcoalesce_A_load_0_avm_enable <= bb_gemm_nnfW_B5_aunroll_x_out_memcoalesce_A_load_0_avm_enable;

    -- out_memcoalesce_A_load_0_avm_read(GPOUT,127)
    out_memcoalesce_A_load_0_avm_read <= bb_gemm_nnfW_B5_aunroll_x_out_memcoalesce_A_load_0_avm_read;

    -- out_memcoalesce_A_load_0_avm_write(GPOUT,128)
    out_memcoalesce_A_load_0_avm_write <= bb_gemm_nnfW_B5_aunroll_x_out_memcoalesce_A_load_0_avm_write;

    -- out_memcoalesce_A_load_0_avm_writedata(GPOUT,129)
    out_memcoalesce_A_load_0_avm_writedata <= bb_gemm_nnfW_B5_aunroll_x_out_memcoalesce_A_load_0_avm_writedata;

    -- out_memcoalesce_B_load_0_avm_address(GPOUT,130)
    out_memcoalesce_B_load_0_avm_address <= bb_gemm_nnfW_B2_aunroll_x_out_memcoalesce_B_load_0_avm_address;

    -- out_memcoalesce_B_load_0_avm_burstcount(GPOUT,131)
    out_memcoalesce_B_load_0_avm_burstcount <= bb_gemm_nnfW_B2_aunroll_x_out_memcoalesce_B_load_0_avm_burstcount;

    -- out_memcoalesce_B_load_0_avm_byteenable(GPOUT,132)
    out_memcoalesce_B_load_0_avm_byteenable <= bb_gemm_nnfW_B2_aunroll_x_out_memcoalesce_B_load_0_avm_byteenable;

    -- out_memcoalesce_B_load_0_avm_enable(GPOUT,133)
    out_memcoalesce_B_load_0_avm_enable <= bb_gemm_nnfW_B2_aunroll_x_out_memcoalesce_B_load_0_avm_enable;

    -- out_memcoalesce_B_load_0_avm_read(GPOUT,134)
    out_memcoalesce_B_load_0_avm_read <= bb_gemm_nnfW_B2_aunroll_x_out_memcoalesce_B_load_0_avm_read;

    -- out_memcoalesce_B_load_0_avm_write(GPOUT,135)
    out_memcoalesce_B_load_0_avm_write <= bb_gemm_nnfW_B2_aunroll_x_out_memcoalesce_B_load_0_avm_write;

    -- out_memcoalesce_B_load_0_avm_writedata(GPOUT,136)
    out_memcoalesce_B_load_0_avm_writedata <= bb_gemm_nnfW_B2_aunroll_x_out_memcoalesce_B_load_0_avm_writedata;

    -- out_memdep_5_avm_address(GPOUT,137)
    out_memdep_5_avm_address <= bb_gemm_nnfW_B6_aunroll_x_out_memdep_5_avm_address;

    -- out_memdep_5_avm_burstcount(GPOUT,138)
    out_memdep_5_avm_burstcount <= bb_gemm_nnfW_B6_aunroll_x_out_memdep_5_avm_burstcount;

    -- out_memdep_5_avm_byteenable(GPOUT,139)
    out_memdep_5_avm_byteenable <= bb_gemm_nnfW_B6_aunroll_x_out_memdep_5_avm_byteenable;

    -- out_memdep_5_avm_enable(GPOUT,140)
    out_memdep_5_avm_enable <= bb_gemm_nnfW_B6_aunroll_x_out_memdep_5_avm_enable;

    -- out_memdep_5_avm_read(GPOUT,141)
    out_memdep_5_avm_read <= bb_gemm_nnfW_B6_aunroll_x_out_memdep_5_avm_read;

    -- out_memdep_5_avm_write(GPOUT,142)
    out_memdep_5_avm_write <= bb_gemm_nnfW_B6_aunroll_x_out_memdep_5_avm_write;

    -- out_memdep_5_avm_writedata(GPOUT,143)
    out_memdep_5_avm_writedata <= bb_gemm_nnfW_B6_aunroll_x_out_memdep_5_avm_writedata;

    -- out_memdep_avm_address(GPOUT,144)
    out_memdep_avm_address <= bb_gemm_nnfW_B2_aunroll_x_out_memdep_avm_address;

    -- out_memdep_avm_burstcount(GPOUT,145)
    out_memdep_avm_burstcount <= bb_gemm_nnfW_B2_aunroll_x_out_memdep_avm_burstcount;

    -- out_memdep_avm_byteenable(GPOUT,146)
    out_memdep_avm_byteenable <= bb_gemm_nnfW_B2_aunroll_x_out_memdep_avm_byteenable;

    -- out_memdep_avm_enable(GPOUT,147)
    out_memdep_avm_enable <= bb_gemm_nnfW_B2_aunroll_x_out_memdep_avm_enable;

    -- out_memdep_avm_read(GPOUT,148)
    out_memdep_avm_read <= bb_gemm_nnfW_B2_aunroll_x_out_memdep_avm_read;

    -- out_memdep_avm_write(GPOUT,149)
    out_memdep_avm_write <= bb_gemm_nnfW_B2_aunroll_x_out_memdep_avm_write;

    -- out_memdep_avm_writedata(GPOUT,150)
    out_memdep_avm_writedata <= bb_gemm_nnfW_B2_aunroll_x_out_memdep_avm_writedata;

    -- out_o_active_memdep_5(GPOUT,151)
    out_o_active_memdep_5 <= bb_gemm_nnfW_B6_aunroll_x_out_lsu_memdep_5_o_active;

    -- out_stall_out(GPOUT,152)
    out_stall_out <= bb_gemm_nnfW_B0_out_stall_out_0;

    -- out_unnamed_gemm_nnfW5_avm_address(GPOUT,153)
    out_unnamed_gemm_nnfW5_avm_address <= bb_gemm_nnfW_B4_out_unnamed_gemm_nnfW5_avm_address;

    -- out_unnamed_gemm_nnfW5_avm_burstcount(GPOUT,154)
    out_unnamed_gemm_nnfW5_avm_burstcount <= bb_gemm_nnfW_B4_out_unnamed_gemm_nnfW5_avm_burstcount;

    -- out_unnamed_gemm_nnfW5_avm_byteenable(GPOUT,155)
    out_unnamed_gemm_nnfW5_avm_byteenable <= bb_gemm_nnfW_B4_out_unnamed_gemm_nnfW5_avm_byteenable;

    -- out_unnamed_gemm_nnfW5_avm_enable(GPOUT,156)
    out_unnamed_gemm_nnfW5_avm_enable <= bb_gemm_nnfW_B4_out_unnamed_gemm_nnfW5_avm_enable;

    -- out_unnamed_gemm_nnfW5_avm_read(GPOUT,157)
    out_unnamed_gemm_nnfW5_avm_read <= bb_gemm_nnfW_B4_out_unnamed_gemm_nnfW5_avm_read;

    -- out_unnamed_gemm_nnfW5_avm_write(GPOUT,158)
    out_unnamed_gemm_nnfW5_avm_write <= bb_gemm_nnfW_B4_out_unnamed_gemm_nnfW5_avm_write;

    -- out_unnamed_gemm_nnfW5_avm_writedata(GPOUT,159)
    out_unnamed_gemm_nnfW5_avm_writedata <= bb_gemm_nnfW_B4_out_unnamed_gemm_nnfW5_avm_writedata;

    -- out_unnamed_gemm_nnfW9_avm_address(GPOUT,160)
    out_unnamed_gemm_nnfW9_avm_address <= bb_gemm_nnfW_B5_aunroll_x_out_unnamed_gemm_nnfW9_avm_address;

    -- out_unnamed_gemm_nnfW9_avm_burstcount(GPOUT,161)
    out_unnamed_gemm_nnfW9_avm_burstcount <= bb_gemm_nnfW_B5_aunroll_x_out_unnamed_gemm_nnfW9_avm_burstcount;

    -- out_unnamed_gemm_nnfW9_avm_byteenable(GPOUT,162)
    out_unnamed_gemm_nnfW9_avm_byteenable <= bb_gemm_nnfW_B5_aunroll_x_out_unnamed_gemm_nnfW9_avm_byteenable;

    -- out_unnamed_gemm_nnfW9_avm_enable(GPOUT,163)
    out_unnamed_gemm_nnfW9_avm_enable <= bb_gemm_nnfW_B5_aunroll_x_out_unnamed_gemm_nnfW9_avm_enable;

    -- out_unnamed_gemm_nnfW9_avm_read(GPOUT,164)
    out_unnamed_gemm_nnfW9_avm_read <= bb_gemm_nnfW_B5_aunroll_x_out_unnamed_gemm_nnfW9_avm_read;

    -- out_unnamed_gemm_nnfW9_avm_write(GPOUT,165)
    out_unnamed_gemm_nnfW9_avm_write <= bb_gemm_nnfW_B5_aunroll_x_out_unnamed_gemm_nnfW9_avm_write;

    -- out_unnamed_gemm_nnfW9_avm_writedata(GPOUT,166)
    out_unnamed_gemm_nnfW9_avm_writedata <= bb_gemm_nnfW_B5_aunroll_x_out_unnamed_gemm_nnfW9_avm_writedata;

    -- out_valid_out(GPOUT,167)
    out_valid_out <= bb_gemm_nnfW_B8_out_valid_out_0;

END normal;
