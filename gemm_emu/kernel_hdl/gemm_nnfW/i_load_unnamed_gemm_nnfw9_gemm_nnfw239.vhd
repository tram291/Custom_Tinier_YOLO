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

-- VHDL created from i_load_unnamed_gemm_nnfw9_gemm_nnfw239
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

entity i_load_unnamed_gemm_nnfw9_gemm_nnfw239 is
    port (
        out_o_readdata_0 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_readdata_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_readdata_2 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_readdata_3 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_readdata_4 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_readdata_5 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_readdata_6 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_readdata_7 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_readdata_8 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_readdata_9 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_readdata_10 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_readdata_11 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_readdata_12 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_readdata_13 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_readdata_14 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_readdata_15 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_i_address : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_predicate : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW9_avm_readdata : in std_logic_vector(511 downto 0);  -- ufix512
        in_unnamed_gemm_nnfW9_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW9_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW9_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW9_avm_address : out std_logic_vector(31 downto 0);  -- ufix32
        out_unnamed_gemm_nnfW9_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW9_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW9_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW9_avm_writedata : out std_logic_vector(511 downto 0);  -- ufix512
        out_unnamed_gemm_nnfW9_avm_byteenable : out std_logic_vector(63 downto 0);  -- ufix64
        out_unnamed_gemm_nnfW9_avm_burstcount : out std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_load_unnamed_gemm_nnfw9_gemm_nnfw239;

architecture normal of i_load_unnamed_gemm_nnfw9_gemm_nnfw239 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component lsu_top is
        generic (
            ABITS_PER_LMEM_BANK : INTEGER;
            ADDRSPACE : INTEGER := 6;
            ALIGNMENT_BYTES : INTEGER := 64;
            ATOMIC : INTEGER := 0;
            ATOMIC_WIDTH : INTEGER := 3;
            AWIDTH : INTEGER := 32;
            BURSTCOUNT_WIDTH : INTEGER := 1;
            ENABLE_BANKED_MEMORY : INTEGER := 0;
            FORCE_NOP_SUPPORT : INTEGER := 1;
            HIGH_FMAX : INTEGER := 1;
            INPUTFIFO_USEDW_MAXBITS : INTEGER := 5;
            KERNEL_SIDE_MEM_LATENCY : INTEGER := 3;
            LMEM_ADDR_PERMUTATION_STYLE : INTEGER := 0;
            MEMORY_SIDE_MEM_LATENCY : INTEGER := 0;
            MWIDTH : INTEGER := 512;
            MWIDTH_BYTES : INTEGER := 64;
            NUMBER_BANKS : INTEGER := 1;
            PROFILE_ADDR_TOGGLE : INTEGER := 0;
            READ : INTEGER := 1;
            STALLFREE : INTEGER := 1;
            STYLE : STRING := "PIPELINED";
            SYNCHRONIZE_RESET : INTEGER := 1;
            USECACHING : INTEGER := 0;
            USEINPUTFIFO : INTEGER := 0;
            USEOUTPUTFIFO : INTEGER := 0;
            USE_BYTE_EN : INTEGER := 0;
            USE_WRITE_ACK : INTEGER := 0;
            WIDTH : INTEGER := 512;
            WIDTH_BYTES : INTEGER := 64;
            WRITEDATAWIDTH_BYTES : INTEGER := 64
        );
        port (
            avm_readdata : in std_logic_vector(511 downto 0);
            avm_readdatavalid : in std_logic;
            avm_waitrequest : in std_logic;
            avm_writeack : in std_logic;
            clock2x : in std_logic;
            flush : in std_logic;
            i_address : in std_logic_vector(31 downto 0);
            i_atomic_op : in std_logic_vector(2 downto 0);
            i_bitwiseor : in std_logic_vector(31 downto 0);
            i_byteenable : in std_logic_vector(63 downto 0);
            i_cmpdata : in std_logic_vector(511 downto 0);
            i_predicate : in std_logic;
            i_stall : in std_logic;
            i_valid : in std_logic;
            i_writedata : in std_logic_vector(511 downto 0);
            stream_base_addr : in std_logic_vector(31 downto 0);
            stream_reset : in std_logic;
            stream_size : in std_logic_vector(31 downto 0);
            avm_address : out std_logic_vector(31 downto 0);
            avm_burstcount : out std_logic;
            avm_byteenable : out std_logic_vector(63 downto 0);
            avm_enable : out std_logic;
            avm_read : out std_logic;
            avm_write : out std_logic;
            avm_writedata : out std_logic_vector(511 downto 0);
            o_input_fifo_depth : out std_logic_vector(4 downto 0);
            o_readdata : out std_logic_vector(511 downto 0);
            o_stall : out std_logic;
            o_valid : out std_logic;
            o_writeack : out std_logic;
            profile_avm_burstcount_total_incr : out std_logic_vector(31 downto 0);
            profile_bw_incr : out std_logic_vector(31 downto 0);
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal addr_trunc_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_c_i32_0gr_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_c_i512_0gr_x_q : STD_LOGIC_VECTOR (511 downto 0);
    signal readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_0_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_1_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_2_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_3_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_4_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_5_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_6_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_7_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_8_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_9_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_10_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_11_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_12_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_13_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_14_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_15_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_valid_reg_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i3_0gr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal c_i64_0gr_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_readdata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_readdatavalid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_readdatavalid_bitsignaltemp : std_logic;
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_waitrequest : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_waitrequest_bitsignaltemp : std_logic;
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_writeack_bitsignaltemp : std_logic;
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_clock2x : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_clock2x_bitsignaltemp : std_logic;
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_flush : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_flush_bitsignaltemp : std_logic;
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_atomic_op : STD_LOGIC_VECTOR (2 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_bitwiseor : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_cmpdata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_predicate : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_predicate_bitsignaltemp : std_logic;
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_stall_bitsignaltemp : std_logic;
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_valid_bitsignaltemp : std_logic;
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_stream_base_addr : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_stream_reset : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_stream_reset_bitsignaltemp : std_logic;
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_stream_size : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_address : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_burstcount : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_burstcount_bitsignaltemp : std_logic;
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_byteenable : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_enable_bitsignaltemp : std_logic;
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_read_bitsignaltemp : std_logic;
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_write_bitsignaltemp : std_logic;
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_writedata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_input_fifo_depth : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_readdata : STD_LOGIC_VECTOR (511 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_stall_bitsignaltemp : std_logic;
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_valid_bitsignaltemp : std_logic;
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_writeack_bitsignaltemp : std_logic;
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_profile_avm_burstcount_total_incr : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_unnamed_gemm_nnfw9_gemm_nnfw240_profile_bw_incr : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_c : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_d : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_e : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_f : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_g : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_h : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_i : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_j : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_k : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_l : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_m : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_n : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_o : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_p : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_q : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- dupName_0_c_i512_0gr_x(CONSTANT,6)
    dupName_0_c_i512_0gr_x_q <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    -- c_i64_0gr(CONSTANT,63)
    c_i64_0gr_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- dupName_0_c_i32_0gr_x(CONSTANT,5)
    dupName_0_c_i32_0gr_x_q <= "00000000000000000000000000000000";

    -- c_i3_0gr(CONSTANT,61)
    c_i3_0gr_q <= "000";

    -- addr_trunc_sel_x(BITSELECT,3)@159
    addr_trunc_sel_x_b <= in_i_address(31 downto 0);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_load_unnamed_gemm_nnfw9_gemm_nnfw240(EXTIFACE,66)@159 + 3
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_readdata <= in_unnamed_gemm_nnfW9_avm_readdata;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_readdatavalid <= in_unnamed_gemm_nnfW9_avm_readdatavalid;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_waitrequest <= in_unnamed_gemm_nnfW9_avm_waitrequest;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_writeack <= in_unnamed_gemm_nnfW9_avm_writeack;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_clock2x <= GND_q;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_flush <= in_flush;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_address <= addr_trunc_sel_x_b;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_atomic_op <= c_i3_0gr_q;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_bitwiseor <= dupName_0_c_i32_0gr_x_q;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_byteenable <= c_i64_0gr_q;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_cmpdata <= dupName_0_c_i512_0gr_x_q;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_predicate <= in_i_predicate;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_stall <= GND_q;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_valid <= in_i_valid;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_writedata <= dupName_0_c_i512_0gr_x_q;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_stream_base_addr <= dupName_0_c_i32_0gr_x_q;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_stream_reset <= GND_q;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_stream_size <= dupName_0_c_i32_0gr_x_q;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_readdatavalid_bitsignaltemp <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_readdatavalid(0);
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_waitrequest_bitsignaltemp <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_waitrequest(0);
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_writeack_bitsignaltemp <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_writeack(0);
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_clock2x_bitsignaltemp <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_clock2x(0);
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_flush_bitsignaltemp <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_flush(0);
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_predicate_bitsignaltemp <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_predicate(0);
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_stall_bitsignaltemp <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_stall(0);
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_valid_bitsignaltemp <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_valid(0);
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_stream_reset_bitsignaltemp <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_stream_reset(0);
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_burstcount(0) <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_burstcount_bitsignaltemp;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_enable(0) <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_enable_bitsignaltemp;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_read(0) <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_read_bitsignaltemp;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_write(0) <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_write_bitsignaltemp;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_stall(0) <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_stall_bitsignaltemp;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_valid(0) <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_valid_bitsignaltemp;
    i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_writeack(0) <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_writeack_bitsignaltemp;
    thei_load_unnamed_gemm_nnfw9_gemm_nnfw240 : lsu_top
    GENERIC MAP (
        ABITS_PER_LMEM_BANK => 15,
        ADDRSPACE => 6,
        ALIGNMENT_BYTES => 64,
        ATOMIC => 0,
        ATOMIC_WIDTH => 3,
        AWIDTH => 32,
        BURSTCOUNT_WIDTH => 1,
        ENABLE_BANKED_MEMORY => 0,
        FORCE_NOP_SUPPORT => 1,
        HIGH_FMAX => 1,
        INPUTFIFO_USEDW_MAXBITS => 5,
        KERNEL_SIDE_MEM_LATENCY => 3,
        LMEM_ADDR_PERMUTATION_STYLE => 0,
        MEMORY_SIDE_MEM_LATENCY => 0,
        MWIDTH => 512,
        MWIDTH_BYTES => 64,
        NUMBER_BANKS => 1,
        PROFILE_ADDR_TOGGLE => 0,
        READ => 1,
        STALLFREE => 1,
        STYLE => "PIPELINED",
        SYNCHRONIZE_RESET => 1,
        USECACHING => 0,
        USEINPUTFIFO => 0,
        USEOUTPUTFIFO => 0,
        USE_BYTE_EN => 0,
        USE_WRITE_ACK => 0,
        WIDTH => 512,
        WIDTH_BYTES => 64,
        WRITEDATAWIDTH_BYTES => 64
    )
    PORT MAP (
        avm_readdata => in_unnamed_gemm_nnfW9_avm_readdata,
        avm_readdatavalid => i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_readdatavalid_bitsignaltemp,
        avm_waitrequest => i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_waitrequest_bitsignaltemp,
        avm_writeack => i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_writeack_bitsignaltemp,
        clock2x => i_load_unnamed_gemm_nnfw9_gemm_nnfw240_clock2x_bitsignaltemp,
        flush => i_load_unnamed_gemm_nnfw9_gemm_nnfw240_flush_bitsignaltemp,
        i_address => addr_trunc_sel_x_b,
        i_atomic_op => c_i3_0gr_q,
        i_bitwiseor => dupName_0_c_i32_0gr_x_q,
        i_byteenable => c_i64_0gr_q,
        i_cmpdata => dupName_0_c_i512_0gr_x_q,
        i_predicate => i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_predicate_bitsignaltemp,
        i_stall => i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_stall_bitsignaltemp,
        i_valid => i_load_unnamed_gemm_nnfw9_gemm_nnfw240_i_valid_bitsignaltemp,
        i_writedata => dupName_0_c_i512_0gr_x_q,
        stream_base_addr => dupName_0_c_i32_0gr_x_q,
        stream_reset => i_load_unnamed_gemm_nnfw9_gemm_nnfw240_stream_reset_bitsignaltemp,
        stream_size => dupName_0_c_i32_0gr_x_q,
        avm_address => i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_address,
        avm_burstcount => i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_burstcount_bitsignaltemp,
        avm_byteenable => i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_byteenable,
        avm_enable => i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_enable_bitsignaltemp,
        avm_read => i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_read_bitsignaltemp,
        avm_write => i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_write_bitsignaltemp,
        avm_writedata => i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_writedata,
        o_readdata => i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_readdata,
        o_stall => i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_stall_bitsignaltemp,
        o_valid => i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_valid_bitsignaltemp,
        o_writeack => i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_writeack_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_valid_reg_x(REG,57)@162 + 1
    readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_valid_reg_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_valid_reg_x_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_valid_reg_x_q <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_valid;
        END IF;
    END PROCESS;

    -- dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select(BITSELECT,73)@162
    dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_b <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_readdata(63 downto 32);
    dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_c <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_readdata(95 downto 64);
    dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_d <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_readdata(127 downto 96);
    dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_e <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_readdata(159 downto 128);
    dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_f <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_readdata(191 downto 160);
    dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_g <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_readdata(223 downto 192);
    dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_h <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_readdata(255 downto 224);
    dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_i <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_readdata(287 downto 256);
    dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_j <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_readdata(319 downto 288);
    dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_k <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_readdata(351 downto 320);
    dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_l <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_readdata(383 downto 352);
    dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_m <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_readdata(415 downto 384);
    dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_n <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_readdata(447 downto 416);
    dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_o <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_readdata(479 downto 448);
    dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_p <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_readdata(511 downto 480);
    dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_q <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_readdata(31 downto 0);

    -- readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_15_x(REG,54)@162 + 1
    readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_15_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_15_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_15_x_q <= STD_LOGIC_VECTOR(dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_p);
        END IF;
    END PROCESS;

    -- readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_14_x(REG,53)@162 + 1
    readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_14_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_14_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_14_x_q <= STD_LOGIC_VECTOR(dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_o);
        END IF;
    END PROCESS;

    -- readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_13_x(REG,52)@162 + 1
    readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_13_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_13_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_13_x_q <= STD_LOGIC_VECTOR(dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_n);
        END IF;
    END PROCESS;

    -- readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_12_x(REG,51)@162 + 1
    readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_12_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_12_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_12_x_q <= STD_LOGIC_VECTOR(dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_m);
        END IF;
    END PROCESS;

    -- readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_11_x(REG,50)@162 + 1
    readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_11_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_11_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_11_x_q <= STD_LOGIC_VECTOR(dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_l);
        END IF;
    END PROCESS;

    -- readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_10_x(REG,49)@162 + 1
    readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_10_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_10_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_10_x_q <= STD_LOGIC_VECTOR(dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_k);
        END IF;
    END PROCESS;

    -- readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_9_x(REG,48)@162 + 1
    readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_9_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_9_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_9_x_q <= STD_LOGIC_VECTOR(dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_j);
        END IF;
    END PROCESS;

    -- readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_8_x(REG,47)@162 + 1
    readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_8_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_8_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_8_x_q <= STD_LOGIC_VECTOR(dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_i);
        END IF;
    END PROCESS;

    -- readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_7_x(REG,46)@162 + 1
    readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_7_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_7_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_7_x_q <= STD_LOGIC_VECTOR(dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_h);
        END IF;
    END PROCESS;

    -- readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_6_x(REG,45)@162 + 1
    readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_6_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_6_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_6_x_q <= STD_LOGIC_VECTOR(dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_g);
        END IF;
    END PROCESS;

    -- readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_5_x(REG,44)@162 + 1
    readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_5_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_5_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_5_x_q <= STD_LOGIC_VECTOR(dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_f);
        END IF;
    END PROCESS;

    -- readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_4_x(REG,43)@162 + 1
    readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_4_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_4_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_4_x_q <= STD_LOGIC_VECTOR(dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_e);
        END IF;
    END PROCESS;

    -- readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_3_x(REG,42)@162 + 1
    readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_3_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_3_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_3_x_q <= STD_LOGIC_VECTOR(dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_d);
        END IF;
    END PROCESS;

    -- readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_2_x(REG,41)@162 + 1
    readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_2_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_2_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_2_x_q <= STD_LOGIC_VECTOR(dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_c);
        END IF;
    END PROCESS;

    -- readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_1_x(REG,40)@162 + 1
    readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_1_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_1_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_1_x_q <= STD_LOGIC_VECTOR(dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_b);
        END IF;
    END PROCESS;

    -- readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_0_x(REG,39)@162 + 1
    readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_0_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_0_x_q <= "00000000000000000000000000000000";
        ELSIF (clock'EVENT AND clock = '1') THEN
            readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_0_x_q <= STD_LOGIC_VECTOR(dupName_0_ip_dsdk_adapt_bitselect_x_merged_bit_select_q);
        END IF;
    END PROCESS;

    -- dupName_0_sync_out_vunroll_x(GPOUT,2)@163
    out_o_readdata_0 <= readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_0_x_q;
    out_o_readdata_1 <= readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_1_x_q;
    out_o_readdata_2 <= readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_2_x_q;
    out_o_readdata_3 <= readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_3_x_q;
    out_o_readdata_4 <= readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_4_x_q;
    out_o_readdata_5 <= readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_5_x_q;
    out_o_readdata_6 <= readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_6_x_q;
    out_o_readdata_7 <= readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_7_x_q;
    out_o_readdata_8 <= readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_8_x_q;
    out_o_readdata_9 <= readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_9_x_q;
    out_o_readdata_10 <= readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_10_x_q;
    out_o_readdata_11 <= readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_11_x_q;
    out_o_readdata_12 <= readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_12_x_q;
    out_o_readdata_13 <= readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_13_x_q;
    out_o_readdata_14 <= readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_14_x_q;
    out_o_readdata_15 <= readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_data_reg_15_x_q;
    out_o_valid <= readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_readdata_reg_unnamed_gemm_nnfW9_gemm_nnfW3_valid_reg_x_q;

    -- ext_sig_sync_out(GPOUT,65)
    out_unnamed_gemm_nnfW9_avm_address <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_address;
    out_unnamed_gemm_nnfW9_avm_enable <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_enable;
    out_unnamed_gemm_nnfW9_avm_read <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_read;
    out_unnamed_gemm_nnfW9_avm_write <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_write;
    out_unnamed_gemm_nnfW9_avm_writedata <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_writedata;
    out_unnamed_gemm_nnfW9_avm_byteenable <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_byteenable;
    out_unnamed_gemm_nnfW9_avm_burstcount <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_avm_burstcount;

    -- sync_out(GPOUT,71)@162
    out_o_stall <= i_load_unnamed_gemm_nnfw9_gemm_nnfw240_o_stall;

END normal;
