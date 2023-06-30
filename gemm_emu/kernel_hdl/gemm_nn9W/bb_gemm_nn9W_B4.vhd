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

-- VHDL created from bb_gemm_nn9W_B4
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

entity bb_gemm_nn9W_B4 is
    port (
        in_A : in std_logic_vector(63 downto 0);  -- ufix64
        in_B : in std_logic_vector(63 downto 0);  -- ufix64
        in_C : in std_logic_vector(63 downto 0);  -- ufix64
        in_K : in std_logic_vector(31 downto 0);  -- ufix32
        in_M : in std_logic_vector(31 downto 0);  -- ufix32
        in_N : in std_logic_vector(31 downto 0);  -- ufix32
        in_cmp367_RM311_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp367_RM311_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp75_RM309_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp75_RM309_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_div1_RM307_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_div1_RM307_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_div_RM313_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_div_RM313_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked304_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked304_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_lda : in std_logic_vector(31 downto 0);  -- ufix32
        in_ldc : in std_logic_vector(31 downto 0);  -- ufix32
        in_memdep_phi257_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi257_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi262_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi262_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi267_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi267_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi277_pop16317_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi277_pop16317_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_mul27315_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul27315_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_notexit300305_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_notexit300305_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W1_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W1_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W2_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_gemm_nn9W2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W2_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe10388 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11389 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe12390 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe13391 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1379 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe2380 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe3381 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe4382 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe5383 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe6384 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe7385 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe8386 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe1397 : out std_logic_vector(63 downto 0);  -- ufix64
        out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi257 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi262 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi267 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nn9W2_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_gemm_nn9W2_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_unnamed_gemm_nn9W2_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_gemm_nn9W2_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nn9W2_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nn9W2_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nn9W2_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nn9W_B4;

architecture normal of bb_gemm_nn9W_B4 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_gemm_nn9W_B4_stall_region is
        port (
            in_C : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_cmp367_RM311 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp75_RM309 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_div1_RM307 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_div_RM313 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked304 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi257 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi262 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi267 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi277_pop16317 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_mul27315 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_notexit300305 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W2_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W2_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W2_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W2_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_memdep_phi257 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi262 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi267 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
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


    component gemm_nn9W_B4_branch is
        port (
            in_c0_exe10388 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe11389 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe12390 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe13391 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe1379 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe2380 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe3381 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe4382 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe5383 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe6384 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe7385 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe8386 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe1397 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_memdep_phi257 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi262 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi267 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_memdep_phi257 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi262 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi267 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gemm_nn9W_B4_merge is
        port (
            in_cmp367_RM311_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp367_RM311_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp75_RM309_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_cmp75_RM309_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_div1_RM307_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_div1_RM307_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_div_RM313_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_div_RM313_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_forked304_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked304_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
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
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W1_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nn9W1_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_cmp367_RM311 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_cmp75_RM309 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_div1_RM307 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_div_RM313 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_forked304 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi257 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi262 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi267 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi277_pop16317 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_mul27315 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_notexit300305 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nn9W1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_gemm_nn9W_B4_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_c0_exe10388 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_c0_exe11389 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_c0_exe12390 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_c0_exe13391 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_c0_exe1379 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_c0_exe2380 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_c0_exe3381 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_c0_exe4382 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_c0_exe5383 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_c0_exe6384 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_c0_exe7385 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_c0_exe8386 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_c1_exe1397 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_memdep_phi257 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_memdep_phi262 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_memdep_phi267 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_unnamed_gemm_nn9W2_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_unnamed_gemm_nn9W2_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_unnamed_gemm_nn9W2_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_unnamed_gemm_nn9W2_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_unnamed_gemm_nn9W2_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_unnamed_gemm_nn9W2_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_unnamed_gemm_nn9W2_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_gemm_nn9W_B4_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_branch_out_c0_exe10388 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_branch_out_c0_exe11389 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_branch_out_c0_exe12390 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_branch_out_c0_exe13391 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B4_branch_out_c0_exe1379 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B4_branch_out_c0_exe2380 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nn9W_B4_branch_out_c0_exe3381 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_branch_out_c0_exe4382 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B4_branch_out_c0_exe5383 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B4_branch_out_c0_exe6384 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_branch_out_c0_exe7385 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_branch_out_c0_exe8386 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_branch_out_c1_exe1397 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nn9W_B4_branch_out_memdep_phi257 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_branch_out_memdep_phi262 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_branch_out_memdep_phi267 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_merge_out_cmp367_RM311 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_merge_out_cmp75_RM309 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_merge_out_div1_RM307 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B4_merge_out_div_RM313 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B4_merge_out_forked304 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_merge_out_memdep_phi257 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_merge_out_memdep_phi262 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_merge_out_memdep_phi267 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_merge_out_memdep_phi277_pop16317 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_merge_out_mul27315 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B4_merge_out_notexit300305 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_merge_out_unnamed_gemm_nn9W1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B4_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- gemm_nn9W_B4_merge(BLACKBOX,4)
    thegemm_nn9W_B4_merge : gemm_nn9W_B4_merge
    PORT MAP (
        in_cmp367_RM311_0 => in_cmp367_RM311_0,
        in_cmp367_RM311_1 => in_cmp367_RM311_1,
        in_cmp75_RM309_0 => in_cmp75_RM309_0,
        in_cmp75_RM309_1 => in_cmp75_RM309_1,
        in_div1_RM307_0 => in_div1_RM307_0,
        in_div1_RM307_1 => in_div1_RM307_1,
        in_div_RM313_0 => in_div_RM313_0,
        in_div_RM313_1 => in_div_RM313_1,
        in_forked304_0 => in_forked304_0,
        in_forked304_1 => in_forked304_1,
        in_memdep_phi257_0 => in_memdep_phi257_0,
        in_memdep_phi257_1 => in_memdep_phi257_1,
        in_memdep_phi262_0 => in_memdep_phi262_0,
        in_memdep_phi262_1 => in_memdep_phi262_1,
        in_memdep_phi267_0 => in_memdep_phi267_0,
        in_memdep_phi267_1 => in_memdep_phi267_1,
        in_memdep_phi277_pop16317_0 => in_memdep_phi277_pop16317_0,
        in_memdep_phi277_pop16317_1 => in_memdep_phi277_pop16317_1,
        in_mul27315_0 => in_mul27315_0,
        in_mul27315_1 => in_mul27315_1,
        in_notexit300305_0 => in_notexit300305_0,
        in_notexit300305_1 => in_notexit300305_1,
        in_stall_in => bb_gemm_nn9W_B4_stall_region_out_stall_out,
        in_unnamed_gemm_nn9W1_0 => in_unnamed_gemm_nn9W1_0,
        in_unnamed_gemm_nn9W1_1 => in_unnamed_gemm_nn9W1_1,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_cmp367_RM311 => gemm_nn9W_B4_merge_out_cmp367_RM311,
        out_cmp75_RM309 => gemm_nn9W_B4_merge_out_cmp75_RM309,
        out_div1_RM307 => gemm_nn9W_B4_merge_out_div1_RM307,
        out_div_RM313 => gemm_nn9W_B4_merge_out_div_RM313,
        out_forked304 => gemm_nn9W_B4_merge_out_forked304,
        out_memdep_phi257 => gemm_nn9W_B4_merge_out_memdep_phi257,
        out_memdep_phi262 => gemm_nn9W_B4_merge_out_memdep_phi262,
        out_memdep_phi267 => gemm_nn9W_B4_merge_out_memdep_phi267,
        out_memdep_phi277_pop16317 => gemm_nn9W_B4_merge_out_memdep_phi277_pop16317,
        out_mul27315 => gemm_nn9W_B4_merge_out_mul27315,
        out_notexit300305 => gemm_nn9W_B4_merge_out_notexit300305,
        out_stall_out_0 => gemm_nn9W_B4_merge_out_stall_out_0,
        out_stall_out_1 => gemm_nn9W_B4_merge_out_stall_out_1,
        out_unnamed_gemm_nn9W1 => gemm_nn9W_B4_merge_out_unnamed_gemm_nn9W1,
        out_valid_out => gemm_nn9W_B4_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nn9W_B4_stall_region(BLACKBOX,2)
    thebb_gemm_nn9W_B4_stall_region : bb_gemm_nn9W_B4_stall_region
    PORT MAP (
        in_C => in_C,
        in_M => in_M,
        in_N => in_N,
        in_cmp367_RM311 => gemm_nn9W_B4_merge_out_cmp367_RM311,
        in_cmp75_RM309 => gemm_nn9W_B4_merge_out_cmp75_RM309,
        in_div1_RM307 => gemm_nn9W_B4_merge_out_div1_RM307,
        in_div_RM313 => gemm_nn9W_B4_merge_out_div_RM313,
        in_flush => in_flush,
        in_forked304 => gemm_nn9W_B4_merge_out_forked304,
        in_memdep_phi257 => gemm_nn9W_B4_merge_out_memdep_phi257,
        in_memdep_phi262 => gemm_nn9W_B4_merge_out_memdep_phi262,
        in_memdep_phi267 => gemm_nn9W_B4_merge_out_memdep_phi267,
        in_memdep_phi277_pop16317 => gemm_nn9W_B4_merge_out_memdep_phi277_pop16317,
        in_mul27315 => gemm_nn9W_B4_merge_out_mul27315,
        in_notexit300305 => gemm_nn9W_B4_merge_out_notexit300305,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_stall_in => gemm_nn9W_B4_branch_out_stall_out,
        in_unnamed_gemm_nn9W1 => gemm_nn9W_B4_merge_out_unnamed_gemm_nn9W1,
        in_unnamed_gemm_nn9W2_avm_readdata => in_unnamed_gemm_nn9W2_avm_readdata,
        in_unnamed_gemm_nn9W2_avm_readdatavalid => in_unnamed_gemm_nn9W2_avm_readdatavalid,
        in_unnamed_gemm_nn9W2_avm_waitrequest => in_unnamed_gemm_nn9W2_avm_waitrequest,
        in_unnamed_gemm_nn9W2_avm_writeack => in_unnamed_gemm_nn9W2_avm_writeack,
        in_valid_in => gemm_nn9W_B4_merge_out_valid_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_stall_out => bb_gemm_nn9W_B4_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_valid_out => bb_gemm_nn9W_B4_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_valid_out,
        out_c0_exe10388 => bb_gemm_nn9W_B4_stall_region_out_c0_exe10388,
        out_c0_exe11389 => bb_gemm_nn9W_B4_stall_region_out_c0_exe11389,
        out_c0_exe12390 => bb_gemm_nn9W_B4_stall_region_out_c0_exe12390,
        out_c0_exe13391 => bb_gemm_nn9W_B4_stall_region_out_c0_exe13391,
        out_c0_exe1379 => bb_gemm_nn9W_B4_stall_region_out_c0_exe1379,
        out_c0_exe2380 => bb_gemm_nn9W_B4_stall_region_out_c0_exe2380,
        out_c0_exe3381 => bb_gemm_nn9W_B4_stall_region_out_c0_exe3381,
        out_c0_exe4382 => bb_gemm_nn9W_B4_stall_region_out_c0_exe4382,
        out_c0_exe5383 => bb_gemm_nn9W_B4_stall_region_out_c0_exe5383,
        out_c0_exe6384 => bb_gemm_nn9W_B4_stall_region_out_c0_exe6384,
        out_c0_exe7385 => bb_gemm_nn9W_B4_stall_region_out_c0_exe7385,
        out_c0_exe8386 => bb_gemm_nn9W_B4_stall_region_out_c0_exe8386,
        out_c1_exe1397 => bb_gemm_nn9W_B4_stall_region_out_c1_exe1397,
        out_memdep_phi257 => bb_gemm_nn9W_B4_stall_region_out_memdep_phi257,
        out_memdep_phi262 => bb_gemm_nn9W_B4_stall_region_out_memdep_phi262,
        out_memdep_phi267 => bb_gemm_nn9W_B4_stall_region_out_memdep_phi267,
        out_pipeline_valid_out => bb_gemm_nn9W_B4_stall_region_out_pipeline_valid_out,
        out_stall_out => bb_gemm_nn9W_B4_stall_region_out_stall_out,
        out_unnamed_gemm_nn9W2_avm_address => bb_gemm_nn9W_B4_stall_region_out_unnamed_gemm_nn9W2_avm_address,
        out_unnamed_gemm_nn9W2_avm_burstcount => bb_gemm_nn9W_B4_stall_region_out_unnamed_gemm_nn9W2_avm_burstcount,
        out_unnamed_gemm_nn9W2_avm_byteenable => bb_gemm_nn9W_B4_stall_region_out_unnamed_gemm_nn9W2_avm_byteenable,
        out_unnamed_gemm_nn9W2_avm_enable => bb_gemm_nn9W_B4_stall_region_out_unnamed_gemm_nn9W2_avm_enable,
        out_unnamed_gemm_nn9W2_avm_read => bb_gemm_nn9W_B4_stall_region_out_unnamed_gemm_nn9W2_avm_read,
        out_unnamed_gemm_nn9W2_avm_write => bb_gemm_nn9W_B4_stall_region_out_unnamed_gemm_nn9W2_avm_write,
        out_unnamed_gemm_nn9W2_avm_writedata => bb_gemm_nn9W_B4_stall_region_out_unnamed_gemm_nn9W2_avm_writedata,
        out_valid_out => bb_gemm_nn9W_B4_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- gemm_nn9W_B4_branch(BLACKBOX,3)
    thegemm_nn9W_B4_branch : gemm_nn9W_B4_branch
    PORT MAP (
        in_c0_exe10388 => bb_gemm_nn9W_B4_stall_region_out_c0_exe10388,
        in_c0_exe11389 => bb_gemm_nn9W_B4_stall_region_out_c0_exe11389,
        in_c0_exe12390 => bb_gemm_nn9W_B4_stall_region_out_c0_exe12390,
        in_c0_exe13391 => bb_gemm_nn9W_B4_stall_region_out_c0_exe13391,
        in_c0_exe1379 => bb_gemm_nn9W_B4_stall_region_out_c0_exe1379,
        in_c0_exe2380 => bb_gemm_nn9W_B4_stall_region_out_c0_exe2380,
        in_c0_exe3381 => bb_gemm_nn9W_B4_stall_region_out_c0_exe3381,
        in_c0_exe4382 => bb_gemm_nn9W_B4_stall_region_out_c0_exe4382,
        in_c0_exe5383 => bb_gemm_nn9W_B4_stall_region_out_c0_exe5383,
        in_c0_exe6384 => bb_gemm_nn9W_B4_stall_region_out_c0_exe6384,
        in_c0_exe7385 => bb_gemm_nn9W_B4_stall_region_out_c0_exe7385,
        in_c0_exe8386 => bb_gemm_nn9W_B4_stall_region_out_c0_exe8386,
        in_c1_exe1397 => bb_gemm_nn9W_B4_stall_region_out_c1_exe1397,
        in_memdep_phi257 => bb_gemm_nn9W_B4_stall_region_out_memdep_phi257,
        in_memdep_phi262 => bb_gemm_nn9W_B4_stall_region_out_memdep_phi262,
        in_memdep_phi267 => bb_gemm_nn9W_B4_stall_region_out_memdep_phi267,
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_gemm_nn9W_B4_stall_region_out_valid_out,
        out_c0_exe10388 => gemm_nn9W_B4_branch_out_c0_exe10388,
        out_c0_exe11389 => gemm_nn9W_B4_branch_out_c0_exe11389,
        out_c0_exe12390 => gemm_nn9W_B4_branch_out_c0_exe12390,
        out_c0_exe13391 => gemm_nn9W_B4_branch_out_c0_exe13391,
        out_c0_exe1379 => gemm_nn9W_B4_branch_out_c0_exe1379,
        out_c0_exe2380 => gemm_nn9W_B4_branch_out_c0_exe2380,
        out_c0_exe3381 => gemm_nn9W_B4_branch_out_c0_exe3381,
        out_c0_exe4382 => gemm_nn9W_B4_branch_out_c0_exe4382,
        out_c0_exe5383 => gemm_nn9W_B4_branch_out_c0_exe5383,
        out_c0_exe6384 => gemm_nn9W_B4_branch_out_c0_exe6384,
        out_c0_exe7385 => gemm_nn9W_B4_branch_out_c0_exe7385,
        out_c0_exe8386 => gemm_nn9W_B4_branch_out_c0_exe8386,
        out_c1_exe1397 => gemm_nn9W_B4_branch_out_c1_exe1397,
        out_memdep_phi257 => gemm_nn9W_B4_branch_out_memdep_phi257,
        out_memdep_phi262 => gemm_nn9W_B4_branch_out_memdep_phi262,
        out_memdep_phi267 => gemm_nn9W_B4_branch_out_memdep_phi267,
        out_stall_out => gemm_nn9W_B4_branch_out_stall_out,
        out_valid_out_0 => gemm_nn9W_B4_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe10388(GPOUT,45)
    out_c0_exe10388 <= gemm_nn9W_B4_branch_out_c0_exe10388;

    -- out_c0_exe11389(GPOUT,46)
    out_c0_exe11389 <= gemm_nn9W_B4_branch_out_c0_exe11389;

    -- out_c0_exe12390(GPOUT,47)
    out_c0_exe12390 <= gemm_nn9W_B4_branch_out_c0_exe12390;

    -- out_c0_exe13391(GPOUT,48)
    out_c0_exe13391 <= gemm_nn9W_B4_branch_out_c0_exe13391;

    -- out_c0_exe1379(GPOUT,49)
    out_c0_exe1379 <= gemm_nn9W_B4_branch_out_c0_exe1379;

    -- out_c0_exe2380(GPOUT,50)
    out_c0_exe2380 <= gemm_nn9W_B4_branch_out_c0_exe2380;

    -- out_c0_exe3381(GPOUT,51)
    out_c0_exe3381 <= gemm_nn9W_B4_branch_out_c0_exe3381;

    -- out_c0_exe4382(GPOUT,52)
    out_c0_exe4382 <= gemm_nn9W_B4_branch_out_c0_exe4382;

    -- out_c0_exe5383(GPOUT,53)
    out_c0_exe5383 <= gemm_nn9W_B4_branch_out_c0_exe5383;

    -- out_c0_exe6384(GPOUT,54)
    out_c0_exe6384 <= gemm_nn9W_B4_branch_out_c0_exe6384;

    -- out_c0_exe7385(GPOUT,55)
    out_c0_exe7385 <= gemm_nn9W_B4_branch_out_c0_exe7385;

    -- out_c0_exe8386(GPOUT,56)
    out_c0_exe8386 <= gemm_nn9W_B4_branch_out_c0_exe8386;

    -- out_c1_exe1397(GPOUT,57)
    out_c1_exe1397 <= gemm_nn9W_B4_branch_out_c1_exe1397;

    -- out_exiting_stall_out(GPOUT,58)
    out_exiting_stall_out <= bb_gemm_nn9W_B4_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_stall_out;

    -- out_exiting_valid_out(GPOUT,59)
    out_exiting_valid_out <= bb_gemm_nn9W_B4_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_valid_out;

    -- out_memdep_phi257(GPOUT,60)
    out_memdep_phi257 <= gemm_nn9W_B4_branch_out_memdep_phi257;

    -- out_memdep_phi262(GPOUT,61)
    out_memdep_phi262 <= gemm_nn9W_B4_branch_out_memdep_phi262;

    -- out_memdep_phi267(GPOUT,62)
    out_memdep_phi267 <= gemm_nn9W_B4_branch_out_memdep_phi267;

    -- out_stall_out_0(GPOUT,63)
    out_stall_out_0 <= gemm_nn9W_B4_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,64)
    out_stall_out_1 <= gemm_nn9W_B4_merge_out_stall_out_1;

    -- out_unnamed_gemm_nn9W2_avm_address(GPOUT,65)
    out_unnamed_gemm_nn9W2_avm_address <= bb_gemm_nn9W_B4_stall_region_out_unnamed_gemm_nn9W2_avm_address;

    -- out_unnamed_gemm_nn9W2_avm_burstcount(GPOUT,66)
    out_unnamed_gemm_nn9W2_avm_burstcount <= bb_gemm_nn9W_B4_stall_region_out_unnamed_gemm_nn9W2_avm_burstcount;

    -- out_unnamed_gemm_nn9W2_avm_byteenable(GPOUT,67)
    out_unnamed_gemm_nn9W2_avm_byteenable <= bb_gemm_nn9W_B4_stall_region_out_unnamed_gemm_nn9W2_avm_byteenable;

    -- out_unnamed_gemm_nn9W2_avm_enable(GPOUT,68)
    out_unnamed_gemm_nn9W2_avm_enable <= bb_gemm_nn9W_B4_stall_region_out_unnamed_gemm_nn9W2_avm_enable;

    -- out_unnamed_gemm_nn9W2_avm_read(GPOUT,69)
    out_unnamed_gemm_nn9W2_avm_read <= bb_gemm_nn9W_B4_stall_region_out_unnamed_gemm_nn9W2_avm_read;

    -- out_unnamed_gemm_nn9W2_avm_write(GPOUT,70)
    out_unnamed_gemm_nn9W2_avm_write <= bb_gemm_nn9W_B4_stall_region_out_unnamed_gemm_nn9W2_avm_write;

    -- out_unnamed_gemm_nn9W2_avm_writedata(GPOUT,71)
    out_unnamed_gemm_nn9W2_avm_writedata <= bb_gemm_nn9W_B4_stall_region_out_unnamed_gemm_nn9W2_avm_writedata;

    -- out_valid_out_0(GPOUT,72)
    out_valid_out_0 <= gemm_nn9W_B4_branch_out_valid_out_0;

    -- pipeline_valid_out_sync(GPOUT,74)
    out_pipeline_valid_out <= bb_gemm_nn9W_B4_stall_region_out_pipeline_valid_out;

END normal;
