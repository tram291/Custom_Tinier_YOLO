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

-- VHDL created from i_sfc_logic_c0_for_end68_loopexit_loopexit_gemm_nn9w_c0_enter463_gemm_nn9w980
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

entity i_sfc_logic_c0_for_end68_loopexit_loopexit_gemm_nn9w_c0_enter463_gemm_nn9w980 is
    port (
        in_c0_eni3462_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni3462_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni3462_2 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni3462_3 : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi1467_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi1467_1 : out std_logic_vector(15 downto 0);  -- float16_m10
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_end68_loopexit_loopexit_gemm_nn9w_c0_enter463_gemm_nn9w980;

architecture normal of i_sfc_logic_c0_for_end68_loopexit_loopexit_gemm_nn9w_c0_enter463_gemm_nn9w980 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_fp_convert_to_half is
        generic (
            ROUNDING_MODE : INTEGER := 0
        );
        port (
            dataa : in std_logic_vector(31 downto 0);
            enable : in std_logic;
            stall_in : in std_logic;
            valid_in : in std_logic;
            result : out std_logic_vector(15 downto 0);
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_shr3_tr_i_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_tr6_i_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal i_tr_i_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_2139095040_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_2147483648_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_8388607_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_8388608_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i64_34359738368_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_dataa : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_enable_bitsignaltemp : std_logic;
    signal i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_stall_in_bitsignaltemp : std_logic;
    signal i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_valid_in_bitsignaltemp : std_logic;
    signal i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_result : STD_LOGIC_VECTOR (15 downto 0);
    signal i_and6_i_gemm_nn9w_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_and6_i_gemm_nn9w_vt_const_34_q : STD_LOGIC_VECTOR (34 downto 0);
    signal i_and6_i_gemm_nn9w_vt_const_63_q : STD_LOGIC_VECTOR (27 downto 0);
    signal i_and6_i_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_and6_i_gemm_nn9w_vt_select_35_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_and_op_i_gemm_nn9w_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_op_i_gemm_nn9w_vt_const_22_q : STD_LOGIC_VECTOR (22 downto 0);
    signal i_and_op_i_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_and_op_i_gemm_nn9w_vt_select_31_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_conv5_i_gemm_nn9w_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv5_i_gemm_nn9w_vt_const_31_q : STD_LOGIC_VECTOR (8 downto 0);
    signal i_conv5_i_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_conv5_i_gemm_nn9w_vt_select_22_b : STD_LOGIC_VECTOR (22 downto 0);
    signal i_or8_i_gemm_nn9w_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_or_i2_gemm_nn9w_vt_const_30_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_or_i2_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_select108_rep_gemm_nn9w_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_select108_rep_gemm_nn9w_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_shl7_i_gemm_nn9w_s : STD_LOGIC_VECTOR (0 downto 0);
    signal i_shl7_i_gemm_nn9w_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shl7_i_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shl7_i_gemm_nn9w_vt_select_31_b : STD_LOGIC_VECTOR (8 downto 0);
    signal i_shl_i1_gemm_nn9w_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shl_i1_gemm_nn9w_vt_const_30_q : STD_LOGIC_VECTOR (30 downto 0);
    signal i_shl_i1_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_shl_i1_gemm_nn9w_vt_select_31_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_shr3_i_gemm_nn9w_vt_const_63_q : STD_LOGIC_VECTOR (2 downto 0);
    signal i_shr3_i_gemm_nn9w_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_shr3_i_gemm_nn9w_vt_select_60_b : STD_LOGIC_VECTOR (60 downto 0);
    signal i_tobool_i_gemm_nn9w_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_tobool_i_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_gemm_nn9w984_vt_const_63_q : STD_LOGIC_VECTOR (4 downto 0);
    signal i_unnamed_gemm_nn9w984_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_unnamed_gemm_nn9w984_vt_select_58_b : STD_LOGIC_VECTOR (58 downto 0);
    signal i_unnamed_gemm_nn9w986_vt_const_63_q : STD_LOGIC_VECTOR (3 downto 0);
    signal i_unnamed_gemm_nn9w986_vt_join_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_unnamed_gemm_nn9w986_vt_select_59_b : STD_LOGIC_VECTOR (59 downto 0);
    signal right_cast_i_tobool_i_gemm_nn9w_gemm_nn9w983_b_const_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage0Idx1Rng2_uid81_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_b : STD_LOGIC_VECTOR (61 downto 0);
    signal rightShiftStage0Idx1Pad2_uid82_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0Idx1_uid83_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage0_uid85_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid85_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage1Idx1Rng1_uid86_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_b : STD_LOGIC_VECTOR (62 downto 0);
    signal rightShiftStage1Idx1_uid88_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage1_uid90_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid90_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage0Idx1Rng4_uid95_i_unnamed_gemm_nn9w985_shift_x_b : STD_LOGIC_VECTOR (59 downto 0);
    signal rightShiftStage0Idx1_uid97_i_unnamed_gemm_nn9w985_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage0_uid99_i_unnamed_gemm_nn9w985_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0_uid99_i_unnamed_gemm_nn9w985_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage1Idx1Rng1_uid100_i_unnamed_gemm_nn9w985_shift_x_b : STD_LOGIC_VECTOR (62 downto 0);
    signal rightShiftStage1Idx1_uid102_i_unnamed_gemm_nn9w985_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal rightShiftStage1_uid104_i_unnamed_gemm_nn9w985_shift_x_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid104_i_unnamed_gemm_nn9w985_shift_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_or_i2_gemm_nn9w_BitSelect_for_a_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_or_i2_gemm_nn9w_BitSelect_for_b_b : STD_LOGIC_VECTOR (22 downto 0);
    signal i_or_i2_gemm_nn9w_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_or_i2_gemm_nn9w_vt_select_22_merged_bit_select_b : STD_LOGIC_VECTOR (22 downto 0);
    signal i_or_i2_gemm_nn9w_vt_select_22_merged_bit_select_c : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_or_i2_gemm_nn9w_vt_select_22_merged_bit_select_b_2_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist1_i_or_i2_gemm_nn9w_vt_select_22_merged_bit_select_c_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_i_and_op_i_gemm_nn9w_vt_select_31_b_2_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist3_i_and6_i_gemm_nn9w_vt_select_35_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sync_in_aunroll_x_in_i_valid_4_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist4_sync_in_aunroll_x_in_i_valid_4(DELAY,125)
    redist4_sync_in_aunroll_x_in_i_valid_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist4_sync_in_aunroll_x_in_i_valid_4_q, clk => clock, aclr => resetn );

    -- c_i32_8388608(CONSTANT,23)
    c_i32_8388608_q <= "11111111100000000000000000000000";

    -- i_unnamed_gemm_nn9w986_vt_const_63(CONSTANT,71)
    i_unnamed_gemm_nn9w986_vt_const_63_q <= "0000";

    -- rightShiftStage0Idx1Rng4_uid95_i_unnamed_gemm_nn9w985_shift_x(BITSELECT,94)@0
    rightShiftStage0Idx1Rng4_uid95_i_unnamed_gemm_nn9w985_shift_x_b <= i_select108_rep_gemm_nn9w_q(63 downto 4);

    -- rightShiftStage0Idx1_uid97_i_unnamed_gemm_nn9w985_shift_x(BITJOIN,96)@0
    rightShiftStage0Idx1_uid97_i_unnamed_gemm_nn9w985_shift_x_q <= i_unnamed_gemm_nn9w986_vt_const_63_q & rightShiftStage0Idx1Rng4_uid95_i_unnamed_gemm_nn9w985_shift_x_b;

    -- i_select108_rep_gemm_nn9w(MUX,52)@0
    i_select108_rep_gemm_nn9w_s <= in_c0_eni3462_1;
    i_select108_rep_gemm_nn9w_combproc: PROCESS (i_select108_rep_gemm_nn9w_s, in_c0_eni3462_3, in_c0_eni3462_2)
    BEGIN
        CASE (i_select108_rep_gemm_nn9w_s) IS
            WHEN "0" => i_select108_rep_gemm_nn9w_q <= in_c0_eni3462_3;
            WHEN "1" => i_select108_rep_gemm_nn9w_q <= in_c0_eni3462_2;
            WHEN OTHERS => i_select108_rep_gemm_nn9w_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage0_uid99_i_unnamed_gemm_nn9w985_shift_x(MUX,98)@0
    rightShiftStage0_uid99_i_unnamed_gemm_nn9w985_shift_x_s <= VCC_q;
    rightShiftStage0_uid99_i_unnamed_gemm_nn9w985_shift_x_combproc: PROCESS (rightShiftStage0_uid99_i_unnamed_gemm_nn9w985_shift_x_s, i_select108_rep_gemm_nn9w_q, rightShiftStage0Idx1_uid97_i_unnamed_gemm_nn9w985_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid99_i_unnamed_gemm_nn9w985_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid99_i_unnamed_gemm_nn9w985_shift_x_q <= i_select108_rep_gemm_nn9w_q;
            WHEN "1" => rightShiftStage0_uid99_i_unnamed_gemm_nn9w985_shift_x_q <= rightShiftStage0Idx1_uid97_i_unnamed_gemm_nn9w985_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid99_i_unnamed_gemm_nn9w985_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_unnamed_gemm_nn9w986_vt_select_59(BITSELECT,73)@0
    i_unnamed_gemm_nn9w986_vt_select_59_b <= rightShiftStage0_uid99_i_unnamed_gemm_nn9w985_shift_x_q(59 downto 0);

    -- i_unnamed_gemm_nn9w986_vt_join(BITJOIN,72)@0
    i_unnamed_gemm_nn9w986_vt_join_q <= i_unnamed_gemm_nn9w986_vt_const_63_q & i_unnamed_gemm_nn9w986_vt_select_59_b;

    -- i_tr6_i_gemm_nn9w_sel_x(BITSELECT,7)@0
    i_tr6_i_gemm_nn9w_sel_x_b <= i_unnamed_gemm_nn9w986_vt_join_q(31 downto 0);

    -- i_and_op_i_gemm_nn9w(LOGICAL,37)@0
    i_and_op_i_gemm_nn9w_q <= i_tr6_i_gemm_nn9w_sel_x_b and c_i32_8388608_q;

    -- i_and_op_i_gemm_nn9w_vt_select_31(BITSELECT,40)@0
    i_and_op_i_gemm_nn9w_vt_select_31_b <= i_and_op_i_gemm_nn9w_q(31 downto 23);

    -- redist2_i_and_op_i_gemm_nn9w_vt_select_31_b_2(DELAY,123)
    redist2_i_and_op_i_gemm_nn9w_vt_select_31_b_2 : dspba_delay
    GENERIC MAP ( width => 9, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_and_op_i_gemm_nn9w_vt_select_31_b, xout => redist2_i_and_op_i_gemm_nn9w_vt_select_31_b_2_q, clk => clock, aclr => resetn );

    -- i_and_op_i_gemm_nn9w_vt_join(BITJOIN,39)@2
    i_and_op_i_gemm_nn9w_vt_join_q <= redist2_i_and_op_i_gemm_nn9w_vt_select_31_b_2_q & i_and_op_i_gemm_nn9w_vt_const_22_q;

    -- c_i32_2139095040(CONSTANT,20)
    c_i32_2139095040_q <= "01111111100000000000000000000000";

    -- right_cast_i_tobool_i_gemm_nn9w_gemm_nn9w983_b_const(CONSTANT,76)
    right_cast_i_tobool_i_gemm_nn9w_gemm_nn9w983_b_const_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- i_and6_i_gemm_nn9w_vt_const_63(CONSTANT,34)
    i_and6_i_gemm_nn9w_vt_const_63_q <= "0000000000000000000000000000";

    -- c_i64_34359738368(CONSTANT,25)
    c_i64_34359738368_q <= "0000000000000000000000000000100000000000000000000000000000000000";

    -- i_and6_i_gemm_nn9w(LOGICAL,32)@0
    i_and6_i_gemm_nn9w_q <= i_select108_rep_gemm_nn9w_q and c_i64_34359738368_q;

    -- i_and6_i_gemm_nn9w_vt_select_35(BITSELECT,36)@0
    i_and6_i_gemm_nn9w_vt_select_35_b <= i_and6_i_gemm_nn9w_q(35 downto 35);

    -- redist3_i_and6_i_gemm_nn9w_vt_select_35_b_1(DELAY,124)
    redist3_i_and6_i_gemm_nn9w_vt_select_35_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_and6_i_gemm_nn9w_vt_select_35_b, xout => redist3_i_and6_i_gemm_nn9w_vt_select_35_b_1_q, clk => clock, aclr => resetn );

    -- i_and6_i_gemm_nn9w_vt_const_34(CONSTANT,33)
    i_and6_i_gemm_nn9w_vt_const_34_q <= "00000000000000000000000000000000000";

    -- i_and6_i_gemm_nn9w_vt_join(BITJOIN,35)@1
    i_and6_i_gemm_nn9w_vt_join_q <= i_and6_i_gemm_nn9w_vt_const_63_q & redist3_i_and6_i_gemm_nn9w_vt_select_35_b_1_q & i_and6_i_gemm_nn9w_vt_const_34_q;

    -- i_tobool_i_gemm_nn9w(LOGICAL,65)@1 + 1
    i_tobool_i_gemm_nn9w_qi <= "1" WHEN i_and6_i_gemm_nn9w_vt_join_q = right_cast_i_tobool_i_gemm_nn9w_gemm_nn9w983_b_const_q ELSE "0";
    i_tobool_i_gemm_nn9w_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_tobool_i_gemm_nn9w_qi, xout => i_tobool_i_gemm_nn9w_q, clk => clock, aclr => resetn );

    -- i_shl7_i_gemm_nn9w(MUX,53)@2
    i_shl7_i_gemm_nn9w_s <= i_tobool_i_gemm_nn9w_q;
    i_shl7_i_gemm_nn9w_combproc: PROCESS (i_shl7_i_gemm_nn9w_s, c_i32_2139095040_q, i_and_op_i_gemm_nn9w_vt_join_q)
    BEGIN
        CASE (i_shl7_i_gemm_nn9w_s) IS
            WHEN "0" => i_shl7_i_gemm_nn9w_q <= c_i32_2139095040_q;
            WHEN "1" => i_shl7_i_gemm_nn9w_q <= i_and_op_i_gemm_nn9w_vt_join_q;
            WHEN OTHERS => i_shl7_i_gemm_nn9w_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_shl7_i_gemm_nn9w_vt_select_31(BITSELECT,56)@2
    i_shl7_i_gemm_nn9w_vt_select_31_b <= i_shl7_i_gemm_nn9w_q(31 downto 23);

    -- i_and_op_i_gemm_nn9w_vt_const_22(CONSTANT,38)
    i_and_op_i_gemm_nn9w_vt_const_22_q <= "00000000000000000000000";

    -- i_shl7_i_gemm_nn9w_vt_join(BITJOIN,55)@2
    i_shl7_i_gemm_nn9w_vt_join_q <= i_shl7_i_gemm_nn9w_vt_select_31_b & i_and_op_i_gemm_nn9w_vt_const_22_q;

    -- c_i32_2147483648(CONSTANT,21)
    c_i32_2147483648_q <= "10000000000000000000000000000000";

    -- i_unnamed_gemm_nn9w984_vt_const_63(CONSTANT,68)
    i_unnamed_gemm_nn9w984_vt_const_63_q <= "00000";

    -- rightShiftStage1Idx1Rng1_uid100_i_unnamed_gemm_nn9w985_shift_x(BITSELECT,99)@0
    rightShiftStage1Idx1Rng1_uid100_i_unnamed_gemm_nn9w985_shift_x_b <= rightShiftStage0_uid99_i_unnamed_gemm_nn9w985_shift_x_q(63 downto 1);

    -- rightShiftStage1Idx1_uid102_i_unnamed_gemm_nn9w985_shift_x(BITJOIN,101)@0
    rightShiftStage1Idx1_uid102_i_unnamed_gemm_nn9w985_shift_x_q <= GND_q & rightShiftStage1Idx1Rng1_uid100_i_unnamed_gemm_nn9w985_shift_x_b;

    -- rightShiftStage1_uid104_i_unnamed_gemm_nn9w985_shift_x(MUX,103)@0
    rightShiftStage1_uid104_i_unnamed_gemm_nn9w985_shift_x_s <= VCC_q;
    rightShiftStage1_uid104_i_unnamed_gemm_nn9w985_shift_x_combproc: PROCESS (rightShiftStage1_uid104_i_unnamed_gemm_nn9w985_shift_x_s, rightShiftStage0_uid99_i_unnamed_gemm_nn9w985_shift_x_q, rightShiftStage1Idx1_uid102_i_unnamed_gemm_nn9w985_shift_x_q)
    BEGIN
        CASE (rightShiftStage1_uid104_i_unnamed_gemm_nn9w985_shift_x_s) IS
            WHEN "0" => rightShiftStage1_uid104_i_unnamed_gemm_nn9w985_shift_x_q <= rightShiftStage0_uid99_i_unnamed_gemm_nn9w985_shift_x_q;
            WHEN "1" => rightShiftStage1_uid104_i_unnamed_gemm_nn9w985_shift_x_q <= rightShiftStage1Idx1_uid102_i_unnamed_gemm_nn9w985_shift_x_q;
            WHEN OTHERS => rightShiftStage1_uid104_i_unnamed_gemm_nn9w985_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_unnamed_gemm_nn9w984_vt_select_58(BITSELECT,70)@0
    i_unnamed_gemm_nn9w984_vt_select_58_b <= rightShiftStage1_uid104_i_unnamed_gemm_nn9w985_shift_x_q(58 downto 0);

    -- i_unnamed_gemm_nn9w984_vt_join(BITJOIN,69)@0
    i_unnamed_gemm_nn9w984_vt_join_q <= i_unnamed_gemm_nn9w984_vt_const_63_q & i_unnamed_gemm_nn9w984_vt_select_58_b;

    -- i_tr_i_gemm_nn9w_sel_x(BITSELECT,8)@0
    i_tr_i_gemm_nn9w_sel_x_b <= i_unnamed_gemm_nn9w984_vt_join_q(31 downto 0);

    -- i_shl_i1_gemm_nn9w(LOGICAL,57)@0
    i_shl_i1_gemm_nn9w_q <= i_tr_i_gemm_nn9w_sel_x_b and c_i32_2147483648_q;

    -- i_shl_i1_gemm_nn9w_vt_select_31(BITSELECT,60)@0
    i_shl_i1_gemm_nn9w_vt_select_31_b <= i_shl_i1_gemm_nn9w_q(31 downto 31);

    -- i_shl_i1_gemm_nn9w_vt_const_30(CONSTANT,58)
    i_shl_i1_gemm_nn9w_vt_const_30_q <= "0000000000000000000000000000000";

    -- i_shl_i1_gemm_nn9w_vt_join(BITJOIN,59)@0
    i_shl_i1_gemm_nn9w_vt_join_q <= i_shl_i1_gemm_nn9w_vt_select_31_b & i_shl_i1_gemm_nn9w_vt_const_30_q;

    -- i_or_i2_gemm_nn9w_BitSelect_for_a(BITSELECT,114)@0
    i_or_i2_gemm_nn9w_BitSelect_for_a_b <= i_shl_i1_gemm_nn9w_vt_join_q(31 downto 31);

    -- i_conv5_i_gemm_nn9w_vt_const_31(CONSTANT,43)
    i_conv5_i_gemm_nn9w_vt_const_31_q <= "000000000";

    -- c_i32_8388607(CONSTANT,22)
    c_i32_8388607_q <= "00000000011111111111111111111111";

    -- i_shr3_i_gemm_nn9w_vt_const_63(CONSTANT,61)
    i_shr3_i_gemm_nn9w_vt_const_63_q <= "000";

    -- rightShiftStage1Idx1Rng1_uid86_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x(BITSELECT,85)@0
    rightShiftStage1Idx1Rng1_uid86_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_b <= rightShiftStage0_uid85_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q(63 downto 1);

    -- rightShiftStage1Idx1_uid88_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x(BITJOIN,87)@0
    rightShiftStage1Idx1_uid88_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q <= GND_q & rightShiftStage1Idx1Rng1_uid86_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_b;

    -- rightShiftStage0Idx1Pad2_uid82_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x(CONSTANT,81)
    rightShiftStage0Idx1Pad2_uid82_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q <= "00";

    -- rightShiftStage0Idx1Rng2_uid81_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x(BITSELECT,80)@0
    rightShiftStage0Idx1Rng2_uid81_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_b <= i_select108_rep_gemm_nn9w_q(63 downto 2);

    -- rightShiftStage0Idx1_uid83_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x(BITJOIN,82)@0
    rightShiftStage0Idx1_uid83_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q <= rightShiftStage0Idx1Pad2_uid82_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q & rightShiftStage0Idx1Rng2_uid81_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_b;

    -- rightShiftStage0_uid85_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x(MUX,84)@0
    rightShiftStage0_uid85_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_s <= VCC_q;
    rightShiftStage0_uid85_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_combproc: PROCESS (rightShiftStage0_uid85_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_s, i_select108_rep_gemm_nn9w_q, rightShiftStage0Idx1_uid83_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q)
    BEGIN
        CASE (rightShiftStage0_uid85_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_s) IS
            WHEN "0" => rightShiftStage0_uid85_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q <= i_select108_rep_gemm_nn9w_q;
            WHEN "1" => rightShiftStage0_uid85_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q <= rightShiftStage0Idx1_uid83_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q;
            WHEN OTHERS => rightShiftStage0_uid85_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid90_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x(MUX,89)@0
    rightShiftStage1_uid90_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_s <= VCC_q;
    rightShiftStage1_uid90_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_combproc: PROCESS (rightShiftStage1_uid90_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_s, rightShiftStage0_uid85_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q, rightShiftStage1Idx1_uid88_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q)
    BEGIN
        CASE (rightShiftStage1_uid90_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_s) IS
            WHEN "0" => rightShiftStage1_uid90_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q <= rightShiftStage0_uid85_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q;
            WHEN "1" => rightShiftStage1_uid90_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q <= rightShiftStage1Idx1_uid88_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q;
            WHEN OTHERS => rightShiftStage1_uid90_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- i_shr3_i_gemm_nn9w_vt_select_60(BITSELECT,63)@0
    i_shr3_i_gemm_nn9w_vt_select_60_b <= rightShiftStage1_uid90_i_shr3_i_gemm_nn9w_gemm_nn9w982_shift_x_q(60 downto 0);

    -- i_shr3_i_gemm_nn9w_vt_join(BITJOIN,62)@0
    i_shr3_i_gemm_nn9w_vt_join_q <= i_shr3_i_gemm_nn9w_vt_const_63_q & i_shr3_i_gemm_nn9w_vt_select_60_b;

    -- i_shr3_tr_i_gemm_nn9w_sel_x(BITSELECT,6)@0
    i_shr3_tr_i_gemm_nn9w_sel_x_b <= i_shr3_i_gemm_nn9w_vt_join_q(31 downto 0);

    -- i_conv5_i_gemm_nn9w(LOGICAL,42)@0
    i_conv5_i_gemm_nn9w_q <= i_shr3_tr_i_gemm_nn9w_sel_x_b and c_i32_8388607_q;

    -- i_conv5_i_gemm_nn9w_vt_select_22(BITSELECT,45)@0
    i_conv5_i_gemm_nn9w_vt_select_22_b <= i_conv5_i_gemm_nn9w_q(22 downto 0);

    -- i_conv5_i_gemm_nn9w_vt_join(BITJOIN,44)@0
    i_conv5_i_gemm_nn9w_vt_join_q <= i_conv5_i_gemm_nn9w_vt_const_31_q & i_conv5_i_gemm_nn9w_vt_select_22_b;

    -- i_or_i2_gemm_nn9w_BitSelect_for_b(BITSELECT,115)@0
    i_or_i2_gemm_nn9w_BitSelect_for_b_b <= i_conv5_i_gemm_nn9w_vt_join_q(22 downto 0);

    -- i_or_i2_gemm_nn9w_join(BITJOIN,116)@0
    i_or_i2_gemm_nn9w_join_q <= i_or_i2_gemm_nn9w_BitSelect_for_a_b & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & GND_q & i_or_i2_gemm_nn9w_BitSelect_for_b_b;

    -- i_or_i2_gemm_nn9w_vt_select_22_merged_bit_select(BITSELECT,120)@0
    i_or_i2_gemm_nn9w_vt_select_22_merged_bit_select_b <= i_or_i2_gemm_nn9w_join_q(22 downto 0);
    i_or_i2_gemm_nn9w_vt_select_22_merged_bit_select_c <= i_or_i2_gemm_nn9w_join_q(31 downto 31);

    -- redist1_i_or_i2_gemm_nn9w_vt_select_22_merged_bit_select_c_2(DELAY,122)
    redist1_i_or_i2_gemm_nn9w_vt_select_22_merged_bit_select_c_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_i2_gemm_nn9w_vt_select_22_merged_bit_select_c, xout => redist1_i_or_i2_gemm_nn9w_vt_select_22_merged_bit_select_c_2_q, clk => clock, aclr => resetn );

    -- i_or_i2_gemm_nn9w_vt_const_30(CONSTANT,48)
    i_or_i2_gemm_nn9w_vt_const_30_q <= "00000000";

    -- redist0_i_or_i2_gemm_nn9w_vt_select_22_merged_bit_select_b_2(DELAY,121)
    redist0_i_or_i2_gemm_nn9w_vt_select_22_merged_bit_select_b_2 : dspba_delay
    GENERIC MAP ( width => 23, depth => 2, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_or_i2_gemm_nn9w_vt_select_22_merged_bit_select_b, xout => redist0_i_or_i2_gemm_nn9w_vt_select_22_merged_bit_select_b_2_q, clk => clock, aclr => resetn );

    -- i_or_i2_gemm_nn9w_vt_join(BITJOIN,49)@2
    i_or_i2_gemm_nn9w_vt_join_q <= redist1_i_or_i2_gemm_nn9w_vt_select_22_merged_bit_select_c_2_q & i_or_i2_gemm_nn9w_vt_const_30_q & redist0_i_or_i2_gemm_nn9w_vt_select_22_merged_bit_select_b_2_q;

    -- i_or8_i_gemm_nn9w(LOGICAL,46)@2
    i_or8_i_gemm_nn9w_q <= i_or_i2_gemm_nn9w_vt_join_q or i_shl7_i_gemm_nn9w_vt_join_q;

    -- i_acl_convert_fptohalf_conv69_fh_gemm_nn9w(EXTIFACE,31)@2 + 2
    i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_dataa <= i_or8_i_gemm_nn9w_q;
    i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_enable <= VCC_q;
    i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_stall_in <= GND_q;
    i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_valid_in <= VCC_q;
    i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_enable_bitsignaltemp <= i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_enable(0);
    i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_stall_in_bitsignaltemp <= i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_stall_in(0);
    i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_valid_in_bitsignaltemp <= i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_valid_in(0);
    thei_acl_convert_fptohalf_conv69_fh_gemm_nn9w : acl_fp_convert_to_half
    GENERIC MAP (
        ROUNDING_MODE => 0
    )
    PORT MAP (
        dataa => i_or8_i_gemm_nn9w_q,
        enable => i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_enable_bitsignaltemp,
        stall_in => i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_stall_in_bitsignaltemp,
        valid_in => i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_valid_in_bitsignaltemp,
        result => i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_result,
        clock => clock,
        resetn => resetn
    );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,18)@4
    out_c0_exi1467_0 <= GND_q;
    out_c0_exi1467_1 <= i_acl_convert_fptohalf_conv69_fh_gemm_nn9w_result;
    out_o_valid <= redist4_sync_in_aunroll_x_in_i_valid_4_q;

END normal;
