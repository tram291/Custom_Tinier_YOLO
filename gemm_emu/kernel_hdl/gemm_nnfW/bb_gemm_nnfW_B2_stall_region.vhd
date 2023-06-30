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

-- VHDL created from bb_gemm_nnfW_B2_stall_region
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

entity bb_gemm_nnfW_B2_stall_region is
    port (
        out_c0_exe8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe9 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit62_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit62_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit62_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit62_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit62_4 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit62_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit62_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit62_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit62_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit62_9 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit62_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit62_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit62_12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_B_load_0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memcoalesce_B_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_B_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_B_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_B_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memcoalesce_B_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_B_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_K : in std_logic_vector(31 downto 0);  -- ufix32
        in_forked45 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked46 : in std_logic_vector(0 downto 0);  -- ufix1
        in_j_089_pop948 : in std_logic_vector(31 downto 0);  -- ufix32
        in_memdep_phi_pop1050 : in std_logic_vector(0 downto 0);  -- ufix1
        in_notexit2949 : in std_logic_vector(0 downto 0);  -- ufix1
        in_sdiv_add124_RM47 : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_gemm_nnfW0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_memdep_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_memdep_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_N : in std_logic_vector(31 downto 0);  -- ufix32
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_B_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_B_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_B_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_B_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nnfw_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nnfw_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_B : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nnfW_B2_stall_region;

architecture normal of bb_gemm_nnfW_B2_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component gemm_nnfW_B2_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_memcoalesce_b_load_0_gemm_nnfw78 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_B_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_B_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_B_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_B_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata_0 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_1 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_2 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_3 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_4 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_5 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_6 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_7 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_8 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_9 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_10 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_11 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_12 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_13 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_14 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_readdata_15 : out std_logic_vector(15 downto 0);  -- Floating Point
            out_memcoalesce_B_load_0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_B_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw is
        port (
            in_c0_eni6_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni6_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni6_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni6_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni6_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni6_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni6_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_B : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_K : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_N : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit62_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit62_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit62_2 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit62_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit62_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit62_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit62_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit62_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit62_8 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit62_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit62_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit62_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit62_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nnfw_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nnfw_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw is
        port (
            in_c1_eni6_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni6_1 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6_2 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6_3 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6_4 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6_5 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6_6 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6_7 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6_8 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6_9 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6_10 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6_11 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6_12 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6_13 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6_14 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6_15 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6_16 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_c1_eni6_17 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_eni6_18 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni6_19 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni6_20 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni6_21 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_forked45 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_readdata : in std_logic_vector(511 downto 0);  -- Fixed Point
            in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_byteenable : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_writedata : out std_logic_vector(511 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
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
    signal gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B2_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B2_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_2 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_3 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_4 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_5 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_6 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_7 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_8 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_9 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_10 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_11 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_12 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_13 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_14 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_15 : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_B_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_B_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_B_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_B_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_B_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_B_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_B_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nnfw_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nnfw_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_memdep_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_memdep_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_memdep_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_memdep_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_memdep_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_memdep_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_memdep_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_gemm_nnfW_B2_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (68 downto 0);
    signal bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_q : STD_LOGIC_VECTOR (255 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_c : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_d : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_e : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_f : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_g : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_h : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_i : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_j : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_k : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_l : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_m : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_n : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_o : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_p : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_q : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_join_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_q : STD_LOGIC_VECTOR (199 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_f : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_i : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_k : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_l : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_m : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_n : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (68 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V13 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_r_data0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_D0 : STD_LOGIC_VECTOR (31 downto 0);
    signal SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_D0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2(STALLENABLE,174)
    -- Valid signal propagation
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_V0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_R_v_0;
    -- Stall signal propagation
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_s_tv_0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_backStall and SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_R_v_0;
    -- Backward Enable generation
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_backEN <= not (SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_v_s_0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_backEN and SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_V;
    -- Backward Stall generation
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_backStall <= not (SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_backEN);
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_backEN = "0") THEN
                SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_R_v_0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_R_v_0 and SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_s_tv_0;
            ELSE
                SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_R_v_0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0(STALLENABLE,172)
    -- Valid signal propagation
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_V0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_R_v_0;
    -- Stall signal propagation
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_s_tv_0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_backStall and SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_R_v_0;
    -- Backward Enable generation
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_backEN <= not (SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_v_s_0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_backEN and SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_V;
    -- Backward Stall generation
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_backStall <= not (SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_backEN);
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_backEN = "0") THEN
                SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_R_v_0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_R_v_0 and SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_s_tv_0;
            ELSE
                SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_R_v_0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo(BITJOIN,124)
    bubble_join_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_q <= redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_data_out;

    -- bubble_select_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo(BITSELECT,125)
    bubble_select_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_q(0 downto 0));

    -- redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0(REG,72)
    redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_backEN = "1") THEN
                redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_q <= STD_LOGIC_VECTOR(SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1(REG,73)
    redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_backEN = "1") THEN
                redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_q <= STD_LOGIC_VECTOR(redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2(REG,74)
    redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_backEN = "1") THEN
                redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_q <= STD_LOGIC_VECTOR(SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3(REG,75)
    redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_backEN = "1") THEN
                redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_q <= STD_LOGIC_VECTOR(redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4(STALLREG,278)
    SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_r_valid <= (others => '0');
            SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_r_valid <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_backStall and (SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_r_valid or SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_i_valid);

            IF (SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_r_data0 <= STD_LOGIC_VECTOR(redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_i_valid <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_V0;
    -- Stall signal propagation
    SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_backStall <= SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_r_valid or not (SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_i_valid);

    -- Valid
    SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_V <= SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_r_valid WHEN SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_r_valid = "1" ELSE SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_i_valid;

    SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_D0 <= SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_r_data0 WHEN SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_r_valid = "1" ELSE redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_q;

    -- SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3(STALLENABLE,184)
    -- Valid signal propagation
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_V0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_R_v_0;
    -- Stall signal propagation
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_s_tv_0 <= SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_backStall and SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_R_v_0;
    -- Backward Enable generation
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_backEN <= not (SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_v_s_0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_backEN and SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_V0;
    -- Backward Stall generation
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_backStall <= not (SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_v_s_0);
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_backEN = "0") THEN
                SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_R_v_0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_R_v_0 and SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_s_tv_0;
            ELSE
                SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_R_v_0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2(STALLENABLE,183)
    -- Valid signal propagation
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_V0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_R_v_0;
    -- Stall signal propagation
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_s_tv_0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_3_backStall and SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_R_v_0;
    -- Backward Enable generation
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_backEN <= not (SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_v_s_0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_backEN and SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_V;
    -- Backward Stall generation
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_backStall <= not (SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_backEN);
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_backEN = "0") THEN
                SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_R_v_0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_R_v_0 and SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_s_tv_0;
            ELSE
                SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_R_v_0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2(STALLREG,277)
    SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_r_valid <= (others => '0');
            SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_r_valid <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_backStall and (SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_r_valid or SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_i_valid);

            IF (SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_r_data0 <= STD_LOGIC_VECTOR(redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_i_valid <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_V0;
    -- Stall signal propagation
    SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_backStall <= SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_r_valid or not (SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_i_valid);

    -- Valid
    SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_V <= SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_r_valid WHEN SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_r_valid = "1" ELSE SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_i_valid;

    SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_D0 <= SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_r_data0 WHEN SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_r_valid = "1" ELSE redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_q;

    -- SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1(STALLENABLE,182)
    -- Valid signal propagation
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_V0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_R_v_0;
    -- Stall signal propagation
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_s_tv_0 <= SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_2_backStall and SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_R_v_0;
    -- Backward Enable generation
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_backEN <= not (SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_v_s_0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_backEN and SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_V0;
    -- Backward Stall generation
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_backStall <= not (SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_v_s_0);
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_backEN = "0") THEN
                SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_R_v_0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_R_v_0 and SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_s_tv_0;
            ELSE
                SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_R_v_0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0(STALLENABLE,181)
    -- Valid signal propagation
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_V0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_R_v_0;
    -- Stall signal propagation
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_s_tv_0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_1_backStall and SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_R_v_0;
    -- Backward Enable generation
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_backEN <= not (SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_v_s_0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_backEN and SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_V;
    -- Backward Stall generation
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_backStall <= not (SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_backEN);
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_backEN = "0") THEN
                SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_R_v_0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_R_v_0 and SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_s_tv_0;
            ELSE
                SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_R_v_0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0(STALLREG,276)
    SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_r_valid <= (others => '0');
            SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_r_valid <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_backStall and (SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_r_valid or SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_i_valid);

            IF (SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_r_data0 <= STD_LOGIC_VECTOR(bubble_select_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_i_valid <= SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_V1;
    -- Stall signal propagation
    SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_backStall <= SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_r_valid or not (SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_i_valid);

    -- Valid
    SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_V <= SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_r_valid WHEN SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_r_valid = "1" ELSE SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_i_valid;

    SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_D0 <= SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_r_data0 WHEN SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_r_valid = "1" ELSE bubble_select_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_b;

    -- redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo(STALLFIFO,71)
    redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V10;
    redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_stall_in <= SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_backStall;
    redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_k;
    redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_valid_in_bitsignaltemp <= redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_valid_in(0);
    redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_stall_in_bitsignaltemp <= redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_stall_in(0);
    redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_valid_out(0) <= redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_valid_out_bitsignaltemp;
    redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_stall_out(0) <= redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_stall_out_bitsignaltemp;
    theredist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 153,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_valid_in_bitsignaltemp,
        stall_in => redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_k,
        valid_out => redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_valid_out_bitsignaltemp,
        stall_out => redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_stall_out_bitsignaltemp,
        data_out => redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo(STALLENABLE,180)
    SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_fromReg0 <= (others => '0');
            SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_fromReg0 <= SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_toReg0;
            -- Succesor 1
            SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_fromReg1 <= SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_consumed0 <= (not (SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_backStall) and SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_wireValid) or SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_fromReg0;
    SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_consumed1 <= (not (SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_0_backStall) and SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_wireValid) or SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_fromReg1;
    -- Consuming
    SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_StallValid <= SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_backStall and SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_wireValid;
    SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_toReg0 <= SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_StallValid and SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_consumed0;
    SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_toReg1 <= SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_StallValid and SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_or0 <= SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_consumed0;
    SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_wireStall <= not (SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_consumed1 and SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_or0);
    SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_backStall <= SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_V0 <= SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_wireValid and not (SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_fromReg0);
    SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_V1 <= SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_wireValid and not (SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_wireValid <= redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_valid_out;

    -- bubble_join_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo(BITJOIN,106)
    bubble_join_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_q <= redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_data_out;

    -- bubble_select_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo(BITSELECT,107)
    bubble_select_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_q(31 downto 0));

    -- redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0(REG,56)
    redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_backEN = "1") THEN
                redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_q <= STD_LOGIC_VECTOR(SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1(REG,57)
    redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_backEN = "1") THEN
                redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_q <= STD_LOGIC_VECTOR(redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2(REG,58)
    redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_backEN = "1") THEN
                redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_q <= STD_LOGIC_VECTOR(SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3(REG,59)
    redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_backEN = "1") THEN
                redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_q <= STD_LOGIC_VECTOR(redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4(STALLREG,281)
    SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_r_valid <= (others => '0');
            SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_r_valid <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_backStall and (SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_r_valid or SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_i_valid);

            IF (SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_r_data0 <= STD_LOGIC_VECTOR(redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_i_valid <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_V0;
    -- Stall signal propagation
    SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_backStall <= SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_r_valid or not (SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_i_valid);

    -- Valid
    SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_V <= SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_r_valid WHEN SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_r_valid = "1" ELSE SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_i_valid;

    SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_D0 <= SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_r_data0 WHEN SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_r_valid = "1" ELSE redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_q;

    -- SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3(STALLENABLE,162)
    -- Valid signal propagation
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_V0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_R_v_0;
    -- Stall signal propagation
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_s_tv_0 <= SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_backStall and SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_R_v_0;
    -- Backward Enable generation
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_backEN <= not (SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_v_s_0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_backEN and SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_V0;
    -- Backward Stall generation
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_backStall <= not (SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_v_s_0);
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_backEN = "0") THEN
                SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_R_v_0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_R_v_0 and SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_s_tv_0;
            ELSE
                SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_R_v_0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2(STALLENABLE,161)
    -- Valid signal propagation
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_V0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_R_v_0;
    -- Stall signal propagation
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_s_tv_0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_3_backStall and SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_R_v_0;
    -- Backward Enable generation
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_backEN <= not (SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_v_s_0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_backEN and SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_V;
    -- Backward Stall generation
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_backStall <= not (SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_backEN);
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_backEN = "0") THEN
                SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_R_v_0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_R_v_0 and SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_s_tv_0;
            ELSE
                SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_R_v_0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2(STALLREG,280)
    SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_r_valid <= (others => '0');
            SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_r_valid <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_backStall and (SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_r_valid or SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_i_valid);

            IF (SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_r_data0 <= STD_LOGIC_VECTOR(redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_i_valid <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_V0;
    -- Stall signal propagation
    SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_backStall <= SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_r_valid or not (SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_i_valid);

    -- Valid
    SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_V <= SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_r_valid WHEN SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_r_valid = "1" ELSE SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_i_valid;

    SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_D0 <= SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_r_data0 WHEN SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_r_valid = "1" ELSE redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_q;

    -- SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1(STALLENABLE,160)
    -- Valid signal propagation
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_V0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_R_v_0;
    -- Stall signal propagation
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_s_tv_0 <= SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_2_backStall and SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_R_v_0;
    -- Backward Enable generation
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_backEN <= not (SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_v_s_0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_backEN and SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_V0;
    -- Backward Stall generation
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_backStall <= not (SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_v_s_0);
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_backEN = "0") THEN
                SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_R_v_0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_R_v_0 and SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_s_tv_0;
            ELSE
                SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_R_v_0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0(STALLENABLE,159)
    -- Valid signal propagation
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_V0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_R_v_0;
    -- Stall signal propagation
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_s_tv_0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_1_backStall and SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_R_v_0;
    -- Backward Enable generation
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_backEN <= not (SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_v_s_0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_backEN and SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_V;
    -- Backward Stall generation
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_backStall <= not (SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_backEN);
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_backEN = "0") THEN
                SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_R_v_0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_R_v_0 and SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_s_tv_0;
            ELSE
                SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_R_v_0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0(STALLREG,279)
    SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_r_valid <= (others => '0');
            SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_r_valid <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_backStall and (SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_r_valid or SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_i_valid);

            IF (SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_r_data0 <= STD_LOGIC_VECTOR(bubble_select_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_i_valid <= SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_V1;
    -- Stall signal propagation
    SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_backStall <= SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_r_valid or not (SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_i_valid);

    -- Valid
    SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_V <= SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_r_valid WHEN SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_r_valid = "1" ELSE SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_i_valid;

    SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_D0 <= SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_r_data0 WHEN SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_r_valid = "1" ELSE bubble_select_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_b;

    -- redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo(STALLFIFO,55)
    redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V4;
    redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_stall_in <= SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_backStall;
    redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_e;
    redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_valid_in_bitsignaltemp <= redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_valid_in(0);
    redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_stall_in_bitsignaltemp <= redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_stall_in(0);
    redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_valid_out(0) <= redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_valid_out_bitsignaltemp;
    redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_stall_out(0) <= redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_stall_out_bitsignaltemp;
    theredist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 153,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_valid_in_bitsignaltemp,
        stall_in => redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_e,
        valid_out => redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_valid_out_bitsignaltemp,
        stall_out => redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_stall_out_bitsignaltemp,
        data_out => redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo(STALLENABLE,158)
    SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_fromReg0 <= (others => '0');
            SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_fromReg0 <= SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_toReg0;
            -- Succesor 1
            SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_fromReg1 <= SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_consumed0 <= (not (SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_backStall) and SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_wireValid) or SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_fromReg0;
    SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_consumed1 <= (not (SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_0_backStall) and SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_wireValid) or SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_fromReg1;
    -- Consuming
    SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_StallValid <= SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_backStall and SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_wireValid;
    SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_toReg0 <= SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_StallValid and SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_consumed0;
    SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_toReg1 <= SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_StallValid and SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_or0 <= SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_consumed0;
    SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_wireStall <= not (SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_consumed1 and SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_or0);
    SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_backStall <= SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_V0 <= SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_wireValid and not (SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_fromReg0);
    SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_V1 <= SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_wireValid and not (SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_wireValid <= redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_valid_out;

    -- i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x(BLACKBOX,17)@10
    -- in in_i_stall@20000000
    -- out out_o_readdata_0@162
    -- out out_o_readdata_1@162
    -- out out_o_readdata_2@162
    -- out out_o_readdata_3@162
    -- out out_o_readdata_4@162
    -- out out_o_readdata_5@162
    -- out out_o_readdata_6@162
    -- out out_o_readdata_7@162
    -- out out_o_readdata_8@162
    -- out out_o_readdata_9@162
    -- out out_o_readdata_10@162
    -- out out_o_readdata_11@162
    -- out out_o_readdata_12@162
    -- out out_o_readdata_13@162
    -- out out_o_readdata_14@162
    -- out out_o_readdata_15@162
    -- out out_memcoalesce_B_load_0_avm_address@20000000
    -- out out_memcoalesce_B_load_0_avm_burstcount@20000000
    -- out out_memcoalesce_B_load_0_avm_byteenable@20000000
    -- out out_memcoalesce_B_load_0_avm_enable@20000000
    -- out out_memcoalesce_B_load_0_avm_read@20000000
    -- out out_memcoalesce_B_load_0_avm_write@20000000
    -- out out_memcoalesce_B_load_0_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@162
    thei_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x : i_load_memcoalesce_b_load_0_gemm_nnfw78
    PORT MAP (
        in_flush => in_flush,
        in_i_address => bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_f,
        in_i_predicate => bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_i,
        in_i_stall => SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_backStall,
        in_i_valid => SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V0,
        in_memcoalesce_B_load_0_avm_readdata => in_memcoalesce_B_load_0_avm_readdata,
        in_memcoalesce_B_load_0_avm_readdatavalid => in_memcoalesce_B_load_0_avm_readdatavalid,
        in_memcoalesce_B_load_0_avm_waitrequest => in_memcoalesce_B_load_0_avm_waitrequest,
        in_memcoalesce_B_load_0_avm_writeack => in_memcoalesce_B_load_0_avm_writeack,
        out_o_readdata_0 => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_1,
        out_o_readdata_2 => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_2,
        out_o_readdata_3 => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_3,
        out_o_readdata_4 => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_4,
        out_o_readdata_5 => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_5,
        out_o_readdata_6 => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_6,
        out_o_readdata_7 => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_7,
        out_o_readdata_8 => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_8,
        out_o_readdata_9 => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_9,
        out_o_readdata_10 => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_10,
        out_o_readdata_11 => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_11,
        out_o_readdata_12 => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_12,
        out_o_readdata_13 => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_13,
        out_o_readdata_14 => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_14,
        out_o_readdata_15 => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_15,
        out_memcoalesce_B_load_0_avm_address => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_B_load_0_avm_address,
        out_memcoalesce_B_load_0_avm_burstcount => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_B_load_0_avm_burstcount,
        out_memcoalesce_B_load_0_avm_byteenable => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_B_load_0_avm_byteenable,
        out_memcoalesce_B_load_0_avm_enable => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_B_load_0_avm_enable,
        out_memcoalesce_B_load_0_avm_read => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_B_load_0_avm_read,
        out_memcoalesce_B_load_0_avm_write => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_B_load_0_avm_write,
        out_memcoalesce_B_load_0_avm_writedata => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_B_load_0_avm_writedata,
        out_o_stall => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_stall,
        out_o_valid => i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo(STALLENABLE,195)
    -- Valid signal propagation
    SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_V0 <= SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_backStall <= i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_o_stall or not (SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_and0 <= redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_valid_out;
    SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_and1 <= redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_valid_out and SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_and0;
    SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_and2 <= i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_valid and SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_and1;
    SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_and3 <= SE_out_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_V0 and SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_and2;
    SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_and4 <= SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_V0 and SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_and3;
    SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_wireValid <= SE_out_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_V0 and SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_and4;

    -- redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo(STALLFIFO,81)
    redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_valid_in <= SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_V2;
    redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_stall_in <= SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_backStall;
    redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_data_in <= bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_h;
    redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_valid_in_bitsignaltemp <= redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_valid_in(0);
    redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_stall_in_bitsignaltemp <= redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_stall_in(0);
    redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_valid_out(0) <= redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_valid_out_bitsignaltemp;
    redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_stall_out(0) <= redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_stall_out_bitsignaltemp;
    theredist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 162,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_valid_in_bitsignaltemp,
        stall_in => redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_h,
        valid_out => redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_valid_out_bitsignaltemp,
        stall_out => redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_stall_out_bitsignaltemp,
        data_out => redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo(STALLFIFO,80)
    redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_valid_in <= SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_V1;
    redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_stall_in <= SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_backStall;
    redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_data_in <= bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_b;
    redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_valid_in_bitsignaltemp <= redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_valid_in(0);
    redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_stall_in_bitsignaltemp <= redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_stall_in(0);
    redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_valid_out(0) <= redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_valid_out_bitsignaltemp;
    redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_stall_out(0) <= redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_stall_out_bitsignaltemp;
    theredist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 162,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_valid_in_bitsignaltemp,
        stall_in => redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_b,
        valid_out => redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_valid_out_bitsignaltemp,
        stall_out => redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_stall_out_bitsignaltemp,
        data_out => redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,149)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= gemm_nnfW_B2_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,93)
    bubble_join_stall_entry_q <= in_unnamed_gemm_nnfW0 & in_sdiv_add124_RM47 & in_notexit2949 & in_memdep_phi_pop1050 & in_j_089_pop948 & in_forked46 & in_forked45;

    -- bubble_select_stall_entry(BITSELECT,94)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(0 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1 downto 1));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(33 downto 2));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(34 downto 34));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(35 downto 35));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(67 downto 36));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(68 downto 68));

    -- gemm_nnfW_B2_merge_reg_aunroll_x(BLACKBOX,16)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_data_out_4@1
    -- out out_data_out_5@1
    -- out out_data_out_6@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thegemm_nnfW_B2_merge_reg_aunroll_x : gemm_nnfW_B2_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_b,
        in_data_in_1 => bubble_select_stall_entry_c,
        in_data_in_2 => bubble_select_stall_entry_g,
        in_data_in_3 => bubble_select_stall_entry_d,
        in_data_in_4 => bubble_select_stall_entry_h,
        in_data_in_5 => bubble_select_stall_entry_f,
        in_data_in_6 => bubble_select_stall_entry_e,
        in_stall_in => SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_5,
        out_data_out_6 => gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6,
        out_stall_out => gemm_nnfW_B2_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => gemm_nnfW_B2_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_gemm_nnfW_B2_merge_reg_aunroll_x(STALLENABLE,142)
    SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_fromReg2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_fromReg0 <= SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_fromReg1 <= SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_fromReg2 <= SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_toReg2;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_consumed0 <= (not (i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_o_stall) and SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_fromReg0;
    SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_consumed1 <= (not (redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_stall_out) and SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_fromReg1;
    SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_consumed2 <= (not (redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_stall_out) and SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_fromReg2;
    -- Consuming
    SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_StallValid <= SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_backStall and SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_wireValid;
    SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_toReg0 <= SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_StallValid and SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_consumed0;
    SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_toReg1 <= SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_StallValid and SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_consumed1;
    SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_toReg2 <= SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_StallValid and SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_consumed2;
    -- Backward Stall generation
    SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_or0 <= SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_consumed0;
    SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_or1 <= SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_consumed1 and SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_or0;
    SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_wireStall <= not (SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_consumed2 and SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_or1);
    SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_backStall <= SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_V0 <= SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_fromReg0);
    SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_V1 <= SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_fromReg1);
    SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_V2 <= SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_fromReg2);
    -- Computing multiple Valid(s)
    SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_wireValid <= gemm_nnfW_B2_merge_reg_aunroll_x_out_valid_out;

    -- bubble_join_gemm_nnfW_B2_merge_reg_aunroll_x(BITJOIN,83)
    bubble_join_gemm_nnfW_B2_merge_reg_aunroll_x_q <= gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6 & gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_5 & gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_4 & gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_3 & gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_2 & gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_1 & gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x(BITSELECT,84)
    bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B2_merge_reg_aunroll_x_q(0 downto 0));
    bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B2_merge_reg_aunroll_x_q(1 downto 1));
    bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B2_merge_reg_aunroll_x_q(33 downto 2));
    bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B2_merge_reg_aunroll_x_q(65 downto 34));
    bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B2_merge_reg_aunroll_x_q(66 downto 66));
    bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B2_merge_reg_aunroll_x_q(67 downto 67));
    bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B2_merge_reg_aunroll_x_q(68 downto 68));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x(BLACKBOX,18)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit62_0@10
    -- out out_c0_exit62_1@10
    -- out out_c0_exit62_2@10
    -- out out_c0_exit62_3@10
    -- out out_c0_exit62_4@10
    -- out out_c0_exit62_5@10
    -- out out_c0_exit62_6@10
    -- out out_c0_exit62_7@10
    -- out out_c0_exit62_8@10
    -- out out_c0_exit62_9@10
    -- out out_c0_exit62_10@10
    -- out out_c0_exit62_11@10
    -- out out_c0_exit62_12@10
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nnfw_exiting_stall_out@20000000
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nnfw_exiting_valid_out@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@10
    -- out out_pipeline_valid_out@20000000
    thei_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x : i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw
    PORT MAP (
        in_c0_eni6_0 => GND_q,
        in_c0_eni6_1 => bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_d,
        in_c0_eni6_2 => bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_b,
        in_c0_eni6_3 => bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_e,
        in_c0_eni6_4 => bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_c,
        in_c0_eni6_5 => bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_f,
        in_c0_eni6_6 => bubble_select_gemm_nnfW_B2_merge_reg_aunroll_x_g,
        in_B => in_B,
        in_K => in_K,
        in_N => in_N,
        in_i_stall => SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_backStall,
        in_i_valid => SE_out_gemm_nnfW_B2_merge_reg_aunroll_x_V0,
        in_pipeline_stall_in => in_pipeline_stall_in,
        out_c0_exit62_0 => i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0,
        out_c0_exit62_1 => i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1,
        out_c0_exit62_2 => i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2,
        out_c0_exit62_3 => i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3,
        out_c0_exit62_4 => i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4,
        out_c0_exit62_5 => i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5,
        out_c0_exit62_6 => i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6,
        out_c0_exit62_7 => i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7,
        out_c0_exit62_8 => i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8,
        out_c0_exit62_9 => i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9,
        out_c0_exit62_10 => i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10,
        out_c0_exit62_11 => i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11,
        out_c0_exit62_12 => i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12,
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nnfw_exiting_stall_out => i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nnfw_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nnfw_exiting_valid_out => i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nnfw_exiting_valid_out,
        out_o_stall => i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_o_valid,
        out_pipeline_valid_out => i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x(BITJOIN,89)
    bubble_join_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_q <= i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12 & i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11 & i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10 & i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9 & i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8 & i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7 & i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6 & i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5 & i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4 & i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3 & i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2 & i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1 & i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0;

    -- bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x(BITSELECT,90)
    bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_q(0 downto 0));
    bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_q(32 downto 1));
    bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_q(64 downto 33));
    bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_q(96 downto 65));
    bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_q(160 downto 97));
    bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_q(161 downto 161));
    bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_q(162 downto 162));
    bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_q(163 downto 163));
    bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_q(195 downto 164));
    bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_q(196 downto 196));
    bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_q(197 downto 197));
    bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_q(198 downto 198));
    bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_q(199 downto 199));

    -- SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x(STALLENABLE,146)
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg0 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg1 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg2 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg3 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg4 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg5 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg6 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg7 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg8 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg9 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg10 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg11 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg12 <= (others => '0');
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg13 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg0 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg1 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg2 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg3 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg4 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg4;
            -- Succesor 5
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg5 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg5;
            -- Succesor 6
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg6 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg6;
            -- Succesor 7
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg7 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg7;
            -- Succesor 8
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg8 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg8;
            -- Succesor 9
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg9 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg9;
            -- Succesor 10
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg10 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg10;
            -- Succesor 11
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg11 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg11;
            -- Succesor 12
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg12 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg12;
            -- Succesor 13
            SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg13 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg13;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed0 <= (not (i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_stall) and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg0;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed1 <= (not (redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg1;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed2 <= (not (redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg2;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed3 <= (not (redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg3;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed4 <= (not (redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg4;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed5 <= (not (redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg5;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed6 <= (not (redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg6;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed7 <= (not (redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg7;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed8 <= (not (redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg8;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed9 <= (not (redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg9;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed10 <= (not (redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg10;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed11 <= (not (redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg11;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed12 <= (not (redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg12;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed13 <= (not (redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_stall_out) and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg13;
    -- Consuming
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_StallValid <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_backStall and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg0 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed0;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg1 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed1;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg2 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed2;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg3 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed3;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg4 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed4;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg5 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed5;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg6 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed6;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg7 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed7;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg8 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed8;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg9 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed9;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg10 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed10;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg11 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed11;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg12 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed12;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_toReg13 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed13;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or0 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed0;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or1 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed1 and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or0;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or2 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed2 and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or1;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or3 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed3 and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or2;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or4 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed4 and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or3;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or5 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed5 and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or4;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or6 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed6 and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or5;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or7 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed7 and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or6;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or8 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed8 and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or7;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or9 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed9 and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or8;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or10 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed10 and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or9;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or11 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed11 and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or10;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or12 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed12 and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or11;
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireStall <= not (SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_consumed13 and SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_or12);
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_backStall <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V0 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg0);
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V1 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg1);
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V2 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg2);
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V3 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg3);
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V4 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg4);
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V5 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg5);
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V6 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg6);
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V7 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg7);
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V8 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg8);
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V9 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg9);
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V10 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg10);
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V11 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg11);
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V12 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg12);
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V13 <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_fromReg13);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_wireValid <= i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_o_valid;

    -- redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo(STALLFIFO,64)
    redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V8;
    redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_stall_in <= SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_backStall;
    redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_i;
    redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_valid_in_bitsignaltemp <= redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_valid_in(0);
    redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_stall_in_bitsignaltemp <= redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_stall_in(0);
    redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_valid_out(0) <= redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_valid_out_bitsignaltemp;
    redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_stall_out(0) <= redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_stall_out_bitsignaltemp;
    theredist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 153,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_valid_in_bitsignaltemp,
        stall_in => redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_i,
        valid_out => redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_valid_out_bitsignaltemp,
        stall_out => redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_stall_out_bitsignaltemp,
        data_out => redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo(BITJOIN,118)
    bubble_join_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_q <= redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_data_out;

    -- bubble_select_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo(BITSELECT,119)
    bubble_select_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_q(0 downto 0));

    -- SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo(STALLENABLE,171)
    SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_fromReg0 <= (others => '0');
            SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_fromReg0 <= SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_toReg0;
            -- Succesor 1
            SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_fromReg1 <= SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_consumed0 <= (not (SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_backStall) and SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_wireValid) or SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_fromReg0;
    SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_consumed1 <= (not (SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_backStall) and SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_wireValid) or SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_fromReg1;
    -- Consuming
    SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_StallValid <= SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_backStall and SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_wireValid;
    SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_toReg0 <= SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_StallValid and SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_consumed0;
    SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_toReg1 <= SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_StallValid and SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_consumed1;
    -- Backward Stall generation
    SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_or0 <= SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_consumed0;
    SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_wireStall <= not (SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_consumed1 and SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_or0);
    SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_backStall <= SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_wireStall;
    -- Valid signal propagation
    SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_V0 <= SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_wireValid and not (SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_fromReg0);
    SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_V1 <= SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_wireValid and not (SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_wireValid <= redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_valid_out;

    -- SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0(STALLREG,282)
    SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_r_valid <= (others => '0');
            SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_r_valid <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_backStall and (SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_r_valid or SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_i_valid);

            IF (SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_r_data0 <= STD_LOGIC_VECTOR(bubble_select_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_b);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_i_valid <= SE_out_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_V1;
    -- Stall signal propagation
    SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_backStall <= SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_r_valid or not (SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_i_valid);

    -- Valid
    SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_V <= SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_r_valid WHEN SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_r_valid = "1" ELSE SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_i_valid;

    SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_D0 <= SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_r_data0 WHEN SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_r_valid = "1" ELSE bubble_select_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_b;

    -- redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0(REG,65)
    redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_backEN = "1") THEN
                redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_q <= STD_LOGIC_VECTOR(SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1(REG,66)
    redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_backEN = "1") THEN
                redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_q <= STD_LOGIC_VECTOR(redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1(STALLENABLE,173)
    -- Valid signal propagation
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_V0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_R_v_0;
    -- Stall signal propagation
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_s_tv_0 <= SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_backStall and SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_R_v_0;
    -- Backward Enable generation
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_backEN <= not (SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_v_s_0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_backEN and SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_0_V0;
    -- Backward Stall generation
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_backStall <= not (SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_v_s_0);
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_backEN = "0") THEN
                SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_R_v_0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_R_v_0 and SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_s_tv_0;
            ELSE
                SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_R_v_0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2(STALLREG,283)
    SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_r_valid <= (others => '0');
            SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_r_valid <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_backStall and (SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_r_valid or SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_i_valid);

            IF (SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_r_data0 <= STD_LOGIC_VECTOR(redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_i_valid <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_V0;
    -- Stall signal propagation
    SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_backStall <= SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_r_valid or not (SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_i_valid);

    -- Valid
    SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_V <= SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_r_valid WHEN SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_r_valid = "1" ELSE SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_i_valid;

    SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_D0 <= SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_r_data0 WHEN SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_r_valid = "1" ELSE redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_1_q;

    -- redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2(REG,67)
    redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_backEN = "1") THEN
                redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_q <= STD_LOGIC_VECTOR(SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3(REG,68)
    redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_backEN = "1") THEN
                redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_q <= STD_LOGIC_VECTOR(redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3(STALLENABLE,175)
    -- Valid signal propagation
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_V0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_R_v_0;
    -- Stall signal propagation
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_s_tv_0 <= SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_backStall and SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_R_v_0;
    -- Backward Enable generation
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_backEN <= not (SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_v_s_0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_backEN and SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_2_V0;
    -- Backward Stall generation
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_backStall <= not (SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_v_s_0);
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_backEN = "0") THEN
                SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_R_v_0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_R_v_0 and SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_s_tv_0;
            ELSE
                SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_R_v_0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4(STALLREG,284)
    SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_r_valid <= (others => '0');
            SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_r_valid <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_backStall and (SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_r_valid or SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_i_valid);

            IF (SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_r_data0 <= STD_LOGIC_VECTOR(redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_i_valid <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_V0;
    -- Stall signal propagation
    SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_backStall <= SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_r_valid or not (SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_i_valid);

    -- Valid
    SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_V <= SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_r_valid WHEN SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_r_valid = "1" ELSE SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_i_valid;

    SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_D0 <= SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_r_data0 WHEN SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_r_valid = "1" ELSE redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_3_q;

    -- SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4(STALLENABLE,176)
    -- Valid signal propagation
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_V0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_R_v_0;
    -- Stall signal propagation
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_s_tv_0 <= SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_backStall and SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_R_v_0;
    -- Backward Enable generation
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_backEN <= not (SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_v_s_0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_backEN and SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_V;
    -- Backward Stall generation
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_backStall <= not (SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_backEN);
    SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_backEN = "0") THEN
                SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_R_v_0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_R_v_0 and SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_s_tv_0;
            ELSE
                SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_R_v_0 <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4(STALLENABLE,163)
    -- Valid signal propagation
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_V0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_R_v_0;
    -- Stall signal propagation
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_s_tv_0 <= SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_backStall and SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_R_v_0;
    -- Backward Enable generation
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_backEN <= not (SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_v_s_0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_backEN and SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_V;
    -- Backward Stall generation
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_backStall <= not (SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_backEN);
    SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_backEN = "0") THEN
                SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_R_v_0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_R_v_0 and SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_s_tv_0;
            ELSE
                SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_R_v_0 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4(STALLENABLE,185)
    -- Valid signal propagation
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_V0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_R_v_0;
    -- Stall signal propagation
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_s_tv_0 <= SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_backStall and SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_R_v_0;
    -- Backward Enable generation
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_backEN <= not (SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_v_s_0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_backEN and SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_V;
    -- Backward Stall generation
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_backStall <= not (SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_backEN);
    SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_backEN = "0") THEN
                SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_R_v_0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_R_v_0 and SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_s_tv_0;
            ELSE
                SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_R_v_0 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo(BITJOIN,136)
    bubble_join_redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_q <= redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_data_out;

    -- bubble_select_redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo(BITSELECT,137)
    bubble_select_redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_q(0 downto 0));

    -- bubble_join_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo(BITJOIN,139)
    bubble_join_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_q <= redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_data_out;

    -- bubble_select_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo(BITSELECT,140)
    bubble_select_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_q(0 downto 0));

    -- bubble_join_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x(BITJOIN,86)
    bubble_join_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_q <= i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_15 & i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_14 & i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_13 & i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_12 & i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_11 & i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_10 & i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_9 & i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_8 & i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_7 & i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_6 & i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_5 & i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_4 & i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_3 & i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_2 & i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_1 & i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_o_readdata_0;

    -- bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x(BITSELECT,87)
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_q(15 downto 0));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_q(31 downto 16));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_q(47 downto 32));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_q(63 downto 48));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_q(79 downto 64));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_q(95 downto 80));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_q(111 downto 96));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_q(127 downto 112));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_q(143 downto 128));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_q(159 downto 144));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_q(175 downto 160));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_q(191 downto 176));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_q(207 downto 192));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_q(223 downto 208));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_p <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_q(239 downto 224));
    bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_q <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_q(255 downto 240));

    -- i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x(BLACKBOX,19)@162
    -- in in_i_stall@20000000
    -- out out_c1_exit_0@167
    -- out out_memdep_avm_address@20000000
    -- out out_memdep_avm_burstcount@20000000
    -- out out_memdep_avm_byteenable@20000000
    -- out out_memdep_avm_enable@20000000
    -- out out_memdep_avm_read@20000000
    -- out out_memdep_avm_write@20000000
    -- out out_memdep_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@167
    thei_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x : i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw
    PORT MAP (
        in_c1_eni6_0 => GND_q,
        in_c1_eni6_1 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_b,
        in_c1_eni6_2 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_c,
        in_c1_eni6_3 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_d,
        in_c1_eni6_4 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_e,
        in_c1_eni6_5 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_f,
        in_c1_eni6_6 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_g,
        in_c1_eni6_7 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_h,
        in_c1_eni6_8 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_i,
        in_c1_eni6_9 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_j,
        in_c1_eni6_10 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_k,
        in_c1_eni6_11 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_l,
        in_c1_eni6_12 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_m,
        in_c1_eni6_13 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_n,
        in_c1_eni6_14 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_o,
        in_c1_eni6_15 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_p,
        in_c1_eni6_16 => bubble_select_i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_q,
        in_c1_eni6_17 => bubble_select_redist3_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_152_fifo_b,
        in_c1_eni6_18 => bubble_select_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_b,
        in_c1_eni6_19 => bubble_select_redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_b,
        in_c1_eni6_20 => bubble_select_redist8_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_152_fifo_b,
        in_c1_eni6_21 => bubble_select_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_b,
        in_c0_exe9 => bubble_select_redist11_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_152_fifo_b,
        in_flush => in_flush,
        in_forked45 => bubble_select_redist16_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_0_161_fifo_b,
        in_i_stall => SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_backStall,
        in_i_valid => SE_out_redist17_gemm_nnfW_B2_merge_reg_aunroll_x_out_data_out_6_161_fifo_V0,
        in_memdep_avm_readdata => in_memdep_avm_readdata,
        in_memdep_avm_readdatavalid => in_memdep_avm_readdatavalid,
        in_memdep_avm_waitrequest => in_memdep_avm_waitrequest,
        in_memdep_avm_writeack => in_memdep_avm_writeack,
        out_memdep_avm_address => i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_memdep_avm_address,
        out_memdep_avm_burstcount => i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_memdep_avm_burstcount,
        out_memdep_avm_byteenable => i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_memdep_avm_byteenable,
        out_memdep_avm_enable => i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_memdep_avm_enable,
        out_memdep_avm_read => i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_memdep_avm_read,
        out_memdep_avm_write => i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_memdep_avm_write,
        out_memdep_avm_writedata => i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_memdep_avm_writedata,
        out_o_stall => i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo(STALLFIFO,52)
    redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V1;
    redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_stall_in <= SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_backStall;
    redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_b;
    redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_valid_in_bitsignaltemp <= redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_valid_in(0);
    redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_stall_in_bitsignaltemp <= redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_stall_in(0);
    redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_valid_out(0) <= redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_valid_out_bitsignaltemp;
    redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_stall_out(0) <= redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_stall_out_bitsignaltemp;
    theredist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 158,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_valid_in_bitsignaltemp,
        stall_in => redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_b,
        valid_out => redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_valid_out_bitsignaltemp,
        stall_out => redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_stall_out_bitsignaltemp,
        data_out => redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo(STALLFIFO,53)
    redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V2;
    redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_stall_in <= SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_backStall;
    redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_c;
    redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_valid_in_bitsignaltemp <= redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_valid_in(0);
    redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_stall_in_bitsignaltemp <= redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_stall_in(0);
    redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_valid_out(0) <= redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_valid_out_bitsignaltemp;
    redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_stall_out(0) <= redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_stall_out_bitsignaltemp;
    theredist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 158,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_c,
        valid_out => redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_stall_out_bitsignaltemp,
        data_out => redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo(STALLFIFO,54)
    redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V3;
    redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_stall_in <= SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_backStall;
    redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_d;
    redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_valid_in_bitsignaltemp <= redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_valid_in(0);
    redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_stall_in_bitsignaltemp <= redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_stall_in(0);
    redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_valid_out(0) <= redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_valid_out_bitsignaltemp;
    redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_stall_out(0) <= redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_stall_out_bitsignaltemp;
    theredist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 158,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_valid_in_bitsignaltemp,
        stall_in => redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_d,
        valid_out => redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_valid_out_bitsignaltemp,
        stall_out => redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_stall_out_bitsignaltemp,
        data_out => redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo(STALLFIFO,61)
    redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V5;
    redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_stall_in <= SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_backStall;
    redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_f;
    redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_valid_in_bitsignaltemp <= redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_valid_in(0);
    redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_stall_in_bitsignaltemp <= redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_stall_in(0);
    redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_valid_out(0) <= redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_valid_out_bitsignaltemp;
    redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_stall_out(0) <= redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_stall_out_bitsignaltemp;
    theredist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 158,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_f,
        valid_out => redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_stall_out_bitsignaltemp,
        data_out => redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo(STALLFIFO,62)
    redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V6;
    redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_stall_in <= SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_backStall;
    redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_g;
    redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_valid_in_bitsignaltemp <= redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_valid_in(0);
    redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_stall_in_bitsignaltemp <= redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_stall_in(0);
    redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_valid_out(0) <= redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_valid_out_bitsignaltemp;
    redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_stall_out(0) <= redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_stall_out_bitsignaltemp;
    theredist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 158,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_valid_in_bitsignaltemp,
        stall_in => redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_g,
        valid_out => redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_valid_out_bitsignaltemp,
        stall_out => redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_stall_out_bitsignaltemp,
        data_out => redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo(STALLFIFO,63)
    redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V7;
    redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_stall_in <= SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_backStall;
    redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_h;
    redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_valid_in_bitsignaltemp <= redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_valid_in(0);
    redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_stall_in_bitsignaltemp <= redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_stall_in(0);
    redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_valid_out(0) <= redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_valid_out_bitsignaltemp;
    redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_stall_out(0) <= redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_stall_out_bitsignaltemp;
    theredist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 158,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_valid_in_bitsignaltemp,
        stall_in => redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_h,
        valid_out => redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_valid_out_bitsignaltemp,
        stall_out => redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_stall_out_bitsignaltemp,
        data_out => redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo(STALLFIFO,70)
    redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V9;
    redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_stall_in <= SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_backStall;
    redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_j;
    redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_valid_in_bitsignaltemp <= redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_valid_in(0);
    redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_stall_in_bitsignaltemp <= redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_stall_in(0);
    redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_valid_out(0) <= redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_valid_out_bitsignaltemp;
    redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_stall_out(0) <= redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_stall_out_bitsignaltemp;
    theredist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 158,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_valid_in_bitsignaltemp,
        stall_in => redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_j,
        valid_out => redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_valid_out_bitsignaltemp,
        stall_out => redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_stall_out_bitsignaltemp,
        data_out => redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo(STALLFIFO,77)
    redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V11;
    redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_stall_in <= SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_backStall;
    redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_l;
    redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_valid_in_bitsignaltemp <= redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_valid_in(0);
    redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_stall_in_bitsignaltemp <= redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_stall_in(0);
    redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_valid_out(0) <= redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_valid_out_bitsignaltemp;
    redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_stall_out(0) <= redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_stall_out_bitsignaltemp;
    theredist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 158,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_valid_in_bitsignaltemp,
        stall_in => redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_l,
        valid_out => redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_valid_out_bitsignaltemp,
        stall_out => redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_stall_out_bitsignaltemp,
        data_out => redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo(STALLFIFO,78)
    redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V12;
    redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_stall_in <= SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_backStall;
    redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_m;
    redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_valid_in_bitsignaltemp <= redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_valid_in(0);
    redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_stall_in_bitsignaltemp <= redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_stall_in(0);
    redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_valid_out(0) <= redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_valid_out_bitsignaltemp;
    redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_stall_out(0) <= redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_stall_out_bitsignaltemp;
    theredist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 158,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_valid_in_bitsignaltemp,
        stall_in => redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_m,
        valid_out => redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_valid_out_bitsignaltemp,
        stall_out => redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_stall_out_bitsignaltemp,
        data_out => redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo(STALLFIFO,79)
    redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_valid_in <= SE_out_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_V13;
    redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_stall_in <= SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_backStall;
    redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_data_in <= bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_n;
    redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_valid_in_bitsignaltemp <= redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_valid_in(0);
    redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_stall_in_bitsignaltemp <= redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_stall_in(0);
    redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_valid_out(0) <= redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_valid_out_bitsignaltemp;
    redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_stall_out(0) <= redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_stall_out_bitsignaltemp;
    theredist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 158,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_valid_in_bitsignaltemp,
        stall_in => redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_n,
        valid_out => redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_valid_out_bitsignaltemp,
        stall_out => redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_stall_out_bitsignaltemp,
        data_out => redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo(STALLENABLE,191)
    -- Valid signal propagation
    SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_V0 <= SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_backStall <= in_stall_in or not (SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and0 <= redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_valid_out;
    SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and1 <= redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_valid_out and SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and0;
    SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and2 <= redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_valid_out and SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and1;
    SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and3 <= redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_valid_out and SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and2;
    SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and4 <= redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_valid_out and SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and3;
    SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and5 <= redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_valid_out and SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and4;
    SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and6 <= redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_valid_out and SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and5;
    SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and7 <= redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_valid_out and SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and6;
    SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and8 <= redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_valid_out and SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and7;
    SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and9 <= redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_valid_out and SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and8;
    SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and10 <= i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_o_valid and SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and9;
    SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and11 <= SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_V0 and SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and10;
    SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and12 <= SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_V0 and SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and11;
    SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_wireValid <= SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_V0 and SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_and12;

    -- bubble_join_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo(BITJOIN,133)
    bubble_join_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_q <= redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_data_out;

    -- bubble_select_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo(BITSELECT,134)
    bubble_select_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_q(0 downto 0));

    -- bubble_join_redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo(BITJOIN,130)
    bubble_join_redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_q <= redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_data_out;

    -- bubble_select_redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo(BITSELECT,131)
    bubble_select_redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_q(0 downto 0));

    -- bubble_join_redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo(BITJOIN,127)
    bubble_join_redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_q <= redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_data_out;

    -- bubble_select_redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo(BITSELECT,128)
    bubble_select_redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_q(0 downto 0));

    -- redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4(REG,69)
    redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_backEN = "1") THEN
                redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_q <= STD_LOGIC_VECTOR(SR_SE_redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo(BITJOIN,115)
    bubble_join_redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_q <= redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_data_out;

    -- bubble_select_redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo(BITSELECT,116)
    bubble_select_redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_q(0 downto 0));

    -- bubble_join_redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo(BITJOIN,112)
    bubble_join_redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_q <= redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_data_out;

    -- bubble_select_redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo(BITSELECT,113)
    bubble_select_redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_q(0 downto 0));

    -- bubble_join_redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo(BITJOIN,109)
    bubble_join_redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_q <= redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_data_out;

    -- bubble_select_redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo(BITSELECT,110)
    bubble_select_redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_q(63 downto 0));

    -- redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4(REG,60)
    redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_backEN = "1") THEN
                redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_q <= STD_LOGIC_VECTOR(SR_SE_redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo(BITJOIN,103)
    bubble_join_redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_q <= redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_data_out;

    -- bubble_select_redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo(BITSELECT,104)
    bubble_select_redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_q(31 downto 0));

    -- bubble_join_redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo(BITJOIN,100)
    bubble_join_redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_q <= redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_data_out;

    -- bubble_select_redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo(BITSELECT,101)
    bubble_select_redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_q(31 downto 0));

    -- bubble_join_redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo(BITJOIN,97)
    bubble_join_redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_q <= redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_data_out;

    -- bubble_select_redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo(BITSELECT,98)
    bubble_select_redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_q(0 downto 0));

    -- redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4(REG,76)
    redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_backEN = "1") THEN
                redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_q <= STD_LOGIC_VECTOR(SR_SE_redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_D0);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo(BITJOIN,121)
    bubble_join_redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_q <= redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_data_out;

    -- bubble_select_redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo(BITSELECT,122)
    bubble_select_redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_q(31 downto 0));

    -- dupName_0_sync_out_aunroll_x(GPOUT,2)@167
    out_c0_exe8 <= bubble_select_redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_b;
    out_c0_exe9 <= redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_q;
    out_c0_exit62_0 <= bubble_select_redist0_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_0_157_fifo_b;
    out_c0_exit62_1 <= bubble_select_redist1_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_1_157_fifo_b;
    out_c0_exit62_2 <= bubble_select_redist2_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_2_157_fifo_b;
    out_c0_exit62_3 <= redist4_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_3_157_4_q;
    out_c0_exit62_4 <= bubble_select_redist5_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_4_157_fifo_b;
    out_c0_exit62_5 <= bubble_select_redist6_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_5_157_fifo_b;
    out_c0_exit62_6 <= bubble_select_redist7_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_6_157_fifo_b;
    out_c0_exit62_7 <= redist9_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_7_157_4_q;
    out_c0_exit62_8 <= bubble_select_redist10_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_8_157_fifo_b;
    out_c0_exit62_9 <= redist12_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_9_157_4_q;
    out_c0_exit62_10 <= bubble_select_redist13_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_10_157_fifo_b;
    out_c0_exit62_11 <= bubble_select_redist14_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_11_157_fifo_b;
    out_c0_exit62_12 <= bubble_select_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_b;
    out_valid_out <= SE_out_redist15_i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_c0_exit62_12_157_fifo_V0;

    -- dupName_0_ext_sig_sync_out_x(GPOUT,4)
    out_memcoalesce_B_load_0_avm_address <= i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_B_load_0_avm_address;
    out_memcoalesce_B_load_0_avm_enable <= i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_B_load_0_avm_enable;
    out_memcoalesce_B_load_0_avm_read <= i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_B_load_0_avm_read;
    out_memcoalesce_B_load_0_avm_write <= i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_B_load_0_avm_write;
    out_memcoalesce_B_load_0_avm_writedata <= i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_B_load_0_avm_writedata;
    out_memcoalesce_B_load_0_avm_byteenable <= i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_B_load_0_avm_byteenable;
    out_memcoalesce_B_load_0_avm_burstcount <= i_load_memcoalesce_b_load_0_gemm_nnfw_aunroll_x_out_memcoalesce_B_load_0_avm_burstcount;

    -- dupName_1_ext_sig_sync_out_x(GPOUT,9)
    out_memdep_avm_address <= i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_memdep_avm_address;
    out_memdep_avm_enable <= i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_memdep_avm_enable;
    out_memdep_avm_read <= i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_memdep_avm_read;
    out_memdep_avm_write <= i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_memdep_avm_write;
    out_memdep_avm_writedata <= i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_memdep_avm_writedata;
    out_memdep_avm_byteenable <= i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_memdep_avm_byteenable;
    out_memdep_avm_burstcount <= i_sfc_c1_for_body4_gemm_nnfw_c1_enter_gemm_nnfw_aunroll_x_out_memdep_avm_burstcount;

    -- ext_sig_sync_out(GPOUT,24)
    out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nnfw_exiting_valid_out <= i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nnfw_exiting_valid_out;
    out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nnfw_exiting_stall_out <= i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going_gemm_nnfw_exiting_stall_out;

    -- pipeline_valid_out_sync(GPOUT,28)
    out_pipeline_valid_out <= i_sfc_c0_for_body4_gemm_nnfw_c0_enter57_gemm_nnfw_aunroll_x_out_pipeline_valid_out;

    -- sync_out(GPOUT,33)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
