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

-- VHDL created from bb_gemm_nn9W_B3_stall_region
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

entity bb_gemm_nn9W_B3_stall_region is
    port (
        in_c0_exit3401_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit3401_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit3401_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit3401_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit3401_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit3401_5 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit3401_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit3401_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit3401_8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit3401_9 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit3401_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit3401_11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit3401_12 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit3401_13 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit3401_14 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit3401_15 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit2_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit2_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit2_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit2_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1349 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe14 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe15 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe2342 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi277_pop16 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_in_16 : in std_logic_vector(7 downto 0);  -- ufix8
        out_feedback_stall_out_16 : out std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_valid_in_16 : in std_logic_vector(0 downto 0);  -- ufix1
        in_ldc : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nn9W_B3_stall_region;

architecture normal of bb_gemm_nn9W_B3_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_sfc_c0_for_cond23_loopexit_loopexit_loopexit_gemm_nn9w_c0_enter345_gemm_nn9w is
        port (
            in_c0_eni1344_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni1344_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_ldc : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit348_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit348_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w148 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_16 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_16 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_16 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component acl_valid_fifo_counter is
        generic (
            DEPTH : INTEGER := 0;
            ASYNC_RESET : INTEGER := 1;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            valid_out : out std_logic;
            stall_out : out std_logic;
            full : out std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond23_loopexit_loopexit_loopexit_gemm_nn9w_c0_enter345_gemm_nn9w_aunroll_x_out_c0_exit348_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond23_loopexit_loopexit_loopexit_gemm_nn9w_c0_enter345_gemm_nn9w_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond23_loopexit_loopexit_loopexit_gemm_nn9w_c0_enter345_gemm_nn9w_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_out_feedback_stall_out_16 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_aunroll_o6_6_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_stall_entry_aunroll_o6_6_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_stall_entry_aunroll_o6_6_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_stall_entry_aunroll_o6_6_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_stall_entry_aunroll_o6_6_4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_stall_entry_aunroll_o6_6_5_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_stall_entry_aunroll_o10_6_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o10_6_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o10_6_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o10_6_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o10_6_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o10_6_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_aunroll_o11_6_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_aunroll_o11_6_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_aunroll_o11_6_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_aunroll_o11_6_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_aunroll_o11_6_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_aunroll_o11_6_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_aunroll_o15_6_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_stall_entry_aunroll_o15_6_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_stall_entry_aunroll_o15_6_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_stall_entry_aunroll_o15_6_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_stall_entry_aunroll_o15_6_4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_stall_entry_aunroll_o15_6_5_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_stall_entry_aunroll_o17_5_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_aunroll_o17_5_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_aunroll_o17_5_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_aunroll_o17_5_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_aunroll_o17_5_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o18_6_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o18_6_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o18_6_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o18_6_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o18_6_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o18_6_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_aunroll_o19_6_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_aunroll_o19_6_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_aunroll_o19_6_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_aunroll_o19_6_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_aunroll_o19_6_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_aunroll_o19_6_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_stall_entry_aunroll_o21_6_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_stall_entry_aunroll_o21_6_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_stall_entry_aunroll_o21_6_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_stall_entry_aunroll_o21_6_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_stall_entry_aunroll_o21_6_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_stall_entry_aunroll_o21_6_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_stall_entry_aunroll_o22_6_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_stall_entry_aunroll_o22_6_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_stall_entry_aunroll_o22_6_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_stall_entry_aunroll_o22_6_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_stall_entry_aunroll_o22_6_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_stall_entry_aunroll_o22_6_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_stall_entry_aunroll_o23_6_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_stall_entry_aunroll_o23_6_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_stall_entry_aunroll_o23_6_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_stall_entry_aunroll_o23_6_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_stall_entry_aunroll_o23_6_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_stall_entry_aunroll_o23_6_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_sfc_c0_for_cond23_loopexit_loopexit_loopexit_gemm_nn9w_c0_enter345_gemm_nn9w_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond23_loopexit_loopexit_loopexit_gemm_nn9w_c0_enter345_gemm_nn9w_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_stall_entry_aunroll_q : STD_LOGIC_VECTOR (103 downto 0);
    signal bubble_select_stall_entry_aunroll_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_e : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_i : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_j : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_k : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_l : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_4_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_4_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_4_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_4_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_4_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_4_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_4_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_4_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_5_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_5_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_5_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_5_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o6_6_5_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_aunroll_1_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_aunroll_1_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_aunroll_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_stall_entry_aunroll_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_1_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_1_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_1_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_1_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_1_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_1_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_stall_entry_aunroll_1_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_stall_entry_aunroll_1_reg_stall_out_bitsignaltemp : std_logic;
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_D2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_D3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_D4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_D5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_D6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_D7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_D8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_2_D9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_D2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_D3 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_D4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_D5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_D6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_D7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_D8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o6_6_4_D9 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- bubble_join_stall_entry_aunroll(BITJOIN,99)
    bubble_join_stall_entry_aunroll_q <= in_c1_exit2_3 & in_c1_exit2_2 & in_c1_exit2_1 & in_c0_exit3401_15 & in_c0_exit3401_14 & in_c0_exit3401_13 & in_c0_exit3401_11 & in_c0_exit3401_7 & in_c0_exit3401_6 & in_c0_exit3401_3 & in_c0_exit3401_2;

    -- bubble_select_stall_entry_aunroll(BITSELECT,100)
    bubble_select_stall_entry_aunroll_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(31 downto 0));
    bubble_select_stall_entry_aunroll_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(63 downto 32));
    bubble_select_stall_entry_aunroll_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(64 downto 64));
    bubble_select_stall_entry_aunroll_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(65 downto 65));
    bubble_select_stall_entry_aunroll_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(97 downto 66));
    bubble_select_stall_entry_aunroll_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(98 downto 98));
    bubble_select_stall_entry_aunroll_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(99 downto 99));
    bubble_select_stall_entry_aunroll_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(100 downto 100));
    bubble_select_stall_entry_aunroll_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(101 downto 101));
    bubble_select_stall_entry_aunroll_k <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(102 downto 102));
    bubble_select_stall_entry_aunroll_l <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(103 downto 103));

    -- redist9_stall_entry_aunroll_o23_6_0(REG,84)
    redist9_stall_entry_aunroll_o23_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_stall_entry_aunroll_o23_6_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_0_backEN = "1") THEN
                redist9_stall_entry_aunroll_o23_6_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_l);
            END IF;
        END IF;
    END PROCESS;

    -- redist9_stall_entry_aunroll_o23_6_1(REG,85)
    redist9_stall_entry_aunroll_o23_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_stall_entry_aunroll_o23_6_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_1_backEN = "1") THEN
                redist9_stall_entry_aunroll_o23_6_1_q <= STD_LOGIC_VECTOR(redist9_stall_entry_aunroll_o23_6_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_stall_entry_aunroll_o22_6_0(REG,78)
    redist8_stall_entry_aunroll_o22_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_stall_entry_aunroll_o22_6_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_0_backEN = "1") THEN
                redist8_stall_entry_aunroll_o22_6_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_k);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_stall_entry_aunroll_o22_6_1(REG,79)
    redist8_stall_entry_aunroll_o22_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_stall_entry_aunroll_o22_6_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_1_backEN = "1") THEN
                redist8_stall_entry_aunroll_o22_6_1_q <= STD_LOGIC_VECTOR(redist8_stall_entry_aunroll_o22_6_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_stall_entry_aunroll_o21_6_0(REG,72)
    redist7_stall_entry_aunroll_o21_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_stall_entry_aunroll_o21_6_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_0_backEN = "1") THEN
                redist7_stall_entry_aunroll_o21_6_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_j);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_stall_entry_aunroll_o21_6_1(REG,73)
    redist7_stall_entry_aunroll_o21_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_stall_entry_aunroll_o21_6_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_1_backEN = "1") THEN
                redist7_stall_entry_aunroll_o21_6_1_q <= STD_LOGIC_VECTOR(redist7_stall_entry_aunroll_o21_6_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_stall_entry_aunroll_o19_6_0(REG,66)
    redist6_stall_entry_aunroll_o19_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_aunroll_o19_6_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_0_backEN = "1") THEN
                redist6_stall_entry_aunroll_o19_6_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_i);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_stall_entry_aunroll_o19_6_1(REG,67)
    redist6_stall_entry_aunroll_o19_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_aunroll_o19_6_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_1_backEN = "1") THEN
                redist6_stall_entry_aunroll_o19_6_1_q <= STD_LOGIC_VECTOR(redist6_stall_entry_aunroll_o19_6_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_stall_entry_aunroll_o18_6_0(REG,60)
    redist5_stall_entry_aunroll_o18_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_stall_entry_aunroll_o18_6_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_0_backEN = "1") THEN
                redist5_stall_entry_aunroll_o18_6_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_h);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_stall_entry_aunroll_o18_6_1(REG,61)
    redist5_stall_entry_aunroll_o18_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_stall_entry_aunroll_o18_6_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_1_backEN = "1") THEN
                redist5_stall_entry_aunroll_o18_6_1_q <= STD_LOGIC_VECTOR(redist5_stall_entry_aunroll_o18_6_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_stall_entry_aunroll_o17_5_0(REG,55)
    redist4_stall_entry_aunroll_o17_5_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_aunroll_o17_5_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_0_backEN = "1") THEN
                redist4_stall_entry_aunroll_o17_5_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_g);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_stall_entry_aunroll_o17_5_1(REG,56)
    redist4_stall_entry_aunroll_o17_5_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_aunroll_o17_5_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_1_backEN = "1") THEN
                redist4_stall_entry_aunroll_o17_5_1_q <= STD_LOGIC_VECTOR(redist4_stall_entry_aunroll_o17_5_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_aunroll_o15_6_0(REG,49)
    redist3_stall_entry_aunroll_o15_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_aunroll_o15_6_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_0_backEN = "1") THEN
                redist3_stall_entry_aunroll_o15_6_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_f);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_aunroll_o15_6_1(REG,50)
    redist3_stall_entry_aunroll_o15_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_aunroll_o15_6_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_1_backEN = "1") THEN
                redist3_stall_entry_aunroll_o15_6_1_q <= STD_LOGIC_VECTOR(redist3_stall_entry_aunroll_o15_6_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o11_6_0(REG,43)
    redist2_stall_entry_aunroll_o11_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o11_6_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_0_backEN = "1") THEN
                redist2_stall_entry_aunroll_o11_6_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_e);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o11_6_1(REG,44)
    redist2_stall_entry_aunroll_o11_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o11_6_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_1_backEN = "1") THEN
                redist2_stall_entry_aunroll_o11_6_1_q <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o11_6_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o10_6_0(REG,37)
    redist1_stall_entry_aunroll_o10_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o10_6_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_0_backEN = "1") THEN
                redist1_stall_entry_aunroll_o10_6_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_d);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o10_6_1(REG,38)
    redist1_stall_entry_aunroll_o10_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o10_6_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_1_backEN = "1") THEN
                redist1_stall_entry_aunroll_o10_6_1_q <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o10_6_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_stall_entry_aunroll_o6_6_0(REG,31)
    redist0_stall_entry_aunroll_o6_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_aunroll_o6_6_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_0_backEN = "1") THEN
                redist0_stall_entry_aunroll_o6_6_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_stall_entry_aunroll_o6_6_1(REG,32)
    redist0_stall_entry_aunroll_o6_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_aunroll_o6_6_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_1_backEN = "1") THEN
                redist0_stall_entry_aunroll_o6_6_1_q <= STD_LOGIC_VECTOR(redist0_stall_entry_aunroll_o6_6_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist0_stall_entry_aunroll_o6_6_3(STALLENABLE,112)
    -- Valid signal propagation
    SE_redist0_stall_entry_aunroll_o6_6_3_V0 <= SE_redist0_stall_entry_aunroll_o6_6_3_R_v_0;
    -- Stall signal propagation
    SE_redist0_stall_entry_aunroll_o6_6_3_s_tv_0 <= SR_SE_redist0_stall_entry_aunroll_o6_6_4_backStall and SE_redist0_stall_entry_aunroll_o6_6_3_R_v_0;
    -- Backward Enable generation
    SE_redist0_stall_entry_aunroll_o6_6_3_backEN <= not (SE_redist0_stall_entry_aunroll_o6_6_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_aunroll_o6_6_3_v_s_0 <= SE_redist0_stall_entry_aunroll_o6_6_3_backEN and SE_redist0_stall_entry_aunroll_o6_6_2_V0;
    -- Backward Stall generation
    SE_redist0_stall_entry_aunroll_o6_6_3_backStall <= not (SE_redist0_stall_entry_aunroll_o6_6_3_v_s_0);
    SE_redist0_stall_entry_aunroll_o6_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_aunroll_o6_6_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_3_backEN = "0") THEN
                SE_redist0_stall_entry_aunroll_o6_6_3_R_v_0 <= SE_redist0_stall_entry_aunroll_o6_6_3_R_v_0 and SE_redist0_stall_entry_aunroll_o6_6_3_s_tv_0;
            ELSE
                SE_redist0_stall_entry_aunroll_o6_6_3_R_v_0 <= SE_redist0_stall_entry_aunroll_o6_6_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_stall_entry_aunroll_o6_6_2(STALLENABLE,111)
    -- Valid signal propagation
    SE_redist0_stall_entry_aunroll_o6_6_2_V0 <= SE_redist0_stall_entry_aunroll_o6_6_2_R_v_0;
    -- Stall signal propagation
    SE_redist0_stall_entry_aunroll_o6_6_2_s_tv_0 <= SE_redist0_stall_entry_aunroll_o6_6_3_backStall and SE_redist0_stall_entry_aunroll_o6_6_2_R_v_0;
    -- Backward Enable generation
    SE_redist0_stall_entry_aunroll_o6_6_2_backEN <= not (SE_redist0_stall_entry_aunroll_o6_6_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_aunroll_o6_6_2_v_s_0 <= SE_redist0_stall_entry_aunroll_o6_6_2_backEN and SR_SE_redist0_stall_entry_aunroll_o6_6_2_V;
    -- Backward Stall generation
    SE_redist0_stall_entry_aunroll_o6_6_2_backStall <= not (SE_redist0_stall_entry_aunroll_o6_6_2_backEN);
    SE_redist0_stall_entry_aunroll_o6_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_aunroll_o6_6_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_2_backEN = "0") THEN
                SE_redist0_stall_entry_aunroll_o6_6_2_R_v_0 <= SE_redist0_stall_entry_aunroll_o6_6_2_R_v_0 and SE_redist0_stall_entry_aunroll_o6_6_2_s_tv_0;
            ELSE
                SE_redist0_stall_entry_aunroll_o6_6_2_R_v_0 <= SE_redist0_stall_entry_aunroll_o6_6_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist0_stall_entry_aunroll_o6_6_2(STALLREG,189)
    SR_SE_redist0_stall_entry_aunroll_o6_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_valid <= (others => '0');
            SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data0 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data1 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data2 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data3 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data4 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data5 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data6 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data7 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data8 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data9 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_valid <= SE_redist0_stall_entry_aunroll_o6_6_2_backStall and (SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_valid or SR_SE_redist0_stall_entry_aunroll_o6_6_2_i_valid);

            IF (SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data0 <= STD_LOGIC_VECTOR(redist0_stall_entry_aunroll_o6_6_1_q);
                SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data1 <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o10_6_1_q);
                SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data2 <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o11_6_1_q);
                SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data3 <= STD_LOGIC_VECTOR(redist3_stall_entry_aunroll_o15_6_1_q);
                SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data4 <= STD_LOGIC_VECTOR(redist4_stall_entry_aunroll_o17_5_1_q);
                SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data5 <= STD_LOGIC_VECTOR(redist5_stall_entry_aunroll_o18_6_1_q);
                SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data6 <= STD_LOGIC_VECTOR(redist6_stall_entry_aunroll_o19_6_1_q);
                SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data7 <= STD_LOGIC_VECTOR(redist7_stall_entry_aunroll_o21_6_1_q);
                SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data8 <= STD_LOGIC_VECTOR(redist8_stall_entry_aunroll_o22_6_1_q);
                SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data9 <= STD_LOGIC_VECTOR(redist9_stall_entry_aunroll_o23_6_1_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist0_stall_entry_aunroll_o6_6_2_i_valid <= SE_redist0_stall_entry_aunroll_o6_6_1_V0;
    -- Stall signal propagation
    SR_SE_redist0_stall_entry_aunroll_o6_6_2_backStall <= SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_valid or not (SR_SE_redist0_stall_entry_aunroll_o6_6_2_i_valid);

    -- Valid
    SR_SE_redist0_stall_entry_aunroll_o6_6_2_V <= SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_valid WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_valid = "1" ELSE SR_SE_redist0_stall_entry_aunroll_o6_6_2_i_valid;

    -- Data0
    SR_SE_redist0_stall_entry_aunroll_o6_6_2_D0 <= SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data0 WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_valid = "1" ELSE redist0_stall_entry_aunroll_o6_6_1_q;
    -- Data1
    SR_SE_redist0_stall_entry_aunroll_o6_6_2_D1 <= SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data1 WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_valid = "1" ELSE redist1_stall_entry_aunroll_o10_6_1_q;
    -- Data2
    SR_SE_redist0_stall_entry_aunroll_o6_6_2_D2 <= SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data2 WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_valid = "1" ELSE redist2_stall_entry_aunroll_o11_6_1_q;
    -- Data3
    SR_SE_redist0_stall_entry_aunroll_o6_6_2_D3 <= SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data3 WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_valid = "1" ELSE redist3_stall_entry_aunroll_o15_6_1_q;
    -- Data4
    SR_SE_redist0_stall_entry_aunroll_o6_6_2_D4 <= SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data4 WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_valid = "1" ELSE redist4_stall_entry_aunroll_o17_5_1_q;
    -- Data5
    SR_SE_redist0_stall_entry_aunroll_o6_6_2_D5 <= SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data5 WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_valid = "1" ELSE redist5_stall_entry_aunroll_o18_6_1_q;
    -- Data6
    SR_SE_redist0_stall_entry_aunroll_o6_6_2_D6 <= SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data6 WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_valid = "1" ELSE redist6_stall_entry_aunroll_o19_6_1_q;
    -- Data7
    SR_SE_redist0_stall_entry_aunroll_o6_6_2_D7 <= SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data7 WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_valid = "1" ELSE redist7_stall_entry_aunroll_o21_6_1_q;
    -- Data8
    SR_SE_redist0_stall_entry_aunroll_o6_6_2_D8 <= SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data8 WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_valid = "1" ELSE redist8_stall_entry_aunroll_o22_6_1_q;
    -- Data9
    SR_SE_redist0_stall_entry_aunroll_o6_6_2_D9 <= SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_data9 WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_2_r_valid = "1" ELSE redist9_stall_entry_aunroll_o23_6_1_q;

    -- SE_redist0_stall_entry_aunroll_o6_6_1(STALLENABLE,110)
    -- Valid signal propagation
    SE_redist0_stall_entry_aunroll_o6_6_1_V0 <= SE_redist0_stall_entry_aunroll_o6_6_1_R_v_0;
    -- Stall signal propagation
    SE_redist0_stall_entry_aunroll_o6_6_1_s_tv_0 <= SR_SE_redist0_stall_entry_aunroll_o6_6_2_backStall and SE_redist0_stall_entry_aunroll_o6_6_1_R_v_0;
    -- Backward Enable generation
    SE_redist0_stall_entry_aunroll_o6_6_1_backEN <= not (SE_redist0_stall_entry_aunroll_o6_6_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_aunroll_o6_6_1_v_s_0 <= SE_redist0_stall_entry_aunroll_o6_6_1_backEN and SE_redist0_stall_entry_aunroll_o6_6_0_V0;
    -- Backward Stall generation
    SE_redist0_stall_entry_aunroll_o6_6_1_backStall <= not (SE_redist0_stall_entry_aunroll_o6_6_1_v_s_0);
    SE_redist0_stall_entry_aunroll_o6_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_aunroll_o6_6_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_1_backEN = "0") THEN
                SE_redist0_stall_entry_aunroll_o6_6_1_R_v_0 <= SE_redist0_stall_entry_aunroll_o6_6_1_R_v_0 and SE_redist0_stall_entry_aunroll_o6_6_1_s_tv_0;
            ELSE
                SE_redist0_stall_entry_aunroll_o6_6_1_R_v_0 <= SE_redist0_stall_entry_aunroll_o6_6_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_stall_entry_aunroll_o6_6_0(STALLENABLE,109)
    -- Valid signal propagation
    SE_redist0_stall_entry_aunroll_o6_6_0_V0 <= SE_redist0_stall_entry_aunroll_o6_6_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_stall_entry_aunroll_o6_6_0_s_tv_0 <= SE_redist0_stall_entry_aunroll_o6_6_1_backStall and SE_redist0_stall_entry_aunroll_o6_6_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_stall_entry_aunroll_o6_6_0_backEN <= not (SE_redist0_stall_entry_aunroll_o6_6_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_aunroll_o6_6_0_v_s_0 <= SE_redist0_stall_entry_aunroll_o6_6_0_backEN and SE_stall_entry_aunroll_V1;
    -- Backward Stall generation
    SE_redist0_stall_entry_aunroll_o6_6_0_backStall <= not (SE_redist0_stall_entry_aunroll_o6_6_0_v_s_0);
    SE_redist0_stall_entry_aunroll_o6_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_aunroll_o6_6_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_0_backEN = "0") THEN
                SE_redist0_stall_entry_aunroll_o6_6_0_R_v_0 <= SE_redist0_stall_entry_aunroll_o6_6_0_R_v_0 and SE_redist0_stall_entry_aunroll_o6_6_0_s_tv_0;
            ELSE
                SE_redist0_stall_entry_aunroll_o6_6_0_R_v_0 <= SE_redist0_stall_entry_aunroll_o6_6_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_stall_entry_aunroll(STALLENABLE,107)
    SE_stall_entry_aunroll_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_stall_entry_aunroll_fromReg0 <= (others => '0');
            SE_stall_entry_aunroll_fromReg1 <= (others => '0');
            SE_stall_entry_aunroll_fromReg2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_stall_entry_aunroll_fromReg0 <= SE_stall_entry_aunroll_toReg0;
            -- Succesor 1
            SE_stall_entry_aunroll_fromReg1 <= SE_stall_entry_aunroll_toReg1;
            -- Succesor 2
            SE_stall_entry_aunroll_fromReg2 <= SE_stall_entry_aunroll_toReg2;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_stall_entry_aunroll_consumed0 <= (not (bubble_out_stall_entry_aunroll_1_reg_stall_out) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg0;
    SE_stall_entry_aunroll_consumed1 <= (not (SE_redist0_stall_entry_aunroll_o6_6_0_backStall) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg1;
    SE_stall_entry_aunroll_consumed2 <= (not (i_sfc_c0_for_cond23_loopexit_loopexit_loopexit_gemm_nn9w_c0_enter345_gemm_nn9w_aunroll_x_out_o_stall) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg2;
    -- Consuming
    SE_stall_entry_aunroll_StallValid <= SE_stall_entry_aunroll_backStall and SE_stall_entry_aunroll_wireValid;
    SE_stall_entry_aunroll_toReg0 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed0;
    SE_stall_entry_aunroll_toReg1 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed1;
    SE_stall_entry_aunroll_toReg2 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed2;
    -- Backward Stall generation
    SE_stall_entry_aunroll_or0 <= SE_stall_entry_aunroll_consumed0;
    SE_stall_entry_aunroll_or1 <= SE_stall_entry_aunroll_consumed1 and SE_stall_entry_aunroll_or0;
    SE_stall_entry_aunroll_wireStall <= not (SE_stall_entry_aunroll_consumed2 and SE_stall_entry_aunroll_or1);
    SE_stall_entry_aunroll_backStall <= SE_stall_entry_aunroll_wireStall;
    -- Valid signal propagation
    SE_stall_entry_aunroll_V0 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg0);
    SE_stall_entry_aunroll_V1 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg1);
    SE_stall_entry_aunroll_V2 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg2);
    -- Computing multiple Valid(s)
    SE_stall_entry_aunroll_wireValid <= in_valid_in;

    -- bubble_out_stall_entry_aunroll_1_reg(STALLFIFO,188)
    bubble_out_stall_entry_aunroll_1_reg_valid_in <= SE_stall_entry_aunroll_V0;
    bubble_out_stall_entry_aunroll_1_reg_stall_in <= SE_out_bubble_out_stall_entry_aunroll_1_backStall;
    bubble_out_stall_entry_aunroll_1_reg_valid_in_bitsignaltemp <= bubble_out_stall_entry_aunroll_1_reg_valid_in(0);
    bubble_out_stall_entry_aunroll_1_reg_stall_in_bitsignaltemp <= bubble_out_stall_entry_aunroll_1_reg_stall_in(0);
    bubble_out_stall_entry_aunroll_1_reg_valid_out(0) <= bubble_out_stall_entry_aunroll_1_reg_valid_out_bitsignaltemp;
    bubble_out_stall_entry_aunroll_1_reg_stall_out(0) <= bubble_out_stall_entry_aunroll_1_reg_stall_out_bitsignaltemp;
    thebubble_out_stall_entry_aunroll_1_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 6,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_stall_entry_aunroll_1_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_stall_entry_aunroll_1_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_stall_entry_aunroll_1_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_stall_entry_aunroll_1_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_stall_entry_aunroll_1(STALLENABLE,185)
    -- Valid signal propagation
    SE_out_bubble_out_stall_entry_aunroll_1_V0 <= SE_out_bubble_out_stall_entry_aunroll_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_stall_entry_aunroll_1_backStall <= i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_out_stall_out or not (SE_out_bubble_out_stall_entry_aunroll_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_stall_entry_aunroll_1_and0 <= bubble_out_stall_entry_aunroll_1_reg_valid_out;
    SE_out_bubble_out_stall_entry_aunroll_1_wireValid <= SE_redist0_stall_entry_aunroll_o6_6_4_V1 and SE_out_bubble_out_stall_entry_aunroll_1_and0;

    -- redist9_stall_entry_aunroll_o23_6_2(REG,86)
    redist9_stall_entry_aunroll_o23_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_stall_entry_aunroll_o23_6_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_2_backEN = "1") THEN
                redist9_stall_entry_aunroll_o23_6_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o6_6_2_D9);
            END IF;
        END IF;
    END PROCESS;

    -- redist9_stall_entry_aunroll_o23_6_3(REG,87)
    redist9_stall_entry_aunroll_o23_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_stall_entry_aunroll_o23_6_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_3_backEN = "1") THEN
                redist9_stall_entry_aunroll_o23_6_3_q <= STD_LOGIC_VECTOR(redist9_stall_entry_aunroll_o23_6_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_stall_entry_aunroll_o22_6_2(REG,80)
    redist8_stall_entry_aunroll_o22_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_stall_entry_aunroll_o22_6_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_2_backEN = "1") THEN
                redist8_stall_entry_aunroll_o22_6_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o6_6_2_D8);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_stall_entry_aunroll_o22_6_3(REG,81)
    redist8_stall_entry_aunroll_o22_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_stall_entry_aunroll_o22_6_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_3_backEN = "1") THEN
                redist8_stall_entry_aunroll_o22_6_3_q <= STD_LOGIC_VECTOR(redist8_stall_entry_aunroll_o22_6_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_stall_entry_aunroll_o21_6_2(REG,74)
    redist7_stall_entry_aunroll_o21_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_stall_entry_aunroll_o21_6_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_2_backEN = "1") THEN
                redist7_stall_entry_aunroll_o21_6_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o6_6_2_D7);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_stall_entry_aunroll_o21_6_3(REG,75)
    redist7_stall_entry_aunroll_o21_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_stall_entry_aunroll_o21_6_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_3_backEN = "1") THEN
                redist7_stall_entry_aunroll_o21_6_3_q <= STD_LOGIC_VECTOR(redist7_stall_entry_aunroll_o21_6_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_stall_entry_aunroll_o19_6_2(REG,68)
    redist6_stall_entry_aunroll_o19_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_aunroll_o19_6_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_2_backEN = "1") THEN
                redist6_stall_entry_aunroll_o19_6_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o6_6_2_D6);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_stall_entry_aunroll_o19_6_3(REG,69)
    redist6_stall_entry_aunroll_o19_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_aunroll_o19_6_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_3_backEN = "1") THEN
                redist6_stall_entry_aunroll_o19_6_3_q <= STD_LOGIC_VECTOR(redist6_stall_entry_aunroll_o19_6_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_stall_entry_aunroll_o18_6_2(REG,62)
    redist5_stall_entry_aunroll_o18_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_stall_entry_aunroll_o18_6_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_2_backEN = "1") THEN
                redist5_stall_entry_aunroll_o18_6_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o6_6_2_D5);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_stall_entry_aunroll_o18_6_3(REG,63)
    redist5_stall_entry_aunroll_o18_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_stall_entry_aunroll_o18_6_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_3_backEN = "1") THEN
                redist5_stall_entry_aunroll_o18_6_3_q <= STD_LOGIC_VECTOR(redist5_stall_entry_aunroll_o18_6_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_stall_entry_aunroll_o17_5_2(REG,57)
    redist4_stall_entry_aunroll_o17_5_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_aunroll_o17_5_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_2_backEN = "1") THEN
                redist4_stall_entry_aunroll_o17_5_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o6_6_2_D4);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_stall_entry_aunroll_o17_5_3(REG,58)
    redist4_stall_entry_aunroll_o17_5_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_aunroll_o17_5_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_3_backEN = "1") THEN
                redist4_stall_entry_aunroll_o17_5_3_q <= STD_LOGIC_VECTOR(redist4_stall_entry_aunroll_o17_5_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_aunroll_o15_6_2(REG,51)
    redist3_stall_entry_aunroll_o15_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_aunroll_o15_6_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_2_backEN = "1") THEN
                redist3_stall_entry_aunroll_o15_6_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o6_6_2_D3);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_aunroll_o15_6_3(REG,52)
    redist3_stall_entry_aunroll_o15_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_aunroll_o15_6_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_3_backEN = "1") THEN
                redist3_stall_entry_aunroll_o15_6_3_q <= STD_LOGIC_VECTOR(redist3_stall_entry_aunroll_o15_6_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o11_6_2(REG,45)
    redist2_stall_entry_aunroll_o11_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o11_6_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_2_backEN = "1") THEN
                redist2_stall_entry_aunroll_o11_6_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o6_6_2_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o11_6_3(REG,46)
    redist2_stall_entry_aunroll_o11_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o11_6_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_3_backEN = "1") THEN
                redist2_stall_entry_aunroll_o11_6_3_q <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o11_6_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o10_6_2(REG,39)
    redist1_stall_entry_aunroll_o10_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o10_6_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_2_backEN = "1") THEN
                redist1_stall_entry_aunroll_o10_6_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o6_6_2_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o10_6_3(REG,40)
    redist1_stall_entry_aunroll_o10_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o10_6_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_3_backEN = "1") THEN
                redist1_stall_entry_aunroll_o10_6_3_q <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o10_6_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_stall_entry_aunroll_o6_6_2(REG,33)
    redist0_stall_entry_aunroll_o6_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_aunroll_o6_6_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_2_backEN = "1") THEN
                redist0_stall_entry_aunroll_o6_6_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o6_6_2_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_stall_entry_aunroll_o6_6_3(REG,34)
    redist0_stall_entry_aunroll_o6_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_aunroll_o6_6_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_3_backEN = "1") THEN
                redist0_stall_entry_aunroll_o6_6_3_q <= STD_LOGIC_VECTOR(redist0_stall_entry_aunroll_o6_6_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- SR_SE_redist0_stall_entry_aunroll_o6_6_4(STALLREG,190)
    SR_SE_redist0_stall_entry_aunroll_o6_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_valid <= (others => '0');
            SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data0 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data1 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data2 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data3 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data4 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data5 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data6 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data7 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data8 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data9 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_valid <= SE_redist0_stall_entry_aunroll_o6_6_4_backStall and (SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_valid or SR_SE_redist0_stall_entry_aunroll_o6_6_4_i_valid);

            IF (SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data0 <= STD_LOGIC_VECTOR(redist0_stall_entry_aunroll_o6_6_3_q);
                SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data1 <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o10_6_3_q);
                SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data2 <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o11_6_3_q);
                SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data3 <= STD_LOGIC_VECTOR(redist3_stall_entry_aunroll_o15_6_3_q);
                SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data4 <= STD_LOGIC_VECTOR(redist4_stall_entry_aunroll_o17_5_3_q);
                SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data5 <= STD_LOGIC_VECTOR(redist5_stall_entry_aunroll_o18_6_3_q);
                SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data6 <= STD_LOGIC_VECTOR(redist6_stall_entry_aunroll_o19_6_3_q);
                SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data7 <= STD_LOGIC_VECTOR(redist7_stall_entry_aunroll_o21_6_3_q);
                SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data8 <= STD_LOGIC_VECTOR(redist8_stall_entry_aunroll_o22_6_3_q);
                SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data9 <= STD_LOGIC_VECTOR(redist9_stall_entry_aunroll_o23_6_3_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist0_stall_entry_aunroll_o6_6_4_i_valid <= SE_redist0_stall_entry_aunroll_o6_6_3_V0;
    -- Stall signal propagation
    SR_SE_redist0_stall_entry_aunroll_o6_6_4_backStall <= SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_valid or not (SR_SE_redist0_stall_entry_aunroll_o6_6_4_i_valid);

    -- Valid
    SR_SE_redist0_stall_entry_aunroll_o6_6_4_V <= SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_valid WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_valid = "1" ELSE SR_SE_redist0_stall_entry_aunroll_o6_6_4_i_valid;

    -- Data0
    SR_SE_redist0_stall_entry_aunroll_o6_6_4_D0 <= SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data0 WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_valid = "1" ELSE redist0_stall_entry_aunroll_o6_6_3_q;
    -- Data1
    SR_SE_redist0_stall_entry_aunroll_o6_6_4_D1 <= SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data1 WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_valid = "1" ELSE redist1_stall_entry_aunroll_o10_6_3_q;
    -- Data2
    SR_SE_redist0_stall_entry_aunroll_o6_6_4_D2 <= SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data2 WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_valid = "1" ELSE redist2_stall_entry_aunroll_o11_6_3_q;
    -- Data3
    SR_SE_redist0_stall_entry_aunroll_o6_6_4_D3 <= SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data3 WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_valid = "1" ELSE redist3_stall_entry_aunroll_o15_6_3_q;
    -- Data4
    SR_SE_redist0_stall_entry_aunroll_o6_6_4_D4 <= SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data4 WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_valid = "1" ELSE redist4_stall_entry_aunroll_o17_5_3_q;
    -- Data5
    SR_SE_redist0_stall_entry_aunroll_o6_6_4_D5 <= SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data5 WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_valid = "1" ELSE redist5_stall_entry_aunroll_o18_6_3_q;
    -- Data6
    SR_SE_redist0_stall_entry_aunroll_o6_6_4_D6 <= SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data6 WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_valid = "1" ELSE redist6_stall_entry_aunroll_o19_6_3_q;
    -- Data7
    SR_SE_redist0_stall_entry_aunroll_o6_6_4_D7 <= SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data7 WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_valid = "1" ELSE redist7_stall_entry_aunroll_o21_6_3_q;
    -- Data8
    SR_SE_redist0_stall_entry_aunroll_o6_6_4_D8 <= SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data8 WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_valid = "1" ELSE redist8_stall_entry_aunroll_o22_6_3_q;
    -- Data9
    SR_SE_redist0_stall_entry_aunroll_o6_6_4_D9 <= SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_data9 WHEN SR_SE_redist0_stall_entry_aunroll_o6_6_4_r_valid = "1" ELSE redist9_stall_entry_aunroll_o23_6_3_q;

    -- SE_redist0_stall_entry_aunroll_o6_6_4(STALLENABLE,113)
    -- Valid signal propagation
    SE_redist0_stall_entry_aunroll_o6_6_4_V0 <= SE_redist0_stall_entry_aunroll_o6_6_4_R_v_0;
    SE_redist0_stall_entry_aunroll_o6_6_4_V1 <= SE_redist0_stall_entry_aunroll_o6_6_4_R_v_1;
    -- Stall signal propagation
    SE_redist0_stall_entry_aunroll_o6_6_4_s_tv_0 <= SE_redist0_stall_entry_aunroll_o6_6_5_backStall and SE_redist0_stall_entry_aunroll_o6_6_4_R_v_0;
    SE_redist0_stall_entry_aunroll_o6_6_4_s_tv_1 <= SE_out_bubble_out_stall_entry_aunroll_1_backStall and SE_redist0_stall_entry_aunroll_o6_6_4_R_v_1;
    -- Backward Enable generation
    SE_redist0_stall_entry_aunroll_o6_6_4_or0 <= SE_redist0_stall_entry_aunroll_o6_6_4_s_tv_0;
    SE_redist0_stall_entry_aunroll_o6_6_4_backEN <= not (SE_redist0_stall_entry_aunroll_o6_6_4_s_tv_1 or SE_redist0_stall_entry_aunroll_o6_6_4_or0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_aunroll_o6_6_4_v_s_0 <= SE_redist0_stall_entry_aunroll_o6_6_4_backEN and SR_SE_redist0_stall_entry_aunroll_o6_6_4_V;
    -- Backward Stall generation
    SE_redist0_stall_entry_aunroll_o6_6_4_backStall <= not (SE_redist0_stall_entry_aunroll_o6_6_4_backEN);
    SE_redist0_stall_entry_aunroll_o6_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_aunroll_o6_6_4_R_v_0 <= (others => '0');
            SE_redist0_stall_entry_aunroll_o6_6_4_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_4_backEN = "0") THEN
                SE_redist0_stall_entry_aunroll_o6_6_4_R_v_0 <= SE_redist0_stall_entry_aunroll_o6_6_4_R_v_0 and SE_redist0_stall_entry_aunroll_o6_6_4_s_tv_0;
            ELSE
                SE_redist0_stall_entry_aunroll_o6_6_4_R_v_0 <= SE_redist0_stall_entry_aunroll_o6_6_4_v_s_0;
            END IF;

            IF (SE_redist0_stall_entry_aunroll_o6_6_4_backEN = "0") THEN
                SE_redist0_stall_entry_aunroll_o6_6_4_R_v_1 <= SE_redist0_stall_entry_aunroll_o6_6_4_R_v_1 and SE_redist0_stall_entry_aunroll_o6_6_4_s_tv_1;
            ELSE
                SE_redist0_stall_entry_aunroll_o6_6_4_R_v_1 <= SE_redist0_stall_entry_aunroll_o6_6_4_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_stall_entry_aunroll_o6_6_5(STALLENABLE,114)
    -- Valid signal propagation
    SE_redist0_stall_entry_aunroll_o6_6_5_V0 <= SE_redist0_stall_entry_aunroll_o6_6_5_R_v_0;
    -- Stall signal propagation
    SE_redist0_stall_entry_aunroll_o6_6_5_s_tv_0 <= SE_out_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_backStall and SE_redist0_stall_entry_aunroll_o6_6_5_R_v_0;
    -- Backward Enable generation
    SE_redist0_stall_entry_aunroll_o6_6_5_backEN <= not (SE_redist0_stall_entry_aunroll_o6_6_5_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_aunroll_o6_6_5_v_s_0 <= SE_redist0_stall_entry_aunroll_o6_6_5_backEN and SE_redist0_stall_entry_aunroll_o6_6_4_V0;
    -- Backward Stall generation
    SE_redist0_stall_entry_aunroll_o6_6_5_backStall <= not (SE_redist0_stall_entry_aunroll_o6_6_5_v_s_0);
    SE_redist0_stall_entry_aunroll_o6_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_aunroll_o6_6_5_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_5_backEN = "0") THEN
                SE_redist0_stall_entry_aunroll_o6_6_5_R_v_0 <= SE_redist0_stall_entry_aunroll_o6_6_5_R_v_0 and SE_redist0_stall_entry_aunroll_o6_6_5_s_tv_0;
            ELSE
                SE_redist0_stall_entry_aunroll_o6_6_5_R_v_0 <= SE_redist0_stall_entry_aunroll_o6_6_5_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_for_cond23_loopexit_loopexit_loopexit_gemm_nn9w_c0_enter345_gemm_nn9w_aunroll_x(BLACKBOX,6)@0
    -- in in_i_stall@20000000
    -- out out_c0_exit348_0@6
    -- out out_c0_exit348_1@6
    -- out out_o_stall@20000000
    -- out out_o_valid@6
    thei_sfc_c0_for_cond23_loopexit_loopexit_loopexit_gemm_nn9w_c0_enter345_gemm_nn9w_aunroll_x : i_sfc_c0_for_cond23_loopexit_loopexit_loopexit_gemm_nn9w_c0_enter345_gemm_nn9w
    PORT MAP (
        in_c0_eni1344_0 => GND_q,
        in_c0_eni1344_1 => bubble_select_stall_entry_aunroll_c,
        in_i_stall => SE_out_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_backStall,
        in_i_valid => SE_stall_entry_aunroll_V2,
        in_ldc => in_ldc,
        out_c0_exit348_1 => i_sfc_c0_for_cond23_loopexit_loopexit_loopexit_gemm_nn9w_c0_enter345_gemm_nn9w_aunroll_x_out_c0_exit348_1,
        out_o_stall => i_sfc_c0_for_cond23_loopexit_loopexit_loopexit_gemm_nn9w_c0_enter345_gemm_nn9w_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_cond23_loopexit_loopexit_loopexit_gemm_nn9w_c0_enter345_gemm_nn9w_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- redist4_stall_entry_aunroll_o17_5_4(REG,59)
    redist4_stall_entry_aunroll_o17_5_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_aunroll_o17_5_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_4_backEN = "1") THEN
                redist4_stall_entry_aunroll_o17_5_4_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o6_6_4_D4);
            END IF;
        END IF;
    END PROCESS;

    -- i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w(BLACKBOX,13)@5
    -- in in_stall_in@20000000
    -- out out_data_out@6
    -- out out_feedback_stall_out_16@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@6
    thei_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w : i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w148
    PORT MAP (
        in_data_in => GND_q,
        in_dir => redist4_stall_entry_aunroll_o17_5_4_q,
        in_feedback_in_16 => in_feedback_in_16,
        in_feedback_valid_in_16 => in_feedback_valid_in_16,
        in_predicate => GND_q,
        in_stall_in => SE_out_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_backStall,
        in_valid_in => SE_out_bubble_out_stall_entry_aunroll_1_V0,
        out_data_out => i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_out_data_out,
        out_feedback_stall_out_16 => i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_out_feedback_stall_out_16,
        out_stall_out => i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_out_stall_out,
        out_valid_out => i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w(STALLENABLE,106)
    -- Valid signal propagation
    SE_out_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_V0 <= SE_out_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_wireValid;
    -- Backward Stall generation
    SE_out_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_backStall <= in_stall_in or not (SE_out_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_and0 <= i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_out_valid_out;
    SE_out_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_and1 <= i_sfc_c0_for_cond23_loopexit_loopexit_loopexit_gemm_nn9w_c0_enter345_gemm_nn9w_aunroll_x_out_o_valid and SE_out_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_and0;
    SE_out_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_wireValid <= SE_redist0_stall_entry_aunroll_o6_6_5_V0 and SE_out_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_and1;

    -- bubble_join_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w(BITJOIN,95)
    bubble_join_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_q <= i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_out_data_out;

    -- bubble_select_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w(BITSELECT,96)
    bubble_select_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_b <= STD_LOGIC_VECTOR(bubble_join_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_q(0 downto 0));

    -- redist9_stall_entry_aunroll_o23_6_4(REG,88)
    redist9_stall_entry_aunroll_o23_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_stall_entry_aunroll_o23_6_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_4_backEN = "1") THEN
                redist9_stall_entry_aunroll_o23_6_4_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o6_6_4_D9);
            END IF;
        END IF;
    END PROCESS;

    -- redist9_stall_entry_aunroll_o23_6_5(REG,89)
    redist9_stall_entry_aunroll_o23_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_stall_entry_aunroll_o23_6_5_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_5_backEN = "1") THEN
                redist9_stall_entry_aunroll_o23_6_5_q <= STD_LOGIC_VECTOR(redist9_stall_entry_aunroll_o23_6_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_stall_entry_aunroll_o22_6_4(REG,82)
    redist8_stall_entry_aunroll_o22_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_stall_entry_aunroll_o22_6_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_4_backEN = "1") THEN
                redist8_stall_entry_aunroll_o22_6_4_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o6_6_4_D8);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_stall_entry_aunroll_o22_6_5(REG,83)
    redist8_stall_entry_aunroll_o22_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_stall_entry_aunroll_o22_6_5_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_5_backEN = "1") THEN
                redist8_stall_entry_aunroll_o22_6_5_q <= STD_LOGIC_VECTOR(redist8_stall_entry_aunroll_o22_6_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_stall_entry_aunroll_o21_6_4(REG,76)
    redist7_stall_entry_aunroll_o21_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_stall_entry_aunroll_o21_6_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_4_backEN = "1") THEN
                redist7_stall_entry_aunroll_o21_6_4_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o6_6_4_D7);
            END IF;
        END IF;
    END PROCESS;

    -- redist7_stall_entry_aunroll_o21_6_5(REG,77)
    redist7_stall_entry_aunroll_o21_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_stall_entry_aunroll_o21_6_5_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_5_backEN = "1") THEN
                redist7_stall_entry_aunroll_o21_6_5_q <= STD_LOGIC_VECTOR(redist7_stall_entry_aunroll_o21_6_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o11_6_4(REG,47)
    redist2_stall_entry_aunroll_o11_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o11_6_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_4_backEN = "1") THEN
                redist2_stall_entry_aunroll_o11_6_4_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o6_6_4_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o11_6_5(REG,48)
    redist2_stall_entry_aunroll_o11_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o11_6_5_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_5_backEN = "1") THEN
                redist2_stall_entry_aunroll_o11_6_5_q <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o11_6_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o10_6_4(REG,41)
    redist1_stall_entry_aunroll_o10_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o10_6_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_4_backEN = "1") THEN
                redist1_stall_entry_aunroll_o10_6_4_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o6_6_4_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o10_6_5(REG,42)
    redist1_stall_entry_aunroll_o10_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o10_6_5_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_5_backEN = "1") THEN
                redist1_stall_entry_aunroll_o10_6_5_q <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o10_6_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_stall_entry_aunroll_o6_6_4(REG,35)
    redist0_stall_entry_aunroll_o6_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_aunroll_o6_6_4_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_4_backEN = "1") THEN
                redist0_stall_entry_aunroll_o6_6_4_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o6_6_4_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_stall_entry_aunroll_o6_6_5(REG,36)
    redist0_stall_entry_aunroll_o6_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_aunroll_o6_6_5_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_5_backEN = "1") THEN
                redist0_stall_entry_aunroll_o6_6_5_q <= STD_LOGIC_VECTOR(redist0_stall_entry_aunroll_o6_6_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_stall_entry_aunroll_o19_6_4(REG,70)
    redist6_stall_entry_aunroll_o19_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_aunroll_o19_6_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_4_backEN = "1") THEN
                redist6_stall_entry_aunroll_o19_6_4_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o6_6_4_D6);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_stall_entry_aunroll_o19_6_5(REG,71)
    redist6_stall_entry_aunroll_o19_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_aunroll_o19_6_5_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_5_backEN = "1") THEN
                redist6_stall_entry_aunroll_o19_6_5_q <= STD_LOGIC_VECTOR(redist6_stall_entry_aunroll_o19_6_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_stall_entry_aunroll_o18_6_4(REG,64)
    redist5_stall_entry_aunroll_o18_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_stall_entry_aunroll_o18_6_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_4_backEN = "1") THEN
                redist5_stall_entry_aunroll_o18_6_4_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o6_6_4_D5);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_stall_entry_aunroll_o18_6_5(REG,65)
    redist5_stall_entry_aunroll_o18_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_stall_entry_aunroll_o18_6_5_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_5_backEN = "1") THEN
                redist5_stall_entry_aunroll_o18_6_5_q <= STD_LOGIC_VECTOR(redist5_stall_entry_aunroll_o18_6_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_sfc_c0_for_cond23_loopexit_loopexit_loopexit_gemm_nn9w_c0_enter345_gemm_nn9w_aunroll_x(BITJOIN,91)
    bubble_join_i_sfc_c0_for_cond23_loopexit_loopexit_loopexit_gemm_nn9w_c0_enter345_gemm_nn9w_aunroll_x_q <= i_sfc_c0_for_cond23_loopexit_loopexit_loopexit_gemm_nn9w_c0_enter345_gemm_nn9w_aunroll_x_out_c0_exit348_1;

    -- bubble_select_i_sfc_c0_for_cond23_loopexit_loopexit_loopexit_gemm_nn9w_c0_enter345_gemm_nn9w_aunroll_x(BITSELECT,92)
    bubble_select_i_sfc_c0_for_cond23_loopexit_loopexit_loopexit_gemm_nn9w_c0_enter345_gemm_nn9w_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond23_loopexit_loopexit_loopexit_gemm_nn9w_c0_enter345_gemm_nn9w_aunroll_x_q(31 downto 0));

    -- redist3_stall_entry_aunroll_o15_6_4(REG,53)
    redist3_stall_entry_aunroll_o15_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_aunroll_o15_6_4_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_4_backEN = "1") THEN
                redist3_stall_entry_aunroll_o15_6_4_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o6_6_4_D3);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_aunroll_o15_6_5(REG,54)
    redist3_stall_entry_aunroll_o15_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_aunroll_o15_6_5_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o6_6_5_backEN = "1") THEN
                redist3_stall_entry_aunroll_o15_6_5_q <= STD_LOGIC_VECTOR(redist3_stall_entry_aunroll_o15_6_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- dupName_0_sync_out_x(GPOUT,5)@6
    out_c0_exe11 <= redist3_stall_entry_aunroll_o15_6_5_q;
    out_c0_exe1349 <= bubble_select_i_sfc_c0_for_cond23_loopexit_loopexit_loopexit_gemm_nn9w_c0_enter345_gemm_nn9w_aunroll_x_b;
    out_c0_exe14 <= redist5_stall_entry_aunroll_o18_6_5_q;
    out_c0_exe15 <= redist6_stall_entry_aunroll_o19_6_5_q;
    out_c0_exe2342 <= redist0_stall_entry_aunroll_o6_6_5_q;
    out_c0_exe6 <= redist1_stall_entry_aunroll_o10_6_5_q;
    out_c0_exe7 <= redist2_stall_entry_aunroll_o11_6_5_q;
    out_c1_exe1 <= redist7_stall_entry_aunroll_o21_6_5_q;
    out_c1_exe2 <= redist8_stall_entry_aunroll_o22_6_5_q;
    out_c1_exe3 <= redist9_stall_entry_aunroll_o23_6_5_q;
    out_memdep_phi277_pop16 <= bubble_select_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_b;
    out_valid_out <= SE_out_i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_V0;

    -- feedback_stall_out_16_sync(GPOUT,11)
    out_feedback_stall_out_16 <= i_acl_pop_i1_memdep_phi277_pop16_gemm_nn9w_out_feedback_stall_out_16;

    -- sync_out(GPOUT,20)@0
    out_stall_out <= SE_stall_entry_aunroll_backStall;

END normal;
