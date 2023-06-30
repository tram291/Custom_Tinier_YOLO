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

-- VHDL created from i_sfc_logic_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w103
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

entity i_sfc_logic_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w103 is
    port (
        in_memdep_259_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_259_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_259_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_259_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_259_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_259_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_259_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_259_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_259_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_259_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_259_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_264_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_264_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_264_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_264_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_264_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_264_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_264_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_264_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_264_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_264_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_264_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni12_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni12_1 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni12_2 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni12_3 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni12_4 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni12_5 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni12_6 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni12_7 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni12_8 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni12_9 : in std_logic_vector(15 downto 0);  -- float16_m10
        in_c1_eni12_10 : in std_logic_vector(15 downto 0);  -- ufix16
        in_c1_eni12_11 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni12_12 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_eni12_13 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_eni12_14 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni12_15 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni12_16 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni12_17 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni12_18 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni12_19 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni12_20 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni12_21 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni12_22 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_eni12_23 : in std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi3_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi3_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi3_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exi3_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_readdata : in std_logic_vector(127 downto 0);  -- ufix128
        in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_writedata : out std_logic_vector(127 downto 0);  -- ufix128
        out_memdep_avm_byteenable : out std_logic_vector(15 downto 0);  -- ufix16
        out_memdep_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w103;

architecture normal of i_sfc_logic_c1_for_body4_gemm_nn9w_c1_enter_gemm_nn9w103 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_store_memdep_259_gemm_nn9w133 is
        port (
            in_i_writedata_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_byteenable : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_259_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_259_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_259_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_259_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_259_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_259_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_259_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_259_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_259_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_259_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_259_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_writeack : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_memdep_264_gemm_nn9w138 is
        port (
            in_i_writedata_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_byteenable : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_264_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_264_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_264_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_264_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_264_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_264_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_264_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_264_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_264_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_264_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_264_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_writeack : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_memdep_gemm_nn9w126 is
        port (
            in_i_writedata_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_3 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_byteenable : in std_logic_vector(15 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_readdata : in std_logic_vector(127 downto 0);  -- Fixed Point
            in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_address : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_avm_burstcount : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_byteenable : out std_logic_vector(15 downto 0);  -- Fixed Point
            out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_writedata : out std_logic_vector(127 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_writeack : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component acl_fp_convert_from_half is
        port (
            dataa : in std_logic_vector(15 downto 0);
            enable : in std_logic;
            stall_in : in std_logic;
            valid_in : in std_logic;
            result : out std_logic_vector(31 downto 0);
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;










    component i_acl_pop_i1_memdep_phi260_pop27_gemm_nn9w106 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_27 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_27 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_27 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_memdep_phi265_pop28_gemm_nn9w108 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_28 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_28 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_28 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_memdep_phi266_pop12325_pop38_gemm_nn9w110 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_38 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_38 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_38 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w114 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_39 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_39 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_39 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w118 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_40 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_40 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_40 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w122 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_41 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_41 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_41 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_memdep_phi_pop10323_pop36_gemm_nn9w129 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_36 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_36 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_36 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_memdep_phi260_push27_gemm_nn9w135 is
        port (
            in_c1_ene7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_27 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_27 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_27 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_memdep_phi265_push28_gemm_nn9w140 is
        port (
            in_c1_ene7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_28 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_28 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_28 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_memdep_phi266_pop12325_push38_gemm_nn9w112 is
        port (
            in_c1_ene7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_38 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_38 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_38 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_memdep_phi269_pop13326_push39_gemm_nn9w116 is
        port (
            in_c1_ene7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_39 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_39 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_39 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_memdep_phi272_pop14327_push40_gemm_nn9w120 is
        port (
            in_c1_ene7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_40 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_40 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_40 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_memdep_phi274_pop15328_push41_gemm_nn9w124 is
        port (
            in_c1_ene7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_41 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_41 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_41 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_memdep_phi_pop10323_push36_gemm_nn9w131 is
        port (
            in_c1_ene7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_36 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_36 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_36 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_inc11_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bgTrunc_i_inc_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_idxprom12_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom20_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_idxprom_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_memcoalesce_null_select_byte_en_0_rm_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (15 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_dupName_0_trunc_sel_x_in : STD_LOGIC_VECTOR (64 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_multconst_x_q : STD_LOGIC_VECTOR (58 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_dupName_0_trunc_sel_x_in : STD_LOGIC_VECTOR (64 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_dupName_0_trunc_sel_x_in : STD_LOGIC_VECTOR (64 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_dupName_0_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_extender_x_q : STD_LOGIC_VECTOR (127 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_trunc_sel_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal i_store_memdep_259_gemm_nn9w_aunroll_x_out_memdep_259_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_memdep_259_gemm_nn9w_aunroll_x_out_memdep_259_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_259_gemm_nn9w_aunroll_x_out_memdep_259_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_store_memdep_259_gemm_nn9w_aunroll_x_out_memdep_259_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_259_gemm_nn9w_aunroll_x_out_memdep_259_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_259_gemm_nn9w_aunroll_x_out_memdep_259_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_259_gemm_nn9w_aunroll_x_out_memdep_259_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_store_memdep_259_gemm_nn9w_aunroll_x_out_o_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_264_gemm_nn9w_aunroll_x_out_memdep_264_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_memdep_264_gemm_nn9w_aunroll_x_out_memdep_264_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_264_gemm_nn9w_aunroll_x_out_memdep_264_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_store_memdep_264_gemm_nn9w_aunroll_x_out_memdep_264_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_264_gemm_nn9w_aunroll_x_out_memdep_264_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_264_gemm_nn9w_aunroll_x_out_memdep_264_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_264_gemm_nn9w_aunroll_x_out_memdep_264_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_store_memdep_264_gemm_nn9w_aunroll_x_out_o_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_gemm_nn9w_aunroll_x_out_memdep_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_memdep_gemm_nn9w_aunroll_x_out_memdep_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_gemm_nn9w_aunroll_x_out_memdep_avm_byteenable : STD_LOGIC_VECTOR (15 downto 0);
    signal i_store_memdep_gemm_nn9w_aunroll_x_out_memdep_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_gemm_nn9w_aunroll_x_out_memdep_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_gemm_nn9w_aunroll_x_out_memdep_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_gemm_nn9w_aunroll_x_out_memdep_avm_writedata : STD_LOGIC_VECTOR (127 downto 0);
    signal i_store_memdep_gemm_nn9w_aunroll_x_out_o_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i16_4095_q : STD_LOGIC_VECTOR (15 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_2gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_dataa : STD_LOGIC_VECTOR (15 downto 0);
    signal i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_result : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i1_memdep_phi260_pop27_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi260_pop27_gemm_nn9w_out_feedback_stall_out_27 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi265_pop28_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi265_pop28_gemm_nn9w_out_feedback_stall_out_28 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi266_pop12325_pop38_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi266_pop12325_pop38_gemm_nn9w_out_feedback_stall_out_38 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w_out_feedback_stall_out_39 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w_out_feedback_stall_out_40 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w_out_feedback_stall_out_41 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi_pop10323_pop36_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_memdep_phi_pop10323_pop36_gemm_nn9w_out_feedback_stall_out_36 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi260_push27_gemm_nn9w_out_feedback_out_27 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_memdep_phi260_push27_gemm_nn9w_out_feedback_valid_out_27 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi265_push28_gemm_nn9w_out_feedback_out_28 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_memdep_phi265_push28_gemm_nn9w_out_feedback_valid_out_28 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi266_pop12325_push38_gemm_nn9w_out_feedback_out_38 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_memdep_phi266_pop12325_push38_gemm_nn9w_out_feedback_valid_out_38 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi269_pop13326_push39_gemm_nn9w_out_feedback_out_39 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_memdep_phi269_pop13326_push39_gemm_nn9w_out_feedback_valid_out_39 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi272_pop14327_push40_gemm_nn9w_out_feedback_out_40 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_memdep_phi272_pop14327_push40_gemm_nn9w_out_feedback_valid_out_40 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi274_pop15328_push41_gemm_nn9w_out_feedback_out_41 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_memdep_phi274_pop15328_push41_gemm_nn9w_out_feedback_valid_out_41 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi_pop10323_push36_gemm_nn9w_out_feedback_out_36 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_memdep_phi_pop10323_push36_gemm_nn9w_out_feedback_valid_out_36 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_and_gemm_nn9w_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_and_gemm_nn9w_vt_const_15_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_and_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (15 downto 0);
    signal i_and_gemm_nn9w_vt_select_11_b : STD_LOGIC_VECTOR (11 downto 0);
    signal i_inc11_gemm_nn9w_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc11_gemm_nn9w_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc11_gemm_nn9w_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc11_gemm_nn9w_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_gemm_nn9w_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_gemm_nn9w_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_gemm_nn9w_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc_gemm_nn9w_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_memcoalesce_null_bitcast_020_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_memcoalesce_null_bitcast_020_gemm_nn9w_vt_select_63_b : STD_LOGIC_VECTOR (59 downto 0);
    signal i_memcoalesce_null_bitcast_040_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_memcoalesce_null_bitcast_040_gemm_nn9w_vt_select_63_b : STD_LOGIC_VECTOR (59 downto 0);
    signal i_memcoalesce_null_bitcast_0_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_memcoalesce_null_bitcast_0_gemm_nn9w_vt_select_63_b : STD_LOGIC_VECTOR (59 downto 0);
    signal i_memdep_phi261_or_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_memdep_phi265_or_gemm_nn9w_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_memdep_phi265_or_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_memdep_phi266_or_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_memdep_phi269_or270_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_memdep_phi269_or_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_memdep_phi272_or273_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_memdep_phi272_or_gemm_nn9w_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_memdep_phi272_or_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_memdep_phi274_or275_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_memdep_phi274_or_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_scalarizer_078_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_scalarizer_078_gemm_nn9w_vt_select_63_b : STD_LOGIC_VECTOR (59 downto 0);
    signal i_scalarizer_081_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_scalarizer_081_gemm_nn9w_vt_select_63_b : STD_LOGIC_VECTOR (59 downto 0);
    signal i_scalarizer_0_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_scalarizer_0_gemm_nn9w_vt_select_63_b : STD_LOGIC_VECTOR (59 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_join_13_q : STD_LOGIC_VECTOR (58 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_align_14_q : STD_LOGIC_VECTOR (40 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_align_14_qint : STD_LOGIC_VECTOR (40 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_join_16_q : STD_LOGIC_VECTOR (68 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (69 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (69 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (69 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (69 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_join_13_q : STD_LOGIC_VECTOR (58 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_align_14_q : STD_LOGIC_VECTOR (40 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_align_14_qint : STD_LOGIC_VECTOR (40 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_join_16_q : STD_LOGIC_VECTOR (68 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (69 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (69 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (69 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (69 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_align_12_q : STD_LOGIC_VECTOR (35 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_align_12_qint : STD_LOGIC_VECTOR (35 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_join_13_q : STD_LOGIC_VECTOR (58 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_align_14_q : STD_LOGIC_VECTOR (40 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_align_14_qint : STD_LOGIC_VECTOR (40 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_align_15_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_align_15_qint : STD_LOGIC_VECTOR (27 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_join_16_q : STD_LOGIC_VECTOR (68 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_result_add_0_0_a : STD_LOGIC_VECTOR (69 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_result_add_0_0_b : STD_LOGIC_VECTOR (69 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_result_add_0_0_o : STD_LOGIC_VECTOR (69 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_result_add_0_0_q : STD_LOGIC_VECTOR (69 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im0_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im0_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im3_shift0_q : STD_LOGIC_VECTOR (13 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im3_shift0_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im6_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im6_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im9_shift0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im9_shift0_qint : STD_LOGIC_VECTOR (21 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_bs1_merged_bit_select_b : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_bs1_merged_bit_select_c : STD_LOGIC_VECTOR (9 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_bs1_merged_bit_select_d : STD_LOGIC_VECTOR (17 downto 0);
    signal i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_bs1_merged_bit_select_e : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_i_and_gemm_nn9w_vt_join_q_2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist1_i_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w_out_data_out_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w_out_data_out_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_i_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w_out_data_out_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_i_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w_out_data_out_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_i_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w_out_data_out_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_i_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w_out_data_out_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_i_acl_pop_i1_memdep_phi266_pop12325_pop38_gemm_nn9w_out_data_out_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_i_acl_pop_i1_memdep_phi266_pop12325_pop38_gemm_nn9w_out_data_out_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_sync_in_aunroll_x_in_c1_eni12_1_2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist10_sync_in_aunroll_x_in_c1_eni12_2_2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist11_sync_in_aunroll_x_in_c1_eni12_3_2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist13_sync_in_aunroll_x_in_c1_eni12_14_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_sync_in_aunroll_x_in_c1_eni12_15_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_sync_in_aunroll_x_in_c1_eni12_16_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_sync_in_aunroll_x_in_c1_eni12_18_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_sync_in_aunroll_x_in_c1_eni12_18_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_sync_in_aunroll_x_in_c1_eni12_22_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_sync_in_aunroll_x_in_c1_eni12_22_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_sync_in_aunroll_x_in_c1_eni12_23_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_sync_in_aunroll_x_in_i_valid_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_sync_in_aunroll_x_in_i_valid_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_sync_in_aunroll_x_in_i_valid_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_sync_in_aunroll_x_in_i_valid_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_i_store_memdep_264_gemm_nn9w_aunroll_x_out_o_writeack_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_i_store_memdep_259_gemm_nn9w_aunroll_x_out_o_writeack_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_bgTrunc_i_inc_gemm_nn9w_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist28_bgTrunc_i_inc11_gemm_nn9w_sel_x_b_1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_sync_in_aunroll_x_in_c1_eni12_13_3_mem_reset0 : std_logic;
    signal redist12_sync_in_aunroll_x_in_c1_eni12_13_3_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_sync_in_aunroll_x_in_c1_eni12_13_3_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_sync_in_aunroll_x_in_c1_eni12_13_3_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_sync_in_aunroll_x_in_c1_eni12_13_3_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_sync_in_aunroll_x_in_c1_eni12_13_3_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist12_sync_in_aunroll_x_in_c1_eni12_13_3_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_sync_in_aunroll_x_in_c1_eni12_13_3_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist12_sync_in_aunroll_x_in_c1_eni12_13_3_rdcnt_i : signal is true;
    signal redist12_sync_in_aunroll_x_in_c1_eni12_13_3_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_sync_in_aunroll_x_in_c1_eni12_13_3_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_sync_in_aunroll_x_in_c1_eni12_13_3_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_sync_in_aunroll_x_in_c1_eni12_13_3_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_sync_in_aunroll_x_in_c1_eni12_13_3_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist12_sync_in_aunroll_x_in_c1_eni12_13_3_sticky_ena_q : signal is true;
    signal redist12_sync_in_aunroll_x_in_c1_eni12_13_3_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist21_sync_in_aunroll_x_in_i_valid_1(DELAY,258)
    redist21_sync_in_aunroll_x_in_i_valid_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist21_sync_in_aunroll_x_in_i_valid_1_q, clk => clock, aclr => resetn );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- redist18_sync_in_aunroll_x_in_c1_eni12_22_1(DELAY,255)
    redist18_sync_in_aunroll_x_in_c1_eni12_22_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni12_22, xout => redist18_sync_in_aunroll_x_in_c1_eni12_22_1_q, clk => clock, aclr => resetn );

    -- redist16_sync_in_aunroll_x_in_c1_eni12_18_1(DELAY,253)
    redist16_sync_in_aunroll_x_in_c1_eni12_18_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni12_18, xout => redist16_sync_in_aunroll_x_in_c1_eni12_18_1_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_memdep_phi272_pop14327_push40_gemm_nn9w(BLACKBOX,114)@171
    -- out out_feedback_out_40@20000000
    -- out out_feedback_valid_out_40@20000000
    thei_acl_push_i1_memdep_phi272_pop14327_push40_gemm_nn9w : i_acl_push_i1_memdep_phi272_pop14327_push40_gemm_nn9w120
    PORT MAP (
        in_c1_ene7 => redist16_sync_in_aunroll_x_in_c1_eni12_18_1_q,
        in_data_in => redist3_i_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w_out_data_out_1_q,
        in_feedback_stall_in_40 => i_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w_out_feedback_stall_out_40,
        in_stall_in => GND_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_40 => i_acl_push_i1_memdep_phi272_pop14327_push40_gemm_nn9w_out_feedback_out_40,
        out_feedback_valid_out_40 => i_acl_push_i1_memdep_phi272_pop14327_push40_gemm_nn9w_out_feedback_valid_out_40,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w(BLACKBOX,107)@170
    -- out out_feedback_stall_out_40@20000000
    thei_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w : i_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w118
    PORT MAP (
        in_data_in => in_c1_eni12_20,
        in_dir => in_c1_eni12_15,
        in_feedback_in_40 => i_acl_push_i1_memdep_phi272_pop14327_push40_gemm_nn9w_out_feedback_out_40,
        in_feedback_valid_in_40 => i_acl_push_i1_memdep_phi272_pop14327_push40_gemm_nn9w_out_feedback_valid_out_40,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w_out_data_out,
        out_feedback_stall_out_40 => i_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w_out_feedback_stall_out_40,
        clock => clock,
        resetn => resetn
    );

    -- redist3_i_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w_out_data_out_1(DELAY,240)
    redist3_i_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w_out_data_out, xout => redist3_i_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w_out_data_out_1_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_memdep_phi269_pop13326_push39_gemm_nn9w(BLACKBOX,113)@171
    -- out out_feedback_out_39@20000000
    -- out out_feedback_valid_out_39@20000000
    thei_acl_push_i1_memdep_phi269_pop13326_push39_gemm_nn9w : i_acl_push_i1_memdep_phi269_pop13326_push39_gemm_nn9w116
    PORT MAP (
        in_c1_ene7 => redist16_sync_in_aunroll_x_in_c1_eni12_18_1_q,
        in_data_in => redist5_i_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w_out_data_out_1_q,
        in_feedback_stall_in_39 => i_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w_out_feedback_stall_out_39,
        in_stall_in => GND_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_39 => i_acl_push_i1_memdep_phi269_pop13326_push39_gemm_nn9w_out_feedback_out_39,
        out_feedback_valid_out_39 => i_acl_push_i1_memdep_phi269_pop13326_push39_gemm_nn9w_out_feedback_valid_out_39,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w(BLACKBOX,106)@170
    -- out out_feedback_stall_out_39@20000000
    thei_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w : i_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w114
    PORT MAP (
        in_data_in => in_c1_eni12_19,
        in_dir => in_c1_eni12_15,
        in_feedback_in_39 => i_acl_push_i1_memdep_phi269_pop13326_push39_gemm_nn9w_out_feedback_out_39,
        in_feedback_valid_in_39 => i_acl_push_i1_memdep_phi269_pop13326_push39_gemm_nn9w_out_feedback_valid_out_39,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w_out_data_out,
        out_feedback_stall_out_39 => i_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w_out_feedback_stall_out_39,
        clock => clock,
        resetn => resetn
    );

    -- redist5_i_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w_out_data_out_1(DELAY,242)
    redist5_i_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w_out_data_out, xout => redist5_i_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w_out_data_out_1_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_memdep_phi_pop10323_push36_gemm_nn9w(BLACKBOX,116)@171
    -- out out_feedback_out_36@20000000
    -- out out_feedback_valid_out_36@20000000
    thei_acl_push_i1_memdep_phi_pop10323_push36_gemm_nn9w : i_acl_push_i1_memdep_phi_pop10323_push36_gemm_nn9w131
    PORT MAP (
        in_c1_ene7 => redist16_sync_in_aunroll_x_in_c1_eni12_18_1_q,
        in_data_in => i_acl_pop_i1_memdep_phi_pop10323_pop36_gemm_nn9w_out_data_out,
        in_feedback_stall_in_36 => i_acl_pop_i1_memdep_phi_pop10323_pop36_gemm_nn9w_out_feedback_stall_out_36,
        in_stall_in => GND_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_36 => i_acl_push_i1_memdep_phi_pop10323_push36_gemm_nn9w_out_feedback_out_36,
        out_feedback_valid_out_36 => i_acl_push_i1_memdep_phi_pop10323_push36_gemm_nn9w_out_feedback_valid_out_36,
        clock => clock,
        resetn => resetn
    );

    -- redist14_sync_in_aunroll_x_in_c1_eni12_15_1(DELAY,251)
    redist14_sync_in_aunroll_x_in_c1_eni12_15_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni12_15, xout => redist14_sync_in_aunroll_x_in_c1_eni12_15_1_q, clk => clock, aclr => resetn );

    -- redist20_sync_in_aunroll_x_in_c1_eni12_23_1(DELAY,257)
    redist20_sync_in_aunroll_x_in_c1_eni12_23_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni12_23, xout => redist20_sync_in_aunroll_x_in_c1_eni12_23_1_q, clk => clock, aclr => resetn );

    -- i_acl_pop_i1_memdep_phi_pop10323_pop36_gemm_nn9w(BLACKBOX,109)@171
    -- out out_feedback_stall_out_36@20000000
    thei_acl_pop_i1_memdep_phi_pop10323_pop36_gemm_nn9w : i_acl_pop_i1_memdep_phi_pop10323_pop36_gemm_nn9w129
    PORT MAP (
        in_data_in => redist20_sync_in_aunroll_x_in_c1_eni12_23_1_q,
        in_dir => redist14_sync_in_aunroll_x_in_c1_eni12_15_1_q,
        in_feedback_in_36 => i_acl_push_i1_memdep_phi_pop10323_push36_gemm_nn9w_out_feedback_out_36,
        in_feedback_valid_in_36 => i_acl_push_i1_memdep_phi_pop10323_push36_gemm_nn9w_out_feedback_valid_out_36,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_1_q,
        out_data_out => i_acl_pop_i1_memdep_phi_pop10323_pop36_gemm_nn9w_out_data_out,
        out_feedback_stall_out_36 => i_acl_pop_i1_memdep_phi_pop10323_pop36_gemm_nn9w_out_feedback_stall_out_36,
        clock => clock,
        resetn => resetn
    );

    -- i_memdep_phi269_or270_gemm_nn9w(LOGICAL,146)@171
    i_memdep_phi269_or270_gemm_nn9w_q <= i_acl_pop_i1_memdep_phi_pop10323_pop36_gemm_nn9w_out_data_out or redist5_i_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w_out_data_out_1_q;

    -- i_memdep_phi272_or273_gemm_nn9w(LOGICAL,148)@171
    i_memdep_phi272_or273_gemm_nn9w_q <= i_memdep_phi269_or270_gemm_nn9w_q or redist3_i_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w_out_data_out_1_q;

    -- i_and_gemm_nn9w_vt_const_15(CONSTANT,118)
    i_and_gemm_nn9w_vt_const_15_q <= "0000";

    -- c_i16_4095(CONSTANT,85)
    c_i16_4095_q <= "0000111111111111";

    -- redist13_sync_in_aunroll_x_in_c1_eni12_14_1(DELAY,250)
    redist13_sync_in_aunroll_x_in_c1_eni12_14_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni12_14, xout => redist13_sync_in_aunroll_x_in_c1_eni12_14_1_q, clk => clock, aclr => resetn );

    -- i_memcoalesce_null_select_byte_en_0_rm_gemm_nn9w_sel_x(BITSELECT,46)@171
    i_memcoalesce_null_select_byte_en_0_rm_gemm_nn9w_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist13_sync_in_aunroll_x_in_c1_eni12_14_1_q(0 downto 0)), 16)));

    -- i_and_gemm_nn9w(LOGICAL,117)@171
    i_and_gemm_nn9w_q <= i_memcoalesce_null_select_byte_en_0_rm_gemm_nn9w_sel_x_b and c_i16_4095_q;

    -- i_and_gemm_nn9w_vt_select_11(BITSELECT,120)@171
    i_and_gemm_nn9w_vt_select_11_b <= i_and_gemm_nn9w_q(11 downto 0);

    -- i_and_gemm_nn9w_vt_join(BITJOIN,119)@171
    i_and_gemm_nn9w_vt_join_q <= i_and_gemm_nn9w_vt_const_15_q & i_and_gemm_nn9w_vt_select_11_b;

    -- i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_multconst_x(CONSTANT,51)
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_multconst_x_q <= "00000000000000000000000000000000000000000000000000000000000";

    -- c_i32_1gr(CONSTANT,88)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- i_inc_gemm_nn9w(ADD,128)@170
    i_inc_gemm_nn9w_a <= STD_LOGIC_VECTOR("0" & in_c1_eni12_13);
    i_inc_gemm_nn9w_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc_gemm_nn9w_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc_gemm_nn9w_a) + UNSIGNED(i_inc_gemm_nn9w_b));
    i_inc_gemm_nn9w_q <= i_inc_gemm_nn9w_o(32 downto 0);

    -- bgTrunc_i_inc_gemm_nn9w_sel_x(BITSELECT,3)@170
    bgTrunc_i_inc_gemm_nn9w_sel_x_b <= i_inc_gemm_nn9w_q(31 downto 0);

    -- redist27_bgTrunc_i_inc_gemm_nn9w_sel_x_b_1(DELAY,264)
    redist27_bgTrunc_i_inc_gemm_nn9w_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_inc_gemm_nn9w_sel_x_b, xout => redist27_bgTrunc_i_inc_gemm_nn9w_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_idxprom12_gemm_nn9w_sel_x(BITSELECT,43)@171
    i_idxprom12_gemm_nn9w_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist27_bgTrunc_i_inc_gemm_nn9w_sel_x_b_1_q(31 downto 0)), 64)));

    -- i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_bs1_merged_bit_select(BITSELECT,234)@171
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_bs1_merged_bit_select_b <= i_idxprom12_gemm_nn9w_sel_x_b(17 downto 0);
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_bs1_merged_bit_select_c <= i_idxprom12_gemm_nn9w_sel_x_b(63 downto 54);
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_bs1_merged_bit_select_d <= i_idxprom12_gemm_nn9w_sel_x_b(35 downto 18);
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_bs1_merged_bit_select_e <= i_idxprom12_gemm_nn9w_sel_x_b(53 downto 36);

    -- i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im3_shift0(BITSHIFT,223)@171
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im3_shift0_qint <= i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_bs1_merged_bit_select_c & "0000";
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im3_shift0_q <= i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im3_shift0_qint(13 downto 0);

    -- i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_align_15(BITSHIFT,177)@171
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im3_shift0_q) & "0000000000000";
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_align_15_q <= i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_align_15_qint(27 downto 0);

    -- i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im6_shift0(BITSHIFT,224)@171
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im6_shift0_qint <= i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_bs1_merged_bit_select_d & "0000";
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im6_shift0_q <= i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im6_shift0_qint(21 downto 0);

    -- i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_align_14(BITSHIFT,176)@171
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im6_shift0_q) & "000000000000000000";
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_align_14_q <= i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_align_14_qint(40 downto 0);

    -- i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_join_16(BITJOIN,178)@171
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_join_16_q <= i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_align_15_q & i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_align_14_q;

    -- i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im9_shift0(BITSHIFT,225)@171
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im9_shift0_qint <= i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_bs1_merged_bit_select_e & "0000";
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im9_shift0_q <= i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im9_shift0_qint(21 downto 0);

    -- i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_align_12(BITSHIFT,174)@171
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im9_shift0_q) & "0000000000000";
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_align_12_q <= i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_align_12_qint(35 downto 0);

    -- i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im0_shift0(BITSHIFT,222)@171
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im0_shift0_qint <= i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_bs1_merged_bit_select_b & "0000";
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im0_shift0_q <= i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im0_shift0_qint(21 downto 0);

    -- i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_join_13(BITJOIN,175)@171
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_join_13_q <= i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_im0_shift0_q);

    -- i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_result_add_0_0(ADD,179)@171
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_join_13_q);
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_join_16_q);
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_result_add_0_0_a) + UNSIGNED(i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_result_add_0_0_b));
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_result_add_0_0_q <= i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_result_add_0_0_o(69 downto 0);

    -- i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_extender_x(BITJOIN,50)@171
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_extender_x_q <= i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_multconst_x_q & i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_x_result_add_0_0_q(68 downto 0);

    -- i_scalarizer_078_gemm_nn9w_gemm_nn9w128_trunc_sel_x(BITSELECT,52)@171
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_trunc_sel_x_b <= i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_extender_x_q(63 downto 0);

    -- i_scalarizer_078_gemm_nn9w_gemm_nn9w128_dupName_0_trunc_sel_x(BITSELECT,47)@171
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_dupName_0_trunc_sel_x_in <= STD_LOGIC_VECTOR("0" & i_scalarizer_078_gemm_nn9w_gemm_nn9w128_trunc_sel_x_b);
    i_scalarizer_078_gemm_nn9w_gemm_nn9w128_dupName_0_trunc_sel_x_b <= i_scalarizer_078_gemm_nn9w_gemm_nn9w128_dupName_0_trunc_sel_x_in(63 downto 0);

    -- i_scalarizer_078_gemm_nn9w_vt_select_63(BITSELECT,154)@171
    i_scalarizer_078_gemm_nn9w_vt_select_63_b <= i_scalarizer_078_gemm_nn9w_gemm_nn9w128_dupName_0_trunc_sel_x_b(63 downto 4);

    -- i_scalarizer_078_gemm_nn9w_vt_join(BITJOIN,153)@171
    i_scalarizer_078_gemm_nn9w_vt_join_q <= i_scalarizer_078_gemm_nn9w_vt_select_63_b & i_and_gemm_nn9w_vt_const_15_q;

    -- i_memcoalesce_null_bitcast_020_gemm_nn9w_vt_select_63(BITSELECT,132)@171
    i_memcoalesce_null_bitcast_020_gemm_nn9w_vt_select_63_b <= i_scalarizer_078_gemm_nn9w_vt_join_q(63 downto 4);

    -- i_memcoalesce_null_bitcast_020_gemm_nn9w_vt_join(BITJOIN,131)@171
    i_memcoalesce_null_bitcast_020_gemm_nn9w_vt_join_q <= i_memcoalesce_null_bitcast_020_gemm_nn9w_vt_select_63_b & i_and_gemm_nn9w_vt_const_15_q;

    -- c_i32_0gr(CONSTANT,87)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w(EXTIFACE,98)@170 + 1
    i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_dataa <= in_c1_eni12_6;
    i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_enable(0);
    i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_stall_in(0);
    i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni12_6,
        enable => i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_result,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w(EXTIFACE,95)@170 + 1
    i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_dataa <= in_c1_eni12_5;
    i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_enable(0);
    i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_stall_in(0);
    i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni12_5,
        enable => i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_result,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w(EXTIFACE,101)@170 + 1
    i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_dataa <= in_c1_eni12_4;
    i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_enable(0);
    i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_stall_in(0);
    i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni12_4,
        enable => i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_result,
        clock => clock,
        resetn => resetn
    );

    -- i_store_memdep_259_gemm_nn9w_aunroll_x(BLACKBOX,77)@171
    -- out out_memdep_259_avm_address@20000000
    -- out out_memdep_259_avm_burstcount@20000000
    -- out out_memdep_259_avm_byteenable@20000000
    -- out out_memdep_259_avm_enable@20000000
    -- out out_memdep_259_avm_read@20000000
    -- out out_memdep_259_avm_write@20000000
    -- out out_memdep_259_avm_writedata@20000000
    -- out out_o_stall@172
    -- out out_o_valid@172
    -- out out_o_writeack@172
    thei_store_memdep_259_gemm_nn9w_aunroll_x : i_store_memdep_259_gemm_nn9w133
    PORT MAP (
        in_i_writedata_0 => i_acl_convert_halftofp_convert_from_half_i58_hf_gemm_nn9w_result,
        in_i_writedata_1 => i_acl_convert_halftofp_convert_from_half4_i59_hf_gemm_nn9w_result,
        in_i_writedata_2 => i_acl_convert_halftofp_convert_from_half5_i60_hf_gemm_nn9w_result,
        in_i_writedata_3 => c_i32_0gr_q,
        in_flush => in_flush,
        in_i_address => i_memcoalesce_null_bitcast_020_gemm_nn9w_vt_join_q,
        in_i_byteenable => i_and_gemm_nn9w_vt_join_q,
        in_i_dependence => i_memdep_phi272_or273_gemm_nn9w_q,
        in_i_predicate => redist18_sync_in_aunroll_x_in_c1_eni12_22_1_q,
        in_i_stall => GND_q,
        in_i_valid => redist21_sync_in_aunroll_x_in_i_valid_1_q,
        in_memdep_259_avm_readdata => in_memdep_259_avm_readdata,
        in_memdep_259_avm_readdatavalid => in_memdep_259_avm_readdatavalid,
        in_memdep_259_avm_waitrequest => in_memdep_259_avm_waitrequest,
        in_memdep_259_avm_writeack => in_memdep_259_avm_writeack,
        out_memdep_259_avm_address => i_store_memdep_259_gemm_nn9w_aunroll_x_out_memdep_259_avm_address,
        out_memdep_259_avm_burstcount => i_store_memdep_259_gemm_nn9w_aunroll_x_out_memdep_259_avm_burstcount,
        out_memdep_259_avm_byteenable => i_store_memdep_259_gemm_nn9w_aunroll_x_out_memdep_259_avm_byteenable,
        out_memdep_259_avm_enable => i_store_memdep_259_gemm_nn9w_aunroll_x_out_memdep_259_avm_enable,
        out_memdep_259_avm_read => i_store_memdep_259_gemm_nn9w_aunroll_x_out_memdep_259_avm_read,
        out_memdep_259_avm_write => i_store_memdep_259_gemm_nn9w_aunroll_x_out_memdep_259_avm_write,
        out_memdep_259_avm_writedata => i_store_memdep_259_gemm_nn9w_aunroll_x_out_memdep_259_avm_writedata,
        out_o_writeack => i_store_memdep_259_gemm_nn9w_aunroll_x_out_o_writeack,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,8)
    out_memdep_259_avm_address <= i_store_memdep_259_gemm_nn9w_aunroll_x_out_memdep_259_avm_address;
    out_memdep_259_avm_enable <= i_store_memdep_259_gemm_nn9w_aunroll_x_out_memdep_259_avm_enable;
    out_memdep_259_avm_read <= i_store_memdep_259_gemm_nn9w_aunroll_x_out_memdep_259_avm_read;
    out_memdep_259_avm_write <= i_store_memdep_259_gemm_nn9w_aunroll_x_out_memdep_259_avm_write;
    out_memdep_259_avm_writedata <= i_store_memdep_259_gemm_nn9w_aunroll_x_out_memdep_259_avm_writedata;
    out_memdep_259_avm_byteenable <= i_store_memdep_259_gemm_nn9w_aunroll_x_out_memdep_259_avm_byteenable;
    out_memdep_259_avm_burstcount <= i_store_memdep_259_gemm_nn9w_aunroll_x_out_memdep_259_avm_burstcount;

    -- i_acl_push_i1_memdep_phi274_pop15328_push41_gemm_nn9w(BLACKBOX,115)@171
    -- out out_feedback_out_41@20000000
    -- out out_feedback_valid_out_41@20000000
    thei_acl_push_i1_memdep_phi274_pop15328_push41_gemm_nn9w : i_acl_push_i1_memdep_phi274_pop15328_push41_gemm_nn9w124
    PORT MAP (
        in_c1_ene7 => redist16_sync_in_aunroll_x_in_c1_eni12_18_1_q,
        in_data_in => redist1_i_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w_out_data_out_1_q,
        in_feedback_stall_in_41 => i_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w_out_feedback_stall_out_41,
        in_stall_in => GND_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_41 => i_acl_push_i1_memdep_phi274_pop15328_push41_gemm_nn9w_out_feedback_out_41,
        out_feedback_valid_out_41 => i_acl_push_i1_memdep_phi274_pop15328_push41_gemm_nn9w_out_feedback_valid_out_41,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w(BLACKBOX,108)@170
    -- out out_feedback_stall_out_41@20000000
    thei_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w : i_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w122
    PORT MAP (
        in_data_in => in_c1_eni12_21,
        in_dir => in_c1_eni12_15,
        in_feedback_in_41 => i_acl_push_i1_memdep_phi274_pop15328_push41_gemm_nn9w_out_feedback_out_41,
        in_feedback_valid_in_41 => i_acl_push_i1_memdep_phi274_pop15328_push41_gemm_nn9w_out_feedback_valid_out_41,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w_out_data_out,
        out_feedback_stall_out_41 => i_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w_out_feedback_stall_out_41,
        clock => clock,
        resetn => resetn
    );

    -- redist1_i_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w_out_data_out_1(DELAY,238)
    redist1_i_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w_out_data_out, xout => redist1_i_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w_out_data_out_1_q, clk => clock, aclr => resetn );

    -- i_memdep_phi274_or275_gemm_nn9w(LOGICAL,150)@171
    i_memdep_phi274_or275_gemm_nn9w_q <= i_memdep_phi269_or270_gemm_nn9w_q or redist1_i_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w_out_data_out_1_q;

    -- c_i32_2gr(CONSTANT,89)
    c_i32_2gr_q <= "00000000000000000000000000000010";

    -- i_inc11_gemm_nn9w(ADD,127)@170
    i_inc11_gemm_nn9w_a <= STD_LOGIC_VECTOR("0" & in_c1_eni12_13);
    i_inc11_gemm_nn9w_b <= STD_LOGIC_VECTOR("0" & c_i32_2gr_q);
    i_inc11_gemm_nn9w_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc11_gemm_nn9w_a) + UNSIGNED(i_inc11_gemm_nn9w_b));
    i_inc11_gemm_nn9w_q <= i_inc11_gemm_nn9w_o(32 downto 0);

    -- bgTrunc_i_inc11_gemm_nn9w_sel_x(BITSELECT,2)@170
    bgTrunc_i_inc11_gemm_nn9w_sel_x_b <= i_inc11_gemm_nn9w_q(31 downto 0);

    -- redist28_bgTrunc_i_inc11_gemm_nn9w_sel_x_b_1(DELAY,265)
    redist28_bgTrunc_i_inc11_gemm_nn9w_sel_x_b_1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => bgTrunc_i_inc11_gemm_nn9w_sel_x_b, xout => redist28_bgTrunc_i_inc11_gemm_nn9w_sel_x_b_1_q, clk => clock, aclr => resetn );

    -- i_idxprom20_gemm_nn9w_sel_x(BITSELECT,44)@171
    i_idxprom20_gemm_nn9w_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist28_bgTrunc_i_inc11_gemm_nn9w_sel_x_b_1_q(31 downto 0)), 64)));

    -- i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_bs1_merged_bit_select(BITSELECT,235)@171
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_bs1_merged_bit_select_b <= i_idxprom20_gemm_nn9w_sel_x_b(17 downto 0);
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_bs1_merged_bit_select_c <= i_idxprom20_gemm_nn9w_sel_x_b(63 downto 54);
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_bs1_merged_bit_select_d <= i_idxprom20_gemm_nn9w_sel_x_b(35 downto 18);
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_bs1_merged_bit_select_e <= i_idxprom20_gemm_nn9w_sel_x_b(53 downto 36);

    -- i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im3_shift0(BITSHIFT,227)@171
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im3_shift0_qint <= i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_bs1_merged_bit_select_c & "0000";
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im3_shift0_q <= i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im3_shift0_qint(13 downto 0);

    -- i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_align_15(BITSHIFT,195)@171
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im3_shift0_q) & "0000000000000";
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_align_15_q <= i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_align_15_qint(27 downto 0);

    -- i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im6_shift0(BITSHIFT,228)@171
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im6_shift0_qint <= i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_bs1_merged_bit_select_d & "0000";
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im6_shift0_q <= i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im6_shift0_qint(21 downto 0);

    -- i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_align_14(BITSHIFT,194)@171
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im6_shift0_q) & "000000000000000000";
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_align_14_q <= i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_align_14_qint(40 downto 0);

    -- i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_join_16(BITJOIN,196)@171
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_join_16_q <= i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_align_15_q & i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_align_14_q;

    -- i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im9_shift0(BITSHIFT,229)@171
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im9_shift0_qint <= i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_bs1_merged_bit_select_e & "0000";
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im9_shift0_q <= i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im9_shift0_qint(21 downto 0);

    -- i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_align_12(BITSHIFT,192)@171
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im9_shift0_q) & "0000000000000";
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_align_12_q <= i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_align_12_qint(35 downto 0);

    -- i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im0_shift0(BITSHIFT,226)@171
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im0_shift0_qint <= i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_bs1_merged_bit_select_b & "0000";
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im0_shift0_q <= i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im0_shift0_qint(21 downto 0);

    -- i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_join_13(BITJOIN,193)@171
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_join_13_q <= i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_im0_shift0_q);

    -- i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_result_add_0_0(ADD,197)@171
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_join_13_q);
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_join_16_q);
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_result_add_0_0_a) + UNSIGNED(i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_result_add_0_0_b));
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_result_add_0_0_q <= i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_result_add_0_0_o(69 downto 0);

    -- i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_extender_x(BITJOIN,60)@171
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_extender_x_q <= i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_multconst_x_q & i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_x_result_add_0_0_q(68 downto 0);

    -- i_scalarizer_081_gemm_nn9w_gemm_nn9w137_trunc_sel_x(BITSELECT,62)@171
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_trunc_sel_x_b <= i_scalarizer_081_gemm_nn9w_gemm_nn9w137_mult_extender_x_q(63 downto 0);

    -- i_scalarizer_081_gemm_nn9w_gemm_nn9w137_dupName_0_trunc_sel_x(BITSELECT,57)@171
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_dupName_0_trunc_sel_x_in <= STD_LOGIC_VECTOR("0" & i_scalarizer_081_gemm_nn9w_gemm_nn9w137_trunc_sel_x_b);
    i_scalarizer_081_gemm_nn9w_gemm_nn9w137_dupName_0_trunc_sel_x_b <= i_scalarizer_081_gemm_nn9w_gemm_nn9w137_dupName_0_trunc_sel_x_in(63 downto 0);

    -- i_scalarizer_081_gemm_nn9w_vt_select_63(BITSELECT,157)@171
    i_scalarizer_081_gemm_nn9w_vt_select_63_b <= i_scalarizer_081_gemm_nn9w_gemm_nn9w137_dupName_0_trunc_sel_x_b(63 downto 4);

    -- i_scalarizer_081_gemm_nn9w_vt_join(BITJOIN,156)@171
    i_scalarizer_081_gemm_nn9w_vt_join_q <= i_scalarizer_081_gemm_nn9w_vt_select_63_b & i_and_gemm_nn9w_vt_const_15_q;

    -- i_memcoalesce_null_bitcast_040_gemm_nn9w_vt_select_63(BITSELECT,136)@171
    i_memcoalesce_null_bitcast_040_gemm_nn9w_vt_select_63_b <= i_scalarizer_081_gemm_nn9w_vt_join_q(63 downto 4);

    -- i_memcoalesce_null_bitcast_040_gemm_nn9w_vt_join(BITJOIN,135)@171
    i_memcoalesce_null_bitcast_040_gemm_nn9w_vt_join_q <= i_memcoalesce_null_bitcast_040_gemm_nn9w_vt_select_63_b & i_and_gemm_nn9w_vt_const_15_q;

    -- i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w(EXTIFACE,97)@170 + 1
    i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_dataa <= in_c1_eni12_9;
    i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_enable(0);
    i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_stall_in(0);
    i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni12_9,
        enable => i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_result,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w(EXTIFACE,94)@170 + 1
    i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_dataa <= in_c1_eni12_8;
    i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_enable(0);
    i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_stall_in(0);
    i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni12_8,
        enable => i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_result,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w(EXTIFACE,100)@170 + 1
    i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_dataa <= in_c1_eni12_7;
    i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_enable(0);
    i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_stall_in(0);
    i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w : acl_fp_convert_from_half
    PORT MAP (
        dataa => in_c1_eni12_7,
        enable => i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_result,
        clock => clock,
        resetn => resetn
    );

    -- i_store_memdep_264_gemm_nn9w_aunroll_x(BLACKBOX,78)@171
    -- out out_memdep_264_avm_address@20000000
    -- out out_memdep_264_avm_burstcount@20000000
    -- out out_memdep_264_avm_byteenable@20000000
    -- out out_memdep_264_avm_enable@20000000
    -- out out_memdep_264_avm_read@20000000
    -- out out_memdep_264_avm_write@20000000
    -- out out_memdep_264_avm_writedata@20000000
    -- out out_o_stall@172
    -- out out_o_valid@172
    -- out out_o_writeack@172
    thei_store_memdep_264_gemm_nn9w_aunroll_x : i_store_memdep_264_gemm_nn9w138
    PORT MAP (
        in_i_writedata_0 => i_acl_convert_halftofp_convert_from_half_i48_hf_gemm_nn9w_result,
        in_i_writedata_1 => i_acl_convert_halftofp_convert_from_half4_i49_hf_gemm_nn9w_result,
        in_i_writedata_2 => i_acl_convert_halftofp_convert_from_half5_i50_hf_gemm_nn9w_result,
        in_i_writedata_3 => c_i32_0gr_q,
        in_flush => in_flush,
        in_i_address => i_memcoalesce_null_bitcast_040_gemm_nn9w_vt_join_q,
        in_i_byteenable => i_and_gemm_nn9w_vt_join_q,
        in_i_dependence => i_memdep_phi274_or275_gemm_nn9w_q,
        in_i_predicate => redist18_sync_in_aunroll_x_in_c1_eni12_22_1_q,
        in_i_stall => GND_q,
        in_i_valid => redist21_sync_in_aunroll_x_in_i_valid_1_q,
        in_memdep_264_avm_readdata => in_memdep_264_avm_readdata,
        in_memdep_264_avm_readdatavalid => in_memdep_264_avm_readdatavalid,
        in_memdep_264_avm_waitrequest => in_memdep_264_avm_waitrequest,
        in_memdep_264_avm_writeack => in_memdep_264_avm_writeack,
        out_memdep_264_avm_address => i_store_memdep_264_gemm_nn9w_aunroll_x_out_memdep_264_avm_address,
        out_memdep_264_avm_burstcount => i_store_memdep_264_gemm_nn9w_aunroll_x_out_memdep_264_avm_burstcount,
        out_memdep_264_avm_byteenable => i_store_memdep_264_gemm_nn9w_aunroll_x_out_memdep_264_avm_byteenable,
        out_memdep_264_avm_enable => i_store_memdep_264_gemm_nn9w_aunroll_x_out_memdep_264_avm_enable,
        out_memdep_264_avm_read => i_store_memdep_264_gemm_nn9w_aunroll_x_out_memdep_264_avm_read,
        out_memdep_264_avm_write => i_store_memdep_264_gemm_nn9w_aunroll_x_out_memdep_264_avm_write,
        out_memdep_264_avm_writedata => i_store_memdep_264_gemm_nn9w_aunroll_x_out_memdep_264_avm_writedata,
        out_o_writeack => i_store_memdep_264_gemm_nn9w_aunroll_x_out_o_writeack,
        clock => clock,
        resetn => resetn
    );

    -- dupName_1_ext_sig_sync_out_x(GPOUT,14)
    out_memdep_264_avm_address <= i_store_memdep_264_gemm_nn9w_aunroll_x_out_memdep_264_avm_address;
    out_memdep_264_avm_enable <= i_store_memdep_264_gemm_nn9w_aunroll_x_out_memdep_264_avm_enable;
    out_memdep_264_avm_read <= i_store_memdep_264_gemm_nn9w_aunroll_x_out_memdep_264_avm_read;
    out_memdep_264_avm_write <= i_store_memdep_264_gemm_nn9w_aunroll_x_out_memdep_264_avm_write;
    out_memdep_264_avm_writedata <= i_store_memdep_264_gemm_nn9w_aunroll_x_out_memdep_264_avm_writedata;
    out_memdep_264_avm_byteenable <= i_store_memdep_264_gemm_nn9w_aunroll_x_out_memdep_264_avm_byteenable;
    out_memdep_264_avm_burstcount <= i_store_memdep_264_gemm_nn9w_aunroll_x_out_memdep_264_avm_burstcount;

    -- redist22_sync_in_aunroll_x_in_i_valid_2(DELAY,259)
    redist22_sync_in_aunroll_x_in_i_valid_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist21_sync_in_aunroll_x_in_i_valid_1_q, xout => redist22_sync_in_aunroll_x_in_i_valid_2_q, clk => clock, aclr => resetn );

    -- redist23_sync_in_aunroll_x_in_i_valid_3(DELAY,260)
    redist23_sync_in_aunroll_x_in_i_valid_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist22_sync_in_aunroll_x_in_i_valid_2_q, xout => redist23_sync_in_aunroll_x_in_i_valid_3_q, clk => clock, aclr => resetn );

    -- redist24_sync_in_aunroll_x_in_i_valid_4(DELAY,261)
    redist24_sync_in_aunroll_x_in_i_valid_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist23_sync_in_aunroll_x_in_i_valid_3_q, xout => redist24_sync_in_aunroll_x_in_i_valid_4_q, clk => clock, aclr => resetn );

    -- redist25_i_store_memdep_264_gemm_nn9w_aunroll_x_out_o_writeack_2(DELAY,262)
    redist25_i_store_memdep_264_gemm_nn9w_aunroll_x_out_o_writeack_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_store_memdep_264_gemm_nn9w_aunroll_x_out_o_writeack, xout => redist25_i_store_memdep_264_gemm_nn9w_aunroll_x_out_o_writeack_2_q, clk => clock, aclr => resetn );

    -- redist26_i_store_memdep_259_gemm_nn9w_aunroll_x_out_o_writeack_2(DELAY,263)
    redist26_i_store_memdep_259_gemm_nn9w_aunroll_x_out_o_writeack_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_store_memdep_259_gemm_nn9w_aunroll_x_out_o_writeack, xout => redist26_i_store_memdep_259_gemm_nn9w_aunroll_x_out_o_writeack_2_q, clk => clock, aclr => resetn );

    -- redist19_sync_in_aunroll_x_in_c1_eni12_22_3(DELAY,256)
    redist19_sync_in_aunroll_x_in_c1_eni12_22_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist18_sync_in_aunroll_x_in_c1_eni12_22_1_q, xout => redist19_sync_in_aunroll_x_in_c1_eni12_22_3_q, clk => clock, aclr => resetn );

    -- redist2_i_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w_out_data_out_3(DELAY,239)
    redist2_i_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w_out_data_out_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist1_i_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w_out_data_out_1_q, xout => redist2_i_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w_out_data_out_3_q, clk => clock, aclr => resetn );

    -- redist4_i_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w_out_data_out_2(DELAY,241)
    redist4_i_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w_out_data_out_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist3_i_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w_out_data_out_1_q, xout => redist4_i_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w_out_data_out_2_q, clk => clock, aclr => resetn );

    -- redist6_i_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w_out_data_out_2(DELAY,243)
    redist6_i_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w_out_data_out_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist5_i_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w_out_data_out_1_q, xout => redist6_i_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w_out_data_out_2_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_memdep_phi266_pop12325_push38_gemm_nn9w(BLACKBOX,112)@171
    -- out out_feedback_out_38@20000000
    -- out out_feedback_valid_out_38@20000000
    thei_acl_push_i1_memdep_phi266_pop12325_push38_gemm_nn9w : i_acl_push_i1_memdep_phi266_pop12325_push38_gemm_nn9w112
    PORT MAP (
        in_c1_ene7 => redist16_sync_in_aunroll_x_in_c1_eni12_18_1_q,
        in_data_in => redist7_i_acl_pop_i1_memdep_phi266_pop12325_pop38_gemm_nn9w_out_data_out_1_q,
        in_feedback_stall_in_38 => i_acl_pop_i1_memdep_phi266_pop12325_pop38_gemm_nn9w_out_feedback_stall_out_38,
        in_stall_in => GND_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_1_q,
        out_feedback_out_38 => i_acl_push_i1_memdep_phi266_pop12325_push38_gemm_nn9w_out_feedback_out_38,
        out_feedback_valid_out_38 => i_acl_push_i1_memdep_phi266_pop12325_push38_gemm_nn9w_out_feedback_valid_out_38,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_memdep_phi266_pop12325_pop38_gemm_nn9w(BLACKBOX,105)@170
    -- out out_feedback_stall_out_38@20000000
    thei_acl_pop_i1_memdep_phi266_pop12325_pop38_gemm_nn9w : i_acl_pop_i1_memdep_phi266_pop12325_pop38_gemm_nn9w110
    PORT MAP (
        in_data_in => in_c1_eni12_17,
        in_dir => in_c1_eni12_15,
        in_feedback_in_38 => i_acl_push_i1_memdep_phi266_pop12325_push38_gemm_nn9w_out_feedback_out_38,
        in_feedback_valid_in_38 => i_acl_push_i1_memdep_phi266_pop12325_push38_gemm_nn9w_out_feedback_valid_out_38,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i1_memdep_phi266_pop12325_pop38_gemm_nn9w_out_data_out,
        out_feedback_stall_out_38 => i_acl_pop_i1_memdep_phi266_pop12325_pop38_gemm_nn9w_out_feedback_stall_out_38,
        clock => clock,
        resetn => resetn
    );

    -- redist7_i_acl_pop_i1_memdep_phi266_pop12325_pop38_gemm_nn9w_out_data_out_1(DELAY,244)
    redist7_i_acl_pop_i1_memdep_phi266_pop12325_pop38_gemm_nn9w_out_data_out_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_acl_pop_i1_memdep_phi266_pop12325_pop38_gemm_nn9w_out_data_out, xout => redist7_i_acl_pop_i1_memdep_phi266_pop12325_pop38_gemm_nn9w_out_data_out_1_q, clk => clock, aclr => resetn );

    -- redist8_i_acl_pop_i1_memdep_phi266_pop12325_pop38_gemm_nn9w_out_data_out_2(DELAY,245)
    redist8_i_acl_pop_i1_memdep_phi266_pop12325_pop38_gemm_nn9w_out_data_out_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist7_i_acl_pop_i1_memdep_phi266_pop12325_pop38_gemm_nn9w_out_data_out_1_q, xout => redist8_i_acl_pop_i1_memdep_phi266_pop12325_pop38_gemm_nn9w_out_data_out_2_q, clk => clock, aclr => resetn );

    -- redist17_sync_in_aunroll_x_in_c1_eni12_18_2(DELAY,254)
    redist17_sync_in_aunroll_x_in_c1_eni12_18_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => redist16_sync_in_aunroll_x_in_c1_eni12_18_1_q, xout => redist17_sync_in_aunroll_x_in_c1_eni12_18_2_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_memdep_phi265_push28_gemm_nn9w(BLACKBOX,111)@172
    -- out out_feedback_out_28@20000000
    -- out out_feedback_valid_out_28@20000000
    thei_acl_push_i1_memdep_phi265_push28_gemm_nn9w : i_acl_push_i1_memdep_phi265_push28_gemm_nn9w140
    PORT MAP (
        in_c1_ene7 => redist17_sync_in_aunroll_x_in_c1_eni12_18_2_q,
        in_data_in => i_store_memdep_264_gemm_nn9w_aunroll_x_out_o_writeack,
        in_feedback_stall_in_28 => i_acl_pop_i1_memdep_phi265_pop28_gemm_nn9w_out_feedback_stall_out_28,
        in_stall_in => GND_q,
        in_valid_in => redist22_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_28 => i_acl_push_i1_memdep_phi265_push28_gemm_nn9w_out_feedback_out_28,
        out_feedback_valid_out_28 => i_acl_push_i1_memdep_phi265_push28_gemm_nn9w_out_feedback_valid_out_28,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_memdep_phi265_pop28_gemm_nn9w(BLACKBOX,104)@171
    -- out out_feedback_stall_out_28@20000000
    thei_acl_pop_i1_memdep_phi265_pop28_gemm_nn9w : i_acl_pop_i1_memdep_phi265_pop28_gemm_nn9w108
    PORT MAP (
        in_data_in => GND_q,
        in_dir => redist14_sync_in_aunroll_x_in_c1_eni12_15_1_q,
        in_feedback_in_28 => i_acl_push_i1_memdep_phi265_push28_gemm_nn9w_out_feedback_out_28,
        in_feedback_valid_in_28 => i_acl_push_i1_memdep_phi265_push28_gemm_nn9w_out_feedback_valid_out_28,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_1_q,
        out_data_out => i_acl_pop_i1_memdep_phi265_pop28_gemm_nn9w_out_data_out,
        out_feedback_stall_out_28 => i_acl_pop_i1_memdep_phi265_pop28_gemm_nn9w_out_feedback_stall_out_28,
        clock => clock,
        resetn => resetn
    );

    -- redist15_sync_in_aunroll_x_in_c1_eni12_16_1(DELAY,252)
    redist15_sync_in_aunroll_x_in_c1_eni12_16_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni12_16, xout => redist15_sync_in_aunroll_x_in_c1_eni12_16_1_q, clk => clock, aclr => resetn );

    -- i_acl_push_i1_memdep_phi260_push27_gemm_nn9w(BLACKBOX,110)@172
    -- out out_feedback_out_27@20000000
    -- out out_feedback_valid_out_27@20000000
    thei_acl_push_i1_memdep_phi260_push27_gemm_nn9w : i_acl_push_i1_memdep_phi260_push27_gemm_nn9w135
    PORT MAP (
        in_c1_ene7 => redist17_sync_in_aunroll_x_in_c1_eni12_18_2_q,
        in_data_in => i_store_memdep_259_gemm_nn9w_aunroll_x_out_o_writeack,
        in_feedback_stall_in_27 => i_acl_pop_i1_memdep_phi260_pop27_gemm_nn9w_out_feedback_stall_out_27,
        in_stall_in => GND_q,
        in_valid_in => redist22_sync_in_aunroll_x_in_i_valid_2_q,
        out_feedback_out_27 => i_acl_push_i1_memdep_phi260_push27_gemm_nn9w_out_feedback_out_27,
        out_feedback_valid_out_27 => i_acl_push_i1_memdep_phi260_push27_gemm_nn9w_out_feedback_valid_out_27,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pop_i1_memdep_phi260_pop27_gemm_nn9w(BLACKBOX,103)@171
    -- out out_feedback_stall_out_27@20000000
    thei_acl_pop_i1_memdep_phi260_pop27_gemm_nn9w : i_acl_pop_i1_memdep_phi260_pop27_gemm_nn9w106
    PORT MAP (
        in_data_in => GND_q,
        in_dir => redist14_sync_in_aunroll_x_in_c1_eni12_15_1_q,
        in_feedback_in_27 => i_acl_push_i1_memdep_phi260_push27_gemm_nn9w_out_feedback_out_27,
        in_feedback_valid_in_27 => i_acl_push_i1_memdep_phi260_push27_gemm_nn9w_out_feedback_valid_out_27,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => redist21_sync_in_aunroll_x_in_i_valid_1_q,
        out_data_out => i_acl_pop_i1_memdep_phi260_pop27_gemm_nn9w_out_data_out,
        out_feedback_stall_out_27 => i_acl_pop_i1_memdep_phi260_pop27_gemm_nn9w_out_feedback_stall_out_27,
        clock => clock,
        resetn => resetn
    );

    -- i_memdep_phi261_or_gemm_nn9w(LOGICAL,143)@171
    i_memdep_phi261_or_gemm_nn9w_q <= i_acl_pop_i1_memdep_phi260_pop27_gemm_nn9w_out_data_out or redist15_sync_in_aunroll_x_in_c1_eni12_16_1_q;

    -- i_memdep_phi265_or_gemm_nn9w(LOGICAL,144)@171 + 1
    i_memdep_phi265_or_gemm_nn9w_qi <= i_memdep_phi261_or_gemm_nn9w_q or i_acl_pop_i1_memdep_phi265_pop28_gemm_nn9w_out_data_out;
    i_memdep_phi265_or_gemm_nn9w_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_memdep_phi265_or_gemm_nn9w_qi, xout => i_memdep_phi265_or_gemm_nn9w_q, clk => clock, aclr => resetn );

    -- i_memdep_phi266_or_gemm_nn9w(LOGICAL,145)@172
    i_memdep_phi266_or_gemm_nn9w_q <= i_memdep_phi265_or_gemm_nn9w_q or redist8_i_acl_pop_i1_memdep_phi266_pop12325_pop38_gemm_nn9w_out_data_out_2_q;

    -- i_memdep_phi269_or_gemm_nn9w(LOGICAL,147)@172
    i_memdep_phi269_or_gemm_nn9w_q <= i_memdep_phi266_or_gemm_nn9w_q or redist6_i_acl_pop_i1_memdep_phi269_pop13326_pop39_gemm_nn9w_out_data_out_2_q;

    -- i_memdep_phi272_or_gemm_nn9w(LOGICAL,149)@172 + 1
    i_memdep_phi272_or_gemm_nn9w_qi <= i_memdep_phi269_or_gemm_nn9w_q or redist4_i_acl_pop_i1_memdep_phi272_pop14327_pop40_gemm_nn9w_out_data_out_2_q;
    i_memdep_phi272_or_gemm_nn9w_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_memdep_phi272_or_gemm_nn9w_qi, xout => i_memdep_phi272_or_gemm_nn9w_q, clk => clock, aclr => resetn );

    -- i_memdep_phi274_or_gemm_nn9w(LOGICAL,151)@173
    i_memdep_phi274_or_gemm_nn9w_q <= i_memdep_phi272_or_gemm_nn9w_q or redist2_i_acl_pop_i1_memdep_phi274_pop15328_pop41_gemm_nn9w_out_data_out_3_q;

    -- redist0_i_and_gemm_nn9w_vt_join_q_2(DELAY,237)
    redist0_i_and_gemm_nn9w_vt_join_q_2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_and_gemm_nn9w_vt_join_q, xout => redist0_i_and_gemm_nn9w_vt_join_q_2_q, clk => clock, aclr => resetn );

    -- redist12_sync_in_aunroll_x_in_c1_eni12_13_3_notEnable(LOGICAL,270)
    redist12_sync_in_aunroll_x_in_c1_eni12_13_3_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist12_sync_in_aunroll_x_in_c1_eni12_13_3_nor(LOGICAL,271)
    redist12_sync_in_aunroll_x_in_c1_eni12_13_3_nor_q <= not (redist12_sync_in_aunroll_x_in_c1_eni12_13_3_notEnable_q or redist12_sync_in_aunroll_x_in_c1_eni12_13_3_sticky_ena_q);

    -- redist12_sync_in_aunroll_x_in_c1_eni12_13_3_cmpReg(REG,269)
    redist12_sync_in_aunroll_x_in_c1_eni12_13_3_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_sync_in_aunroll_x_in_c1_eni12_13_3_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist12_sync_in_aunroll_x_in_c1_eni12_13_3_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist12_sync_in_aunroll_x_in_c1_eni12_13_3_sticky_ena(REG,272)
    redist12_sync_in_aunroll_x_in_c1_eni12_13_3_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_sync_in_aunroll_x_in_c1_eni12_13_3_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist12_sync_in_aunroll_x_in_c1_eni12_13_3_nor_q = "1") THEN
                redist12_sync_in_aunroll_x_in_c1_eni12_13_3_sticky_ena_q <= STD_LOGIC_VECTOR(redist12_sync_in_aunroll_x_in_c1_eni12_13_3_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist12_sync_in_aunroll_x_in_c1_eni12_13_3_enaAnd(LOGICAL,273)
    redist12_sync_in_aunroll_x_in_c1_eni12_13_3_enaAnd_q <= redist12_sync_in_aunroll_x_in_c1_eni12_13_3_sticky_ena_q and VCC_q;

    -- redist12_sync_in_aunroll_x_in_c1_eni12_13_3_rdcnt(COUNTER,267)
    -- low=0, high=1, step=1, init=0
    redist12_sync_in_aunroll_x_in_c1_eni12_13_3_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_sync_in_aunroll_x_in_c1_eni12_13_3_rdcnt_i <= TO_UNSIGNED(0, 1);
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist12_sync_in_aunroll_x_in_c1_eni12_13_3_rdcnt_i <= redist12_sync_in_aunroll_x_in_c1_eni12_13_3_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist12_sync_in_aunroll_x_in_c1_eni12_13_3_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist12_sync_in_aunroll_x_in_c1_eni12_13_3_rdcnt_i, 1)));

    -- redist12_sync_in_aunroll_x_in_c1_eni12_13_3_wraddr(REG,268)
    redist12_sync_in_aunroll_x_in_c1_eni12_13_3_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist12_sync_in_aunroll_x_in_c1_eni12_13_3_wraddr_q <= "1";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist12_sync_in_aunroll_x_in_c1_eni12_13_3_wraddr_q <= STD_LOGIC_VECTOR(redist12_sync_in_aunroll_x_in_c1_eni12_13_3_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist12_sync_in_aunroll_x_in_c1_eni12_13_3_mem(DUALMEM,266)
    redist12_sync_in_aunroll_x_in_c1_eni12_13_3_mem_ia <= STD_LOGIC_VECTOR(in_c1_eni12_13);
    redist12_sync_in_aunroll_x_in_c1_eni12_13_3_mem_aa <= redist12_sync_in_aunroll_x_in_c1_eni12_13_3_wraddr_q;
    redist12_sync_in_aunroll_x_in_c1_eni12_13_3_mem_ab <= redist12_sync_in_aunroll_x_in_c1_eni12_13_3_rdcnt_q;
    redist12_sync_in_aunroll_x_in_c1_eni12_13_3_mem_reset0 <= not (resetn);
    redist12_sync_in_aunroll_x_in_c1_eni12_13_3_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 32,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist12_sync_in_aunroll_x_in_c1_eni12_13_3_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist12_sync_in_aunroll_x_in_c1_eni12_13_3_mem_reset0,
        clock1 => clock,
        address_a => redist12_sync_in_aunroll_x_in_c1_eni12_13_3_mem_aa,
        data_a => redist12_sync_in_aunroll_x_in_c1_eni12_13_3_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist12_sync_in_aunroll_x_in_c1_eni12_13_3_mem_ab,
        q_b => redist12_sync_in_aunroll_x_in_c1_eni12_13_3_mem_iq
    );
    redist12_sync_in_aunroll_x_in_c1_eni12_13_3_mem_q <= redist12_sync_in_aunroll_x_in_c1_eni12_13_3_mem_iq(31 downto 0);

    -- i_idxprom_gemm_nn9w_sel_x(BITSELECT,45)@173
    i_idxprom_gemm_nn9w_sel_x_b <= STD_LOGIC_VECTOR(std_logic_vector(resize(signed(redist12_sync_in_aunroll_x_in_c1_eni12_13_3_mem_q(31 downto 0)), 64)));

    -- i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_bs1_merged_bit_select(BITSELECT,236)@173
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_bs1_merged_bit_select_b <= i_idxprom_gemm_nn9w_sel_x_b(17 downto 0);
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_bs1_merged_bit_select_c <= i_idxprom_gemm_nn9w_sel_x_b(63 downto 54);
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_bs1_merged_bit_select_d <= i_idxprom_gemm_nn9w_sel_x_b(35 downto 18);
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_bs1_merged_bit_select_e <= i_idxprom_gemm_nn9w_sel_x_b(53 downto 36);

    -- i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im3_shift0(BITSHIFT,231)@173
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im3_shift0_qint <= i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_bs1_merged_bit_select_c & "0000";
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im3_shift0_q <= i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im3_shift0_qint(13 downto 0);

    -- i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_align_15(BITSHIFT,213)@173
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_align_15_qint <= STD_LOGIC_VECTOR("0" & i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im3_shift0_q) & "0000000000000";
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_align_15_q <= i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_align_15_qint(27 downto 0);

    -- i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im6_shift0(BITSHIFT,232)@173
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im6_shift0_qint <= i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_bs1_merged_bit_select_d & "0000";
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im6_shift0_q <= i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im6_shift0_qint(21 downto 0);

    -- i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_align_14(BITSHIFT,212)@173
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_align_14_qint <= STD_LOGIC_VECTOR("0" & i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im6_shift0_q) & "000000000000000000";
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_align_14_q <= i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_align_14_qint(40 downto 0);

    -- i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_join_16(BITJOIN,214)@173
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_join_16_q <= i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_align_15_q & i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_align_14_q;

    -- i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im9_shift0(BITSHIFT,233)@173
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im9_shift0_qint <= i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_bs1_merged_bit_select_e & "0000";
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im9_shift0_q <= i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im9_shift0_qint(21 downto 0);

    -- i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_align_12(BITSHIFT,210)@173
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_align_12_qint <= STD_LOGIC_VECTOR("0" & i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im9_shift0_q) & "0000000000000";
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_align_12_q <= i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_align_12_qint(35 downto 0);

    -- i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im0_shift0(BITSHIFT,230)@173
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im0_shift0_qint <= i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_bs1_merged_bit_select_b & "0000";
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im0_shift0_q <= i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im0_shift0_qint(21 downto 0);

    -- i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_join_13(BITJOIN,211)@173
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_join_13_q <= i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_align_12_q & STD_LOGIC_VECTOR("0" & i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_im0_shift0_q);

    -- i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_result_add_0_0(ADD,215)@173
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_result_add_0_0_a <= STD_LOGIC_VECTOR("00000000000" & i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_join_13_q);
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_result_add_0_0_b <= STD_LOGIC_VECTOR("0" & i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_join_16_q);
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_result_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_result_add_0_0_a) + UNSIGNED(i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_result_add_0_0_b));
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_result_add_0_0_q <= i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_result_add_0_0_o(69 downto 0);

    -- i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_extender_x(BITJOIN,70)@173
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_extender_x_q <= i_scalarizer_078_gemm_nn9w_gemm_nn9w128_mult_multconst_x_q & i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_x_result_add_0_0_q(68 downto 0);

    -- i_scalarizer_0_gemm_nn9w_gemm_nn9w105_trunc_sel_x(BITSELECT,72)@173
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_trunc_sel_x_b <= i_scalarizer_0_gemm_nn9w_gemm_nn9w105_mult_extender_x_q(63 downto 0);

    -- i_scalarizer_0_gemm_nn9w_gemm_nn9w105_dupName_0_trunc_sel_x(BITSELECT,67)@173
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_dupName_0_trunc_sel_x_in <= STD_LOGIC_VECTOR("0" & i_scalarizer_0_gemm_nn9w_gemm_nn9w105_trunc_sel_x_b);
    i_scalarizer_0_gemm_nn9w_gemm_nn9w105_dupName_0_trunc_sel_x_b <= i_scalarizer_0_gemm_nn9w_gemm_nn9w105_dupName_0_trunc_sel_x_in(63 downto 0);

    -- i_scalarizer_0_gemm_nn9w_vt_select_63(BITSELECT,160)@173
    i_scalarizer_0_gemm_nn9w_vt_select_63_b <= i_scalarizer_0_gemm_nn9w_gemm_nn9w105_dupName_0_trunc_sel_x_b(63 downto 4);

    -- i_scalarizer_0_gemm_nn9w_vt_join(BITJOIN,159)@173
    i_scalarizer_0_gemm_nn9w_vt_join_q <= i_scalarizer_0_gemm_nn9w_vt_select_63_b & i_and_gemm_nn9w_vt_const_15_q;

    -- i_memcoalesce_null_bitcast_0_gemm_nn9w_vt_select_63(BITSELECT,140)@173
    i_memcoalesce_null_bitcast_0_gemm_nn9w_vt_select_63_b <= i_scalarizer_0_gemm_nn9w_vt_join_q(63 downto 4);

    -- i_memcoalesce_null_bitcast_0_gemm_nn9w_vt_join(BITJOIN,139)@173
    i_memcoalesce_null_bitcast_0_gemm_nn9w_vt_join_q <= i_memcoalesce_null_bitcast_0_gemm_nn9w_vt_select_63_b & i_and_gemm_nn9w_vt_const_15_q;

    -- redist11_sync_in_aunroll_x_in_c1_eni12_3_2(DELAY,248)
    redist11_sync_in_aunroll_x_in_c1_eni12_3_2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni12_3, xout => redist11_sync_in_aunroll_x_in_c1_eni12_3_2_q, clk => clock, aclr => resetn );

    -- i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w(EXTIFACE,99)@172 + 1
    i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_dataa <= redist11_sync_in_aunroll_x_in_c1_eni12_3_2_q;
    i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_enable(0);
    i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_stall_in(0);
    i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w : acl_fp_convert_from_half
    PORT MAP (
        dataa => redist11_sync_in_aunroll_x_in_c1_eni12_3_2_q,
        enable => i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_result,
        clock => clock,
        resetn => resetn
    );

    -- redist10_sync_in_aunroll_x_in_c1_eni12_2_2(DELAY,247)
    redist10_sync_in_aunroll_x_in_c1_eni12_2_2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni12_2, xout => redist10_sync_in_aunroll_x_in_c1_eni12_2_2_q, clk => clock, aclr => resetn );

    -- i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w(EXTIFACE,96)@172 + 1
    i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_dataa <= redist10_sync_in_aunroll_x_in_c1_eni12_2_2_q;
    i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_enable(0);
    i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_stall_in(0);
    i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w : acl_fp_convert_from_half
    PORT MAP (
        dataa => redist10_sync_in_aunroll_x_in_c1_eni12_2_2_q,
        enable => i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_result,
        clock => clock,
        resetn => resetn
    );

    -- redist9_sync_in_aunroll_x_in_c1_eni12_1_2(DELAY,246)
    redist9_sync_in_aunroll_x_in_c1_eni12_1_2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_c1_eni12_1, xout => redist9_sync_in_aunroll_x_in_c1_eni12_1_2_q, clk => clock, aclr => resetn );

    -- i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w(EXTIFACE,102)@172 + 1
    i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_dataa <= redist9_sync_in_aunroll_x_in_c1_eni12_1_2_q;
    i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_enable <= VCC_q;
    i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_stall_in <= GND_q;
    i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_valid_in <= VCC_q;
    i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_enable_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_enable(0);
    i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_stall_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_stall_in(0);
    i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_valid_in_bitsignaltemp <= i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_valid_in(0);
    thei_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w : acl_fp_convert_from_half
    PORT MAP (
        dataa => redist9_sync_in_aunroll_x_in_c1_eni12_1_2_q,
        enable => i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_enable_bitsignaltemp,
        stall_in => i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_valid_in_bitsignaltemp,
        result => i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_result,
        clock => clock,
        resetn => resetn
    );

    -- i_store_memdep_gemm_nn9w_aunroll_x(BLACKBOX,79)@173
    -- out out_memdep_avm_address@20000000
    -- out out_memdep_avm_burstcount@20000000
    -- out out_memdep_avm_byteenable@20000000
    -- out out_memdep_avm_enable@20000000
    -- out out_memdep_avm_read@20000000
    -- out out_memdep_avm_write@20000000
    -- out out_memdep_avm_writedata@20000000
    -- out out_o_stall@174
    -- out out_o_valid@174
    -- out out_o_writeack@174
    thei_store_memdep_gemm_nn9w_aunroll_x : i_store_memdep_gemm_nn9w126
    PORT MAP (
        in_i_writedata_0 => i_acl_convert_halftofp_convert_from_half_i_hf_gemm_nn9w_result,
        in_i_writedata_1 => i_acl_convert_halftofp_convert_from_half4_i_hf_gemm_nn9w_result,
        in_i_writedata_2 => i_acl_convert_halftofp_convert_from_half5_i_hf_gemm_nn9w_result,
        in_i_writedata_3 => c_i32_0gr_q,
        in_flush => in_flush,
        in_i_address => i_memcoalesce_null_bitcast_0_gemm_nn9w_vt_join_q,
        in_i_byteenable => redist0_i_and_gemm_nn9w_vt_join_q_2_q,
        in_i_dependence => i_memdep_phi274_or_gemm_nn9w_q,
        in_i_predicate => redist19_sync_in_aunroll_x_in_c1_eni12_22_3_q,
        in_i_stall => GND_q,
        in_i_valid => redist23_sync_in_aunroll_x_in_i_valid_3_q,
        in_memdep_avm_readdata => in_memdep_avm_readdata,
        in_memdep_avm_readdatavalid => in_memdep_avm_readdatavalid,
        in_memdep_avm_waitrequest => in_memdep_avm_waitrequest,
        in_memdep_avm_writeack => in_memdep_avm_writeack,
        out_memdep_avm_address => i_store_memdep_gemm_nn9w_aunroll_x_out_memdep_avm_address,
        out_memdep_avm_burstcount => i_store_memdep_gemm_nn9w_aunroll_x_out_memdep_avm_burstcount,
        out_memdep_avm_byteenable => i_store_memdep_gemm_nn9w_aunroll_x_out_memdep_avm_byteenable,
        out_memdep_avm_enable => i_store_memdep_gemm_nn9w_aunroll_x_out_memdep_avm_enable,
        out_memdep_avm_read => i_store_memdep_gemm_nn9w_aunroll_x_out_memdep_avm_read,
        out_memdep_avm_write => i_store_memdep_gemm_nn9w_aunroll_x_out_memdep_avm_write,
        out_memdep_avm_writedata => i_store_memdep_gemm_nn9w_aunroll_x_out_memdep_avm_writedata,
        out_o_writeack => i_store_memdep_gemm_nn9w_aunroll_x_out_o_writeack,
        clock => clock,
        resetn => resetn
    );

    -- sync_out_aunroll_x(GPOUT,81)@174
    out_c1_exi3_0 <= GND_q;
    out_c1_exi3_1 <= i_store_memdep_gemm_nn9w_aunroll_x_out_o_writeack;
    out_c1_exi3_2 <= redist26_i_store_memdep_259_gemm_nn9w_aunroll_x_out_o_writeack_2_q;
    out_c1_exi3_3 <= redist25_i_store_memdep_264_gemm_nn9w_aunroll_x_out_o_writeack_2_q;
    out_o_valid <= redist24_sync_in_aunroll_x_in_i_valid_4_q;

    -- ext_sig_sync_out(GPOUT,93)
    out_memdep_avm_address <= i_store_memdep_gemm_nn9w_aunroll_x_out_memdep_avm_address;
    out_memdep_avm_enable <= i_store_memdep_gemm_nn9w_aunroll_x_out_memdep_avm_enable;
    out_memdep_avm_read <= i_store_memdep_gemm_nn9w_aunroll_x_out_memdep_avm_read;
    out_memdep_avm_write <= i_store_memdep_gemm_nn9w_aunroll_x_out_memdep_avm_write;
    out_memdep_avm_writedata <= i_store_memdep_gemm_nn9w_aunroll_x_out_memdep_avm_writedata;
    out_memdep_avm_byteenable <= i_store_memdep_gemm_nn9w_aunroll_x_out_memdep_avm_byteenable;
    out_memdep_avm_burstcount <= i_store_memdep_gemm_nn9w_aunroll_x_out_memdep_avm_burstcount;

END normal;
