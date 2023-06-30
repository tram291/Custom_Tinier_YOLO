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

-- VHDL created from gemm_nn9W_B4_branch
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

entity gemm_nn9W_B4_branch is
    port (
        in_c0_exe10388 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe11389 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe12390 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe13391 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe1379 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe2380 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe3381 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe4382 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe5383 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe6384 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe7385 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe8386 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe1397 : in std_logic_vector(63 downto 0);  -- ufix64
        in_memdep_phi257 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi262 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi267 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe10388 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe11389 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe12390 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe13391 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe1379 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe2380 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe3381 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe4382 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe5383 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exe6384 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe7385 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe8386 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe1397 : out std_logic_vector(63 downto 0);  -- ufix64
        out_memdep_phi257 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi262 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi267 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end gemm_nn9W_B4_branch;

architecture normal of gemm_nn9W_B4_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_c0_exe10388(GPOUT,20)
    out_c0_exe10388 <= in_c0_exe10388;

    -- out_c0_exe11389(GPOUT,21)
    out_c0_exe11389 <= in_c0_exe11389;

    -- out_c0_exe12390(GPOUT,22)
    out_c0_exe12390 <= in_c0_exe12390;

    -- out_c0_exe13391(GPOUT,23)
    out_c0_exe13391 <= in_c0_exe13391;

    -- out_c0_exe1379(GPOUT,24)
    out_c0_exe1379 <= in_c0_exe1379;

    -- out_c0_exe2380(GPOUT,25)
    out_c0_exe2380 <= in_c0_exe2380;

    -- out_c0_exe3381(GPOUT,26)
    out_c0_exe3381 <= in_c0_exe3381;

    -- out_c0_exe4382(GPOUT,27)
    out_c0_exe4382 <= in_c0_exe4382;

    -- out_c0_exe5383(GPOUT,28)
    out_c0_exe5383 <= in_c0_exe5383;

    -- out_c0_exe6384(GPOUT,29)
    out_c0_exe6384 <= in_c0_exe6384;

    -- out_c0_exe7385(GPOUT,30)
    out_c0_exe7385 <= in_c0_exe7385;

    -- out_c0_exe8386(GPOUT,31)
    out_c0_exe8386 <= in_c0_exe8386;

    -- out_c1_exe1397(GPOUT,32)
    out_c1_exe1397 <= in_c1_exe1397;

    -- out_memdep_phi257(GPOUT,33)
    out_memdep_phi257 <= in_memdep_phi257;

    -- out_memdep_phi262(GPOUT,34)
    out_memdep_phi262 <= in_memdep_phi262;

    -- out_memdep_phi267(GPOUT,35)
    out_memdep_phi267 <= in_memdep_phi267;

    -- stall_out(LOGICAL,38)
    stall_out_q <= in_valid_in and in_stall_in_0;

    -- out_stall_out(GPOUT,36)
    out_stall_out <= stall_out_q;

    -- out_valid_out_0(GPOUT,37)
    out_valid_out_0 <= in_valid_in;

END normal;
