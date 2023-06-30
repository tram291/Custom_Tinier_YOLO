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

-- VHDL created from bb_gemm_nnfW_B1
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

entity bb_gemm_nnfW_B1 is
    port (
        in_feedback_in_10 : in std_logic_vector(7 downto 0);  -- ufix8
        out_feedback_stall_out_10 : out std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_valid_in_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_A : in std_logic_vector(63 downto 0);  -- ufix64
        in_B : in std_logic_vector(63 downto 0);  -- ufix64
        in_C : in std_logic_vector(63 downto 0);  -- ufix64
        in_K : in std_logic_vector(31 downto 0);  -- ufix32
        in_M : in std_logic_vector(31 downto 0);  -- ufix32
        in_N : in std_logic_vector(31 downto 0);  -- ufix32
        in_forked_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_lda : in std_logic_vector(31 downto 0);  -- ufix32
        in_ldc : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_forked : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi_pop10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_sdiv_add124_RM : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nnfW_B1;

architecture normal of bb_gemm_nnfW_B1 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_gemm_nnfW_B1_stall_region is
        port (
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_in_10 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_lda : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_forked : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi_pop10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_sdiv_add124_RM : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gemm_nnfW_B1_branch is
        port (
            in_c0_exe1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exe2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi_pop10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_sdiv_add124_RM : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exe2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_forked : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi_pop10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_sdiv_add124_RM : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gemm_nnfW_B1_merge is
        port (
            in_forked_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_forked : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_gemm_nnfW_B1_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B1_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B1_stall_region_out_c0_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B1_stall_region_out_c0_exe2 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B1_stall_region_out_c0_exe3 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B1_stall_region_out_feedback_stall_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B1_stall_region_out_forked : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B1_stall_region_out_memdep_phi_pop10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B1_stall_region_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B1_stall_region_out_sdiv_add124_RM : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B1_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B1_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B1_branch_out_c0_exe1 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B1_branch_out_c0_exe2 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B1_branch_out_c0_exe3 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B1_branch_out_forked : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B1_branch_out_memdep_phi_pop10 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B1_branch_out_sdiv_add124_RM : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B1_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B1_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B1_merge_out_forked : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B1_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B1_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B1_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- gemm_nnfW_B1_branch(BLACKBOX,6)
    thegemm_nnfW_B1_branch : gemm_nnfW_B1_branch
    PORT MAP (
        in_c0_exe1 => bb_gemm_nnfW_B1_stall_region_out_c0_exe1,
        in_c0_exe2 => bb_gemm_nnfW_B1_stall_region_out_c0_exe2,
        in_c0_exe3 => bb_gemm_nnfW_B1_stall_region_out_c0_exe3,
        in_forked => bb_gemm_nnfW_B1_stall_region_out_forked,
        in_memdep_phi_pop10 => bb_gemm_nnfW_B1_stall_region_out_memdep_phi_pop10,
        in_sdiv_add124_RM => bb_gemm_nnfW_B1_stall_region_out_sdiv_add124_RM,
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_gemm_nnfW_B1_stall_region_out_valid_out,
        out_c0_exe1 => gemm_nnfW_B1_branch_out_c0_exe1,
        out_c0_exe2 => gemm_nnfW_B1_branch_out_c0_exe2,
        out_c0_exe3 => gemm_nnfW_B1_branch_out_c0_exe3,
        out_forked => gemm_nnfW_B1_branch_out_forked,
        out_memdep_phi_pop10 => gemm_nnfW_B1_branch_out_memdep_phi_pop10,
        out_sdiv_add124_RM => gemm_nnfW_B1_branch_out_sdiv_add124_RM,
        out_stall_out => gemm_nnfW_B1_branch_out_stall_out,
        out_valid_out_0 => gemm_nnfW_B1_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- gemm_nnfW_B1_merge(BLACKBOX,7)
    thegemm_nnfW_B1_merge : gemm_nnfW_B1_merge
    PORT MAP (
        in_forked_0 => in_forked_0,
        in_forked_1 => in_forked_1,
        in_stall_in => bb_gemm_nnfW_B1_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_forked => gemm_nnfW_B1_merge_out_forked,
        out_stall_out_0 => gemm_nnfW_B1_merge_out_stall_out_0,
        out_stall_out_1 => gemm_nnfW_B1_merge_out_stall_out_1,
        out_valid_out => gemm_nnfW_B1_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nnfW_B1_stall_region(BLACKBOX,2)
    thebb_gemm_nnfW_B1_stall_region : bb_gemm_nnfW_B1_stall_region
    PORT MAP (
        in_N => in_N,
        in_feedback_in_10 => in_feedback_in_10,
        in_feedback_valid_in_10 => in_feedback_valid_in_10,
        in_forked => gemm_nnfW_B1_merge_out_forked,
        in_lda => in_lda,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_stall_in => gemm_nnfW_B1_branch_out_stall_out,
        in_valid_in => gemm_nnfW_B1_merge_out_valid_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_stall_out => bb_gemm_nnfW_B1_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_valid_out => bb_gemm_nnfW_B1_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_valid_out,
        out_c0_exe1 => bb_gemm_nnfW_B1_stall_region_out_c0_exe1,
        out_c0_exe2 => bb_gemm_nnfW_B1_stall_region_out_c0_exe2,
        out_c0_exe3 => bb_gemm_nnfW_B1_stall_region_out_c0_exe3,
        out_feedback_stall_out_10 => bb_gemm_nnfW_B1_stall_region_out_feedback_stall_out_10,
        out_forked => bb_gemm_nnfW_B1_stall_region_out_forked,
        out_memdep_phi_pop10 => bb_gemm_nnfW_B1_stall_region_out_memdep_phi_pop10,
        out_pipeline_valid_out => bb_gemm_nnfW_B1_stall_region_out_pipeline_valid_out,
        out_sdiv_add124_RM => bb_gemm_nnfW_B1_stall_region_out_sdiv_add124_RM,
        out_stall_out => bb_gemm_nnfW_B1_stall_region_out_stall_out,
        out_valid_out => bb_gemm_nnfW_B1_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- feedback_stall_out_10_sync(GPOUT,4)
    out_feedback_stall_out_10 <= bb_gemm_nnfW_B1_stall_region_out_feedback_stall_out_10;

    -- out_c0_exe1(GPOUT,21)
    out_c0_exe1 <= gemm_nnfW_B1_branch_out_c0_exe1;

    -- out_c0_exe2(GPOUT,22)
    out_c0_exe2 <= gemm_nnfW_B1_branch_out_c0_exe2;

    -- out_c0_exe3(GPOUT,23)
    out_c0_exe3 <= gemm_nnfW_B1_branch_out_c0_exe3;

    -- out_exiting_stall_out(GPOUT,24)
    out_exiting_stall_out <= bb_gemm_nnfW_B1_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_stall_out;

    -- out_exiting_valid_out(GPOUT,25)
    out_exiting_valid_out <= bb_gemm_nnfW_B1_stall_region_out_aclp_to_limiter_i_acl_pipeline_keep_going27_gemm_nnfw_exiting_valid_out;

    -- out_forked(GPOUT,26)
    out_forked <= gemm_nnfW_B1_branch_out_forked;

    -- out_memdep_phi_pop10(GPOUT,27)
    out_memdep_phi_pop10 <= gemm_nnfW_B1_branch_out_memdep_phi_pop10;

    -- out_sdiv_add124_RM(GPOUT,28)
    out_sdiv_add124_RM <= gemm_nnfW_B1_branch_out_sdiv_add124_RM;

    -- out_stall_out_0(GPOUT,29)
    out_stall_out_0 <= gemm_nnfW_B1_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,30)
    out_stall_out_1 <= gemm_nnfW_B1_merge_out_stall_out_1;

    -- out_valid_out_0(GPOUT,31)
    out_valid_out_0 <= gemm_nnfW_B1_branch_out_valid_out_0;

    -- pipeline_valid_out_sync(GPOUT,33)
    out_pipeline_valid_out <= bb_gemm_nnfW_B1_stall_region_out_pipeline_valid_out;

END normal;
