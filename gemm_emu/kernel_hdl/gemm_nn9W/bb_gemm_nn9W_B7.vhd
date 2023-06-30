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

-- VHDL created from bb_gemm_nn9W_B7
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

entity bb_gemm_nn9W_B7 is
    port (
        out_feedback_out_10 : out std_logic_vector(7 downto 0);  -- ufix8
        out_feedback_out_11 : out std_logic_vector(7 downto 0);  -- ufix8
        out_feedback_out_12 : out std_logic_vector(7 downto 0);  -- ufix8
        out_feedback_out_13 : out std_logic_vector(7 downto 0);  -- ufix8
        out_feedback_out_14 : out std_logic_vector(7 downto 0);  -- ufix8
        out_feedback_out_15 : out std_logic_vector(7 downto 0);  -- ufix8
        out_feedback_out_16 : out std_logic_vector(7 downto 0);  -- ufix8
        in_feedback_stall_in_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_stall_in_11 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_stall_in_12 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_stall_in_13 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_stall_in_14 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_stall_in_15 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_stall_in_16 : in std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_13 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_14 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_15 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_16 : out std_logic_vector(0 downto 0);  -- ufix1
        in_A : in std_logic_vector(63 downto 0);  -- ufix64
        in_B : in std_logic_vector(63 downto 0);  -- ufix64
        in_C : in std_logic_vector(63 downto 0);  -- ufix64
        in_K : in std_logic_vector(31 downto 0);  -- ufix32
        in_M : in std_logic_vector(31 downto 0);  -- ufix32
        in_N : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe743510_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe843612_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe145715_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe245817_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe345919_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_lda : in std_logic_vector(31 downto 0);  -- ufix32
        in_ldc : in std_logic_vector(31 downto 0);  -- ufix32
        in_memdep_27621_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi2583_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi2635_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi2687_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nn9W_B7;

architecture normal of bb_gemm_nn9W_B7 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_gemm_nn9W_B7_stall_region is
        port (
            in_c0_exe743510 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe843612 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe145715 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe245817 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe345919 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_27621 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi2583 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi2635 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi2687 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe743510 : out std_logic_vector(0 downto 0);  -- Fixed Point
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
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gemm_nn9W_B7_branch is
        port (
            in_c0_exe743510 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gemm_nn9W_B7_merge is
        port (
            in_c0_exe743510_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe843612_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe145715_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe245817_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe345919_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_27621_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi2583_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi2635_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi2687_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe743510 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe843612 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe145715 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe245817 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe345919 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_27621 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi2583 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi2635 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi2687 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_gemm_nn9W_B7_stall_region_out_c0_exe743510 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_stall_region_out_feedback_out_10 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gemm_nn9W_B7_stall_region_out_feedback_out_11 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gemm_nn9W_B7_stall_region_out_feedback_out_12 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gemm_nn9W_B7_stall_region_out_feedback_out_13 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gemm_nn9W_B7_stall_region_out_feedback_out_14 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gemm_nn9W_B7_stall_region_out_feedback_out_15 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gemm_nn9W_B7_stall_region_out_feedback_out_16 : STD_LOGIC_VECTOR (7 downto 0);
    signal bb_gemm_nn9W_B7_stall_region_out_feedback_valid_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_stall_region_out_feedback_valid_out_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_stall_region_out_feedback_valid_out_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_stall_region_out_feedback_valid_out_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_stall_region_out_feedback_valid_out_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_stall_region_out_feedback_valid_out_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_stall_region_out_feedback_valid_out_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B7_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B7_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B7_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B7_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B7_merge_out_c0_exe743510 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B7_merge_out_c0_exe843612 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B7_merge_out_c1_exe145715 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B7_merge_out_c1_exe245817 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B7_merge_out_c1_exe345919 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B7_merge_out_memdep_27621 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B7_merge_out_memdep_phi2583 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B7_merge_out_memdep_phi2635 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B7_merge_out_memdep_phi2687 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B7_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B7_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- gemm_nn9W_B7_branch(BLACKBOX,24)
    thegemm_nn9W_B7_branch : gemm_nn9W_B7_branch
    PORT MAP (
        in_c0_exe743510 => bb_gemm_nn9W_B7_stall_region_out_c0_exe743510,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_valid_in => bb_gemm_nn9W_B7_stall_region_out_valid_out,
        out_stall_out => gemm_nn9W_B7_branch_out_stall_out,
        out_valid_out_0 => gemm_nn9W_B7_branch_out_valid_out_0,
        out_valid_out_1 => gemm_nn9W_B7_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- gemm_nn9W_B7_merge(BLACKBOX,25)
    thegemm_nn9W_B7_merge : gemm_nn9W_B7_merge
    PORT MAP (
        in_c0_exe743510_0 => in_c0_exe743510_0,
        in_c0_exe843612_0 => in_c0_exe843612_0,
        in_c1_exe145715_0 => in_c1_exe145715_0,
        in_c1_exe245817_0 => in_c1_exe245817_0,
        in_c1_exe345919_0 => in_c1_exe345919_0,
        in_memdep_27621_0 => in_memdep_27621_0,
        in_memdep_phi2583_0 => in_memdep_phi2583_0,
        in_memdep_phi2635_0 => in_memdep_phi2635_0,
        in_memdep_phi2687_0 => in_memdep_phi2687_0,
        in_stall_in => bb_gemm_nn9W_B7_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_c0_exe743510 => gemm_nn9W_B7_merge_out_c0_exe743510,
        out_c0_exe843612 => gemm_nn9W_B7_merge_out_c0_exe843612,
        out_c1_exe145715 => gemm_nn9W_B7_merge_out_c1_exe145715,
        out_c1_exe245817 => gemm_nn9W_B7_merge_out_c1_exe245817,
        out_c1_exe345919 => gemm_nn9W_B7_merge_out_c1_exe345919,
        out_memdep_27621 => gemm_nn9W_B7_merge_out_memdep_27621,
        out_memdep_phi2583 => gemm_nn9W_B7_merge_out_memdep_phi2583,
        out_memdep_phi2635 => gemm_nn9W_B7_merge_out_memdep_phi2635,
        out_memdep_phi2687 => gemm_nn9W_B7_merge_out_memdep_phi2687,
        out_stall_out_0 => gemm_nn9W_B7_merge_out_stall_out_0,
        out_valid_out => gemm_nn9W_B7_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nn9W_B7_stall_region(BLACKBOX,2)
    thebb_gemm_nn9W_B7_stall_region : bb_gemm_nn9W_B7_stall_region
    PORT MAP (
        in_c0_exe743510 => gemm_nn9W_B7_merge_out_c0_exe743510,
        in_c0_exe843612 => gemm_nn9W_B7_merge_out_c0_exe843612,
        in_c1_exe145715 => gemm_nn9W_B7_merge_out_c1_exe145715,
        in_c1_exe245817 => gemm_nn9W_B7_merge_out_c1_exe245817,
        in_c1_exe345919 => gemm_nn9W_B7_merge_out_c1_exe345919,
        in_feedback_stall_in_10 => in_feedback_stall_in_10,
        in_feedback_stall_in_11 => in_feedback_stall_in_11,
        in_feedback_stall_in_12 => in_feedback_stall_in_12,
        in_feedback_stall_in_13 => in_feedback_stall_in_13,
        in_feedback_stall_in_14 => in_feedback_stall_in_14,
        in_feedback_stall_in_15 => in_feedback_stall_in_15,
        in_feedback_stall_in_16 => in_feedback_stall_in_16,
        in_memdep_27621 => gemm_nn9W_B7_merge_out_memdep_27621,
        in_memdep_phi2583 => gemm_nn9W_B7_merge_out_memdep_phi2583,
        in_memdep_phi2635 => gemm_nn9W_B7_merge_out_memdep_phi2635,
        in_memdep_phi2687 => gemm_nn9W_B7_merge_out_memdep_phi2687,
        in_stall_in => gemm_nn9W_B7_branch_out_stall_out,
        in_valid_in => gemm_nn9W_B7_merge_out_valid_out,
        out_c0_exe743510 => bb_gemm_nn9W_B7_stall_region_out_c0_exe743510,
        out_feedback_out_10 => bb_gemm_nn9W_B7_stall_region_out_feedback_out_10,
        out_feedback_out_11 => bb_gemm_nn9W_B7_stall_region_out_feedback_out_11,
        out_feedback_out_12 => bb_gemm_nn9W_B7_stall_region_out_feedback_out_12,
        out_feedback_out_13 => bb_gemm_nn9W_B7_stall_region_out_feedback_out_13,
        out_feedback_out_14 => bb_gemm_nn9W_B7_stall_region_out_feedback_out_14,
        out_feedback_out_15 => bb_gemm_nn9W_B7_stall_region_out_feedback_out_15,
        out_feedback_out_16 => bb_gemm_nn9W_B7_stall_region_out_feedback_out_16,
        out_feedback_valid_out_10 => bb_gemm_nn9W_B7_stall_region_out_feedback_valid_out_10,
        out_feedback_valid_out_11 => bb_gemm_nn9W_B7_stall_region_out_feedback_valid_out_11,
        out_feedback_valid_out_12 => bb_gemm_nn9W_B7_stall_region_out_feedback_valid_out_12,
        out_feedback_valid_out_13 => bb_gemm_nn9W_B7_stall_region_out_feedback_valid_out_13,
        out_feedback_valid_out_14 => bb_gemm_nn9W_B7_stall_region_out_feedback_valid_out_14,
        out_feedback_valid_out_15 => bb_gemm_nn9W_B7_stall_region_out_feedback_valid_out_15,
        out_feedback_valid_out_16 => bb_gemm_nn9W_B7_stall_region_out_feedback_valid_out_16,
        out_stall_out => bb_gemm_nn9W_B7_stall_region_out_stall_out,
        out_valid_out => bb_gemm_nn9W_B7_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- feedback_out_10_sync(GPOUT,3)
    out_feedback_out_10 <= bb_gemm_nn9W_B7_stall_region_out_feedback_out_10;

    -- feedback_out_11_sync(GPOUT,4)
    out_feedback_out_11 <= bb_gemm_nn9W_B7_stall_region_out_feedback_out_11;

    -- feedback_out_12_sync(GPOUT,5)
    out_feedback_out_12 <= bb_gemm_nn9W_B7_stall_region_out_feedback_out_12;

    -- feedback_out_13_sync(GPOUT,6)
    out_feedback_out_13 <= bb_gemm_nn9W_B7_stall_region_out_feedback_out_13;

    -- feedback_out_14_sync(GPOUT,7)
    out_feedback_out_14 <= bb_gemm_nn9W_B7_stall_region_out_feedback_out_14;

    -- feedback_out_15_sync(GPOUT,8)
    out_feedback_out_15 <= bb_gemm_nn9W_B7_stall_region_out_feedback_out_15;

    -- feedback_out_16_sync(GPOUT,9)
    out_feedback_out_16 <= bb_gemm_nn9W_B7_stall_region_out_feedback_out_16;

    -- feedback_valid_out_10_sync(GPOUT,17)
    out_feedback_valid_out_10 <= bb_gemm_nn9W_B7_stall_region_out_feedback_valid_out_10;

    -- feedback_valid_out_11_sync(GPOUT,18)
    out_feedback_valid_out_11 <= bb_gemm_nn9W_B7_stall_region_out_feedback_valid_out_11;

    -- feedback_valid_out_12_sync(GPOUT,19)
    out_feedback_valid_out_12 <= bb_gemm_nn9W_B7_stall_region_out_feedback_valid_out_12;

    -- feedback_valid_out_13_sync(GPOUT,20)
    out_feedback_valid_out_13 <= bb_gemm_nn9W_B7_stall_region_out_feedback_valid_out_13;

    -- feedback_valid_out_14_sync(GPOUT,21)
    out_feedback_valid_out_14 <= bb_gemm_nn9W_B7_stall_region_out_feedback_valid_out_14;

    -- feedback_valid_out_15_sync(GPOUT,22)
    out_feedback_valid_out_15 <= bb_gemm_nn9W_B7_stall_region_out_feedback_valid_out_15;

    -- feedback_valid_out_16_sync(GPOUT,23)
    out_feedback_valid_out_16 <= bb_gemm_nn9W_B7_stall_region_out_feedback_valid_out_16;

    -- out_stall_out_0(GPOUT,46)
    out_stall_out_0 <= gemm_nn9W_B7_merge_out_stall_out_0;

    -- out_valid_out_0(GPOUT,47)
    out_valid_out_0 <= gemm_nn9W_B7_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,48)
    out_valid_out_1 <= gemm_nn9W_B7_branch_out_valid_out_1;

END normal;
