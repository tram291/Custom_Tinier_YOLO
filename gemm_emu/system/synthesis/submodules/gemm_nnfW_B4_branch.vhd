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

-- VHDL created from gemm_nnfW_B4_branch
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

entity gemm_nnfW_B4_branch is
    port (
        in_c0_exe10107 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe11108 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe12109 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe13 : in std_logic_vector(32 downto 0);  -- ufix33
        in_c0_exe198 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe299 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe3100 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe4101 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe5102 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe6103 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe7104 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe8105 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
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
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end gemm_nnfW_B4_branch;

architecture normal of gemm_nnfW_B4_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_c0_exe10107(GPOUT,17)
    out_c0_exe10107 <= in_c0_exe10107;

    -- out_c0_exe11108(GPOUT,18)
    out_c0_exe11108 <= in_c0_exe11108;

    -- out_c0_exe12109(GPOUT,19)
    out_c0_exe12109 <= in_c0_exe12109;

    -- out_c0_exe13(GPOUT,20)
    out_c0_exe13 <= in_c0_exe13;

    -- out_c0_exe198(GPOUT,21)
    out_c0_exe198 <= in_c0_exe198;

    -- out_c0_exe299(GPOUT,22)
    out_c0_exe299 <= in_c0_exe299;

    -- out_c0_exe3100(GPOUT,23)
    out_c0_exe3100 <= in_c0_exe3100;

    -- out_c0_exe4101(GPOUT,24)
    out_c0_exe4101 <= in_c0_exe4101;

    -- out_c0_exe5102(GPOUT,25)
    out_c0_exe5102 <= in_c0_exe5102;

    -- out_c0_exe6103(GPOUT,26)
    out_c0_exe6103 <= in_c0_exe6103;

    -- out_c0_exe7104(GPOUT,27)
    out_c0_exe7104 <= in_c0_exe7104;

    -- out_c0_exe8105(GPOUT,28)
    out_c0_exe8105 <= in_c0_exe8105;

    -- out_c1_exe1(GPOUT,29)
    out_c1_exe1 <= in_c1_exe1;

    -- stall_out(LOGICAL,32)
    stall_out_q <= in_valid_in and in_stall_in_0;

    -- out_stall_out(GPOUT,30)
    out_stall_out <= stall_out_q;

    -- out_valid_out_0(GPOUT,31)
    out_valid_out_0 <= in_valid_in;

END normal;
