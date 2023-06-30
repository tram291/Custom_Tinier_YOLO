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

-- VHDL created from gemm_nn9W_B5_merge
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

entity gemm_nn9W_B5_merge is
    port (
        in_Cn_272_rep_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_Cn_272_rep_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx30330_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx30330_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_cmp367_RM312_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp367_RM312_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp75_RM310_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp75_RM310_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_conv31_hf_tofpc331_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_conv31_hf_tofpc331_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_div1_RM308_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_div1_RM308_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_div_RM314_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_div_RM314_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_forked329_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked329_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi258_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi258_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi263_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi263_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi268_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi268_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi277_pop16318_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi277_pop16318_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_mul27316_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul27316_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul36332_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul36332_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_notexit300306_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_notexit300306_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_phi_decision139_xor_RM65333_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_phi_decision139_xor_RM65333_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W3_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W3_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W4_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W4_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_Cn_272_rep : out std_logic_vector(63 downto 0);  -- ufix64
        out_arrayidx30330 : out std_logic_vector(63 downto 0);  -- ufix64
        out_cmp367_RM312 : out std_logic_vector(0 downto 0);  -- ufix1
        out_cmp75_RM310 : out std_logic_vector(0 downto 0);  -- ufix1
        out_conv31_hf_tofpc331 : out std_logic_vector(63 downto 0);  -- ufix64
        out_div1_RM308 : out std_logic_vector(31 downto 0);  -- ufix32
        out_div_RM314 : out std_logic_vector(31 downto 0);  -- ufix32
        out_forked329 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi258 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi263 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi268 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi277_pop16318 : out std_logic_vector(0 downto 0);  -- ufix1
        out_mul27316 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mul36332 : out std_logic_vector(31 downto 0);  -- ufix32
        out_notexit300306 : out std_logic_vector(0 downto 0);  -- ufix1
        out_phi_decision139_xor_RM65333 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nn9W3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nn9W4 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end gemm_nn9W_B5_merge;

architecture normal of gemm_nn9W_B5_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal Cn_272_rep_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal Cn_272_rep_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal arrayidx30330_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx30330_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal cmp367_RM312_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp367_RM312_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp75_RM310_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp75_RM310_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal conv31_hf_tofpc331_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal conv31_hf_tofpc331_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal div1_RM308_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal div1_RM308_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal div_RM314_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal div_RM314_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal forked329_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal forked329_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi258_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi258_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi263_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi263_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi268_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi268_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi277_pop16318_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi277_pop16318_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mul27316_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal mul27316_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal mul36332_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal mul36332_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal notexit300306_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal notexit300306_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal phi_decision139_xor_RM65333_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal phi_decision139_xor_RM65333_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_gemm_nn9W3_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_gemm_nn9W3_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_gemm_nn9W4_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_gemm_nn9W4_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_or_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- Cn_272_rep_mux(MUX,2)
    Cn_272_rep_mux_s <= in_valid_in_0;
    Cn_272_rep_mux_combproc: PROCESS (Cn_272_rep_mux_s, in_Cn_272_rep_1, in_Cn_272_rep_0)
    BEGIN
        CASE (Cn_272_rep_mux_s) IS
            WHEN "0" => Cn_272_rep_mux_q <= in_Cn_272_rep_1;
            WHEN "1" => Cn_272_rep_mux_q <= in_Cn_272_rep_0;
            WHEN OTHERS => Cn_272_rep_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_Cn_272_rep(GPOUT,56)
    out_Cn_272_rep <= Cn_272_rep_mux_q;

    -- arrayidx30330_mux(MUX,3)
    arrayidx30330_mux_s <= in_valid_in_0;
    arrayidx30330_mux_combproc: PROCESS (arrayidx30330_mux_s, in_arrayidx30330_1, in_arrayidx30330_0)
    BEGIN
        CASE (arrayidx30330_mux_s) IS
            WHEN "0" => arrayidx30330_mux_q <= in_arrayidx30330_1;
            WHEN "1" => arrayidx30330_mux_q <= in_arrayidx30330_0;
            WHEN OTHERS => arrayidx30330_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx30330(GPOUT,57)
    out_arrayidx30330 <= arrayidx30330_mux_q;

    -- cmp367_RM312_mux(MUX,4)
    cmp367_RM312_mux_s <= in_valid_in_0;
    cmp367_RM312_mux_combproc: PROCESS (cmp367_RM312_mux_s, in_cmp367_RM312_1, in_cmp367_RM312_0)
    BEGIN
        CASE (cmp367_RM312_mux_s) IS
            WHEN "0" => cmp367_RM312_mux_q <= in_cmp367_RM312_1;
            WHEN "1" => cmp367_RM312_mux_q <= in_cmp367_RM312_0;
            WHEN OTHERS => cmp367_RM312_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_cmp367_RM312(GPOUT,58)
    out_cmp367_RM312 <= cmp367_RM312_mux_q;

    -- cmp75_RM310_mux(MUX,5)
    cmp75_RM310_mux_s <= in_valid_in_0;
    cmp75_RM310_mux_combproc: PROCESS (cmp75_RM310_mux_s, in_cmp75_RM310_1, in_cmp75_RM310_0)
    BEGIN
        CASE (cmp75_RM310_mux_s) IS
            WHEN "0" => cmp75_RM310_mux_q <= in_cmp75_RM310_1;
            WHEN "1" => cmp75_RM310_mux_q <= in_cmp75_RM310_0;
            WHEN OTHERS => cmp75_RM310_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_cmp75_RM310(GPOUT,59)
    out_cmp75_RM310 <= cmp75_RM310_mux_q;

    -- conv31_hf_tofpc331_mux(MUX,6)
    conv31_hf_tofpc331_mux_s <= in_valid_in_0;
    conv31_hf_tofpc331_mux_combproc: PROCESS (conv31_hf_tofpc331_mux_s, in_conv31_hf_tofpc331_1, in_conv31_hf_tofpc331_0)
    BEGIN
        CASE (conv31_hf_tofpc331_mux_s) IS
            WHEN "0" => conv31_hf_tofpc331_mux_q <= in_conv31_hf_tofpc331_1;
            WHEN "1" => conv31_hf_tofpc331_mux_q <= in_conv31_hf_tofpc331_0;
            WHEN OTHERS => conv31_hf_tofpc331_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_conv31_hf_tofpc331(GPOUT,60)
    out_conv31_hf_tofpc331 <= conv31_hf_tofpc331_mux_q;

    -- div1_RM308_mux(MUX,7)
    div1_RM308_mux_s <= in_valid_in_0;
    div1_RM308_mux_combproc: PROCESS (div1_RM308_mux_s, in_div1_RM308_1, in_div1_RM308_0)
    BEGIN
        CASE (div1_RM308_mux_s) IS
            WHEN "0" => div1_RM308_mux_q <= in_div1_RM308_1;
            WHEN "1" => div1_RM308_mux_q <= in_div1_RM308_0;
            WHEN OTHERS => div1_RM308_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_div1_RM308(GPOUT,61)
    out_div1_RM308 <= div1_RM308_mux_q;

    -- div_RM314_mux(MUX,8)
    div_RM314_mux_s <= in_valid_in_0;
    div_RM314_mux_combproc: PROCESS (div_RM314_mux_s, in_div_RM314_1, in_div_RM314_0)
    BEGIN
        CASE (div_RM314_mux_s) IS
            WHEN "0" => div_RM314_mux_q <= in_div_RM314_1;
            WHEN "1" => div_RM314_mux_q <= in_div_RM314_0;
            WHEN OTHERS => div_RM314_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_div_RM314(GPOUT,62)
    out_div_RM314 <= div_RM314_mux_q;

    -- forked329_mux(MUX,9)
    forked329_mux_s <= in_valid_in_0;
    forked329_mux_combproc: PROCESS (forked329_mux_s, in_forked329_1, in_forked329_0)
    BEGIN
        CASE (forked329_mux_s) IS
            WHEN "0" => forked329_mux_q <= in_forked329_1;
            WHEN "1" => forked329_mux_q <= in_forked329_0;
            WHEN OTHERS => forked329_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_forked329(GPOUT,63)
    out_forked329 <= forked329_mux_q;

    -- memdep_phi258_mux(MUX,49)
    memdep_phi258_mux_s <= in_valid_in_0;
    memdep_phi258_mux_combproc: PROCESS (memdep_phi258_mux_s, in_memdep_phi258_1, in_memdep_phi258_0)
    BEGIN
        CASE (memdep_phi258_mux_s) IS
            WHEN "0" => memdep_phi258_mux_q <= in_memdep_phi258_1;
            WHEN "1" => memdep_phi258_mux_q <= in_memdep_phi258_0;
            WHEN OTHERS => memdep_phi258_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_memdep_phi258(GPOUT,64)
    out_memdep_phi258 <= memdep_phi258_mux_q;

    -- memdep_phi263_mux(MUX,50)
    memdep_phi263_mux_s <= in_valid_in_0;
    memdep_phi263_mux_combproc: PROCESS (memdep_phi263_mux_s, in_memdep_phi263_1, in_memdep_phi263_0)
    BEGIN
        CASE (memdep_phi263_mux_s) IS
            WHEN "0" => memdep_phi263_mux_q <= in_memdep_phi263_1;
            WHEN "1" => memdep_phi263_mux_q <= in_memdep_phi263_0;
            WHEN OTHERS => memdep_phi263_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_memdep_phi263(GPOUT,65)
    out_memdep_phi263 <= memdep_phi263_mux_q;

    -- memdep_phi268_mux(MUX,51)
    memdep_phi268_mux_s <= in_valid_in_0;
    memdep_phi268_mux_combproc: PROCESS (memdep_phi268_mux_s, in_memdep_phi268_1, in_memdep_phi268_0)
    BEGIN
        CASE (memdep_phi268_mux_s) IS
            WHEN "0" => memdep_phi268_mux_q <= in_memdep_phi268_1;
            WHEN "1" => memdep_phi268_mux_q <= in_memdep_phi268_0;
            WHEN OTHERS => memdep_phi268_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_memdep_phi268(GPOUT,66)
    out_memdep_phi268 <= memdep_phi268_mux_q;

    -- memdep_phi277_pop16318_mux(MUX,52)
    memdep_phi277_pop16318_mux_s <= in_valid_in_0;
    memdep_phi277_pop16318_mux_combproc: PROCESS (memdep_phi277_pop16318_mux_s, in_memdep_phi277_pop16318_1, in_memdep_phi277_pop16318_0)
    BEGIN
        CASE (memdep_phi277_pop16318_mux_s) IS
            WHEN "0" => memdep_phi277_pop16318_mux_q <= in_memdep_phi277_pop16318_1;
            WHEN "1" => memdep_phi277_pop16318_mux_q <= in_memdep_phi277_pop16318_0;
            WHEN OTHERS => memdep_phi277_pop16318_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_memdep_phi277_pop16318(GPOUT,67)
    out_memdep_phi277_pop16318 <= memdep_phi277_pop16318_mux_q;

    -- mul27316_mux(MUX,53)
    mul27316_mux_s <= in_valid_in_0;
    mul27316_mux_combproc: PROCESS (mul27316_mux_s, in_mul27316_1, in_mul27316_0)
    BEGIN
        CASE (mul27316_mux_s) IS
            WHEN "0" => mul27316_mux_q <= in_mul27316_1;
            WHEN "1" => mul27316_mux_q <= in_mul27316_0;
            WHEN OTHERS => mul27316_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_mul27316(GPOUT,68)
    out_mul27316 <= mul27316_mux_q;

    -- mul36332_mux(MUX,54)
    mul36332_mux_s <= in_valid_in_0;
    mul36332_mux_combproc: PROCESS (mul36332_mux_s, in_mul36332_1, in_mul36332_0)
    BEGIN
        CASE (mul36332_mux_s) IS
            WHEN "0" => mul36332_mux_q <= in_mul36332_1;
            WHEN "1" => mul36332_mux_q <= in_mul36332_0;
            WHEN OTHERS => mul36332_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_mul36332(GPOUT,69)
    out_mul36332 <= mul36332_mux_q;

    -- notexit300306_mux(MUX,55)
    notexit300306_mux_s <= in_valid_in_0;
    notexit300306_mux_combproc: PROCESS (notexit300306_mux_s, in_notexit300306_1, in_notexit300306_0)
    BEGIN
        CASE (notexit300306_mux_s) IS
            WHEN "0" => notexit300306_mux_q <= in_notexit300306_1;
            WHEN "1" => notexit300306_mux_q <= in_notexit300306_0;
            WHEN OTHERS => notexit300306_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_notexit300306(GPOUT,70)
    out_notexit300306 <= notexit300306_mux_q;

    -- phi_decision139_xor_RM65333_mux(MUX,77)
    phi_decision139_xor_RM65333_mux_s <= in_valid_in_0;
    phi_decision139_xor_RM65333_mux_combproc: PROCESS (phi_decision139_xor_RM65333_mux_s, in_phi_decision139_xor_RM65333_1, in_phi_decision139_xor_RM65333_0)
    BEGIN
        CASE (phi_decision139_xor_RM65333_mux_s) IS
            WHEN "0" => phi_decision139_xor_RM65333_mux_q <= in_phi_decision139_xor_RM65333_1;
            WHEN "1" => phi_decision139_xor_RM65333_mux_q <= in_phi_decision139_xor_RM65333_0;
            WHEN OTHERS => phi_decision139_xor_RM65333_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_phi_decision139_xor_RM65333(GPOUT,71)
    out_phi_decision139_xor_RM65333 <= phi_decision139_xor_RM65333_mux_q;

    -- valid_or(LOGICAL,82)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,78)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,72)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,79)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,73)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- unnamed_gemm_nn9W3_mux(MUX,80)
    unnamed_gemm_nn9W3_mux_s <= in_valid_in_0;
    unnamed_gemm_nn9W3_mux_combproc: PROCESS (unnamed_gemm_nn9W3_mux_s, in_unnamed_gemm_nn9W3_1, in_unnamed_gemm_nn9W3_0)
    BEGIN
        CASE (unnamed_gemm_nn9W3_mux_s) IS
            WHEN "0" => unnamed_gemm_nn9W3_mux_q <= in_unnamed_gemm_nn9W3_1;
            WHEN "1" => unnamed_gemm_nn9W3_mux_q <= in_unnamed_gemm_nn9W3_0;
            WHEN OTHERS => unnamed_gemm_nn9W3_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_unnamed_gemm_nn9W3(GPOUT,74)
    out_unnamed_gemm_nn9W3 <= unnamed_gemm_nn9W3_mux_q;

    -- unnamed_gemm_nn9W4_mux(MUX,81)
    unnamed_gemm_nn9W4_mux_s <= in_valid_in_0;
    unnamed_gemm_nn9W4_mux_combproc: PROCESS (unnamed_gemm_nn9W4_mux_s, in_unnamed_gemm_nn9W4_1, in_unnamed_gemm_nn9W4_0)
    BEGIN
        CASE (unnamed_gemm_nn9W4_mux_s) IS
            WHEN "0" => unnamed_gemm_nn9W4_mux_q <= in_unnamed_gemm_nn9W4_1;
            WHEN "1" => unnamed_gemm_nn9W4_mux_q <= in_unnamed_gemm_nn9W4_0;
            WHEN OTHERS => unnamed_gemm_nn9W4_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_unnamed_gemm_nn9W4(GPOUT,75)
    out_unnamed_gemm_nn9W4 <= unnamed_gemm_nn9W4_mux_q;

    -- out_valid_out(GPOUT,76)
    out_valid_out <= valid_or_q;

END normal;
