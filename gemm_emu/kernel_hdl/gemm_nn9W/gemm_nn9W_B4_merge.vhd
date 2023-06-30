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

-- VHDL created from gemm_nn9W_B4_merge
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

entity gemm_nn9W_B4_merge is
    port (
        in_cmp367_RM311_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp367_RM311_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp75_RM309_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_cmp75_RM309_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_div1_RM307_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_div1_RM307_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_div_RM313_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_div_RM313_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_forked304_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked304_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi257_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi257_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi262_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi262_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi267_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi267_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi277_pop16317_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi277_pop16317_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_mul27315_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul27315_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_notexit300305_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_notexit300305_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W1_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W1_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_cmp367_RM311 : out std_logic_vector(0 downto 0);  -- ufix1
        out_cmp75_RM309 : out std_logic_vector(0 downto 0);  -- ufix1
        out_div1_RM307 : out std_logic_vector(31 downto 0);  -- ufix32
        out_div_RM313 : out std_logic_vector(31 downto 0);  -- ufix32
        out_forked304 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi257 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi262 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi267 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi277_pop16317 : out std_logic_vector(0 downto 0);  -- ufix1
        out_mul27315 : out std_logic_vector(31 downto 0);  -- ufix32
        out_notexit300305 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nn9W1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end gemm_nn9W_B4_merge;

architecture normal of gemm_nn9W_B4_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp367_RM311_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp367_RM311_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp75_RM309_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp75_RM309_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal div1_RM307_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal div1_RM307_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal div_RM313_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal div_RM313_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal forked304_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal forked304_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi257_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi257_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi262_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi262_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi267_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi267_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi277_pop16317_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi277_pop16317_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mul27315_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal mul27315_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal notexit300305_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal notexit300305_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_gemm_nn9W1_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_gemm_nn9W1_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_or_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- cmp367_RM311_mux(MUX,2)
    cmp367_RM311_mux_s <= in_valid_in_0;
    cmp367_RM311_mux_combproc: PROCESS (cmp367_RM311_mux_s, in_cmp367_RM311_1, in_cmp367_RM311_0)
    BEGIN
        CASE (cmp367_RM311_mux_s) IS
            WHEN "0" => cmp367_RM311_mux_q <= in_cmp367_RM311_1;
            WHEN "1" => cmp367_RM311_mux_q <= in_cmp367_RM311_0;
            WHEN OTHERS => cmp367_RM311_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_cmp367_RM311(GPOUT,40)
    out_cmp367_RM311 <= cmp367_RM311_mux_q;

    -- cmp75_RM309_mux(MUX,3)
    cmp75_RM309_mux_s <= in_valid_in_0;
    cmp75_RM309_mux_combproc: PROCESS (cmp75_RM309_mux_s, in_cmp75_RM309_1, in_cmp75_RM309_0)
    BEGIN
        CASE (cmp75_RM309_mux_s) IS
            WHEN "0" => cmp75_RM309_mux_q <= in_cmp75_RM309_1;
            WHEN "1" => cmp75_RM309_mux_q <= in_cmp75_RM309_0;
            WHEN OTHERS => cmp75_RM309_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_cmp75_RM309(GPOUT,41)
    out_cmp75_RM309 <= cmp75_RM309_mux_q;

    -- div1_RM307_mux(MUX,4)
    div1_RM307_mux_s <= in_valid_in_0;
    div1_RM307_mux_combproc: PROCESS (div1_RM307_mux_s, in_div1_RM307_1, in_div1_RM307_0)
    BEGIN
        CASE (div1_RM307_mux_s) IS
            WHEN "0" => div1_RM307_mux_q <= in_div1_RM307_1;
            WHEN "1" => div1_RM307_mux_q <= in_div1_RM307_0;
            WHEN OTHERS => div1_RM307_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_div1_RM307(GPOUT,42)
    out_div1_RM307 <= div1_RM307_mux_q;

    -- div_RM313_mux(MUX,5)
    div_RM313_mux_s <= in_valid_in_0;
    div_RM313_mux_combproc: PROCESS (div_RM313_mux_s, in_div_RM313_1, in_div_RM313_0)
    BEGIN
        CASE (div_RM313_mux_s) IS
            WHEN "0" => div_RM313_mux_q <= in_div_RM313_1;
            WHEN "1" => div_RM313_mux_q <= in_div_RM313_0;
            WHEN OTHERS => div_RM313_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_div_RM313(GPOUT,43)
    out_div_RM313 <= div_RM313_mux_q;

    -- forked304_mux(MUX,6)
    forked304_mux_s <= in_valid_in_0;
    forked304_mux_combproc: PROCESS (forked304_mux_s, in_forked304_1, in_forked304_0)
    BEGIN
        CASE (forked304_mux_s) IS
            WHEN "0" => forked304_mux_q <= in_forked304_1;
            WHEN "1" => forked304_mux_q <= in_forked304_0;
            WHEN OTHERS => forked304_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_forked304(GPOUT,44)
    out_forked304 <= forked304_mux_q;

    -- memdep_phi257_mux(MUX,34)
    memdep_phi257_mux_s <= in_valid_in_0;
    memdep_phi257_mux_combproc: PROCESS (memdep_phi257_mux_s, in_memdep_phi257_1, in_memdep_phi257_0)
    BEGIN
        CASE (memdep_phi257_mux_s) IS
            WHEN "0" => memdep_phi257_mux_q <= in_memdep_phi257_1;
            WHEN "1" => memdep_phi257_mux_q <= in_memdep_phi257_0;
            WHEN OTHERS => memdep_phi257_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_memdep_phi257(GPOUT,45)
    out_memdep_phi257 <= memdep_phi257_mux_q;

    -- memdep_phi262_mux(MUX,35)
    memdep_phi262_mux_s <= in_valid_in_0;
    memdep_phi262_mux_combproc: PROCESS (memdep_phi262_mux_s, in_memdep_phi262_1, in_memdep_phi262_0)
    BEGIN
        CASE (memdep_phi262_mux_s) IS
            WHEN "0" => memdep_phi262_mux_q <= in_memdep_phi262_1;
            WHEN "1" => memdep_phi262_mux_q <= in_memdep_phi262_0;
            WHEN OTHERS => memdep_phi262_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_memdep_phi262(GPOUT,46)
    out_memdep_phi262 <= memdep_phi262_mux_q;

    -- memdep_phi267_mux(MUX,36)
    memdep_phi267_mux_s <= in_valid_in_0;
    memdep_phi267_mux_combproc: PROCESS (memdep_phi267_mux_s, in_memdep_phi267_1, in_memdep_phi267_0)
    BEGIN
        CASE (memdep_phi267_mux_s) IS
            WHEN "0" => memdep_phi267_mux_q <= in_memdep_phi267_1;
            WHEN "1" => memdep_phi267_mux_q <= in_memdep_phi267_0;
            WHEN OTHERS => memdep_phi267_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_memdep_phi267(GPOUT,47)
    out_memdep_phi267 <= memdep_phi267_mux_q;

    -- memdep_phi277_pop16317_mux(MUX,37)
    memdep_phi277_pop16317_mux_s <= in_valid_in_0;
    memdep_phi277_pop16317_mux_combproc: PROCESS (memdep_phi277_pop16317_mux_s, in_memdep_phi277_pop16317_1, in_memdep_phi277_pop16317_0)
    BEGIN
        CASE (memdep_phi277_pop16317_mux_s) IS
            WHEN "0" => memdep_phi277_pop16317_mux_q <= in_memdep_phi277_pop16317_1;
            WHEN "1" => memdep_phi277_pop16317_mux_q <= in_memdep_phi277_pop16317_0;
            WHEN OTHERS => memdep_phi277_pop16317_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_memdep_phi277_pop16317(GPOUT,48)
    out_memdep_phi277_pop16317 <= memdep_phi277_pop16317_mux_q;

    -- mul27315_mux(MUX,38)
    mul27315_mux_s <= in_valid_in_0;
    mul27315_mux_combproc: PROCESS (mul27315_mux_s, in_mul27315_1, in_mul27315_0)
    BEGIN
        CASE (mul27315_mux_s) IS
            WHEN "0" => mul27315_mux_q <= in_mul27315_1;
            WHEN "1" => mul27315_mux_q <= in_mul27315_0;
            WHEN OTHERS => mul27315_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_mul27315(GPOUT,49)
    out_mul27315 <= mul27315_mux_q;

    -- notexit300305_mux(MUX,39)
    notexit300305_mux_s <= in_valid_in_0;
    notexit300305_mux_combproc: PROCESS (notexit300305_mux_s, in_notexit300305_1, in_notexit300305_0)
    BEGIN
        CASE (notexit300305_mux_s) IS
            WHEN "0" => notexit300305_mux_q <= in_notexit300305_1;
            WHEN "1" => notexit300305_mux_q <= in_notexit300305_0;
            WHEN OTHERS => notexit300305_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_notexit300305(GPOUT,50)
    out_notexit300305 <= notexit300305_mux_q;

    -- valid_or(LOGICAL,58)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,55)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,51)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,56)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,52)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- unnamed_gemm_nn9W1_mux(MUX,57)
    unnamed_gemm_nn9W1_mux_s <= in_valid_in_0;
    unnamed_gemm_nn9W1_mux_combproc: PROCESS (unnamed_gemm_nn9W1_mux_s, in_unnamed_gemm_nn9W1_1, in_unnamed_gemm_nn9W1_0)
    BEGIN
        CASE (unnamed_gemm_nn9W1_mux_s) IS
            WHEN "0" => unnamed_gemm_nn9W1_mux_q <= in_unnamed_gemm_nn9W1_1;
            WHEN "1" => unnamed_gemm_nn9W1_mux_q <= in_unnamed_gemm_nn9W1_0;
            WHEN OTHERS => unnamed_gemm_nn9W1_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_unnamed_gemm_nn9W1(GPOUT,53)
    out_unnamed_gemm_nn9W1 <= unnamed_gemm_nn9W1_mux_q;

    -- out_valid_out(GPOUT,54)
    out_valid_out <= valid_or_q;

END normal;
