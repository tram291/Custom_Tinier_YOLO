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

-- VHDL created from bb_gemm_nnfW_B5
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

entity bb_gemm_nnfW_B5 is
    port (
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
        out_c1_exit170_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit170_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit170_2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe7151 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe8152 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe1171 : out std_logic_vector(0 downto 0);  -- ufix1
        out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_A_load_0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memcoalesce_A_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memcoalesce_A_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_A_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_A_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_A_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_A_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW9_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_gemm_nnfW9_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW9_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_gemm_nnfW9_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW9_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW9_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW9_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        in_A : in std_logic_vector(63 downto 0);  -- ufix64
        in_B : in std_logic_vector(63 downto 0);  -- ufix64
        in_C : in std_logic_vector(63 downto 0);  -- ufix64
        in_Cn_285_rep_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_Cn_285_rep_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_K : in std_logic_vector(31 downto 0);  -- ufix32
        in_M : in std_logic_vector(31 downto 0);  -- ufix32
        in_N : in std_logic_vector(31 downto 0);  -- ufix32
        in_arrayidx1452_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx1452_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_cmp380_RM40_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp380_RM40_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp88_RM38_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp88_RM38_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_conv15_hf_tofpc53_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_conv15_hf_tofpc53_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked51_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked51_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_fpgaindvars_iv_0 : in std_logic_vector(32 downto 0);  -- ufix33
        in_fpgaindvars_iv_1 : in std_logic_vector(32 downto 0);  -- ufix33
        in_lda : in std_logic_vector(31 downto 0);  -- ufix32
        in_ldc : in std_logic_vector(31 downto 0);  -- ufix32
        in_memcoalesce_A_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_A_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_A_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_A_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi6_pop1144_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi6_pop1144_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_mul1142_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul1142_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul2054_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul2054_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_notexit2934_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_notexit2934_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_phi_decision156_xor_RM1655_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_phi_decision156_xor_RM1655_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_sdiv_sh125_RM36_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_sdiv_sh125_RM36_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW6_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW6_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW7_0 : in std_logic_vector(32 downto 0);  -- ufix33
        in_unnamed_gemm_nnfW7_1 : in std_logic_vector(32 downto 0);  -- ufix33
        in_unnamed_gemm_nnfW8_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW8_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW9_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_gemm_nnfW9_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW9_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW9_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nnfW_B5;

architecture normal of bb_gemm_nnfW_B5 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component gemm_nnfW_B5_branch is
        port (
            in_c0_exit144_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit144_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit144_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit144_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit144_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit144_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit144_6 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit144_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit144_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit144_9 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit144_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit144_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit170_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit170_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit170_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe5149 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe7151 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe8152 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe1171 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nnfW_B5_stall_region is
        port (
            in_A : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_Cn_285_rep : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_arrayidx1452 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_cmp380_RM40 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp88_RM38 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_conv15_hf_tofpc53 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked51 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_memcoalesce_A_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_A_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_A_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_A_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi6_pop1144 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_mul1142 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul2054 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_notexit2934 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_phi_decision156_xor_RM1655 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_sdiv_sh125_RM36 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW7 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW9_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW9_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW9_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW9_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe5149 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe7151 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe8152 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe1171 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_A_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW9_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW9_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW9_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW9_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW9_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW9_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW9_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gemm_nnfW_B5_merge is
        port (
            in_Cn_285_rep_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_Cn_285_rep_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx1452_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_arrayidx1452_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_cmp380_RM40_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp380_RM40_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp88_RM38_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp88_RM38_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_conv15_hf_tofpc53_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_conv15_hf_tofpc53_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_forked51_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked51_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_0 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_fpgaindvars_iv_1 : in std_logic_vector(32 downto 0);  -- Fixed Point
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
            in_sdiv_sh125_RM36_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_sdiv_sh125_RM36_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW6_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW6_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW7_0 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW7_1 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW8_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW8_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_Cn_285_rep : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_arrayidx1452 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_cmp380_RM40 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_cmp88_RM38 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_conv15_hf_tofpc53 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_forked51 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_fpgaindvars_iv : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_memdep_phi6_pop1144 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_mul1142 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mul2054 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_notexit2934 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_phi_decision156_xor_RM1655 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_sdiv_sh125_RM36 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW7 : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_6 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_9 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_branch_aunroll_x_out_c1_exit170_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_branch_aunroll_x_out_c1_exit170_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_branch_aunroll_x_out_c1_exit170_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nnfW_B5_branch_aunroll_x_out_c0_exe7151 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_branch_aunroll_x_out_c0_exe8152 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_branch_aunroll_x_out_c1_exe1171 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_branch_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_branch_aunroll_x_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_branch_aunroll_x_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_c0_exit144_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_c0_exit144_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_c0_exit144_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_c0_exit144_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_c0_exit144_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_c0_exit144_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_c0_exit144_6 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_c0_exit144_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_c0_exit144_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_c0_exit144_9 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_c0_exit144_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_c0_exit144_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_c1_exit170_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_c1_exit170_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_c1_exit170_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_c0_exe5149 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_c0_exe7151 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_c0_exe8152 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_c1_exe1171 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_memcoalesce_A_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_memcoalesce_A_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_memcoalesce_A_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_memcoalesce_A_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_memcoalesce_A_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_memcoalesce_A_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_memcoalesce_A_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_unnamed_gemm_nnfW9_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_unnamed_gemm_nnfW9_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_unnamed_gemm_nnfW9_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_unnamed_gemm_nnfW9_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_unnamed_gemm_nnfW9_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_unnamed_gemm_nnfW9_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_unnamed_gemm_nnfW9_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal bb_gemm_nnfW_B5_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_merge_out_Cn_285_rep : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nnfW_B5_merge_out_arrayidx1452 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nnfW_B5_merge_out_cmp380_RM40 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_merge_out_cmp88_RM38 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_merge_out_conv15_hf_tofpc53 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nnfW_B5_merge_out_forked51 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_merge_out_fpgaindvars_iv : STD_LOGIC_VECTOR (32 downto 0);
    signal gemm_nnfW_B5_merge_out_memdep_phi6_pop1144 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_merge_out_mul1142 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B5_merge_out_mul2054 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B5_merge_out_notexit2934 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_merge_out_phi_decision156_xor_RM1655 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_merge_out_sdiv_sh125_RM36 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B5_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_merge_out_unnamed_gemm_nnfW6 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_merge_out_unnamed_gemm_nnfW7 : STD_LOGIC_VECTOR (32 downto 0);
    signal gemm_nnfW_B5_merge_out_unnamed_gemm_nnfW8 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B5_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- gemm_nnfW_B5_merge(BLACKBOX,42)
    thegemm_nnfW_B5_merge : gemm_nnfW_B5_merge
    PORT MAP (
        in_Cn_285_rep_0 => in_Cn_285_rep_0,
        in_Cn_285_rep_1 => in_Cn_285_rep_1,
        in_arrayidx1452_0 => in_arrayidx1452_0,
        in_arrayidx1452_1 => in_arrayidx1452_1,
        in_cmp380_RM40_0 => in_cmp380_RM40_0,
        in_cmp380_RM40_1 => in_cmp380_RM40_1,
        in_cmp88_RM38_0 => in_cmp88_RM38_0,
        in_cmp88_RM38_1 => in_cmp88_RM38_1,
        in_conv15_hf_tofpc53_0 => in_conv15_hf_tofpc53_0,
        in_conv15_hf_tofpc53_1 => in_conv15_hf_tofpc53_1,
        in_forked51_0 => in_forked51_0,
        in_forked51_1 => in_forked51_1,
        in_fpgaindvars_iv_0 => in_fpgaindvars_iv_0,
        in_fpgaindvars_iv_1 => in_fpgaindvars_iv_1,
        in_memdep_phi6_pop1144_0 => in_memdep_phi6_pop1144_0,
        in_memdep_phi6_pop1144_1 => in_memdep_phi6_pop1144_1,
        in_mul1142_0 => in_mul1142_0,
        in_mul1142_1 => in_mul1142_1,
        in_mul2054_0 => in_mul2054_0,
        in_mul2054_1 => in_mul2054_1,
        in_notexit2934_0 => in_notexit2934_0,
        in_notexit2934_1 => in_notexit2934_1,
        in_phi_decision156_xor_RM1655_0 => in_phi_decision156_xor_RM1655_0,
        in_phi_decision156_xor_RM1655_1 => in_phi_decision156_xor_RM1655_1,
        in_sdiv_sh125_RM36_0 => in_sdiv_sh125_RM36_0,
        in_sdiv_sh125_RM36_1 => in_sdiv_sh125_RM36_1,
        in_stall_in => bb_gemm_nnfW_B5_stall_region_out_stall_out,
        in_unnamed_gemm_nnfW6_0 => in_unnamed_gemm_nnfW6_0,
        in_unnamed_gemm_nnfW6_1 => in_unnamed_gemm_nnfW6_1,
        in_unnamed_gemm_nnfW7_0 => in_unnamed_gemm_nnfW7_0,
        in_unnamed_gemm_nnfW7_1 => in_unnamed_gemm_nnfW7_1,
        in_unnamed_gemm_nnfW8_0 => in_unnamed_gemm_nnfW8_0,
        in_unnamed_gemm_nnfW8_1 => in_unnamed_gemm_nnfW8_1,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_Cn_285_rep => gemm_nnfW_B5_merge_out_Cn_285_rep,
        out_arrayidx1452 => gemm_nnfW_B5_merge_out_arrayidx1452,
        out_cmp380_RM40 => gemm_nnfW_B5_merge_out_cmp380_RM40,
        out_cmp88_RM38 => gemm_nnfW_B5_merge_out_cmp88_RM38,
        out_conv15_hf_tofpc53 => gemm_nnfW_B5_merge_out_conv15_hf_tofpc53,
        out_forked51 => gemm_nnfW_B5_merge_out_forked51,
        out_fpgaindvars_iv => gemm_nnfW_B5_merge_out_fpgaindvars_iv,
        out_memdep_phi6_pop1144 => gemm_nnfW_B5_merge_out_memdep_phi6_pop1144,
        out_mul1142 => gemm_nnfW_B5_merge_out_mul1142,
        out_mul2054 => gemm_nnfW_B5_merge_out_mul2054,
        out_notexit2934 => gemm_nnfW_B5_merge_out_notexit2934,
        out_phi_decision156_xor_RM1655 => gemm_nnfW_B5_merge_out_phi_decision156_xor_RM1655,
        out_sdiv_sh125_RM36 => gemm_nnfW_B5_merge_out_sdiv_sh125_RM36,
        out_stall_out_0 => gemm_nnfW_B5_merge_out_stall_out_0,
        out_stall_out_1 => gemm_nnfW_B5_merge_out_stall_out_1,
        out_unnamed_gemm_nnfW6 => gemm_nnfW_B5_merge_out_unnamed_gemm_nnfW6,
        out_unnamed_gemm_nnfW7 => gemm_nnfW_B5_merge_out_unnamed_gemm_nnfW7,
        out_unnamed_gemm_nnfW8 => gemm_nnfW_B5_merge_out_unnamed_gemm_nnfW8,
        out_valid_out => gemm_nnfW_B5_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nnfW_B5_stall_region(BLACKBOX,41)
    thebb_gemm_nnfW_B5_stall_region : bb_gemm_nnfW_B5_stall_region
    PORT MAP (
        in_A => in_A,
        in_Cn_285_rep => gemm_nnfW_B5_merge_out_Cn_285_rep,
        in_M => in_M,
        in_arrayidx1452 => gemm_nnfW_B5_merge_out_arrayidx1452,
        in_cmp380_RM40 => gemm_nnfW_B5_merge_out_cmp380_RM40,
        in_cmp88_RM38 => gemm_nnfW_B5_merge_out_cmp88_RM38,
        in_conv15_hf_tofpc53 => gemm_nnfW_B5_merge_out_conv15_hf_tofpc53,
        in_flush => in_flush,
        in_forked51 => gemm_nnfW_B5_merge_out_forked51,
        in_fpgaindvars_iv => gemm_nnfW_B5_merge_out_fpgaindvars_iv,
        in_memcoalesce_A_load_0_avm_readdata => in_memcoalesce_A_load_0_avm_readdata,
        in_memcoalesce_A_load_0_avm_readdatavalid => in_memcoalesce_A_load_0_avm_readdatavalid,
        in_memcoalesce_A_load_0_avm_waitrequest => in_memcoalesce_A_load_0_avm_waitrequest,
        in_memcoalesce_A_load_0_avm_writeack => in_memcoalesce_A_load_0_avm_writeack,
        in_memdep_phi6_pop1144 => gemm_nnfW_B5_merge_out_memdep_phi6_pop1144,
        in_mul1142 => gemm_nnfW_B5_merge_out_mul1142,
        in_mul2054 => gemm_nnfW_B5_merge_out_mul2054,
        in_notexit2934 => gemm_nnfW_B5_merge_out_notexit2934,
        in_phi_decision156_xor_RM1655 => gemm_nnfW_B5_merge_out_phi_decision156_xor_RM1655,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_sdiv_sh125_RM36 => gemm_nnfW_B5_merge_out_sdiv_sh125_RM36,
        in_stall_in => gemm_nnfW_B5_branch_aunroll_x_out_stall_out,
        in_unnamed_gemm_nnfW6 => gemm_nnfW_B5_merge_out_unnamed_gemm_nnfW6,
        in_unnamed_gemm_nnfW7 => gemm_nnfW_B5_merge_out_unnamed_gemm_nnfW7,
        in_unnamed_gemm_nnfW8 => gemm_nnfW_B5_merge_out_unnamed_gemm_nnfW8,
        in_unnamed_gemm_nnfW9_avm_readdata => in_unnamed_gemm_nnfW9_avm_readdata,
        in_unnamed_gemm_nnfW9_avm_readdatavalid => in_unnamed_gemm_nnfW9_avm_readdatavalid,
        in_unnamed_gemm_nnfW9_avm_waitrequest => in_unnamed_gemm_nnfW9_avm_waitrequest,
        in_unnamed_gemm_nnfW9_avm_writeack => in_unnamed_gemm_nnfW9_avm_writeack,
        in_valid_in => gemm_nnfW_B5_merge_out_valid_out,
        out_c0_exit144_0 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_0,
        out_c0_exit144_1 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_1,
        out_c0_exit144_2 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_2,
        out_c0_exit144_3 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_3,
        out_c0_exit144_4 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_4,
        out_c0_exit144_5 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_5,
        out_c0_exit144_6 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_6,
        out_c0_exit144_7 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_7,
        out_c0_exit144_8 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_8,
        out_c0_exit144_9 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_9,
        out_c0_exit144_10 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_10,
        out_c0_exit144_11 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_11,
        out_c1_exit170_0 => bb_gemm_nnfW_B5_stall_region_out_c1_exit170_0,
        out_c1_exit170_1 => bb_gemm_nnfW_B5_stall_region_out_c1_exit170_1,
        out_c1_exit170_2 => bb_gemm_nnfW_B5_stall_region_out_c1_exit170_2,
        out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_stall_out => bb_gemm_nnfW_B5_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_valid_out => bb_gemm_nnfW_B5_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_valid_out,
        out_c0_exe5149 => bb_gemm_nnfW_B5_stall_region_out_c0_exe5149,
        out_c0_exe7151 => bb_gemm_nnfW_B5_stall_region_out_c0_exe7151,
        out_c0_exe8152 => bb_gemm_nnfW_B5_stall_region_out_c0_exe8152,
        out_c1_exe1171 => bb_gemm_nnfW_B5_stall_region_out_c1_exe1171,
        out_memcoalesce_A_load_0_avm_address => bb_gemm_nnfW_B5_stall_region_out_memcoalesce_A_load_0_avm_address,
        out_memcoalesce_A_load_0_avm_burstcount => bb_gemm_nnfW_B5_stall_region_out_memcoalesce_A_load_0_avm_burstcount,
        out_memcoalesce_A_load_0_avm_byteenable => bb_gemm_nnfW_B5_stall_region_out_memcoalesce_A_load_0_avm_byteenable,
        out_memcoalesce_A_load_0_avm_enable => bb_gemm_nnfW_B5_stall_region_out_memcoalesce_A_load_0_avm_enable,
        out_memcoalesce_A_load_0_avm_read => bb_gemm_nnfW_B5_stall_region_out_memcoalesce_A_load_0_avm_read,
        out_memcoalesce_A_load_0_avm_write => bb_gemm_nnfW_B5_stall_region_out_memcoalesce_A_load_0_avm_write,
        out_memcoalesce_A_load_0_avm_writedata => bb_gemm_nnfW_B5_stall_region_out_memcoalesce_A_load_0_avm_writedata,
        out_pipeline_valid_out => bb_gemm_nnfW_B5_stall_region_out_pipeline_valid_out,
        out_stall_out => bb_gemm_nnfW_B5_stall_region_out_stall_out,
        out_unnamed_gemm_nnfW9_avm_address => bb_gemm_nnfW_B5_stall_region_out_unnamed_gemm_nnfW9_avm_address,
        out_unnamed_gemm_nnfW9_avm_burstcount => bb_gemm_nnfW_B5_stall_region_out_unnamed_gemm_nnfW9_avm_burstcount,
        out_unnamed_gemm_nnfW9_avm_byteenable => bb_gemm_nnfW_B5_stall_region_out_unnamed_gemm_nnfW9_avm_byteenable,
        out_unnamed_gemm_nnfW9_avm_enable => bb_gemm_nnfW_B5_stall_region_out_unnamed_gemm_nnfW9_avm_enable,
        out_unnamed_gemm_nnfW9_avm_read => bb_gemm_nnfW_B5_stall_region_out_unnamed_gemm_nnfW9_avm_read,
        out_unnamed_gemm_nnfW9_avm_write => bb_gemm_nnfW_B5_stall_region_out_unnamed_gemm_nnfW9_avm_write,
        out_unnamed_gemm_nnfW9_avm_writedata => bb_gemm_nnfW_B5_stall_region_out_unnamed_gemm_nnfW9_avm_writedata,
        out_valid_out => bb_gemm_nnfW_B5_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- gemm_nnfW_B5_branch_aunroll_x(BLACKBOX,2)
    thegemm_nnfW_B5_branch_aunroll_x : gemm_nnfW_B5_branch
    PORT MAP (
        in_c0_exit144_0 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_0,
        in_c0_exit144_1 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_1,
        in_c0_exit144_2 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_2,
        in_c0_exit144_3 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_3,
        in_c0_exit144_4 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_4,
        in_c0_exit144_5 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_5,
        in_c0_exit144_6 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_6,
        in_c0_exit144_7 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_7,
        in_c0_exit144_8 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_8,
        in_c0_exit144_9 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_9,
        in_c0_exit144_10 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_10,
        in_c0_exit144_11 => bb_gemm_nnfW_B5_stall_region_out_c0_exit144_11,
        in_c1_exit170_0 => bb_gemm_nnfW_B5_stall_region_out_c1_exit170_0,
        in_c1_exit170_1 => bb_gemm_nnfW_B5_stall_region_out_c1_exit170_1,
        in_c1_exit170_2 => bb_gemm_nnfW_B5_stall_region_out_c1_exit170_2,
        in_c0_exe5149 => bb_gemm_nnfW_B5_stall_region_out_c0_exe5149,
        in_c0_exe7151 => bb_gemm_nnfW_B5_stall_region_out_c0_exe7151,
        in_c0_exe8152 => bb_gemm_nnfW_B5_stall_region_out_c0_exe8152,
        in_c1_exe1171 => bb_gemm_nnfW_B5_stall_region_out_c1_exe1171,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_valid_in => bb_gemm_nnfW_B5_stall_region_out_valid_out,
        out_c0_exit144_0 => gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_0,
        out_c0_exit144_1 => gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_1,
        out_c0_exit144_2 => gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_2,
        out_c0_exit144_3 => gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_3,
        out_c0_exit144_4 => gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_4,
        out_c0_exit144_5 => gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_5,
        out_c0_exit144_6 => gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_6,
        out_c0_exit144_7 => gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_7,
        out_c0_exit144_8 => gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_8,
        out_c0_exit144_9 => gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_9,
        out_c0_exit144_10 => gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_10,
        out_c0_exit144_11 => gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_11,
        out_c1_exit170_0 => gemm_nnfW_B5_branch_aunroll_x_out_c1_exit170_0,
        out_c1_exit170_1 => gemm_nnfW_B5_branch_aunroll_x_out_c1_exit170_1,
        out_c1_exit170_2 => gemm_nnfW_B5_branch_aunroll_x_out_c1_exit170_2,
        out_c0_exe7151 => gemm_nnfW_B5_branch_aunroll_x_out_c0_exe7151,
        out_c0_exe8152 => gemm_nnfW_B5_branch_aunroll_x_out_c0_exe8152,
        out_c1_exe1171 => gemm_nnfW_B5_branch_aunroll_x_out_c1_exe1171,
        out_stall_out => gemm_nnfW_B5_branch_aunroll_x_out_stall_out,
        out_valid_out_0 => gemm_nnfW_B5_branch_aunroll_x_out_valid_out_0,
        out_valid_out_1 => gemm_nnfW_B5_branch_aunroll_x_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exit144_0(GPOUT,3)
    out_c0_exit144_0 <= gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_0;

    -- out_c0_exit144_1(GPOUT,4)
    out_c0_exit144_1 <= gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_1;

    -- out_c0_exit144_2(GPOUT,5)
    out_c0_exit144_2 <= gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_2;

    -- out_c0_exit144_3(GPOUT,6)
    out_c0_exit144_3 <= gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_3;

    -- out_c0_exit144_4(GPOUT,7)
    out_c0_exit144_4 <= gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_4;

    -- out_c0_exit144_5(GPOUT,8)
    out_c0_exit144_5 <= gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_5;

    -- out_c0_exit144_6(GPOUT,9)
    out_c0_exit144_6 <= gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_6;

    -- out_c0_exit144_7(GPOUT,10)
    out_c0_exit144_7 <= gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_7;

    -- out_c0_exit144_8(GPOUT,11)
    out_c0_exit144_8 <= gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_8;

    -- out_c0_exit144_9(GPOUT,12)
    out_c0_exit144_9 <= gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_9;

    -- out_c0_exit144_10(GPOUT,13)
    out_c0_exit144_10 <= gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_10;

    -- out_c0_exit144_11(GPOUT,14)
    out_c0_exit144_11 <= gemm_nnfW_B5_branch_aunroll_x_out_c0_exit144_11;

    -- out_c1_exit170_0(GPOUT,15)
    out_c1_exit170_0 <= gemm_nnfW_B5_branch_aunroll_x_out_c1_exit170_0;

    -- out_c1_exit170_1(GPOUT,16)
    out_c1_exit170_1 <= gemm_nnfW_B5_branch_aunroll_x_out_c1_exit170_1;

    -- out_c1_exit170_2(GPOUT,17)
    out_c1_exit170_2 <= gemm_nnfW_B5_branch_aunroll_x_out_c1_exit170_2;

    -- out_c0_exe7151(GPOUT,18)
    out_c0_exe7151 <= gemm_nnfW_B5_branch_aunroll_x_out_c0_exe7151;

    -- out_c0_exe8152(GPOUT,19)
    out_c0_exe8152 <= gemm_nnfW_B5_branch_aunroll_x_out_c0_exe8152;

    -- out_c1_exe1171(GPOUT,20)
    out_c1_exe1171 <= gemm_nnfW_B5_branch_aunroll_x_out_c1_exe1171;

    -- out_exiting_stall_out(GPOUT,21)
    out_exiting_stall_out <= bb_gemm_nnfW_B5_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_stall_out;

    -- out_exiting_valid_out(GPOUT,22)
    out_exiting_valid_out <= bb_gemm_nnfW_B5_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going19_gemm_nnfw_exiting_valid_out;

    -- out_memcoalesce_A_load_0_avm_address(GPOUT,23)
    out_memcoalesce_A_load_0_avm_address <= bb_gemm_nnfW_B5_stall_region_out_memcoalesce_A_load_0_avm_address;

    -- out_memcoalesce_A_load_0_avm_burstcount(GPOUT,24)
    out_memcoalesce_A_load_0_avm_burstcount <= bb_gemm_nnfW_B5_stall_region_out_memcoalesce_A_load_0_avm_burstcount;

    -- out_memcoalesce_A_load_0_avm_byteenable(GPOUT,25)
    out_memcoalesce_A_load_0_avm_byteenable <= bb_gemm_nnfW_B5_stall_region_out_memcoalesce_A_load_0_avm_byteenable;

    -- out_memcoalesce_A_load_0_avm_enable(GPOUT,26)
    out_memcoalesce_A_load_0_avm_enable <= bb_gemm_nnfW_B5_stall_region_out_memcoalesce_A_load_0_avm_enable;

    -- out_memcoalesce_A_load_0_avm_read(GPOUT,27)
    out_memcoalesce_A_load_0_avm_read <= bb_gemm_nnfW_B5_stall_region_out_memcoalesce_A_load_0_avm_read;

    -- out_memcoalesce_A_load_0_avm_write(GPOUT,28)
    out_memcoalesce_A_load_0_avm_write <= bb_gemm_nnfW_B5_stall_region_out_memcoalesce_A_load_0_avm_write;

    -- out_memcoalesce_A_load_0_avm_writedata(GPOUT,29)
    out_memcoalesce_A_load_0_avm_writedata <= bb_gemm_nnfW_B5_stall_region_out_memcoalesce_A_load_0_avm_writedata;

    -- out_stall_out_0(GPOUT,30)
    out_stall_out_0 <= gemm_nnfW_B5_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,31)
    out_stall_out_1 <= gemm_nnfW_B5_merge_out_stall_out_1;

    -- out_unnamed_gemm_nnfW9_avm_address(GPOUT,32)
    out_unnamed_gemm_nnfW9_avm_address <= bb_gemm_nnfW_B5_stall_region_out_unnamed_gemm_nnfW9_avm_address;

    -- out_unnamed_gemm_nnfW9_avm_burstcount(GPOUT,33)
    out_unnamed_gemm_nnfW9_avm_burstcount <= bb_gemm_nnfW_B5_stall_region_out_unnamed_gemm_nnfW9_avm_burstcount;

    -- out_unnamed_gemm_nnfW9_avm_byteenable(GPOUT,34)
    out_unnamed_gemm_nnfW9_avm_byteenable <= bb_gemm_nnfW_B5_stall_region_out_unnamed_gemm_nnfW9_avm_byteenable;

    -- out_unnamed_gemm_nnfW9_avm_enable(GPOUT,35)
    out_unnamed_gemm_nnfW9_avm_enable <= bb_gemm_nnfW_B5_stall_region_out_unnamed_gemm_nnfW9_avm_enable;

    -- out_unnamed_gemm_nnfW9_avm_read(GPOUT,36)
    out_unnamed_gemm_nnfW9_avm_read <= bb_gemm_nnfW_B5_stall_region_out_unnamed_gemm_nnfW9_avm_read;

    -- out_unnamed_gemm_nnfW9_avm_write(GPOUT,37)
    out_unnamed_gemm_nnfW9_avm_write <= bb_gemm_nnfW_B5_stall_region_out_unnamed_gemm_nnfW9_avm_write;

    -- out_unnamed_gemm_nnfW9_avm_writedata(GPOUT,38)
    out_unnamed_gemm_nnfW9_avm_writedata <= bb_gemm_nnfW_B5_stall_region_out_unnamed_gemm_nnfW9_avm_writedata;

    -- out_valid_out_0(GPOUT,39)
    out_valid_out_0 <= gemm_nnfW_B5_branch_aunroll_x_out_valid_out_0;

    -- out_valid_out_1(GPOUT,40)
    out_valid_out_1 <= gemm_nnfW_B5_branch_aunroll_x_out_valid_out_1;

    -- pipeline_valid_out_sync(GPOUT,97)
    out_pipeline_valid_out <= bb_gemm_nnfW_B5_stall_region_out_pipeline_valid_out;

END normal;
