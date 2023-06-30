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

-- VHDL created from gemm_nn9W_function
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

entity gemm_nn9W_function is
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
        in_memcoalesce_null_load_045_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memcoalesce_null_load_045_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_045_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_045_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_051_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memcoalesce_null_load_051_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_051_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_051_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_0_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memcoalesce_null_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_null_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_259_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_259_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_259_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_259_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_264_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_264_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_264_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_264_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_276_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memdep_276_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_276_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_276_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_start : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W2_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_gemm_nn9W2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W2_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_memcoalesce_null_load_045_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_null_load_045_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_045_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memcoalesce_null_load_045_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_045_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_045_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_045_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memcoalesce_null_load_051_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_null_load_051_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_051_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memcoalesce_null_load_051_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_051_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_051_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_051_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memcoalesce_null_load_0_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_null_load_0_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_0_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memcoalesce_null_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_null_load_0_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_259_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_259_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_259_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_259_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_259_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_259_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_259_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_264_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_264_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_264_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_264_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_264_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_264_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_264_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_276_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memdep_276_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memdep_276_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_276_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_276_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_276_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_276_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memdep_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_o_active_memdep_276 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nn9W2_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_gemm_nn9W2_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_gemm_nn9W2_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_gemm_nn9W2_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nn9W2_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nn9W2_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nn9W2_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end gemm_nn9W_function;

architecture normal of gemm_nn9W_function is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_gemm_nn9W_B1_sr_1 is
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


    component bb_gemm_nn9W_B2 is
        port (
            in_A : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_B : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_C : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_K : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked303319_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked303319_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_j_076_pop9321_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_076_pop9321_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_lda : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_lda_sync_buffer320_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_lda_sync_buffer320_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_ldc : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_B_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_B_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_B_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_B_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            in_memdep_phi261_pop11324_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi261_pop11324_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi266_pop12325_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi266_pop12325_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi269_pop13326_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi269_pop13326_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi272_pop14327_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi272_pop14327_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi274_pop15328_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi274_pop15328_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi_pop10323_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi_pop10323_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit300322_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit300322_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W0_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_c1_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
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
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nn9W_B2_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nn9W_B3 is
        port (
            in_c0_exit3401_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_0_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_0_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit3401_0_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit3401_0_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit3401_0_5 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit3401_0_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_0_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_0_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_0_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_0_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_0_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit3401_0_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_0_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_0_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit3401_0_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit2_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit2_0_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit2_0_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit2_0_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_A : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_B : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_C : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_K : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_in_16 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lda : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_ldc : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1349 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe2342 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi277_pop16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nn9W_B3_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_19 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_18 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_19 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nn9W_B4_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nn9W_B5 is
        port (
            in_A : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_B : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_C : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_Cn_272_rep_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_Cn_272_rep_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_K : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arrayidx30330_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx30330_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_cmp367_RM312_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp367_RM312_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp75_RM310_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp75_RM310_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_conv31_hf_tofpc331_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_conv31_hf_tofpc331_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_div1_RM308_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_div1_RM308_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_div_RM314_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_div_RM314_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked329_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked329_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lda : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_ldc : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_A_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_A_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_A_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_A_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_045_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_045_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_045_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_045_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_051_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_051_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_051_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_051_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_null_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi258_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi258_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi263_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi263_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi268_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi268_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi277_pop16318_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi277_pop16318_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_mul27316_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul27316_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul36332_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul36332_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_notexit300306_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit300306_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_phi_decision139_xor_RM65333_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_phi_decision139_xor_RM65333_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W3_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W3_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W4_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W4_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit428_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit428_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit428_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit428_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit428_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit428_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit428_6 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit428_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit428_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit428_9 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit428_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit428_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit456_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit456_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit456_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit456_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit456_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe7435 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe8436 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe1457 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe2458 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe3459 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_045_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_045_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_045_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_045_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_045_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_045_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_045_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_051_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_051_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_051_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_051_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_051_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_051_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_051_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_null_load_0_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_memdep_phi258 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi263 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi268 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nn9W_B5_sr_1 is
        port (
            in_i_data_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_14 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_15 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_14 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_15 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nn9W_B6 is
        port (
            in_c0_exit4289_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit4289_0_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit4289_0_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit4289_0_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit4289_0_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit4289_0_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit4289_0_6 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit4289_0_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit4289_0_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit4289_0_9 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit4289_0_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit4289_0_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit45614_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit45614_0_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit45614_0_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit45614_0_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit45614_0_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_A : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_B : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_C : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_K : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe743511_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe843613_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe145716_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe245818_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe345920_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lda : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_ldc : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memdep_276_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memdep_276_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_276_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_276_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi2584_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi2636_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi2688_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe743511 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe843613 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe145716 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe245818 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe345920 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_memdep_276_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_276 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_276_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memdep_276_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memdep_276_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_276_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_276_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_276_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_276_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_memdep_phi2584 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi2636 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi2688 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nn9W_B6_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_9 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_12 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_17 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_19 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_20 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_21 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_data_22 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_23 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_24 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_9 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_12 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_17 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_18 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_19 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_20 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_21 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_data_22 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_23 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_24 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nn9W_B7_sr_0 is
        port (
            in_i_data_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_data_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_data_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nn9W_B8_sr_0 is
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


    component bb_gemm_nn9W_B0 is
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


    component bb_gemm_nn9W_B1 is
        port (
            in_A : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_B : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_C : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_K : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_in_10 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_in_11 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_in_12 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_in_13 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_in_14 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_in_15 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_valid_in_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_valid_in_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_valid_in_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_valid_in_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_valid_in_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked303_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked303_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_feedback_stall_out_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_forked303 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_lda_sync_buffer : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_phi261_pop11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi266_pop12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi269_pop13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi272_pop14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi274_pop15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi_pop10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nn9W_B4 is
        port (
            in_A : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_B : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_C : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_K : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_cmp367_RM311_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp367_RM311_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp75_RM309_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp75_RM309_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_div1_RM307_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_div1_RM307_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_div_RM313_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_div_RM313_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked304_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked304_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lda : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_ldc : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memdep_phi257_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi257_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi262_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi262_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi267_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi267_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi277_pop16317_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi277_pop16317_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_mul27315_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul27315_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_notexit300305_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit300305_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W1_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W1_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W2_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W2_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe10388 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11389 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe12390 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe13391 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe1379 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe2380 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe3381 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe4382 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe5383 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe6384 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe7385 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe8386 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe1397 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi257 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi262 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi267 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nn9W2_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_gemm_nn9W2_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_gemm_nn9W2_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_gemm_nn9W2_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nn9W2_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nn9W2_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nn9W2_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nn9W_B7 is
        port (
            in_A : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_B : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_C : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_K : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe743510_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe843612_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe145715_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe245817_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe345919_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lda : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_ldc : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memdep_27621_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi2583_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi2635_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi2687_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_10 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_11 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_12 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_13 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_14 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_15 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_out_16 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_valid_out_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_valid_out_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_valid_out_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_valid_out_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_valid_out_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_valid_out_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nn9W_B8 is
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


    component i_acl_pipeline_keep_going290_gemm_nn9w_sr is
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


    component i_acl_pipeline_keep_going290_gemm_nn9w_valid_fifo is
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


    component i_acl_pipeline_keep_going294_gemm_nn9w_sr is
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


    component i_acl_pipeline_keep_going294_gemm_nn9w_valid_fifo is
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


    component i_acl_pipeline_keep_going298_gemm_nn9w_sr is
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


    component i_acl_pipeline_keep_going298_gemm_nn9w_valid_fifo is
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


    component i_acl_pipeline_keep_going_gemm_nn9w_sr is
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


    component i_acl_pipeline_keep_going_gemm_nn9w_valid_fifo is
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


    component loop_limiter_gemm_nn9W0 is
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


    component loop_limiter_gemm_nn9W1 is
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


    component loop_limiter_gemm_nn9W2 is
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
    signal bb_gemm_nn9W_B1_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_5 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_c1_exit_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_c1_exit_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_c1_exit_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_c1_exit_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memcoalesce_B_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memcoalesce_B_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memcoalesce_B_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memcoalesce_B_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memcoalesce_B_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memcoalesce_B_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memcoalesce_B_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memdep_259_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memdep_259_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memdep_259_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memdep_259_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memdep_259_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memdep_259_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memdep_259_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memdep_264_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memdep_264_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memdep_264_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memdep_264_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memdep_264_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memdep_264_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memdep_264_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memdep_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memdep_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memdep_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memdep_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memdep_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memdep_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_memdep_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_aunroll_x_out_c0_exe11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B3_aunroll_x_out_c0_exe1349 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B3_aunroll_x_out_c0_exe14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_aunroll_x_out_c0_exe15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_aunroll_x_out_c0_exe2342 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B3_aunroll_x_out_c0_exe6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_aunroll_x_out_c0_exe7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_aunroll_x_out_c1_exe1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_aunroll_x_out_c1_exe2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_aunroll_x_out_c1_exe3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_aunroll_x_out_feedback_stall_out_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_aunroll_x_out_memdep_phi277_pop16 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_6 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_9 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c1_exit456_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c1_exit456_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c1_exit456_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c1_exit456_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c1_exit456_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c0_exe7435 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c0_exe8436 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c1_exe1457 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c1_exe2458 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_c1_exe3459 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_A_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_A_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_A_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_A_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_A_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_A_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_A_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_045_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_045_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_045_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_045_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_045_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_045_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_045_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_051_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_051_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_051_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_051_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_051_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_051_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_051_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_0_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_0_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_0_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_0_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memdep_phi258 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memdep_phi263 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_memdep_phi268 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_aunroll_x_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_aunroll_x_out_c0_exe743511 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_aunroll_x_out_c0_exe843613 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_aunroll_x_out_c1_exe145716 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_aunroll_x_out_c1_exe245818 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_aunroll_x_out_c1_exe345920 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_aunroll_x_out_lsu_memdep_276_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_aunroll_x_out_memdep_276 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_aunroll_x_out_memdep_276_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_gemm_nn9W_B6_aunroll_x_out_memdep_276_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_gemm_nn9W_B6_aunroll_x_out_memdep_276_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B6_aunroll_x_out_memdep_276_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_aunroll_x_out_memdep_276_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_aunroll_x_out_memdep_276_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_aunroll_x_out_memdep_276_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_gemm_nn9W_B6_aunroll_x_out_memdep_phi2584 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_aunroll_x_out_memdep_phi2636 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_aunroll_x_out_memdep_phi2688 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_9 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_12 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_17 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_18 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_19 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_20 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_21 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_22 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_23 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_24 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B8_sr_0_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B8_sr_0_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_c_i2_0gr_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal dupName_0_c_i32_undef_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_c_i64_undef_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B0_out_feedback_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B0_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B0_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_out_c0_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B1_out_c0_exe2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_out_c0_exe3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_out_feedback_stall_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_out_feedback_stall_out_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_out_feedback_stall_out_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_out_feedback_stall_out_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_out_feedback_stall_out_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_out_feedback_stall_out_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_out_forked303 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_out_lda_sync_buffer : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B1_out_memdep_phi261_pop11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_out_memdep_phi266_pop12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_out_memdep_phi269_pop13 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_out_memdep_phi272_pop14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_out_memdep_phi274_pop15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_out_memdep_phi_pop10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B1_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_out_c0_exe10388 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_out_c0_exe11389 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_out_c0_exe12390 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_out_c0_exe13391 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B4_out_c0_exe1379 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B4_out_c0_exe2380 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B4_out_c0_exe3381 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_out_c0_exe4382 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B4_out_c0_exe5383 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B4_out_c0_exe6384 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_out_c0_exe7385 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_out_c0_exe8386 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_out_c1_exe1397 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B4_out_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_out_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_out_memdep_phi257 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_out_memdep_phi262 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_out_memdep_phi267 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_out_unnamed_gemm_nn9W2_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_gemm_nn9W_B4_out_unnamed_gemm_nn9W2_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_gemm_nn9W_B4_out_unnamed_gemm_nn9W2_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B4_out_unnamed_gemm_nn9W2_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_out_unnamed_gemm_nn9W2_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_out_unnamed_gemm_nn9W2_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_out_unnamed_gemm_nn9W2_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_gemm_nn9W_B4_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_out_feedback_out_10 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gemm_nn9W_B7_out_feedback_out_11 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gemm_nn9W_B7_out_feedback_out_12 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gemm_nn9W_B7_out_feedback_out_13 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gemm_nn9W_B7_out_feedback_out_14 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gemm_nn9W_B7_out_feedback_out_15 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gemm_nn9W_B7_out_feedback_out_16 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gemm_nn9W_B7_out_feedback_valid_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_out_feedback_valid_out_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_out_feedback_valid_out_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_out_feedback_valid_out_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_out_feedback_valid_out_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_out_feedback_valid_out_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_out_feedback_valid_out_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B8_out_feedback_out_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gemm_nn9W_B8_out_feedback_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B8_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B8_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going290_gemm_nn9w_sr_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going290_gemm_nn9w_sr_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going290_gemm_nn9w_valid_fifo_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going290_gemm_nn9w_valid_fifo_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going294_gemm_nn9w_sr_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going294_gemm_nn9w_sr_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going294_gemm_nn9w_valid_fifo_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going294_gemm_nn9w_valid_fifo_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going298_gemm_nn9w_sr_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going298_gemm_nn9w_sr_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going298_gemm_nn9w_valid_fifo_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going298_gemm_nn9w_valid_fifo_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gemm_nn9w_sr_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gemm_nn9w_sr_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gemm_nn9w_valid_fifo_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going_gemm_nn9w_valid_fifo_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_gemm_nn9W0_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_gemm_nn9W0_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_gemm_nn9W1_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_gemm_nn9W1_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_gemm_nn9W2_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal loop_limiter_gemm_nn9W2_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- dupName_0_c_i2_0gr_x(CONSTANT,17)
    dupName_0_c_i2_0gr_x_q <= "00";

    -- i_acl_pipeline_keep_going290_gemm_nn9w_valid_fifo(BLACKBOX,80)
    thei_acl_pipeline_keep_going290_gemm_nn9w_valid_fifo : i_acl_pipeline_keep_going290_gemm_nn9w_valid_fifo
    PORT MAP (
        in_data_in => dupName_0_c_i2_0gr_x_q,
        in_stall_in => bb_gemm_nn9W_B5_aunroll_x_out_stall_out_0,
        in_valid_in => i_acl_pipeline_keep_going290_gemm_nn9w_sr_out_o_valid,
        out_stall_out => i_acl_pipeline_keep_going290_gemm_nn9w_valid_fifo_out_stall_out,
        out_valid_out => i_acl_pipeline_keep_going290_gemm_nn9w_valid_fifo_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- bb_gemm_nn9W_B1_sr_1_aunroll_x(BLACKBOX,2)
    thebb_gemm_nn9W_B1_sr_1_aunroll_x : bb_gemm_nn9W_B1_sr_1
    PORT MAP (
        in_i_data_0 => VCC_q,
        in_i_stall => bb_gemm_nn9W_B1_out_stall_out_1,
        in_i_valid => bb_gemm_nn9W_B0_out_valid_out_0,
        out_o_data_0 => bb_gemm_nn9W_B1_sr_1_aunroll_x_out_o_data_0,
        out_o_stall => bb_gemm_nn9W_B1_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_gemm_nn9W_B1_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nn9W_B0(BLACKBOX,67)
    thebb_gemm_nn9W_B0 : bb_gemm_nn9W_B0
    PORT MAP (
        in_A => in_arg_A,
        in_B => in_arg_B,
        in_C => in_arg_C,
        in_K => in_arg_K,
        in_M => in_arg_M,
        in_N => in_arg_N,
        in_feedback_in_0 => bb_gemm_nn9W_B8_out_feedback_out_0,
        in_feedback_valid_in_0 => bb_gemm_nn9W_B8_out_feedback_valid_out_0,
        in_lda => in_arg_lda,
        in_ldc => in_arg_ldc,
        in_stall_in_0 => bb_gemm_nn9W_B1_sr_1_aunroll_x_out_o_stall,
        in_valid_in_0 => in_valid_in,
        out_feedback_stall_out_0 => bb_gemm_nn9W_B0_out_feedback_stall_out_0,
        out_stall_out_0 => bb_gemm_nn9W_B0_out_stall_out_0,
        out_valid_out_0 => bb_gemm_nn9W_B0_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nn9W_B8(BLACKBOX,71)
    thebb_gemm_nn9W_B8 : bb_gemm_nn9W_B8
    PORT MAP (
        in_feedback_stall_in_0 => bb_gemm_nn9W_B0_out_feedback_stall_out_0,
        in_stall_in_0 => in_stall_in,
        in_valid_in_0 => bb_gemm_nn9W_B8_sr_0_aunroll_x_out_o_valid,
        out_feedback_out_0 => bb_gemm_nn9W_B8_out_feedback_out_0,
        out_feedback_valid_out_0 => bb_gemm_nn9W_B8_out_feedback_valid_out_0,
        out_stall_out_0 => bb_gemm_nn9W_B8_out_stall_out_0,
        out_valid_out_0 => bb_gemm_nn9W_B8_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nn9W_B8_sr_0_aunroll_x(BLACKBOX,13)
    thebb_gemm_nn9W_B8_sr_0_aunroll_x : bb_gemm_nn9W_B8_sr_0
    PORT MAP (
        in_i_data_0 => GND_q,
        in_i_stall => bb_gemm_nn9W_B8_out_stall_out_0,
        in_i_valid => bb_gemm_nn9W_B7_out_valid_out_0,
        out_o_stall => bb_gemm_nn9W_B8_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_gemm_nn9W_B8_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going294_gemm_nn9w_valid_fifo(BLACKBOX,82)
    thei_acl_pipeline_keep_going294_gemm_nn9w_valid_fifo : i_acl_pipeline_keep_going294_gemm_nn9w_valid_fifo
    PORT MAP (
        in_data_in => dupName_0_c_i2_0gr_x_q,
        in_stall_in => bb_gemm_nn9W_B4_out_stall_out_0,
        in_valid_in => i_acl_pipeline_keep_going294_gemm_nn9w_sr_out_o_valid,
        out_stall_out => i_acl_pipeline_keep_going294_gemm_nn9w_valid_fifo_out_stall_out,
        out_valid_out => i_acl_pipeline_keep_going294_gemm_nn9w_valid_fifo_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_gemm_nn9W2(BLACKBOX,148)
    theloop_limiter_gemm_nn9W2 : loop_limiter_gemm_nn9W2
    PORT MAP (
        in_i_stall => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_gemm_nn9W_B5_aunroll_x_out_exiting_stall_out,
        in_i_valid => bb_gemm_nn9W_B4_out_valid_out_0,
        in_i_valid_exit => bb_gemm_nn9W_B5_aunroll_x_out_exiting_valid_out,
        out_o_stall => loop_limiter_gemm_nn9W2_out_o_stall,
        out_o_valid => loop_limiter_gemm_nn9W2_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going294_gemm_nn9w_sr(BLACKBOX,81)
    thei_acl_pipeline_keep_going294_gemm_nn9w_sr : i_acl_pipeline_keep_going294_gemm_nn9w_sr
    PORT MAP (
        in_i_data => GND_q,
        in_i_stall => i_acl_pipeline_keep_going294_gemm_nn9w_valid_fifo_out_stall_out,
        in_i_valid => bb_gemm_nn9W_B4_out_pipeline_valid_out,
        out_o_stall => i_acl_pipeline_keep_going294_gemm_nn9w_sr_out_o_stall,
        out_o_valid => i_acl_pipeline_keep_going294_gemm_nn9w_sr_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nn9W_B4(BLACKBOX,69)
    thebb_gemm_nn9W_B4 : bb_gemm_nn9W_B4
    PORT MAP (
        in_A => in_arg_A,
        in_B => in_arg_B,
        in_C => in_arg_C,
        in_K => in_arg_K,
        in_M => in_arg_M,
        in_N => in_arg_N,
        in_cmp367_RM311_0 => GND_q,
        in_cmp367_RM311_1 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_8,
        in_cmp75_RM309_0 => GND_q,
        in_cmp75_RM309_1 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_7,
        in_div1_RM307_0 => dupName_0_c_i32_undef_x_q,
        in_div1_RM307_1 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_6,
        in_div_RM313_0 => dupName_0_c_i32_undef_x_q,
        in_div_RM313_1 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_9,
        in_flush => in_start,
        in_forked304_0 => GND_q,
        in_forked304_1 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_3,
        in_lda => in_arg_lda,
        in_ldc => in_arg_ldc,
        in_memdep_phi257_0 => GND_q,
        in_memdep_phi257_1 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_0,
        in_memdep_phi262_0 => GND_q,
        in_memdep_phi262_1 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_1,
        in_memdep_phi267_0 => GND_q,
        in_memdep_phi267_1 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_2,
        in_memdep_phi277_pop16317_0 => GND_q,
        in_memdep_phi277_pop16317_1 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_11,
        in_mul27315_0 => dupName_0_c_i32_undef_x_q,
        in_mul27315_1 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_10,
        in_notexit300305_0 => GND_q,
        in_notexit300305_1 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_5,
        in_pipeline_stall_in => i_acl_pipeline_keep_going294_gemm_nn9w_sr_out_o_stall,
        in_stall_in_0 => loop_limiter_gemm_nn9W2_out_o_stall,
        in_unnamed_gemm_nn9W1_0 => GND_q,
        in_unnamed_gemm_nn9W1_1 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_4,
        in_unnamed_gemm_nn9W2_avm_readdata => in_unnamed_gemm_nn9W2_avm_readdata,
        in_unnamed_gemm_nn9W2_avm_readdatavalid => in_unnamed_gemm_nn9W2_avm_readdatavalid,
        in_unnamed_gemm_nn9W2_avm_waitrequest => in_unnamed_gemm_nn9W2_avm_waitrequest,
        in_unnamed_gemm_nn9W2_avm_writeack => in_unnamed_gemm_nn9W2_avm_writeack,
        in_valid_in_0 => i_acl_pipeline_keep_going294_gemm_nn9w_valid_fifo_out_valid_out,
        in_valid_in_1 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_valid,
        out_c0_exe10388 => bb_gemm_nn9W_B4_out_c0_exe10388,
        out_c0_exe11389 => bb_gemm_nn9W_B4_out_c0_exe11389,
        out_c0_exe12390 => bb_gemm_nn9W_B4_out_c0_exe12390,
        out_c0_exe13391 => bb_gemm_nn9W_B4_out_c0_exe13391,
        out_c0_exe1379 => bb_gemm_nn9W_B4_out_c0_exe1379,
        out_c0_exe2380 => bb_gemm_nn9W_B4_out_c0_exe2380,
        out_c0_exe3381 => bb_gemm_nn9W_B4_out_c0_exe3381,
        out_c0_exe4382 => bb_gemm_nn9W_B4_out_c0_exe4382,
        out_c0_exe5383 => bb_gemm_nn9W_B4_out_c0_exe5383,
        out_c0_exe6384 => bb_gemm_nn9W_B4_out_c0_exe6384,
        out_c0_exe7385 => bb_gemm_nn9W_B4_out_c0_exe7385,
        out_c0_exe8386 => bb_gemm_nn9W_B4_out_c0_exe8386,
        out_c1_exe1397 => bb_gemm_nn9W_B4_out_c1_exe1397,
        out_exiting_stall_out => bb_gemm_nn9W_B4_out_exiting_stall_out,
        out_exiting_valid_out => bb_gemm_nn9W_B4_out_exiting_valid_out,
        out_memdep_phi257 => bb_gemm_nn9W_B4_out_memdep_phi257,
        out_memdep_phi262 => bb_gemm_nn9W_B4_out_memdep_phi262,
        out_memdep_phi267 => bb_gemm_nn9W_B4_out_memdep_phi267,
        out_pipeline_valid_out => bb_gemm_nn9W_B4_out_pipeline_valid_out,
        out_stall_out_0 => bb_gemm_nn9W_B4_out_stall_out_0,
        out_stall_out_1 => bb_gemm_nn9W_B4_out_stall_out_1,
        out_unnamed_gemm_nn9W2_avm_address => bb_gemm_nn9W_B4_out_unnamed_gemm_nn9W2_avm_address,
        out_unnamed_gemm_nn9W2_avm_burstcount => bb_gemm_nn9W_B4_out_unnamed_gemm_nn9W2_avm_burstcount,
        out_unnamed_gemm_nn9W2_avm_byteenable => bb_gemm_nn9W_B4_out_unnamed_gemm_nn9W2_avm_byteenable,
        out_unnamed_gemm_nn9W2_avm_enable => bb_gemm_nn9W_B4_out_unnamed_gemm_nn9W2_avm_enable,
        out_unnamed_gemm_nn9W2_avm_read => bb_gemm_nn9W_B4_out_unnamed_gemm_nn9W2_avm_read,
        out_unnamed_gemm_nn9W2_avm_write => bb_gemm_nn9W_B4_out_unnamed_gemm_nn9W2_avm_write,
        out_unnamed_gemm_nn9W2_avm_writedata => bb_gemm_nn9W_B4_out_unnamed_gemm_nn9W2_avm_writedata,
        out_valid_out_0 => bb_gemm_nn9W_B4_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nn9W_B4_sr_1_aunroll_x(BLACKBOX,7)
    thebb_gemm_nn9W_B4_sr_1_aunroll_x : bb_gemm_nn9W_B4_sr_1
    PORT MAP (
        in_i_data_0 => bb_gemm_nn9W_B3_aunroll_x_out_c1_exe1,
        in_i_data_1 => bb_gemm_nn9W_B3_aunroll_x_out_c1_exe2,
        in_i_data_2 => bb_gemm_nn9W_B3_aunroll_x_out_c1_exe3,
        in_i_data_3 => VCC_q,
        in_i_data_4 => bb_gemm_nn9W_B3_aunroll_x_out_c0_exe14,
        in_i_data_5 => bb_gemm_nn9W_B3_aunroll_x_out_c0_exe15,
        in_i_data_6 => bb_gemm_nn9W_B3_aunroll_x_out_c0_exe2342,
        in_i_data_7 => bb_gemm_nn9W_B3_aunroll_x_out_c0_exe6,
        in_i_data_8 => bb_gemm_nn9W_B3_aunroll_x_out_c0_exe7,
        in_i_data_9 => bb_gemm_nn9W_B3_aunroll_x_out_c0_exe11,
        in_i_data_10 => bb_gemm_nn9W_B3_aunroll_x_out_c0_exe1349,
        in_i_data_11 => bb_gemm_nn9W_B3_aunroll_x_out_memdep_phi277_pop16,
        in_i_stall => bb_gemm_nn9W_B4_out_stall_out_1,
        in_i_valid => loop_limiter_gemm_nn9W0_out_o_valid,
        out_o_data_0 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_data_11,
        out_o_stall => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_gemm_nn9W0(BLACKBOX,146)
    theloop_limiter_gemm_nn9W0 : loop_limiter_gemm_nn9W0
    PORT MAP (
        in_i_stall => bb_gemm_nn9W_B4_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_gemm_nn9W_B4_out_exiting_stall_out,
        in_i_valid => bb_gemm_nn9W_B3_aunroll_x_out_valid_out_0,
        in_i_valid_exit => bb_gemm_nn9W_B4_out_exiting_valid_out,
        out_o_stall => loop_limiter_gemm_nn9W0_out_o_stall,
        out_o_valid => loop_limiter_gemm_nn9W0_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going_gemm_nn9w_valid_fifo(BLACKBOX,86)
    thei_acl_pipeline_keep_going_gemm_nn9w_valid_fifo : i_acl_pipeline_keep_going_gemm_nn9w_valid_fifo
    PORT MAP (
        in_data_in => dupName_0_c_i2_0gr_x_q,
        in_stall_in => bb_gemm_nn9W_B2_aunroll_x_out_stall_out_0,
        in_valid_in => i_acl_pipeline_keep_going_gemm_nn9w_sr_out_o_valid,
        out_stall_out => i_acl_pipeline_keep_going_gemm_nn9w_valid_fifo_out_stall_out,
        out_valid_out => i_acl_pipeline_keep_going_gemm_nn9w_valid_fifo_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going_gemm_nn9w_sr(BLACKBOX,85)
    thei_acl_pipeline_keep_going_gemm_nn9w_sr : i_acl_pipeline_keep_going_gemm_nn9w_sr
    PORT MAP (
        in_i_data => GND_q,
        in_i_stall => i_acl_pipeline_keep_going_gemm_nn9w_valid_fifo_out_stall_out,
        in_i_valid => bb_gemm_nn9W_B2_aunroll_x_out_pipeline_valid_out,
        out_o_stall => i_acl_pipeline_keep_going_gemm_nn9w_sr_out_o_stall,
        out_o_valid => i_acl_pipeline_keep_going_gemm_nn9w_sr_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- loop_limiter_gemm_nn9W1(BLACKBOX,147)
    theloop_limiter_gemm_nn9W1 : loop_limiter_gemm_nn9W1
    PORT MAP (
        in_i_stall => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_stall,
        in_i_stall_exit => bb_gemm_nn9W_B2_aunroll_x_out_exiting_stall_out,
        in_i_valid => bb_gemm_nn9W_B1_out_valid_out_0,
        in_i_valid_exit => bb_gemm_nn9W_B2_aunroll_x_out_exiting_valid_out,
        out_o_stall => loop_limiter_gemm_nn9W1_out_o_stall,
        out_o_valid => loop_limiter_gemm_nn9W1_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nn9W_B2_sr_1_aunroll_x(BLACKBOX,4)
    thebb_gemm_nn9W_B2_sr_1_aunroll_x : bb_gemm_nn9W_B2_sr_1
    PORT MAP (
        in_i_data_0 => VCC_q,
        in_i_data_1 => bb_gemm_nn9W_B1_out_forked303,
        in_i_data_2 => bb_gemm_nn9W_B1_out_lda_sync_buffer,
        in_i_data_3 => bb_gemm_nn9W_B1_out_c0_exe1,
        in_i_data_4 => bb_gemm_nn9W_B1_out_c0_exe2,
        in_i_data_5 => bb_gemm_nn9W_B1_out_c0_exe3,
        in_i_data_6 => bb_gemm_nn9W_B1_out_memdep_phi_pop10,
        in_i_data_7 => bb_gemm_nn9W_B1_out_memdep_phi261_pop11,
        in_i_data_8 => bb_gemm_nn9W_B1_out_memdep_phi266_pop12,
        in_i_data_9 => bb_gemm_nn9W_B1_out_memdep_phi269_pop13,
        in_i_data_10 => bb_gemm_nn9W_B1_out_memdep_phi272_pop14,
        in_i_data_11 => bb_gemm_nn9W_B1_out_memdep_phi274_pop15,
        in_i_stall => bb_gemm_nn9W_B2_aunroll_x_out_stall_out_1,
        in_i_valid => loop_limiter_gemm_nn9W1_out_o_valid,
        out_o_data_0 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_11,
        out_o_stall => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nn9W_B2_aunroll_x(BLACKBOX,3)
    thebb_gemm_nn9W_B2_aunroll_x : bb_gemm_nn9W_B2
    PORT MAP (
        in_A => in_arg_A,
        in_B => in_arg_B,
        in_C => in_arg_C,
        in_K => in_arg_K,
        in_M => in_arg_M,
        in_N => in_arg_N,
        in_flush => in_start,
        in_forked303319_0 => GND_q,
        in_forked303319_1 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_1,
        in_forked_0 => GND_q,
        in_forked_1 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_0,
        in_j_076_pop9321_0 => dupName_0_c_i32_undef_x_q,
        in_j_076_pop9321_1 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_3,
        in_lda => in_arg_lda,
        in_lda_sync_buffer320_0 => dupName_0_c_i32_undef_x_q,
        in_lda_sync_buffer320_1 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_2,
        in_ldc => in_arg_ldc,
        in_memcoalesce_B_load_0_avm_readdata => in_memcoalesce_B_load_0_avm_readdata,
        in_memcoalesce_B_load_0_avm_readdatavalid => in_memcoalesce_B_load_0_avm_readdatavalid,
        in_memcoalesce_B_load_0_avm_waitrequest => in_memcoalesce_B_load_0_avm_waitrequest,
        in_memcoalesce_B_load_0_avm_writeack => in_memcoalesce_B_load_0_avm_writeack,
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
        in_memdep_phi261_pop11324_0 => GND_q,
        in_memdep_phi261_pop11324_1 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_7,
        in_memdep_phi266_pop12325_0 => GND_q,
        in_memdep_phi266_pop12325_1 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_8,
        in_memdep_phi269_pop13326_0 => GND_q,
        in_memdep_phi269_pop13326_1 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_9,
        in_memdep_phi272_pop14327_0 => GND_q,
        in_memdep_phi272_pop14327_1 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_10,
        in_memdep_phi274_pop15328_0 => GND_q,
        in_memdep_phi274_pop15328_1 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_11,
        in_memdep_phi_pop10323_0 => GND_q,
        in_memdep_phi_pop10323_1 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_6,
        in_notexit300322_0 => GND_q,
        in_notexit300322_1 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_5,
        in_pipeline_stall_in => i_acl_pipeline_keep_going_gemm_nn9w_sr_out_o_stall,
        in_stall_in_0 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => GND_q,
        in_unnamed_gemm_nn9W0_0 => GND_q,
        in_unnamed_gemm_nn9W0_1 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_data_4,
        in_valid_in_0 => i_acl_pipeline_keep_going_gemm_nn9w_valid_fifo_out_valid_out,
        in_valid_in_1 => bb_gemm_nn9W_B2_sr_1_aunroll_x_out_o_valid,
        out_c0_exit340_0 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_0,
        out_c0_exit340_1 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_1,
        out_c0_exit340_2 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_2,
        out_c0_exit340_3 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_3,
        out_c0_exit340_4 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_4,
        out_c0_exit340_5 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_5,
        out_c0_exit340_6 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_6,
        out_c0_exit340_7 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_7,
        out_c0_exit340_8 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_8,
        out_c0_exit340_9 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_9,
        out_c0_exit340_10 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_10,
        out_c0_exit340_11 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_11,
        out_c0_exit340_12 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_12,
        out_c0_exit340_13 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_13,
        out_c0_exit340_14 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_14,
        out_c0_exit340_15 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_15,
        out_c1_exit_0 => bb_gemm_nn9W_B2_aunroll_x_out_c1_exit_0,
        out_c1_exit_1 => bb_gemm_nn9W_B2_aunroll_x_out_c1_exit_1,
        out_c1_exit_2 => bb_gemm_nn9W_B2_aunroll_x_out_c1_exit_2,
        out_c1_exit_3 => bb_gemm_nn9W_B2_aunroll_x_out_c1_exit_3,
        out_exiting_stall_out => bb_gemm_nn9W_B2_aunroll_x_out_exiting_stall_out,
        out_exiting_valid_out => bb_gemm_nn9W_B2_aunroll_x_out_exiting_valid_out,
        out_memcoalesce_B_load_0_avm_address => bb_gemm_nn9W_B2_aunroll_x_out_memcoalesce_B_load_0_avm_address,
        out_memcoalesce_B_load_0_avm_burstcount => bb_gemm_nn9W_B2_aunroll_x_out_memcoalesce_B_load_0_avm_burstcount,
        out_memcoalesce_B_load_0_avm_byteenable => bb_gemm_nn9W_B2_aunroll_x_out_memcoalesce_B_load_0_avm_byteenable,
        out_memcoalesce_B_load_0_avm_enable => bb_gemm_nn9W_B2_aunroll_x_out_memcoalesce_B_load_0_avm_enable,
        out_memcoalesce_B_load_0_avm_read => bb_gemm_nn9W_B2_aunroll_x_out_memcoalesce_B_load_0_avm_read,
        out_memcoalesce_B_load_0_avm_write => bb_gemm_nn9W_B2_aunroll_x_out_memcoalesce_B_load_0_avm_write,
        out_memcoalesce_B_load_0_avm_writedata => bb_gemm_nn9W_B2_aunroll_x_out_memcoalesce_B_load_0_avm_writedata,
        out_memdep_259_avm_address => bb_gemm_nn9W_B2_aunroll_x_out_memdep_259_avm_address,
        out_memdep_259_avm_burstcount => bb_gemm_nn9W_B2_aunroll_x_out_memdep_259_avm_burstcount,
        out_memdep_259_avm_byteenable => bb_gemm_nn9W_B2_aunroll_x_out_memdep_259_avm_byteenable,
        out_memdep_259_avm_enable => bb_gemm_nn9W_B2_aunroll_x_out_memdep_259_avm_enable,
        out_memdep_259_avm_read => bb_gemm_nn9W_B2_aunroll_x_out_memdep_259_avm_read,
        out_memdep_259_avm_write => bb_gemm_nn9W_B2_aunroll_x_out_memdep_259_avm_write,
        out_memdep_259_avm_writedata => bb_gemm_nn9W_B2_aunroll_x_out_memdep_259_avm_writedata,
        out_memdep_264_avm_address => bb_gemm_nn9W_B2_aunroll_x_out_memdep_264_avm_address,
        out_memdep_264_avm_burstcount => bb_gemm_nn9W_B2_aunroll_x_out_memdep_264_avm_burstcount,
        out_memdep_264_avm_byteenable => bb_gemm_nn9W_B2_aunroll_x_out_memdep_264_avm_byteenable,
        out_memdep_264_avm_enable => bb_gemm_nn9W_B2_aunroll_x_out_memdep_264_avm_enable,
        out_memdep_264_avm_read => bb_gemm_nn9W_B2_aunroll_x_out_memdep_264_avm_read,
        out_memdep_264_avm_write => bb_gemm_nn9W_B2_aunroll_x_out_memdep_264_avm_write,
        out_memdep_264_avm_writedata => bb_gemm_nn9W_B2_aunroll_x_out_memdep_264_avm_writedata,
        out_memdep_avm_address => bb_gemm_nn9W_B2_aunroll_x_out_memdep_avm_address,
        out_memdep_avm_burstcount => bb_gemm_nn9W_B2_aunroll_x_out_memdep_avm_burstcount,
        out_memdep_avm_byteenable => bb_gemm_nn9W_B2_aunroll_x_out_memdep_avm_byteenable,
        out_memdep_avm_enable => bb_gemm_nn9W_B2_aunroll_x_out_memdep_avm_enable,
        out_memdep_avm_read => bb_gemm_nn9W_B2_aunroll_x_out_memdep_avm_read,
        out_memdep_avm_write => bb_gemm_nn9W_B2_aunroll_x_out_memdep_avm_write,
        out_memdep_avm_writedata => bb_gemm_nn9W_B2_aunroll_x_out_memdep_avm_writedata,
        out_pipeline_valid_out => bb_gemm_nn9W_B2_aunroll_x_out_pipeline_valid_out,
        out_stall_out_0 => bb_gemm_nn9W_B2_aunroll_x_out_stall_out_0,
        out_stall_out_1 => bb_gemm_nn9W_B2_aunroll_x_out_stall_out_1,
        out_valid_out_0 => bb_gemm_nn9W_B2_aunroll_x_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nn9W_B3_sr_0_aunroll_x(BLACKBOX,6)
    thebb_gemm_nn9W_B3_sr_0_aunroll_x : bb_gemm_nn9W_B3_sr_0
    PORT MAP (
        in_i_data_0 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_0,
        in_i_data_1 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_1,
        in_i_data_2 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_2,
        in_i_data_3 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_3,
        in_i_data_4 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_4,
        in_i_data_5 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_5,
        in_i_data_6 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_6,
        in_i_data_7 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_7,
        in_i_data_8 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_8,
        in_i_data_9 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_9,
        in_i_data_10 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_10,
        in_i_data_11 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_11,
        in_i_data_12 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_12,
        in_i_data_13 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_13,
        in_i_data_14 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_14,
        in_i_data_15 => bb_gemm_nn9W_B2_aunroll_x_out_c0_exit340_15,
        in_i_data_16 => bb_gemm_nn9W_B2_aunroll_x_out_c1_exit_0,
        in_i_data_17 => bb_gemm_nn9W_B2_aunroll_x_out_c1_exit_1,
        in_i_data_18 => bb_gemm_nn9W_B2_aunroll_x_out_c1_exit_2,
        in_i_data_19 => bb_gemm_nn9W_B2_aunroll_x_out_c1_exit_3,
        in_i_stall => bb_gemm_nn9W_B3_aunroll_x_out_stall_out_0,
        in_i_valid => bb_gemm_nn9W_B2_aunroll_x_out_valid_out_0,
        out_o_data_0 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_19,
        out_o_stall => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nn9W_B3_aunroll_x(BLACKBOX,5)
    thebb_gemm_nn9W_B3_aunroll_x : bb_gemm_nn9W_B3
    PORT MAP (
        in_c0_exit3401_0_0 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_0,
        in_c0_exit3401_0_1 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_1,
        in_c0_exit3401_0_2 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_2,
        in_c0_exit3401_0_3 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_3,
        in_c0_exit3401_0_4 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_4,
        in_c0_exit3401_0_5 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_5,
        in_c0_exit3401_0_6 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_6,
        in_c0_exit3401_0_7 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_7,
        in_c0_exit3401_0_8 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_8,
        in_c0_exit3401_0_9 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_9,
        in_c0_exit3401_0_10 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_10,
        in_c0_exit3401_0_11 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_11,
        in_c0_exit3401_0_12 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_12,
        in_c0_exit3401_0_13 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_13,
        in_c0_exit3401_0_14 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_14,
        in_c0_exit3401_0_15 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_15,
        in_c1_exit2_0_0 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_16,
        in_c1_exit2_0_1 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_17,
        in_c1_exit2_0_2 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_18,
        in_c1_exit2_0_3 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_data_19,
        in_A => in_arg_A,
        in_B => in_arg_B,
        in_C => in_arg_C,
        in_K => in_arg_K,
        in_M => in_arg_M,
        in_N => in_arg_N,
        in_feedback_in_16 => bb_gemm_nn9W_B7_out_feedback_out_16,
        in_feedback_valid_in_16 => bb_gemm_nn9W_B7_out_feedback_valid_out_16,
        in_lda => in_arg_lda,
        in_ldc => in_arg_ldc,
        in_stall_in_0 => loop_limiter_gemm_nn9W0_out_o_stall,
        in_valid_in_0 => bb_gemm_nn9W_B3_sr_0_aunroll_x_out_o_valid,
        out_c0_exe11 => bb_gemm_nn9W_B3_aunroll_x_out_c0_exe11,
        out_c0_exe1349 => bb_gemm_nn9W_B3_aunroll_x_out_c0_exe1349,
        out_c0_exe14 => bb_gemm_nn9W_B3_aunroll_x_out_c0_exe14,
        out_c0_exe15 => bb_gemm_nn9W_B3_aunroll_x_out_c0_exe15,
        out_c0_exe2342 => bb_gemm_nn9W_B3_aunroll_x_out_c0_exe2342,
        out_c0_exe6 => bb_gemm_nn9W_B3_aunroll_x_out_c0_exe6,
        out_c0_exe7 => bb_gemm_nn9W_B3_aunroll_x_out_c0_exe7,
        out_c1_exe1 => bb_gemm_nn9W_B3_aunroll_x_out_c1_exe1,
        out_c1_exe2 => bb_gemm_nn9W_B3_aunroll_x_out_c1_exe2,
        out_c1_exe3 => bb_gemm_nn9W_B3_aunroll_x_out_c1_exe3,
        out_feedback_stall_out_16 => bb_gemm_nn9W_B3_aunroll_x_out_feedback_stall_out_16,
        out_memdep_phi277_pop16 => bb_gemm_nn9W_B3_aunroll_x_out_memdep_phi277_pop16,
        out_stall_out_0 => bb_gemm_nn9W_B3_aunroll_x_out_stall_out_0,
        out_valid_out_0 => bb_gemm_nn9W_B3_aunroll_x_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going298_gemm_nn9w_valid_fifo(BLACKBOX,84)
    thei_acl_pipeline_keep_going298_gemm_nn9w_valid_fifo : i_acl_pipeline_keep_going298_gemm_nn9w_valid_fifo
    PORT MAP (
        in_data_in => dupName_0_c_i2_0gr_x_q,
        in_stall_in => bb_gemm_nn9W_B1_out_stall_out_0,
        in_valid_in => i_acl_pipeline_keep_going298_gemm_nn9w_sr_out_o_valid,
        out_stall_out => i_acl_pipeline_keep_going298_gemm_nn9w_valid_fifo_out_stall_out,
        out_valid_out => i_acl_pipeline_keep_going298_gemm_nn9w_valid_fifo_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going298_gemm_nn9w_sr(BLACKBOX,83)
    thei_acl_pipeline_keep_going298_gemm_nn9w_sr : i_acl_pipeline_keep_going298_gemm_nn9w_sr
    PORT MAP (
        in_i_data => GND_q,
        in_i_stall => i_acl_pipeline_keep_going298_gemm_nn9w_valid_fifo_out_stall_out,
        in_i_valid => bb_gemm_nn9W_B1_out_pipeline_valid_out,
        out_o_stall => i_acl_pipeline_keep_going298_gemm_nn9w_sr_out_o_stall,
        out_o_valid => i_acl_pipeline_keep_going298_gemm_nn9w_sr_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nn9W_B1(BLACKBOX,68)
    thebb_gemm_nn9W_B1 : bb_gemm_nn9W_B1
    PORT MAP (
        in_A => in_arg_A,
        in_B => in_arg_B,
        in_C => in_arg_C,
        in_K => in_arg_K,
        in_M => in_arg_M,
        in_N => in_arg_N,
        in_feedback_in_10 => bb_gemm_nn9W_B7_out_feedback_out_10,
        in_feedback_in_11 => bb_gemm_nn9W_B7_out_feedback_out_11,
        in_feedback_in_12 => bb_gemm_nn9W_B7_out_feedback_out_12,
        in_feedback_in_13 => bb_gemm_nn9W_B7_out_feedback_out_13,
        in_feedback_in_14 => bb_gemm_nn9W_B7_out_feedback_out_14,
        in_feedback_in_15 => bb_gemm_nn9W_B7_out_feedback_out_15,
        in_feedback_valid_in_10 => bb_gemm_nn9W_B7_out_feedback_valid_out_10,
        in_feedback_valid_in_11 => bb_gemm_nn9W_B7_out_feedback_valid_out_11,
        in_feedback_valid_in_12 => bb_gemm_nn9W_B7_out_feedback_valid_out_12,
        in_feedback_valid_in_13 => bb_gemm_nn9W_B7_out_feedback_valid_out_13,
        in_feedback_valid_in_14 => bb_gemm_nn9W_B7_out_feedback_valid_out_14,
        in_feedback_valid_in_15 => bb_gemm_nn9W_B7_out_feedback_valid_out_15,
        in_forked303_0 => GND_q,
        in_forked303_1 => bb_gemm_nn9W_B1_sr_1_aunroll_x_out_o_data_0,
        in_lda => in_arg_lda,
        in_ldc => in_arg_ldc,
        in_pipeline_stall_in => i_acl_pipeline_keep_going298_gemm_nn9w_sr_out_o_stall,
        in_stall_in_0 => loop_limiter_gemm_nn9W1_out_o_stall,
        in_valid_in_0 => i_acl_pipeline_keep_going298_gemm_nn9w_valid_fifo_out_valid_out,
        in_valid_in_1 => bb_gemm_nn9W_B1_sr_1_aunroll_x_out_o_valid,
        out_c0_exe1 => bb_gemm_nn9W_B1_out_c0_exe1,
        out_c0_exe2 => bb_gemm_nn9W_B1_out_c0_exe2,
        out_c0_exe3 => bb_gemm_nn9W_B1_out_c0_exe3,
        out_feedback_stall_out_10 => bb_gemm_nn9W_B1_out_feedback_stall_out_10,
        out_feedback_stall_out_11 => bb_gemm_nn9W_B1_out_feedback_stall_out_11,
        out_feedback_stall_out_12 => bb_gemm_nn9W_B1_out_feedback_stall_out_12,
        out_feedback_stall_out_13 => bb_gemm_nn9W_B1_out_feedback_stall_out_13,
        out_feedback_stall_out_14 => bb_gemm_nn9W_B1_out_feedback_stall_out_14,
        out_feedback_stall_out_15 => bb_gemm_nn9W_B1_out_feedback_stall_out_15,
        out_forked303 => bb_gemm_nn9W_B1_out_forked303,
        out_lda_sync_buffer => bb_gemm_nn9W_B1_out_lda_sync_buffer,
        out_memdep_phi261_pop11 => bb_gemm_nn9W_B1_out_memdep_phi261_pop11,
        out_memdep_phi266_pop12 => bb_gemm_nn9W_B1_out_memdep_phi266_pop12,
        out_memdep_phi269_pop13 => bb_gemm_nn9W_B1_out_memdep_phi269_pop13,
        out_memdep_phi272_pop14 => bb_gemm_nn9W_B1_out_memdep_phi272_pop14,
        out_memdep_phi274_pop15 => bb_gemm_nn9W_B1_out_memdep_phi274_pop15,
        out_memdep_phi_pop10 => bb_gemm_nn9W_B1_out_memdep_phi_pop10,
        out_pipeline_valid_out => bb_gemm_nn9W_B1_out_pipeline_valid_out,
        out_stall_out_0 => bb_gemm_nn9W_B1_out_stall_out_0,
        out_stall_out_1 => bb_gemm_nn9W_B1_out_stall_out_1,
        out_valid_out_0 => bb_gemm_nn9W_B1_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nn9W_B7(BLACKBOX,70)
    thebb_gemm_nn9W_B7 : bb_gemm_nn9W_B7
    PORT MAP (
        in_A => in_arg_A,
        in_B => in_arg_B,
        in_C => in_arg_C,
        in_K => in_arg_K,
        in_M => in_arg_M,
        in_N => in_arg_N,
        in_c0_exe743510_0 => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_3,
        in_c0_exe843612_0 => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_4,
        in_c1_exe145715_0 => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_5,
        in_c1_exe245817_0 => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_6,
        in_c1_exe345919_0 => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_7,
        in_feedback_stall_in_10 => bb_gemm_nn9W_B1_out_feedback_stall_out_10,
        in_feedback_stall_in_11 => bb_gemm_nn9W_B1_out_feedback_stall_out_11,
        in_feedback_stall_in_12 => bb_gemm_nn9W_B1_out_feedback_stall_out_12,
        in_feedback_stall_in_13 => bb_gemm_nn9W_B1_out_feedback_stall_out_13,
        in_feedback_stall_in_14 => bb_gemm_nn9W_B1_out_feedback_stall_out_14,
        in_feedback_stall_in_15 => bb_gemm_nn9W_B1_out_feedback_stall_out_15,
        in_feedback_stall_in_16 => bb_gemm_nn9W_B3_aunroll_x_out_feedback_stall_out_16,
        in_lda => in_arg_lda,
        in_ldc => in_arg_ldc,
        in_memdep_27621_0 => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_8,
        in_memdep_phi2583_0 => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_0,
        in_memdep_phi2635_0 => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_1,
        in_memdep_phi2687_0 => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_2,
        in_stall_in_0 => bb_gemm_nn9W_B8_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => GND_q,
        in_valid_in_0 => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_valid,
        out_feedback_out_10 => bb_gemm_nn9W_B7_out_feedback_out_10,
        out_feedback_out_11 => bb_gemm_nn9W_B7_out_feedback_out_11,
        out_feedback_out_12 => bb_gemm_nn9W_B7_out_feedback_out_12,
        out_feedback_out_13 => bb_gemm_nn9W_B7_out_feedback_out_13,
        out_feedback_out_14 => bb_gemm_nn9W_B7_out_feedback_out_14,
        out_feedback_out_15 => bb_gemm_nn9W_B7_out_feedback_out_15,
        out_feedback_out_16 => bb_gemm_nn9W_B7_out_feedback_out_16,
        out_feedback_valid_out_10 => bb_gemm_nn9W_B7_out_feedback_valid_out_10,
        out_feedback_valid_out_11 => bb_gemm_nn9W_B7_out_feedback_valid_out_11,
        out_feedback_valid_out_12 => bb_gemm_nn9W_B7_out_feedback_valid_out_12,
        out_feedback_valid_out_13 => bb_gemm_nn9W_B7_out_feedback_valid_out_13,
        out_feedback_valid_out_14 => bb_gemm_nn9W_B7_out_feedback_valid_out_14,
        out_feedback_valid_out_15 => bb_gemm_nn9W_B7_out_feedback_valid_out_15,
        out_feedback_valid_out_16 => bb_gemm_nn9W_B7_out_feedback_valid_out_16,
        out_stall_out_0 => bb_gemm_nn9W_B7_out_stall_out_0,
        out_valid_out_0 => bb_gemm_nn9W_B7_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nn9W_B7_sr_0_aunroll_x(BLACKBOX,12)
    thebb_gemm_nn9W_B7_sr_0_aunroll_x : bb_gemm_nn9W_B7_sr_0
    PORT MAP (
        in_i_data_0 => bb_gemm_nn9W_B6_aunroll_x_out_memdep_phi2584,
        in_i_data_1 => bb_gemm_nn9W_B6_aunroll_x_out_memdep_phi2636,
        in_i_data_2 => bb_gemm_nn9W_B6_aunroll_x_out_memdep_phi2688,
        in_i_data_3 => bb_gemm_nn9W_B6_aunroll_x_out_c0_exe743511,
        in_i_data_4 => bb_gemm_nn9W_B6_aunroll_x_out_c0_exe843613,
        in_i_data_5 => bb_gemm_nn9W_B6_aunroll_x_out_c1_exe145716,
        in_i_data_6 => bb_gemm_nn9W_B6_aunroll_x_out_c1_exe245818,
        in_i_data_7 => bb_gemm_nn9W_B6_aunroll_x_out_c1_exe345920,
        in_i_data_8 => bb_gemm_nn9W_B6_aunroll_x_out_memdep_276,
        in_i_stall => bb_gemm_nn9W_B7_out_stall_out_0,
        in_i_valid => bb_gemm_nn9W_B6_aunroll_x_out_valid_out_0,
        out_o_data_0 => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_data_8,
        out_o_stall => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nn9W_B6_aunroll_x(BLACKBOX,10)
    thebb_gemm_nn9W_B6_aunroll_x : bb_gemm_nn9W_B6
    PORT MAP (
        in_c0_exit4289_0_0 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_3,
        in_c0_exit4289_0_1 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_4,
        in_c0_exit4289_0_2 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_5,
        in_c0_exit4289_0_3 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_6,
        in_c0_exit4289_0_4 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_7,
        in_c0_exit4289_0_5 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_8,
        in_c0_exit4289_0_6 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_9,
        in_c0_exit4289_0_7 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_10,
        in_c0_exit4289_0_8 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_11,
        in_c0_exit4289_0_9 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_12,
        in_c0_exit4289_0_10 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_13,
        in_c0_exit4289_0_11 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_14,
        in_c1_exit45614_0_0 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_17,
        in_c1_exit45614_0_1 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_18,
        in_c1_exit45614_0_2 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_19,
        in_c1_exit45614_0_3 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_20,
        in_c1_exit45614_0_4 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_21,
        in_A => in_arg_A,
        in_B => in_arg_B,
        in_C => in_arg_C,
        in_K => in_arg_K,
        in_M => in_arg_M,
        in_N => in_arg_N,
        in_c0_exe743511_0 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_15,
        in_c0_exe843613_0 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_16,
        in_c1_exe145716_0 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_22,
        in_c1_exe245818_0 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_23,
        in_c1_exe345920_0 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_24,
        in_flush => in_start,
        in_lda => in_arg_lda,
        in_ldc => in_arg_ldc,
        in_memdep_276_avm_readdata => in_memdep_276_avm_readdata,
        in_memdep_276_avm_readdatavalid => in_memdep_276_avm_readdatavalid,
        in_memdep_276_avm_waitrequest => in_memdep_276_avm_waitrequest,
        in_memdep_276_avm_writeack => in_memdep_276_avm_writeack,
        in_memdep_phi2584_0 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_0,
        in_memdep_phi2636_0 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_1,
        in_memdep_phi2688_0 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_2,
        in_stall_in_0 => bb_gemm_nn9W_B7_sr_0_aunroll_x_out_o_stall,
        in_stall_in_1 => GND_q,
        in_valid_in_0 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_valid,
        out_c0_exe743511 => bb_gemm_nn9W_B6_aunroll_x_out_c0_exe743511,
        out_c0_exe843613 => bb_gemm_nn9W_B6_aunroll_x_out_c0_exe843613,
        out_c1_exe145716 => bb_gemm_nn9W_B6_aunroll_x_out_c1_exe145716,
        out_c1_exe245818 => bb_gemm_nn9W_B6_aunroll_x_out_c1_exe245818,
        out_c1_exe345920 => bb_gemm_nn9W_B6_aunroll_x_out_c1_exe345920,
        out_lsu_memdep_276_o_active => bb_gemm_nn9W_B6_aunroll_x_out_lsu_memdep_276_o_active,
        out_memdep_276 => bb_gemm_nn9W_B6_aunroll_x_out_memdep_276,
        out_memdep_276_avm_address => bb_gemm_nn9W_B6_aunroll_x_out_memdep_276_avm_address,
        out_memdep_276_avm_burstcount => bb_gemm_nn9W_B6_aunroll_x_out_memdep_276_avm_burstcount,
        out_memdep_276_avm_byteenable => bb_gemm_nn9W_B6_aunroll_x_out_memdep_276_avm_byteenable,
        out_memdep_276_avm_enable => bb_gemm_nn9W_B6_aunroll_x_out_memdep_276_avm_enable,
        out_memdep_276_avm_read => bb_gemm_nn9W_B6_aunroll_x_out_memdep_276_avm_read,
        out_memdep_276_avm_write => bb_gemm_nn9W_B6_aunroll_x_out_memdep_276_avm_write,
        out_memdep_276_avm_writedata => bb_gemm_nn9W_B6_aunroll_x_out_memdep_276_avm_writedata,
        out_memdep_phi2584 => bb_gemm_nn9W_B6_aunroll_x_out_memdep_phi2584,
        out_memdep_phi2636 => bb_gemm_nn9W_B6_aunroll_x_out_memdep_phi2636,
        out_memdep_phi2688 => bb_gemm_nn9W_B6_aunroll_x_out_memdep_phi2688,
        out_stall_out_0 => bb_gemm_nn9W_B6_aunroll_x_out_stall_out_0,
        out_valid_out_0 => bb_gemm_nn9W_B6_aunroll_x_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nn9W_B6_sr_0_aunroll_x(BLACKBOX,11)
    thebb_gemm_nn9W_B6_sr_0_aunroll_x : bb_gemm_nn9W_B6_sr_0
    PORT MAP (
        in_i_data_0 => bb_gemm_nn9W_B5_aunroll_x_out_memdep_phi258,
        in_i_data_1 => bb_gemm_nn9W_B5_aunroll_x_out_memdep_phi263,
        in_i_data_2 => bb_gemm_nn9W_B5_aunroll_x_out_memdep_phi268,
        in_i_data_3 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_0,
        in_i_data_4 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_1,
        in_i_data_5 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_2,
        in_i_data_6 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_3,
        in_i_data_7 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_4,
        in_i_data_8 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_5,
        in_i_data_9 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_6,
        in_i_data_10 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_7,
        in_i_data_11 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_8,
        in_i_data_12 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_9,
        in_i_data_13 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_10,
        in_i_data_14 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_11,
        in_i_data_15 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exe7435,
        in_i_data_16 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exe8436,
        in_i_data_17 => bb_gemm_nn9W_B5_aunroll_x_out_c1_exit456_0,
        in_i_data_18 => bb_gemm_nn9W_B5_aunroll_x_out_c1_exit456_1,
        in_i_data_19 => bb_gemm_nn9W_B5_aunroll_x_out_c1_exit456_2,
        in_i_data_20 => bb_gemm_nn9W_B5_aunroll_x_out_c1_exit456_3,
        in_i_data_21 => bb_gemm_nn9W_B5_aunroll_x_out_c1_exit456_4,
        in_i_data_22 => bb_gemm_nn9W_B5_aunroll_x_out_c1_exe1457,
        in_i_data_23 => bb_gemm_nn9W_B5_aunroll_x_out_c1_exe2458,
        in_i_data_24 => bb_gemm_nn9W_B5_aunroll_x_out_c1_exe3459,
        in_i_stall => bb_gemm_nn9W_B6_aunroll_x_out_stall_out_0,
        in_i_valid => bb_gemm_nn9W_B5_aunroll_x_out_valid_out_1,
        out_o_data_0 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_17,
        out_o_data_18 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_18,
        out_o_data_19 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_19,
        out_o_data_20 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_20,
        out_o_data_21 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_21,
        out_o_data_22 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_22,
        out_o_data_23 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_23,
        out_o_data_24 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_data_24,
        out_o_stall => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_stall,
        out_o_valid => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going290_gemm_nn9w_sr(BLACKBOX,79)
    thei_acl_pipeline_keep_going290_gemm_nn9w_sr : i_acl_pipeline_keep_going290_gemm_nn9w_sr
    PORT MAP (
        in_i_data => GND_q,
        in_i_stall => i_acl_pipeline_keep_going290_gemm_nn9w_valid_fifo_out_stall_out,
        in_i_valid => bb_gemm_nn9W_B5_aunroll_x_out_pipeline_valid_out,
        out_o_stall => i_acl_pipeline_keep_going290_gemm_nn9w_sr_out_o_stall,
        out_o_valid => i_acl_pipeline_keep_going290_gemm_nn9w_sr_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_c_i32_undef_x(CONSTANT,18)
    dupName_0_c_i32_undef_x_q <= "00000000000000000000000000000000";

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- bb_gemm_nn9W_B5_sr_1_aunroll_x(BLACKBOX,9)
    thebb_gemm_nn9W_B5_sr_1_aunroll_x : bb_gemm_nn9W_B5_sr_1
    PORT MAP (
        in_i_data_0 => bb_gemm_nn9W_B4_out_c1_exe1397,
        in_i_data_1 => bb_gemm_nn9W_B4_out_memdep_phi257,
        in_i_data_2 => bb_gemm_nn9W_B4_out_memdep_phi262,
        in_i_data_3 => bb_gemm_nn9W_B4_out_memdep_phi267,
        in_i_data_4 => bb_gemm_nn9W_B4_out_c0_exe10388,
        in_i_data_5 => bb_gemm_nn9W_B4_out_c0_exe11389,
        in_i_data_6 => bb_gemm_nn9W_B4_out_c0_exe4382,
        in_i_data_7 => bb_gemm_nn9W_B4_out_c0_exe6384,
        in_i_data_8 => bb_gemm_nn9W_B4_out_c0_exe12390,
        in_i_data_9 => bb_gemm_nn9W_B4_out_c0_exe13391,
        in_i_data_10 => bb_gemm_nn9W_B4_out_c0_exe1379,
        in_i_data_11 => bb_gemm_nn9W_B4_out_c0_exe3381,
        in_i_data_12 => VCC_q,
        in_i_data_13 => bb_gemm_nn9W_B4_out_c0_exe2380,
        in_i_data_14 => bb_gemm_nn9W_B4_out_c1_exe1397,
        in_i_data_15 => bb_gemm_nn9W_B4_out_c0_exe5383,
        in_i_data_16 => bb_gemm_nn9W_B4_out_c0_exe7385,
        in_i_data_17 => bb_gemm_nn9W_B4_out_c0_exe8386,
        in_i_stall => bb_gemm_nn9W_B5_aunroll_x_out_stall_out_1,
        in_i_valid => loop_limiter_gemm_nn9W2_out_o_valid,
        out_o_data_0 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_0,
        out_o_data_1 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_1,
        out_o_data_2 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_2,
        out_o_data_3 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_3,
        out_o_data_4 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_4,
        out_o_data_5 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_5,
        out_o_data_6 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_6,
        out_o_data_7 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_7,
        out_o_data_8 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_8,
        out_o_data_9 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_9,
        out_o_data_10 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_10,
        out_o_data_11 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_11,
        out_o_data_12 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_12,
        out_o_data_13 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_13,
        out_o_data_14 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_14,
        out_o_data_15 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_15,
        out_o_data_16 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_16,
        out_o_data_17 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_17,
        out_o_stall => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_stall,
        out_o_valid => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_c_i64_undef_x(CONSTANT,19)
    dupName_0_c_i64_undef_x_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- bb_gemm_nn9W_B5_aunroll_x(BLACKBOX,8)
    thebb_gemm_nn9W_B5_aunroll_x : bb_gemm_nn9W_B5
    PORT MAP (
        in_A => in_arg_A,
        in_B => in_arg_B,
        in_C => in_arg_C,
        in_Cn_272_rep_0 => dupName_0_c_i64_undef_x_q,
        in_Cn_272_rep_1 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_0,
        in_K => in_arg_K,
        in_M => in_arg_M,
        in_N => in_arg_N,
        in_arrayidx30330_0 => dupName_0_c_i64_undef_x_q,
        in_arrayidx30330_1 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_13,
        in_cmp367_RM312_0 => GND_q,
        in_cmp367_RM312_1 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_8,
        in_cmp75_RM310_0 => GND_q,
        in_cmp75_RM310_1 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_7,
        in_conv31_hf_tofpc331_0 => dupName_0_c_i64_undef_x_q,
        in_conv31_hf_tofpc331_1 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_14,
        in_div1_RM308_0 => dupName_0_c_i32_undef_x_q,
        in_div1_RM308_1 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_6,
        in_div_RM314_0 => dupName_0_c_i32_undef_x_q,
        in_div_RM314_1 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_9,
        in_flush => in_start,
        in_forked329_0 => GND_q,
        in_forked329_1 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_12,
        in_lda => in_arg_lda,
        in_ldc => in_arg_ldc,
        in_memcoalesce_A_load_0_avm_readdata => in_memcoalesce_A_load_0_avm_readdata,
        in_memcoalesce_A_load_0_avm_readdatavalid => in_memcoalesce_A_load_0_avm_readdatavalid,
        in_memcoalesce_A_load_0_avm_waitrequest => in_memcoalesce_A_load_0_avm_waitrequest,
        in_memcoalesce_A_load_0_avm_writeack => in_memcoalesce_A_load_0_avm_writeack,
        in_memcoalesce_null_load_045_avm_readdata => in_memcoalesce_null_load_045_avm_readdata,
        in_memcoalesce_null_load_045_avm_readdatavalid => in_memcoalesce_null_load_045_avm_readdatavalid,
        in_memcoalesce_null_load_045_avm_waitrequest => in_memcoalesce_null_load_045_avm_waitrequest,
        in_memcoalesce_null_load_045_avm_writeack => in_memcoalesce_null_load_045_avm_writeack,
        in_memcoalesce_null_load_051_avm_readdata => in_memcoalesce_null_load_051_avm_readdata,
        in_memcoalesce_null_load_051_avm_readdatavalid => in_memcoalesce_null_load_051_avm_readdatavalid,
        in_memcoalesce_null_load_051_avm_waitrequest => in_memcoalesce_null_load_051_avm_waitrequest,
        in_memcoalesce_null_load_051_avm_writeack => in_memcoalesce_null_load_051_avm_writeack,
        in_memcoalesce_null_load_0_avm_readdata => in_memcoalesce_null_load_0_avm_readdata,
        in_memcoalesce_null_load_0_avm_readdatavalid => in_memcoalesce_null_load_0_avm_readdatavalid,
        in_memcoalesce_null_load_0_avm_waitrequest => in_memcoalesce_null_load_0_avm_waitrequest,
        in_memcoalesce_null_load_0_avm_writeack => in_memcoalesce_null_load_0_avm_writeack,
        in_memdep_phi258_0 => GND_q,
        in_memdep_phi258_1 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_1,
        in_memdep_phi263_0 => GND_q,
        in_memdep_phi263_1 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_2,
        in_memdep_phi268_0 => GND_q,
        in_memdep_phi268_1 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_3,
        in_memdep_phi277_pop16318_0 => GND_q,
        in_memdep_phi277_pop16318_1 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_11,
        in_mul27316_0 => dupName_0_c_i32_undef_x_q,
        in_mul27316_1 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_10,
        in_mul36332_0 => dupName_0_c_i32_undef_x_q,
        in_mul36332_1 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_15,
        in_notexit300306_0 => GND_q,
        in_notexit300306_1 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_5,
        in_phi_decision139_xor_RM65333_0 => GND_q,
        in_phi_decision139_xor_RM65333_1 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_16,
        in_pipeline_stall_in => i_acl_pipeline_keep_going290_gemm_nn9w_sr_out_o_stall,
        in_stall_in_0 => GND_q,
        in_stall_in_1 => bb_gemm_nn9W_B6_sr_0_aunroll_x_out_o_stall,
        in_unnamed_gemm_nn9W3_0 => GND_q,
        in_unnamed_gemm_nn9W3_1 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_4,
        in_unnamed_gemm_nn9W4_0 => GND_q,
        in_unnamed_gemm_nn9W4_1 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_data_17,
        in_valid_in_0 => i_acl_pipeline_keep_going290_gemm_nn9w_valid_fifo_out_valid_out,
        in_valid_in_1 => bb_gemm_nn9W_B5_sr_1_aunroll_x_out_o_valid,
        out_c0_exit428_0 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_0,
        out_c0_exit428_1 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_1,
        out_c0_exit428_2 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_2,
        out_c0_exit428_3 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_3,
        out_c0_exit428_4 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_4,
        out_c0_exit428_5 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_5,
        out_c0_exit428_6 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_6,
        out_c0_exit428_7 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_7,
        out_c0_exit428_8 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_8,
        out_c0_exit428_9 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_9,
        out_c0_exit428_10 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_10,
        out_c0_exit428_11 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exit428_11,
        out_c1_exit456_0 => bb_gemm_nn9W_B5_aunroll_x_out_c1_exit456_0,
        out_c1_exit456_1 => bb_gemm_nn9W_B5_aunroll_x_out_c1_exit456_1,
        out_c1_exit456_2 => bb_gemm_nn9W_B5_aunroll_x_out_c1_exit456_2,
        out_c1_exit456_3 => bb_gemm_nn9W_B5_aunroll_x_out_c1_exit456_3,
        out_c1_exit456_4 => bb_gemm_nn9W_B5_aunroll_x_out_c1_exit456_4,
        out_c0_exe7435 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exe7435,
        out_c0_exe8436 => bb_gemm_nn9W_B5_aunroll_x_out_c0_exe8436,
        out_c1_exe1457 => bb_gemm_nn9W_B5_aunroll_x_out_c1_exe1457,
        out_c1_exe2458 => bb_gemm_nn9W_B5_aunroll_x_out_c1_exe2458,
        out_c1_exe3459 => bb_gemm_nn9W_B5_aunroll_x_out_c1_exe3459,
        out_exiting_stall_out => bb_gemm_nn9W_B5_aunroll_x_out_exiting_stall_out,
        out_exiting_valid_out => bb_gemm_nn9W_B5_aunroll_x_out_exiting_valid_out,
        out_memcoalesce_A_load_0_avm_address => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_A_load_0_avm_address,
        out_memcoalesce_A_load_0_avm_burstcount => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_A_load_0_avm_burstcount,
        out_memcoalesce_A_load_0_avm_byteenable => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_A_load_0_avm_byteenable,
        out_memcoalesce_A_load_0_avm_enable => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_A_load_0_avm_enable,
        out_memcoalesce_A_load_0_avm_read => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_A_load_0_avm_read,
        out_memcoalesce_A_load_0_avm_write => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_A_load_0_avm_write,
        out_memcoalesce_A_load_0_avm_writedata => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_A_load_0_avm_writedata,
        out_memcoalesce_null_load_045_avm_address => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_045_avm_address,
        out_memcoalesce_null_load_045_avm_burstcount => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_045_avm_burstcount,
        out_memcoalesce_null_load_045_avm_byteenable => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_045_avm_byteenable,
        out_memcoalesce_null_load_045_avm_enable => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_045_avm_enable,
        out_memcoalesce_null_load_045_avm_read => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_045_avm_read,
        out_memcoalesce_null_load_045_avm_write => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_045_avm_write,
        out_memcoalesce_null_load_045_avm_writedata => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_045_avm_writedata,
        out_memcoalesce_null_load_051_avm_address => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_051_avm_address,
        out_memcoalesce_null_load_051_avm_burstcount => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_051_avm_burstcount,
        out_memcoalesce_null_load_051_avm_byteenable => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_051_avm_byteenable,
        out_memcoalesce_null_load_051_avm_enable => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_051_avm_enable,
        out_memcoalesce_null_load_051_avm_read => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_051_avm_read,
        out_memcoalesce_null_load_051_avm_write => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_051_avm_write,
        out_memcoalesce_null_load_051_avm_writedata => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_051_avm_writedata,
        out_memcoalesce_null_load_0_avm_address => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_0_avm_address,
        out_memcoalesce_null_load_0_avm_burstcount => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_0_avm_burstcount,
        out_memcoalesce_null_load_0_avm_byteenable => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_0_avm_byteenable,
        out_memcoalesce_null_load_0_avm_enable => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_0_avm_enable,
        out_memcoalesce_null_load_0_avm_read => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_0_avm_read,
        out_memcoalesce_null_load_0_avm_write => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_0_avm_write,
        out_memcoalesce_null_load_0_avm_writedata => bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_0_avm_writedata,
        out_memdep_phi258 => bb_gemm_nn9W_B5_aunroll_x_out_memdep_phi258,
        out_memdep_phi263 => bb_gemm_nn9W_B5_aunroll_x_out_memdep_phi263,
        out_memdep_phi268 => bb_gemm_nn9W_B5_aunroll_x_out_memdep_phi268,
        out_pipeline_valid_out => bb_gemm_nn9W_B5_aunroll_x_out_pipeline_valid_out,
        out_stall_out_0 => bb_gemm_nn9W_B5_aunroll_x_out_stall_out_0,
        out_stall_out_1 => bb_gemm_nn9W_B5_aunroll_x_out_stall_out_1,
        out_valid_out_1 => bb_gemm_nn9W_B5_aunroll_x_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_memcoalesce_A_load_0_avm_address(GPOUT,149)
    out_memcoalesce_A_load_0_avm_address <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_A_load_0_avm_address;

    -- out_memcoalesce_A_load_0_avm_burstcount(GPOUT,150)
    out_memcoalesce_A_load_0_avm_burstcount <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_A_load_0_avm_burstcount;

    -- out_memcoalesce_A_load_0_avm_byteenable(GPOUT,151)
    out_memcoalesce_A_load_0_avm_byteenable <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_A_load_0_avm_byteenable;

    -- out_memcoalesce_A_load_0_avm_enable(GPOUT,152)
    out_memcoalesce_A_load_0_avm_enable <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_A_load_0_avm_enable;

    -- out_memcoalesce_A_load_0_avm_read(GPOUT,153)
    out_memcoalesce_A_load_0_avm_read <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_A_load_0_avm_read;

    -- out_memcoalesce_A_load_0_avm_write(GPOUT,154)
    out_memcoalesce_A_load_0_avm_write <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_A_load_0_avm_write;

    -- out_memcoalesce_A_load_0_avm_writedata(GPOUT,155)
    out_memcoalesce_A_load_0_avm_writedata <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_A_load_0_avm_writedata;

    -- out_memcoalesce_B_load_0_avm_address(GPOUT,156)
    out_memcoalesce_B_load_0_avm_address <= bb_gemm_nn9W_B2_aunroll_x_out_memcoalesce_B_load_0_avm_address;

    -- out_memcoalesce_B_load_0_avm_burstcount(GPOUT,157)
    out_memcoalesce_B_load_0_avm_burstcount <= bb_gemm_nn9W_B2_aunroll_x_out_memcoalesce_B_load_0_avm_burstcount;

    -- out_memcoalesce_B_load_0_avm_byteenable(GPOUT,158)
    out_memcoalesce_B_load_0_avm_byteenable <= bb_gemm_nn9W_B2_aunroll_x_out_memcoalesce_B_load_0_avm_byteenable;

    -- out_memcoalesce_B_load_0_avm_enable(GPOUT,159)
    out_memcoalesce_B_load_0_avm_enable <= bb_gemm_nn9W_B2_aunroll_x_out_memcoalesce_B_load_0_avm_enable;

    -- out_memcoalesce_B_load_0_avm_read(GPOUT,160)
    out_memcoalesce_B_load_0_avm_read <= bb_gemm_nn9W_B2_aunroll_x_out_memcoalesce_B_load_0_avm_read;

    -- out_memcoalesce_B_load_0_avm_write(GPOUT,161)
    out_memcoalesce_B_load_0_avm_write <= bb_gemm_nn9W_B2_aunroll_x_out_memcoalesce_B_load_0_avm_write;

    -- out_memcoalesce_B_load_0_avm_writedata(GPOUT,162)
    out_memcoalesce_B_load_0_avm_writedata <= bb_gemm_nn9W_B2_aunroll_x_out_memcoalesce_B_load_0_avm_writedata;

    -- out_memcoalesce_null_load_045_avm_address(GPOUT,163)
    out_memcoalesce_null_load_045_avm_address <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_045_avm_address;

    -- out_memcoalesce_null_load_045_avm_burstcount(GPOUT,164)
    out_memcoalesce_null_load_045_avm_burstcount <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_045_avm_burstcount;

    -- out_memcoalesce_null_load_045_avm_byteenable(GPOUT,165)
    out_memcoalesce_null_load_045_avm_byteenable <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_045_avm_byteenable;

    -- out_memcoalesce_null_load_045_avm_enable(GPOUT,166)
    out_memcoalesce_null_load_045_avm_enable <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_045_avm_enable;

    -- out_memcoalesce_null_load_045_avm_read(GPOUT,167)
    out_memcoalesce_null_load_045_avm_read <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_045_avm_read;

    -- out_memcoalesce_null_load_045_avm_write(GPOUT,168)
    out_memcoalesce_null_load_045_avm_write <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_045_avm_write;

    -- out_memcoalesce_null_load_045_avm_writedata(GPOUT,169)
    out_memcoalesce_null_load_045_avm_writedata <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_045_avm_writedata;

    -- out_memcoalesce_null_load_051_avm_address(GPOUT,170)
    out_memcoalesce_null_load_051_avm_address <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_051_avm_address;

    -- out_memcoalesce_null_load_051_avm_burstcount(GPOUT,171)
    out_memcoalesce_null_load_051_avm_burstcount <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_051_avm_burstcount;

    -- out_memcoalesce_null_load_051_avm_byteenable(GPOUT,172)
    out_memcoalesce_null_load_051_avm_byteenable <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_051_avm_byteenable;

    -- out_memcoalesce_null_load_051_avm_enable(GPOUT,173)
    out_memcoalesce_null_load_051_avm_enable <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_051_avm_enable;

    -- out_memcoalesce_null_load_051_avm_read(GPOUT,174)
    out_memcoalesce_null_load_051_avm_read <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_051_avm_read;

    -- out_memcoalesce_null_load_051_avm_write(GPOUT,175)
    out_memcoalesce_null_load_051_avm_write <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_051_avm_write;

    -- out_memcoalesce_null_load_051_avm_writedata(GPOUT,176)
    out_memcoalesce_null_load_051_avm_writedata <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_051_avm_writedata;

    -- out_memcoalesce_null_load_0_avm_address(GPOUT,177)
    out_memcoalesce_null_load_0_avm_address <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_0_avm_address;

    -- out_memcoalesce_null_load_0_avm_burstcount(GPOUT,178)
    out_memcoalesce_null_load_0_avm_burstcount <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_0_avm_burstcount;

    -- out_memcoalesce_null_load_0_avm_byteenable(GPOUT,179)
    out_memcoalesce_null_load_0_avm_byteenable <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_0_avm_byteenable;

    -- out_memcoalesce_null_load_0_avm_enable(GPOUT,180)
    out_memcoalesce_null_load_0_avm_enable <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_0_avm_enable;

    -- out_memcoalesce_null_load_0_avm_read(GPOUT,181)
    out_memcoalesce_null_load_0_avm_read <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_0_avm_read;

    -- out_memcoalesce_null_load_0_avm_write(GPOUT,182)
    out_memcoalesce_null_load_0_avm_write <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_0_avm_write;

    -- out_memcoalesce_null_load_0_avm_writedata(GPOUT,183)
    out_memcoalesce_null_load_0_avm_writedata <= bb_gemm_nn9W_B5_aunroll_x_out_memcoalesce_null_load_0_avm_writedata;

    -- out_memdep_259_avm_address(GPOUT,184)
    out_memdep_259_avm_address <= bb_gemm_nn9W_B2_aunroll_x_out_memdep_259_avm_address;

    -- out_memdep_259_avm_burstcount(GPOUT,185)
    out_memdep_259_avm_burstcount <= bb_gemm_nn9W_B2_aunroll_x_out_memdep_259_avm_burstcount;

    -- out_memdep_259_avm_byteenable(GPOUT,186)
    out_memdep_259_avm_byteenable <= bb_gemm_nn9W_B2_aunroll_x_out_memdep_259_avm_byteenable;

    -- out_memdep_259_avm_enable(GPOUT,187)
    out_memdep_259_avm_enable <= bb_gemm_nn9W_B2_aunroll_x_out_memdep_259_avm_enable;

    -- out_memdep_259_avm_read(GPOUT,188)
    out_memdep_259_avm_read <= bb_gemm_nn9W_B2_aunroll_x_out_memdep_259_avm_read;

    -- out_memdep_259_avm_write(GPOUT,189)
    out_memdep_259_avm_write <= bb_gemm_nn9W_B2_aunroll_x_out_memdep_259_avm_write;

    -- out_memdep_259_avm_writedata(GPOUT,190)
    out_memdep_259_avm_writedata <= bb_gemm_nn9W_B2_aunroll_x_out_memdep_259_avm_writedata;

    -- out_memdep_264_avm_address(GPOUT,191)
    out_memdep_264_avm_address <= bb_gemm_nn9W_B2_aunroll_x_out_memdep_264_avm_address;

    -- out_memdep_264_avm_burstcount(GPOUT,192)
    out_memdep_264_avm_burstcount <= bb_gemm_nn9W_B2_aunroll_x_out_memdep_264_avm_burstcount;

    -- out_memdep_264_avm_byteenable(GPOUT,193)
    out_memdep_264_avm_byteenable <= bb_gemm_nn9W_B2_aunroll_x_out_memdep_264_avm_byteenable;

    -- out_memdep_264_avm_enable(GPOUT,194)
    out_memdep_264_avm_enable <= bb_gemm_nn9W_B2_aunroll_x_out_memdep_264_avm_enable;

    -- out_memdep_264_avm_read(GPOUT,195)
    out_memdep_264_avm_read <= bb_gemm_nn9W_B2_aunroll_x_out_memdep_264_avm_read;

    -- out_memdep_264_avm_write(GPOUT,196)
    out_memdep_264_avm_write <= bb_gemm_nn9W_B2_aunroll_x_out_memdep_264_avm_write;

    -- out_memdep_264_avm_writedata(GPOUT,197)
    out_memdep_264_avm_writedata <= bb_gemm_nn9W_B2_aunroll_x_out_memdep_264_avm_writedata;

    -- out_memdep_276_avm_address(GPOUT,198)
    out_memdep_276_avm_address <= bb_gemm_nn9W_B6_aunroll_x_out_memdep_276_avm_address;

    -- out_memdep_276_avm_burstcount(GPOUT,199)
    out_memdep_276_avm_burstcount <= bb_gemm_nn9W_B6_aunroll_x_out_memdep_276_avm_burstcount;

    -- out_memdep_276_avm_byteenable(GPOUT,200)
    out_memdep_276_avm_byteenable <= bb_gemm_nn9W_B6_aunroll_x_out_memdep_276_avm_byteenable;

    -- out_memdep_276_avm_enable(GPOUT,201)
    out_memdep_276_avm_enable <= bb_gemm_nn9W_B6_aunroll_x_out_memdep_276_avm_enable;

    -- out_memdep_276_avm_read(GPOUT,202)
    out_memdep_276_avm_read <= bb_gemm_nn9W_B6_aunroll_x_out_memdep_276_avm_read;

    -- out_memdep_276_avm_write(GPOUT,203)
    out_memdep_276_avm_write <= bb_gemm_nn9W_B6_aunroll_x_out_memdep_276_avm_write;

    -- out_memdep_276_avm_writedata(GPOUT,204)
    out_memdep_276_avm_writedata <= bb_gemm_nn9W_B6_aunroll_x_out_memdep_276_avm_writedata;

    -- out_memdep_avm_address(GPOUT,205)
    out_memdep_avm_address <= bb_gemm_nn9W_B2_aunroll_x_out_memdep_avm_address;

    -- out_memdep_avm_burstcount(GPOUT,206)
    out_memdep_avm_burstcount <= bb_gemm_nn9W_B2_aunroll_x_out_memdep_avm_burstcount;

    -- out_memdep_avm_byteenable(GPOUT,207)
    out_memdep_avm_byteenable <= bb_gemm_nn9W_B2_aunroll_x_out_memdep_avm_byteenable;

    -- out_memdep_avm_enable(GPOUT,208)
    out_memdep_avm_enable <= bb_gemm_nn9W_B2_aunroll_x_out_memdep_avm_enable;

    -- out_memdep_avm_read(GPOUT,209)
    out_memdep_avm_read <= bb_gemm_nn9W_B2_aunroll_x_out_memdep_avm_read;

    -- out_memdep_avm_write(GPOUT,210)
    out_memdep_avm_write <= bb_gemm_nn9W_B2_aunroll_x_out_memdep_avm_write;

    -- out_memdep_avm_writedata(GPOUT,211)
    out_memdep_avm_writedata <= bb_gemm_nn9W_B2_aunroll_x_out_memdep_avm_writedata;

    -- out_o_active_memdep_276(GPOUT,212)
    out_o_active_memdep_276 <= bb_gemm_nn9W_B6_aunroll_x_out_lsu_memdep_276_o_active;

    -- out_stall_out(GPOUT,213)
    out_stall_out <= bb_gemm_nn9W_B0_out_stall_out_0;

    -- out_unnamed_gemm_nn9W2_avm_address(GPOUT,214)
    out_unnamed_gemm_nn9W2_avm_address <= bb_gemm_nn9W_B4_out_unnamed_gemm_nn9W2_avm_address;

    -- out_unnamed_gemm_nn9W2_avm_burstcount(GPOUT,215)
    out_unnamed_gemm_nn9W2_avm_burstcount <= bb_gemm_nn9W_B4_out_unnamed_gemm_nn9W2_avm_burstcount;

    -- out_unnamed_gemm_nn9W2_avm_byteenable(GPOUT,216)
    out_unnamed_gemm_nn9W2_avm_byteenable <= bb_gemm_nn9W_B4_out_unnamed_gemm_nn9W2_avm_byteenable;

    -- out_unnamed_gemm_nn9W2_avm_enable(GPOUT,217)
    out_unnamed_gemm_nn9W2_avm_enable <= bb_gemm_nn9W_B4_out_unnamed_gemm_nn9W2_avm_enable;

    -- out_unnamed_gemm_nn9W2_avm_read(GPOUT,218)
    out_unnamed_gemm_nn9W2_avm_read <= bb_gemm_nn9W_B4_out_unnamed_gemm_nn9W2_avm_read;

    -- out_unnamed_gemm_nn9W2_avm_write(GPOUT,219)
    out_unnamed_gemm_nn9W2_avm_write <= bb_gemm_nn9W_B4_out_unnamed_gemm_nn9W2_avm_write;

    -- out_unnamed_gemm_nn9W2_avm_writedata(GPOUT,220)
    out_unnamed_gemm_nn9W2_avm_writedata <= bb_gemm_nn9W_B4_out_unnamed_gemm_nn9W2_avm_writedata;

    -- out_valid_out(GPOUT,221)
    out_valid_out <= bb_gemm_nn9W_B8_out_valid_out_0;

END normal;
