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

-- VHDL created from bb_gemm_nnfW_B6_stall_region
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

entity bb_gemm_nnfW_B6_stall_region is
    port (
        in_c0_exe71515 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe81527 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1443_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1443_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1443_2 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit1443_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1443_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1443_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1443_6 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit1443_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1443_8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1443_9 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit1443_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1443_11 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe117110 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit1708_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit1708_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit1708_2 : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_memdep_5_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11155 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe71515 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe81527 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe117110 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_5_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memdep_5_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_5_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memdep_5_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_5_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_5_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_5_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memdep_5_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_5_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nnfW_B6_stall_region;

architecture normal of bb_gemm_nnfW_B6_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw is
        port (
            in_c0_eni3174_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni3174_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni3174_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni3174_3 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit180_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit180_1 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_memdep_5_gemm_nnfw1316 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_writedata : in std_logic_vector(15 downto 0);  -- Floating Point
            in_memdep_5_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memdep_5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_5_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_memdep_5_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_5_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memdep_5_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memdep_5_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_5_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_5_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_5_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_5_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_writeack : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component acl_data_fifo is
        generic (
            DEPTH : INTEGER := 0;
            DATA_WIDTH : INTEGER := 32;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0;
            IMPL : STRING := "ram"
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            data_in : in std_logic_vector(DATA_WIDTH - 1 downto 0);
            valid_out : out std_logic;
            stall_out : out std_logic;
            data_out : out std_logic_vector(DATA_WIDTH - 1 downto 0);
            full : out std_logic;
            almost_full : out std_logic
        );
    end component;





    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_out_c0_exit180_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_c1_exe2_gemm_nnfw_vt_const_63_q : STD_LOGIC_VECTOR (26 downto 0);
    signal i_c1_exe2_gemm_nnfw_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_c1_exe2_gemm_nnfw_vt_select_36_b : STD_LOGIC_VECTOR (36 downto 0);
    signal i_store_memdep_5_gemm_nnfw_out_lsu_memdep_5_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_5_gemm_nnfw_out_memdep_5_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_store_memdep_5_gemm_nnfw_out_memdep_5_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_store_memdep_5_gemm_nnfw_out_memdep_5_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_memdep_5_gemm_nnfw_out_memdep_5_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_5_gemm_nnfw_out_memdep_5_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_5_gemm_nnfw_out_memdep_5_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_5_gemm_nnfw_out_memdep_5_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_store_memdep_5_gemm_nnfw_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_5_gemm_nnfw_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_5_gemm_nnfw_out_o_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_aunroll_o4_35_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_aunroll_o4_35_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_stall_entry_aunroll_o4_35_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_aunroll_o4_35_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_stall_entry_aunroll_o4_35_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_aunroll_o4_35_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_aunroll_o4_35_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_stall_entry_aunroll_o4_35_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_aunroll_o4_35_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_stall_entry_aunroll_o4_35_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o5_35_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o5_35_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_stall_entry_aunroll_o5_35_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o5_35_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_stall_entry_aunroll_o5_35_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o5_35_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o5_35_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_stall_entry_aunroll_o5_35_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_stall_entry_aunroll_o5_35_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_stall_entry_aunroll_o5_35_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_stall_entry_aunroll_o15_7_0_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_stall_entry_aunroll_o15_7_1_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_stall_entry_aunroll_o15_7_2_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_stall_entry_aunroll_o15_7_3_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_stall_entry_aunroll_o15_7_4_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_stall_entry_aunroll_o15_7_5_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_stall_entry_aunroll_o15_7_6_q : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_stall_entry_aunroll_o16_7_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_aunroll_o16_7_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_aunroll_o16_7_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_aunroll_o16_7_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_aunroll_o16_7_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_aunroll_o16_7_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_stall_entry_aunroll_o16_7_6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_aunroll_o17_35_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_aunroll_o17_35_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist4_stall_entry_aunroll_o17_35_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_aunroll_o17_35_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist4_stall_entry_aunroll_o17_35_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_aunroll_o17_35_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_aunroll_o17_35_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist4_stall_entry_aunroll_o17_35_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_stall_entry_aunroll_o17_35_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist4_stall_entry_aunroll_o17_35_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o18_35_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o18_35_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_stall_entry_aunroll_o18_35_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o18_35_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_stall_entry_aunroll_o18_35_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o18_35_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o18_35_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_stall_entry_aunroll_o18_35_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_stall_entry_aunroll_o18_35_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_stall_entry_aunroll_o18_35_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_join_i_store_memdep_5_gemm_nnfw_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_store_memdep_5_gemm_nnfw_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_stall_entry_aunroll_q : STD_LOGIC_VECTOR (197 downto 0);
    signal bubble_select_stall_entry_aunroll_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_e : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_aunroll_f : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_stall_entry_aunroll_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_i : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_aunroll_j : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist0_stall_entry_aunroll_o4_35_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist0_stall_entry_aunroll_o4_35_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist1_stall_entry_aunroll_o5_35_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist1_stall_entry_aunroll_o5_35_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist4_stall_entry_aunroll_o17_35_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist4_stall_entry_aunroll_o17_35_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist5_stall_entry_aunroll_o18_35_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist5_stall_entry_aunroll_o18_35_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
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
    signal SE_stall_entry_aunroll_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_aunroll_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_4_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_4_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_4_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_4_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_5_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_5_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_5_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_5_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_5_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_6_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_6_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_6_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_6_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_6_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist2_stall_entry_aunroll_o15_7_6_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_stall_entry_aunroll_o18_35_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_stall_entry_aunroll_o18_35_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_stall_entry_aunroll_o18_35_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_stall_entry_aunroll_o18_35_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_stall_entry_aunroll_o18_35_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_stall_entry_aunroll_o18_35_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist5_stall_entry_aunroll_o18_35_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_1_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_1_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_1_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_1_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_1_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_1_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_1_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_3_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_3_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_3_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_3_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_3_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_3_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_3_D1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_5_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_5_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_5_r_data0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_5_r_data1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_5_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_5_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_5_D0 : STD_LOGIC_VECTOR (63 downto 0);
    signal SR_SE_redist2_stall_entry_aunroll_o15_7_5_D1 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- redist5_stall_entry_aunroll_o18_35_fifo(STALLFIFO,47)
    redist5_stall_entry_aunroll_o18_35_fifo_valid_in <= SE_stall_entry_aunroll_V4;
    redist5_stall_entry_aunroll_o18_35_fifo_stall_in <= SE_out_redist5_stall_entry_aunroll_o18_35_fifo_backStall;
    redist5_stall_entry_aunroll_o18_35_fifo_data_in <= bubble_select_stall_entry_aunroll_i;
    redist5_stall_entry_aunroll_o18_35_fifo_valid_in_bitsignaltemp <= redist5_stall_entry_aunroll_o18_35_fifo_valid_in(0);
    redist5_stall_entry_aunroll_o18_35_fifo_stall_in_bitsignaltemp <= redist5_stall_entry_aunroll_o18_35_fifo_stall_in(0);
    redist5_stall_entry_aunroll_o18_35_fifo_valid_out(0) <= redist5_stall_entry_aunroll_o18_35_fifo_valid_out_bitsignaltemp;
    redist5_stall_entry_aunroll_o18_35_fifo_stall_out(0) <= redist5_stall_entry_aunroll_o18_35_fifo_stall_out_bitsignaltemp;
    theredist5_stall_entry_aunroll_o18_35_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 36,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_stall_entry_aunroll_o18_35_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_stall_entry_aunroll_o18_35_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_aunroll_i,
        valid_out => redist5_stall_entry_aunroll_o18_35_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_stall_entry_aunroll_o18_35_fifo_stall_out_bitsignaltemp,
        data_out => redist5_stall_entry_aunroll_o18_35_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist4_stall_entry_aunroll_o17_35_fifo(STALLFIFO,46)
    redist4_stall_entry_aunroll_o17_35_fifo_valid_in <= SE_stall_entry_aunroll_V3;
    redist4_stall_entry_aunroll_o17_35_fifo_stall_in <= SE_out_redist5_stall_entry_aunroll_o18_35_fifo_backStall;
    redist4_stall_entry_aunroll_o17_35_fifo_data_in <= bubble_select_stall_entry_aunroll_h;
    redist4_stall_entry_aunroll_o17_35_fifo_valid_in_bitsignaltemp <= redist4_stall_entry_aunroll_o17_35_fifo_valid_in(0);
    redist4_stall_entry_aunroll_o17_35_fifo_stall_in_bitsignaltemp <= redist4_stall_entry_aunroll_o17_35_fifo_stall_in(0);
    redist4_stall_entry_aunroll_o17_35_fifo_valid_out(0) <= redist4_stall_entry_aunroll_o17_35_fifo_valid_out_bitsignaltemp;
    redist4_stall_entry_aunroll_o17_35_fifo_stall_out(0) <= redist4_stall_entry_aunroll_o17_35_fifo_stall_out_bitsignaltemp;
    theredist4_stall_entry_aunroll_o17_35_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 36,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist4_stall_entry_aunroll_o17_35_fifo_valid_in_bitsignaltemp,
        stall_in => redist4_stall_entry_aunroll_o17_35_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_aunroll_h,
        valid_out => redist4_stall_entry_aunroll_o17_35_fifo_valid_out_bitsignaltemp,
        stall_out => redist4_stall_entry_aunroll_o17_35_fifo_stall_out_bitsignaltemp,
        data_out => redist4_stall_entry_aunroll_o17_35_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist1_stall_entry_aunroll_o5_35_fifo(STALLFIFO,31)
    redist1_stall_entry_aunroll_o5_35_fifo_valid_in <= SE_stall_entry_aunroll_V2;
    redist1_stall_entry_aunroll_o5_35_fifo_stall_in <= SE_out_redist5_stall_entry_aunroll_o18_35_fifo_backStall;
    redist1_stall_entry_aunroll_o5_35_fifo_data_in <= bubble_select_stall_entry_aunroll_c;
    redist1_stall_entry_aunroll_o5_35_fifo_valid_in_bitsignaltemp <= redist1_stall_entry_aunroll_o5_35_fifo_valid_in(0);
    redist1_stall_entry_aunroll_o5_35_fifo_stall_in_bitsignaltemp <= redist1_stall_entry_aunroll_o5_35_fifo_stall_in(0);
    redist1_stall_entry_aunroll_o5_35_fifo_valid_out(0) <= redist1_stall_entry_aunroll_o5_35_fifo_valid_out_bitsignaltemp;
    redist1_stall_entry_aunroll_o5_35_fifo_stall_out(0) <= redist1_stall_entry_aunroll_o5_35_fifo_stall_out_bitsignaltemp;
    theredist1_stall_entry_aunroll_o5_35_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 36,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_stall_entry_aunroll_o5_35_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_stall_entry_aunroll_o5_35_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_aunroll_c,
        valid_out => redist1_stall_entry_aunroll_o5_35_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_stall_entry_aunroll_o5_35_fifo_stall_out_bitsignaltemp,
        data_out => redist1_stall_entry_aunroll_o5_35_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist0_stall_entry_aunroll_o4_35_fifo(STALLFIFO,30)
    redist0_stall_entry_aunroll_o4_35_fifo_valid_in <= SE_stall_entry_aunroll_V1;
    redist0_stall_entry_aunroll_o4_35_fifo_stall_in <= SE_out_redist5_stall_entry_aunroll_o18_35_fifo_backStall;
    redist0_stall_entry_aunroll_o4_35_fifo_data_in <= bubble_select_stall_entry_aunroll_b;
    redist0_stall_entry_aunroll_o4_35_fifo_valid_in_bitsignaltemp <= redist0_stall_entry_aunroll_o4_35_fifo_valid_in(0);
    redist0_stall_entry_aunroll_o4_35_fifo_stall_in_bitsignaltemp <= redist0_stall_entry_aunroll_o4_35_fifo_stall_in(0);
    redist0_stall_entry_aunroll_o4_35_fifo_valid_out(0) <= redist0_stall_entry_aunroll_o4_35_fifo_valid_out_bitsignaltemp;
    redist0_stall_entry_aunroll_o4_35_fifo_stall_out(0) <= redist0_stall_entry_aunroll_o4_35_fifo_stall_out_bitsignaltemp;
    theredist0_stall_entry_aunroll_o4_35_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 36,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_stall_entry_aunroll_o4_35_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_stall_entry_aunroll_o4_35_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_stall_entry_aunroll_b,
        valid_out => redist0_stall_entry_aunroll_o4_35_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_stall_entry_aunroll_o4_35_fifo_stall_out_bitsignaltemp,
        data_out => redist0_stall_entry_aunroll_o4_35_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist3_stall_entry_aunroll_o16_7_0(REG,39)
    redist3_stall_entry_aunroll_o16_7_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_aunroll_o16_7_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_stall_entry_aunroll_o15_7_0_backEN = "1") THEN
                redist3_stall_entry_aunroll_o16_7_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_g);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o15_7_0(REG,32)
    redist2_stall_entry_aunroll_o15_7_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o15_7_0_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_stall_entry_aunroll_o15_7_0_backEN = "1") THEN
                redist2_stall_entry_aunroll_o15_7_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_aunroll_f);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_aunroll_o16_7_1(REG,40)
    redist3_stall_entry_aunroll_o16_7_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_aunroll_o16_7_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_stall_entry_aunroll_o15_7_1_backEN = "1") THEN
                redist3_stall_entry_aunroll_o16_7_1_q <= STD_LOGIC_VECTOR(SR_SE_redist2_stall_entry_aunroll_o15_7_1_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_aunroll_o16_7_2(REG,41)
    redist3_stall_entry_aunroll_o16_7_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_aunroll_o16_7_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_stall_entry_aunroll_o15_7_2_backEN = "1") THEN
                redist3_stall_entry_aunroll_o16_7_2_q <= STD_LOGIC_VECTOR(redist3_stall_entry_aunroll_o16_7_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o15_7_1(REG,33)
    redist2_stall_entry_aunroll_o15_7_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o15_7_1_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_stall_entry_aunroll_o15_7_1_backEN = "1") THEN
                redist2_stall_entry_aunroll_o15_7_1_q <= STD_LOGIC_VECTOR(SR_SE_redist2_stall_entry_aunroll_o15_7_1_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o15_7_2(REG,34)
    redist2_stall_entry_aunroll_o15_7_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o15_7_2_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_stall_entry_aunroll_o15_7_2_backEN = "1") THEN
                redist2_stall_entry_aunroll_o15_7_2_q <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o15_7_1_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_aunroll_o16_7_3(REG,42)
    redist3_stall_entry_aunroll_o16_7_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_aunroll_o16_7_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_stall_entry_aunroll_o15_7_3_backEN = "1") THEN
                redist3_stall_entry_aunroll_o16_7_3_q <= STD_LOGIC_VECTOR(SR_SE_redist2_stall_entry_aunroll_o15_7_3_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_aunroll_o16_7_4(REG,43)
    redist3_stall_entry_aunroll_o16_7_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_aunroll_o16_7_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_stall_entry_aunroll_o15_7_4_backEN = "1") THEN
                redist3_stall_entry_aunroll_o16_7_4_q <= STD_LOGIC_VECTOR(redist3_stall_entry_aunroll_o16_7_3_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o15_7_3(REG,35)
    redist2_stall_entry_aunroll_o15_7_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o15_7_3_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_stall_entry_aunroll_o15_7_3_backEN = "1") THEN
                redist2_stall_entry_aunroll_o15_7_3_q <= STD_LOGIC_VECTOR(SR_SE_redist2_stall_entry_aunroll_o15_7_3_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o15_7_4(REG,36)
    redist2_stall_entry_aunroll_o15_7_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o15_7_4_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_stall_entry_aunroll_o15_7_4_backEN = "1") THEN
                redist2_stall_entry_aunroll_o15_7_4_q <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o15_7_3_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist2_stall_entry_aunroll_o15_7_6(STALLENABLE,89)
    -- Valid signal propagation
    SE_redist2_stall_entry_aunroll_o15_7_6_V0 <= SE_redist2_stall_entry_aunroll_o15_7_6_R_v_0;
    -- Stall signal propagation
    SE_redist2_stall_entry_aunroll_o15_7_6_s_tv_0 <= SE_out_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_backStall and SE_redist2_stall_entry_aunroll_o15_7_6_R_v_0;
    -- Backward Enable generation
    SE_redist2_stall_entry_aunroll_o15_7_6_backEN <= not (SE_redist2_stall_entry_aunroll_o15_7_6_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_stall_entry_aunroll_o15_7_6_v_s_0 <= SE_redist2_stall_entry_aunroll_o15_7_6_backEN and SE_redist2_stall_entry_aunroll_o15_7_5_V0;
    -- Backward Stall generation
    SE_redist2_stall_entry_aunroll_o15_7_6_backStall <= not (SE_redist2_stall_entry_aunroll_o15_7_6_v_s_0);
    SE_redist2_stall_entry_aunroll_o15_7_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_stall_entry_aunroll_o15_7_6_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_stall_entry_aunroll_o15_7_6_backEN = "0") THEN
                SE_redist2_stall_entry_aunroll_o15_7_6_R_v_0 <= SE_redist2_stall_entry_aunroll_o15_7_6_R_v_0 and SE_redist2_stall_entry_aunroll_o15_7_6_s_tv_0;
            ELSE
                SE_redist2_stall_entry_aunroll_o15_7_6_R_v_0 <= SE_redist2_stall_entry_aunroll_o15_7_6_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist2_stall_entry_aunroll_o15_7_5(STALLENABLE,88)
    -- Valid signal propagation
    SE_redist2_stall_entry_aunroll_o15_7_5_V0 <= SE_redist2_stall_entry_aunroll_o15_7_5_R_v_0;
    -- Stall signal propagation
    SE_redist2_stall_entry_aunroll_o15_7_5_s_tv_0 <= SE_redist2_stall_entry_aunroll_o15_7_6_backStall and SE_redist2_stall_entry_aunroll_o15_7_5_R_v_0;
    -- Backward Enable generation
    SE_redist2_stall_entry_aunroll_o15_7_5_backEN <= not (SE_redist2_stall_entry_aunroll_o15_7_5_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_stall_entry_aunroll_o15_7_5_v_s_0 <= SE_redist2_stall_entry_aunroll_o15_7_5_backEN and SR_SE_redist2_stall_entry_aunroll_o15_7_5_V;
    -- Backward Stall generation
    SE_redist2_stall_entry_aunroll_o15_7_5_backStall <= not (SE_redist2_stall_entry_aunroll_o15_7_5_backEN);
    SE_redist2_stall_entry_aunroll_o15_7_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_stall_entry_aunroll_o15_7_5_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_stall_entry_aunroll_o15_7_5_backEN = "0") THEN
                SE_redist2_stall_entry_aunroll_o15_7_5_R_v_0 <= SE_redist2_stall_entry_aunroll_o15_7_5_R_v_0 and SE_redist2_stall_entry_aunroll_o15_7_5_s_tv_0;
            ELSE
                SE_redist2_stall_entry_aunroll_o15_7_5_R_v_0 <= SE_redist2_stall_entry_aunroll_o15_7_5_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist2_stall_entry_aunroll_o15_7_5(STALLREG,135)
    SR_SE_redist2_stall_entry_aunroll_o15_7_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist2_stall_entry_aunroll_o15_7_5_r_valid <= (others => '0');
            SR_SE_redist2_stall_entry_aunroll_o15_7_5_r_data0 <= (others => '-');
            SR_SE_redist2_stall_entry_aunroll_o15_7_5_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist2_stall_entry_aunroll_o15_7_5_r_valid <= SE_redist2_stall_entry_aunroll_o15_7_5_backStall and (SR_SE_redist2_stall_entry_aunroll_o15_7_5_r_valid or SR_SE_redist2_stall_entry_aunroll_o15_7_5_i_valid);

            IF (SR_SE_redist2_stall_entry_aunroll_o15_7_5_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist2_stall_entry_aunroll_o15_7_5_r_data0 <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o15_7_4_q);
                SR_SE_redist2_stall_entry_aunroll_o15_7_5_r_data1 <= STD_LOGIC_VECTOR(redist3_stall_entry_aunroll_o16_7_4_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist2_stall_entry_aunroll_o15_7_5_i_valid <= SE_redist2_stall_entry_aunroll_o15_7_4_V0;
    -- Stall signal propagation
    SR_SE_redist2_stall_entry_aunroll_o15_7_5_backStall <= SR_SE_redist2_stall_entry_aunroll_o15_7_5_r_valid or not (SR_SE_redist2_stall_entry_aunroll_o15_7_5_i_valid);

    -- Valid
    SR_SE_redist2_stall_entry_aunroll_o15_7_5_V <= SR_SE_redist2_stall_entry_aunroll_o15_7_5_r_valid WHEN SR_SE_redist2_stall_entry_aunroll_o15_7_5_r_valid = "1" ELSE SR_SE_redist2_stall_entry_aunroll_o15_7_5_i_valid;

    -- Data0
    SR_SE_redist2_stall_entry_aunroll_o15_7_5_D0 <= SR_SE_redist2_stall_entry_aunroll_o15_7_5_r_data0 WHEN SR_SE_redist2_stall_entry_aunroll_o15_7_5_r_valid = "1" ELSE redist2_stall_entry_aunroll_o15_7_4_q;
    -- Data1
    SR_SE_redist2_stall_entry_aunroll_o15_7_5_D1 <= SR_SE_redist2_stall_entry_aunroll_o15_7_5_r_data1 WHEN SR_SE_redist2_stall_entry_aunroll_o15_7_5_r_valid = "1" ELSE redist3_stall_entry_aunroll_o16_7_4_q;

    -- SE_redist2_stall_entry_aunroll_o15_7_4(STALLENABLE,87)
    -- Valid signal propagation
    SE_redist2_stall_entry_aunroll_o15_7_4_V0 <= SE_redist2_stall_entry_aunroll_o15_7_4_R_v_0;
    -- Stall signal propagation
    SE_redist2_stall_entry_aunroll_o15_7_4_s_tv_0 <= SR_SE_redist2_stall_entry_aunroll_o15_7_5_backStall and SE_redist2_stall_entry_aunroll_o15_7_4_R_v_0;
    -- Backward Enable generation
    SE_redist2_stall_entry_aunroll_o15_7_4_backEN <= not (SE_redist2_stall_entry_aunroll_o15_7_4_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_stall_entry_aunroll_o15_7_4_v_s_0 <= SE_redist2_stall_entry_aunroll_o15_7_4_backEN and SE_redist2_stall_entry_aunroll_o15_7_3_V0;
    -- Backward Stall generation
    SE_redist2_stall_entry_aunroll_o15_7_4_backStall <= not (SE_redist2_stall_entry_aunroll_o15_7_4_v_s_0);
    SE_redist2_stall_entry_aunroll_o15_7_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_stall_entry_aunroll_o15_7_4_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_stall_entry_aunroll_o15_7_4_backEN = "0") THEN
                SE_redist2_stall_entry_aunroll_o15_7_4_R_v_0 <= SE_redist2_stall_entry_aunroll_o15_7_4_R_v_0 and SE_redist2_stall_entry_aunroll_o15_7_4_s_tv_0;
            ELSE
                SE_redist2_stall_entry_aunroll_o15_7_4_R_v_0 <= SE_redist2_stall_entry_aunroll_o15_7_4_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist2_stall_entry_aunroll_o15_7_3(STALLENABLE,86)
    -- Valid signal propagation
    SE_redist2_stall_entry_aunroll_o15_7_3_V0 <= SE_redist2_stall_entry_aunroll_o15_7_3_R_v_0;
    -- Stall signal propagation
    SE_redist2_stall_entry_aunroll_o15_7_3_s_tv_0 <= SE_redist2_stall_entry_aunroll_o15_7_4_backStall and SE_redist2_stall_entry_aunroll_o15_7_3_R_v_0;
    -- Backward Enable generation
    SE_redist2_stall_entry_aunroll_o15_7_3_backEN <= not (SE_redist2_stall_entry_aunroll_o15_7_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_stall_entry_aunroll_o15_7_3_v_s_0 <= SE_redist2_stall_entry_aunroll_o15_7_3_backEN and SR_SE_redist2_stall_entry_aunroll_o15_7_3_V;
    -- Backward Stall generation
    SE_redist2_stall_entry_aunroll_o15_7_3_backStall <= not (SE_redist2_stall_entry_aunroll_o15_7_3_backEN);
    SE_redist2_stall_entry_aunroll_o15_7_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_stall_entry_aunroll_o15_7_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_stall_entry_aunroll_o15_7_3_backEN = "0") THEN
                SE_redist2_stall_entry_aunroll_o15_7_3_R_v_0 <= SE_redist2_stall_entry_aunroll_o15_7_3_R_v_0 and SE_redist2_stall_entry_aunroll_o15_7_3_s_tv_0;
            ELSE
                SE_redist2_stall_entry_aunroll_o15_7_3_R_v_0 <= SE_redist2_stall_entry_aunroll_o15_7_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist2_stall_entry_aunroll_o15_7_3(STALLREG,134)
    SR_SE_redist2_stall_entry_aunroll_o15_7_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist2_stall_entry_aunroll_o15_7_3_r_valid <= (others => '0');
            SR_SE_redist2_stall_entry_aunroll_o15_7_3_r_data0 <= (others => '-');
            SR_SE_redist2_stall_entry_aunroll_o15_7_3_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist2_stall_entry_aunroll_o15_7_3_r_valid <= SE_redist2_stall_entry_aunroll_o15_7_3_backStall and (SR_SE_redist2_stall_entry_aunroll_o15_7_3_r_valid or SR_SE_redist2_stall_entry_aunroll_o15_7_3_i_valid);

            IF (SR_SE_redist2_stall_entry_aunroll_o15_7_3_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist2_stall_entry_aunroll_o15_7_3_r_data0 <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o15_7_2_q);
                SR_SE_redist2_stall_entry_aunroll_o15_7_3_r_data1 <= STD_LOGIC_VECTOR(redist3_stall_entry_aunroll_o16_7_2_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist2_stall_entry_aunroll_o15_7_3_i_valid <= SE_redist2_stall_entry_aunroll_o15_7_2_V0;
    -- Stall signal propagation
    SR_SE_redist2_stall_entry_aunroll_o15_7_3_backStall <= SR_SE_redist2_stall_entry_aunroll_o15_7_3_r_valid or not (SR_SE_redist2_stall_entry_aunroll_o15_7_3_i_valid);

    -- Valid
    SR_SE_redist2_stall_entry_aunroll_o15_7_3_V <= SR_SE_redist2_stall_entry_aunroll_o15_7_3_r_valid WHEN SR_SE_redist2_stall_entry_aunroll_o15_7_3_r_valid = "1" ELSE SR_SE_redist2_stall_entry_aunroll_o15_7_3_i_valid;

    -- Data0
    SR_SE_redist2_stall_entry_aunroll_o15_7_3_D0 <= SR_SE_redist2_stall_entry_aunroll_o15_7_3_r_data0 WHEN SR_SE_redist2_stall_entry_aunroll_o15_7_3_r_valid = "1" ELSE redist2_stall_entry_aunroll_o15_7_2_q;
    -- Data1
    SR_SE_redist2_stall_entry_aunroll_o15_7_3_D1 <= SR_SE_redist2_stall_entry_aunroll_o15_7_3_r_data1 WHEN SR_SE_redist2_stall_entry_aunroll_o15_7_3_r_valid = "1" ELSE redist3_stall_entry_aunroll_o16_7_2_q;

    -- SE_redist2_stall_entry_aunroll_o15_7_2(STALLENABLE,85)
    -- Valid signal propagation
    SE_redist2_stall_entry_aunroll_o15_7_2_V0 <= SE_redist2_stall_entry_aunroll_o15_7_2_R_v_0;
    -- Stall signal propagation
    SE_redist2_stall_entry_aunroll_o15_7_2_s_tv_0 <= SR_SE_redist2_stall_entry_aunroll_o15_7_3_backStall and SE_redist2_stall_entry_aunroll_o15_7_2_R_v_0;
    -- Backward Enable generation
    SE_redist2_stall_entry_aunroll_o15_7_2_backEN <= not (SE_redist2_stall_entry_aunroll_o15_7_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_stall_entry_aunroll_o15_7_2_v_s_0 <= SE_redist2_stall_entry_aunroll_o15_7_2_backEN and SE_redist2_stall_entry_aunroll_o15_7_1_V0;
    -- Backward Stall generation
    SE_redist2_stall_entry_aunroll_o15_7_2_backStall <= not (SE_redist2_stall_entry_aunroll_o15_7_2_v_s_0);
    SE_redist2_stall_entry_aunroll_o15_7_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_stall_entry_aunroll_o15_7_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_stall_entry_aunroll_o15_7_2_backEN = "0") THEN
                SE_redist2_stall_entry_aunroll_o15_7_2_R_v_0 <= SE_redist2_stall_entry_aunroll_o15_7_2_R_v_0 and SE_redist2_stall_entry_aunroll_o15_7_2_s_tv_0;
            ELSE
                SE_redist2_stall_entry_aunroll_o15_7_2_R_v_0 <= SE_redist2_stall_entry_aunroll_o15_7_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist2_stall_entry_aunroll_o15_7_1(STALLENABLE,84)
    -- Valid signal propagation
    SE_redist2_stall_entry_aunroll_o15_7_1_V0 <= SE_redist2_stall_entry_aunroll_o15_7_1_R_v_0;
    -- Stall signal propagation
    SE_redist2_stall_entry_aunroll_o15_7_1_s_tv_0 <= SE_redist2_stall_entry_aunroll_o15_7_2_backStall and SE_redist2_stall_entry_aunroll_o15_7_1_R_v_0;
    -- Backward Enable generation
    SE_redist2_stall_entry_aunroll_o15_7_1_backEN <= not (SE_redist2_stall_entry_aunroll_o15_7_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_stall_entry_aunroll_o15_7_1_v_s_0 <= SE_redist2_stall_entry_aunroll_o15_7_1_backEN and SR_SE_redist2_stall_entry_aunroll_o15_7_1_V;
    -- Backward Stall generation
    SE_redist2_stall_entry_aunroll_o15_7_1_backStall <= not (SE_redist2_stall_entry_aunroll_o15_7_1_backEN);
    SE_redist2_stall_entry_aunroll_o15_7_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_stall_entry_aunroll_o15_7_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_stall_entry_aunroll_o15_7_1_backEN = "0") THEN
                SE_redist2_stall_entry_aunroll_o15_7_1_R_v_0 <= SE_redist2_stall_entry_aunroll_o15_7_1_R_v_0 and SE_redist2_stall_entry_aunroll_o15_7_1_s_tv_0;
            ELSE
                SE_redist2_stall_entry_aunroll_o15_7_1_R_v_0 <= SE_redist2_stall_entry_aunroll_o15_7_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist2_stall_entry_aunroll_o15_7_1(STALLREG,133)
    SR_SE_redist2_stall_entry_aunroll_o15_7_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist2_stall_entry_aunroll_o15_7_1_r_valid <= (others => '0');
            SR_SE_redist2_stall_entry_aunroll_o15_7_1_r_data0 <= (others => '-');
            SR_SE_redist2_stall_entry_aunroll_o15_7_1_r_data1 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist2_stall_entry_aunroll_o15_7_1_r_valid <= SE_redist2_stall_entry_aunroll_o15_7_1_backStall and (SR_SE_redist2_stall_entry_aunroll_o15_7_1_r_valid or SR_SE_redist2_stall_entry_aunroll_o15_7_1_i_valid);

            IF (SR_SE_redist2_stall_entry_aunroll_o15_7_1_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist2_stall_entry_aunroll_o15_7_1_r_data0 <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o15_7_0_q);
                SR_SE_redist2_stall_entry_aunroll_o15_7_1_r_data1 <= STD_LOGIC_VECTOR(redist3_stall_entry_aunroll_o16_7_0_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist2_stall_entry_aunroll_o15_7_1_i_valid <= SE_redist2_stall_entry_aunroll_o15_7_0_V0;
    -- Stall signal propagation
    SR_SE_redist2_stall_entry_aunroll_o15_7_1_backStall <= SR_SE_redist2_stall_entry_aunroll_o15_7_1_r_valid or not (SR_SE_redist2_stall_entry_aunroll_o15_7_1_i_valid);

    -- Valid
    SR_SE_redist2_stall_entry_aunroll_o15_7_1_V <= SR_SE_redist2_stall_entry_aunroll_o15_7_1_r_valid WHEN SR_SE_redist2_stall_entry_aunroll_o15_7_1_r_valid = "1" ELSE SR_SE_redist2_stall_entry_aunroll_o15_7_1_i_valid;

    -- Data0
    SR_SE_redist2_stall_entry_aunroll_o15_7_1_D0 <= SR_SE_redist2_stall_entry_aunroll_o15_7_1_r_data0 WHEN SR_SE_redist2_stall_entry_aunroll_o15_7_1_r_valid = "1" ELSE redist2_stall_entry_aunroll_o15_7_0_q;
    -- Data1
    SR_SE_redist2_stall_entry_aunroll_o15_7_1_D1 <= SR_SE_redist2_stall_entry_aunroll_o15_7_1_r_data1 WHEN SR_SE_redist2_stall_entry_aunroll_o15_7_1_r_valid = "1" ELSE redist3_stall_entry_aunroll_o16_7_0_q;

    -- SE_redist2_stall_entry_aunroll_o15_7_0(STALLENABLE,83)
    -- Valid signal propagation
    SE_redist2_stall_entry_aunroll_o15_7_0_V0 <= SE_redist2_stall_entry_aunroll_o15_7_0_R_v_0;
    -- Stall signal propagation
    SE_redist2_stall_entry_aunroll_o15_7_0_s_tv_0 <= SR_SE_redist2_stall_entry_aunroll_o15_7_1_backStall and SE_redist2_stall_entry_aunroll_o15_7_0_R_v_0;
    -- Backward Enable generation
    SE_redist2_stall_entry_aunroll_o15_7_0_backEN <= not (SE_redist2_stall_entry_aunroll_o15_7_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist2_stall_entry_aunroll_o15_7_0_v_s_0 <= SE_redist2_stall_entry_aunroll_o15_7_0_backEN and SE_stall_entry_aunroll_V0;
    -- Backward Stall generation
    SE_redist2_stall_entry_aunroll_o15_7_0_backStall <= not (SE_redist2_stall_entry_aunroll_o15_7_0_v_s_0);
    SE_redist2_stall_entry_aunroll_o15_7_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist2_stall_entry_aunroll_o15_7_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_stall_entry_aunroll_o15_7_0_backEN = "0") THEN
                SE_redist2_stall_entry_aunroll_o15_7_0_R_v_0 <= SE_redist2_stall_entry_aunroll_o15_7_0_R_v_0 and SE_redist2_stall_entry_aunroll_o15_7_0_s_tv_0;
            ELSE
                SE_redist2_stall_entry_aunroll_o15_7_0_R_v_0 <= SE_redist2_stall_entry_aunroll_o15_7_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_stall_entry_aunroll(STALLENABLE,77)
    SE_stall_entry_aunroll_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_stall_entry_aunroll_fromReg0 <= (others => '0');
            SE_stall_entry_aunroll_fromReg1 <= (others => '0');
            SE_stall_entry_aunroll_fromReg2 <= (others => '0');
            SE_stall_entry_aunroll_fromReg3 <= (others => '0');
            SE_stall_entry_aunroll_fromReg4 <= (others => '0');
            SE_stall_entry_aunroll_fromReg5 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_stall_entry_aunroll_fromReg0 <= SE_stall_entry_aunroll_toReg0;
            -- Succesor 1
            SE_stall_entry_aunroll_fromReg1 <= SE_stall_entry_aunroll_toReg1;
            -- Succesor 2
            SE_stall_entry_aunroll_fromReg2 <= SE_stall_entry_aunroll_toReg2;
            -- Succesor 3
            SE_stall_entry_aunroll_fromReg3 <= SE_stall_entry_aunroll_toReg3;
            -- Succesor 4
            SE_stall_entry_aunroll_fromReg4 <= SE_stall_entry_aunroll_toReg4;
            -- Succesor 5
            SE_stall_entry_aunroll_fromReg5 <= SE_stall_entry_aunroll_toReg5;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_stall_entry_aunroll_consumed0 <= (not (SE_redist2_stall_entry_aunroll_o15_7_0_backStall) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg0;
    SE_stall_entry_aunroll_consumed1 <= (not (redist0_stall_entry_aunroll_o4_35_fifo_stall_out) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg1;
    SE_stall_entry_aunroll_consumed2 <= (not (redist1_stall_entry_aunroll_o5_35_fifo_stall_out) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg2;
    SE_stall_entry_aunroll_consumed3 <= (not (redist4_stall_entry_aunroll_o17_35_fifo_stall_out) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg3;
    SE_stall_entry_aunroll_consumed4 <= (not (redist5_stall_entry_aunroll_o18_35_fifo_stall_out) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg4;
    SE_stall_entry_aunroll_consumed5 <= (not (i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_out_o_stall) and SE_stall_entry_aunroll_wireValid) or SE_stall_entry_aunroll_fromReg5;
    -- Consuming
    SE_stall_entry_aunroll_StallValid <= SE_stall_entry_aunroll_backStall and SE_stall_entry_aunroll_wireValid;
    SE_stall_entry_aunroll_toReg0 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed0;
    SE_stall_entry_aunroll_toReg1 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed1;
    SE_stall_entry_aunroll_toReg2 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed2;
    SE_stall_entry_aunroll_toReg3 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed3;
    SE_stall_entry_aunroll_toReg4 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed4;
    SE_stall_entry_aunroll_toReg5 <= SE_stall_entry_aunroll_StallValid and SE_stall_entry_aunroll_consumed5;
    -- Backward Stall generation
    SE_stall_entry_aunroll_or0 <= SE_stall_entry_aunroll_consumed0;
    SE_stall_entry_aunroll_or1 <= SE_stall_entry_aunroll_consumed1 and SE_stall_entry_aunroll_or0;
    SE_stall_entry_aunroll_or2 <= SE_stall_entry_aunroll_consumed2 and SE_stall_entry_aunroll_or1;
    SE_stall_entry_aunroll_or3 <= SE_stall_entry_aunroll_consumed3 and SE_stall_entry_aunroll_or2;
    SE_stall_entry_aunroll_or4 <= SE_stall_entry_aunroll_consumed4 and SE_stall_entry_aunroll_or3;
    SE_stall_entry_aunroll_wireStall <= not (SE_stall_entry_aunroll_consumed5 and SE_stall_entry_aunroll_or4);
    SE_stall_entry_aunroll_backStall <= SE_stall_entry_aunroll_wireStall;
    -- Valid signal propagation
    SE_stall_entry_aunroll_V0 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg0);
    SE_stall_entry_aunroll_V1 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg1);
    SE_stall_entry_aunroll_V2 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg2);
    SE_stall_entry_aunroll_V3 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg3);
    SE_stall_entry_aunroll_V4 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg4);
    SE_stall_entry_aunroll_V5 <= SE_stall_entry_aunroll_wireValid and not (SE_stall_entry_aunroll_fromReg5);
    -- Computing multiple Valid(s)
    SE_stall_entry_aunroll_wireValid <= in_valid_in;

    -- i_c1_exe2_gemm_nnfw_vt_const_63(CONSTANT,13)
    i_c1_exe2_gemm_nnfw_vt_const_63_q <= "000000000000000000000000000";

    -- i_c1_exe2_gemm_nnfw_vt_select_36(BITSELECT,15)@0
    i_c1_exe2_gemm_nnfw_vt_select_36_b <= bubble_select_stall_entry_aunroll_j(36 downto 0);

    -- i_c1_exe2_gemm_nnfw_vt_join(BITJOIN,14)@0
    i_c1_exe2_gemm_nnfw_vt_join_q <= i_c1_exe2_gemm_nnfw_vt_const_63_q & i_c1_exe2_gemm_nnfw_vt_select_36_b;

    -- bubble_join_stall_entry_aunroll(BITJOIN,56)
    bubble_join_stall_entry_aunroll_q <= in_c1_exit1708_2 & in_c1_exe117110 & in_c0_exit1443_11 & in_c0_exit1443_10 & in_c0_exit1443_9 & in_c0_exit1443_6 & in_c0_exit1443_3 & in_c0_exe81527 & in_c0_exe71515;

    -- bubble_select_stall_entry_aunroll(BITSELECT,57)
    bubble_select_stall_entry_aunroll_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(0 downto 0));
    bubble_select_stall_entry_aunroll_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(1 downto 1));
    bubble_select_stall_entry_aunroll_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(2 downto 2));
    bubble_select_stall_entry_aunroll_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(66 downto 3));
    bubble_select_stall_entry_aunroll_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(130 downto 67));
    bubble_select_stall_entry_aunroll_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(131 downto 131));
    bubble_select_stall_entry_aunroll_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(132 downto 132));
    bubble_select_stall_entry_aunroll_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(133 downto 133));
    bubble_select_stall_entry_aunroll_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_aunroll_q(197 downto 134));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x(BLACKBOX,7)@0
    -- in in_i_stall@20000000
    -- out out_c0_exit180_0@7
    -- out out_c0_exit180_1@7
    -- out out_o_stall@20000000
    -- out out_o_valid@7
    thei_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x : i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw
    PORT MAP (
        in_c0_eni3174_0 => GND_q,
        in_c0_eni3174_1 => bubble_select_stall_entry_aunroll_d,
        in_c0_eni3174_2 => i_c1_exe2_gemm_nnfw_vt_join_q,
        in_c0_eni3174_3 => bubble_select_stall_entry_aunroll_e,
        in_i_stall => SE_out_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_backStall,
        in_i_valid => SE_stall_entry_aunroll_V5,
        out_c0_exit180_1 => i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_out_c0_exit180_1,
        out_o_stall => i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x(BITJOIN,49)
    bubble_join_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_q <= i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_out_c0_exit180_1;

    -- bubble_select_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x(BITSELECT,50)
    bubble_select_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_q(15 downto 0));

    -- SE_out_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x(STALLENABLE,72)
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_V0 <= SE_out_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_backStall <= i_store_memdep_5_gemm_nnfw_out_o_stall or not (SE_out_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_and0 <= i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_out_o_valid;
    SE_out_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_wireValid <= SE_redist2_stall_entry_aunroll_o15_7_6_V0 and SE_out_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_and0;

    -- SE_out_redist5_stall_entry_aunroll_o18_35_fifo(STALLENABLE,100)
    -- Valid signal propagation
    SE_out_redist5_stall_entry_aunroll_o18_35_fifo_V0 <= SE_out_redist5_stall_entry_aunroll_o18_35_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist5_stall_entry_aunroll_o18_35_fifo_backStall <= in_stall_in or not (SE_out_redist5_stall_entry_aunroll_o18_35_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist5_stall_entry_aunroll_o18_35_fifo_and0 <= redist5_stall_entry_aunroll_o18_35_fifo_valid_out;
    SE_out_redist5_stall_entry_aunroll_o18_35_fifo_and1 <= redist4_stall_entry_aunroll_o17_35_fifo_valid_out and SE_out_redist5_stall_entry_aunroll_o18_35_fifo_and0;
    SE_out_redist5_stall_entry_aunroll_o18_35_fifo_and2 <= redist1_stall_entry_aunroll_o5_35_fifo_valid_out and SE_out_redist5_stall_entry_aunroll_o18_35_fifo_and1;
    SE_out_redist5_stall_entry_aunroll_o18_35_fifo_and3 <= redist0_stall_entry_aunroll_o4_35_fifo_valid_out and SE_out_redist5_stall_entry_aunroll_o18_35_fifo_and2;
    SE_out_redist5_stall_entry_aunroll_o18_35_fifo_wireValid <= i_store_memdep_5_gemm_nnfw_out_o_valid and SE_out_redist5_stall_entry_aunroll_o18_35_fifo_and3;

    -- redist3_stall_entry_aunroll_o16_7_5(REG,44)
    redist3_stall_entry_aunroll_o16_7_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_aunroll_o16_7_5_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_stall_entry_aunroll_o15_7_5_backEN = "1") THEN
                redist3_stall_entry_aunroll_o16_7_5_q <= STD_LOGIC_VECTOR(SR_SE_redist2_stall_entry_aunroll_o15_7_5_D1);
            END IF;
        END IF;
    END PROCESS;

    -- redist3_stall_entry_aunroll_o16_7_6(REG,45)
    redist3_stall_entry_aunroll_o16_7_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist3_stall_entry_aunroll_o16_7_6_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_stall_entry_aunroll_o15_7_6_backEN = "1") THEN
                redist3_stall_entry_aunroll_o16_7_6_q <= STD_LOGIC_VECTOR(redist3_stall_entry_aunroll_o16_7_5_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o15_7_5(REG,37)
    redist2_stall_entry_aunroll_o15_7_5_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o15_7_5_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_stall_entry_aunroll_o15_7_5_backEN = "1") THEN
                redist2_stall_entry_aunroll_o15_7_5_q <= STD_LOGIC_VECTOR(SR_SE_redist2_stall_entry_aunroll_o15_7_5_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist2_stall_entry_aunroll_o15_7_6(REG,38)
    redist2_stall_entry_aunroll_o15_7_6_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist2_stall_entry_aunroll_o15_7_6_q <= "0000000000000000000000000000000000000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist2_stall_entry_aunroll_o15_7_6_backEN = "1") THEN
                redist2_stall_entry_aunroll_o15_7_6_q <= STD_LOGIC_VECTOR(redist2_stall_entry_aunroll_o15_7_5_q);
            END IF;
        END IF;
    END PROCESS;

    -- i_store_memdep_5_gemm_nnfw(BLACKBOX,16)@7
    -- in in_i_stall@20000000
    -- out out_lsu_memdep_5_o_active@20000000
    -- out out_memdep_5_avm_address@20000000
    -- out out_memdep_5_avm_burstcount@20000000
    -- out out_memdep_5_avm_byteenable@20000000
    -- out out_memdep_5_avm_enable@20000000
    -- out out_memdep_5_avm_read@20000000
    -- out out_memdep_5_avm_write@20000000
    -- out out_memdep_5_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@35
    -- out out_o_writeack@35
    thei_store_memdep_5_gemm_nnfw : i_store_memdep_5_gemm_nnfw1316
    PORT MAP (
        in_flush => in_flush,
        in_i_address => redist2_stall_entry_aunroll_o15_7_6_q,
        in_i_predicate => redist3_stall_entry_aunroll_o16_7_6_q,
        in_i_stall => SE_out_redist5_stall_entry_aunroll_o18_35_fifo_backStall,
        in_i_valid => SE_out_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_V0,
        in_i_writedata => bubble_select_i_sfc_c0_for_end32_loopexit_loopexit_gemm_nnfw_c0_enter175_gemm_nnfw_aunroll_x_b,
        in_memdep_5_avm_readdata => in_memdep_5_avm_readdata,
        in_memdep_5_avm_readdatavalid => in_memdep_5_avm_readdatavalid,
        in_memdep_5_avm_waitrequest => in_memdep_5_avm_waitrequest,
        in_memdep_5_avm_writeack => in_memdep_5_avm_writeack,
        out_lsu_memdep_5_o_active => i_store_memdep_5_gemm_nnfw_out_lsu_memdep_5_o_active,
        out_memdep_5_avm_address => i_store_memdep_5_gemm_nnfw_out_memdep_5_avm_address,
        out_memdep_5_avm_burstcount => i_store_memdep_5_gemm_nnfw_out_memdep_5_avm_burstcount,
        out_memdep_5_avm_byteenable => i_store_memdep_5_gemm_nnfw_out_memdep_5_avm_byteenable,
        out_memdep_5_avm_enable => i_store_memdep_5_gemm_nnfw_out_memdep_5_avm_enable,
        out_memdep_5_avm_read => i_store_memdep_5_gemm_nnfw_out_memdep_5_avm_read,
        out_memdep_5_avm_write => i_store_memdep_5_gemm_nnfw_out_memdep_5_avm_write,
        out_memdep_5_avm_writedata => i_store_memdep_5_gemm_nnfw_out_memdep_5_avm_writedata,
        out_o_stall => i_store_memdep_5_gemm_nnfw_out_o_stall,
        out_o_valid => i_store_memdep_5_gemm_nnfw_out_o_valid,
        out_o_writeack => i_store_memdep_5_gemm_nnfw_out_o_writeack,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,3)
    out_lsu_memdep_5_o_active <= i_store_memdep_5_gemm_nnfw_out_lsu_memdep_5_o_active;

    -- bubble_join_i_store_memdep_5_gemm_nnfw(BITJOIN,52)
    bubble_join_i_store_memdep_5_gemm_nnfw_q <= i_store_memdep_5_gemm_nnfw_out_o_writeack;

    -- bubble_select_i_store_memdep_5_gemm_nnfw(BITSELECT,53)
    bubble_select_i_store_memdep_5_gemm_nnfw_b <= STD_LOGIC_VECTOR(bubble_join_i_store_memdep_5_gemm_nnfw_q(0 downto 0));

    -- bubble_join_redist5_stall_entry_aunroll_o18_35_fifo(BITJOIN,69)
    bubble_join_redist5_stall_entry_aunroll_o18_35_fifo_q <= redist5_stall_entry_aunroll_o18_35_fifo_data_out;

    -- bubble_select_redist5_stall_entry_aunroll_o18_35_fifo(BITSELECT,70)
    bubble_select_redist5_stall_entry_aunroll_o18_35_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_stall_entry_aunroll_o18_35_fifo_q(0 downto 0));

    -- bubble_join_redist1_stall_entry_aunroll_o5_35_fifo(BITJOIN,63)
    bubble_join_redist1_stall_entry_aunroll_o5_35_fifo_q <= redist1_stall_entry_aunroll_o5_35_fifo_data_out;

    -- bubble_select_redist1_stall_entry_aunroll_o5_35_fifo(BITSELECT,64)
    bubble_select_redist1_stall_entry_aunroll_o5_35_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_stall_entry_aunroll_o5_35_fifo_q(0 downto 0));

    -- bubble_join_redist0_stall_entry_aunroll_o4_35_fifo(BITJOIN,60)
    bubble_join_redist0_stall_entry_aunroll_o4_35_fifo_q <= redist0_stall_entry_aunroll_o4_35_fifo_data_out;

    -- bubble_select_redist0_stall_entry_aunroll_o4_35_fifo(BITSELECT,61)
    bubble_select_redist0_stall_entry_aunroll_o4_35_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_stall_entry_aunroll_o4_35_fifo_q(0 downto 0));

    -- bubble_join_redist4_stall_entry_aunroll_o17_35_fifo(BITJOIN,66)
    bubble_join_redist4_stall_entry_aunroll_o17_35_fifo_q <= redist4_stall_entry_aunroll_o17_35_fifo_data_out;

    -- bubble_select_redist4_stall_entry_aunroll_o17_35_fifo(BITSELECT,67)
    bubble_select_redist4_stall_entry_aunroll_o17_35_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist4_stall_entry_aunroll_o17_35_fifo_q(0 downto 0));

    -- dupName_0_sync_out_x(GPOUT,6)@35
    out_c0_exe11155 <= bubble_select_redist4_stall_entry_aunroll_o17_35_fifo_b;
    out_c0_exe71515 <= bubble_select_redist0_stall_entry_aunroll_o4_35_fifo_b;
    out_c0_exe81527 <= bubble_select_redist1_stall_entry_aunroll_o5_35_fifo_b;
    out_c1_exe117110 <= bubble_select_redist5_stall_entry_aunroll_o18_35_fifo_b;
    out_memdep_5 <= bubble_select_i_store_memdep_5_gemm_nnfw_b;
    out_valid_out <= SE_out_redist5_stall_entry_aunroll_o18_35_fifo_V0;

    -- ext_sig_sync_out(GPOUT,12)
    out_memdep_5_avm_address <= i_store_memdep_5_gemm_nnfw_out_memdep_5_avm_address;
    out_memdep_5_avm_enable <= i_store_memdep_5_gemm_nnfw_out_memdep_5_avm_enable;
    out_memdep_5_avm_read <= i_store_memdep_5_gemm_nnfw_out_memdep_5_avm_read;
    out_memdep_5_avm_write <= i_store_memdep_5_gemm_nnfw_out_memdep_5_avm_write;
    out_memdep_5_avm_writedata <= i_store_memdep_5_gemm_nnfw_out_memdep_5_avm_writedata;
    out_memdep_5_avm_byteenable <= i_store_memdep_5_gemm_nnfw_out_memdep_5_avm_byteenable;
    out_memdep_5_avm_burstcount <= i_store_memdep_5_gemm_nnfw_out_memdep_5_avm_burstcount;

    -- sync_out(GPOUT,23)@0
    out_stall_out <= SE_stall_entry_aunroll_backStall;

END normal;
