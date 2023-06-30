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

-- VHDL created from bb_gemm_nn9W_B5
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

entity bb_gemm_nn9W_B5 is
    port (
        out_c0_exit428_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit428_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit428_2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit428_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit428_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit428_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit428_6 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit428_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit428_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit428_9 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit428_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit428_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit456_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit456_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit456_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit456_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit456_4 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe7435 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe8436 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe1457 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe2458 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe3459 : out std_logic_vector(0 downto 0);  -- ufix1
        out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_A_load_0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memcoalesce_A_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memcoalesce_A_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_A_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_A_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_A_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_A_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
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
        out_memdep_phi258 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi263 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi268 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        in_A : in std_logic_vector(63 downto 0);  -- ufix64
        in_B : in std_logic_vector(63 downto 0);  -- ufix64
        in_C : in std_logic_vector(63 downto 0);  -- ufix64
        in_Cn_272_rep_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_Cn_272_rep_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_K : in std_logic_vector(31 downto 0);  -- ufix32
        in_M : in std_logic_vector(31 downto 0);  -- ufix32
        in_N : in std_logic_vector(31 downto 0);  -- ufix32
        in_arrayidx30330_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx30330_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_cmp367_RM312_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp367_RM312_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp75_RM310_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp75_RM310_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_conv31_hf_tofpc331_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_conv31_hf_tofpc331_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_div1_RM308_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_div1_RM308_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_div_RM314_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_div_RM314_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked329_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked329_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_lda : in std_logic_vector(31 downto 0);  -- ufix32
        in_ldc : in std_logic_vector(31 downto 0);  -- ufix32
        in_memcoalesce_A_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_A_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_A_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_A_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
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
        in_memdep_phi258_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi258_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi263_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi263_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi268_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi268_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi277_pop16318_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi277_pop16318_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_mul27316_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul27316_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul36332_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul36332_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_notexit300306_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_notexit300306_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_phi_decision139_xor_RM65333_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_phi_decision139_xor_RM65333_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W3_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W3_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W4_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W4_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nn9W_B5;

architecture normal of bb_gemm_nn9W_B5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component gemm_nn9W_B5_branch is
        port (
            in_c0_exit428_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit428_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit428_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit428_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit428_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit428_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit428_6 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit428_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit428_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit428_9 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit428_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit428_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit456_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit456_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit456_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit456_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit456_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe5433 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe7435 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe8436 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe1457 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe2458 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe3459 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi258 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi263 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi268 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_memdep_phi258 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi263 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi268 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nn9W_B5_stall_region is
        port (
            in_A : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_Cn_272_rep : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arrayidx30330 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_cmp367_RM312 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp75_RM310 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_conv31_hf_tofpc331 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_div1_RM308 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_div_RM314 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked329 : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            in_memdep_phi258 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi263 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi268 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi277_pop16318 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_mul27316 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul36332 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_notexit300306 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_phi_decision139_xor_RM65333 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_aclp_to_limiter_i_acl_pipeline_keep_going290_gemm_nn9w_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going290_gemm_nn9w_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe5433 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe7435 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe8436 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe1457 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe2458 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe3459 : out std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gemm_nn9W_B5_merge is
        port (
            in_Cn_272_rep_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_Cn_272_rep_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
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
            in_forked329_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked329_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W3_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W3_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W4_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W4_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_Cn_272_rep : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx30330 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_cmp367_RM312 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_cmp75_RM310 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_conv31_hf_tofpc331 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_div1_RM308 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_div_RM314 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_forked329 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi258 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi263 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi268 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi277_pop16318 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_mul27316 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mul36332 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_notexit300306 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_phi_decision139_xor_RM65333 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nn9W3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nn9W4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_6 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_9 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_c1_exit456_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_c1_exit456_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_c1_exit456_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_c1_exit456_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_c1_exit456_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_c0_exe7435 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_c0_exe8436 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_c1_exe1457 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_c1_exe2458 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_c1_exe3459 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_memdep_phi258 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_memdep_phi263 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_memdep_phi268 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_branch_aunroll_x_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c0_exit428_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c0_exit428_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c0_exit428_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c0_exit428_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c0_exit428_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c0_exit428_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c0_exit428_6 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c0_exit428_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c0_exit428_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c0_exit428_9 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c0_exit428_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c0_exit428_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c1_exit456_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c1_exit456_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c1_exit456_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c1_exit456_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c1_exit456_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going290_gemm_nn9w_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going290_gemm_nn9w_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c0_exe5433 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c0_exe7435 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c0_exe8436 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c1_exe1457 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c1_exe2458 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_c1_exe3459 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_A_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_A_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_A_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_A_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_A_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_A_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_A_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_045_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_045_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_045_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_045_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_045_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_045_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_045_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_051_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_051_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_051_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_051_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_051_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_051_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_051_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_0_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_0_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_0_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_0_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memdep_phi258 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memdep_phi263 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_memdep_phi268 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B5_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_merge_out_Cn_272_rep : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nn9W_B5_merge_out_arrayidx30330 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nn9W_B5_merge_out_cmp367_RM312 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_merge_out_cmp75_RM310 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_merge_out_conv31_hf_tofpc331 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nn9W_B5_merge_out_div1_RM308 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B5_merge_out_div_RM314 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B5_merge_out_forked329 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_merge_out_memdep_phi258 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_merge_out_memdep_phi263 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_merge_out_memdep_phi268 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_merge_out_memdep_phi277_pop16318 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_merge_out_mul27316 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B5_merge_out_mul36332 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B5_merge_out_notexit300306 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_merge_out_phi_decision139_xor_RM65333 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_merge_out_unnamed_gemm_nn9W3 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_merge_out_unnamed_gemm_nn9W4 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B5_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- gemm_nn9W_B5_merge(BLACKBOX,63)
    thegemm_nn9W_B5_merge : gemm_nn9W_B5_merge
    PORT MAP (
        in_Cn_272_rep_0 => in_Cn_272_rep_0,
        in_Cn_272_rep_1 => in_Cn_272_rep_1,
        in_arrayidx30330_0 => in_arrayidx30330_0,
        in_arrayidx30330_1 => in_arrayidx30330_1,
        in_cmp367_RM312_0 => in_cmp367_RM312_0,
        in_cmp367_RM312_1 => in_cmp367_RM312_1,
        in_cmp75_RM310_0 => in_cmp75_RM310_0,
        in_cmp75_RM310_1 => in_cmp75_RM310_1,
        in_conv31_hf_tofpc331_0 => in_conv31_hf_tofpc331_0,
        in_conv31_hf_tofpc331_1 => in_conv31_hf_tofpc331_1,
        in_div1_RM308_0 => in_div1_RM308_0,
        in_div1_RM308_1 => in_div1_RM308_1,
        in_div_RM314_0 => in_div_RM314_0,
        in_div_RM314_1 => in_div_RM314_1,
        in_forked329_0 => in_forked329_0,
        in_forked329_1 => in_forked329_1,
        in_memdep_phi258_0 => in_memdep_phi258_0,
        in_memdep_phi258_1 => in_memdep_phi258_1,
        in_memdep_phi263_0 => in_memdep_phi263_0,
        in_memdep_phi263_1 => in_memdep_phi263_1,
        in_memdep_phi268_0 => in_memdep_phi268_0,
        in_memdep_phi268_1 => in_memdep_phi268_1,
        in_memdep_phi277_pop16318_0 => in_memdep_phi277_pop16318_0,
        in_memdep_phi277_pop16318_1 => in_memdep_phi277_pop16318_1,
        in_mul27316_0 => in_mul27316_0,
        in_mul27316_1 => in_mul27316_1,
        in_mul36332_0 => in_mul36332_0,
        in_mul36332_1 => in_mul36332_1,
        in_notexit300306_0 => in_notexit300306_0,
        in_notexit300306_1 => in_notexit300306_1,
        in_phi_decision139_xor_RM65333_0 => in_phi_decision139_xor_RM65333_0,
        in_phi_decision139_xor_RM65333_1 => in_phi_decision139_xor_RM65333_1,
        in_stall_in => bb_gemm_nn9W_B5_stall_region_out_stall_out,
        in_unnamed_gemm_nn9W3_0 => in_unnamed_gemm_nn9W3_0,
        in_unnamed_gemm_nn9W3_1 => in_unnamed_gemm_nn9W3_1,
        in_unnamed_gemm_nn9W4_0 => in_unnamed_gemm_nn9W4_0,
        in_unnamed_gemm_nn9W4_1 => in_unnamed_gemm_nn9W4_1,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_Cn_272_rep => gemm_nn9W_B5_merge_out_Cn_272_rep,
        out_arrayidx30330 => gemm_nn9W_B5_merge_out_arrayidx30330,
        out_cmp367_RM312 => gemm_nn9W_B5_merge_out_cmp367_RM312,
        out_cmp75_RM310 => gemm_nn9W_B5_merge_out_cmp75_RM310,
        out_conv31_hf_tofpc331 => gemm_nn9W_B5_merge_out_conv31_hf_tofpc331,
        out_div1_RM308 => gemm_nn9W_B5_merge_out_div1_RM308,
        out_div_RM314 => gemm_nn9W_B5_merge_out_div_RM314,
        out_forked329 => gemm_nn9W_B5_merge_out_forked329,
        out_memdep_phi258 => gemm_nn9W_B5_merge_out_memdep_phi258,
        out_memdep_phi263 => gemm_nn9W_B5_merge_out_memdep_phi263,
        out_memdep_phi268 => gemm_nn9W_B5_merge_out_memdep_phi268,
        out_memdep_phi277_pop16318 => gemm_nn9W_B5_merge_out_memdep_phi277_pop16318,
        out_mul27316 => gemm_nn9W_B5_merge_out_mul27316,
        out_mul36332 => gemm_nn9W_B5_merge_out_mul36332,
        out_notexit300306 => gemm_nn9W_B5_merge_out_notexit300306,
        out_phi_decision139_xor_RM65333 => gemm_nn9W_B5_merge_out_phi_decision139_xor_RM65333,
        out_stall_out_0 => gemm_nn9W_B5_merge_out_stall_out_0,
        out_stall_out_1 => gemm_nn9W_B5_merge_out_stall_out_1,
        out_unnamed_gemm_nn9W3 => gemm_nn9W_B5_merge_out_unnamed_gemm_nn9W3,
        out_unnamed_gemm_nn9W4 => gemm_nn9W_B5_merge_out_unnamed_gemm_nn9W4,
        out_valid_out => gemm_nn9W_B5_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nn9W_B5_stall_region(BLACKBOX,62)
    thebb_gemm_nn9W_B5_stall_region : bb_gemm_nn9W_B5_stall_region
    PORT MAP (
        in_A => in_A,
        in_Cn_272_rep => gemm_nn9W_B5_merge_out_Cn_272_rep,
        in_M => in_M,
        in_arrayidx30330 => gemm_nn9W_B5_merge_out_arrayidx30330,
        in_cmp367_RM312 => gemm_nn9W_B5_merge_out_cmp367_RM312,
        in_cmp75_RM310 => gemm_nn9W_B5_merge_out_cmp75_RM310,
        in_conv31_hf_tofpc331 => gemm_nn9W_B5_merge_out_conv31_hf_tofpc331,
        in_div1_RM308 => gemm_nn9W_B5_merge_out_div1_RM308,
        in_div_RM314 => gemm_nn9W_B5_merge_out_div_RM314,
        in_flush => in_flush,
        in_forked329 => gemm_nn9W_B5_merge_out_forked329,
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
        in_memdep_phi258 => gemm_nn9W_B5_merge_out_memdep_phi258,
        in_memdep_phi263 => gemm_nn9W_B5_merge_out_memdep_phi263,
        in_memdep_phi268 => gemm_nn9W_B5_merge_out_memdep_phi268,
        in_memdep_phi277_pop16318 => gemm_nn9W_B5_merge_out_memdep_phi277_pop16318,
        in_mul27316 => gemm_nn9W_B5_merge_out_mul27316,
        in_mul36332 => gemm_nn9W_B5_merge_out_mul36332,
        in_notexit300306 => gemm_nn9W_B5_merge_out_notexit300306,
        in_phi_decision139_xor_RM65333 => gemm_nn9W_B5_merge_out_phi_decision139_xor_RM65333,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_stall_in => gemm_nn9W_B5_branch_aunroll_x_out_stall_out,
        in_unnamed_gemm_nn9W3 => gemm_nn9W_B5_merge_out_unnamed_gemm_nn9W3,
        in_unnamed_gemm_nn9W4 => gemm_nn9W_B5_merge_out_unnamed_gemm_nn9W4,
        in_valid_in => gemm_nn9W_B5_merge_out_valid_out,
        out_c0_exit428_0 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_0,
        out_c0_exit428_1 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_1,
        out_c0_exit428_2 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_2,
        out_c0_exit428_3 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_3,
        out_c0_exit428_4 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_4,
        out_c0_exit428_5 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_5,
        out_c0_exit428_6 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_6,
        out_c0_exit428_7 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_7,
        out_c0_exit428_8 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_8,
        out_c0_exit428_9 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_9,
        out_c0_exit428_10 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_10,
        out_c0_exit428_11 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_11,
        out_c1_exit456_0 => bb_gemm_nn9W_B5_stall_region_out_c1_exit456_0,
        out_c1_exit456_1 => bb_gemm_nn9W_B5_stall_region_out_c1_exit456_1,
        out_c1_exit456_2 => bb_gemm_nn9W_B5_stall_region_out_c1_exit456_2,
        out_c1_exit456_3 => bb_gemm_nn9W_B5_stall_region_out_c1_exit456_3,
        out_c1_exit456_4 => bb_gemm_nn9W_B5_stall_region_out_c1_exit456_4,
        out_aclp_to_limiter_i_acl_pipeline_keep_going290_gemm_nn9w_exiting_stall_out => bb_gemm_nn9W_B5_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going290_gemm_nn9w_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going290_gemm_nn9w_exiting_valid_out => bb_gemm_nn9W_B5_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going290_gemm_nn9w_exiting_valid_out,
        out_c0_exe5433 => bb_gemm_nn9W_B5_stall_region_out_c0_exe5433,
        out_c0_exe7435 => bb_gemm_nn9W_B5_stall_region_out_c0_exe7435,
        out_c0_exe8436 => bb_gemm_nn9W_B5_stall_region_out_c0_exe8436,
        out_c1_exe1457 => bb_gemm_nn9W_B5_stall_region_out_c1_exe1457,
        out_c1_exe2458 => bb_gemm_nn9W_B5_stall_region_out_c1_exe2458,
        out_c1_exe3459 => bb_gemm_nn9W_B5_stall_region_out_c1_exe3459,
        out_memcoalesce_A_load_0_avm_address => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_A_load_0_avm_address,
        out_memcoalesce_A_load_0_avm_burstcount => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_A_load_0_avm_burstcount,
        out_memcoalesce_A_load_0_avm_byteenable => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_A_load_0_avm_byteenable,
        out_memcoalesce_A_load_0_avm_enable => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_A_load_0_avm_enable,
        out_memcoalesce_A_load_0_avm_read => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_A_load_0_avm_read,
        out_memcoalesce_A_load_0_avm_write => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_A_load_0_avm_write,
        out_memcoalesce_A_load_0_avm_writedata => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_A_load_0_avm_writedata,
        out_memcoalesce_null_load_045_avm_address => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_045_avm_address,
        out_memcoalesce_null_load_045_avm_burstcount => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_045_avm_burstcount,
        out_memcoalesce_null_load_045_avm_byteenable => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_045_avm_byteenable,
        out_memcoalesce_null_load_045_avm_enable => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_045_avm_enable,
        out_memcoalesce_null_load_045_avm_read => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_045_avm_read,
        out_memcoalesce_null_load_045_avm_write => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_045_avm_write,
        out_memcoalesce_null_load_045_avm_writedata => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_045_avm_writedata,
        out_memcoalesce_null_load_051_avm_address => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_051_avm_address,
        out_memcoalesce_null_load_051_avm_burstcount => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_051_avm_burstcount,
        out_memcoalesce_null_load_051_avm_byteenable => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_051_avm_byteenable,
        out_memcoalesce_null_load_051_avm_enable => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_051_avm_enable,
        out_memcoalesce_null_load_051_avm_read => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_051_avm_read,
        out_memcoalesce_null_load_051_avm_write => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_051_avm_write,
        out_memcoalesce_null_load_051_avm_writedata => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_051_avm_writedata,
        out_memcoalesce_null_load_0_avm_address => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_0_avm_address,
        out_memcoalesce_null_load_0_avm_burstcount => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_0_avm_burstcount,
        out_memcoalesce_null_load_0_avm_byteenable => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_0_avm_byteenable,
        out_memcoalesce_null_load_0_avm_enable => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_0_avm_enable,
        out_memcoalesce_null_load_0_avm_read => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_0_avm_read,
        out_memcoalesce_null_load_0_avm_write => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_0_avm_write,
        out_memcoalesce_null_load_0_avm_writedata => bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_0_avm_writedata,
        out_memdep_phi258 => bb_gemm_nn9W_B5_stall_region_out_memdep_phi258,
        out_memdep_phi263 => bb_gemm_nn9W_B5_stall_region_out_memdep_phi263,
        out_memdep_phi268 => bb_gemm_nn9W_B5_stall_region_out_memdep_phi268,
        out_pipeline_valid_out => bb_gemm_nn9W_B5_stall_region_out_pipeline_valid_out,
        out_stall_out => bb_gemm_nn9W_B5_stall_region_out_stall_out,
        out_valid_out => bb_gemm_nn9W_B5_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- gemm_nn9W_B5_branch_aunroll_x(BLACKBOX,2)
    thegemm_nn9W_B5_branch_aunroll_x : gemm_nn9W_B5_branch
    PORT MAP (
        in_c0_exit428_0 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_0,
        in_c0_exit428_1 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_1,
        in_c0_exit428_2 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_2,
        in_c0_exit428_3 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_3,
        in_c0_exit428_4 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_4,
        in_c0_exit428_5 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_5,
        in_c0_exit428_6 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_6,
        in_c0_exit428_7 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_7,
        in_c0_exit428_8 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_8,
        in_c0_exit428_9 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_9,
        in_c0_exit428_10 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_10,
        in_c0_exit428_11 => bb_gemm_nn9W_B5_stall_region_out_c0_exit428_11,
        in_c1_exit456_0 => bb_gemm_nn9W_B5_stall_region_out_c1_exit456_0,
        in_c1_exit456_1 => bb_gemm_nn9W_B5_stall_region_out_c1_exit456_1,
        in_c1_exit456_2 => bb_gemm_nn9W_B5_stall_region_out_c1_exit456_2,
        in_c1_exit456_3 => bb_gemm_nn9W_B5_stall_region_out_c1_exit456_3,
        in_c1_exit456_4 => bb_gemm_nn9W_B5_stall_region_out_c1_exit456_4,
        in_c0_exe5433 => bb_gemm_nn9W_B5_stall_region_out_c0_exe5433,
        in_c0_exe7435 => bb_gemm_nn9W_B5_stall_region_out_c0_exe7435,
        in_c0_exe8436 => bb_gemm_nn9W_B5_stall_region_out_c0_exe8436,
        in_c1_exe1457 => bb_gemm_nn9W_B5_stall_region_out_c1_exe1457,
        in_c1_exe2458 => bb_gemm_nn9W_B5_stall_region_out_c1_exe2458,
        in_c1_exe3459 => bb_gemm_nn9W_B5_stall_region_out_c1_exe3459,
        in_memdep_phi258 => bb_gemm_nn9W_B5_stall_region_out_memdep_phi258,
        in_memdep_phi263 => bb_gemm_nn9W_B5_stall_region_out_memdep_phi263,
        in_memdep_phi268 => bb_gemm_nn9W_B5_stall_region_out_memdep_phi268,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_valid_in => bb_gemm_nn9W_B5_stall_region_out_valid_out,
        out_c0_exit428_0 => gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_0,
        out_c0_exit428_1 => gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_1,
        out_c0_exit428_2 => gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_2,
        out_c0_exit428_3 => gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_3,
        out_c0_exit428_4 => gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_4,
        out_c0_exit428_5 => gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_5,
        out_c0_exit428_6 => gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_6,
        out_c0_exit428_7 => gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_7,
        out_c0_exit428_8 => gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_8,
        out_c0_exit428_9 => gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_9,
        out_c0_exit428_10 => gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_10,
        out_c0_exit428_11 => gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_11,
        out_c1_exit456_0 => gemm_nn9W_B5_branch_aunroll_x_out_c1_exit456_0,
        out_c1_exit456_1 => gemm_nn9W_B5_branch_aunroll_x_out_c1_exit456_1,
        out_c1_exit456_2 => gemm_nn9W_B5_branch_aunroll_x_out_c1_exit456_2,
        out_c1_exit456_3 => gemm_nn9W_B5_branch_aunroll_x_out_c1_exit456_3,
        out_c1_exit456_4 => gemm_nn9W_B5_branch_aunroll_x_out_c1_exit456_4,
        out_c0_exe7435 => gemm_nn9W_B5_branch_aunroll_x_out_c0_exe7435,
        out_c0_exe8436 => gemm_nn9W_B5_branch_aunroll_x_out_c0_exe8436,
        out_c1_exe1457 => gemm_nn9W_B5_branch_aunroll_x_out_c1_exe1457,
        out_c1_exe2458 => gemm_nn9W_B5_branch_aunroll_x_out_c1_exe2458,
        out_c1_exe3459 => gemm_nn9W_B5_branch_aunroll_x_out_c1_exe3459,
        out_memdep_phi258 => gemm_nn9W_B5_branch_aunroll_x_out_memdep_phi258,
        out_memdep_phi263 => gemm_nn9W_B5_branch_aunroll_x_out_memdep_phi263,
        out_memdep_phi268 => gemm_nn9W_B5_branch_aunroll_x_out_memdep_phi268,
        out_stall_out => gemm_nn9W_B5_branch_aunroll_x_out_stall_out,
        out_valid_out_0 => gemm_nn9W_B5_branch_aunroll_x_out_valid_out_0,
        out_valid_out_1 => gemm_nn9W_B5_branch_aunroll_x_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exit428_0(GPOUT,3)
    out_c0_exit428_0 <= gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_0;

    -- out_c0_exit428_1(GPOUT,4)
    out_c0_exit428_1 <= gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_1;

    -- out_c0_exit428_2(GPOUT,5)
    out_c0_exit428_2 <= gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_2;

    -- out_c0_exit428_3(GPOUT,6)
    out_c0_exit428_3 <= gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_3;

    -- out_c0_exit428_4(GPOUT,7)
    out_c0_exit428_4 <= gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_4;

    -- out_c0_exit428_5(GPOUT,8)
    out_c0_exit428_5 <= gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_5;

    -- out_c0_exit428_6(GPOUT,9)
    out_c0_exit428_6 <= gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_6;

    -- out_c0_exit428_7(GPOUT,10)
    out_c0_exit428_7 <= gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_7;

    -- out_c0_exit428_8(GPOUT,11)
    out_c0_exit428_8 <= gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_8;

    -- out_c0_exit428_9(GPOUT,12)
    out_c0_exit428_9 <= gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_9;

    -- out_c0_exit428_10(GPOUT,13)
    out_c0_exit428_10 <= gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_10;

    -- out_c0_exit428_11(GPOUT,14)
    out_c0_exit428_11 <= gemm_nn9W_B5_branch_aunroll_x_out_c0_exit428_11;

    -- out_c1_exit456_0(GPOUT,15)
    out_c1_exit456_0 <= gemm_nn9W_B5_branch_aunroll_x_out_c1_exit456_0;

    -- out_c1_exit456_1(GPOUT,16)
    out_c1_exit456_1 <= gemm_nn9W_B5_branch_aunroll_x_out_c1_exit456_1;

    -- out_c1_exit456_2(GPOUT,17)
    out_c1_exit456_2 <= gemm_nn9W_B5_branch_aunroll_x_out_c1_exit456_2;

    -- out_c1_exit456_3(GPOUT,18)
    out_c1_exit456_3 <= gemm_nn9W_B5_branch_aunroll_x_out_c1_exit456_3;

    -- out_c1_exit456_4(GPOUT,19)
    out_c1_exit456_4 <= gemm_nn9W_B5_branch_aunroll_x_out_c1_exit456_4;

    -- out_c0_exe7435(GPOUT,20)
    out_c0_exe7435 <= gemm_nn9W_B5_branch_aunroll_x_out_c0_exe7435;

    -- out_c0_exe8436(GPOUT,21)
    out_c0_exe8436 <= gemm_nn9W_B5_branch_aunroll_x_out_c0_exe8436;

    -- out_c1_exe1457(GPOUT,22)
    out_c1_exe1457 <= gemm_nn9W_B5_branch_aunroll_x_out_c1_exe1457;

    -- out_c1_exe2458(GPOUT,23)
    out_c1_exe2458 <= gemm_nn9W_B5_branch_aunroll_x_out_c1_exe2458;

    -- out_c1_exe3459(GPOUT,24)
    out_c1_exe3459 <= gemm_nn9W_B5_branch_aunroll_x_out_c1_exe3459;

    -- out_exiting_stall_out(GPOUT,25)
    out_exiting_stall_out <= bb_gemm_nn9W_B5_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going290_gemm_nn9w_exiting_stall_out;

    -- out_exiting_valid_out(GPOUT,26)
    out_exiting_valid_out <= bb_gemm_nn9W_B5_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going290_gemm_nn9w_exiting_valid_out;

    -- out_memcoalesce_A_load_0_avm_address(GPOUT,27)
    out_memcoalesce_A_load_0_avm_address <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_A_load_0_avm_address;

    -- out_memcoalesce_A_load_0_avm_burstcount(GPOUT,28)
    out_memcoalesce_A_load_0_avm_burstcount <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_A_load_0_avm_burstcount;

    -- out_memcoalesce_A_load_0_avm_byteenable(GPOUT,29)
    out_memcoalesce_A_load_0_avm_byteenable <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_A_load_0_avm_byteenable;

    -- out_memcoalesce_A_load_0_avm_enable(GPOUT,30)
    out_memcoalesce_A_load_0_avm_enable <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_A_load_0_avm_enable;

    -- out_memcoalesce_A_load_0_avm_read(GPOUT,31)
    out_memcoalesce_A_load_0_avm_read <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_A_load_0_avm_read;

    -- out_memcoalesce_A_load_0_avm_write(GPOUT,32)
    out_memcoalesce_A_load_0_avm_write <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_A_load_0_avm_write;

    -- out_memcoalesce_A_load_0_avm_writedata(GPOUT,33)
    out_memcoalesce_A_load_0_avm_writedata <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_A_load_0_avm_writedata;

    -- out_memcoalesce_null_load_045_avm_address(GPOUT,34)
    out_memcoalesce_null_load_045_avm_address <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_045_avm_address;

    -- out_memcoalesce_null_load_045_avm_burstcount(GPOUT,35)
    out_memcoalesce_null_load_045_avm_burstcount <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_045_avm_burstcount;

    -- out_memcoalesce_null_load_045_avm_byteenable(GPOUT,36)
    out_memcoalesce_null_load_045_avm_byteenable <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_045_avm_byteenable;

    -- out_memcoalesce_null_load_045_avm_enable(GPOUT,37)
    out_memcoalesce_null_load_045_avm_enable <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_045_avm_enable;

    -- out_memcoalesce_null_load_045_avm_read(GPOUT,38)
    out_memcoalesce_null_load_045_avm_read <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_045_avm_read;

    -- out_memcoalesce_null_load_045_avm_write(GPOUT,39)
    out_memcoalesce_null_load_045_avm_write <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_045_avm_write;

    -- out_memcoalesce_null_load_045_avm_writedata(GPOUT,40)
    out_memcoalesce_null_load_045_avm_writedata <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_045_avm_writedata;

    -- out_memcoalesce_null_load_051_avm_address(GPOUT,41)
    out_memcoalesce_null_load_051_avm_address <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_051_avm_address;

    -- out_memcoalesce_null_load_051_avm_burstcount(GPOUT,42)
    out_memcoalesce_null_load_051_avm_burstcount <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_051_avm_burstcount;

    -- out_memcoalesce_null_load_051_avm_byteenable(GPOUT,43)
    out_memcoalesce_null_load_051_avm_byteenable <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_051_avm_byteenable;

    -- out_memcoalesce_null_load_051_avm_enable(GPOUT,44)
    out_memcoalesce_null_load_051_avm_enable <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_051_avm_enable;

    -- out_memcoalesce_null_load_051_avm_read(GPOUT,45)
    out_memcoalesce_null_load_051_avm_read <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_051_avm_read;

    -- out_memcoalesce_null_load_051_avm_write(GPOUT,46)
    out_memcoalesce_null_load_051_avm_write <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_051_avm_write;

    -- out_memcoalesce_null_load_051_avm_writedata(GPOUT,47)
    out_memcoalesce_null_load_051_avm_writedata <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_051_avm_writedata;

    -- out_memcoalesce_null_load_0_avm_address(GPOUT,48)
    out_memcoalesce_null_load_0_avm_address <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_0_avm_address;

    -- out_memcoalesce_null_load_0_avm_burstcount(GPOUT,49)
    out_memcoalesce_null_load_0_avm_burstcount <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_0_avm_burstcount;

    -- out_memcoalesce_null_load_0_avm_byteenable(GPOUT,50)
    out_memcoalesce_null_load_0_avm_byteenable <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_0_avm_byteenable;

    -- out_memcoalesce_null_load_0_avm_enable(GPOUT,51)
    out_memcoalesce_null_load_0_avm_enable <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_0_avm_enable;

    -- out_memcoalesce_null_load_0_avm_read(GPOUT,52)
    out_memcoalesce_null_load_0_avm_read <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_0_avm_read;

    -- out_memcoalesce_null_load_0_avm_write(GPOUT,53)
    out_memcoalesce_null_load_0_avm_write <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_0_avm_write;

    -- out_memcoalesce_null_load_0_avm_writedata(GPOUT,54)
    out_memcoalesce_null_load_0_avm_writedata <= bb_gemm_nn9W_B5_stall_region_out_memcoalesce_null_load_0_avm_writedata;

    -- out_memdep_phi258(GPOUT,55)
    out_memdep_phi258 <= gemm_nn9W_B5_branch_aunroll_x_out_memdep_phi258;

    -- out_memdep_phi263(GPOUT,56)
    out_memdep_phi263 <= gemm_nn9W_B5_branch_aunroll_x_out_memdep_phi263;

    -- out_memdep_phi268(GPOUT,57)
    out_memdep_phi268 <= gemm_nn9W_B5_branch_aunroll_x_out_memdep_phi268;

    -- out_stall_out_0(GPOUT,58)
    out_stall_out_0 <= gemm_nn9W_B5_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,59)
    out_stall_out_1 <= gemm_nn9W_B5_merge_out_stall_out_1;

    -- out_valid_out_0(GPOUT,60)
    out_valid_out_0 <= gemm_nn9W_B5_branch_aunroll_x_out_valid_out_0;

    -- out_valid_out_1(GPOUT,61)
    out_valid_out_1 <= gemm_nn9W_B5_branch_aunroll_x_out_valid_out_1;

    -- pipeline_valid_out_sync(GPOUT,130)
    out_pipeline_valid_out <= bb_gemm_nn9W_B5_stall_region_out_pipeline_valid_out;

END normal;
