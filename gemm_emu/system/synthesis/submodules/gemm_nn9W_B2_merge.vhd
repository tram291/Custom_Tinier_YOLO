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

-- VHDL created from gemm_nn9W_B2_merge
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

entity gemm_nn9W_B2_merge is
    port (
        in_forked303319_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked303319_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_forked_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_j_076_pop9321_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_076_pop9321_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_lda_sync_buffer320_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_lda_sync_buffer320_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_memdep_phi261_pop11324_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi261_pop11324_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi266_pop12325_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi266_pop12325_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi269_pop13326_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi269_pop13326_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi272_pop14327_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi272_pop14327_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi274_pop15328_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi274_pop15328_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi_pop10323_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi_pop10323_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_notexit300322_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_notexit300322_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_unnamed_gemm_nn9W0_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_forked : out std_logic_vector(0 downto 0);  -- ufix1
        out_forked303319 : out std_logic_vector(0 downto 0);  -- ufix1
        out_j_076_pop9321 : out std_logic_vector(31 downto 0);  -- ufix32
        out_lda_sync_buffer320 : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_phi261_pop11324 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi266_pop12325 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi269_pop13326 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi272_pop14327 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi274_pop15328 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi_pop10323 : out std_logic_vector(0 downto 0);  -- ufix1
        out_notexit300322 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_unnamed_gemm_nn9W0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end gemm_nn9W_B2_merge;

architecture normal of gemm_nn9W_B2_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal forked303319_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal forked303319_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal forked_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal forked_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal j_076_pop9321_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal j_076_pop9321_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal lda_sync_buffer320_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal lda_sync_buffer320_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal memdep_phi261_pop11324_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi261_pop11324_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi266_pop12325_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi266_pop12325_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi269_pop13326_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi269_pop13326_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi272_pop14327_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi272_pop14327_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi274_pop15328_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi274_pop15328_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi_pop10323_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal memdep_phi_pop10323_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal notexit300322_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal notexit300322_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_gemm_nn9W0_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal unnamed_gemm_nn9W0_mux_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_or_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- forked_mux(MUX,3)
    forked_mux_s <= in_valid_in_0;
    forked_mux_combproc: PROCESS (forked_mux_s, in_forked_1, in_forked_0)
    BEGIN
        CASE (forked_mux_s) IS
            WHEN "0" => forked_mux_q <= in_forked_1;
            WHEN "1" => forked_mux_q <= in_forked_0;
            WHEN OTHERS => forked_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_forked(GPOUT,40)
    out_forked <= forked_mux_q;

    -- forked303319_mux(MUX,2)
    forked303319_mux_s <= in_valid_in_0;
    forked303319_mux_combproc: PROCESS (forked303319_mux_s, in_forked303319_1, in_forked303319_0)
    BEGIN
        CASE (forked303319_mux_s) IS
            WHEN "0" => forked303319_mux_q <= in_forked303319_1;
            WHEN "1" => forked303319_mux_q <= in_forked303319_0;
            WHEN OTHERS => forked303319_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_forked303319(GPOUT,41)
    out_forked303319 <= forked303319_mux_q;

    -- j_076_pop9321_mux(MUX,31)
    j_076_pop9321_mux_s <= in_valid_in_0;
    j_076_pop9321_mux_combproc: PROCESS (j_076_pop9321_mux_s, in_j_076_pop9321_1, in_j_076_pop9321_0)
    BEGIN
        CASE (j_076_pop9321_mux_s) IS
            WHEN "0" => j_076_pop9321_mux_q <= in_j_076_pop9321_1;
            WHEN "1" => j_076_pop9321_mux_q <= in_j_076_pop9321_0;
            WHEN OTHERS => j_076_pop9321_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_j_076_pop9321(GPOUT,42)
    out_j_076_pop9321 <= j_076_pop9321_mux_q;

    -- lda_sync_buffer320_mux(MUX,32)
    lda_sync_buffer320_mux_s <= in_valid_in_0;
    lda_sync_buffer320_mux_combproc: PROCESS (lda_sync_buffer320_mux_s, in_lda_sync_buffer320_1, in_lda_sync_buffer320_0)
    BEGIN
        CASE (lda_sync_buffer320_mux_s) IS
            WHEN "0" => lda_sync_buffer320_mux_q <= in_lda_sync_buffer320_1;
            WHEN "1" => lda_sync_buffer320_mux_q <= in_lda_sync_buffer320_0;
            WHEN OTHERS => lda_sync_buffer320_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_lda_sync_buffer320(GPOUT,43)
    out_lda_sync_buffer320 <= lda_sync_buffer320_mux_q;

    -- memdep_phi261_pop11324_mux(MUX,33)
    memdep_phi261_pop11324_mux_s <= in_valid_in_0;
    memdep_phi261_pop11324_mux_combproc: PROCESS (memdep_phi261_pop11324_mux_s, in_memdep_phi261_pop11324_1, in_memdep_phi261_pop11324_0)
    BEGIN
        CASE (memdep_phi261_pop11324_mux_s) IS
            WHEN "0" => memdep_phi261_pop11324_mux_q <= in_memdep_phi261_pop11324_1;
            WHEN "1" => memdep_phi261_pop11324_mux_q <= in_memdep_phi261_pop11324_0;
            WHEN OTHERS => memdep_phi261_pop11324_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_memdep_phi261_pop11324(GPOUT,44)
    out_memdep_phi261_pop11324 <= memdep_phi261_pop11324_mux_q;

    -- memdep_phi266_pop12325_mux(MUX,34)
    memdep_phi266_pop12325_mux_s <= in_valid_in_0;
    memdep_phi266_pop12325_mux_combproc: PROCESS (memdep_phi266_pop12325_mux_s, in_memdep_phi266_pop12325_1, in_memdep_phi266_pop12325_0)
    BEGIN
        CASE (memdep_phi266_pop12325_mux_s) IS
            WHEN "0" => memdep_phi266_pop12325_mux_q <= in_memdep_phi266_pop12325_1;
            WHEN "1" => memdep_phi266_pop12325_mux_q <= in_memdep_phi266_pop12325_0;
            WHEN OTHERS => memdep_phi266_pop12325_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_memdep_phi266_pop12325(GPOUT,45)
    out_memdep_phi266_pop12325 <= memdep_phi266_pop12325_mux_q;

    -- memdep_phi269_pop13326_mux(MUX,35)
    memdep_phi269_pop13326_mux_s <= in_valid_in_0;
    memdep_phi269_pop13326_mux_combproc: PROCESS (memdep_phi269_pop13326_mux_s, in_memdep_phi269_pop13326_1, in_memdep_phi269_pop13326_0)
    BEGIN
        CASE (memdep_phi269_pop13326_mux_s) IS
            WHEN "0" => memdep_phi269_pop13326_mux_q <= in_memdep_phi269_pop13326_1;
            WHEN "1" => memdep_phi269_pop13326_mux_q <= in_memdep_phi269_pop13326_0;
            WHEN OTHERS => memdep_phi269_pop13326_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_memdep_phi269_pop13326(GPOUT,46)
    out_memdep_phi269_pop13326 <= memdep_phi269_pop13326_mux_q;

    -- memdep_phi272_pop14327_mux(MUX,36)
    memdep_phi272_pop14327_mux_s <= in_valid_in_0;
    memdep_phi272_pop14327_mux_combproc: PROCESS (memdep_phi272_pop14327_mux_s, in_memdep_phi272_pop14327_1, in_memdep_phi272_pop14327_0)
    BEGIN
        CASE (memdep_phi272_pop14327_mux_s) IS
            WHEN "0" => memdep_phi272_pop14327_mux_q <= in_memdep_phi272_pop14327_1;
            WHEN "1" => memdep_phi272_pop14327_mux_q <= in_memdep_phi272_pop14327_0;
            WHEN OTHERS => memdep_phi272_pop14327_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_memdep_phi272_pop14327(GPOUT,47)
    out_memdep_phi272_pop14327 <= memdep_phi272_pop14327_mux_q;

    -- memdep_phi274_pop15328_mux(MUX,37)
    memdep_phi274_pop15328_mux_s <= in_valid_in_0;
    memdep_phi274_pop15328_mux_combproc: PROCESS (memdep_phi274_pop15328_mux_s, in_memdep_phi274_pop15328_1, in_memdep_phi274_pop15328_0)
    BEGIN
        CASE (memdep_phi274_pop15328_mux_s) IS
            WHEN "0" => memdep_phi274_pop15328_mux_q <= in_memdep_phi274_pop15328_1;
            WHEN "1" => memdep_phi274_pop15328_mux_q <= in_memdep_phi274_pop15328_0;
            WHEN OTHERS => memdep_phi274_pop15328_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_memdep_phi274_pop15328(GPOUT,48)
    out_memdep_phi274_pop15328 <= memdep_phi274_pop15328_mux_q;

    -- memdep_phi_pop10323_mux(MUX,38)
    memdep_phi_pop10323_mux_s <= in_valid_in_0;
    memdep_phi_pop10323_mux_combproc: PROCESS (memdep_phi_pop10323_mux_s, in_memdep_phi_pop10323_1, in_memdep_phi_pop10323_0)
    BEGIN
        CASE (memdep_phi_pop10323_mux_s) IS
            WHEN "0" => memdep_phi_pop10323_mux_q <= in_memdep_phi_pop10323_1;
            WHEN "1" => memdep_phi_pop10323_mux_q <= in_memdep_phi_pop10323_0;
            WHEN OTHERS => memdep_phi_pop10323_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_memdep_phi_pop10323(GPOUT,49)
    out_memdep_phi_pop10323 <= memdep_phi_pop10323_mux_q;

    -- notexit300322_mux(MUX,39)
    notexit300322_mux_s <= in_valid_in_0;
    notexit300322_mux_combproc: PROCESS (notexit300322_mux_s, in_notexit300322_1, in_notexit300322_0)
    BEGIN
        CASE (notexit300322_mux_s) IS
            WHEN "0" => notexit300322_mux_q <= in_notexit300322_1;
            WHEN "1" => notexit300322_mux_q <= in_notexit300322_0;
            WHEN OTHERS => notexit300322_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_notexit300322(GPOUT,50)
    out_notexit300322 <= notexit300322_mux_q;

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

    -- unnamed_gemm_nn9W0_mux(MUX,57)
    unnamed_gemm_nn9W0_mux_s <= in_valid_in_0;
    unnamed_gemm_nn9W0_mux_combproc: PROCESS (unnamed_gemm_nn9W0_mux_s, in_unnamed_gemm_nn9W0_1, in_unnamed_gemm_nn9W0_0)
    BEGIN
        CASE (unnamed_gemm_nn9W0_mux_s) IS
            WHEN "0" => unnamed_gemm_nn9W0_mux_q <= in_unnamed_gemm_nn9W0_1;
            WHEN "1" => unnamed_gemm_nn9W0_mux_q <= in_unnamed_gemm_nn9W0_0;
            WHEN OTHERS => unnamed_gemm_nn9W0_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_unnamed_gemm_nn9W0(GPOUT,53)
    out_unnamed_gemm_nn9W0 <= unnamed_gemm_nn9W0_mux_q;

    -- out_valid_out(GPOUT,54)
    out_valid_out <= valid_or_q;

END normal;
