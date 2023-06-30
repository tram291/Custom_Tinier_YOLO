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

-- VHDL created from gemm_nn9W_B6_merge
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

entity gemm_nn9W_B6_merge is
    port (
        in_c0_exit4289_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit4289_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit4289_0_2 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit4289_0_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit4289_0_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit4289_0_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit4289_0_6 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit4289_0_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit4289_0_8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit4289_0_9 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit4289_0_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit4289_0_11 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit45614_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit45614_0_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit45614_0_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit45614_0_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit45614_0_4 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe743511_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe843613_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe145716_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe245818_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe345920_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi2584_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi2636_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi2688_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit4289_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit4289_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit4289_2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit4289_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit4289_4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit4289_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit4289_6 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit4289_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit4289_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit4289_9 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit4289_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit4289_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit45614_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit45614_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit45614_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit45614_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exit45614_4 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe743511 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe843613 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe145716 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe245818 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe345920 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi2584 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi2636 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi2688 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end gemm_nn9W_B6_merge;

architecture normal of gemm_nn9W_B6_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_c0_exit4289_0(GPOUT,29)
    out_c0_exit4289_0 <= in_c0_exit4289_0_0;

    -- out_c0_exit4289_1(GPOUT,30)
    out_c0_exit4289_1 <= in_c0_exit4289_0_1;

    -- out_c0_exit4289_2(GPOUT,31)
    out_c0_exit4289_2 <= in_c0_exit4289_0_2;

    -- out_c0_exit4289_3(GPOUT,32)
    out_c0_exit4289_3 <= in_c0_exit4289_0_3;

    -- out_c0_exit4289_4(GPOUT,33)
    out_c0_exit4289_4 <= in_c0_exit4289_0_4;

    -- out_c0_exit4289_5(GPOUT,34)
    out_c0_exit4289_5 <= in_c0_exit4289_0_5;

    -- out_c0_exit4289_6(GPOUT,35)
    out_c0_exit4289_6 <= in_c0_exit4289_0_6;

    -- out_c0_exit4289_7(GPOUT,36)
    out_c0_exit4289_7 <= in_c0_exit4289_0_7;

    -- out_c0_exit4289_8(GPOUT,37)
    out_c0_exit4289_8 <= in_c0_exit4289_0_8;

    -- out_c0_exit4289_9(GPOUT,38)
    out_c0_exit4289_9 <= in_c0_exit4289_0_9;

    -- out_c0_exit4289_10(GPOUT,39)
    out_c0_exit4289_10 <= in_c0_exit4289_0_10;

    -- out_c0_exit4289_11(GPOUT,40)
    out_c0_exit4289_11 <= in_c0_exit4289_0_11;

    -- out_c1_exit45614_0(GPOUT,41)
    out_c1_exit45614_0 <= in_c1_exit45614_0_0;

    -- out_c1_exit45614_1(GPOUT,42)
    out_c1_exit45614_1 <= in_c1_exit45614_0_1;

    -- out_c1_exit45614_2(GPOUT,43)
    out_c1_exit45614_2 <= in_c1_exit45614_0_2;

    -- out_c1_exit45614_3(GPOUT,44)
    out_c1_exit45614_3 <= in_c1_exit45614_0_3;

    -- out_c1_exit45614_4(GPOUT,45)
    out_c1_exit45614_4 <= in_c1_exit45614_0_4;

    -- out_c0_exe743511(GPOUT,46)
    out_c0_exe743511 <= in_c0_exe743511_0;

    -- out_c0_exe843613(GPOUT,47)
    out_c0_exe843613 <= in_c0_exe843613_0;

    -- out_c1_exe145716(GPOUT,48)
    out_c1_exe145716 <= in_c1_exe145716_0;

    -- out_c1_exe245818(GPOUT,49)
    out_c1_exe245818 <= in_c1_exe245818_0;

    -- out_c1_exe345920(GPOUT,50)
    out_c1_exe345920 <= in_c1_exe345920_0;

    -- out_memdep_phi2584(GPOUT,51)
    out_memdep_phi2584 <= in_memdep_phi2584_0;

    -- out_memdep_phi2636(GPOUT,52)
    out_memdep_phi2636 <= in_memdep_phi2636_0;

    -- out_memdep_phi2688(GPOUT,53)
    out_memdep_phi2688 <= in_memdep_phi2688_0;

    -- stall_out(LOGICAL,56)
    stall_out_q <= in_valid_in_0 and in_stall_in;

    -- out_stall_out_0(GPOUT,54)
    out_stall_out_0 <= stall_out_q;

    -- out_valid_out(GPOUT,55)
    out_valid_out <= in_valid_in_0;

END normal;
