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

-- VHDL created from i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1326_data_fifo
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

entity i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1326_data_fifo is
    port (
        in_data_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_3 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_4 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_8 : in std_logic_vector(31 downto 0);  -- ufix32
        in_data_in_9 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_11 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_12 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_2 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_3 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_4 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_8 : out std_logic_vector(31 downto 0);  -- ufix32
        out_data_out_9 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1326_data_fifo;

architecture normal of i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1326_data_fifo is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_data_fifo is
        generic (
            DEPTH : INTEGER;
            ALLOW_FULL_WRITE : INTEGER := 1;
            DATA_WIDTH : INTEGER := 320;
            IMPL : STRING := "ram"
        );
        port (
            data_in : in std_logic_vector(319 downto 0);
            stall_in : in std_logic;
            valid_in : in std_logic;
            data_out : out std_logic_vector(319 downto 0);
            stall_out : out std_logic;
            valid_out : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal dupName_0_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_0_c_i7_0gr_x_q : STD_LOGIC_VECTOR (6 downto 0);
    signal dupName_0_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_1_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_1_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_1_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_1_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_2_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_2_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_2_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_2_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_2_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_3_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_3_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_3_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_3_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_3_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_4_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_4_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_4_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_4_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_5_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_5_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_5_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_5_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_6_adapt_scalar_trunc_x_in : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_6_adapt_scalar_trunc_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_6_element_extension_x_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dupName_6_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_7_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_8_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_9_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_10_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal dupName_11_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal adapt_scalar_trunc_in : STD_LOGIC_VECTOR (0 downto 0);
    signal adapt_scalar_trunc_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i24_0gr_q : STD_LOGIC_VECTOR (23 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i8_0gr_q : STD_LOGIC_VECTOR (7 downto 0);
    signal dsdk_ip_adapt_bitjoin_q : STD_LOGIC_VECTOR (319 downto 0);
    signal element_extension_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_data_in : STD_LOGIC_VECTOR (319 downto 0);
    signal i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_stall_in_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_valid_in_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_data_out : STD_LOGIC_VECTOR (319 downto 0);
    signal i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_stall_out_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_valid_out_bitsignaltemp : std_logic;
    signal ip_dsdk_adapt_bitselect_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- c_i32_0gr(CONSTANT,43)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- dupName_0_c_i7_0gr_x(CONSTANT,5)
    dupName_0_c_i7_0gr_x_q <= "0000000";

    -- dupName_6_element_extension_x(BITJOIN,34)
    dupName_6_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_12;

    -- dupName_5_element_extension_x(BITJOIN,30)
    dupName_5_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_11;

    -- dupName_4_element_extension_x(BITJOIN,26)
    dupName_4_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_10;

    -- dupName_3_element_extension_x(BITJOIN,21)
    dupName_3_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_9;

    -- c_i8_0gr(CONSTANT,45)
    c_i8_0gr_q <= "00000000";

    -- dupName_2_element_extension_x(BITJOIN,16)
    dupName_2_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_7;

    -- dupName_1_element_extension_x(BITJOIN,11)
    dupName_1_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_6;

    -- dupName_0_element_extension_x(BITJOIN,6)
    dupName_0_element_extension_x_q <= dupName_0_c_i7_0gr_x_q & in_data_in_5;

    -- c_i24_0gr(CONSTANT,42)
    c_i24_0gr_q <= "000000000000000000000000";

    -- element_extension(BITJOIN,47)
    element_extension_q <= dupName_0_c_i7_0gr_x_q & in_data_in_0;

    -- dsdk_ip_adapt_bitjoin(BITJOIN,46)
    dsdk_ip_adapt_bitjoin_q <= c_i32_0gr_q & dupName_6_element_extension_x_q & dupName_5_element_extension_x_q & dupName_4_element_extension_x_q & dupName_3_element_extension_x_q & in_data_in_8 & c_i8_0gr_q & dupName_2_element_extension_x_q & dupName_1_element_extension_x_q & dupName_0_element_extension_x_q & in_data_in_4 & in_data_in_3 & in_data_in_2 & in_data_in_1 & c_i24_0gr_q & element_extension_q;

    -- i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327(EXTIFACE,48)
    i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_data_in <= dsdk_ip_adapt_bitjoin_q;
    i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_stall_in <= in_stall_in;
    i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_valid_in <= in_valid_in;
    i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_stall_in_bitsignaltemp <= i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_stall_in(0);
    i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_valid_in_bitsignaltemp <= i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_valid_in(0);
    i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_stall_out(0) <= i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_stall_out_bitsignaltemp;
    i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_valid_out(0) <= i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_valid_out_bitsignaltemp;
    thei_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327 : acl_data_fifo
    GENERIC MAP (
        DEPTH => 16,
        ALLOW_FULL_WRITE => 1,
        DATA_WIDTH => 320,
        IMPL => "ram"
    )
    PORT MAP (
        data_in => dsdk_ip_adapt_bitjoin_q,
        stall_in => i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_stall_in_bitsignaltemp,
        valid_in => i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_valid_in_bitsignaltemp,
        data_out => i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_data_out,
        stall_out => i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_stall_out_bitsignaltemp,
        valid_out => i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_valid_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- dupName_11_ip_dsdk_adapt_bitselect_x(BITSELECT,40)
    dupName_11_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_data_out(280 downto 280);

    -- dupName_6_adapt_scalar_trunc_x(ROUND,32)
    dupName_6_adapt_scalar_trunc_x_in <= dupName_11_ip_dsdk_adapt_bitselect_x_b;
    dupName_6_adapt_scalar_trunc_x_q <= dupName_6_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_10_ip_dsdk_adapt_bitselect_x(BITSELECT,39)
    dupName_10_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_data_out(272 downto 272);

    -- dupName_5_adapt_scalar_trunc_x(ROUND,28)
    dupName_5_adapt_scalar_trunc_x_in <= dupName_10_ip_dsdk_adapt_bitselect_x_b;
    dupName_5_adapt_scalar_trunc_x_q <= dupName_5_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_9_ip_dsdk_adapt_bitselect_x(BITSELECT,38)
    dupName_9_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_data_out(264 downto 264);

    -- dupName_4_adapt_scalar_trunc_x(ROUND,24)
    dupName_4_adapt_scalar_trunc_x_in <= dupName_9_ip_dsdk_adapt_bitselect_x_b;
    dupName_4_adapt_scalar_trunc_x_q <= dupName_4_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_8_ip_dsdk_adapt_bitselect_x(BITSELECT,37)
    dupName_8_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_data_out(256 downto 256);

    -- dupName_3_adapt_scalar_trunc_x(ROUND,19)
    dupName_3_adapt_scalar_trunc_x_in <= dupName_8_ip_dsdk_adapt_bitselect_x_b;
    dupName_3_adapt_scalar_trunc_x_q <= dupName_3_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_7_ip_dsdk_adapt_bitselect_x(BITSELECT,36)
    dupName_7_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_data_out(255 downto 224);

    -- dupName_3_ip_dsdk_adapt_cast_x(BITSELECT,23)
    dupName_3_ip_dsdk_adapt_cast_x_b <= dupName_7_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_6_ip_dsdk_adapt_bitselect_x(BITSELECT,35)
    dupName_6_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_data_out(208 downto 208);

    -- dupName_2_adapt_scalar_trunc_x(ROUND,14)
    dupName_2_adapt_scalar_trunc_x_in <= dupName_6_ip_dsdk_adapt_bitselect_x_b;
    dupName_2_adapt_scalar_trunc_x_q <= dupName_2_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_5_ip_dsdk_adapt_bitselect_x(BITSELECT,31)
    dupName_5_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_data_out(200 downto 200);

    -- dupName_1_adapt_scalar_trunc_x(ROUND,9)
    dupName_1_adapt_scalar_trunc_x_in <= dupName_5_ip_dsdk_adapt_bitselect_x_b;
    dupName_1_adapt_scalar_trunc_x_q <= dupName_1_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_4_ip_dsdk_adapt_bitselect_x(BITSELECT,27)
    dupName_4_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_data_out(192 downto 192);

    -- dupName_0_adapt_scalar_trunc_x(ROUND,4)
    dupName_0_adapt_scalar_trunc_x_in <= dupName_4_ip_dsdk_adapt_bitselect_x_b;
    dupName_0_adapt_scalar_trunc_x_q <= dupName_0_adapt_scalar_trunc_x_in(0 downto 0);

    -- dupName_3_ip_dsdk_adapt_bitselect_x(BITSELECT,22)
    dupName_3_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_data_out(191 downto 128);

    -- dupName_2_ip_dsdk_adapt_cast_x(BITSELECT,18)
    dupName_2_ip_dsdk_adapt_cast_x_b <= dupName_3_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_2_ip_dsdk_adapt_bitselect_x(BITSELECT,17)
    dupName_2_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_data_out(127 downto 96);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,13)
    dupName_1_ip_dsdk_adapt_cast_x_b <= dupName_2_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_1_ip_dsdk_adapt_bitselect_x(BITSELECT,12)
    dupName_1_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_data_out(95 downto 64);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,8)
    dupName_0_ip_dsdk_adapt_cast_x_b <= dupName_1_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_0_ip_dsdk_adapt_bitselect_x(BITSELECT,7)
    dupName_0_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_data_out(63 downto 32);

    -- ip_dsdk_adapt_cast(BITSELECT,50)
    ip_dsdk_adapt_cast_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- ip_dsdk_adapt_bitselect(BITSELECT,49)
    ip_dsdk_adapt_bitselect_b <= i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_data_out(0 downto 0);

    -- adapt_scalar_trunc(ROUND,41)
    adapt_scalar_trunc_in <= ip_dsdk_adapt_bitselect_b;
    adapt_scalar_trunc_q <= adapt_scalar_trunc_in(0 downto 0);

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@20000003
    out_data_out_0 <= adapt_scalar_trunc_q;
    out_data_out_1 <= ip_dsdk_adapt_cast_b;
    out_data_out_2 <= dupName_0_ip_dsdk_adapt_cast_x_b;
    out_data_out_3 <= dupName_1_ip_dsdk_adapt_cast_x_b;
    out_data_out_4 <= dupName_2_ip_dsdk_adapt_cast_x_b;
    out_data_out_5 <= dupName_0_adapt_scalar_trunc_x_q;
    out_data_out_6 <= dupName_1_adapt_scalar_trunc_x_q;
    out_data_out_7 <= dupName_2_adapt_scalar_trunc_x_q;
    out_data_out_8 <= dupName_3_ip_dsdk_adapt_cast_x_b;
    out_data_out_9 <= dupName_3_adapt_scalar_trunc_x_q;
    out_data_out_10 <= dupName_4_adapt_scalar_trunc_x_q;
    out_data_out_11 <= dupName_5_adapt_scalar_trunc_x_q;
    out_data_out_12 <= dupName_6_adapt_scalar_trunc_x_q;
    out_valid_out <= i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_valid_out;

    -- sync_out(GPOUT,52)@20000000
    out_stall_out <= i_acl_sfc_exit_c0_for_body4_gemm_nnfw_c0_exit62_gemm_nnfw1327_stall_out;

END normal;
