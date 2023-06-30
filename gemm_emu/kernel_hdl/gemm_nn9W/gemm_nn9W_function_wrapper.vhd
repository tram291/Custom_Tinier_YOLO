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

-- VHDL created from gemm_nn9W_function_wrapper
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

entity gemm_nn9W_function_wrapper is
    port (
        avm_memcoalesce_A_load_0_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_memcoalesce_A_load_0_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_A_load_0_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_A_load_0_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_B_load_0_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_memcoalesce_B_load_0_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_B_load_0_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_B_load_0_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_045_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        avm_memcoalesce_null_load_045_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_045_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_045_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_051_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        avm_memcoalesce_null_load_051_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_051_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_051_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        avm_memcoalesce_null_load_0_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_259_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        avm_memdep_259_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_259_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_259_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_264_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        avm_memdep_264_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_264_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_264_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_276_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_memdep_276_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_276_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_276_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        avm_memdep_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_gemm_nn9W2_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        avm_unnamed_gemm_nn9W2_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_gemm_nn9W2_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_gemm_nn9W2_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        clock2x : in std_logic_vector(0 downto 0);  -- ufix1
        global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_offset_2 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        global_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        group_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        kernel_arguments : in std_logic_vector(415 downto 0);  -- ufix416
        kernel_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        local_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        local_id_1 : in std_logic_vector(31 downto 0);  -- ufix32
        local_id_2 : in std_logic_vector(31 downto 0);  -- ufix32
        local_router_hang : in std_logic_vector(0 downto 0);  -- ufix1
        local_size_0 : in std_logic_vector(31 downto 0);  -- ufix32
        local_size_1 : in std_logic_vector(31 downto 0);  -- ufix32
        local_size_2 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_0 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_1 : in std_logic_vector(31 downto 0);  -- ufix32
        num_groups_2 : in std_logic_vector(31 downto 0);  -- ufix32
        stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        start : in std_logic_vector(0 downto 0);  -- ufix1
        valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        work_dim : in std_logic_vector(31 downto 0);  -- ufix32
        workgroup_size : in std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_A_load_0_address : out std_logic_vector(29 downto 0);  -- ufix30
        avm_memcoalesce_A_load_0_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_memcoalesce_A_load_0_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_A_load_0_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_A_load_0_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_A_load_0_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_A_load_0_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_memcoalesce_B_load_0_address : out std_logic_vector(29 downto 0);  -- ufix30
        avm_memcoalesce_B_load_0_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_memcoalesce_B_load_0_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_B_load_0_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_B_load_0_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_B_load_0_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_B_load_0_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_memcoalesce_null_load_045_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_null_load_045_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_045_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        avm_memcoalesce_null_load_045_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_045_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_045_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_045_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        avm_memcoalesce_null_load_051_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_null_load_051_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_051_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        avm_memcoalesce_null_load_051_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_051_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_051_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_051_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        avm_memcoalesce_null_load_0_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memcoalesce_null_load_0_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        avm_memcoalesce_null_load_0_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memcoalesce_null_load_0_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        avm_memdep_259_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memdep_259_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_259_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        avm_memdep_259_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_259_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_259_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_259_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        avm_memdep_264_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memdep_264_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_264_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        avm_memdep_264_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_264_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_264_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_264_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        avm_memdep_276_address : out std_logic_vector(29 downto 0);  -- ufix30
        avm_memdep_276_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_memdep_276_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memdep_276_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_276_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_276_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_276_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        avm_memdep_address : out std_logic_vector(31 downto 0);  -- ufix32
        avm_memdep_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        avm_memdep_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_memdep_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        avm_unnamed_gemm_nn9W2_address : out std_logic_vector(29 downto 0);  -- ufix30
        avm_unnamed_gemm_nn9W2_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        avm_unnamed_gemm_nn9W2_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        avm_unnamed_gemm_nn9W2_enable : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_gemm_nn9W2_read : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_gemm_nn9W2_write : out std_logic_vector(0 downto 0);  -- ufix1
        avm_unnamed_gemm_nn9W2_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        clock2x_output : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_lsu_active : out std_logic_vector(0 downto 0);  -- ufix1
        has_a_write_pending : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        kernel_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end gemm_nn9W_function_wrapper;

architecture normal of gemm_nn9W_function_wrapper is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_clock2x_holder is
        port (
            clock2x : in std_logic;
            myout : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gemm_nn9W_function is
        port (
            in_arg_A : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_ALPHA : in std_logic_vector(31 downto 0);  -- Floating Point
            in_arg_B : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_C : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arg_K : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_global_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_lda : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_ldb : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_ldc : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arg_local_size_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_memcoalesce_A_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_A_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_A_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_A_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_B_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_B_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_B_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_B_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            in_memdep_259_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_259_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_259_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_259_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_264_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_264_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_264_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_264_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_276_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memdep_276_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_276_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_276_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_start : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W2_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W2_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
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
            out_memdep_276_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memdep_276_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memdep_276_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_276_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_276_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_276_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_276_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_memdep_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_o_active_memdep_276 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nn9W2_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_gemm_nn9W2_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_gemm_nn9W2_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_gemm_nn9W2_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nn9W2_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nn9W2_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nn9W2_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_2_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_3_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_4_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_5_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_6_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_7_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_8_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_clock2x_bitsignaltemp : std_logic;
    signal acl_clock2x_dummy_consumer_myout : STD_LOGIC_VECTOR (0 downto 0);
    signal acl_clock2x_dummy_consumer_myout_bitsignaltemp : std_logic;
    signal arg_ALPHA_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_A_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_B_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_C_select_b : STD_LOGIC_VECTOR (63 downto 0);
    signal arg_K_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_M_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_N_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_lda_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_ldb_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal arg_ldc_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_A_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_A_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_A_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_A_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_A_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_A_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_A_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_B_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_B_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_B_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_B_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_B_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_B_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_B_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_null_load_045_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_null_load_045_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_null_load_045_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_null_load_045_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_null_load_045_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_null_load_045_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_null_load_045_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_null_load_051_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_null_load_051_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_null_load_051_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_null_load_051_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_null_load_051_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_null_load_051_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_null_load_051_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_null_load_0_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_null_load_0_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_null_load_0_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_null_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_null_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_null_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memcoalesce_null_load_0_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal gemm_nn9W_function_out_memdep_259_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_function_out_memdep_259_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memdep_259_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal gemm_nn9W_function_out_memdep_259_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memdep_259_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memdep_259_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memdep_259_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal gemm_nn9W_function_out_memdep_264_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_function_out_memdep_264_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memdep_264_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal gemm_nn9W_function_out_memdep_264_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memdep_264_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memdep_264_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memdep_264_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal gemm_nn9W_function_out_memdep_276_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal gemm_nn9W_function_out_memdep_276_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal gemm_nn9W_function_out_memdep_276_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_function_out_memdep_276_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memdep_276_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memdep_276_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memdep_276_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal gemm_nn9W_function_out_memdep_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_function_out_memdep_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memdep_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal gemm_nn9W_function_out_memdep_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memdep_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memdep_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_memdep_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal gemm_nn9W_function_out_o_active_memdep_276 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_unnamed_gemm_nn9W2_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal gemm_nn9W_function_out_unnamed_gemm_nn9W2_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal gemm_nn9W_function_out_unnamed_gemm_nn9W2_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_function_out_unnamed_gemm_nn9W2_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_unnamed_gemm_nn9W2_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_unnamed_gemm_nn9W2_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_function_out_unnamed_gemm_nn9W2_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal gemm_nn9W_function_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- arg_ldc_select(BITSELECT,21)
    arg_ldc_select_b <= kernel_arguments(415 downto 384);

    -- dupName_8_ip_dsdk_adapt_cast_x(BITSELECT,10)
    dupName_8_ip_dsdk_adapt_cast_x_b <= arg_ldc_select_b(31 downto 0);

    -- arg_ldb_select(BITSELECT,20)
    arg_ldb_select_b <= kernel_arguments(319 downto 288);

    -- dupName_6_ip_dsdk_adapt_cast_x(BITSELECT,8)
    dupName_6_ip_dsdk_adapt_cast_x_b <= arg_ldb_select_b(31 downto 0);

    -- arg_lda_select(BITSELECT,19)
    arg_lda_select_b <= kernel_arguments(223 downto 192);

    -- dupName_4_ip_dsdk_adapt_cast_x(BITSELECT,6)
    dupName_4_ip_dsdk_adapt_cast_x_b <= arg_lda_select_b(31 downto 0);

    -- arg_N_select(BITSELECT,18)
    arg_N_select_b <= kernel_arguments(63 downto 32);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,2)
    dupName_0_ip_dsdk_adapt_cast_x_b <= arg_N_select_b(31 downto 0);

    -- arg_M_select(BITSELECT,17)
    arg_M_select_b <= kernel_arguments(31 downto 0);

    -- ip_dsdk_adapt_cast(BITSELECT,95)
    ip_dsdk_adapt_cast_b <= arg_M_select_b(31 downto 0);

    -- arg_K_select(BITSELECT,16)
    arg_K_select_b <= kernel_arguments(95 downto 64);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,3)
    dupName_1_ip_dsdk_adapt_cast_x_b <= arg_K_select_b(31 downto 0);

    -- arg_C_select(BITSELECT,15)
    arg_C_select_b <= kernel_arguments(383 downto 320);

    -- dupName_7_ip_dsdk_adapt_cast_x(BITSELECT,9)
    dupName_7_ip_dsdk_adapt_cast_x_b <= arg_C_select_b(63 downto 0);

    -- arg_B_select(BITSELECT,14)
    arg_B_select_b <= kernel_arguments(287 downto 224);

    -- dupName_5_ip_dsdk_adapt_cast_x(BITSELECT,7)
    dupName_5_ip_dsdk_adapt_cast_x_b <= arg_B_select_b(63 downto 0);

    -- arg_ALPHA_select(BITSELECT,12)
    arg_ALPHA_select_b <= kernel_arguments(127 downto 96);

    -- dupName_2_ip_dsdk_adapt_cast_x(BITSELECT,4)
    dupName_2_ip_dsdk_adapt_cast_x_b <= arg_ALPHA_select_b(31 downto 0);

    -- arg_A_select(BITSELECT,13)
    arg_A_select_b <= kernel_arguments(191 downto 128);

    -- dupName_3_ip_dsdk_adapt_cast_x(BITSELECT,5)
    dupName_3_ip_dsdk_adapt_cast_x_b <= arg_A_select_b(63 downto 0);

    -- gemm_nn9W_function(BLACKBOX,23)
    thegemm_nn9W_function : gemm_nn9W_function
    PORT MAP (
        in_arg_A => dupName_3_ip_dsdk_adapt_cast_x_b,
        in_arg_ALPHA => dupName_2_ip_dsdk_adapt_cast_x_b,
        in_arg_B => dupName_5_ip_dsdk_adapt_cast_x_b,
        in_arg_C => dupName_7_ip_dsdk_adapt_cast_x_b,
        in_arg_K => dupName_1_ip_dsdk_adapt_cast_x_b,
        in_arg_M => ip_dsdk_adapt_cast_b,
        in_arg_N => dupName_0_ip_dsdk_adapt_cast_x_b,
        in_arg_global_size_0 => global_size_0,
        in_arg_global_size_1 => global_size_1,
        in_arg_global_size_2 => global_size_2,
        in_arg_lda => dupName_4_ip_dsdk_adapt_cast_x_b,
        in_arg_ldb => dupName_6_ip_dsdk_adapt_cast_x_b,
        in_arg_ldc => dupName_8_ip_dsdk_adapt_cast_x_b,
        in_arg_local_size_0 => local_size_0,
        in_arg_local_size_1 => local_size_1,
        in_arg_local_size_2 => local_size_2,
        in_memcoalesce_A_load_0_avm_readdata => avm_memcoalesce_A_load_0_readdata,
        in_memcoalesce_A_load_0_avm_readdatavalid => avm_memcoalesce_A_load_0_readdatavalid,
        in_memcoalesce_A_load_0_avm_waitrequest => avm_memcoalesce_A_load_0_waitrequest,
        in_memcoalesce_A_load_0_avm_writeack => avm_memcoalesce_A_load_0_writeack,
        in_memcoalesce_B_load_0_avm_readdata => avm_memcoalesce_B_load_0_readdata,
        in_memcoalesce_B_load_0_avm_readdatavalid => avm_memcoalesce_B_load_0_readdatavalid,
        in_memcoalesce_B_load_0_avm_waitrequest => avm_memcoalesce_B_load_0_waitrequest,
        in_memcoalesce_B_load_0_avm_writeack => avm_memcoalesce_B_load_0_writeack,
        in_memcoalesce_null_load_045_avm_readdata => avm_memcoalesce_null_load_045_readdata,
        in_memcoalesce_null_load_045_avm_readdatavalid => avm_memcoalesce_null_load_045_readdatavalid,
        in_memcoalesce_null_load_045_avm_waitrequest => avm_memcoalesce_null_load_045_waitrequest,
        in_memcoalesce_null_load_045_avm_writeack => avm_memcoalesce_null_load_045_writeack,
        in_memcoalesce_null_load_051_avm_readdata => avm_memcoalesce_null_load_051_readdata,
        in_memcoalesce_null_load_051_avm_readdatavalid => avm_memcoalesce_null_load_051_readdatavalid,
        in_memcoalesce_null_load_051_avm_waitrequest => avm_memcoalesce_null_load_051_waitrequest,
        in_memcoalesce_null_load_051_avm_writeack => avm_memcoalesce_null_load_051_writeack,
        in_memcoalesce_null_load_0_avm_readdata => avm_memcoalesce_null_load_0_readdata,
        in_memcoalesce_null_load_0_avm_readdatavalid => avm_memcoalesce_null_load_0_readdatavalid,
        in_memcoalesce_null_load_0_avm_waitrequest => avm_memcoalesce_null_load_0_waitrequest,
        in_memcoalesce_null_load_0_avm_writeack => avm_memcoalesce_null_load_0_writeack,
        in_memdep_259_avm_readdata => avm_memdep_259_readdata,
        in_memdep_259_avm_readdatavalid => avm_memdep_259_readdatavalid,
        in_memdep_259_avm_waitrequest => avm_memdep_259_waitrequest,
        in_memdep_259_avm_writeack => avm_memdep_259_writeack,
        in_memdep_264_avm_readdata => avm_memdep_264_readdata,
        in_memdep_264_avm_readdatavalid => avm_memdep_264_readdatavalid,
        in_memdep_264_avm_waitrequest => avm_memdep_264_waitrequest,
        in_memdep_264_avm_writeack => avm_memdep_264_writeack,
        in_memdep_276_avm_readdata => avm_memdep_276_readdata,
        in_memdep_276_avm_readdatavalid => avm_memdep_276_readdatavalid,
        in_memdep_276_avm_waitrequest => avm_memdep_276_waitrequest,
        in_memdep_276_avm_writeack => avm_memdep_276_writeack,
        in_memdep_avm_readdata => avm_memdep_readdata,
        in_memdep_avm_readdatavalid => avm_memdep_readdatavalid,
        in_memdep_avm_waitrequest => avm_memdep_waitrequest,
        in_memdep_avm_writeack => avm_memdep_writeack,
        in_stall_in => GND_q,
        in_start => start,
        in_unnamed_gemm_nn9W2_avm_readdata => avm_unnamed_gemm_nn9W2_readdata,
        in_unnamed_gemm_nn9W2_avm_readdatavalid => avm_unnamed_gemm_nn9W2_readdatavalid,
        in_unnamed_gemm_nn9W2_avm_waitrequest => avm_unnamed_gemm_nn9W2_waitrequest,
        in_unnamed_gemm_nn9W2_avm_writeack => avm_unnamed_gemm_nn9W2_writeack,
        in_valid_in => kernel_valid_in,
        out_memcoalesce_A_load_0_avm_address => gemm_nn9W_function_out_memcoalesce_A_load_0_avm_address,
        out_memcoalesce_A_load_0_avm_burstcount => gemm_nn9W_function_out_memcoalesce_A_load_0_avm_burstcount,
        out_memcoalesce_A_load_0_avm_byteenable => gemm_nn9W_function_out_memcoalesce_A_load_0_avm_byteenable,
        out_memcoalesce_A_load_0_avm_enable => gemm_nn9W_function_out_memcoalesce_A_load_0_avm_enable,
        out_memcoalesce_A_load_0_avm_read => gemm_nn9W_function_out_memcoalesce_A_load_0_avm_read,
        out_memcoalesce_A_load_0_avm_write => gemm_nn9W_function_out_memcoalesce_A_load_0_avm_write,
        out_memcoalesce_A_load_0_avm_writedata => gemm_nn9W_function_out_memcoalesce_A_load_0_avm_writedata,
        out_memcoalesce_B_load_0_avm_address => gemm_nn9W_function_out_memcoalesce_B_load_0_avm_address,
        out_memcoalesce_B_load_0_avm_burstcount => gemm_nn9W_function_out_memcoalesce_B_load_0_avm_burstcount,
        out_memcoalesce_B_load_0_avm_byteenable => gemm_nn9W_function_out_memcoalesce_B_load_0_avm_byteenable,
        out_memcoalesce_B_load_0_avm_enable => gemm_nn9W_function_out_memcoalesce_B_load_0_avm_enable,
        out_memcoalesce_B_load_0_avm_read => gemm_nn9W_function_out_memcoalesce_B_load_0_avm_read,
        out_memcoalesce_B_load_0_avm_write => gemm_nn9W_function_out_memcoalesce_B_load_0_avm_write,
        out_memcoalesce_B_load_0_avm_writedata => gemm_nn9W_function_out_memcoalesce_B_load_0_avm_writedata,
        out_memcoalesce_null_load_045_avm_address => gemm_nn9W_function_out_memcoalesce_null_load_045_avm_address,
        out_memcoalesce_null_load_045_avm_burstcount => gemm_nn9W_function_out_memcoalesce_null_load_045_avm_burstcount,
        out_memcoalesce_null_load_045_avm_byteenable => gemm_nn9W_function_out_memcoalesce_null_load_045_avm_byteenable,
        out_memcoalesce_null_load_045_avm_enable => gemm_nn9W_function_out_memcoalesce_null_load_045_avm_enable,
        out_memcoalesce_null_load_045_avm_read => gemm_nn9W_function_out_memcoalesce_null_load_045_avm_read,
        out_memcoalesce_null_load_045_avm_write => gemm_nn9W_function_out_memcoalesce_null_load_045_avm_write,
        out_memcoalesce_null_load_045_avm_writedata => gemm_nn9W_function_out_memcoalesce_null_load_045_avm_writedata,
        out_memcoalesce_null_load_051_avm_address => gemm_nn9W_function_out_memcoalesce_null_load_051_avm_address,
        out_memcoalesce_null_load_051_avm_burstcount => gemm_nn9W_function_out_memcoalesce_null_load_051_avm_burstcount,
        out_memcoalesce_null_load_051_avm_byteenable => gemm_nn9W_function_out_memcoalesce_null_load_051_avm_byteenable,
        out_memcoalesce_null_load_051_avm_enable => gemm_nn9W_function_out_memcoalesce_null_load_051_avm_enable,
        out_memcoalesce_null_load_051_avm_read => gemm_nn9W_function_out_memcoalesce_null_load_051_avm_read,
        out_memcoalesce_null_load_051_avm_write => gemm_nn9W_function_out_memcoalesce_null_load_051_avm_write,
        out_memcoalesce_null_load_051_avm_writedata => gemm_nn9W_function_out_memcoalesce_null_load_051_avm_writedata,
        out_memcoalesce_null_load_0_avm_address => gemm_nn9W_function_out_memcoalesce_null_load_0_avm_address,
        out_memcoalesce_null_load_0_avm_burstcount => gemm_nn9W_function_out_memcoalesce_null_load_0_avm_burstcount,
        out_memcoalesce_null_load_0_avm_byteenable => gemm_nn9W_function_out_memcoalesce_null_load_0_avm_byteenable,
        out_memcoalesce_null_load_0_avm_enable => gemm_nn9W_function_out_memcoalesce_null_load_0_avm_enable,
        out_memcoalesce_null_load_0_avm_read => gemm_nn9W_function_out_memcoalesce_null_load_0_avm_read,
        out_memcoalesce_null_load_0_avm_write => gemm_nn9W_function_out_memcoalesce_null_load_0_avm_write,
        out_memcoalesce_null_load_0_avm_writedata => gemm_nn9W_function_out_memcoalesce_null_load_0_avm_writedata,
        out_memdep_259_avm_address => gemm_nn9W_function_out_memdep_259_avm_address,
        out_memdep_259_avm_burstcount => gemm_nn9W_function_out_memdep_259_avm_burstcount,
        out_memdep_259_avm_byteenable => gemm_nn9W_function_out_memdep_259_avm_byteenable,
        out_memdep_259_avm_enable => gemm_nn9W_function_out_memdep_259_avm_enable,
        out_memdep_259_avm_read => gemm_nn9W_function_out_memdep_259_avm_read,
        out_memdep_259_avm_write => gemm_nn9W_function_out_memdep_259_avm_write,
        out_memdep_259_avm_writedata => gemm_nn9W_function_out_memdep_259_avm_writedata,
        out_memdep_264_avm_address => gemm_nn9W_function_out_memdep_264_avm_address,
        out_memdep_264_avm_burstcount => gemm_nn9W_function_out_memdep_264_avm_burstcount,
        out_memdep_264_avm_byteenable => gemm_nn9W_function_out_memdep_264_avm_byteenable,
        out_memdep_264_avm_enable => gemm_nn9W_function_out_memdep_264_avm_enable,
        out_memdep_264_avm_read => gemm_nn9W_function_out_memdep_264_avm_read,
        out_memdep_264_avm_write => gemm_nn9W_function_out_memdep_264_avm_write,
        out_memdep_264_avm_writedata => gemm_nn9W_function_out_memdep_264_avm_writedata,
        out_memdep_276_avm_address => gemm_nn9W_function_out_memdep_276_avm_address,
        out_memdep_276_avm_burstcount => gemm_nn9W_function_out_memdep_276_avm_burstcount,
        out_memdep_276_avm_byteenable => gemm_nn9W_function_out_memdep_276_avm_byteenable,
        out_memdep_276_avm_enable => gemm_nn9W_function_out_memdep_276_avm_enable,
        out_memdep_276_avm_read => gemm_nn9W_function_out_memdep_276_avm_read,
        out_memdep_276_avm_write => gemm_nn9W_function_out_memdep_276_avm_write,
        out_memdep_276_avm_writedata => gemm_nn9W_function_out_memdep_276_avm_writedata,
        out_memdep_avm_address => gemm_nn9W_function_out_memdep_avm_address,
        out_memdep_avm_burstcount => gemm_nn9W_function_out_memdep_avm_burstcount,
        out_memdep_avm_byteenable => gemm_nn9W_function_out_memdep_avm_byteenable,
        out_memdep_avm_enable => gemm_nn9W_function_out_memdep_avm_enable,
        out_memdep_avm_read => gemm_nn9W_function_out_memdep_avm_read,
        out_memdep_avm_write => gemm_nn9W_function_out_memdep_avm_write,
        out_memdep_avm_writedata => gemm_nn9W_function_out_memdep_avm_writedata,
        out_o_active_memdep_276 => gemm_nn9W_function_out_o_active_memdep_276,
        out_stall_out => gemm_nn9W_function_out_stall_out,
        out_unnamed_gemm_nn9W2_avm_address => gemm_nn9W_function_out_unnamed_gemm_nn9W2_avm_address,
        out_unnamed_gemm_nn9W2_avm_burstcount => gemm_nn9W_function_out_unnamed_gemm_nn9W2_avm_burstcount,
        out_unnamed_gemm_nn9W2_avm_byteenable => gemm_nn9W_function_out_unnamed_gemm_nn9W2_avm_byteenable,
        out_unnamed_gemm_nn9W2_avm_enable => gemm_nn9W_function_out_unnamed_gemm_nn9W2_avm_enable,
        out_unnamed_gemm_nn9W2_avm_read => gemm_nn9W_function_out_unnamed_gemm_nn9W2_avm_read,
        out_unnamed_gemm_nn9W2_avm_write => gemm_nn9W_function_out_unnamed_gemm_nn9W2_avm_write,
        out_unnamed_gemm_nn9W2_avm_writedata => gemm_nn9W_function_out_unnamed_gemm_nn9W2_avm_writedata,
        out_valid_out => gemm_nn9W_function_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- avm_memcoalesce_A_load_0_address(GPOUT,96)
    avm_memcoalesce_A_load_0_address <= gemm_nn9W_function_out_memcoalesce_A_load_0_avm_address;

    -- avm_memcoalesce_A_load_0_burstcount(GPOUT,97)
    avm_memcoalesce_A_load_0_burstcount <= gemm_nn9W_function_out_memcoalesce_A_load_0_avm_burstcount;

    -- avm_memcoalesce_A_load_0_byteenable(GPOUT,98)
    avm_memcoalesce_A_load_0_byteenable <= gemm_nn9W_function_out_memcoalesce_A_load_0_avm_byteenable;

    -- avm_memcoalesce_A_load_0_enable(GPOUT,99)
    avm_memcoalesce_A_load_0_enable <= gemm_nn9W_function_out_memcoalesce_A_load_0_avm_enable;

    -- avm_memcoalesce_A_load_0_read(GPOUT,100)
    avm_memcoalesce_A_load_0_read <= gemm_nn9W_function_out_memcoalesce_A_load_0_avm_read;

    -- avm_memcoalesce_A_load_0_write(GPOUT,101)
    avm_memcoalesce_A_load_0_write <= gemm_nn9W_function_out_memcoalesce_A_load_0_avm_write;

    -- avm_memcoalesce_A_load_0_writedata(GPOUT,102)
    avm_memcoalesce_A_load_0_writedata <= gemm_nn9W_function_out_memcoalesce_A_load_0_avm_writedata;

    -- avm_memcoalesce_B_load_0_address(GPOUT,103)
    avm_memcoalesce_B_load_0_address <= gemm_nn9W_function_out_memcoalesce_B_load_0_avm_address;

    -- avm_memcoalesce_B_load_0_burstcount(GPOUT,104)
    avm_memcoalesce_B_load_0_burstcount <= gemm_nn9W_function_out_memcoalesce_B_load_0_avm_burstcount;

    -- avm_memcoalesce_B_load_0_byteenable(GPOUT,105)
    avm_memcoalesce_B_load_0_byteenable <= gemm_nn9W_function_out_memcoalesce_B_load_0_avm_byteenable;

    -- avm_memcoalesce_B_load_0_enable(GPOUT,106)
    avm_memcoalesce_B_load_0_enable <= gemm_nn9W_function_out_memcoalesce_B_load_0_avm_enable;

    -- avm_memcoalesce_B_load_0_read(GPOUT,107)
    avm_memcoalesce_B_load_0_read <= gemm_nn9W_function_out_memcoalesce_B_load_0_avm_read;

    -- avm_memcoalesce_B_load_0_write(GPOUT,108)
    avm_memcoalesce_B_load_0_write <= gemm_nn9W_function_out_memcoalesce_B_load_0_avm_write;

    -- avm_memcoalesce_B_load_0_writedata(GPOUT,109)
    avm_memcoalesce_B_load_0_writedata <= gemm_nn9W_function_out_memcoalesce_B_load_0_avm_writedata;

    -- avm_memcoalesce_null_load_045_address(GPOUT,110)
    avm_memcoalesce_null_load_045_address <= gemm_nn9W_function_out_memcoalesce_null_load_045_avm_address;

    -- avm_memcoalesce_null_load_045_burstcount(GPOUT,111)
    avm_memcoalesce_null_load_045_burstcount <= gemm_nn9W_function_out_memcoalesce_null_load_045_avm_burstcount;

    -- avm_memcoalesce_null_load_045_byteenable(GPOUT,112)
    avm_memcoalesce_null_load_045_byteenable <= gemm_nn9W_function_out_memcoalesce_null_load_045_avm_byteenable;

    -- avm_memcoalesce_null_load_045_enable(GPOUT,113)
    avm_memcoalesce_null_load_045_enable <= gemm_nn9W_function_out_memcoalesce_null_load_045_avm_enable;

    -- avm_memcoalesce_null_load_045_read(GPOUT,114)
    avm_memcoalesce_null_load_045_read <= gemm_nn9W_function_out_memcoalesce_null_load_045_avm_read;

    -- avm_memcoalesce_null_load_045_write(GPOUT,115)
    avm_memcoalesce_null_load_045_write <= gemm_nn9W_function_out_memcoalesce_null_load_045_avm_write;

    -- avm_memcoalesce_null_load_045_writedata(GPOUT,116)
    avm_memcoalesce_null_load_045_writedata <= gemm_nn9W_function_out_memcoalesce_null_load_045_avm_writedata;

    -- avm_memcoalesce_null_load_051_address(GPOUT,117)
    avm_memcoalesce_null_load_051_address <= gemm_nn9W_function_out_memcoalesce_null_load_051_avm_address;

    -- avm_memcoalesce_null_load_051_burstcount(GPOUT,118)
    avm_memcoalesce_null_load_051_burstcount <= gemm_nn9W_function_out_memcoalesce_null_load_051_avm_burstcount;

    -- avm_memcoalesce_null_load_051_byteenable(GPOUT,119)
    avm_memcoalesce_null_load_051_byteenable <= gemm_nn9W_function_out_memcoalesce_null_load_051_avm_byteenable;

    -- avm_memcoalesce_null_load_051_enable(GPOUT,120)
    avm_memcoalesce_null_load_051_enable <= gemm_nn9W_function_out_memcoalesce_null_load_051_avm_enable;

    -- avm_memcoalesce_null_load_051_read(GPOUT,121)
    avm_memcoalesce_null_load_051_read <= gemm_nn9W_function_out_memcoalesce_null_load_051_avm_read;

    -- avm_memcoalesce_null_load_051_write(GPOUT,122)
    avm_memcoalesce_null_load_051_write <= gemm_nn9W_function_out_memcoalesce_null_load_051_avm_write;

    -- avm_memcoalesce_null_load_051_writedata(GPOUT,123)
    avm_memcoalesce_null_load_051_writedata <= gemm_nn9W_function_out_memcoalesce_null_load_051_avm_writedata;

    -- avm_memcoalesce_null_load_0_address(GPOUT,124)
    avm_memcoalesce_null_load_0_address <= gemm_nn9W_function_out_memcoalesce_null_load_0_avm_address;

    -- avm_memcoalesce_null_load_0_burstcount(GPOUT,125)
    avm_memcoalesce_null_load_0_burstcount <= gemm_nn9W_function_out_memcoalesce_null_load_0_avm_burstcount;

    -- avm_memcoalesce_null_load_0_byteenable(GPOUT,126)
    avm_memcoalesce_null_load_0_byteenable <= gemm_nn9W_function_out_memcoalesce_null_load_0_avm_byteenable;

    -- avm_memcoalesce_null_load_0_enable(GPOUT,127)
    avm_memcoalesce_null_load_0_enable <= gemm_nn9W_function_out_memcoalesce_null_load_0_avm_enable;

    -- avm_memcoalesce_null_load_0_read(GPOUT,128)
    avm_memcoalesce_null_load_0_read <= gemm_nn9W_function_out_memcoalesce_null_load_0_avm_read;

    -- avm_memcoalesce_null_load_0_write(GPOUT,129)
    avm_memcoalesce_null_load_0_write <= gemm_nn9W_function_out_memcoalesce_null_load_0_avm_write;

    -- avm_memcoalesce_null_load_0_writedata(GPOUT,130)
    avm_memcoalesce_null_load_0_writedata <= gemm_nn9W_function_out_memcoalesce_null_load_0_avm_writedata;

    -- avm_memdep_259_address(GPOUT,131)
    avm_memdep_259_address <= gemm_nn9W_function_out_memdep_259_avm_address;

    -- avm_memdep_259_burstcount(GPOUT,132)
    avm_memdep_259_burstcount <= gemm_nn9W_function_out_memdep_259_avm_burstcount;

    -- avm_memdep_259_byteenable(GPOUT,133)
    avm_memdep_259_byteenable <= gemm_nn9W_function_out_memdep_259_avm_byteenable;

    -- avm_memdep_259_enable(GPOUT,134)
    avm_memdep_259_enable <= gemm_nn9W_function_out_memdep_259_avm_enable;

    -- avm_memdep_259_read(GPOUT,135)
    avm_memdep_259_read <= gemm_nn9W_function_out_memdep_259_avm_read;

    -- avm_memdep_259_write(GPOUT,136)
    avm_memdep_259_write <= gemm_nn9W_function_out_memdep_259_avm_write;

    -- avm_memdep_259_writedata(GPOUT,137)
    avm_memdep_259_writedata <= gemm_nn9W_function_out_memdep_259_avm_writedata;

    -- avm_memdep_264_address(GPOUT,138)
    avm_memdep_264_address <= gemm_nn9W_function_out_memdep_264_avm_address;

    -- avm_memdep_264_burstcount(GPOUT,139)
    avm_memdep_264_burstcount <= gemm_nn9W_function_out_memdep_264_avm_burstcount;

    -- avm_memdep_264_byteenable(GPOUT,140)
    avm_memdep_264_byteenable <= gemm_nn9W_function_out_memdep_264_avm_byteenable;

    -- avm_memdep_264_enable(GPOUT,141)
    avm_memdep_264_enable <= gemm_nn9W_function_out_memdep_264_avm_enable;

    -- avm_memdep_264_read(GPOUT,142)
    avm_memdep_264_read <= gemm_nn9W_function_out_memdep_264_avm_read;

    -- avm_memdep_264_write(GPOUT,143)
    avm_memdep_264_write <= gemm_nn9W_function_out_memdep_264_avm_write;

    -- avm_memdep_264_writedata(GPOUT,144)
    avm_memdep_264_writedata <= gemm_nn9W_function_out_memdep_264_avm_writedata;

    -- avm_memdep_276_address(GPOUT,145)
    avm_memdep_276_address <= gemm_nn9W_function_out_memdep_276_avm_address;

    -- avm_memdep_276_burstcount(GPOUT,146)
    avm_memdep_276_burstcount <= gemm_nn9W_function_out_memdep_276_avm_burstcount;

    -- avm_memdep_276_byteenable(GPOUT,147)
    avm_memdep_276_byteenable <= gemm_nn9W_function_out_memdep_276_avm_byteenable;

    -- avm_memdep_276_enable(GPOUT,148)
    avm_memdep_276_enable <= gemm_nn9W_function_out_memdep_276_avm_enable;

    -- avm_memdep_276_read(GPOUT,149)
    avm_memdep_276_read <= gemm_nn9W_function_out_memdep_276_avm_read;

    -- avm_memdep_276_write(GPOUT,150)
    avm_memdep_276_write <= gemm_nn9W_function_out_memdep_276_avm_write;

    -- avm_memdep_276_writedata(GPOUT,151)
    avm_memdep_276_writedata <= gemm_nn9W_function_out_memdep_276_avm_writedata;

    -- avm_memdep_address(GPOUT,152)
    avm_memdep_address <= gemm_nn9W_function_out_memdep_avm_address;

    -- avm_memdep_burstcount(GPOUT,153)
    avm_memdep_burstcount <= gemm_nn9W_function_out_memdep_avm_burstcount;

    -- avm_memdep_byteenable(GPOUT,154)
    avm_memdep_byteenable <= gemm_nn9W_function_out_memdep_avm_byteenable;

    -- avm_memdep_enable(GPOUT,155)
    avm_memdep_enable <= gemm_nn9W_function_out_memdep_avm_enable;

    -- avm_memdep_read(GPOUT,156)
    avm_memdep_read <= gemm_nn9W_function_out_memdep_avm_read;

    -- avm_memdep_write(GPOUT,157)
    avm_memdep_write <= gemm_nn9W_function_out_memdep_avm_write;

    -- avm_memdep_writedata(GPOUT,158)
    avm_memdep_writedata <= gemm_nn9W_function_out_memdep_avm_writedata;

    -- avm_unnamed_gemm_nn9W2_address(GPOUT,159)
    avm_unnamed_gemm_nn9W2_address <= gemm_nn9W_function_out_unnamed_gemm_nn9W2_avm_address;

    -- avm_unnamed_gemm_nn9W2_burstcount(GPOUT,160)
    avm_unnamed_gemm_nn9W2_burstcount <= gemm_nn9W_function_out_unnamed_gemm_nn9W2_avm_burstcount;

    -- avm_unnamed_gemm_nn9W2_byteenable(GPOUT,161)
    avm_unnamed_gemm_nn9W2_byteenable <= gemm_nn9W_function_out_unnamed_gemm_nn9W2_avm_byteenable;

    -- avm_unnamed_gemm_nn9W2_enable(GPOUT,162)
    avm_unnamed_gemm_nn9W2_enable <= gemm_nn9W_function_out_unnamed_gemm_nn9W2_avm_enable;

    -- avm_unnamed_gemm_nn9W2_read(GPOUT,163)
    avm_unnamed_gemm_nn9W2_read <= gemm_nn9W_function_out_unnamed_gemm_nn9W2_avm_read;

    -- avm_unnamed_gemm_nn9W2_write(GPOUT,164)
    avm_unnamed_gemm_nn9W2_write <= gemm_nn9W_function_out_unnamed_gemm_nn9W2_avm_write;

    -- avm_unnamed_gemm_nn9W2_writedata(GPOUT,165)
    avm_unnamed_gemm_nn9W2_writedata <= gemm_nn9W_function_out_unnamed_gemm_nn9W2_avm_writedata;

    -- acl_clock2x_dummy_consumer(EXTIFACE,11)
    acl_clock2x_dummy_consumer_clock2x <= clock2x;
    acl_clock2x_dummy_consumer_clock2x_bitsignaltemp <= acl_clock2x_dummy_consumer_clock2x(0);
    acl_clock2x_dummy_consumer_myout(0) <= acl_clock2x_dummy_consumer_myout_bitsignaltemp;
    theacl_clock2x_dummy_consumer : acl_clock2x_holder
    PORT MAP (
        clock2x => acl_clock2x_dummy_consumer_clock2x_bitsignaltemp,
        myout => acl_clock2x_dummy_consumer_myout_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- clock2x_output(GPOUT,166)
    clock2x_output <= acl_clock2x_dummy_consumer_myout;

    -- has_a_lsu_active(GPOUT,167)
    has_a_lsu_active <= gemm_nn9W_function_out_o_active_memdep_276;

    -- has_a_write_pending(GPOUT,168)
    has_a_write_pending <= gemm_nn9W_function_out_o_active_memdep_276;

    -- kernel_stall_out(GPOUT,169)
    kernel_stall_out <= gemm_nn9W_function_out_stall_out;

    -- kernel_valid_out(GPOUT,170)
    kernel_valid_out <= gemm_nn9W_function_out_valid_out;

END normal;
