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

-- VHDL created from bb_gemm_nnfW_B3_stall_region
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

entity bb_gemm_nnfW_B3_stall_region is
    port (
        in_c0_exe82 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit621_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit621_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit621_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit621_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit621_4 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit621_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit621_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit621_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit621_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit621_9 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit621_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit621_11 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit621_12 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe163 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe171 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi6_pop11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW2 : out std_logic_vector(32 downto 0);  -- ufix33
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_in_11 : in std_logic_vector(7 downto 0);  -- ufix8
        out_feedback_stall_out_11 : out std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_valid_in_11 : in std_logic_vector(0 downto 0);  -- ufix1
        in_ldc : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nnfW_B3_stall_region;

architecture normal of bb_gemm_nnfW_B3_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_sfc_c0_for_cond7_loopexit_loopexit_loopexit_gemm_nnfw_c0_enter67_gemm_nnfw is
        port (
            in_c0_eni166_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni166_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_ldc : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit70_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit70_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw97 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_11 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
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
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_op_gemm_nnfw_sel_x_b : STD_LOGIC_VECTOR (32 downto 0);
    signal bgTrunc_i_sdiv_sh_rm_op_gemm_nnfw_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_c_i32_1gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond7_loopexit_loopexit_loopexit_gemm_nnfw_c0_enter67_gemm_nnfw_aunroll_x_out_c0_exit70_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_cond7_loopexit_loopexit_loopexit_gemm_nnfw_c0_enter67_gemm_nnfw_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_cond7_loopexit_loopexit_loopexit_gemm_nnfw_c0_enter67_gemm_nnfw_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gemm_nnfw99_sel_x_b : STD_LOGIC_VECTOR (32 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i33_1gr_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_out_feedback_stall_out_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_op_gemm_nnfw_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_op_gemm_nnfw_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_op_gemm_nnfw_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_op_gemm_nnfw_q : STD_LOGIC_VECTOR (33 downto 0);
    signal i_sdiv_sh_rm_op_gemm_nnfw_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sdiv_sh_rm_op_gemm_nnfw_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sdiv_sh_rm_op_gemm_nnfw_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sdiv_sh_rm_op_gemm_nnfw_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unnamed_gemm_nnfw100_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gemm_nnfw100_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unnamed_gemm_nnfw90_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_unnamed_gemm_nnfw90_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_unnamed_gemm_nnfw90_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_unnamed_gemm_nnfw90_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gemm_nnfw99_vt_join_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_unnamed_gemm_nnfw99_vt_select_31_b : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_stall_entry_aunroll_o4_4_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_stall_entry_aunroll_o4_4_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_stall_entry_aunroll_o4_4_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_stall_entry_aunroll_o4_4_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_stall_entry_aunroll_o6_6_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_stall_entry_aunroll_o6_6_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_stall_entry_aunroll_o6_6_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_stall_entry_aunroll_o6_6_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_stall_entry_aunroll_o6_6_4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_stall_entry_aunroll_o6_6_5_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_stall_entry_aunroll_o10_6_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_aunroll_o10_6_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_aunroll_o10_6_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_aunroll_o10_6_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_aunroll_o10_6_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_aunroll_o10_6_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_aunroll_o11_6_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_aunroll_o11_6_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_aunroll_o11_6_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_aunroll_o11_6_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_aunroll_o11_6_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_aunroll_o11_6_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_aunroll_o15_5_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_aunroll_o15_5_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_aunroll_o15_5_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_aunroll_o15_5_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_aunroll_o15_5_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o16_6_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o16_6_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o16_6_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o16_6_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o16_6_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o16_6_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_aunroll_o17_6_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_aunroll_o17_6_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_aunroll_o17_6_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_aunroll_o17_6_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_aunroll_o17_6_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_stall_entry_aunroll_o17_6_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_unnamed_gemm_nnfw99_vt_select_31_b_1_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist8_i_unnamed_gemm_nnfw90_c_2_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_bgTrunc_i_op_gemm_nnfw_sel_x_b_1_0_q : STD_LOGIC_VECTOR (32 downto 0);
    signal bubble_join_i_sfc_c0_for_cond7_loopexit_loopexit_loopexit_gemm_nnfw_c0_enter67_gemm_nnfw_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_cond7_loopexit_loopexit_loopexit_gemm_nnfw_c0_enter67_gemm_nnfw_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_stall_entry_aunroll_q : STD_LOGIC_VECTOR (100 downto 0);
    signal bubble_select_stall_entry_aunroll_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_aunroll_e : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_f : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_i : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_gemm_nnfw90_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_gemm_nnfw90_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_gemm_nnfw90_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_gemm_nnfw90_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_gemm_nnfw90_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_gemm_nnfw90_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_gemm_nnfw90_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_gemm_nnfw90_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_gemm_nnfw90_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_gemm_nnfw90_V1 : STD_LOGIC_VECTOR (0 downto 0);
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
    signal SE_redist0_stall_entry_aunroll_o4_4_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_aunroll_o4_4_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o6_6_5_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o6_6_5_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o6_6_5_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o6_6_5_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o6_6_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist1_stall_entry_aunroll_o6_6_5_V0 : STD_LOGIC_VECTOR (0 downto 0);
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
    signal SR_SE_redist0_stall_entry_aunroll_o4_4_2_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o4_4_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o4_4_2_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o4_4_2_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o4_4_2_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o4_4_2_D2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o4_4_2_D3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o4_4_2_D4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o4_4_2_D5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_stall_entry_aunroll_o4_4_2_D6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_gemm_nnfw90_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_gemm_nnfw90_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_gemm_nnfw90_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_unnamed_gemm_nnfw90_r_data1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_unnamed_gemm_nnfw90_r_data2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_gemm_nnfw90_r_data3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_gemm_nnfw90_r_data4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_gemm_nnfw90_r_data5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_gemm_nnfw90_r_data6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_gemm_nnfw90_r_data7 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_unnamed_gemm_nnfw90_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_gemm_nnfw90_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_gemm_nnfw90_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_unnamed_gemm_nnfw90_D1 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_i_unnamed_gemm_nnfw90_D2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_gemm_nnfw90_D3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_gemm_nnfw90_D4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_gemm_nnfw90_D5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_gemm_nnfw90_D6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_i_unnamed_gemm_nnfw90_D7 : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- bubble_join_stall_entry_aunroll(BITJOIN,103)
    bubble_join_stall_entry_aunroll_q <= in_c0_exit621_12 & in_c0_exit621_11 & in_c0_exit621_10 & in_c0_exit621_6 & in_c0_exit621_5 & in_c0_exit621_2 & in_c0_exit621_1 & in_c0_exe82;

    -- bubble_select_stall_entry_aunroll(BITSELECT,104)
    bubble_select_stall_entry_aunroll_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(31 downto 0));
    bubble_select_stall_entry_aunroll_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(63 downto 32));
    bubble_select_stall_entry_aunroll_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(95 downto 64));
    bubble_select_stall_entry_aunroll_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(96 downto 96));
    bubble_select_stall_entry_aunroll_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(97 downto 97));
    bubble_select_stall_entry_aunroll_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(98 downto 98));
    bubble_select_stall_entry_aunroll_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(99 downto 99));
    bubble_select_stall_entry_aunroll_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(100 downto 100));

    -- redist6_stall_entry_aunroll_o17_6_0(REG,85)
    redist6_stall_entry_aunroll_o17_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_aunroll_o17_6_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_0_backEN = "1") THEN
                redist6_stall_entry_aunroll_o17_6_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_i);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_stall_entry_aunroll_o17_6_1(REG,86)
    redist6_stall_entry_aunroll_o17_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_aunroll_o17_6_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_1_backEN = "1") THEN
                redist6_stall_entry_aunroll_o17_6_1_q <= STD_LOGIC_VECTOR(redist6_stall_entry_aunroll_o17_6_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_stall_entry_aunroll_o16_6_0(REG,79)
    redist5_stall_entry_aunroll_o16_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_stall_entry_aunroll_o16_6_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_0_backEN = "1") THEN
                redist5_stall_entry_aunroll_o16_6_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_h);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_stall_entry_aunroll_o16_6_1(REG,80)
    redist5_stall_entry_aunroll_o16_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_stall_entry_aunroll_o16_6_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_1_backEN = "1") THEN
                redist5_stall_entry_aunroll_o16_6_1_q <= STD_LOGIC_VECTOR(redist5_stall_entry_aunroll_o16_6_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_stall_entry_aunroll_o15_5_0(REG,74)
    redist4_stall_entry_aunroll_o15_5_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_aunroll_o15_5_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_0_backEN = "1") THEN
                redist4_stall_entry_aunroll_o15_5_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_g);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_stall_entry_aunroll_o15_5_1(REG,75)
    redist4_stall_entry_aunroll_o15_5_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_aunroll_o15_5_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_1_backEN = "1") THEN
                redist4_stall_entry_aunroll_o15_5_1_q <= STD_LOGIC_VECTOR(redist4_stall_entry_aunroll_o15_5_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_aunroll_o11_6_0(REG,68)
    redist3_stall_entry_aunroll_o11_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_aunroll_o11_6_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_0_backEN = "1") THEN
                redist3_stall_entry_aunroll_o11_6_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_f);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_aunroll_o11_6_1(REG,69)
    redist3_stall_entry_aunroll_o11_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_aunroll_o11_6_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_1_backEN = "1") THEN
                redist3_stall_entry_aunroll_o11_6_1_q <= STD_LOGIC_VECTOR(redist3_stall_entry_aunroll_o11_6_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o10_6_0(REG,62)
    redist2_stall_entry_aunroll_o10_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o10_6_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_0_backEN = "1") THEN
                redist2_stall_entry_aunroll_o10_6_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_e);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o10_6_1(REG,63)
    redist2_stall_entry_aunroll_o10_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o10_6_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_1_backEN = "1") THEN
                redist2_stall_entry_aunroll_o10_6_1_q <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o10_6_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o6_6_0(REG,56)
    redist1_stall_entry_aunroll_o6_6_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o6_6_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_0_backEN = "1") THEN
                redist1_stall_entry_aunroll_o6_6_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_c);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o6_6_1(REG,57)
    redist1_stall_entry_aunroll_o6_6_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o6_6_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_1_backEN = "1") THEN
                redist1_stall_entry_aunroll_o6_6_1_q <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o6_6_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_stall_entry_aunroll_o4_4_0(REG,52)
    redist0_stall_entry_aunroll_o4_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_aunroll_o4_4_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_0_backEN = "1") THEN
                redist0_stall_entry_aunroll_o4_4_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_b);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_stall_entry_aunroll_o4_4_1(REG,53)
    redist0_stall_entry_aunroll_o4_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_aunroll_o4_4_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_1_backEN = "1") THEN
                redist0_stall_entry_aunroll_o4_4_1_q <= STD_LOGIC_VECTOR(redist0_stall_entry_aunroll_o4_4_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist0_stall_entry_aunroll_o4_4_3(STALLENABLE,125)
    -- Valid signal propagation
    SE_redist0_stall_entry_aunroll_o4_4_3_V0 <= SE_redist0_stall_entry_aunroll_o4_4_3_R_v_0;
    -- Stall signal propagation
    SE_redist0_stall_entry_aunroll_o4_4_3_s_tv_0 <= SR_SE_i_unnamed_gemm_nnfw90_backStall and SE_redist0_stall_entry_aunroll_o4_4_3_R_v_0;
    -- Backward Enable generation
    SE_redist0_stall_entry_aunroll_o4_4_3_backEN <= not (SE_redist0_stall_entry_aunroll_o4_4_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_aunroll_o4_4_3_v_s_0 <= SE_redist0_stall_entry_aunroll_o4_4_3_backEN and SE_redist0_stall_entry_aunroll_o4_4_2_V0;
    -- Backward Stall generation
    SE_redist0_stall_entry_aunroll_o4_4_3_backStall <= not (SE_redist0_stall_entry_aunroll_o4_4_3_v_s_0);
    SE_redist0_stall_entry_aunroll_o4_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_aunroll_o4_4_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_3_backEN = "0") THEN
                SE_redist0_stall_entry_aunroll_o4_4_3_R_v_0 <= SE_redist0_stall_entry_aunroll_o4_4_3_R_v_0 and SE_redist0_stall_entry_aunroll_o4_4_3_s_tv_0;
            ELSE
                SE_redist0_stall_entry_aunroll_o4_4_3_R_v_0 <= SE_redist0_stall_entry_aunroll_o4_4_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_stall_entry_aunroll_o4_4_2(STALLENABLE,124)
    -- Valid signal propagation
    SE_redist0_stall_entry_aunroll_o4_4_2_V0 <= SE_redist0_stall_entry_aunroll_o4_4_2_R_v_0;
    -- Stall signal propagation
    SE_redist0_stall_entry_aunroll_o4_4_2_s_tv_0 <= SE_redist0_stall_entry_aunroll_o4_4_3_backStall and SE_redist0_stall_entry_aunroll_o4_4_2_R_v_0;
    -- Backward Enable generation
    SE_redist0_stall_entry_aunroll_o4_4_2_backEN <= not (SE_redist0_stall_entry_aunroll_o4_4_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_aunroll_o4_4_2_v_s_0 <= SE_redist0_stall_entry_aunroll_o4_4_2_backEN and SR_SE_redist0_stall_entry_aunroll_o4_4_2_V;
    -- Backward Stall generation
    SE_redist0_stall_entry_aunroll_o4_4_2_backStall <= not (SE_redist0_stall_entry_aunroll_o4_4_2_backEN);
    SE_redist0_stall_entry_aunroll_o4_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_aunroll_o4_4_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_2_backEN = "0") THEN
                SE_redist0_stall_entry_aunroll_o4_4_2_R_v_0 <= SE_redist0_stall_entry_aunroll_o4_4_2_R_v_0 and SE_redist0_stall_entry_aunroll_o4_4_2_s_tv_0;
            ELSE
                SE_redist0_stall_entry_aunroll_o4_4_2_R_v_0 <= SE_redist0_stall_entry_aunroll_o4_4_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist0_stall_entry_aunroll_o4_4_2(STALLREG,185)
    SR_SE_redist0_stall_entry_aunroll_o4_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_valid <= (others => '0');
            SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data0 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data1 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data2 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data3 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data4 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data5 <= (others => '-');
            SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data6 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_valid <= SE_redist0_stall_entry_aunroll_o4_4_2_backStall and (SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_valid or SR_SE_redist0_stall_entry_aunroll_o4_4_2_i_valid);

            IF (SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data0 <= STD_LOGIC_VECTOR(redist0_stall_entry_aunroll_o4_4_1_q);
                SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data1 <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o6_6_1_q);
                SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data2 <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o10_6_1_q);
                SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data3 <= STD_LOGIC_VECTOR(redist3_stall_entry_aunroll_o11_6_1_q);
                SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data4 <= STD_LOGIC_VECTOR(redist4_stall_entry_aunroll_o15_5_1_q);
                SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data5 <= STD_LOGIC_VECTOR(redist5_stall_entry_aunroll_o16_6_1_q);
                SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data6 <= STD_LOGIC_VECTOR(redist6_stall_entry_aunroll_o17_6_1_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist0_stall_entry_aunroll_o4_4_2_i_valid <= SE_redist0_stall_entry_aunroll_o4_4_1_V0;
    -- Stall signal propagation
    SR_SE_redist0_stall_entry_aunroll_o4_4_2_backStall <= SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_valid or not (SR_SE_redist0_stall_entry_aunroll_o4_4_2_i_valid);

    -- Valid
    SR_SE_redist0_stall_entry_aunroll_o4_4_2_V <= SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_valid WHEN SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_valid = "1" ELSE SR_SE_redist0_stall_entry_aunroll_o4_4_2_i_valid;

    -- Data0
    SR_SE_redist0_stall_entry_aunroll_o4_4_2_D0 <= SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data0 WHEN SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_valid = "1" ELSE redist0_stall_entry_aunroll_o4_4_1_q;
    -- Data1
    SR_SE_redist0_stall_entry_aunroll_o4_4_2_D1 <= SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data1 WHEN SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_valid = "1" ELSE redist1_stall_entry_aunroll_o6_6_1_q;
    -- Data2
    SR_SE_redist0_stall_entry_aunroll_o4_4_2_D2 <= SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data2 WHEN SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_valid = "1" ELSE redist2_stall_entry_aunroll_o10_6_1_q;
    -- Data3
    SR_SE_redist0_stall_entry_aunroll_o4_4_2_D3 <= SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data3 WHEN SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_valid = "1" ELSE redist3_stall_entry_aunroll_o11_6_1_q;
    -- Data4
    SR_SE_redist0_stall_entry_aunroll_o4_4_2_D4 <= SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data4 WHEN SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_valid = "1" ELSE redist4_stall_entry_aunroll_o15_5_1_q;
    -- Data5
    SR_SE_redist0_stall_entry_aunroll_o4_4_2_D5 <= SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data5 WHEN SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_valid = "1" ELSE redist5_stall_entry_aunroll_o16_6_1_q;
    -- Data6
    SR_SE_redist0_stall_entry_aunroll_o4_4_2_D6 <= SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_data6 WHEN SR_SE_redist0_stall_entry_aunroll_o4_4_2_r_valid = "1" ELSE redist6_stall_entry_aunroll_o17_6_1_q;

    -- SE_redist0_stall_entry_aunroll_o4_4_1(STALLENABLE,123)
    -- Valid signal propagation
    SE_redist0_stall_entry_aunroll_o4_4_1_V0 <= SE_redist0_stall_entry_aunroll_o4_4_1_R_v_0;
    -- Stall signal propagation
    SE_redist0_stall_entry_aunroll_o4_4_1_s_tv_0 <= SR_SE_redist0_stall_entry_aunroll_o4_4_2_backStall and SE_redist0_stall_entry_aunroll_o4_4_1_R_v_0;
    -- Backward Enable generation
    SE_redist0_stall_entry_aunroll_o4_4_1_backEN <= not (SE_redist0_stall_entry_aunroll_o4_4_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_aunroll_o4_4_1_v_s_0 <= SE_redist0_stall_entry_aunroll_o4_4_1_backEN and SE_redist0_stall_entry_aunroll_o4_4_0_V0;
    -- Backward Stall generation
    SE_redist0_stall_entry_aunroll_o4_4_1_backStall <= not (SE_redist0_stall_entry_aunroll_o4_4_1_v_s_0);
    SE_redist0_stall_entry_aunroll_o4_4_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_aunroll_o4_4_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_1_backEN = "0") THEN
                SE_redist0_stall_entry_aunroll_o4_4_1_R_v_0 <= SE_redist0_stall_entry_aunroll_o4_4_1_R_v_0 and SE_redist0_stall_entry_aunroll_o4_4_1_s_tv_0;
            ELSE
                SE_redist0_stall_entry_aunroll_o4_4_1_R_v_0 <= SE_redist0_stall_entry_aunroll_o4_4_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_stall_entry_aunroll_o4_4_0(STALLENABLE,122)
    -- Valid signal propagation
    SE_redist0_stall_entry_aunroll_o4_4_0_V0 <= SE_redist0_stall_entry_aunroll_o4_4_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_stall_entry_aunroll_o4_4_0_s_tv_0 <= SE_redist0_stall_entry_aunroll_o4_4_1_backStall and SE_redist0_stall_entry_aunroll_o4_4_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_stall_entry_aunroll_o4_4_0_backEN <= not (SE_redist0_stall_entry_aunroll_o4_4_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_aunroll_o4_4_0_v_s_0 <= SE_redist0_stall_entry_aunroll_o4_4_0_backEN and SE_stall_entry_aunroll_V1;
    -- Backward Stall generation
    SE_redist0_stall_entry_aunroll_o4_4_0_backStall <= not (SE_redist0_stall_entry_aunroll_o4_4_0_v_s_0);
    SE_redist0_stall_entry_aunroll_o4_4_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_aunroll_o4_4_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_0_backEN = "0") THEN
                SE_redist0_stall_entry_aunroll_o4_4_0_R_v_0 <= SE_redist0_stall_entry_aunroll_o4_4_0_R_v_0 and SE_redist0_stall_entry_aunroll_o4_4_0_s_tv_0;
            ELSE
                SE_redist0_stall_entry_aunroll_o4_4_0_R_v_0 <= SE_redist0_stall_entry_aunroll_o4_4_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_stall_entry_aunroll(STALLENABLE,120)
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
    SE_stall_entry_aunroll_consumed1 <= (not (SE_redist0_stall_entry_aunroll_o4_4_0_backStall) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg1;
    SE_stall_entry_aunroll_consumed2 <= (not (i_sfc_c0_for_cond7_loopexit_loopexit_loopexit_gemm_nnfw_c0_enter67_gemm_nnfw_aunroll_x_out_o_stall) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg2;
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

    -- bubble_out_stall_entry_aunroll_1_reg(STALLFIFO,184)
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

    -- SE_out_bubble_out_stall_entry_aunroll_1(STALLENABLE,181)
    -- Valid signal propagation
    SE_out_bubble_out_stall_entry_aunroll_1_V0 <= SE_out_bubble_out_stall_entry_aunroll_1_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_stall_entry_aunroll_1_backStall <= i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_out_stall_out or not (SE_out_bubble_out_stall_entry_aunroll_1_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_stall_entry_aunroll_1_and0 <= bubble_out_stall_entry_aunroll_1_reg_valid_out;
    SE_out_bubble_out_stall_entry_aunroll_1_wireValid <= SE_i_unnamed_gemm_nnfw90_V1 and SE_out_bubble_out_stall_entry_aunroll_1_and0;

    -- dupName_0_c_i32_1gr_x(CONSTANT,5)
    dupName_0_c_i32_1gr_x_q <= "11111111111111111111111111111111";

    -- i_sdiv_sh_rm_op_gemm_nnfw(ADD,23)@4
    i_sdiv_sh_rm_op_gemm_nnfw_a <= STD_LOGIC_VECTOR("0" & redist0_stall_entry_aunroll_o4_4_3_q);
    i_sdiv_sh_rm_op_gemm_nnfw_b <= STD_LOGIC_VECTOR("0" & dupName_0_c_i32_1gr_x_q);
    i_sdiv_sh_rm_op_gemm_nnfw_o <= STD_LOGIC_VECTOR(UNSIGNED(i_sdiv_sh_rm_op_gemm_nnfw_a) + UNSIGNED(i_sdiv_sh_rm_op_gemm_nnfw_b));
    i_sdiv_sh_rm_op_gemm_nnfw_q <= i_sdiv_sh_rm_op_gemm_nnfw_o(32 downto 0);

    -- bgTrunc_i_sdiv_sh_rm_op_gemm_nnfw_sel_x(BITSELECT,4)@4
    bgTrunc_i_sdiv_sh_rm_op_gemm_nnfw_sel_x_b <= i_sdiv_sh_rm_op_gemm_nnfw_q(31 downto 0);

    -- i_unnamed_gemm_nnfw99_sel_x(BITSELECT,10)@4
    i_unnamed_gemm_nnfw99_sel_x_b <= std_logic_vector(resize(unsigned(bgTrunc_i_sdiv_sh_rm_op_gemm_nnfw_sel_x_b(31 downto 0)), 33));

    -- i_unnamed_gemm_nnfw99_vt_select_31(BITSELECT,29)@4
    i_unnamed_gemm_nnfw99_vt_select_31_b <= i_unnamed_gemm_nnfw99_sel_x_b(31 downto 0);

    -- redist6_stall_entry_aunroll_o17_6_2(REG,87)
    redist6_stall_entry_aunroll_o17_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_aunroll_o17_6_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_2_backEN = "1") THEN
                redist6_stall_entry_aunroll_o17_6_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o4_4_2_D6);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_stall_entry_aunroll_o17_6_3(REG,88)
    redist6_stall_entry_aunroll_o17_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_aunroll_o17_6_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_3_backEN = "1") THEN
                redist6_stall_entry_aunroll_o17_6_3_q <= STD_LOGIC_VECTOR(redist6_stall_entry_aunroll_o17_6_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_stall_entry_aunroll_o16_6_2(REG,81)
    redist5_stall_entry_aunroll_o16_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_stall_entry_aunroll_o16_6_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_2_backEN = "1") THEN
                redist5_stall_entry_aunroll_o16_6_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o4_4_2_D5);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_stall_entry_aunroll_o16_6_3(REG,82)
    redist5_stall_entry_aunroll_o16_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_stall_entry_aunroll_o16_6_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_3_backEN = "1") THEN
                redist5_stall_entry_aunroll_o16_6_3_q <= STD_LOGIC_VECTOR(redist5_stall_entry_aunroll_o16_6_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_stall_entry_aunroll_o15_5_2(REG,76)
    redist4_stall_entry_aunroll_o15_5_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_aunroll_o15_5_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_2_backEN = "1") THEN
                redist4_stall_entry_aunroll_o15_5_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o4_4_2_D4);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_stall_entry_aunroll_o15_5_3(REG,77)
    redist4_stall_entry_aunroll_o15_5_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_aunroll_o15_5_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_3_backEN = "1") THEN
                redist4_stall_entry_aunroll_o15_5_3_q <= STD_LOGIC_VECTOR(redist4_stall_entry_aunroll_o15_5_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_aunroll_o11_6_2(REG,70)
    redist3_stall_entry_aunroll_o11_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_aunroll_o11_6_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_2_backEN = "1") THEN
                redist3_stall_entry_aunroll_o11_6_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o4_4_2_D3);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_aunroll_o11_6_3(REG,71)
    redist3_stall_entry_aunroll_o11_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_aunroll_o11_6_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_3_backEN = "1") THEN
                redist3_stall_entry_aunroll_o11_6_3_q <= STD_LOGIC_VECTOR(redist3_stall_entry_aunroll_o11_6_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o10_6_2(REG,64)
    redist2_stall_entry_aunroll_o10_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o10_6_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_2_backEN = "1") THEN
                redist2_stall_entry_aunroll_o10_6_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o4_4_2_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o10_6_3(REG,65)
    redist2_stall_entry_aunroll_o10_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o10_6_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_3_backEN = "1") THEN
                redist2_stall_entry_aunroll_o10_6_3_q <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o10_6_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o6_6_2(REG,58)
    redist1_stall_entry_aunroll_o6_6_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o6_6_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_2_backEN = "1") THEN
                redist1_stall_entry_aunroll_o6_6_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o4_4_2_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o6_6_3(REG,59)
    redist1_stall_entry_aunroll_o6_6_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o6_6_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_3_backEN = "1") THEN
                redist1_stall_entry_aunroll_o6_6_3_q <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o6_6_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_stall_entry_aunroll_o4_4_2(REG,54)
    redist0_stall_entry_aunroll_o4_4_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_aunroll_o4_4_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_2_backEN = "1") THEN
                redist0_stall_entry_aunroll_o4_4_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_stall_entry_aunroll_o4_4_2_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_stall_entry_aunroll_o4_4_3(REG,55)
    redist0_stall_entry_aunroll_o4_4_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_aunroll_o4_4_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_aunroll_o4_4_3_backEN = "1") THEN
                redist0_stall_entry_aunroll_o4_4_3_q <= STD_LOGIC_VECTOR(redist0_stall_entry_aunroll_o4_4_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- SR_SE_i_unnamed_gemm_nnfw90(STALLREG,186)
    SR_SE_i_unnamed_gemm_nnfw90_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_i_unnamed_gemm_nnfw90_r_valid <= (others => '0');
            SR_SE_i_unnamed_gemm_nnfw90_r_data0 <= (others => '-');
            SR_SE_i_unnamed_gemm_nnfw90_r_data1 <= (others => '-');
            SR_SE_i_unnamed_gemm_nnfw90_r_data2 <= (others => '-');
            SR_SE_i_unnamed_gemm_nnfw90_r_data3 <= (others => '-');
            SR_SE_i_unnamed_gemm_nnfw90_r_data4 <= (others => '-');
            SR_SE_i_unnamed_gemm_nnfw90_r_data5 <= (others => '-');
            SR_SE_i_unnamed_gemm_nnfw90_r_data6 <= (others => '-');
            SR_SE_i_unnamed_gemm_nnfw90_r_data7 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_i_unnamed_gemm_nnfw90_r_valid <= SE_i_unnamed_gemm_nnfw90_backStall and (SR_SE_i_unnamed_gemm_nnfw90_r_valid or SR_SE_i_unnamed_gemm_nnfw90_i_valid);

            IF (SR_SE_i_unnamed_gemm_nnfw90_r_valid = "0") THEN
                -- Data(s)
                SR_SE_i_unnamed_gemm_nnfw90_r_data0 <= STD_LOGIC_VECTOR(redist0_stall_entry_aunroll_o4_4_3_q);
                SR_SE_i_unnamed_gemm_nnfw90_r_data1 <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o6_6_3_q);
                SR_SE_i_unnamed_gemm_nnfw90_r_data2 <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o10_6_3_q);
                SR_SE_i_unnamed_gemm_nnfw90_r_data3 <= STD_LOGIC_VECTOR(redist3_stall_entry_aunroll_o11_6_3_q);
                SR_SE_i_unnamed_gemm_nnfw90_r_data4 <= STD_LOGIC_VECTOR(redist4_stall_entry_aunroll_o15_5_3_q);
                SR_SE_i_unnamed_gemm_nnfw90_r_data5 <= STD_LOGIC_VECTOR(redist5_stall_entry_aunroll_o16_6_3_q);
                SR_SE_i_unnamed_gemm_nnfw90_r_data6 <= STD_LOGIC_VECTOR(redist6_stall_entry_aunroll_o17_6_3_q);
                SR_SE_i_unnamed_gemm_nnfw90_r_data7 <= STD_LOGIC_VECTOR(i_unnamed_gemm_nnfw99_vt_select_31_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_i_unnamed_gemm_nnfw90_i_valid <= SE_redist0_stall_entry_aunroll_o4_4_3_V0;
    -- Stall signal propagation
    SR_SE_i_unnamed_gemm_nnfw90_backStall <= SR_SE_i_unnamed_gemm_nnfw90_r_valid or not (SR_SE_i_unnamed_gemm_nnfw90_i_valid);

    -- Valid
    SR_SE_i_unnamed_gemm_nnfw90_V <= SR_SE_i_unnamed_gemm_nnfw90_r_valid WHEN SR_SE_i_unnamed_gemm_nnfw90_r_valid = "1" ELSE SR_SE_i_unnamed_gemm_nnfw90_i_valid;

    -- Data0
    SR_SE_i_unnamed_gemm_nnfw90_D0 <= SR_SE_i_unnamed_gemm_nnfw90_r_data0 WHEN SR_SE_i_unnamed_gemm_nnfw90_r_valid = "1" ELSE redist0_stall_entry_aunroll_o4_4_3_q;
    -- Data1
    SR_SE_i_unnamed_gemm_nnfw90_D1 <= SR_SE_i_unnamed_gemm_nnfw90_r_data1 WHEN SR_SE_i_unnamed_gemm_nnfw90_r_valid = "1" ELSE redist1_stall_entry_aunroll_o6_6_3_q;
    -- Data2
    SR_SE_i_unnamed_gemm_nnfw90_D2 <= SR_SE_i_unnamed_gemm_nnfw90_r_data2 WHEN SR_SE_i_unnamed_gemm_nnfw90_r_valid = "1" ELSE redist2_stall_entry_aunroll_o10_6_3_q;
    -- Data3
    SR_SE_i_unnamed_gemm_nnfw90_D3 <= SR_SE_i_unnamed_gemm_nnfw90_r_data3 WHEN SR_SE_i_unnamed_gemm_nnfw90_r_valid = "1" ELSE redist3_stall_entry_aunroll_o11_6_3_q;
    -- Data4
    SR_SE_i_unnamed_gemm_nnfw90_D4 <= SR_SE_i_unnamed_gemm_nnfw90_r_data4 WHEN SR_SE_i_unnamed_gemm_nnfw90_r_valid = "1" ELSE redist4_stall_entry_aunroll_o15_5_3_q;
    -- Data5
    SR_SE_i_unnamed_gemm_nnfw90_D5 <= SR_SE_i_unnamed_gemm_nnfw90_r_data5 WHEN SR_SE_i_unnamed_gemm_nnfw90_r_valid = "1" ELSE redist5_stall_entry_aunroll_o16_6_3_q;
    -- Data6
    SR_SE_i_unnamed_gemm_nnfw90_D6 <= SR_SE_i_unnamed_gemm_nnfw90_r_data6 WHEN SR_SE_i_unnamed_gemm_nnfw90_r_valid = "1" ELSE redist6_stall_entry_aunroll_o17_6_3_q;
    -- Data7
    SR_SE_i_unnamed_gemm_nnfw90_D7 <= SR_SE_i_unnamed_gemm_nnfw90_r_data7 WHEN SR_SE_i_unnamed_gemm_nnfw90_r_valid = "1" ELSE i_unnamed_gemm_nnfw99_vt_select_31_b;

    -- SE_i_unnamed_gemm_nnfw90(STALLENABLE,117)
    -- Valid signal propagation
    SE_i_unnamed_gemm_nnfw90_V0 <= SE_i_unnamed_gemm_nnfw90_R_v_0;
    SE_i_unnamed_gemm_nnfw90_V1 <= SE_i_unnamed_gemm_nnfw90_R_v_1;
    -- Stall signal propagation
    SE_i_unnamed_gemm_nnfw90_s_tv_0 <= SE_redist1_stall_entry_aunroll_o6_6_5_backStall and SE_i_unnamed_gemm_nnfw90_R_v_0;
    SE_i_unnamed_gemm_nnfw90_s_tv_1 <= SE_out_bubble_out_stall_entry_aunroll_1_backStall and SE_i_unnamed_gemm_nnfw90_R_v_1;
    -- Backward Enable generation
    SE_i_unnamed_gemm_nnfw90_or0 <= SE_i_unnamed_gemm_nnfw90_s_tv_0;
    SE_i_unnamed_gemm_nnfw90_backEN <= not (SE_i_unnamed_gemm_nnfw90_s_tv_1 or SE_i_unnamed_gemm_nnfw90_or0);
    -- Determine whether to write valid data into the first register stage
    SE_i_unnamed_gemm_nnfw90_v_s_0 <= SE_i_unnamed_gemm_nnfw90_backEN and SR_SE_i_unnamed_gemm_nnfw90_V;
    -- Backward Stall generation
    SE_i_unnamed_gemm_nnfw90_backStall <= not (SE_i_unnamed_gemm_nnfw90_backEN);
    SE_i_unnamed_gemm_nnfw90_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_unnamed_gemm_nnfw90_R_v_0 <= (others => '0');
            SE_i_unnamed_gemm_nnfw90_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_unnamed_gemm_nnfw90_backEN = "0") THEN
                SE_i_unnamed_gemm_nnfw90_R_v_0 <= SE_i_unnamed_gemm_nnfw90_R_v_0 and SE_i_unnamed_gemm_nnfw90_s_tv_0;
            ELSE
                SE_i_unnamed_gemm_nnfw90_R_v_0 <= SE_i_unnamed_gemm_nnfw90_v_s_0;
            END IF;

            IF (SE_i_unnamed_gemm_nnfw90_backEN = "0") THEN
                SE_i_unnamed_gemm_nnfw90_R_v_1 <= SE_i_unnamed_gemm_nnfw90_R_v_1 and SE_i_unnamed_gemm_nnfw90_s_tv_1;
            ELSE
                SE_i_unnamed_gemm_nnfw90_R_v_1 <= SE_i_unnamed_gemm_nnfw90_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist1_stall_entry_aunroll_o6_6_5(STALLENABLE,131)
    -- Valid signal propagation
    SE_redist1_stall_entry_aunroll_o6_6_5_V0 <= SE_redist1_stall_entry_aunroll_o6_6_5_R_v_0;
    -- Stall signal propagation
    SE_redist1_stall_entry_aunroll_o6_6_5_s_tv_0 <= SE_out_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_backStall and SE_redist1_stall_entry_aunroll_o6_6_5_R_v_0;
    -- Backward Enable generation
    SE_redist1_stall_entry_aunroll_o6_6_5_backEN <= not (SE_redist1_stall_entry_aunroll_o6_6_5_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist1_stall_entry_aunroll_o6_6_5_v_s_0 <= SE_redist1_stall_entry_aunroll_o6_6_5_backEN and SE_i_unnamed_gemm_nnfw90_V0;
    -- Backward Stall generation
    SE_redist1_stall_entry_aunroll_o6_6_5_backStall <= not (SE_redist1_stall_entry_aunroll_o6_6_5_v_s_0);
    SE_redist1_stall_entry_aunroll_o6_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist1_stall_entry_aunroll_o6_6_5_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o6_6_5_backEN = "0") THEN
                SE_redist1_stall_entry_aunroll_o6_6_5_R_v_0 <= SE_redist1_stall_entry_aunroll_o6_6_5_R_v_0 and SE_redist1_stall_entry_aunroll_o6_6_5_s_tv_0;
            ELSE
                SE_redist1_stall_entry_aunroll_o6_6_5_R_v_0 <= SE_redist1_stall_entry_aunroll_o6_6_5_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_for_cond7_loopexit_loopexit_loopexit_gemm_nnfw_c0_enter67_gemm_nnfw_aunroll_x(BLACKBOX,9)@0
    -- in in_i_stall@20000000
    -- out out_c0_exit70_0@6
    -- out out_c0_exit70_1@6
    -- out out_o_stall@20000000
    -- out out_o_valid@6
    thei_sfc_c0_for_cond7_loopexit_loopexit_loopexit_gemm_nnfw_c0_enter67_gemm_nnfw_aunroll_x : i_sfc_c0_for_cond7_loopexit_loopexit_loopexit_gemm_nnfw_c0_enter67_gemm_nnfw
    PORT MAP (
        in_c0_eni166_0 => GND_q,
        in_c0_eni166_1 => bubble_select_stall_entry_aunroll_d,
        in_i_stall => SE_out_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_backStall,
        in_i_valid => SE_stall_entry_aunroll_V2,
        in_ldc => in_ldc,
        out_c0_exit70_1 => i_sfc_c0_for_cond7_loopexit_loopexit_loopexit_gemm_nnfw_c0_enter67_gemm_nnfw_aunroll_x_out_c0_exit70_1,
        out_o_stall => i_sfc_c0_for_cond7_loopexit_loopexit_loopexit_gemm_nnfw_c0_enter67_gemm_nnfw_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_cond7_loopexit_loopexit_loopexit_gemm_nnfw_c0_enter67_gemm_nnfw_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- redist4_stall_entry_aunroll_o15_5_4(REG,78)
    redist4_stall_entry_aunroll_o15_5_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_stall_entry_aunroll_o15_5_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_unnamed_gemm_nnfw90_backEN = "1") THEN
                redist4_stall_entry_aunroll_o15_5_4_q <= STD_LOGIC_VECTOR(SR_SE_i_unnamed_gemm_nnfw90_D4);
            END IF;
        END IF;
    END PROCESS;

    -- i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw(BLACKBOX,21)@5
    -- in in_stall_in@20000000
    -- out out_data_out@6
    -- out out_feedback_stall_out_11@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@6
    thei_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw : i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw97
    PORT MAP (
        in_data_in => GND_q,
        in_dir => redist4_stall_entry_aunroll_o15_5_4_q,
        in_feedback_in_11 => in_feedback_in_11,
        in_feedback_valid_in_11 => in_feedback_valid_in_11,
        in_predicate => GND_q,
        in_stall_in => SE_out_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_backStall,
        in_valid_in => SE_out_bubble_out_stall_entry_aunroll_1_V0,
        out_data_out => i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_out_data_out,
        out_feedback_stall_out_11 => i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_out_feedback_stall_out_11,
        out_stall_out => i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_out_stall_out,
        out_valid_out => i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw(STALLENABLE,113)
    -- Valid signal propagation
    SE_out_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_V0 <= SE_out_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_wireValid;
    -- Backward Stall generation
    SE_out_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_backStall <= in_stall_in or not (SE_out_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_and0 <= i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_out_valid_out;
    SE_out_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_and1 <= i_sfc_c0_for_cond7_loopexit_loopexit_loopexit_gemm_nnfw_c0_enter67_gemm_nnfw_aunroll_x_out_o_valid and SE_out_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_and0;
    SE_out_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_wireValid <= SE_redist1_stall_entry_aunroll_o6_6_5_V0 and SE_out_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_and1;

    -- redist7_i_unnamed_gemm_nnfw99_vt_select_31_b_1_0(REG,91)
    redist7_i_unnamed_gemm_nnfw99_vt_select_31_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist7_i_unnamed_gemm_nnfw99_vt_select_31_b_1_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_unnamed_gemm_nnfw90_backEN = "1") THEN
                redist7_i_unnamed_gemm_nnfw99_vt_select_31_b_1_0_q <= STD_LOGIC_VECTOR(SR_SE_i_unnamed_gemm_nnfw90_D7);
            END IF;
        END IF;
    END PROCESS;

    -- i_unnamed_gemm_nnfw99_vt_join(BITJOIN,28)@5
    i_unnamed_gemm_nnfw99_vt_join_q <= GND_q & redist7_i_unnamed_gemm_nnfw99_vt_select_31_b_1_0_q;

    -- i_op_gemm_nnfw(ADD,22)@5
    i_op_gemm_nnfw_a <= STD_LOGIC_VECTOR("0" & i_unnamed_gemm_nnfw99_vt_join_q);
    i_op_gemm_nnfw_b <= STD_LOGIC_VECTOR("0" & c_i33_1gr_q);
    i_op_gemm_nnfw_o <= STD_LOGIC_VECTOR(UNSIGNED(i_op_gemm_nnfw_a) + UNSIGNED(i_op_gemm_nnfw_b));
    i_op_gemm_nnfw_q <= i_op_gemm_nnfw_o(33 downto 0);

    -- bgTrunc_i_op_gemm_nnfw_sel_x(BITSELECT,3)@5
    bgTrunc_i_op_gemm_nnfw_sel_x_b <= i_op_gemm_nnfw_q(32 downto 0);

    -- redist9_bgTrunc_i_op_gemm_nnfw_sel_x_b_1_0(REG,93)
    redist9_bgTrunc_i_op_gemm_nnfw_sel_x_b_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_bgTrunc_i_op_gemm_nnfw_sel_x_b_1_0_q <= "000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o6_6_5_backEN = "1") THEN
                redist9_bgTrunc_i_op_gemm_nnfw_sel_x_b_1_0_q <= STD_LOGIC_VECTOR(bgTrunc_i_op_gemm_nnfw_sel_x_b);
            END IF;
        END IF;
    END PROCESS;

    -- c_i33_1gr(CONSTANT,15)
    c_i33_1gr_q <= "111111111111111111111111111111111";

    -- c_i32_1gr(CONSTANT,14)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- i_unnamed_gemm_nnfw90(COMPARE,25)@4 + 1
    i_unnamed_gemm_nnfw90_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_1gr_q(31)) & c_i32_1gr_q));
    i_unnamed_gemm_nnfw90_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => SR_SE_i_unnamed_gemm_nnfw90_D0(31)) & SR_SE_i_unnamed_gemm_nnfw90_D0));
    i_unnamed_gemm_nnfw90_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_unnamed_gemm_nnfw90_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_unnamed_gemm_nnfw90_backEN = "1") THEN
                i_unnamed_gemm_nnfw90_o <= STD_LOGIC_VECTOR(SIGNED(i_unnamed_gemm_nnfw90_a) - SIGNED(i_unnamed_gemm_nnfw90_b));
            END IF;
        END IF;
    END PROCESS;
    i_unnamed_gemm_nnfw90_c(0) <= i_unnamed_gemm_nnfw90_o(33);

    -- redist8_i_unnamed_gemm_nnfw90_c_2_0(REG,92)
    redist8_i_unnamed_gemm_nnfw90_c_2_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist8_i_unnamed_gemm_nnfw90_c_2_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o6_6_5_backEN = "1") THEN
                redist8_i_unnamed_gemm_nnfw90_c_2_0_q <= STD_LOGIC_VECTOR(i_unnamed_gemm_nnfw90_c);
            END IF;
        END IF;
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- i_unnamed_gemm_nnfw100(MUX,24)@6
    i_unnamed_gemm_nnfw100_s <= redist8_i_unnamed_gemm_nnfw90_c_2_0_q;
    i_unnamed_gemm_nnfw100_combproc: PROCESS (i_unnamed_gemm_nnfw100_s, c_i33_1gr_q, redist9_bgTrunc_i_op_gemm_nnfw_sel_x_b_1_0_q)
    BEGIN
        CASE (i_unnamed_gemm_nnfw100_s) IS
            WHEN "0" => i_unnamed_gemm_nnfw100_q <= c_i33_1gr_q;
            WHEN "1" => i_unnamed_gemm_nnfw100_q <= redist9_bgTrunc_i_op_gemm_nnfw_sel_x_b_1_0_q;
            WHEN OTHERS => i_unnamed_gemm_nnfw100_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- bubble_join_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw(BITJOIN,99)
    bubble_join_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_q <= i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_out_data_out;

    -- bubble_select_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw(BITSELECT,100)
    bubble_select_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_b <= STD_LOGIC_VECTOR(bubble_join_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_q(0 downto 0));

    -- redist3_stall_entry_aunroll_o11_6_4(REG,72)
    redist3_stall_entry_aunroll_o11_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_aunroll_o11_6_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_unnamed_gemm_nnfw90_backEN = "1") THEN
                redist3_stall_entry_aunroll_o11_6_4_q <= STD_LOGIC_VECTOR(SR_SE_i_unnamed_gemm_nnfw90_D3);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_aunroll_o11_6_5(REG,73)
    redist3_stall_entry_aunroll_o11_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_aunroll_o11_6_5_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o6_6_5_backEN = "1") THEN
                redist3_stall_entry_aunroll_o11_6_5_q <= STD_LOGIC_VECTOR(redist3_stall_entry_aunroll_o11_6_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o10_6_4(REG,66)
    redist2_stall_entry_aunroll_o10_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o10_6_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_unnamed_gemm_nnfw90_backEN = "1") THEN
                redist2_stall_entry_aunroll_o10_6_4_q <= STD_LOGIC_VECTOR(SR_SE_i_unnamed_gemm_nnfw90_D2);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o10_6_5(REG,67)
    redist2_stall_entry_aunroll_o10_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o10_6_5_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o6_6_5_backEN = "1") THEN
                redist2_stall_entry_aunroll_o10_6_5_q <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o10_6_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_sfc_c0_for_cond7_loopexit_loopexit_loopexit_gemm_nnfw_c0_enter67_gemm_nnfw_aunroll_x(BITJOIN,95)
    bubble_join_i_sfc_c0_for_cond7_loopexit_loopexit_loopexit_gemm_nnfw_c0_enter67_gemm_nnfw_aunroll_x_q <= i_sfc_c0_for_cond7_loopexit_loopexit_loopexit_gemm_nnfw_c0_enter67_gemm_nnfw_aunroll_x_out_c0_exit70_1;

    -- bubble_select_i_sfc_c0_for_cond7_loopexit_loopexit_loopexit_gemm_nnfw_c0_enter67_gemm_nnfw_aunroll_x(BITSELECT,96)
    bubble_select_i_sfc_c0_for_cond7_loopexit_loopexit_loopexit_gemm_nnfw_c0_enter67_gemm_nnfw_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_cond7_loopexit_loopexit_loopexit_gemm_nnfw_c0_enter67_gemm_nnfw_aunroll_x_q(31 downto 0));

    -- redist1_stall_entry_aunroll_o6_6_4(REG,60)
    redist1_stall_entry_aunroll_o6_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o6_6_4_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_unnamed_gemm_nnfw90_backEN = "1") THEN
                redist1_stall_entry_aunroll_o6_6_4_q <= STD_LOGIC_VECTOR(SR_SE_i_unnamed_gemm_nnfw90_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist1_stall_entry_aunroll_o6_6_5(REG,61)
    redist1_stall_entry_aunroll_o6_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist1_stall_entry_aunroll_o6_6_5_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o6_6_5_backEN = "1") THEN
                redist1_stall_entry_aunroll_o6_6_5_q <= STD_LOGIC_VECTOR(redist1_stall_entry_aunroll_o6_6_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_stall_entry_aunroll_o17_6_4(REG,89)
    redist6_stall_entry_aunroll_o17_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_aunroll_o17_6_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_unnamed_gemm_nnfw90_backEN = "1") THEN
                redist6_stall_entry_aunroll_o17_6_4_q <= STD_LOGIC_VECTOR(SR_SE_i_unnamed_gemm_nnfw90_D6);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_stall_entry_aunroll_o17_6_5(REG,90)
    redist6_stall_entry_aunroll_o17_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist6_stall_entry_aunroll_o17_6_5_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o6_6_5_backEN = "1") THEN
                redist6_stall_entry_aunroll_o17_6_5_q <= STD_LOGIC_VECTOR(redist6_stall_entry_aunroll_o17_6_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_stall_entry_aunroll_o16_6_4(REG,83)
    redist5_stall_entry_aunroll_o16_6_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_stall_entry_aunroll_o16_6_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_unnamed_gemm_nnfw90_backEN = "1") THEN
                redist5_stall_entry_aunroll_o16_6_4_q <= STD_LOGIC_VECTOR(SR_SE_i_unnamed_gemm_nnfw90_D5);
            END IF;
        END IF;
    END PROCESS;

    -- redist5_stall_entry_aunroll_o16_6_5(REG,84)
    redist5_stall_entry_aunroll_o16_6_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist5_stall_entry_aunroll_o16_6_5_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist1_stall_entry_aunroll_o6_6_5_backEN = "1") THEN
                redist5_stall_entry_aunroll_o16_6_5_q <= STD_LOGIC_VECTOR(redist5_stall_entry_aunroll_o16_6_4_q);
            END IF;
        END IF;
    END PROCESS;

    -- dupName_0_sync_out_x(GPOUT,8)@6
    out_c0_exe11 <= redist5_stall_entry_aunroll_o16_6_5_q;
    out_c0_exe12 <= redist6_stall_entry_aunroll_o17_6_5_q;
    out_c0_exe163 <= redist1_stall_entry_aunroll_o6_6_5_q;
    out_c0_exe171 <= bubble_select_i_sfc_c0_for_cond7_loopexit_loopexit_loopexit_gemm_nnfw_c0_enter67_gemm_nnfw_aunroll_x_b;
    out_c0_exe5 <= redist2_stall_entry_aunroll_o10_6_5_q;
    out_c0_exe6 <= redist3_stall_entry_aunroll_o11_6_5_q;
    out_memdep_phi6_pop11 <= bubble_select_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_b;
    out_unnamed_gemm_nnfW2 <= i_unnamed_gemm_nnfw100_q;
    out_valid_out <= SE_out_i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_V0;

    -- feedback_stall_out_11_sync(GPOUT,19)
    out_feedback_stall_out_11 <= i_acl_pop_i1_memdep_phi6_pop11_gemm_nnfw_out_feedback_stall_out_11;

    -- sync_out(GPOUT,38)@0
    out_stall_out <= SE_stall_entry_aunroll_backStall;

END normal;
