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

-- VHDL created from bb_gemm_nnfW_B4
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

entity bb_gemm_nnfW_B4 is
    port (
        in_A : in std_logic_vector(63 downto 0);  -- ufix64
        in_B : in std_logic_vector(63 downto 0);  -- ufix64
        in_C : in std_logic_vector(63 downto 0);  -- ufix64
        in_K : in std_logic_vector(31 downto 0);  -- ufix32
        in_M : in std_logic_vector(31 downto 0);  -- ufix32
        in_N : in std_logic_vector(31 downto 0);  -- ufix32
        in_cmp380_RM39_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp380_RM39_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp88_RM37_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp88_RM37_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked32_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked32_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_lda : in std_logic_vector(31 downto 0);  -- ufix32
        in_ldc : in std_logic_vector(31 downto 0);  -- ufix32
        in_memdep_phi6_pop1143_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi6_pop1143_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_mul1141_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul1141_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_notexit2933_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_notexit2933_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_sdiv_sh125_RM35_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_sdiv_sh125_RM35_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW3_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW3_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW4_0 : in std_logic_vector(32 downto 0);  -- ufix33
        in_unnamed_gemm_nnfW4_1 : in std_logic_vector(32 downto 0);  -- ufix33
        in_unnamed_gemm_nnfW5_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_gemm_nnfW5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW5_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe10107 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11108 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe12109 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe13 : out std_logic_vector(32 downto 0);  -- ufix33
        out_c0_exe198 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe299 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe3100 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe4101 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe5102 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe6103 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe7104 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe8105 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe1 : out std_logic_vector(63 downto 0);  -- ufix64
        out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW5_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_gemm_nnfW5_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_gemm_nnfW5_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_gemm_nnfW5_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW5_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW5_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW5_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nnfW_B4;

architecture normal of bb_gemm_nnfW_B4 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_gemm_nnfW_B4_stall_region is
        port (
            in_C : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_cmp380_RM39 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp88_RM37 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked32 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi6_pop1143 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_mul1141 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_notexit2933 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_sdiv_sh125_RM35 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW4 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW5_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW5_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW5_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW5_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW5_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW5_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW5_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW5_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW5_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gemm_nnfW_B4_branch is
        port (
            in_c0_exe10107 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe11108 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe12109 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe13 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_c0_exe198 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe299 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3100 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe4101 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe5102 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe6103 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe7104 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe8105 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gemm_nnfW_B4_merge is
        port (
            in_cmp380_RM39_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp380_RM39_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp88_RM37_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp88_RM37_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked32_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked32_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi6_pop1143_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi6_pop1143_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_mul1141_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul1141_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_notexit2933_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit2933_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_sdiv_sh125_RM35_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_sdiv_sh125_RM35_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW3_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW3_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW4_0 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW4_1 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_cmp380_RM39 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_cmp88_RM37 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_forked32 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi6_pop1143 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_mul1141 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_notexit2933 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_sdiv_sh125_RM35 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW4 : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_gemm_nnfW_B4_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_c0_exe10107 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_c0_exe11108 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_c0_exe12109 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_c0_exe13 : STD_LOGIC_VECTOR (32 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_c0_exe198 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_c0_exe299 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_c0_exe3100 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_c0_exe4101 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_c0_exe5102 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_c0_exe6103 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_c0_exe7104 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_c0_exe8105 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_c1_exe1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_unnamed_gemm_nnfW5_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_unnamed_gemm_nnfW5_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_unnamed_gemm_nnfW5_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_unnamed_gemm_nnfW5_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_unnamed_gemm_nnfW5_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_unnamed_gemm_nnfW5_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_unnamed_gemm_nnfW5_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_gemm_nnfW_B4_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_branch_out_c0_exe10107 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_branch_out_c0_exe11108 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_branch_out_c0_exe12109 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_branch_out_c0_exe13 : STD_LOGIC_VECTOR (32 downto 0);
    signal gemm_nnfW_B4_branch_out_c0_exe198 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B4_branch_out_c0_exe299 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nnfW_B4_branch_out_c0_exe3100 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_branch_out_c0_exe4101 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B4_branch_out_c0_exe5102 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B4_branch_out_c0_exe6103 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_branch_out_c0_exe7104 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_branch_out_c0_exe8105 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_branch_out_c1_exe1 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nnfW_B4_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_merge_out_cmp380_RM39 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_merge_out_cmp88_RM37 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_merge_out_forked32 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_merge_out_memdep_phi6_pop1143 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_merge_out_mul1141 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B4_merge_out_notexit2933 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_merge_out_sdiv_sh125_RM35 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B4_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_merge_out_unnamed_gemm_nnfW3 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_merge_out_unnamed_gemm_nnfW4 : STD_LOGIC_VECTOR (32 downto 0);
    signal gemm_nnfW_B4_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- gemm_nnfW_B4_merge(BLACKBOX,4)
    thegemm_nnfW_B4_merge : gemm_nnfW_B4_merge
    PORT MAP (
        in_cmp380_RM39_0 => in_cmp380_RM39_0,
        in_cmp380_RM39_1 => in_cmp380_RM39_1,
        in_cmp88_RM37_0 => in_cmp88_RM37_0,
        in_cmp88_RM37_1 => in_cmp88_RM37_1,
        in_forked32_0 => in_forked32_0,
        in_forked32_1 => in_forked32_1,
        in_memdep_phi6_pop1143_0 => in_memdep_phi6_pop1143_0,
        in_memdep_phi6_pop1143_1 => in_memdep_phi6_pop1143_1,
        in_mul1141_0 => in_mul1141_0,
        in_mul1141_1 => in_mul1141_1,
        in_notexit2933_0 => in_notexit2933_0,
        in_notexit2933_1 => in_notexit2933_1,
        in_sdiv_sh125_RM35_0 => in_sdiv_sh125_RM35_0,
        in_sdiv_sh125_RM35_1 => in_sdiv_sh125_RM35_1,
        in_stall_in => bb_gemm_nnfW_B4_stall_region_out_stall_out,
        in_unnamed_gemm_nnfW3_0 => in_unnamed_gemm_nnfW3_0,
        in_unnamed_gemm_nnfW3_1 => in_unnamed_gemm_nnfW3_1,
        in_unnamed_gemm_nnfW4_0 => in_unnamed_gemm_nnfW4_0,
        in_unnamed_gemm_nnfW4_1 => in_unnamed_gemm_nnfW4_1,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_cmp380_RM39 => gemm_nnfW_B4_merge_out_cmp380_RM39,
        out_cmp88_RM37 => gemm_nnfW_B4_merge_out_cmp88_RM37,
        out_forked32 => gemm_nnfW_B4_merge_out_forked32,
        out_memdep_phi6_pop1143 => gemm_nnfW_B4_merge_out_memdep_phi6_pop1143,
        out_mul1141 => gemm_nnfW_B4_merge_out_mul1141,
        out_notexit2933 => gemm_nnfW_B4_merge_out_notexit2933,
        out_sdiv_sh125_RM35 => gemm_nnfW_B4_merge_out_sdiv_sh125_RM35,
        out_stall_out_0 => gemm_nnfW_B4_merge_out_stall_out_0,
        out_stall_out_1 => gemm_nnfW_B4_merge_out_stall_out_1,
        out_unnamed_gemm_nnfW3 => gemm_nnfW_B4_merge_out_unnamed_gemm_nnfW3,
        out_unnamed_gemm_nnfW4 => gemm_nnfW_B4_merge_out_unnamed_gemm_nnfW4,
        out_valid_out => gemm_nnfW_B4_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nnfW_B4_stall_region(BLACKBOX,2)
    thebb_gemm_nnfW_B4_stall_region : bb_gemm_nnfW_B4_stall_region
    PORT MAP (
        in_C => in_C,
        in_M => in_M,
        in_N => in_N,
        in_cmp380_RM39 => gemm_nnfW_B4_merge_out_cmp380_RM39,
        in_cmp88_RM37 => gemm_nnfW_B4_merge_out_cmp88_RM37,
        in_flush => in_flush,
        in_forked32 => gemm_nnfW_B4_merge_out_forked32,
        in_memdep_phi6_pop1143 => gemm_nnfW_B4_merge_out_memdep_phi6_pop1143,
        in_mul1141 => gemm_nnfW_B4_merge_out_mul1141,
        in_notexit2933 => gemm_nnfW_B4_merge_out_notexit2933,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_sdiv_sh125_RM35 => gemm_nnfW_B4_merge_out_sdiv_sh125_RM35,
        in_stall_in => gemm_nnfW_B4_branch_out_stall_out,
        in_unnamed_gemm_nnfW3 => gemm_nnfW_B4_merge_out_unnamed_gemm_nnfW3,
        in_unnamed_gemm_nnfW4 => gemm_nnfW_B4_merge_out_unnamed_gemm_nnfW4,
        in_unnamed_gemm_nnfW5_avm_readdata => in_unnamed_gemm_nnfW5_avm_readdata,
        in_unnamed_gemm_nnfW5_avm_readdatavalid => in_unnamed_gemm_nnfW5_avm_readdatavalid,
        in_unnamed_gemm_nnfW5_avm_waitrequest => in_unnamed_gemm_nnfW5_avm_waitrequest,
        in_unnamed_gemm_nnfW5_avm_writeack => in_unnamed_gemm_nnfW5_avm_writeack,
        in_valid_in => gemm_nnfW_B4_merge_out_valid_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_stall_out => bb_gemm_nnfW_B4_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_valid_out => bb_gemm_nnfW_B4_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_valid_out,
        out_c0_exe10107 => bb_gemm_nnfW_B4_stall_region_out_c0_exe10107,
        out_c0_exe11108 => bb_gemm_nnfW_B4_stall_region_out_c0_exe11108,
        out_c0_exe12109 => bb_gemm_nnfW_B4_stall_region_out_c0_exe12109,
        out_c0_exe13 => bb_gemm_nnfW_B4_stall_region_out_c0_exe13,
        out_c0_exe198 => bb_gemm_nnfW_B4_stall_region_out_c0_exe198,
        out_c0_exe299 => bb_gemm_nnfW_B4_stall_region_out_c0_exe299,
        out_c0_exe3100 => bb_gemm_nnfW_B4_stall_region_out_c0_exe3100,
        out_c0_exe4101 => bb_gemm_nnfW_B4_stall_region_out_c0_exe4101,
        out_c0_exe5102 => bb_gemm_nnfW_B4_stall_region_out_c0_exe5102,
        out_c0_exe6103 => bb_gemm_nnfW_B4_stall_region_out_c0_exe6103,
        out_c0_exe7104 => bb_gemm_nnfW_B4_stall_region_out_c0_exe7104,
        out_c0_exe8105 => bb_gemm_nnfW_B4_stall_region_out_c0_exe8105,
        out_c1_exe1 => bb_gemm_nnfW_B4_stall_region_out_c1_exe1,
        out_pipeline_valid_out => bb_gemm_nnfW_B4_stall_region_out_pipeline_valid_out,
        out_stall_out => bb_gemm_nnfW_B4_stall_region_out_stall_out,
        out_unnamed_gemm_nnfW5_avm_address => bb_gemm_nnfW_B4_stall_region_out_unnamed_gemm_nnfW5_avm_address,
        out_unnamed_gemm_nnfW5_avm_burstcount => bb_gemm_nnfW_B4_stall_region_out_unnamed_gemm_nnfW5_avm_burstcount,
        out_unnamed_gemm_nnfW5_avm_byteenable => bb_gemm_nnfW_B4_stall_region_out_unnamed_gemm_nnfW5_avm_byteenable,
        out_unnamed_gemm_nnfW5_avm_enable => bb_gemm_nnfW_B4_stall_region_out_unnamed_gemm_nnfW5_avm_enable,
        out_unnamed_gemm_nnfW5_avm_read => bb_gemm_nnfW_B4_stall_region_out_unnamed_gemm_nnfW5_avm_read,
        out_unnamed_gemm_nnfW5_avm_write => bb_gemm_nnfW_B4_stall_region_out_unnamed_gemm_nnfW5_avm_write,
        out_unnamed_gemm_nnfW5_avm_writedata => bb_gemm_nnfW_B4_stall_region_out_unnamed_gemm_nnfW5_avm_writedata,
        out_valid_out => bb_gemm_nnfW_B4_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- gemm_nnfW_B4_branch(BLACKBOX,3)
    thegemm_nnfW_B4_branch : gemm_nnfW_B4_branch
    PORT MAP (
        in_c0_exe10107 => bb_gemm_nnfW_B4_stall_region_out_c0_exe10107,
        in_c0_exe11108 => bb_gemm_nnfW_B4_stall_region_out_c0_exe11108,
        in_c0_exe12109 => bb_gemm_nnfW_B4_stall_region_out_c0_exe12109,
        in_c0_exe13 => bb_gemm_nnfW_B4_stall_region_out_c0_exe13,
        in_c0_exe198 => bb_gemm_nnfW_B4_stall_region_out_c0_exe198,
        in_c0_exe299 => bb_gemm_nnfW_B4_stall_region_out_c0_exe299,
        in_c0_exe3100 => bb_gemm_nnfW_B4_stall_region_out_c0_exe3100,
        in_c0_exe4101 => bb_gemm_nnfW_B4_stall_region_out_c0_exe4101,
        in_c0_exe5102 => bb_gemm_nnfW_B4_stall_region_out_c0_exe5102,
        in_c0_exe6103 => bb_gemm_nnfW_B4_stall_region_out_c0_exe6103,
        in_c0_exe7104 => bb_gemm_nnfW_B4_stall_region_out_c0_exe7104,
        in_c0_exe8105 => bb_gemm_nnfW_B4_stall_region_out_c0_exe8105,
        in_c1_exe1 => bb_gemm_nnfW_B4_stall_region_out_c1_exe1,
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_gemm_nnfW_B4_stall_region_out_valid_out,
        out_c0_exe10107 => gemm_nnfW_B4_branch_out_c0_exe10107,
        out_c0_exe11108 => gemm_nnfW_B4_branch_out_c0_exe11108,
        out_c0_exe12109 => gemm_nnfW_B4_branch_out_c0_exe12109,
        out_c0_exe13 => gemm_nnfW_B4_branch_out_c0_exe13,
        out_c0_exe198 => gemm_nnfW_B4_branch_out_c0_exe198,
        out_c0_exe299 => gemm_nnfW_B4_branch_out_c0_exe299,
        out_c0_exe3100 => gemm_nnfW_B4_branch_out_c0_exe3100,
        out_c0_exe4101 => gemm_nnfW_B4_branch_out_c0_exe4101,
        out_c0_exe5102 => gemm_nnfW_B4_branch_out_c0_exe5102,
        out_c0_exe6103 => gemm_nnfW_B4_branch_out_c0_exe6103,
        out_c0_exe7104 => gemm_nnfW_B4_branch_out_c0_exe7104,
        out_c0_exe8105 => gemm_nnfW_B4_branch_out_c0_exe8105,
        out_c1_exe1 => gemm_nnfW_B4_branch_out_c1_exe1,
        out_stall_out => gemm_nnfW_B4_branch_out_stall_out,
        out_valid_out_0 => gemm_nnfW_B4_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe10107(GPOUT,39)
    out_c0_exe10107 <= gemm_nnfW_B4_branch_out_c0_exe10107;

    -- out_c0_exe11108(GPOUT,40)
    out_c0_exe11108 <= gemm_nnfW_B4_branch_out_c0_exe11108;

    -- out_c0_exe12109(GPOUT,41)
    out_c0_exe12109 <= gemm_nnfW_B4_branch_out_c0_exe12109;

    -- out_c0_exe13(GPOUT,42)
    out_c0_exe13 <= gemm_nnfW_B4_branch_out_c0_exe13;

    -- out_c0_exe198(GPOUT,43)
    out_c0_exe198 <= gemm_nnfW_B4_branch_out_c0_exe198;

    -- out_c0_exe299(GPOUT,44)
    out_c0_exe299 <= gemm_nnfW_B4_branch_out_c0_exe299;

    -- out_c0_exe3100(GPOUT,45)
    out_c0_exe3100 <= gemm_nnfW_B4_branch_out_c0_exe3100;

    -- out_c0_exe4101(GPOUT,46)
    out_c0_exe4101 <= gemm_nnfW_B4_branch_out_c0_exe4101;

    -- out_c0_exe5102(GPOUT,47)
    out_c0_exe5102 <= gemm_nnfW_B4_branch_out_c0_exe5102;

    -- out_c0_exe6103(GPOUT,48)
    out_c0_exe6103 <= gemm_nnfW_B4_branch_out_c0_exe6103;

    -- out_c0_exe7104(GPOUT,49)
    out_c0_exe7104 <= gemm_nnfW_B4_branch_out_c0_exe7104;

    -- out_c0_exe8105(GPOUT,50)
    out_c0_exe8105 <= gemm_nnfW_B4_branch_out_c0_exe8105;

    -- out_c1_exe1(GPOUT,51)
    out_c1_exe1 <= gemm_nnfW_B4_branch_out_c1_exe1;

    -- out_exiting_stall_out(GPOUT,52)
    out_exiting_stall_out <= bb_gemm_nnfW_B4_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_stall_out;

    -- out_exiting_valid_out(GPOUT,53)
    out_exiting_valid_out <= bb_gemm_nnfW_B4_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_valid_out;

    -- out_stall_out_0(GPOUT,54)
    out_stall_out_0 <= gemm_nnfW_B4_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,55)
    out_stall_out_1 <= gemm_nnfW_B4_merge_out_stall_out_1;

    -- out_unnamed_gemm_nnfW5_avm_address(GPOUT,56)
    out_unnamed_gemm_nnfW5_avm_address <= bb_gemm_nnfW_B4_stall_region_out_unnamed_gemm_nnfW5_avm_address;

    -- out_unnamed_gemm_nnfW5_avm_burstcount(GPOUT,57)
    out_unnamed_gemm_nnfW5_avm_burstcount <= bb_gemm_nnfW_B4_stall_region_out_unnamed_gemm_nnfW5_avm_burstcount;

    -- out_unnamed_gemm_nnfW5_avm_byteenable(GPOUT,58)
    out_unnamed_gemm_nnfW5_avm_byteenable <= bb_gemm_nnfW_B4_stall_region_out_unnamed_gemm_nnfW5_avm_byteenable;

    -- out_unnamed_gemm_nnfW5_avm_enable(GPOUT,59)
    out_unnamed_gemm_nnfW5_avm_enable <= bb_gemm_nnfW_B4_stall_region_out_unnamed_gemm_nnfW5_avm_enable;

    -- out_unnamed_gemm_nnfW5_avm_read(GPOUT,60)
    out_unnamed_gemm_nnfW5_avm_read <= bb_gemm_nnfW_B4_stall_region_out_unnamed_gemm_nnfW5_avm_read;

    -- out_unnamed_gemm_nnfW5_avm_write(GPOUT,61)
    out_unnamed_gemm_nnfW5_avm_write <= bb_gemm_nnfW_B4_stall_region_out_unnamed_gemm_nnfW5_avm_write;

    -- out_unnamed_gemm_nnfW5_avm_writedata(GPOUT,62)
    out_unnamed_gemm_nnfW5_avm_writedata <= bb_gemm_nnfW_B4_stall_region_out_unnamed_gemm_nnfW5_avm_writedata;

    -- out_valid_out_0(GPOUT,63)
    out_valid_out_0 <= gemm_nnfW_B4_branch_out_valid_out_0;

    -- pipeline_valid_out_sync(GPOUT,65)
    out_pipeline_valid_out <= bb_gemm_nnfW_B4_stall_region_out_pipeline_valid_out;

END normal;
