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

-- VHDL created from bb_gemm_nnfW_B7_stall_region
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

entity bb_gemm_nnfW_B7_stall_region is
    port (
        in_c0_exe71514 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe81526 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe11719 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_511 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe71514 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_out_10 : out std_logic_vector(7 downto 0);  -- ufix8
        out_feedback_out_11 : out std_logic_vector(7 downto 0);  -- ufix8
        in_feedback_stall_in_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_feedback_stall_in_11 : in std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_feedback_valid_out_11 : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nnfW_B7_stall_region;

architecture normal of bb_gemm_nnfW_B7_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_push_i1_memdep_phi6_push11_gemm_nnfw1318 is
        port (
            in_c0_exe81526 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_11 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_memdep_phi_push10_gemm_nnfw1320 is
        port (
            in_c0_exe81526 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_10 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal i_acl_push_i1_memdep_phi6_push11_gemm_nnfw_out_feedback_out_11 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_memdep_phi6_push11_gemm_nnfw_out_feedback_valid_out_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi6_push11_gemm_nnfw_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi6_push11_gemm_nnfw_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi_push10_gemm_nnfw_out_feedback_out_10 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_memdep_phi_push10_gemm_nnfw_out_feedback_valid_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi_push10_gemm_nnfw_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_memdep_phi_push10_gemm_nnfw_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_stall_entry_o4_1_0_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (3 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_c : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_d : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_stall_entry_e : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nnfw_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nnfw_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nnfw_and1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nnfw_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nnfw_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_1_0_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_1_0_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_1_0_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_1_0_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_1_0_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_redist0_stall_entry_o4_1_0_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,35)
    SE_stall_entry_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_stall_entry_fromReg0 <= (others => '0');
            SE_stall_entry_fromReg1 <= (others => '0');
            SE_stall_entry_fromReg2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_stall_entry_fromReg0 <= SE_stall_entry_toReg0;
            -- Succesor 1
            SE_stall_entry_fromReg1 <= SE_stall_entry_toReg1;
            -- Succesor 2
            SE_stall_entry_fromReg2 <= SE_stall_entry_toReg2;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_stall_entry_consumed0 <= (not (SE_redist0_stall_entry_o4_1_0_backStall) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg0;
    SE_stall_entry_consumed1 <= (not (i_acl_push_i1_memdep_phi6_push11_gemm_nnfw_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg1;
    SE_stall_entry_consumed2 <= (not (i_acl_push_i1_memdep_phi_push10_gemm_nnfw_out_stall_out) and SE_stall_entry_wireValid) or SE_stall_entry_fromReg2;
    -- Consuming
    SE_stall_entry_StallValid <= SE_stall_entry_backStall and SE_stall_entry_wireValid;
    SE_stall_entry_toReg0 <= SE_stall_entry_StallValid and SE_stall_entry_consumed0;
    SE_stall_entry_toReg1 <= SE_stall_entry_StallValid and SE_stall_entry_consumed1;
    SE_stall_entry_toReg2 <= SE_stall_entry_StallValid and SE_stall_entry_consumed2;
    -- Backward Stall generation
    SE_stall_entry_or0 <= SE_stall_entry_consumed0;
    SE_stall_entry_or1 <= SE_stall_entry_consumed1 and SE_stall_entry_or0;
    SE_stall_entry_wireStall <= not (SE_stall_entry_consumed2 and SE_stall_entry_or1);
    SE_stall_entry_backStall <= SE_stall_entry_wireStall;
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg0);
    SE_stall_entry_V1 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg1);
    SE_stall_entry_V2 <= SE_stall_entry_wireValid and not (SE_stall_entry_fromReg2);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- SE_redist0_stall_entry_o4_1_0(STALLENABLE,37)
    -- Valid signal propagation
    SE_redist0_stall_entry_o4_1_0_V0 <= SE_redist0_stall_entry_o4_1_0_R_v_0;
    -- Stall signal propagation
    SE_redist0_stall_entry_o4_1_0_s_tv_0 <= SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nnfw_backStall and SE_redist0_stall_entry_o4_1_0_R_v_0;
    -- Backward Enable generation
    SE_redist0_stall_entry_o4_1_0_backEN <= not (SE_redist0_stall_entry_o4_1_0_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_redist0_stall_entry_o4_1_0_v_s_0 <= SE_redist0_stall_entry_o4_1_0_backEN and SE_stall_entry_V0;
    -- Backward Stall generation
    SE_redist0_stall_entry_o4_1_0_backStall <= not (SE_redist0_stall_entry_o4_1_0_v_s_0);
    SE_redist0_stall_entry_o4_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_redist0_stall_entry_o4_1_0_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_1_0_backEN = "0") THEN
                SE_redist0_stall_entry_o4_1_0_R_v_0 <= SE_redist0_stall_entry_o4_1_0_R_v_0 and SE_redist0_stall_entry_o4_1_0_s_tv_0;
            ELSE
                SE_redist0_stall_entry_o4_1_0_R_v_0 <= SE_redist0_stall_entry_o4_1_0_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- bubble_join_stall_entry(BITJOIN,27)
    bubble_join_stall_entry_q <= in_memdep_511 & in_c1_exe11719 & in_c0_exe81526 & in_c0_exe71514;

    -- bubble_select_stall_entry(BITSELECT,28)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(0 downto 0));
    bubble_select_stall_entry_c <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(1 downto 1));
    bubble_select_stall_entry_d <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(2 downto 2));
    bubble_select_stall_entry_e <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(3 downto 3));

    -- i_acl_push_i1_memdep_phi6_push11_gemm_nnfw(BLACKBOX,14)@0
    -- in in_stall_in@20000000
    -- out out_data_out@1
    -- out out_feedback_out_11@20000000
    -- out out_feedback_valid_out_11@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thei_acl_push_i1_memdep_phi6_push11_gemm_nnfw : i_acl_push_i1_memdep_phi6_push11_gemm_nnfw1318
    PORT MAP (
        in_c0_exe81526 => bubble_select_stall_entry_c,
        in_data_in => bubble_select_stall_entry_e,
        in_feedback_stall_in_11 => in_feedback_stall_in_11,
        in_stall_in => SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nnfw_backStall,
        in_valid_in => SE_stall_entry_V1,
        out_feedback_out_11 => i_acl_push_i1_memdep_phi6_push11_gemm_nnfw_out_feedback_out_11,
        out_feedback_valid_out_11 => i_acl_push_i1_memdep_phi6_push11_gemm_nnfw_out_feedback_valid_out_11,
        out_stall_out => i_acl_push_i1_memdep_phi6_push11_gemm_nnfw_out_stall_out,
        out_valid_out => i_acl_push_i1_memdep_phi6_push11_gemm_nnfw_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_push_i1_memdep_phi_push10_gemm_nnfw(BLACKBOX,15)@0
    -- in in_stall_in@20000000
    -- out out_data_out@1
    -- out out_feedback_out_10@20000000
    -- out out_feedback_valid_out_10@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thei_acl_push_i1_memdep_phi_push10_gemm_nnfw : i_acl_push_i1_memdep_phi_push10_gemm_nnfw1320
    PORT MAP (
        in_c0_exe81526 => bubble_select_stall_entry_c,
        in_data_in => bubble_select_stall_entry_d,
        in_feedback_stall_in_10 => in_feedback_stall_in_10,
        in_stall_in => SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nnfw_backStall,
        in_valid_in => SE_stall_entry_V2,
        out_feedback_out_10 => i_acl_push_i1_memdep_phi_push10_gemm_nnfw_out_feedback_out_10,
        out_feedback_valid_out_10 => i_acl_push_i1_memdep_phi_push10_gemm_nnfw_out_feedback_valid_out_10,
        out_stall_out => i_acl_push_i1_memdep_phi_push10_gemm_nnfw_out_stall_out,
        out_valid_out => i_acl_push_i1_memdep_phi_push10_gemm_nnfw_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nnfw(STALLENABLE,34)
    -- Valid signal propagation
    SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nnfw_V0 <= SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nnfw_wireValid;
    -- Backward Stall generation
    SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nnfw_backStall <= in_stall_in or not (SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nnfw_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nnfw_and0 <= i_acl_push_i1_memdep_phi_push10_gemm_nnfw_out_valid_out;
    SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nnfw_and1 <= i_acl_push_i1_memdep_phi6_push11_gemm_nnfw_out_valid_out and SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nnfw_and0;
    SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nnfw_wireValid <= SE_redist0_stall_entry_o4_1_0_V0 and SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nnfw_and1;

    -- redist0_stall_entry_o4_1_0(REG,23)
    redist0_stall_entry_o4_1_0_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_stall_entry_o4_1_0_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_redist0_stall_entry_o4_1_0_backEN = "1") THEN
                redist0_stall_entry_o4_1_0_q <= STD_LOGIC_VECTOR(bubble_select_stall_entry_b);
            END IF;
        END IF;
    END PROCESS;

    -- dupName_0_sync_out_x(GPOUT,5)@1
    out_c0_exe71514 <= redist0_stall_entry_o4_1_0_q;
    out_valid_out <= SE_out_i_acl_push_i1_memdep_phi_push10_gemm_nnfw_V0;

    -- feedback_out_10_sync(GPOUT,8)
    out_feedback_out_10 <= i_acl_push_i1_memdep_phi_push10_gemm_nnfw_out_feedback_out_10;

    -- feedback_out_11_sync(GPOUT,9)
    out_feedback_out_11 <= i_acl_push_i1_memdep_phi6_push11_gemm_nnfw_out_feedback_out_11;

    -- feedback_valid_out_10_sync(GPOUT,12)
    out_feedback_valid_out_10 <= i_acl_push_i1_memdep_phi_push10_gemm_nnfw_out_feedback_valid_out_10;

    -- feedback_valid_out_11_sync(GPOUT,13)
    out_feedback_valid_out_11 <= i_acl_push_i1_memdep_phi6_push11_gemm_nnfw_out_feedback_valid_out_11;

    -- sync_out(GPOUT,21)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
