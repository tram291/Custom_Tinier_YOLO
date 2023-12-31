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

-- VHDL created from gemm_nn9W_B7_merge
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

entity gemm_nn9W_B7_merge is
    port (
        in_c0_exe743510_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe843612_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe145715_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe245817_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe345919_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_27621_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi2583_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi2635_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi2687_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe743510 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe843612 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe145715 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe245817 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe345919 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_27621 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi2583 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi2635 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi2687 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end gemm_nn9W_B7_merge;

architecture normal of gemm_nn9W_B7_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_c0_exe743510(GPOUT,13)
    out_c0_exe743510 <= in_c0_exe743510_0;

    -- out_c0_exe843612(GPOUT,14)
    out_c0_exe843612 <= in_c0_exe843612_0;

    -- out_c1_exe145715(GPOUT,15)
    out_c1_exe145715 <= in_c1_exe145715_0;

    -- out_c1_exe245817(GPOUT,16)
    out_c1_exe245817 <= in_c1_exe245817_0;

    -- out_c1_exe345919(GPOUT,17)
    out_c1_exe345919 <= in_c1_exe345919_0;

    -- out_memdep_27621(GPOUT,18)
    out_memdep_27621 <= in_memdep_27621_0;

    -- out_memdep_phi2583(GPOUT,19)
    out_memdep_phi2583 <= in_memdep_phi2583_0;

    -- out_memdep_phi2635(GPOUT,20)
    out_memdep_phi2635 <= in_memdep_phi2635_0;

    -- out_memdep_phi2687(GPOUT,21)
    out_memdep_phi2687 <= in_memdep_phi2687_0;

    -- stall_out(LOGICAL,24)
    stall_out_q <= in_valid_in_0 and in_stall_in;

    -- out_stall_out_0(GPOUT,22)
    out_stall_out_0 <= stall_out_q;

    -- out_valid_out(GPOUT,23)
    out_valid_out <= in_valid_in_0;

END normal;
