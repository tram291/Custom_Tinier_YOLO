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

-- VHDL created from i_sfc_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w
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

entity i_sfc_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w is
    port (
        in_c0_eni9_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni9_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni9_2 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni9_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni9_4 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni9_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni9_6 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni9_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni9_8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni9_9 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit378_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit378_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit378_2 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exit378_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit378_4 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit378_5 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exit378_6 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit378_7 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit378_8 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit378_9 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit378_10 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit378_11 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit378_12 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exit378_13 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        in_M : in std_logic_vector(31 downto 0);  -- ufix32
        out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_C : in std_logic_vector(63 downto 0);  -- ufix64
        out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_i_stall : in std_logic_vector(0 downto 0);  -- ufix1
        out_o_stall : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w;

architecture normal of i_sfc_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w207 is
        port (
            in_data_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_data_in_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_5 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_data_in_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_12 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_data_in_13 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_accepted : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_data_out_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_data_out_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_entry : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154 is
        port (
            in_c0_eni9_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni9_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni9_2 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni9_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni9_4 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_eni9_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni9_6 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni9_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni9_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni9_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_C : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_M : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi13377_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi13377_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi13377_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exi13377_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi13377_4 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi13377_5 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exi13377_6 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi13377_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi13377_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi13377_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi13377_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi13377_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi13377_12 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exi13377_13 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_stall_entry : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_6 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_12 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_13 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal input_accepted_and_q : STD_LOGIC_VECTOR (0 downto 0);
    signal not_stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- not_stall_out(LOGICAL,9)
    not_stall_out_q <= not (i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_stall_entry);

    -- input_accepted_and(LOGICAL,8)
    input_accepted_and_q <= in_i_valid and not_stall_out_q;

    -- i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x(BLACKBOX,7)@1
    -- out out_c0_exi13377_0@4
    -- out out_c0_exi13377_1@4
    -- out out_c0_exi13377_2@4
    -- out out_c0_exi13377_3@4
    -- out out_c0_exi13377_4@4
    -- out out_c0_exi13377_5@4
    -- out out_c0_exi13377_6@4
    -- out out_c0_exi13377_7@4
    -- out out_c0_exi13377_8@4
    -- out out_c0_exi13377_9@4
    -- out out_c0_exi13377_10@4
    -- out out_c0_exi13377_11@4
    -- out out_c0_exi13377_12@4
    -- out out_c0_exi13377_13@4
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_stall_out@20000000
    -- out out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_valid_out@20000000
    -- out out_o_valid@4
    -- out out_pipeline_valid_out@20000000
    thei_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x : i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154
    PORT MAP (
        in_c0_eni9_0 => in_c0_eni9_0,
        in_c0_eni9_1 => in_c0_eni9_1,
        in_c0_eni9_2 => in_c0_eni9_2,
        in_c0_eni9_3 => in_c0_eni9_3,
        in_c0_eni9_4 => in_c0_eni9_4,
        in_c0_eni9_5 => in_c0_eni9_5,
        in_c0_eni9_6 => in_c0_eni9_6,
        in_c0_eni9_7 => in_c0_eni9_7,
        in_c0_eni9_8 => in_c0_eni9_8,
        in_c0_eni9_9 => in_c0_eni9_9,
        in_C => in_C,
        in_M => in_M,
        in_i_valid => input_accepted_and_q,
        in_pipeline_stall_in => in_pipeline_stall_in,
        out_c0_exi13377_0 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_0,
        out_c0_exi13377_1 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_1,
        out_c0_exi13377_2 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_2,
        out_c0_exi13377_3 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_3,
        out_c0_exi13377_4 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_4,
        out_c0_exi13377_5 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_5,
        out_c0_exi13377_6 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_6,
        out_c0_exi13377_7 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_7,
        out_c0_exi13377_8 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_8,
        out_c0_exi13377_9 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_9,
        out_c0_exi13377_10 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_10,
        out_c0_exi13377_11 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_11,
        out_c0_exi13377_12 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_12,
        out_c0_exi13377_13 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_13,
        out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_stall_out => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_stall_out,
        out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_valid_out => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_valid_out,
        out_o_valid => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_o_valid,
        out_pipeline_valid_out => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x(BLACKBOX,6)@20000000
    -- out out_data_out_0@20000003
    -- out out_data_out_1@20000003
    -- out out_data_out_2@20000003
    -- out out_data_out_3@20000003
    -- out out_data_out_4@20000003
    -- out out_data_out_5@20000003
    -- out out_data_out_6@20000003
    -- out out_data_out_7@20000003
    -- out out_data_out_8@20000003
    -- out out_data_out_9@20000003
    -- out out_data_out_10@20000003
    -- out out_data_out_11@20000003
    -- out out_data_out_12@20000003
    -- out out_data_out_13@20000003
    -- out out_valid_out@20000003
    thei_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x : i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w207
    PORT MAP (
        in_data_in_0 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_0,
        in_data_in_1 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_1,
        in_data_in_2 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_2,
        in_data_in_3 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_3,
        in_data_in_4 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_4,
        in_data_in_5 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_5,
        in_data_in_6 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_6,
        in_data_in_7 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_7,
        in_data_in_8 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_8,
        in_data_in_9 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_9,
        in_data_in_10 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_10,
        in_data_in_11 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_11,
        in_data_in_12 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_12,
        in_data_in_13 => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_c0_exi13377_13,
        in_input_accepted => input_accepted_and_q,
        in_stall_in => in_i_stall,
        in_valid_in => i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_o_valid,
        out_data_out_0 => i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_0,
        out_data_out_1 => i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_1,
        out_data_out_2 => i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_2,
        out_data_out_3 => i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_3,
        out_data_out_4 => i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_4,
        out_data_out_5 => i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_5,
        out_data_out_6 => i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_6,
        out_data_out_7 => i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_7,
        out_data_out_8 => i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_8,
        out_data_out_9 => i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_9,
        out_data_out_10 => i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_10,
        out_data_out_11 => i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_11,
        out_data_out_12 => i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_12,
        out_data_out_13 => i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_13,
        out_stall_entry => i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_stall_entry,
        out_valid_out => i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@7
    out_c0_exit378_0 <= i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_0;
    out_c0_exit378_1 <= i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_1;
    out_c0_exit378_2 <= i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_2;
    out_c0_exit378_3 <= i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_3;
    out_c0_exit378_4 <= i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_4;
    out_c0_exit378_5 <= i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_5;
    out_c0_exit378_6 <= i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_6;
    out_c0_exit378_7 <= i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_7;
    out_c0_exit378_8 <= i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_8;
    out_c0_exit378_9 <= i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_9;
    out_c0_exit378_10 <= i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_10;
    out_c0_exit378_11 <= i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_11;
    out_c0_exit378_12 <= i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_12;
    out_c0_exit378_13 <= i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_data_out_13;
    out_o_valid <= i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_valid_out;

    -- dupName_0_regfree_osync_x(GPOUT,5)
    out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_valid_out <= i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_valid_out;

    -- pipeline_valid_out_sync(GPOUT,11)
    out_pipeline_valid_out <= i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_pipeline_valid_out;

    -- regfree_osync(GPOUT,13)
    out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_stall_out <= i_sfc_logic_c0_for_body26_gemm_nn9w_c0_enter357_gemm_nn9w154_aunroll_x_out_aclp_to_limiter_i_acl_pipeline_keep_going294_gemm_nn9w_exiting_stall_out;

    -- sync_out(GPOUT,15)@20000000
    out_o_stall <= i_acl_sfc_exit_c0_for_body26_gemm_nn9w_c0_exit378_gemm_nn9w_aunroll_x_out_stall_entry;

END normal;
