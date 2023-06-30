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

-- VHDL created from bb_gemm_nn9W_B2
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

entity bb_gemm_nn9W_B2 is
    port (
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
        out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_B_load_0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memcoalesce_B_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memcoalesce_B_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_B_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_B_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_B_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_B_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
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
        out_memdep_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        in_A : in std_logic_vector(63 downto 0);  -- ufix64
        in_B : in std_logic_vector(63 downto 0);  -- ufix64
        in_C : in std_logic_vector(63 downto 0);  -- ufix64
        in_K : in std_logic_vector(31 downto 0);  -- ufix32
        in_M : in std_logic_vector(31 downto 0);  -- ufix32
        in_N : in std_logic_vector(31 downto 0);  -- ufix32
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked303319_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked303319_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_j_076_pop9321_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_076_pop9321_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_lda : in std_logic_vector(31 downto 0);  -- ufix32
        in_lda_sync_buffer320_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_lda_sync_buffer320_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_ldc : in std_logic_vector(31 downto 0);  -- ufix32
        in_memcoalesce_B_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_B_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_B_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_B_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_259_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_259_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_259_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_259_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_264_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_264_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_264_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_264_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi261_pop11324_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi261_pop11324_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi266_pop12325_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi266_pop12325_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi269_pop13326_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi269_pop13326_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi272_pop14327_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi272_pop14327_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi274_pop15328_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi274_pop15328_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi_pop10323_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi_pop10323_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_notexit300322_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_notexit300322_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W0_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nn9W_B2;

architecture normal of bb_gemm_nn9W_B2 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component gemm_nn9W_B2_branch is
        port (
            in_c0_exit340_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit340_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit340_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit340_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit340_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit340_5 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit340_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit340_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit340_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit340_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit340_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit340_11 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit340_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit340_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit340_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit340_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nn9W_B2_stall_region is
        port (
            in_B : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_K : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked303319 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_j_076_pop9321 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_lda_sync_buffer320 : in std_logic_vector(31 downto 0);  -- Fixed Point
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
            in_memdep_phi261_pop11324 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi266_pop12325 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi269_pop13326 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi272_pop14327 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi274_pop15328 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi_pop10323 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit300322 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gemm_nn9W_B2_merge is
        port (
            in_forked303319_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked303319_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_j_076_pop9321_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_076_pop9321_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_lda_sync_buffer320_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_lda_sync_buffer320_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
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
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W0_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_forked : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_forked303319 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_j_076_pop9321 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_lda_sync_buffer320 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_phi261_pop11324 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi266_pop12325 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi269_pop13326 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi272_pop14327 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi274_pop15328 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi_pop10323 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_notexit300322 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nn9W0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_5 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_c1_exit_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_c1_exit_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_c1_exit_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_c1_exit_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_branch_aunroll_x_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_c0_exit340_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_c0_exit340_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_c0_exit340_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_c0_exit340_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_c0_exit340_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_c0_exit340_5 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_c0_exit340_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_c0_exit340_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_c0_exit340_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_c0_exit340_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_c0_exit340_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_c0_exit340_11 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_c0_exit340_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_c0_exit340_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_c0_exit340_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_c0_exit340_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_c1_exit_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_c1_exit_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_c1_exit_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_c1_exit_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_c0_exe12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memcoalesce_B_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memcoalesce_B_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memcoalesce_B_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memcoalesce_B_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memcoalesce_B_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memcoalesce_B_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memcoalesce_B_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memdep_259_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memdep_259_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memdep_259_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memdep_259_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memdep_259_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memdep_259_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memdep_259_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memdep_264_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memdep_264_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memdep_264_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memdep_264_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memdep_264_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memdep_264_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memdep_264_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memdep_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memdep_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memdep_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memdep_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memdep_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memdep_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_memdep_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B2_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_out_forked : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_out_forked303319 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_out_j_076_pop9321 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B2_merge_out_lda_sync_buffer320 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B2_merge_out_memdep_phi261_pop11324 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_out_memdep_phi266_pop12325 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_out_memdep_phi269_pop13326 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_out_memdep_phi272_pop14327 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_out_memdep_phi274_pop15328 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_out_memdep_phi_pop10323 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_out_notexit300322 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_out_unnamed_gemm_nn9W0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B2_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- gemm_nn9W_B2_merge(BLACKBOX,58)
    thegemm_nn9W_B2_merge : gemm_nn9W_B2_merge
    PORT MAP (
        in_forked303319_0 => in_forked303319_0,
        in_forked303319_1 => in_forked303319_1,
        in_forked_0 => in_forked_0,
        in_forked_1 => in_forked_1,
        in_j_076_pop9321_0 => in_j_076_pop9321_0,
        in_j_076_pop9321_1 => in_j_076_pop9321_1,
        in_lda_sync_buffer320_0 => in_lda_sync_buffer320_0,
        in_lda_sync_buffer320_1 => in_lda_sync_buffer320_1,
        in_memdep_phi261_pop11324_0 => in_memdep_phi261_pop11324_0,
        in_memdep_phi261_pop11324_1 => in_memdep_phi261_pop11324_1,
        in_memdep_phi266_pop12325_0 => in_memdep_phi266_pop12325_0,
        in_memdep_phi266_pop12325_1 => in_memdep_phi266_pop12325_1,
        in_memdep_phi269_pop13326_0 => in_memdep_phi269_pop13326_0,
        in_memdep_phi269_pop13326_1 => in_memdep_phi269_pop13326_1,
        in_memdep_phi272_pop14327_0 => in_memdep_phi272_pop14327_0,
        in_memdep_phi272_pop14327_1 => in_memdep_phi272_pop14327_1,
        in_memdep_phi274_pop15328_0 => in_memdep_phi274_pop15328_0,
        in_memdep_phi274_pop15328_1 => in_memdep_phi274_pop15328_1,
        in_memdep_phi_pop10323_0 => in_memdep_phi_pop10323_0,
        in_memdep_phi_pop10323_1 => in_memdep_phi_pop10323_1,
        in_notexit300322_0 => in_notexit300322_0,
        in_notexit300322_1 => in_notexit300322_1,
        in_stall_in => bb_gemm_nn9W_B2_stall_region_out_stall_out,
        in_unnamed_gemm_nn9W0_0 => in_unnamed_gemm_nn9W0_0,
        in_unnamed_gemm_nn9W0_1 => in_unnamed_gemm_nn9W0_1,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_forked => gemm_nn9W_B2_merge_out_forked,
        out_forked303319 => gemm_nn9W_B2_merge_out_forked303319,
        out_j_076_pop9321 => gemm_nn9W_B2_merge_out_j_076_pop9321,
        out_lda_sync_buffer320 => gemm_nn9W_B2_merge_out_lda_sync_buffer320,
        out_memdep_phi261_pop11324 => gemm_nn9W_B2_merge_out_memdep_phi261_pop11324,
        out_memdep_phi266_pop12325 => gemm_nn9W_B2_merge_out_memdep_phi266_pop12325,
        out_memdep_phi269_pop13326 => gemm_nn9W_B2_merge_out_memdep_phi269_pop13326,
        out_memdep_phi272_pop14327 => gemm_nn9W_B2_merge_out_memdep_phi272_pop14327,
        out_memdep_phi274_pop15328 => gemm_nn9W_B2_merge_out_memdep_phi274_pop15328,
        out_memdep_phi_pop10323 => gemm_nn9W_B2_merge_out_memdep_phi_pop10323,
        out_notexit300322 => gemm_nn9W_B2_merge_out_notexit300322,
        out_stall_out_0 => gemm_nn9W_B2_merge_out_stall_out_0,
        out_stall_out_1 => gemm_nn9W_B2_merge_out_stall_out_1,
        out_unnamed_gemm_nn9W0 => gemm_nn9W_B2_merge_out_unnamed_gemm_nn9W0,
        out_valid_out => gemm_nn9W_B2_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nn9W_B2_stall_region(BLACKBOX,57)
    thebb_gemm_nn9W_B2_stall_region : bb_gemm_nn9W_B2_stall_region
    PORT MAP (
        in_B => in_B,
        in_K => in_K,
        in_N => in_N,
        in_flush => in_flush,
        in_forked => gemm_nn9W_B2_merge_out_forked,
        in_forked303319 => gemm_nn9W_B2_merge_out_forked303319,
        in_j_076_pop9321 => gemm_nn9W_B2_merge_out_j_076_pop9321,
        in_lda_sync_buffer320 => gemm_nn9W_B2_merge_out_lda_sync_buffer320,
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
        in_memdep_phi261_pop11324 => gemm_nn9W_B2_merge_out_memdep_phi261_pop11324,
        in_memdep_phi266_pop12325 => gemm_nn9W_B2_merge_out_memdep_phi266_pop12325,
        in_memdep_phi269_pop13326 => gemm_nn9W_B2_merge_out_memdep_phi269_pop13326,
        in_memdep_phi272_pop14327 => gemm_nn9W_B2_merge_out_memdep_phi272_pop14327,
        in_memdep_phi274_pop15328 => gemm_nn9W_B2_merge_out_memdep_phi274_pop15328,
        in_memdep_phi_pop10323 => gemm_nn9W_B2_merge_out_memdep_phi_pop10323,
        in_notexit300322 => gemm_nn9W_B2_merge_out_notexit300322,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_stall_in => gemm_nn9W_B2_branch_aunroll_x_out_stall_out,
        in_unnamed_gemm_nn9W0 => gemm_nn9W_B2_merge_out_unnamed_gemm_nn9W0,
        in_valid_in => gemm_nn9W_B2_merge_out_valid_out,
        out_c0_exit340_0 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_0,
        out_c0_exit340_1 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_1,
        out_c0_exit340_2 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_2,
        out_c0_exit340_3 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_3,
        out_c0_exit340_4 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_4,
        out_c0_exit340_5 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_5,
        out_c0_exit340_6 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_6,
        out_c0_exit340_7 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_7,
        out_c0_exit340_8 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_8,
        out_c0_exit340_9 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_9,
        out_c0_exit340_10 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_10,
        out_c0_exit340_11 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_11,
        out_c0_exit340_12 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_12,
        out_c0_exit340_13 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_13,
        out_c0_exit340_14 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_14,
        out_c0_exit340_15 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_15,
        out_c1_exit_0 => bb_gemm_nn9W_B2_stall_region_out_c1_exit_0,
        out_c1_exit_1 => bb_gemm_nn9W_B2_stall_region_out_c1_exit_1,
        out_c1_exit_2 => bb_gemm_nn9W_B2_stall_region_out_c1_exit_2,
        out_c1_exit_3 => bb_gemm_nn9W_B2_stall_region_out_c1_exit_3,
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_stall_out => bb_gemm_nn9W_B2_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_valid_out => bb_gemm_nn9W_B2_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_valid_out,
        out_c0_exe12 => bb_gemm_nn9W_B2_stall_region_out_c0_exe12,
        out_memcoalesce_B_load_0_avm_address => bb_gemm_nn9W_B2_stall_region_out_memcoalesce_B_load_0_avm_address,
        out_memcoalesce_B_load_0_avm_burstcount => bb_gemm_nn9W_B2_stall_region_out_memcoalesce_B_load_0_avm_burstcount,
        out_memcoalesce_B_load_0_avm_byteenable => bb_gemm_nn9W_B2_stall_region_out_memcoalesce_B_load_0_avm_byteenable,
        out_memcoalesce_B_load_0_avm_enable => bb_gemm_nn9W_B2_stall_region_out_memcoalesce_B_load_0_avm_enable,
        out_memcoalesce_B_load_0_avm_read => bb_gemm_nn9W_B2_stall_region_out_memcoalesce_B_load_0_avm_read,
        out_memcoalesce_B_load_0_avm_write => bb_gemm_nn9W_B2_stall_region_out_memcoalesce_B_load_0_avm_write,
        out_memcoalesce_B_load_0_avm_writedata => bb_gemm_nn9W_B2_stall_region_out_memcoalesce_B_load_0_avm_writedata,
        out_memdep_259_avm_address => bb_gemm_nn9W_B2_stall_region_out_memdep_259_avm_address,
        out_memdep_259_avm_burstcount => bb_gemm_nn9W_B2_stall_region_out_memdep_259_avm_burstcount,
        out_memdep_259_avm_byteenable => bb_gemm_nn9W_B2_stall_region_out_memdep_259_avm_byteenable,
        out_memdep_259_avm_enable => bb_gemm_nn9W_B2_stall_region_out_memdep_259_avm_enable,
        out_memdep_259_avm_read => bb_gemm_nn9W_B2_stall_region_out_memdep_259_avm_read,
        out_memdep_259_avm_write => bb_gemm_nn9W_B2_stall_region_out_memdep_259_avm_write,
        out_memdep_259_avm_writedata => bb_gemm_nn9W_B2_stall_region_out_memdep_259_avm_writedata,
        out_memdep_264_avm_address => bb_gemm_nn9W_B2_stall_region_out_memdep_264_avm_address,
        out_memdep_264_avm_burstcount => bb_gemm_nn9W_B2_stall_region_out_memdep_264_avm_burstcount,
        out_memdep_264_avm_byteenable => bb_gemm_nn9W_B2_stall_region_out_memdep_264_avm_byteenable,
        out_memdep_264_avm_enable => bb_gemm_nn9W_B2_stall_region_out_memdep_264_avm_enable,
        out_memdep_264_avm_read => bb_gemm_nn9W_B2_stall_region_out_memdep_264_avm_read,
        out_memdep_264_avm_write => bb_gemm_nn9W_B2_stall_region_out_memdep_264_avm_write,
        out_memdep_264_avm_writedata => bb_gemm_nn9W_B2_stall_region_out_memdep_264_avm_writedata,
        out_memdep_avm_address => bb_gemm_nn9W_B2_stall_region_out_memdep_avm_address,
        out_memdep_avm_burstcount => bb_gemm_nn9W_B2_stall_region_out_memdep_avm_burstcount,
        out_memdep_avm_byteenable => bb_gemm_nn9W_B2_stall_region_out_memdep_avm_byteenable,
        out_memdep_avm_enable => bb_gemm_nn9W_B2_stall_region_out_memdep_avm_enable,
        out_memdep_avm_read => bb_gemm_nn9W_B2_stall_region_out_memdep_avm_read,
        out_memdep_avm_write => bb_gemm_nn9W_B2_stall_region_out_memdep_avm_write,
        out_memdep_avm_writedata => bb_gemm_nn9W_B2_stall_region_out_memdep_avm_writedata,
        out_pipeline_valid_out => bb_gemm_nn9W_B2_stall_region_out_pipeline_valid_out,
        out_stall_out => bb_gemm_nn9W_B2_stall_region_out_stall_out,
        out_valid_out => bb_gemm_nn9W_B2_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- gemm_nn9W_B2_branch_aunroll_x(BLACKBOX,2)
    thegemm_nn9W_B2_branch_aunroll_x : gemm_nn9W_B2_branch
    PORT MAP (
        in_c0_exit340_0 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_0,
        in_c0_exit340_1 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_1,
        in_c0_exit340_2 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_2,
        in_c0_exit340_3 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_3,
        in_c0_exit340_4 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_4,
        in_c0_exit340_5 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_5,
        in_c0_exit340_6 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_6,
        in_c0_exit340_7 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_7,
        in_c0_exit340_8 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_8,
        in_c0_exit340_9 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_9,
        in_c0_exit340_10 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_10,
        in_c0_exit340_11 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_11,
        in_c0_exit340_12 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_12,
        in_c0_exit340_13 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_13,
        in_c0_exit340_14 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_14,
        in_c0_exit340_15 => bb_gemm_nn9W_B2_stall_region_out_c0_exit340_15,
        in_c1_exit_0 => bb_gemm_nn9W_B2_stall_region_out_c1_exit_0,
        in_c1_exit_1 => bb_gemm_nn9W_B2_stall_region_out_c1_exit_1,
        in_c1_exit_2 => bb_gemm_nn9W_B2_stall_region_out_c1_exit_2,
        in_c1_exit_3 => bb_gemm_nn9W_B2_stall_region_out_c1_exit_3,
        in_c0_exe12 => bb_gemm_nn9W_B2_stall_region_out_c0_exe12,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_valid_in => bb_gemm_nn9W_B2_stall_region_out_valid_out,
        out_c0_exit340_0 => gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_0,
        out_c0_exit340_1 => gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_1,
        out_c0_exit340_2 => gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_2,
        out_c0_exit340_3 => gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_3,
        out_c0_exit340_4 => gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_4,
        out_c0_exit340_5 => gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_5,
        out_c0_exit340_6 => gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_6,
        out_c0_exit340_7 => gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_7,
        out_c0_exit340_8 => gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_8,
        out_c0_exit340_9 => gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_9,
        out_c0_exit340_10 => gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_10,
        out_c0_exit340_11 => gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_11,
        out_c0_exit340_12 => gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_12,
        out_c0_exit340_13 => gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_13,
        out_c0_exit340_14 => gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_14,
        out_c0_exit340_15 => gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_15,
        out_c1_exit_0 => gemm_nn9W_B2_branch_aunroll_x_out_c1_exit_0,
        out_c1_exit_1 => gemm_nn9W_B2_branch_aunroll_x_out_c1_exit_1,
        out_c1_exit_2 => gemm_nn9W_B2_branch_aunroll_x_out_c1_exit_2,
        out_c1_exit_3 => gemm_nn9W_B2_branch_aunroll_x_out_c1_exit_3,
        out_stall_out => gemm_nn9W_B2_branch_aunroll_x_out_stall_out,
        out_valid_out_0 => gemm_nn9W_B2_branch_aunroll_x_out_valid_out_0,
        out_valid_out_1 => gemm_nn9W_B2_branch_aunroll_x_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exit340_0(GPOUT,3)
    out_c0_exit340_0 <= gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_0;

    -- out_c0_exit340_1(GPOUT,4)
    out_c0_exit340_1 <= gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_1;

    -- out_c0_exit340_2(GPOUT,5)
    out_c0_exit340_2 <= gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_2;

    -- out_c0_exit340_3(GPOUT,6)
    out_c0_exit340_3 <= gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_3;

    -- out_c0_exit340_4(GPOUT,7)
    out_c0_exit340_4 <= gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_4;

    -- out_c0_exit340_5(GPOUT,8)
    out_c0_exit340_5 <= gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_5;

    -- out_c0_exit340_6(GPOUT,9)
    out_c0_exit340_6 <= gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_6;

    -- out_c0_exit340_7(GPOUT,10)
    out_c0_exit340_7 <= gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_7;

    -- out_c0_exit340_8(GPOUT,11)
    out_c0_exit340_8 <= gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_8;

    -- out_c0_exit340_9(GPOUT,12)
    out_c0_exit340_9 <= gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_9;

    -- out_c0_exit340_10(GPOUT,13)
    out_c0_exit340_10 <= gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_10;

    -- out_c0_exit340_11(GPOUT,14)
    out_c0_exit340_11 <= gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_11;

    -- out_c0_exit340_12(GPOUT,15)
    out_c0_exit340_12 <= gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_12;

    -- out_c0_exit340_13(GPOUT,16)
    out_c0_exit340_13 <= gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_13;

    -- out_c0_exit340_14(GPOUT,17)
    out_c0_exit340_14 <= gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_14;

    -- out_c0_exit340_15(GPOUT,18)
    out_c0_exit340_15 <= gemm_nn9W_B2_branch_aunroll_x_out_c0_exit340_15;

    -- out_c1_exit_0(GPOUT,19)
    out_c1_exit_0 <= gemm_nn9W_B2_branch_aunroll_x_out_c1_exit_0;

    -- out_c1_exit_1(GPOUT,20)
    out_c1_exit_1 <= gemm_nn9W_B2_branch_aunroll_x_out_c1_exit_1;

    -- out_c1_exit_2(GPOUT,21)
    out_c1_exit_2 <= gemm_nn9W_B2_branch_aunroll_x_out_c1_exit_2;

    -- out_c1_exit_3(GPOUT,22)
    out_c1_exit_3 <= gemm_nn9W_B2_branch_aunroll_x_out_c1_exit_3;

    -- out_exiting_stall_out(GPOUT,23)
    out_exiting_stall_out <= bb_gemm_nn9W_B2_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_stall_out;

    -- out_exiting_valid_out(GPOUT,24)
    out_exiting_valid_out <= bb_gemm_nn9W_B2_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nn9w_exiting_valid_out;

    -- out_memcoalesce_B_load_0_avm_address(GPOUT,25)
    out_memcoalesce_B_load_0_avm_address <= bb_gemm_nn9W_B2_stall_region_out_memcoalesce_B_load_0_avm_address;

    -- out_memcoalesce_B_load_0_avm_burstcount(GPOUT,26)
    out_memcoalesce_B_load_0_avm_burstcount <= bb_gemm_nn9W_B2_stall_region_out_memcoalesce_B_load_0_avm_burstcount;

    -- out_memcoalesce_B_load_0_avm_byteenable(GPOUT,27)
    out_memcoalesce_B_load_0_avm_byteenable <= bb_gemm_nn9W_B2_stall_region_out_memcoalesce_B_load_0_avm_byteenable;

    -- out_memcoalesce_B_load_0_avm_enable(GPOUT,28)
    out_memcoalesce_B_load_0_avm_enable <= bb_gemm_nn9W_B2_stall_region_out_memcoalesce_B_load_0_avm_enable;

    -- out_memcoalesce_B_load_0_avm_read(GPOUT,29)
    out_memcoalesce_B_load_0_avm_read <= bb_gemm_nn9W_B2_stall_region_out_memcoalesce_B_load_0_avm_read;

    -- out_memcoalesce_B_load_0_avm_write(GPOUT,30)
    out_memcoalesce_B_load_0_avm_write <= bb_gemm_nn9W_B2_stall_region_out_memcoalesce_B_load_0_avm_write;

    -- out_memcoalesce_B_load_0_avm_writedata(GPOUT,31)
    out_memcoalesce_B_load_0_avm_writedata <= bb_gemm_nn9W_B2_stall_region_out_memcoalesce_B_load_0_avm_writedata;

    -- out_memdep_259_avm_address(GPOUT,32)
    out_memdep_259_avm_address <= bb_gemm_nn9W_B2_stall_region_out_memdep_259_avm_address;

    -- out_memdep_259_avm_burstcount(GPOUT,33)
    out_memdep_259_avm_burstcount <= bb_gemm_nn9W_B2_stall_region_out_memdep_259_avm_burstcount;

    -- out_memdep_259_avm_byteenable(GPOUT,34)
    out_memdep_259_avm_byteenable <= bb_gemm_nn9W_B2_stall_region_out_memdep_259_avm_byteenable;

    -- out_memdep_259_avm_enable(GPOUT,35)
    out_memdep_259_avm_enable <= bb_gemm_nn9W_B2_stall_region_out_memdep_259_avm_enable;

    -- out_memdep_259_avm_read(GPOUT,36)
    out_memdep_259_avm_read <= bb_gemm_nn9W_B2_stall_region_out_memdep_259_avm_read;

    -- out_memdep_259_avm_write(GPOUT,37)
    out_memdep_259_avm_write <= bb_gemm_nn9W_B2_stall_region_out_memdep_259_avm_write;

    -- out_memdep_259_avm_writedata(GPOUT,38)
    out_memdep_259_avm_writedata <= bb_gemm_nn9W_B2_stall_region_out_memdep_259_avm_writedata;

    -- out_memdep_264_avm_address(GPOUT,39)
    out_memdep_264_avm_address <= bb_gemm_nn9W_B2_stall_region_out_memdep_264_avm_address;

    -- out_memdep_264_avm_burstcount(GPOUT,40)
    out_memdep_264_avm_burstcount <= bb_gemm_nn9W_B2_stall_region_out_memdep_264_avm_burstcount;

    -- out_memdep_264_avm_byteenable(GPOUT,41)
    out_memdep_264_avm_byteenable <= bb_gemm_nn9W_B2_stall_region_out_memdep_264_avm_byteenable;

    -- out_memdep_264_avm_enable(GPOUT,42)
    out_memdep_264_avm_enable <= bb_gemm_nn9W_B2_stall_region_out_memdep_264_avm_enable;

    -- out_memdep_264_avm_read(GPOUT,43)
    out_memdep_264_avm_read <= bb_gemm_nn9W_B2_stall_region_out_memdep_264_avm_read;

    -- out_memdep_264_avm_write(GPOUT,44)
    out_memdep_264_avm_write <= bb_gemm_nn9W_B2_stall_region_out_memdep_264_avm_write;

    -- out_memdep_264_avm_writedata(GPOUT,45)
    out_memdep_264_avm_writedata <= bb_gemm_nn9W_B2_stall_region_out_memdep_264_avm_writedata;

    -- out_memdep_avm_address(GPOUT,46)
    out_memdep_avm_address <= bb_gemm_nn9W_B2_stall_region_out_memdep_avm_address;

    -- out_memdep_avm_burstcount(GPOUT,47)
    out_memdep_avm_burstcount <= bb_gemm_nn9W_B2_stall_region_out_memdep_avm_burstcount;

    -- out_memdep_avm_byteenable(GPOUT,48)
    out_memdep_avm_byteenable <= bb_gemm_nn9W_B2_stall_region_out_memdep_avm_byteenable;

    -- out_memdep_avm_enable(GPOUT,49)
    out_memdep_avm_enable <= bb_gemm_nn9W_B2_stall_region_out_memdep_avm_enable;

    -- out_memdep_avm_read(GPOUT,50)
    out_memdep_avm_read <= bb_gemm_nn9W_B2_stall_region_out_memdep_avm_read;

    -- out_memdep_avm_write(GPOUT,51)
    out_memdep_avm_write <= bb_gemm_nn9W_B2_stall_region_out_memdep_avm_write;

    -- out_memdep_avm_writedata(GPOUT,52)
    out_memdep_avm_writedata <= bb_gemm_nn9W_B2_stall_region_out_memdep_avm_writedata;

    -- out_stall_out_0(GPOUT,53)
    out_stall_out_0 <= gemm_nn9W_B2_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,54)
    out_stall_out_1 <= gemm_nn9W_B2_merge_out_stall_out_1;

    -- out_valid_out_0(GPOUT,55)
    out_valid_out_0 <= gemm_nn9W_B2_branch_aunroll_x_out_valid_out_0;

    -- out_valid_out_1(GPOUT,56)
    out_valid_out_1 <= gemm_nn9W_B2_branch_aunroll_x_out_valid_out_1;

    -- pipeline_valid_out_sync(GPOUT,113)
    out_pipeline_valid_out <= bb_gemm_nn9W_B2_stall_region_out_pipeline_valid_out;

END normal;
