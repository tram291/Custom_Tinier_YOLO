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

-- VHDL created from bb_gemm_nn9W_B7_stall_region
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

entity bb_gemm_nn9W_B7_stall_region is
    port (
        in_c0_exe743510 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe843612 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe145715 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe245817 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe345919 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_27621 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi2583 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi2635 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi2687 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe743510 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
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
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nn9W_B7_stall_region;

architecture normal of bb_gemm_nn9W_B7_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_push_i1_memdep_phi261_push11_gemm_nn9w1001 is
        port (
            in_c0_exe843612 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_11 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_memdep_phi266_push12_gemm_nn9w999 is
        port (
            in_c0_exe843612 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_12 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_memdep_phi269_push13_gemm_nn9w997 is
        port (
            in_c0_exe843612 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_13 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_13 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_13 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_memdep_phi272_push14_gemm_nn9w995 is
        port (
            in_c0_exe843612 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_14 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_14 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_14 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_memdep_phi274_push15_gemm_nn9w993 is
        port (
            in_c0_exe843612 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_15 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_15 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_15 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_memdep_phi277_push16_gemm_nn9w991 is
        port (
            in_c0_exe843612 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_16 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_memdep_phi_push10_gemm_nn9w1003 is
        port (
            in_c0_exe843612 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_10 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal i_acl_push_i1_memdep_phi261_push11_gemm_nn9w_out_feedback_out_11 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_memdep_phi261_push11_gemm_nn9w_out_feedback_valid_out_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi261_push11_gemm_nn9w_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi261_push11_gemm_nn9w_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi266_push12_gemm_nn9w_out_feedback_out_12 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_memdep_phi266_push12_gemm_nn9w_out_feedback_valid_out_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi266_push12_gemm_nn9w_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi266_push12_gemm_nn9w_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi269_push13_gemm_nn9w_out_feedback_out_13 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_memdep_phi269_push13_gemm_nn9w_out_feedback_valid_out_13 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi269_push13_gemm_nn9w_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi269_push13_gemm_nn9w_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi272_push14_gemm_nn9w_out_feedback_out_14 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_memdep_phi272_push14_gemm_nn9w_out_feedback_valid_out_14 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi272_push14_gemm_nn9w_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi272_push14_gemm_nn9w_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi274_push15_gemm_nn9w_out_feedback_out_15 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_memdep_phi274_push15_gemm_nn9w_out_feedback_valid_out_15 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi274_push15_gemm_nn9w_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi274_push15_gemm_nn9w_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi277_push16_gemm_nn9w_out_feedback_out_16 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_memdep_phi277_push16_gemm_nn9w_out_feedback_valid_out_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi277_push16_gemm_nn9w_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi277_push16_gemm_nn9w_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi_push10_gemm_nn9w_out_feedback_out_10 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_memdep_phi_push10_gemm_nn9w_out_feedback_valid_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi_push10_gemm_nn9w_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi_push10_gemm_nn9w_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_o4_1_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (8 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_i : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_j : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,85)
    SE_stall_entry_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_stall_entry_fromReg0 <= (others => '0');
            SE_stall_entry_fromReg1 <= (others => '0');
            SE_stall_entry_fromReg2 <= (others => '0');
            SE_stall_entry_fromReg3 <= (others => '0');
            SE_stall_entry_fromReg4 <= (others => '0');
            SE_stall_entry_fromReg5 <= (others => '0');
            SE_stall_entry_fromReg6 <= (others => '0');
            SE_stall_entry_fromReg7 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_stall_entry_fromReg0 <= SE_stall_entry_toReg0;
            -- Succesor 1
            SE_stall_entry_fromReg1 <= SE_stall_entry_toReg1;
            -- Succesor 2
            SE_stall_entry_fromReg2 <= SE_stall_entry_toReg2;
            -- Succesor 3
            SE_stall_entry_fromReg3 <= SE_stall_entry_toReg3;
            -- Succesor 4
            SE_stall_entry_fromReg4 <= SE_stall_entry_toReg4;
            -- Succesor 5
            SE_stall_entry_fromReg5 <= SE_stall_entry_toReg5;
            -- Succesor 6
            SE_stall_entry_fromReg6 <= SE_stall_entry_toReg6;
            -- Succesor 7
            SE_stall_entry_fromReg7 <= SE_stall_entry_toReg7;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_stall_entry_consumed0 <= (not (SE_redist0_stall_entry_o4_1_0_backStall) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg0;
    SE_stall_entry_consumed1 <= (not (i_acl_push_i1_memdep_phi261_push11_gemm_nn9w_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg1;
    SE_stall_entry_consumed2 <= (not (i_acl_push_i1_memdep_phi266_push12_gemm_nn9w_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg2;
    SE_stall_entry_consumed3 <= (not (i_acl_push_i1_memdep_phi269_push13_gemm_nn9w_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg3;
    SE_stall_entry_consumed4 <= (not (i_acl_push_i1_memdep_phi272_push14_gemm_nn9w_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg4;
    SE_stall_entry_consumed5 <= (not (i_acl_push_i1_memdep_phi274_push15_gemm_nn9w_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg5;
    SE_stall_entry_consumed6 <= (not (i_acl_push_i1_memdep_phi277_push16_gemm_nn9w_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg6;
    SE_stall_entry_consumed7 <= (not (i_acl_push_i1_memdep_phi_push10_gemm_nn9w_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg7;
    -- Consuming
    SE_stall_entry_StallValid <= SE_stall_entry_backStall and SE_stall_entry_wireValid;
    SE_stall_entry_toReg0 <= SE_stall_entry_StallValid and SE_stall_entry_consumed0;
    SE_stall_entry_toReg1 <= SE_stall_entry_StallValid and SE_stall_entry_consumed1;
    SE_stall_entry_toReg2 <= SE_stall_entry_StallValid and SE_stall_entry_consumed2;
    SE_stall_entry_toReg3 <= SE_stall_entry_StallValid and SE_stall_entry_consumed3;
    SE_stall_entry_toReg4 <= SE_stall_entry_StallValid and SE_stall_entry_consumed4;
    SE_stall_entry_toReg5 <= SE_stall_entry_StallValid and SE_stall_entry_consumed5;
    SE_stall_entry_toReg6 <= SE_stall_entry_StallValid and SE_stall_entry_consumed6;
    SE_stall_entry_toReg7 <= SE_stall_entry_StallValid and SE_stall_entry_consumed7;
    -- Backward Stall generation
    SE_stall_entry_or0 <= SE_stall_entry_consumed0;
    SE_stall_entry_or1 <= SE_stall_entry_consumed1 and SE_stall_entry_or0;
    SE_stall_entry_or2 <= SE_stall_entry_consumed2 and SE_stall_entry_or1;
    SE_stall_entry_or3 <= SE_stall_entry_consumed3 and SE_stall_entry_or2;
    SE_stall_entry_or4 <= SE_stall_entry_consumed4 and SE_stall_entry_or3;
    SE_stall_entry_or5 <= SE_stall_entry_consumed5 and SE_stall_entry_or4;
    SE_stall_entry_or6 <= SE_stall_entry_consumed6 and SE_stall_entry_or5;
    SE_stall_entry_wireStall <= not (SE_stall_entry_consumed7 and SE_stall_entry_or6);
    SE_stall_entry_backStall <= SE_stall_entry_wireStall;
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg0);
    SE_stall_entry_V1 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg1);
    SE_stall_entry_V2 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg2);
    SE_stall_entry_V3 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg3);
    SE_stall_entry_V4 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg4);
    SE_stall_entry_V5 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg5);
    SE_stall_entry_V6 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg6);
    SE_stall_entry_V7 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg7);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- SE_redist0_stall_entry_o4_1_0(STALLENABLE,87)
    -- Valid signal propagation
    SE_redist0_stall_entry_o4_1_0_V0 <= SE_redist0_stall_entry_o4_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_stall_entry_o4_1_0_s_tv_0 <= SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_backStall and SE_redist0_stall_entry_o4_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_stall_entry_o4_1_0_backEN <= not (SE_redist0_stall_entry_o4_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_o4_1_0_v_s_0 <= SE_redist0_stall_entry_o4_1_0_backEN and SE_stall_entry_V0;
    -- Backward Stall generation
    SE_redist0_stall_entry_o4_1_0_backStall <= not (SE_redist0_stall_entry_o4_1_0_v_s_0);
    SE_redist0_stall_entry_o4_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_o4_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_1_0_backEN = "0") THEN
                SE_redist0_stall_entry_o4_1_0_R_v_0 <= SE_redist0_stall_entry_o4_1_0_R_v_0 and SE_redist0_stall_entry_o4_1_0_s_tv_0;
            ELSE
                SE_redist0_stall_entry_o4_1_0_R_v_0 <= SE_redist0_stall_entry_o4_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_stall_entry(BITJOIN,62)
    bubble_join_stall_entry_q <= in_memdep_phi2687 & in_memdep_phi2635 & in_memdep_phi2583 & in_memdep_27621 & in_c1_exe345919 & in_c1_exe245817 & in_c1_exe145715 & in_c0_exe843612 & in_c0_exe743510;

    -- bubble_select_stall_entry(BITSELECT,63)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(0 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1 downto 1));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2 downto 2));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(3 downto 3));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(4 downto 4));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(5 downto 5));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(6 downto 6));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(7 downto 7));
    bubble_select_stall_entry_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(8 downto 8));

    -- i_acl_push_i1_memdep_phi261_push11_gemm_nn9w(BLACKBOX,39)@0
    -- in in_stall_in@20000000
    -- out out_data_out@1
    -- out out_feedback_out_11@20000000
    -- out out_feedback_valid_out_11@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thei_acl_push_i1_memdep_phi261_push11_gemm_nn9w : i_acl_push_i1_memdep_phi261_push11_gemm_nn9w1001
    PORT MAP (
        in_c0_exe843612 => bubble_select_stall_entry_c,
        in_data_in => bubble_select_stall_entry_i,
        in_feedback_stall_in_11 => in_feedback_stall_in_11,
        in_stall_in => SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_backStall,
        in_valid_in => SE_stall_entry_V1,
        out_feedback_out_11 => i_acl_push_i1_memdep_phi261_push11_gemm_nn9w_out_feedback_out_11,
        out_feedback_valid_out_11 => i_acl_push_i1_memdep_phi261_push11_gemm_nn9w_out_feedback_valid_out_11,
        out_stall_out => i_acl_push_i1_memdep_phi261_push11_gemm_nn9w_out_stall_out,
        out_valid_out => i_acl_push_i1_memdep_phi261_push11_gemm_nn9w_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_push_i1_memdep_phi266_push12_gemm_nn9w(BLACKBOX,40)@0
    -- in in_stall_in@20000000
    -- out out_data_out@1
    -- out out_feedback_out_12@20000000
    -- out out_feedback_valid_out_12@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thei_acl_push_i1_memdep_phi266_push12_gemm_nn9w : i_acl_push_i1_memdep_phi266_push12_gemm_nn9w999
    PORT MAP (
        in_c0_exe843612 => bubble_select_stall_entry_c,
        in_data_in => bubble_select_stall_entry_j,
        in_feedback_stall_in_12 => in_feedback_stall_in_12,
        in_stall_in => SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_backStall,
        in_valid_in => SE_stall_entry_V2,
        out_feedback_out_12 => i_acl_push_i1_memdep_phi266_push12_gemm_nn9w_out_feedback_out_12,
        out_feedback_valid_out_12 => i_acl_push_i1_memdep_phi266_push12_gemm_nn9w_out_feedback_valid_out_12,
        out_stall_out => i_acl_push_i1_memdep_phi266_push12_gemm_nn9w_out_stall_out,
        out_valid_out => i_acl_push_i1_memdep_phi266_push12_gemm_nn9w_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_push_i1_memdep_phi269_push13_gemm_nn9w(BLACKBOX,41)@0
    -- in in_stall_in@20000000
    -- out out_data_out@1
    -- out out_feedback_out_13@20000000
    -- out out_feedback_valid_out_13@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thei_acl_push_i1_memdep_phi269_push13_gemm_nn9w : i_acl_push_i1_memdep_phi269_push13_gemm_nn9w997
    PORT MAP (
        in_c0_exe843612 => bubble_select_stall_entry_c,
        in_data_in => bubble_select_stall_entry_d,
        in_feedback_stall_in_13 => in_feedback_stall_in_13,
        in_stall_in => SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_backStall,
        in_valid_in => SE_stall_entry_V3,
        out_feedback_out_13 => i_acl_push_i1_memdep_phi269_push13_gemm_nn9w_out_feedback_out_13,
        out_feedback_valid_out_13 => i_acl_push_i1_memdep_phi269_push13_gemm_nn9w_out_feedback_valid_out_13,
        out_stall_out => i_acl_push_i1_memdep_phi269_push13_gemm_nn9w_out_stall_out,
        out_valid_out => i_acl_push_i1_memdep_phi269_push13_gemm_nn9w_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_push_i1_memdep_phi272_push14_gemm_nn9w(BLACKBOX,42)@0
    -- in in_stall_in@20000000
    -- out out_data_out@1
    -- out out_feedback_out_14@20000000
    -- out out_feedback_valid_out_14@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thei_acl_push_i1_memdep_phi272_push14_gemm_nn9w : i_acl_push_i1_memdep_phi272_push14_gemm_nn9w995
    PORT MAP (
        in_c0_exe843612 => bubble_select_stall_entry_c,
        in_data_in => bubble_select_stall_entry_e,
        in_feedback_stall_in_14 => in_feedback_stall_in_14,
        in_stall_in => SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_backStall,
        in_valid_in => SE_stall_entry_V4,
        out_feedback_out_14 => i_acl_push_i1_memdep_phi272_push14_gemm_nn9w_out_feedback_out_14,
        out_feedback_valid_out_14 => i_acl_push_i1_memdep_phi272_push14_gemm_nn9w_out_feedback_valid_out_14,
        out_stall_out => i_acl_push_i1_memdep_phi272_push14_gemm_nn9w_out_stall_out,
        out_valid_out => i_acl_push_i1_memdep_phi272_push14_gemm_nn9w_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_push_i1_memdep_phi274_push15_gemm_nn9w(BLACKBOX,43)@0
    -- in in_stall_in@20000000
    -- out out_data_out@1
    -- out out_feedback_out_15@20000000
    -- out out_feedback_valid_out_15@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thei_acl_push_i1_memdep_phi274_push15_gemm_nn9w : i_acl_push_i1_memdep_phi274_push15_gemm_nn9w993
    PORT MAP (
        in_c0_exe843612 => bubble_select_stall_entry_c,
        in_data_in => bubble_select_stall_entry_f,
        in_feedback_stall_in_15 => in_feedback_stall_in_15,
        in_stall_in => SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_backStall,
        in_valid_in => SE_stall_entry_V5,
        out_feedback_out_15 => i_acl_push_i1_memdep_phi274_push15_gemm_nn9w_out_feedback_out_15,
        out_feedback_valid_out_15 => i_acl_push_i1_memdep_phi274_push15_gemm_nn9w_out_feedback_valid_out_15,
        out_stall_out => i_acl_push_i1_memdep_phi274_push15_gemm_nn9w_out_stall_out,
        out_valid_out => i_acl_push_i1_memdep_phi274_push15_gemm_nn9w_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_push_i1_memdep_phi277_push16_gemm_nn9w(BLACKBOX,44)@0
    -- in in_stall_in@20000000
    -- out out_data_out@1
    -- out out_feedback_out_16@20000000
    -- out out_feedback_valid_out_16@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thei_acl_push_i1_memdep_phi277_push16_gemm_nn9w : i_acl_push_i1_memdep_phi277_push16_gemm_nn9w991
    PORT MAP (
        in_c0_exe843612 => bubble_select_stall_entry_c,
        in_data_in => bubble_select_stall_entry_g,
        in_feedback_stall_in_16 => in_feedback_stall_in_16,
        in_stall_in => SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_backStall,
        in_valid_in => SE_stall_entry_V6,
        out_feedback_out_16 => i_acl_push_i1_memdep_phi277_push16_gemm_nn9w_out_feedback_out_16,
        out_feedback_valid_out_16 => i_acl_push_i1_memdep_phi277_push16_gemm_nn9w_out_feedback_valid_out_16,
        out_stall_out => i_acl_push_i1_memdep_phi277_push16_gemm_nn9w_out_stall_out,
        out_valid_out => i_acl_push_i1_memdep_phi277_push16_gemm_nn9w_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_push_i1_memdep_phi_push10_gemm_nn9w(BLACKBOX,45)@0
    -- in in_stall_in@20000000
    -- out out_data_out@1
    -- out out_feedback_out_10@20000000
    -- out out_feedback_valid_out_10@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thei_acl_push_i1_memdep_phi_push10_gemm_nn9w : i_acl_push_i1_memdep_phi_push10_gemm_nn9w1003
    PORT MAP (
        in_c0_exe843612 => bubble_select_stall_entry_c,
        in_data_in => bubble_select_stall_entry_h,
        in_feedback_stall_in_10 => in_feedback_stall_in_10,
        in_stall_in => SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_backStall,
        in_valid_in => SE_stall_entry_V7,
        out_feedback_out_10 => i_acl_push_i1_memdep_phi_push10_gemm_nn9w_out_feedback_out_10,
        out_feedback_valid_out_10 => i_acl_push_i1_memdep_phi_push10_gemm_nn9w_out_feedback_valid_out_10,
        out_stall_out => i_acl_push_i1_memdep_phi_push10_gemm_nn9w_out_stall_out,
        out_valid_out => i_acl_push_i1_memdep_phi_push10_gemm_nn9w_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w(STALLENABLE,84)
    -- Valid signal propagation
    SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_V0 <= SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_wireValid;
    -- Backward Stall generation
    SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_backStall <= in_stall_in or not (SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_and0 <= i_acl_push_i1_memdep_phi_push10_gemm_nn9w_out_valid_out;
    SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_and1 <= i_acl_push_i1_memdep_phi277_push16_gemm_nn9w_out_valid_out and SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_and0;
    SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_and2 <= i_acl_push_i1_memdep_phi274_push15_gemm_nn9w_out_valid_out and SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_and1;
    SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_and3 <= i_acl_push_i1_memdep_phi272_push14_gemm_nn9w_out_valid_out and SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_and2;
    SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_and4 <= i_acl_push_i1_memdep_phi269_push13_gemm_nn9w_out_valid_out and SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_and3;
    SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_and5 <= i_acl_push_i1_memdep_phi266_push12_gemm_nn9w_out_valid_out and SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_and4;
    SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_and6 <= i_acl_push_i1_memdep_phi261_push11_gemm_nn9w_out_valid_out and SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_and5;
    SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_wireValid <= SE_redist0_stall_entry_o4_1_0_V0 and SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_and6;

    -- redist0_stall_entry_o4_1_0(REG,53)
    redist0_stall_entry_o4_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_o4_1_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_1_0_backEN = "1") THEN
                redist0_stall_entry_o4_1_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_b);
            END IF;
        END IF;
    END PROCESS;

    -- dupName_0_sync_out_x(GPOUT,5)@1
    out_c0_exe743510 <= redist0_stall_entry_o4_1_0_q;
    out_valid_out <= SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nn9w_V0;

    -- feedback_out_10_sync(GPOUT,18)
    out_feedback_out_10 <= i_acl_push_i1_memdep_phi_push10_gemm_nn9w_out_feedback_out_10;

    -- feedback_out_11_sync(GPOUT,19)
    out_feedback_out_11 <= i_acl_push_i1_memdep_phi261_push11_gemm_nn9w_out_feedback_out_11;

    -- feedback_out_12_sync(GPOUT,20)
    out_feedback_out_12 <= i_acl_push_i1_memdep_phi266_push12_gemm_nn9w_out_feedback_out_12;

    -- feedback_out_13_sync(GPOUT,21)
    out_feedback_out_13 <= i_acl_push_i1_memdep_phi269_push13_gemm_nn9w_out_feedback_out_13;

    -- feedback_out_14_sync(GPOUT,22)
    out_feedback_out_14 <= i_acl_push_i1_memdep_phi272_push14_gemm_nn9w_out_feedback_out_14;

    -- feedback_out_15_sync(GPOUT,23)
    out_feedback_out_15 <= i_acl_push_i1_memdep_phi274_push15_gemm_nn9w_out_feedback_out_15;

    -- feedback_out_16_sync(GPOUT,24)
    out_feedback_out_16 <= i_acl_push_i1_memdep_phi277_push16_gemm_nn9w_out_feedback_out_16;

    -- feedback_valid_out_10_sync(GPOUT,32)
    out_feedback_valid_out_10 <= i_acl_push_i1_memdep_phi_push10_gemm_nn9w_out_feedback_valid_out_10;

    -- feedback_valid_out_11_sync(GPOUT,33)
    out_feedback_valid_out_11 <= i_acl_push_i1_memdep_phi261_push11_gemm_nn9w_out_feedback_valid_out_11;

    -- feedback_valid_out_12_sync(GPOUT,34)
    out_feedback_valid_out_12 <= i_acl_push_i1_memdep_phi266_push12_gemm_nn9w_out_feedback_valid_out_12;

    -- feedback_valid_out_13_sync(GPOUT,35)
    out_feedback_valid_out_13 <= i_acl_push_i1_memdep_phi269_push13_gemm_nn9w_out_feedback_valid_out_13;

    -- feedback_valid_out_14_sync(GPOUT,36)
    out_feedback_valid_out_14 <= i_acl_push_i1_memdep_phi272_push14_gemm_nn9w_out_feedback_valid_out_14;

    -- feedback_valid_out_15_sync(GPOUT,37)
    out_feedback_valid_out_15 <= i_acl_push_i1_memdep_phi274_push15_gemm_nn9w_out_feedback_valid_out_15;

    -- feedback_valid_out_16_sync(GPOUT,38)
    out_feedback_valid_out_16 <= i_acl_push_i1_memdep_phi277_push16_gemm_nn9w_out_feedback_valid_out_16;

    -- sync_out(GPOUT,51)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
