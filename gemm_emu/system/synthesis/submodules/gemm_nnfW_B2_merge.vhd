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

-- VHDL created from gemm_nnfW_B2_merge
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

entity gemm_nnfW_B2_merge is
    port (
        in_forked45_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked45_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked46_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked46_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_j_089_pop948_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_089_pop948_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_memdep_phi_pop1050_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi_pop1050_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_notexit2949_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_notexit2949_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_sdiv_add124_RM47_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_sdiv_add124_RM47_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nnfW0_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_forked45 : out std_logic_vector(0 downto 0);  -- ufix1
        out_forked46 : out std_logic_vector(0 downto 0);  -- ufix1
        out_j_089_pop948 : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_phi_pop1050 : out std_logic_vector(0 downto 0);  -- ufix1
        out_notexit2949 : out std_logic_vector(0 downto 0);  -- ufix1
        out_sdiv_add124_RM47 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nnfW0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end gemm_nnfW_B2_merge;

architecture normal of gemm_nnfW_B2_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal forked45_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal forked45_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal forked46_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal forked46_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal j_089_pop948_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal j_089_pop948_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal memdep_phi_pop1050_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi_pop1050_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal notexit2949_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal notexit2949_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sdiv_add124_RM47_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal sdiv_add124_RM47_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_gemm_nnfW0_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_gemm_nnfW0_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_or_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- forked45_mux(MUX,2)
    forked45_mux_s <= in_valid_in_0;
    forked45_mux_combproc: PROCESS (forked45_mux_s, in_forked45_1, in_forked45_0)
    BEGIN
        CASE (forked45_mux_s) IS
            WHEN "0" => forked45_mux_q <= in_forked45_1;
            WHEN "1" => forked45_mux_q <= in_forked45_0;
            WHEN OTHERS => forked45_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_forked45(GPOUT,24)
    out_forked45 <= forked45_mux_q;

    -- forked46_mux(MUX,3)
    forked46_mux_s <= in_valid_in_0;
    forked46_mux_combproc: PROCESS (forked46_mux_s, in_forked46_1, in_forked46_0)
    BEGIN
        CASE (forked46_mux_s) IS
            WHEN "0" => forked46_mux_q <= in_forked46_1;
            WHEN "1" => forked46_mux_q <= in_forked46_0;
            WHEN OTHERS => forked46_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_forked46(GPOUT,25)
    out_forked46 <= forked46_mux_q;

    -- j_089_pop948_mux(MUX,21)
    j_089_pop948_mux_s <= in_valid_in_0;
    j_089_pop948_mux_combproc: PROCESS (j_089_pop948_mux_s, in_j_089_pop948_1, in_j_089_pop948_0)
    BEGIN
        CASE (j_089_pop948_mux_s) IS
            WHEN "0" => j_089_pop948_mux_q <= in_j_089_pop948_1;
            WHEN "1" => j_089_pop948_mux_q <= in_j_089_pop948_0;
            WHEN OTHERS => j_089_pop948_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_j_089_pop948(GPOUT,26)
    out_j_089_pop948 <= j_089_pop948_mux_q;

    -- memdep_phi_pop1050_mux(MUX,22)
    memdep_phi_pop1050_mux_s <= in_valid_in_0;
    memdep_phi_pop1050_mux_combproc: PROCESS (memdep_phi_pop1050_mux_s, in_memdep_phi_pop1050_1, in_memdep_phi_pop1050_0)
    BEGIN
        CASE (memdep_phi_pop1050_mux_s) IS
            WHEN "0" => memdep_phi_pop1050_mux_q <= in_memdep_phi_pop1050_1;
            WHEN "1" => memdep_phi_pop1050_mux_q <= in_memdep_phi_pop1050_0;
            WHEN OTHERS => memdep_phi_pop1050_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_memdep_phi_pop1050(GPOUT,27)
    out_memdep_phi_pop1050 <= memdep_phi_pop1050_mux_q;

    -- notexit2949_mux(MUX,23)
    notexit2949_mux_s <= in_valid_in_0;
    notexit2949_mux_combproc: PROCESS (notexit2949_mux_s, in_notexit2949_1, in_notexit2949_0)
    BEGIN
        CASE (notexit2949_mux_s) IS
            WHEN "0" => notexit2949_mux_q <= in_notexit2949_1;
            WHEN "1" => notexit2949_mux_q <= in_notexit2949_0;
            WHEN OTHERS => notexit2949_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_notexit2949(GPOUT,28)
    out_notexit2949 <= notexit2949_mux_q;

    -- sdiv_add124_RM47_mux(MUX,34)
    sdiv_add124_RM47_mux_s <= in_valid_in_0;
    sdiv_add124_RM47_mux_combproc: PROCESS (sdiv_add124_RM47_mux_s, in_sdiv_add124_RM47_1, in_sdiv_add124_RM47_0)
    BEGIN
        CASE (sdiv_add124_RM47_mux_s) IS
            WHEN "0" => sdiv_add124_RM47_mux_q <= in_sdiv_add124_RM47_1;
            WHEN "1" => sdiv_add124_RM47_mux_q <= in_sdiv_add124_RM47_0;
            WHEN OTHERS => sdiv_add124_RM47_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_sdiv_add124_RM47(GPOUT,29)
    out_sdiv_add124_RM47 <= sdiv_add124_RM47_mux_q;

    -- valid_or(LOGICAL,38)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,35)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,30)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,36)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,31)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- unnamed_gemm_nnfW0_mux(MUX,37)
    unnamed_gemm_nnfW0_mux_s <= in_valid_in_0;
    unnamed_gemm_nnfW0_mux_combproc: PROCESS (unnamed_gemm_nnfW0_mux_s, in_unnamed_gemm_nnfW0_1, in_unnamed_gemm_nnfW0_0)
    BEGIN
        CASE (unnamed_gemm_nnfW0_mux_s) IS
            WHEN "0" => unnamed_gemm_nnfW0_mux_q <= in_unnamed_gemm_nnfW0_1;
            WHEN "1" => unnamed_gemm_nnfW0_mux_q <= in_unnamed_gemm_nnfW0_0;
            WHEN OTHERS => unnamed_gemm_nnfW0_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_unnamed_gemm_nnfW0(GPOUT,32)
    out_unnamed_gemm_nnfW0 <= unnamed_gemm_nnfW0_mux_q;

    -- out_valid_out(GPOUT,33)
    out_valid_out <= valid_or_q;

END normal;
