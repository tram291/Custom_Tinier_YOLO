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

-- VHDL created from i_sfc_logic_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w4
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

entity i_sfc_logic_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w4 is
    port (
        in_N : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_eni1_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni1_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi3_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi3_1 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c0_exi3_2 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi3_3 : out std_logic_vector(0 downto 0);  -- ufix1
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w4;

architecture normal of i_sfc_logic_c0_for_cond2_preheader_gemm_nn9w_c0_enter_gemm_nn9w4 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_acl_pipeline_keep_going298_gemm_nn9w6 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_initeration_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_initeration_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_not_exitcond_in : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_not_exitcond_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_pipeline_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_exiting_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_initeration_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_not_exitcond_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_pipeline_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i32_j_076_pop9_gemm_nn9w11 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_9 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_valid_in_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_stall_out_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_notexitcond299_gemm_nn9w19 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_8 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i32_j_076_push9_gemm_nn9w17 is
        port (
            in_data_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_feedback_stall_in_9 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_notexit300 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_out_9 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_feedback_valid_out_9 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_n_sync_buffer282_gemm_nn9w13 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_n_sync_buffer_gemm_nn9w8 is
        port (
            in_buffer_in : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bgTrunc_i_inc78_gemm_nn9w_sel_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pipeline_keep_going298_gemm_nn9w_out_exiting_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going298_gemm_nn9w_out_exiting_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going298_gemm_nn9w_out_not_exitcond_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pipeline_keep_going298_gemm_nn9w_out_pipeline_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i32_j_076_pop9_gemm_nn9w_out_data_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i32_j_076_pop9_gemm_nn9w_out_feedback_stall_out_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_notexitcond299_gemm_nn9w_out_feedback_out_8 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_notexitcond299_gemm_nn9w_out_feedback_valid_out_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i32_j_076_push9_gemm_nn9w_out_feedback_out_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_push_i32_j_076_push9_gemm_nn9w_out_feedback_valid_out_9 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_exitcond77_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_inc78_gemm_nn9w_a : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc78_gemm_nn9w_b : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc78_gemm_nn9w_o : STD_LOGIC_VECTOR (32 downto 0);
    signal i_inc78_gemm_nn9w_q : STD_LOGIC_VECTOR (32 downto 0);
    signal i_notexit300_demorgan_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_notexit300_gemm_nn9w_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_notlhs256_gemm_nn9w_a : STD_LOGIC_VECTOR (33 downto 0);
    signal i_notlhs256_gemm_nn9w_b : STD_LOGIC_VECTOR (33 downto 0);
    signal i_notlhs256_gemm_nn9w_o : STD_LOGIC_VECTOR (33 downto 0);
    signal i_notlhs256_gemm_nn9w_c : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_n_sync_buffer282_gemm_nn9w_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);
    signal i_syncbuf_n_sync_buffer_gemm_nn9w_out_buffer_out : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- i_notexit300_gemm_nn9w(LOGICAL,25)@1
    i_notexit300_gemm_nn9w_q <= i_notexit300_demorgan_gemm_nn9w_q xor VCC_q;

    -- c_i32_1gr(CONSTANT,16)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- i_syncbuf_n_sync_buffer_gemm_nn9w(BLACKBOX,28)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_n_sync_buffer_gemm_nn9w : i_syncbuf_n_sync_buffer_gemm_nn9w8
    PORT MAP (
        in_buffer_in => in_N,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_n_sync_buffer_gemm_nn9w_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_notlhs256_gemm_nn9w(COMPARE,26)@1
    i_notlhs256_gemm_nn9w_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => i_syncbuf_n_sync_buffer_gemm_nn9w_out_buffer_out(31)) & i_syncbuf_n_sync_buffer_gemm_nn9w_out_buffer_out));
    i_notlhs256_gemm_nn9w_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 32 => c_i32_1gr_q(31)) & c_i32_1gr_q));
    i_notlhs256_gemm_nn9w_o <= STD_LOGIC_VECTOR(SIGNED(i_notlhs256_gemm_nn9w_a) - SIGNED(i_notlhs256_gemm_nn9w_b));
    i_notlhs256_gemm_nn9w_c(0) <= i_notlhs256_gemm_nn9w_o(33);

    -- i_syncbuf_n_sync_buffer282_gemm_nn9w(BLACKBOX,27)@0
    -- in in_i_dependence@1
    -- in in_valid_in@1
    -- out out_buffer_out@1
    -- out out_valid_out@1
    thei_syncbuf_n_sync_buffer282_gemm_nn9w : i_syncbuf_n_sync_buffer282_gemm_nn9w13
    PORT MAP (
        in_buffer_in => in_N,
        in_i_dependence => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_buffer_out => i_syncbuf_n_sync_buffer282_gemm_nn9w_out_buffer_out,
        clock => clock,
        resetn => resetn
    );

    -- i_inc78_gemm_nn9w(ADD,23)@1
    i_inc78_gemm_nn9w_a <= STD_LOGIC_VECTOR("0" & i_acl_pop_i32_j_076_pop9_gemm_nn9w_out_data_out);
    i_inc78_gemm_nn9w_b <= STD_LOGIC_VECTOR("0" & c_i32_1gr_q);
    i_inc78_gemm_nn9w_o <= STD_LOGIC_VECTOR(UNSIGNED(i_inc78_gemm_nn9w_a) + UNSIGNED(i_inc78_gemm_nn9w_b));
    i_inc78_gemm_nn9w_q <= i_inc78_gemm_nn9w_o(32 downto 0);

    -- bgTrunc_i_inc78_gemm_nn9w_sel_x(BITSELECT,2)@1
    bgTrunc_i_inc78_gemm_nn9w_sel_x_b <= i_inc78_gemm_nn9w_q(31 downto 0);

    -- i_exitcond77_gemm_nn9w(LOGICAL,22)@1
    i_exitcond77_gemm_nn9w_q <= "1" WHEN bgTrunc_i_inc78_gemm_nn9w_sel_x_b = i_syncbuf_n_sync_buffer282_gemm_nn9w_out_buffer_out ELSE "0";

    -- i_notexit300_demorgan_gemm_nn9w(LOGICAL,24)@1
    i_notexit300_demorgan_gemm_nn9w_q <= i_exitcond77_gemm_nn9w_q or i_notlhs256_gemm_nn9w_c;

    -- i_acl_push_i32_j_076_push9_gemm_nn9w(BLACKBOX,21)@1
    -- out out_feedback_out_9@20000000
    -- out out_feedback_valid_out_9@20000000
    thei_acl_push_i32_j_076_push9_gemm_nn9w : i_acl_push_i32_j_076_push9_gemm_nn9w17
    PORT MAP (
        in_data_in => bgTrunc_i_inc78_gemm_nn9w_sel_x_b,
        in_feedback_stall_in_9 => i_acl_pop_i32_j_076_pop9_gemm_nn9w_out_feedback_stall_out_9,
        in_notexit300 => i_notexit300_gemm_nn9w_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_9 => i_acl_push_i32_j_076_push9_gemm_nn9w_out_feedback_out_9,
        out_feedback_valid_out_9 => i_acl_push_i32_j_076_push9_gemm_nn9w_out_feedback_valid_out_9,
        clock => clock,
        resetn => resetn
    );

    -- c_i32_0gr(CONSTANT,15)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- i_acl_pop_i32_j_076_pop9_gemm_nn9w(BLACKBOX,19)@1
    -- out out_feedback_stall_out_9@20000000
    thei_acl_pop_i32_j_076_pop9_gemm_nn9w : i_acl_pop_i32_j_076_pop9_gemm_nn9w11
    PORT MAP (
        in_data_in => c_i32_0gr_q,
        in_dir => in_c0_eni1_1,
        in_feedback_in_9 => i_acl_push_i32_j_076_push9_gemm_nn9w_out_feedback_out_9,
        in_feedback_valid_in_9 => i_acl_push_i32_j_076_push9_gemm_nn9w_out_feedback_valid_out_9,
        in_predicate => GND_q,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_data_out => i_acl_pop_i32_j_076_pop9_gemm_nn9w_out_data_out,
        out_feedback_stall_out_9 => i_acl_pop_i32_j_076_pop9_gemm_nn9w_out_feedback_stall_out_9,
        clock => clock,
        resetn => resetn
    );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,11)@1
    out_c0_exi3_0 <= GND_q;
    out_c0_exi3_1 <= i_acl_pop_i32_j_076_pop9_gemm_nn9w_out_data_out;
    out_c0_exi3_2 <= i_notexit300_demorgan_gemm_nn9w_q;
    out_c0_exi3_3 <= i_notexit300_gemm_nn9w_q;
    out_o_valid <= in_i_valid;

    -- i_acl_push_i1_notexitcond299_gemm_nn9w(BLACKBOX,20)@1
    -- out out_feedback_out_8@20000000
    -- out out_feedback_valid_out_8@20000000
    thei_acl_push_i1_notexitcond299_gemm_nn9w : i_acl_push_i1_notexitcond299_gemm_nn9w19
    PORT MAP (
        in_data_in => i_notexit300_gemm_nn9w_q,
        in_feedback_stall_in_8 => i_acl_pipeline_keep_going298_gemm_nn9w_out_not_exitcond_stall_out,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_feedback_out_8 => i_acl_push_i1_notexitcond299_gemm_nn9w_out_feedback_out_8,
        out_feedback_valid_out_8 => i_acl_push_i1_notexitcond299_gemm_nn9w_out_feedback_valid_out_8,
        clock => clock,
        resetn => resetn
    );

    -- i_acl_pipeline_keep_going298_gemm_nn9w(BLACKBOX,18)@1
    -- out out_exiting_stall_out@20000000
    -- out out_exiting_valid_out@20000000
    -- out out_initeration_stall_out@20000000
    -- out out_not_exitcond_stall_out@20000000
    -- out out_pipeline_valid_out@20000000
    thei_acl_pipeline_keep_going298_gemm_nn9w : i_acl_pipeline_keep_going298_gemm_nn9w6
    PORT MAP (
        in_data_in => VCC_q,
        in_initeration_in => GND_q,
        in_initeration_valid_in => GND_q,
        in_not_exitcond_in => i_acl_push_i1_notexitcond299_gemm_nn9w_out_feedback_out_8,
        in_not_exitcond_valid_in => i_acl_push_i1_notexitcond299_gemm_nn9w_out_feedback_valid_out_8,
        in_pipeline_stall_in => in_pipeline_stall_in,
        in_stall_in => GND_q,
        in_valid_in => in_i_valid,
        out_exiting_stall_out => i_acl_pipeline_keep_going298_gemm_nn9w_out_exiting_stall_out,
        out_exiting_valid_out => i_acl_pipeline_keep_going298_gemm_nn9w_out_exiting_valid_out,
        out_not_exitcond_stall_out => i_acl_pipeline_keep_going298_gemm_nn9w_out_not_exitcond_stall_out,
        out_pipeline_valid_out => i_acl_pipeline_keep_going298_gemm_nn9w_out_pipeline_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- ext_sig_sync_out(GPOUT,17)
    out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_valid_out <= i_acl_pipeline_keep_going298_gemm_nn9w_out_exiting_valid_out;
    out_aclp_to_limiter_i_acl_pipeline_keep_going298_gemm_nn9w_exiting_stall_out <= i_acl_pipeline_keep_going298_gemm_nn9w_out_exiting_stall_out;

    -- pipeline_valid_out_sync(GPOUT,33)
    out_pipeline_valid_out <= i_acl_pipeline_keep_going298_gemm_nn9w_out_pipeline_valid_out;

END normal;
