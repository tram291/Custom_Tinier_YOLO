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

-- VHDL created from bb_gemm_nnfW_B8_stall_region
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

entity bb_gemm_nnfW_B8_stall_region is
    port (
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_out_0 : out std_logic_vector(7 downto 0);  -- ufix8
        in_feedback_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nnfW_B8_stall_region;

architecture normal of bb_gemm_nnfW_B8_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_push_i1_throttle_push_gemm_nnfw1322 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_throttle_push_gemm_nnfw_out_feedback_out_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_throttle_push_gemm_nnfw_out_feedback_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_throttle_push_gemm_nnfw_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_throttle_push_gemm_nnfw_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_throttle_push_gemm_nnfw_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_throttle_push_gemm_nnfw_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V1 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_out_i_acl_push_i1_throttle_push_gemm_nnfw(STALLENABLE,20)
    -- Backward Stall generation
    SE_out_i_acl_push_i1_throttle_push_gemm_nnfw_backStall <= "0";
    -- Computing multiple Valid(s)
    SE_out_i_acl_push_i1_throttle_push_gemm_nnfw_wireValid <= i_acl_push_i1_throttle_push_gemm_nnfw_out_valid_out;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_acl_push_i1_throttle_push_gemm_nnfw(BLACKBOX,10)@0
    -- in in_stall_in@20000000
    -- out out_data_out@1
    -- out out_feedback_out_0@20000000
    -- out out_feedback_valid_out_0@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thei_acl_push_i1_throttle_push_gemm_nnfw : i_acl_push_i1_throttle_push_gemm_nnfw1322
    PORT MAP (
        in_data_in => GND_q,
        in_feedback_stall_in_0 => in_feedback_stall_in_0,
        in_stall_in => SE_out_i_acl_push_i1_throttle_push_gemm_nnfw_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_feedback_out_0 => i_acl_push_i1_throttle_push_gemm_nnfw_out_feedback_out_0,
        out_feedback_valid_out_0 => i_acl_push_i1_throttle_push_gemm_nnfw_out_feedback_valid_out_0,
        out_stall_out => i_acl_push_i1_throttle_push_gemm_nnfw_out_stall_out,
        out_valid_out => i_acl_push_i1_throttle_push_gemm_nnfw_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,21)
    SE_stall_entry_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_stall_entry_fromReg0 <= (others => '0');
            SE_stall_entry_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_stall_entry_fromReg0 <= SE_stall_entry_toReg0;
            -- Succesor 1
            SE_stall_entry_fromReg1 <= SE_stall_entry_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_stall_entry_consumed0 <= (not (i_acl_push_i1_throttle_push_gemm_nnfw_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg0;
    SE_stall_entry_consumed1 <= (not (in_stall_in) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg1;
    -- Consuming
    SE_stall_entry_StallValid <= SE_stall_entry_backStall and SE_stall_entry_wireValid;
    SE_stall_entry_toReg0 <= SE_stall_entry_StallValid and SE_stall_entry_consumed0;
    SE_stall_entry_toReg1 <= SE_stall_entry_StallValid and SE_stall_entry_consumed1;
    -- Backward Stall generation
    SE_stall_entry_or0 <= SE_stall_entry_consumed0;
    SE_stall_entry_wireStall <= not (SE_stall_entry_consumed1 and SE_stall_entry_or0);
    SE_stall_entry_backStall <= SE_stall_entry_wireStall;
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg0);
    SE_stall_entry_V1 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg1);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- dupName_0_sync_out_x(GPOUT,3)@0
    out_valid_out <= SE_stall_entry_V1;

    -- feedback_out_0_sync(GPOUT,7)
    out_feedback_out_0 <= i_acl_push_i1_throttle_push_gemm_nnfw_out_feedback_out_0;

    -- feedback_valid_out_0_sync(GPOUT,9)
    out_feedback_valid_out_0 <= i_acl_push_i1_throttle_push_gemm_nnfw_out_feedback_valid_out_0;

    -- sync_out(GPOUT,16)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
