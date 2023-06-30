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

-- VHDL created from bb_gemm_nnfW_B4_stall_region
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

entity bb_gemm_nnfW_B4_stall_region is
    port (
        out_unnamed_gemm_nnfW5_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_unnamed_gemm_nnfW5_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW5_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW5_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW5_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_unnamed_gemm_nnfW5_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_gemm_nnfW5_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_M : in std_logic_vector(31 downto 0);  -- ufix32
        in_cmp380_RM39 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp88_RM37 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked32 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi6_pop1143 : in std_logic_vector(0 downto 0);  -- ufix1
        in_mul1141 : in std_logic_vector(31 downto 0);  -- ufix32
        in_notexit2933 : in std_logic_vector(0 downto 0);  -- ufix1
        in_sdiv_sh125_RM35 : in std_logic_vector(31 downto 0);  -- ufix32
        in_unnamed_gemm_nnfW3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW4 : in std_logic_vector(32 downto 0);  -- ufix33
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_N : in std_logic_vector(31 downto 0);  -- ufix32
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW5_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_unnamed_gemm_nnfW5_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_C : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nnfW_B4_stall_region;

architecture normal of bb_gemm_nnfW_B4_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component gemm_nnfW_B4_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_7 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_data_in_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_7 : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_data_out_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw is
        port (
            in_c0_eni9_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni9_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni9_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni9_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni9_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni9_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni9_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni9_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni9_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni9_9 : in std_logic_vector(32 downto 0);  -- Fixed Point
            in_C : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit97_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit97_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit97_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit97_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit97_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit97_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit97_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit97_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit97_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit97_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit97_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit97_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit97_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit97_13 : out std_logic_vector(32 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c1_for_body10_gemm_nnfw_c1_enter111_gemm_nnfw is
        port (
            in_c1_eni1110_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni1110_1 : in std_logic_vector(15 downto 0);  -- Floating Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit113_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit113_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_unnamed_gemm_nnfw5_gemm_nnfw161 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW5_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_unnamed_gemm_nnfW5_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata : out std_logic_vector(15 downto 0);  -- Floating Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW5_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW5_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW5_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW5_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW5_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW5_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_unnamed_gemm_nnfW5_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_m_sync_buffer7_gemm_nnfw103 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_n_sync_buffer10_gemm_nnfw101 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
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
    signal gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (32 downto 0);
    signal gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B4_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13 : STD_LOGIC_VECTOR (32 downto 0);
    signal i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body10_gemm_nnfw_c1_enter111_gemm_nnfw_aunroll_x_out_c1_exit113_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c1_for_body10_gemm_nnfw_c1_enter111_gemm_nnfw_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_for_body10_gemm_nnfw_c1_enter111_gemm_nnfw_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_c1_exe1_gemm_nnfw_vt_const_2_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_c1_exe1_gemm_nnfw_vt_const_63_q : STD_LOGIC_VECTOR (26 downto 0);
    signal i_c1_exe1_gemm_nnfw_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_o_readdata : STD_LOGIC_VECTOR (15 downto 0);
    signal i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_unnamed_gemm_nnfW5_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_unnamed_gemm_nnfW5_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_unnamed_gemm_nnfW5_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_unnamed_gemm_nnfW5_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_unnamed_gemm_nnfW5_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_unnamed_gemm_nnfW5_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_unnamed_gemm_nnfW5_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_notlhs_gemm_nnfw_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_notlhs_gemm_nnfw_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_notlhs_gemm_nnfw_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_notlhs_gemm_nnfw_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_notrhs_gemm_nnfw_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_notrhs_gemm_nnfw_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_notrhs_gemm_nnfw_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_notrhs_gemm_nnfw_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phi_decision156_xor_rm_gemm_nnfw_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_phi_decision156_xor_rm_gemm_nnfw_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_m_sync_buffer7_gemm_nnfw_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_m_sync_buffer7_gemm_nnfw_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_m_sync_buffer7_gemm_nnfw_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_n_sync_buffer10_gemm_nnfw_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_n_sync_buffer10_gemm_nnfw_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_n_sync_buffer10_gemm_nnfw_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_c1_exe1_gemm_nnfw_vt_select_34_merged_bit_select_in : STD_LOGIC_VECTOR (36 downto 0);
    signal i_c1_exe1_gemm_nnfw_vt_select_34_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_c1_exe1_gemm_nnfw_vt_select_34_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_data_in : STD_LOGIC_VECTOR (63 downto 0);
    signal redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_data_in : STD_LOGIC_VECTOR (31 downto 0);
    signal redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_data_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_valid_in_bitsignaltemp : std_logic;
    signal redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_stall_in_bitsignaltemp : std_logic;
    signal redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_data_in : STD_LOGIC_VECTOR (32 downto 0);
    signal redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_valid_out_bitsignaltemp : std_logic;
    signal redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_stall_out_bitsignaltemp : std_logic;
    signal redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_data_out : STD_LOGIC_VECTOR (32 downto 0);
    signal bubble_join_gemm_nnfW_B4_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (102 downto 0);
    signal bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_f : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_i : STD_LOGIC_VECTOR (32 downto 0);
    signal bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_j : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_q : STD_LOGIC_VECTOR (199 downto 0);
    signal bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_c : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_h : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_i : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_j : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_k : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_l : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_m : STD_LOGIC_VECTOR (32 downto 0);
    signal bubble_join_i_sfc_c1_for_body10_gemm_nnfw_c1_enter111_gemm_nnfw_aunroll_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c1_for_body10_gemm_nnfw_c1_enter111_gemm_nnfw_aunroll_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_load_unnamed_gemm_nnfw5_gemm_nnfw_q : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_select_i_load_unnamed_gemm_nnfw5_gemm_nnfw_b : STD_LOGIC_VECTOR (15 downto 0);
    signal bubble_join_i_syncbuf_m_sync_buffer7_gemm_nnfw_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_m_sync_buffer7_gemm_nnfw_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_syncbuf_n_sync_buffer10_gemm_nnfw_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_syncbuf_n_sync_buffer10_gemm_nnfw_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (102 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_g : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_i : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_j : STD_LOGIC_VECTOR (32 downto 0);
    signal bubble_join_redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_q : STD_LOGIC_VECTOR (32 downto 0);
    signal bubble_select_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_b : STD_LOGIC_VECTOR (32 downto 0);
    signal SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V12 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_load_unnamed_gemm_nnfw5_gemm_nnfw_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_load_unnamed_gemm_nnfw5_gemm_nnfw_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_load_unnamed_gemm_nnfw5_gemm_nnfw_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_in_i_load_unnamed_gemm_nnfw5_gemm_nnfw_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_gemm_nnfw5_gemm_nnfw_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_gemm_nnfw5_gemm_nnfw_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_unnamed_gemm_nnfw5_gemm_nnfw_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_notlhs_gemm_nnfw_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_notlhs_gemm_nnfw_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_notlhs_gemm_nnfw_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_notlhs_gemm_nnfw_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_notlhs_gemm_nnfw_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_notlhs_gemm_nnfw_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_notrhs_gemm_nnfw_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_notrhs_gemm_nnfw_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_notrhs_gemm_nnfw_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_notrhs_gemm_nnfw_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_notrhs_gemm_nnfw_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_notrhs_gemm_nnfw_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_phi_decision156_xor_rm_gemm_nnfw_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_phi_decision156_xor_rm_gemm_nnfw_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_phi_decision156_xor_rm_gemm_nnfw_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_phi_decision156_xor_rm_gemm_nnfw_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_phi_decision156_xor_rm_gemm_nnfw_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_phi_decision156_xor_rm_gemm_nnfw_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_phi_decision156_xor_rm_gemm_nnfw_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_m_sync_buffer7_gemm_nnfw_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_m_sync_buffer7_gemm_nnfw_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_m_sync_buffer7_gemm_nnfw_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_n_sync_buffer10_gemm_nnfw_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_n_sync_buffer10_gemm_nnfw_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_n_sync_buffer10_gemm_nnfw_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and3 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and4 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and5 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and6 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and7 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and8 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and9 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and10 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and11 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_D0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_r_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_r_data0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_V : STD_LOGIC_VECTOR (0 downto 0);
    signal SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_D0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- bubble_join_i_load_unnamed_gemm_nnfw5_gemm_nnfw(BITJOIN,95)
    bubble_join_i_load_unnamed_gemm_nnfw5_gemm_nnfw_q <= i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_o_readdata;

    -- bubble_select_i_load_unnamed_gemm_nnfw5_gemm_nnfw(BITSELECT,96)
    bubble_select_i_load_unnamed_gemm_nnfw5_gemm_nnfw_b <= STD_LOGIC_VECTOR(bubble_join_i_load_unnamed_gemm_nnfw5_gemm_nnfw_q(15 downto 0));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c1_for_body10_gemm_nnfw_c1_enter111_gemm_nnfw_aunroll_x(BLACKBOX,20)@128
    -- in in_i_stall@20000000
    -- out out_c1_exit113_0@133
    -- out out_c1_exit113_1@133
    -- out out_o_stall@20000000
    -- out out_o_valid@133
    thei_sfc_c1_for_body10_gemm_nnfw_c1_enter111_gemm_nnfw_aunroll_x : i_sfc_c1_for_body10_gemm_nnfw_c1_enter111_gemm_nnfw
    PORT MAP (
        in_c1_eni1110_0 => GND_q,
        in_c1_eni1110_1 => bubble_select_i_load_unnamed_gemm_nnfw5_gemm_nnfw_b,
        in_i_stall => SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_backStall,
        in_i_valid => SE_out_i_load_unnamed_gemm_nnfw5_gemm_nnfw_V0,
        out_c1_exit113_1 => i_sfc_c1_for_body10_gemm_nnfw_c1_enter111_gemm_nnfw_aunroll_x_out_c1_exit113_1,
        out_o_stall => i_sfc_c1_for_body10_gemm_nnfw_c1_enter111_gemm_nnfw_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c1_for_body10_gemm_nnfw_c1_enter111_gemm_nnfw_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo(STALLENABLE,189)
    -- Valid signal propagation
    SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_V0 <= SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_wireValid;
    -- Backward Stall generation
    SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_backStall <= in_stall_in or not (SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_wireValid);
    -- Computing multiple Valid(s)
    SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and0 <= redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_valid_out;
    SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and1 <= redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_valid_out and SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and0;
    SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and2 <= redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_valid_out and SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and1;
    SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and3 <= redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_valid_out and SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and2;
    SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and4 <= redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_valid_out and SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and3;
    SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and5 <= redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_valid_out and SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and4;
    SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and6 <= redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_valid_out and SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and5;
    SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and7 <= redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_valid_out and SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and6;
    SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and8 <= redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_valid_out and SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and7;
    SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and9 <= redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_valid_out and SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and8;
    SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and10 <= redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_valid_out and SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and9;
    SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and11 <= redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_valid_out and SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and10;
    SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_wireValid <= i_sfc_c1_for_body10_gemm_nnfw_c1_enter111_gemm_nnfw_aunroll_x_out_o_valid and SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_and11;

    -- redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo(STALLFIFO,81)
    redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_valid_in <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V12;
    redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_stall_in <= SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_backStall;
    redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_data_in <= bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_m;
    redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_valid_in_bitsignaltemp <= redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_valid_in(0);
    redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_stall_in_bitsignaltemp <= redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_stall_in(0);
    redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_valid_out(0) <= redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_valid_out_bitsignaltemp;
    redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_stall_out(0) <= redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_stall_out_bitsignaltemp;
    theredist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 127,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 33,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_valid_in_bitsignaltemp,
        stall_in => redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_m,
        valid_out => redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_valid_out_bitsignaltemp,
        stall_out => redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_stall_out_bitsignaltemp,
        data_out => redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo(STALLFIFO,80)
    redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_valid_in <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V11;
    redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_stall_in <= SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_backStall;
    redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_data_in <= bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_l;
    redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_valid_in_bitsignaltemp <= redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_valid_in(0);
    redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_stall_in_bitsignaltemp <= redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_stall_in(0);
    redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_valid_out(0) <= redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_valid_out_bitsignaltemp;
    redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_stall_out(0) <= redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_stall_out_bitsignaltemp;
    theredist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 127,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_valid_in_bitsignaltemp,
        stall_in => redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_l,
        valid_out => redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_valid_out_bitsignaltemp,
        stall_out => redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_stall_out_bitsignaltemp,
        data_out => redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo(STALLFIFO,79)
    redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_valid_in <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V10;
    redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_stall_in <= SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_backStall;
    redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_data_in <= bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_k;
    redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_valid_in_bitsignaltemp <= redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_valid_in(0);
    redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_stall_in_bitsignaltemp <= redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_stall_in(0);
    redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_valid_out(0) <= redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_valid_out_bitsignaltemp;
    redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_stall_out(0) <= redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_stall_out_bitsignaltemp;
    theredist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 127,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_valid_in_bitsignaltemp,
        stall_in => redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_k,
        valid_out => redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_valid_out_bitsignaltemp,
        stall_out => redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_stall_out_bitsignaltemp,
        data_out => redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo(STALLFIFO,78)
    redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_valid_in <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V9;
    redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_stall_in <= SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_backStall;
    redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_data_in <= bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_j;
    redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_valid_in_bitsignaltemp <= redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_valid_in(0);
    redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_stall_in_bitsignaltemp <= redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_stall_in(0);
    redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_valid_out(0) <= redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_valid_out_bitsignaltemp;
    redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_stall_out(0) <= redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_stall_out_bitsignaltemp;
    theredist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 127,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_valid_in_bitsignaltemp,
        stall_in => redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_j,
        valid_out => redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_valid_out_bitsignaltemp,
        stall_out => redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_stall_out_bitsignaltemp,
        data_out => redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo(STALLFIFO,77)
    redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_valid_in <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V8;
    redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_stall_in <= SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_backStall;
    redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_data_in <= bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_i;
    redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_valid_in_bitsignaltemp <= redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_valid_in(0);
    redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_stall_in_bitsignaltemp <= redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_stall_in(0);
    redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_valid_out(0) <= redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_valid_out_bitsignaltemp;
    redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_stall_out(0) <= redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_stall_out_bitsignaltemp;
    theredist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 127,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_valid_in_bitsignaltemp,
        stall_in => redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_i,
        valid_out => redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_valid_out_bitsignaltemp,
        stall_out => redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_stall_out_bitsignaltemp,
        data_out => redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo(STALLFIFO,76)
    redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_valid_in <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V7;
    redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_stall_in <= SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_backStall;
    redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_data_in <= bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_h;
    redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_valid_in_bitsignaltemp <= redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_valid_in(0);
    redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_stall_in_bitsignaltemp <= redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_stall_in(0);
    redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_valid_out(0) <= redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_valid_out_bitsignaltemp;
    redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_stall_out(0) <= redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_stall_out_bitsignaltemp;
    theredist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 127,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_valid_in_bitsignaltemp,
        stall_in => redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_h,
        valid_out => redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_valid_out_bitsignaltemp,
        stall_out => redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_stall_out_bitsignaltemp,
        data_out => redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo(STALLFIFO,75)
    redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_valid_in <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V6;
    redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_stall_in <= SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_backStall;
    redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_data_in <= bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_g;
    redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_valid_in_bitsignaltemp <= redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_valid_in(0);
    redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_stall_in_bitsignaltemp <= redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_stall_in(0);
    redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_valid_out(0) <= redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_valid_out_bitsignaltemp;
    redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_stall_out(0) <= redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_stall_out_bitsignaltemp;
    theredist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 127,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_valid_in_bitsignaltemp,
        stall_in => redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_g,
        valid_out => redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_valid_out_bitsignaltemp,
        stall_out => redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_stall_out_bitsignaltemp,
        data_out => redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo(STALLFIFO,74)
    redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_valid_in <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V5;
    redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_stall_in <= SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_backStall;
    redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_data_in <= bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_f;
    redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_valid_in_bitsignaltemp <= redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_valid_in(0);
    redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_stall_in_bitsignaltemp <= redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_stall_in(0);
    redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_valid_out(0) <= redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_valid_out_bitsignaltemp;
    redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_stall_out(0) <= redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_stall_out_bitsignaltemp;
    theredist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 127,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_valid_in_bitsignaltemp,
        stall_in => redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_f,
        valid_out => redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_valid_out_bitsignaltemp,
        stall_out => redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_stall_out_bitsignaltemp,
        data_out => redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo(STALLFIFO,73)
    redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_valid_in <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V4;
    redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_stall_in <= SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_backStall;
    redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_data_in <= bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_e;
    redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_valid_in_bitsignaltemp <= redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_valid_in(0);
    redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_stall_in_bitsignaltemp <= redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_stall_in(0);
    redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_valid_out(0) <= redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_valid_out_bitsignaltemp;
    redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_stall_out(0) <= redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_stall_out_bitsignaltemp;
    theredist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 127,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_valid_in_bitsignaltemp,
        stall_in => redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_e,
        valid_out => redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_valid_out_bitsignaltemp,
        stall_out => redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_stall_out_bitsignaltemp,
        data_out => redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo(STALLFIFO,72)
    redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_valid_in <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V3;
    redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_stall_in <= SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_backStall;
    redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_data_in <= bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_d;
    redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_valid_in_bitsignaltemp <= redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_valid_in(0);
    redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_stall_in_bitsignaltemp <= redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_stall_in(0);
    redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_valid_out(0) <= redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_valid_out_bitsignaltemp;
    redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_stall_out(0) <= redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_stall_out_bitsignaltemp;
    theredist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 127,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 1,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_valid_in_bitsignaltemp,
        stall_in => redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_d,
        valid_out => redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_valid_out_bitsignaltemp,
        stall_out => redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_stall_out_bitsignaltemp,
        data_out => redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo(STALLFIFO,71)
    redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_valid_in <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V2;
    redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_stall_in <= SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_backStall;
    redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_data_in <= bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_c;
    redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_valid_in_bitsignaltemp <= redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_valid_in(0);
    redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_stall_in_bitsignaltemp <= redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_stall_in(0);
    redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_valid_out(0) <= redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_valid_out_bitsignaltemp;
    redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_stall_out(0) <= redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_stall_out_bitsignaltemp;
    theredist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 127,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 64,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_valid_in_bitsignaltemp,
        stall_in => redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_c,
        valid_out => redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_valid_out_bitsignaltemp,
        stall_out => redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_stall_out_bitsignaltemp,
        data_out => redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo(STALLFIFO,70)
    redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_valid_in <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V1;
    redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_stall_in <= SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_backStall;
    redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_data_in <= bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_b;
    redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_valid_in_bitsignaltemp <= redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_valid_in(0);
    redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_stall_in_bitsignaltemp <= redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_stall_in(0);
    redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_valid_out(0) <= redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_valid_out_bitsignaltemp;
    redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_stall_out(0) <= redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_stall_out_bitsignaltemp;
    theredist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo : acl_data_fifo
    GENERIC MAP (
        DEPTH => 127,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        DATA_WIDTH => 32,
        IMPL => "ram"
    )
    PORT MAP (
        valid_in => redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_valid_in_bitsignaltemp,
        stall_in => redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_stall_in_bitsignaltemp,
        data_in => bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_b,
        valid_out => redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_valid_out_bitsignaltemp,
        stall_out => redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_stall_out_bitsignaltemp,
        data_out => redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_data_out,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_1gr(CONSTANT,22)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- bubble_join_i_syncbuf_n_sync_buffer10_gemm_nnfw(BITJOIN,101)
    bubble_join_i_syncbuf_n_sync_buffer10_gemm_nnfw_q <= i_syncbuf_n_sync_buffer10_gemm_nnfw_out_buffer_out;

    -- bubble_select_i_syncbuf_n_sync_buffer10_gemm_nnfw(BITSELECT,102)
    bubble_select_i_syncbuf_n_sync_buffer10_gemm_nnfw_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_n_sync_buffer10_gemm_nnfw_q(31 downto 0));

    -- i_notlhs_gemm_nnfw(COMPARE,34)@1 + 1
    i_notlhs_gemm_nnfw_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => bubble_select_i_syncbuf_n_sync_buffer10_gemm_nnfw_b(31)) & bubble_select_i_syncbuf_n_sync_buffer10_gemm_nnfw_b));
    i_notlhs_gemm_nnfw_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_1gr_q(31)) & c_i32_1gr_q));
    i_notlhs_gemm_nnfw_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_notlhs_gemm_nnfw_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_notlhs_gemm_nnfw_backEN = "1") THEN
                i_notlhs_gemm_nnfw_o <= STD_LOGIC_VECTOR(SIGNED(i_notlhs_gemm_nnfw_a) - SIGNED(i_notlhs_gemm_nnfw_b));
            END IF;
        END IF;
    END PROCESS;
    i_notlhs_gemm_nnfw_c(0) <= i_notlhs_gemm_nnfw_o(33);

    -- bubble_join_i_syncbuf_m_sync_buffer7_gemm_nnfw(BITJOIN,98)
    bubble_join_i_syncbuf_m_sync_buffer7_gemm_nnfw_q <= i_syncbuf_m_sync_buffer7_gemm_nnfw_out_buffer_out;

    -- bubble_select_i_syncbuf_m_sync_buffer7_gemm_nnfw(BITSELECT,99)
    bubble_select_i_syncbuf_m_sync_buffer7_gemm_nnfw_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_m_sync_buffer7_gemm_nnfw_q(31 downto 0));

    -- i_notrhs_gemm_nnfw(COMPARE,35)@1 + 1
    i_notrhs_gemm_nnfw_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => bubble_select_i_syncbuf_m_sync_buffer7_gemm_nnfw_b(31)) & bubble_select_i_syncbuf_m_sync_buffer7_gemm_nnfw_b));
    i_notrhs_gemm_nnfw_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_1gr_q(31)) & c_i32_1gr_q));
    i_notrhs_gemm_nnfw_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            i_notrhs_gemm_nnfw_o <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_notrhs_gemm_nnfw_backEN = "1") THEN
                i_notrhs_gemm_nnfw_o <= STD_LOGIC_VECTOR(SIGNED(i_notrhs_gemm_nnfw_a) - SIGNED(i_notrhs_gemm_nnfw_b));
            END IF;
        END IF;
    END PROCESS;
    i_notrhs_gemm_nnfw_c(0) <= i_notrhs_gemm_nnfw_o(33);

    -- i_phi_decision156_xor_rm_gemm_nnfw(LOGICAL,36)@2 + 1
    i_phi_decision156_xor_rm_gemm_nnfw_qi <= i_notrhs_gemm_nnfw_c or i_notlhs_gemm_nnfw_c;
    i_phi_decision156_xor_rm_gemm_nnfw_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_phi_decision156_xor_rm_gemm_nnfw_qi, xout => i_phi_decision156_xor_rm_gemm_nnfw_q, ena => SE_i_phi_decision156_xor_rm_gemm_nnfw_backEN(0), clk => clock, aclr => resetn );

    -- redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0(REG,66)
    redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_backEN = "1") THEN
                redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_q <= STD_LOGIC_VECTOR(SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1(REG,67)
    redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_backEN = "1") THEN
                redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_q <= STD_LOGIC_VECTOR(redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_q);
            END IF;
        END IF;
    END PROCESS;

    -- SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2(STALLENABLE,164)
    -- Valid signal propagation
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_V0 <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_R_v_0;
    -- Stall signal propagation
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_s_tv_0 <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_backStall and SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_R_v_0;
    -- Backward Enable generation
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_backEN <= not (SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_v_s_0 <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_backEN and SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_V;
    -- Backward Stall generation
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_backStall <= not (SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_backEN);
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_backEN = "0") THEN
                SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_R_v_0 <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_R_v_0 and SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_s_tv_0;
            ELSE
                SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_R_v_0 <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2(STALLREG,275)
    SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_r_valid <= (others => '0');
            SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_r_valid <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_backStall and (SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_r_valid or SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_i_valid);

            IF (SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_r_data0 <= STD_LOGIC_VECTOR(redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_i_valid <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_V0;
    -- Stall signal propagation
    SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_backStall <= SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_r_valid or not (SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_i_valid);

    -- Valid
    SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_V <= SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_r_valid WHEN SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_r_valid = "1" ELSE SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_i_valid;

    SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_D0 <= SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_r_data0 WHEN SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_r_valid = "1" ELSE redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_q;

    -- SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1(STALLENABLE,163)
    -- Valid signal propagation
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_V0 <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_R_v_0;
    -- Stall signal propagation
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_s_tv_0 <= SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_backStall and SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_R_v_0;
    -- Backward Enable generation
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_backEN <= not (SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_v_s_0 <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_backEN and SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_V0;
    -- Backward Stall generation
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_backStall <= not (SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_v_s_0);
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_backEN = "0") THEN
                SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_R_v_0 <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_R_v_0 and SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_s_tv_0;
            ELSE
                SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_R_v_0 <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0(STALLENABLE,162)
    -- Valid signal propagation
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_V0 <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_s_tv_0 <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_1_backStall and SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_backEN <= not (SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_v_s_0 <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_backEN and SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_V;
    -- Backward Stall generation
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_backStall <= not (SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_backEN);
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_backEN = "0") THEN
                SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_R_v_0 <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_R_v_0 and SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_s_tv_0;
            ELSE
                SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_R_v_0 <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0(STALLREG,274)
    SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_r_valid <= (others => '0');
            SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_r_data0 <= (others => '-');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Valid
            SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_r_valid <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_backStall and (SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_r_valid or SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_i_valid);

            IF (SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_r_valid = "0") THEN
                -- Data(s)
                SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_r_data0 <= STD_LOGIC_VECTOR(i_phi_decision156_xor_rm_gemm_nnfw_q);
            END IF;

        END IF;
    END PROCESS;
    -- Computing multiple Valid(s)
    SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_i_valid <= SE_i_phi_decision156_xor_rm_gemm_nnfw_V0;
    -- Stall signal propagation
    SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_backStall <= SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_r_valid or not (SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_i_valid);

    -- Valid
    SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_V <= SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_r_valid WHEN SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_r_valid = "1" ELSE SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_i_valid;

    SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_D0 <= SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_r_data0 WHEN SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_r_valid = "1" ELSE i_phi_decision156_xor_rm_gemm_nnfw_q;

    -- SE_out_i_syncbuf_m_sync_buffer7_gemm_nnfw(STALLENABLE,156)
    -- Valid signal propagation
    SE_out_i_syncbuf_m_sync_buffer7_gemm_nnfw_V0 <= SE_out_i_syncbuf_m_sync_buffer7_gemm_nnfw_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_m_sync_buffer7_gemm_nnfw_backStall <= SE_i_notrhs_gemm_nnfw_backStall or not (SE_out_i_syncbuf_m_sync_buffer7_gemm_nnfw_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_m_sync_buffer7_gemm_nnfw_wireValid <= i_syncbuf_m_sync_buffer7_gemm_nnfw_out_valid_out;

    -- SE_i_notrhs_gemm_nnfw(STALLENABLE,153)
    -- Valid signal propagation
    SE_i_notrhs_gemm_nnfw_V0 <= SE_i_notrhs_gemm_nnfw_R_v_0;
    -- Stall signal propagation
    SE_i_notrhs_gemm_nnfw_s_tv_0 <= SE_i_phi_decision156_xor_rm_gemm_nnfw_backStall and SE_i_notrhs_gemm_nnfw_R_v_0;
    -- Backward Enable generation
    SE_i_notrhs_gemm_nnfw_backEN <= not (SE_i_notrhs_gemm_nnfw_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_notrhs_gemm_nnfw_v_s_0 <= SE_i_notrhs_gemm_nnfw_backEN and SE_out_i_syncbuf_m_sync_buffer7_gemm_nnfw_V0;
    -- Backward Stall generation
    SE_i_notrhs_gemm_nnfw_backStall <= not (SE_i_notrhs_gemm_nnfw_v_s_0);
    SE_i_notrhs_gemm_nnfw_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_notrhs_gemm_nnfw_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_notrhs_gemm_nnfw_backEN = "0") THEN
                SE_i_notrhs_gemm_nnfw_R_v_0 <= SE_i_notrhs_gemm_nnfw_R_v_0 and SE_i_notrhs_gemm_nnfw_s_tv_0;
            ELSE
                SE_i_notrhs_gemm_nnfw_R_v_0 <= SE_i_notrhs_gemm_nnfw_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_phi_decision156_xor_rm_gemm_nnfw(STALLENABLE,154)
    -- Valid signal propagation
    SE_i_phi_decision156_xor_rm_gemm_nnfw_V0 <= SE_i_phi_decision156_xor_rm_gemm_nnfw_R_v_0;
    -- Stall signal propagation
    SE_i_phi_decision156_xor_rm_gemm_nnfw_s_tv_0 <= SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_0_backStall and SE_i_phi_decision156_xor_rm_gemm_nnfw_R_v_0;
    -- Backward Enable generation
    SE_i_phi_decision156_xor_rm_gemm_nnfw_backEN <= not (SE_i_phi_decision156_xor_rm_gemm_nnfw_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_phi_decision156_xor_rm_gemm_nnfw_and0 <= SE_i_notlhs_gemm_nnfw_V0 and SE_i_phi_decision156_xor_rm_gemm_nnfw_backEN;
    SE_i_phi_decision156_xor_rm_gemm_nnfw_v_s_0 <= SE_i_notrhs_gemm_nnfw_V0 and SE_i_phi_decision156_xor_rm_gemm_nnfw_and0;
    -- Backward Stall generation
    SE_i_phi_decision156_xor_rm_gemm_nnfw_backStall <= not (SE_i_phi_decision156_xor_rm_gemm_nnfw_v_s_0);
    SE_i_phi_decision156_xor_rm_gemm_nnfw_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_phi_decision156_xor_rm_gemm_nnfw_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_phi_decision156_xor_rm_gemm_nnfw_backEN = "0") THEN
                SE_i_phi_decision156_xor_rm_gemm_nnfw_R_v_0 <= SE_i_phi_decision156_xor_rm_gemm_nnfw_R_v_0 and SE_i_phi_decision156_xor_rm_gemm_nnfw_s_tv_0;
            ELSE
                SE_i_phi_decision156_xor_rm_gemm_nnfw_R_v_0 <= SE_i_phi_decision156_xor_rm_gemm_nnfw_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_i_notlhs_gemm_nnfw(STALLENABLE,152)
    -- Valid signal propagation
    SE_i_notlhs_gemm_nnfw_V0 <= SE_i_notlhs_gemm_nnfw_R_v_0;
    -- Stall signal propagation
    SE_i_notlhs_gemm_nnfw_s_tv_0 <= SE_i_phi_decision156_xor_rm_gemm_nnfw_backStall and SE_i_notlhs_gemm_nnfw_R_v_0;
    -- Backward Enable generation
    SE_i_notlhs_gemm_nnfw_backEN <= not (SE_i_notlhs_gemm_nnfw_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_notlhs_gemm_nnfw_v_s_0 <= SE_i_notlhs_gemm_nnfw_backEN and SE_out_i_syncbuf_n_sync_buffer10_gemm_nnfw_V0;
    -- Backward Stall generation
    SE_i_notlhs_gemm_nnfw_backStall <= not (SE_i_notlhs_gemm_nnfw_v_s_0);
    SE_i_notlhs_gemm_nnfw_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_notlhs_gemm_nnfw_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_notlhs_gemm_nnfw_backEN = "0") THEN
                SE_i_notlhs_gemm_nnfw_R_v_0 <= SE_i_notlhs_gemm_nnfw_R_v_0 and SE_i_notlhs_gemm_nnfw_s_tv_0;
            ELSE
                SE_i_notlhs_gemm_nnfw_R_v_0 <= SE_i_notlhs_gemm_nnfw_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_out_i_syncbuf_n_sync_buffer10_gemm_nnfw(STALLENABLE,158)
    -- Valid signal propagation
    SE_out_i_syncbuf_n_sync_buffer10_gemm_nnfw_V0 <= SE_out_i_syncbuf_n_sync_buffer10_gemm_nnfw_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_n_sync_buffer10_gemm_nnfw_backStall <= SE_i_notlhs_gemm_nnfw_backStall or not (SE_out_i_syncbuf_n_sync_buffer10_gemm_nnfw_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_n_sync_buffer10_gemm_nnfw_wireValid <= i_syncbuf_n_sync_buffer10_gemm_nnfw_out_valid_out;

    -- i_syncbuf_n_sync_buffer10_gemm_nnfw(BLACKBOX,38)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_n_sync_buffer10_gemm_nnfw : i_syncbuf_n_sync_buffer10_gemm_nnfw101
    PORT MAP (
        in_buffer_in => in_N,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_n_sync_buffer10_gemm_nnfw_backStall,
        in_valid_in => SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_V1,
        out_buffer_out => i_syncbuf_n_sync_buffer10_gemm_nnfw_out_buffer_out,
        out_stall_out => i_syncbuf_n_sync_buffer10_gemm_nnfw_out_stall_out,
        out_valid_out => i_syncbuf_n_sync_buffer10_gemm_nnfw_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_syncbuf_m_sync_buffer7_gemm_nnfw(BLACKBOX,37)@1
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_m_sync_buffer7_gemm_nnfw : i_syncbuf_m_sync_buffer7_gemm_nnfw103
    PORT MAP (
        in_buffer_in => in_M,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_m_sync_buffer7_gemm_nnfw_backStall,
        in_valid_in => SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_V0,
        out_buffer_out => i_syncbuf_m_sync_buffer7_gemm_nnfw_out_buffer_out,
        out_stall_out => i_syncbuf_m_sync_buffer7_gemm_nnfw_out_stall_out,
        out_valid_out => i_syncbuf_m_sync_buffer7_gemm_nnfw_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,159)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= gemm_nnfW_B4_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,104)
    bubble_join_stall_entry_q <= in_unnamed_gemm_nnfW4 & in_unnamed_gemm_nnfW3 & in_sdiv_sh125_RM35 & in_notexit2933 & in_mul1141 & in_memdep_phi6_pop1143 & in_forked32 & in_cmp88_RM37 & in_cmp380_RM39;

    -- bubble_select_stall_entry(BITSELECT,105)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(0 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1 downto 1));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2 downto 2));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(3 downto 3));
    bubble_select_stall_entry_f <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(35 downto 4));
    bubble_select_stall_entry_g <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(36 downto 36));
    bubble_select_stall_entry_h <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(68 downto 37));
    bubble_select_stall_entry_i <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(69 downto 69));
    bubble_select_stall_entry_j <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(102 downto 70));

    -- gemm_nnfW_B4_merge_reg_aunroll_x(BLACKBOX,18)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_data_out_1@1
    -- out out_data_out_2@1
    -- out out_data_out_3@1
    -- out out_data_out_4@1
    -- out out_data_out_5@1
    -- out out_data_out_6@1
    -- out out_data_out_7@1
    -- out out_data_out_8@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thegemm_nnfW_B4_merge_reg_aunroll_x : gemm_nnfW_B4_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_d,
        in_data_in_1 => bubble_select_stall_entry_i,
        in_data_in_2 => bubble_select_stall_entry_g,
        in_data_in_3 => bubble_select_stall_entry_h,
        in_data_in_4 => bubble_select_stall_entry_c,
        in_data_in_5 => bubble_select_stall_entry_b,
        in_data_in_6 => bubble_select_stall_entry_f,
        in_data_in_7 => bubble_select_stall_entry_j,
        in_data_in_8 => bubble_select_stall_entry_e,
        in_stall_in => SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_0,
        out_data_out_1 => gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_1,
        out_data_out_2 => gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_2,
        out_data_out_3 => gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_3,
        out_data_out_4 => gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_4,
        out_data_out_5 => gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_5,
        out_data_out_6 => gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_6,
        out_data_out_7 => gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_7,
        out_data_out_8 => gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_8,
        out_stall_out => gemm_nnfW_B4_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => gemm_nnfW_B4_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_gemm_nnfW_B4_merge_reg_aunroll_x(STALLENABLE,144)
    SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_fromReg1 <= (others => '0');
            SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_fromReg2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_fromReg0 <= SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_fromReg1 <= SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_fromReg2 <= SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_toReg2;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_consumed0 <= (not (i_syncbuf_m_sync_buffer7_gemm_nnfw_out_stall_out) and SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_fromReg0;
    SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_consumed1 <= (not (i_syncbuf_n_sync_buffer10_gemm_nnfw_out_stall_out) and SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_fromReg1;
    SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_consumed2 <= (not (i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_o_stall) and SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_wireValid) or SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_fromReg2;
    -- Consuming
    SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_StallValid <= SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_backStall and SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_wireValid;
    SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_toReg0 <= SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_StallValid and SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_consumed0;
    SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_toReg1 <= SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_StallValid and SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_consumed1;
    SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_toReg2 <= SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_StallValid and SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_consumed2;
    -- Backward Stall generation
    SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_or0 <= SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_consumed0;
    SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_or1 <= SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_consumed1 and SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_or0;
    SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_wireStall <= not (SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_consumed2 and SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_or1);
    SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_backStall <= SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_V0 <= SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_fromReg0);
    SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_V1 <= SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_fromReg1);
    SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_V2 <= SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_wireValid and not (SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_fromReg2);
    -- Computing multiple Valid(s)
    SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_wireValid <= gemm_nnfW_B4_merge_reg_aunroll_x_out_valid_out;

    -- bubble_join_gemm_nnfW_B4_merge_reg_aunroll_x(BITJOIN,83)
    bubble_join_gemm_nnfW_B4_merge_reg_aunroll_x_q <= gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_8 & gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_7 & gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_6 & gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_5 & gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_4 & gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_3 & gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_2 & gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_1 & gemm_nnfW_B4_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x(BITSELECT,84)
    bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B4_merge_reg_aunroll_x_q(0 downto 0));
    bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B4_merge_reg_aunroll_x_q(1 downto 1));
    bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B4_merge_reg_aunroll_x_q(2 downto 2));
    bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B4_merge_reg_aunroll_x_q(34 downto 3));
    bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B4_merge_reg_aunroll_x_q(35 downto 35));
    bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B4_merge_reg_aunroll_x_q(36 downto 36));
    bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B4_merge_reg_aunroll_x_q(68 downto 37));
    bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B4_merge_reg_aunroll_x_q(101 downto 69));
    bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_gemm_nnfW_B4_merge_reg_aunroll_x_q(102 downto 102));

    -- i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x(BLACKBOX,19)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit97_0@7
    -- out out_c0_exit97_1@7
    -- out out_c0_exit97_2@7
    -- out out_c0_exit97_3@7
    -- out out_c0_exit97_4@7
    -- out out_c0_exit97_5@7
    -- out out_c0_exit97_6@7
    -- out out_c0_exit97_7@7
    -- out out_c0_exit97_8@7
    -- out out_c0_exit97_9@7
    -- out out_c0_exit97_10@7
    -- out out_c0_exit97_11@7
    -- out out_c0_exit97_12@7
    -- out out_c0_exit97_13@7
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_stall_out@20000000
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_valid_out@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@7
    -- out out_pipeline_valid_out@20000000
    thei_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x : i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw
    PORT MAP (
        in_c0_eni9_0 => GND_q,
        in_c0_eni9_1 => bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_b,
        in_c0_eni9_2 => bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_h,
        in_c0_eni9_3 => bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_j,
        in_c0_eni9_4 => bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_e,
        in_c0_eni9_5 => bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_f,
        in_c0_eni9_6 => bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_c,
        in_c0_eni9_7 => bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_d,
        in_c0_eni9_8 => bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_g,
        in_c0_eni9_9 => bubble_select_gemm_nnfW_B4_merge_reg_aunroll_x_i,
        in_C => in_C,
        in_M => in_M,
        in_i_stall => SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_backStall,
        in_i_valid => SE_out_gemm_nnfW_B4_merge_reg_aunroll_x_V2,
        in_pipeline_stall_in => in_pipeline_stall_in,
        out_c0_exit97_1 => i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1,
        out_c0_exit97_2 => i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2,
        out_c0_exit97_3 => i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3,
        out_c0_exit97_4 => i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4,
        out_c0_exit97_5 => i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5,
        out_c0_exit97_6 => i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6,
        out_c0_exit97_7 => i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7,
        out_c0_exit97_8 => i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8,
        out_c0_exit97_10 => i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10,
        out_c0_exit97_11 => i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11,
        out_c0_exit97_12 => i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12,
        out_c0_exit97_13 => i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13,
        out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_stall_out => i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_valid_out => i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_valid_out,
        out_o_stall => i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_o_valid,
        out_pipeline_valid_out => i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x(STALLENABLE,146)
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg0 <= (others => '0');
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg1 <= (others => '0');
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg2 <= (others => '0');
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg3 <= (others => '0');
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg4 <= (others => '0');
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg5 <= (others => '0');
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg6 <= (others => '0');
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg7 <= (others => '0');
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg8 <= (others => '0');
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg9 <= (others => '0');
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg10 <= (others => '0');
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg11 <= (others => '0');
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg12 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg0 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg1 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg1;
            -- Succesor 2
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg2 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg2;
            -- Succesor 3
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg3 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg3;
            -- Succesor 4
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg4 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg4;
            -- Succesor 5
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg5 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg5;
            -- Succesor 6
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg6 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg6;
            -- Succesor 7
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg7 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg7;
            -- Succesor 8
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg8 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg8;
            -- Succesor 9
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg9 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg9;
            -- Succesor 10
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg10 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg10;
            -- Succesor 11
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg11 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg11;
            -- Succesor 12
            SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg12 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg12;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed0 <= (not (SE_in_i_load_unnamed_gemm_nnfw5_gemm_nnfw_backStall) and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg0;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed1 <= (not (redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_stall_out) and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg1;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed2 <= (not (redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_stall_out) and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg2;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed3 <= (not (redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_stall_out) and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg3;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed4 <= (not (redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_stall_out) and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg4;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed5 <= (not (redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_stall_out) and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg5;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed6 <= (not (redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_stall_out) and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg6;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed7 <= (not (redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_stall_out) and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg7;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed8 <= (not (redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_stall_out) and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg8;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed9 <= (not (redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_stall_out) and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg9;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed10 <= (not (redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_stall_out) and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg10;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed11 <= (not (redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_stall_out) and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg11;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed12 <= (not (redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_stall_out) and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid) or SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg12;
    -- Consuming
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_StallValid <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_backStall and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg0 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed0;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg1 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed1;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg2 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed2;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg3 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed3;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg4 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed4;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg5 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed5;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg6 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed6;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg7 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed7;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg8 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed8;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg9 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed9;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg10 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed10;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg11 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed11;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_toReg12 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_StallValid and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed12;
    -- Backward Stall generation
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or0 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed0;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or1 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed1 and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or0;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or2 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed2 and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or1;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or3 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed3 and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or2;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or4 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed4 and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or3;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or5 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed5 and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or4;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or6 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed6 and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or5;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or7 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed7 and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or6;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or8 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed8 and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or7;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or9 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed9 and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or8;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or10 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed10 and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or9;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or11 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed11 and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or10;
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireStall <= not (SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_consumed12 and SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_or11);
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_backStall <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V0 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg0);
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V1 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg1);
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V2 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg2);
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V3 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg3);
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V4 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg4);
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V5 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg5);
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V6 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg6);
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V7 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg7);
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V8 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg8);
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V9 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg9);
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V10 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg10);
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V11 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg11);
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V12 <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid and not (SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_fromReg12);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_wireValid <= i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_o_valid;

    -- SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3(STALLENABLE,165)
    -- Valid signal propagation
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_V0 <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_R_v_0;
    -- Stall signal propagation
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_s_tv_0 <= SE_in_i_load_unnamed_gemm_nnfw5_gemm_nnfw_backStall and SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_R_v_0;
    -- Backward Enable generation
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_backEN <= not (SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_v_s_0 <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_backEN and SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_V0;
    -- Backward Stall generation
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_backStall <= not (SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_v_s_0);
    SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_backEN = "0") THEN
                SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_R_v_0 <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_R_v_0 and SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_s_tv_0;
            ELSE
                SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_R_v_0 <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_in_i_load_unnamed_gemm_nnfw5_gemm_nnfw(STALLENABLE,150)
    -- Valid signal propagation
    SE_in_i_load_unnamed_gemm_nnfw5_gemm_nnfw_V0 <= SE_in_i_load_unnamed_gemm_nnfw5_gemm_nnfw_wireValid;
    -- Backward Stall generation
    SE_in_i_load_unnamed_gemm_nnfw5_gemm_nnfw_backStall <= i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_o_stall or not (SE_in_i_load_unnamed_gemm_nnfw5_gemm_nnfw_wireValid);
    -- Computing multiple Valid(s)
    SE_in_i_load_unnamed_gemm_nnfw5_gemm_nnfw_and0 <= SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_V0;
    SE_in_i_load_unnamed_gemm_nnfw5_gemm_nnfw_wireValid <= SE_out_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_V0 and SE_in_i_load_unnamed_gemm_nnfw5_gemm_nnfw_and0;

    -- SE_out_i_load_unnamed_gemm_nnfw5_gemm_nnfw(STALLENABLE,151)
    -- Valid signal propagation
    SE_out_i_load_unnamed_gemm_nnfw5_gemm_nnfw_V0 <= SE_out_i_load_unnamed_gemm_nnfw5_gemm_nnfw_wireValid;
    -- Backward Stall generation
    SE_out_i_load_unnamed_gemm_nnfw5_gemm_nnfw_backStall <= i_sfc_c1_for_body10_gemm_nnfw_c1_enter111_gemm_nnfw_aunroll_x_out_o_stall or not (SE_out_i_load_unnamed_gemm_nnfw5_gemm_nnfw_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_load_unnamed_gemm_nnfw5_gemm_nnfw_wireValid <= i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_o_valid;

    -- redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2(REG,68)
    redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_backEN = "1") THEN
                redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_q <= STD_LOGIC_VECTOR(SR_SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_D0);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3(REG,69)
    redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_backEN = "1") THEN
                redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_q <= STD_LOGIC_VECTOR(redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_2_q);
            END IF;
        END IF;
    END PROCESS;

    -- bubble_join_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x(BITJOIN,88)
    bubble_join_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_q <= i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13 & i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12 & i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11 & i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10 & i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8 & i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7 & i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6 & i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5 & i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4 & i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3 & i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2 & i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1;

    -- bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x(BITSELECT,89)
    bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_q(31 downto 0));
    bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_q(95 downto 32));
    bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_q(96 downto 96));
    bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_q(128 downto 97));
    bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_q(160 downto 129));
    bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_q(161 downto 161));
    bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_q(162 downto 162));
    bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_q(163 downto 163));
    bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_q(164 downto 164));
    bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_q(165 downto 165));
    bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_q(166 downto 166));
    bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_q(199 downto 167));

    -- i_load_unnamed_gemm_nnfw5_gemm_nnfw(BLACKBOX,33)@7
    -- in in_i_stall@20000000
    -- out out_o_readdata@128
    -- out out_o_stall@20000000
    -- out out_o_valid@128
    -- out out_unnamed_gemm_nnfW5_avm_address@20000000
    -- out out_unnamed_gemm_nnfW5_avm_burstcount@20000000
    -- out out_unnamed_gemm_nnfW5_avm_byteenable@20000000
    -- out out_unnamed_gemm_nnfW5_avm_enable@20000000
    -- out out_unnamed_gemm_nnfW5_avm_read@20000000
    -- out out_unnamed_gemm_nnfW5_avm_write@20000000
    -- out out_unnamed_gemm_nnfW5_avm_writedata@20000000
    thei_load_unnamed_gemm_nnfw5_gemm_nnfw : i_load_unnamed_gemm_nnfw5_gemm_nnfw161
    PORT MAP (
        in_flush => in_flush,
        in_i_address => bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_c,
        in_i_dependence => bubble_select_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_d,
        in_i_predicate => redist0_i_phi_decision156_xor_rm_gemm_nnfw_q_5_3_q,
        in_i_stall => SE_out_i_load_unnamed_gemm_nnfw5_gemm_nnfw_backStall,
        in_i_valid => SE_in_i_load_unnamed_gemm_nnfw5_gemm_nnfw_V0,
        in_unnamed_gemm_nnfW5_avm_readdata => in_unnamed_gemm_nnfW5_avm_readdata,
        in_unnamed_gemm_nnfW5_avm_readdatavalid => in_unnamed_gemm_nnfW5_avm_readdatavalid,
        in_unnamed_gemm_nnfW5_avm_waitrequest => in_unnamed_gemm_nnfW5_avm_waitrequest,
        in_unnamed_gemm_nnfW5_avm_writeack => in_unnamed_gemm_nnfW5_avm_writeack,
        out_o_readdata => i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_o_readdata,
        out_o_stall => i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_o_stall,
        out_o_valid => i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_o_valid,
        out_unnamed_gemm_nnfW5_avm_address => i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_unnamed_gemm_nnfW5_avm_address,
        out_unnamed_gemm_nnfW5_avm_burstcount => i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_unnamed_gemm_nnfW5_avm_burstcount,
        out_unnamed_gemm_nnfW5_avm_byteenable => i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_unnamed_gemm_nnfW5_avm_byteenable,
        out_unnamed_gemm_nnfW5_avm_enable => i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_unnamed_gemm_nnfW5_avm_enable,
        out_unnamed_gemm_nnfW5_avm_read => i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_unnamed_gemm_nnfW5_avm_read,
        out_unnamed_gemm_nnfW5_avm_write => i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_unnamed_gemm_nnfW5_avm_write,
        out_unnamed_gemm_nnfW5_avm_writedata => i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_unnamed_gemm_nnfW5_avm_writedata,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,2)
    out_unnamed_gemm_nnfW5_avm_address <= i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_unnamed_gemm_nnfW5_avm_address;
    out_unnamed_gemm_nnfW5_avm_enable <= i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_unnamed_gemm_nnfW5_avm_enable;
    out_unnamed_gemm_nnfW5_avm_read <= i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_unnamed_gemm_nnfW5_avm_read;
    out_unnamed_gemm_nnfW5_avm_write <= i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_unnamed_gemm_nnfW5_avm_write;
    out_unnamed_gemm_nnfW5_avm_writedata <= i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_unnamed_gemm_nnfW5_avm_writedata;
    out_unnamed_gemm_nnfW5_avm_byteenable <= i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_unnamed_gemm_nnfW5_avm_byteenable;
    out_unnamed_gemm_nnfW5_avm_burstcount <= i_load_unnamed_gemm_nnfw5_gemm_nnfw_out_unnamed_gemm_nnfW5_avm_burstcount;

    -- i_c1_exe1_gemm_nnfw_vt_const_63(CONSTANT,29)
    i_c1_exe1_gemm_nnfw_vt_const_63_q <= "000000000000000000000000000";

    -- bubble_join_i_sfc_c1_for_body10_gemm_nnfw_c1_enter111_gemm_nnfw_aunroll_x(BITJOIN,91)
    bubble_join_i_sfc_c1_for_body10_gemm_nnfw_c1_enter111_gemm_nnfw_aunroll_x_q <= i_sfc_c1_for_body10_gemm_nnfw_c1_enter111_gemm_nnfw_aunroll_x_out_c1_exit113_1;

    -- bubble_select_i_sfc_c1_for_body10_gemm_nnfw_c1_enter111_gemm_nnfw_aunroll_x(BITSELECT,92)
    bubble_select_i_sfc_c1_for_body10_gemm_nnfw_c1_enter111_gemm_nnfw_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_for_body10_gemm_nnfw_c1_enter111_gemm_nnfw_aunroll_x_q(63 downto 0));

    -- i_c1_exe1_gemm_nnfw_vt_select_34_merged_bit_select(BITSELECT,52)@133
    i_c1_exe1_gemm_nnfw_vt_select_34_merged_bit_select_in <= bubble_select_i_sfc_c1_for_body10_gemm_nnfw_c1_enter111_gemm_nnfw_aunroll_x_b(36 downto 0);
    i_c1_exe1_gemm_nnfw_vt_select_34_merged_bit_select_b <= i_c1_exe1_gemm_nnfw_vt_select_34_merged_bit_select_in(34 downto 3);
    i_c1_exe1_gemm_nnfw_vt_select_34_merged_bit_select_c <= i_c1_exe1_gemm_nnfw_vt_select_34_merged_bit_select_in(36 downto 36);

    -- i_c1_exe1_gemm_nnfw_vt_const_2(CONSTANT,27)
    i_c1_exe1_gemm_nnfw_vt_const_2_q <= "000";

    -- i_c1_exe1_gemm_nnfw_vt_join(BITJOIN,30)@133
    i_c1_exe1_gemm_nnfw_vt_join_q <= i_c1_exe1_gemm_nnfw_vt_const_63_q & i_c1_exe1_gemm_nnfw_vt_select_34_merged_bit_select_c & GND_q & i_c1_exe1_gemm_nnfw_vt_select_34_merged_bit_select_b & i_c1_exe1_gemm_nnfw_vt_const_2_q;

    -- bubble_join_redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo(BITJOIN,129)
    bubble_join_redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_q <= redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_data_out;

    -- bubble_select_redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo(BITSELECT,130)
    bubble_select_redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_q(0 downto 0));

    -- bubble_join_redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo(BITJOIN,126)
    bubble_join_redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_q <= redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_data_out;

    -- bubble_select_redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo(BITSELECT,127)
    bubble_select_redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_q(0 downto 0));

    -- bubble_join_redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo(BITJOIN,123)
    bubble_join_redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_q <= redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_data_out;

    -- bubble_select_redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo(BITSELECT,124)
    bubble_select_redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_q(0 downto 0));

    -- bubble_join_redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo(BITJOIN,120)
    bubble_join_redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_q <= redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_data_out;

    -- bubble_select_redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo(BITSELECT,121)
    bubble_select_redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_q(31 downto 0));

    -- bubble_join_redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo(BITJOIN,117)
    bubble_join_redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_q <= redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_data_out;

    -- bubble_select_redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo(BITSELECT,118)
    bubble_select_redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_q(31 downto 0));

    -- bubble_join_redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo(BITJOIN,114)
    bubble_join_redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_q <= redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_data_out;

    -- bubble_select_redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo(BITSELECT,115)
    bubble_select_redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_q(0 downto 0));

    -- bubble_join_redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo(BITJOIN,111)
    bubble_join_redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_q <= redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_data_out;

    -- bubble_select_redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo(BITSELECT,112)
    bubble_select_redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_q(63 downto 0));

    -- bubble_join_redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo(BITJOIN,108)
    bubble_join_redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_q <= redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_data_out;

    -- bubble_select_redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo(BITSELECT,109)
    bubble_select_redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_q(31 downto 0));

    -- bubble_join_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo(BITJOIN,141)
    bubble_join_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_q <= redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_data_out;

    -- bubble_select_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo(BITSELECT,142)
    bubble_select_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_q(32 downto 0));

    -- bubble_join_redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo(BITJOIN,138)
    bubble_join_redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_q <= redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_data_out;

    -- bubble_select_redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo(BITSELECT,139)
    bubble_select_redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_q(0 downto 0));

    -- bubble_join_redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo(BITJOIN,135)
    bubble_join_redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_q <= redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_data_out;

    -- bubble_select_redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo(BITSELECT,136)
    bubble_select_redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_q(0 downto 0));

    -- bubble_join_redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo(BITJOIN,132)
    bubble_join_redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_q <= redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_data_out;

    -- bubble_select_redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo(BITSELECT,133)
    bubble_select_redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_b <= STD_LOGIC_VECTOR(bubble_join_redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_q(0 downto 0));

    -- dupName_0_sync_out_x(GPOUT,7)@133
    out_c0_exe10107 <= bubble_select_redist9_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_10_126_fifo_b;
    out_c0_exe11108 <= bubble_select_redist10_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_11_126_fifo_b;
    out_c0_exe12109 <= bubble_select_redist11_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_12_126_fifo_b;
    out_c0_exe13 <= bubble_select_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_b;
    out_c0_exe198 <= bubble_select_redist1_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_1_126_fifo_b;
    out_c0_exe299 <= bubble_select_redist2_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_2_126_fifo_b;
    out_c0_exe3100 <= bubble_select_redist3_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_3_126_fifo_b;
    out_c0_exe4101 <= bubble_select_redist4_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_4_126_fifo_b;
    out_c0_exe5102 <= bubble_select_redist5_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_5_126_fifo_b;
    out_c0_exe6103 <= bubble_select_redist6_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_6_126_fifo_b;
    out_c0_exe7104 <= bubble_select_redist7_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_7_126_fifo_b;
    out_c0_exe8105 <= bubble_select_redist8_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_8_126_fifo_b;
    out_c1_exe1 <= i_c1_exe1_gemm_nnfw_vt_join_q;
    out_valid_out <= SE_out_redist12_i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_c0_exit97_13_126_fifo_V0;

    -- ext_sig_sync_out(GPOUT,26)
    out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_valid_out <= i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_valid_out;
    out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_stall_out <= i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going23_gemm_nnfw_exiting_stall_out;

    -- pipeline_valid_out_sync(GPOUT,44)
    out_pipeline_valid_out <= i_sfc_c0_for_body10_gemm_nnfw_c0_enter78_gemm_nnfw_aunroll_x_out_pipeline_valid_out;

    -- sync_out(GPOUT,51)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
