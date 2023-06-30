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

-- VHDL created from bb_gemm_nn9W_B6
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

entity bb_gemm_nn9W_B6 is
    port (
        in_c0_exit4289_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit4289_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit4289_0_2 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit4289_0_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit4289_0_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit4289_0_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit4289_0_6 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit4289_0_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit4289_0_8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit4289_0_9 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit4289_0_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit4289_0_11 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit45614_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit45614_0_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit45614_0_2 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit45614_0_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit45614_0_4 : in std_logic_vector(63 downto 0);  -- ufix64
        in_A : in std_logic_vector(63 downto 0);  -- ufix64
        in_B : in std_logic_vector(63 downto 0);  -- ufix64
        in_C : in std_logic_vector(63 downto 0);  -- ufix64
        in_K : in std_logic_vector(31 downto 0);  -- ufix32
        in_M : in std_logic_vector(31 downto 0);  -- ufix32
        in_N : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe743511_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe843613_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe145716_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe245818_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe345920_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_lda : in std_logic_vector(31 downto 0);  -- ufix32
        in_ldc : in std_logic_vector(31 downto 0);  -- ufix32
        in_memdep_276_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memdep_276_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_276_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_276_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi2584_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi2636_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_phi2688_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe743511 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe843613 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe145716 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe245818 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe345920 : out std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_memdep_276_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_276 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_276_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memdep_276_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memdep_276_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_276_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_276_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_276_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_276_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memdep_phi2584 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi2636 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_phi2688 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nn9W_B6;

architecture normal of bb_gemm_nn9W_B6 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component gemm_nn9W_B6_merge is
        port (
            in_c0_exit4289_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit4289_0_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit4289_0_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit4289_0_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit4289_0_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit4289_0_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit4289_0_6 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit4289_0_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit4289_0_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit4289_0_9 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit4289_0_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit4289_0_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit45614_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit45614_0_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit45614_0_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit45614_0_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit45614_0_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe743511_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe843613_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe145716_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe245818_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe345920_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi2584_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi2636_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi2688_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit4289_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit4289_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit4289_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit4289_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit4289_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit4289_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit4289_6 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit4289_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit4289_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit4289_9 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit4289_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit4289_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit45614_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit45614_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit45614_2 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit45614_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit45614_4 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe743511 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe843613 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe145716 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe245818 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe345920 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi2584 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi2636 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi2688 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nn9W_B6_stall_region is
        port (
            in_c0_exit4289_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit4289_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit4289_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit4289_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit4289_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit4289_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit4289_6 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit4289_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit4289_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit4289_9 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit4289_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit4289_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit45614_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit45614_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit45614_2 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit45614_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit45614_4 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe743511 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe843613 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe145716 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe245818 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe345920 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_276_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memdep_276_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_276_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_276_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi2584 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi2636 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi2688 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11439 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe743511 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe843613 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe145716 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe245818 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe345920 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_memdep_276_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_276 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_276_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memdep_276_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memdep_276_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_276_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_276_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_276_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_276_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_memdep_phi2584 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi2636 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi2688 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gemm_nn9W_B6_branch is
        port (
            in_c0_exe11439 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe743511 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe843613 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe145716 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe245818 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe345920 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_276 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi2584 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi2636 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_phi2688 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe743511 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe843613 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe145716 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe245818 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe345920 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_276 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi2584 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi2636 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_phi2688 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_6 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_9 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_c1_exit45614_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_c1_exit45614_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_c1_exit45614_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_c1_exit45614_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_c1_exit45614_4 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_c0_exe743511 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_c0_exe843613 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_c1_exe145716 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_c1_exe245818 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_c1_exe345920 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_memdep_phi2584 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_memdep_phi2636 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_memdep_phi2688 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_merge_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_stall_region_out_c0_exe11439 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_stall_region_out_c0_exe743511 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_stall_region_out_c0_exe843613 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_stall_region_out_c1_exe145716 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_stall_region_out_c1_exe245818 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_stall_region_out_c1_exe345920 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_stall_region_out_lsu_memdep_276_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_stall_region_out_memdep_276 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_stall_region_out_memdep_276_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_gemm_nn9W_B6_stall_region_out_memdep_276_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_gemm_nn9W_B6_stall_region_out_memdep_276_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nn9W_B6_stall_region_out_memdep_276_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_stall_region_out_memdep_276_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_stall_region_out_memdep_276_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_stall_region_out_memdep_276_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_gemm_nn9W_B6_stall_region_out_memdep_phi2584 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_stall_region_out_memdep_phi2636 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_stall_region_out_memdep_phi2688 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nn9W_B6_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_branch_out_c0_exe743511 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_branch_out_c0_exe843613 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_branch_out_c1_exe145716 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_branch_out_c1_exe245818 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_branch_out_c1_exe345920 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_branch_out_memdep_276 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_branch_out_memdep_phi2584 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_branch_out_memdep_phi2636 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_branch_out_memdep_phi2688 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nn9W_B6_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- gemm_nn9W_B6_merge_aunroll_x(BLACKBOX,2)
    thegemm_nn9W_B6_merge_aunroll_x : gemm_nn9W_B6_merge
    PORT MAP (
        in_c0_exit4289_0_0 => in_c0_exit4289_0_0,
        in_c0_exit4289_0_1 => in_c0_exit4289_0_1,
        in_c0_exit4289_0_2 => in_c0_exit4289_0_2,
        in_c0_exit4289_0_3 => in_c0_exit4289_0_3,
        in_c0_exit4289_0_4 => in_c0_exit4289_0_4,
        in_c0_exit4289_0_5 => in_c0_exit4289_0_5,
        in_c0_exit4289_0_6 => in_c0_exit4289_0_6,
        in_c0_exit4289_0_7 => in_c0_exit4289_0_7,
        in_c0_exit4289_0_8 => in_c0_exit4289_0_8,
        in_c0_exit4289_0_9 => in_c0_exit4289_0_9,
        in_c0_exit4289_0_10 => in_c0_exit4289_0_10,
        in_c0_exit4289_0_11 => in_c0_exit4289_0_11,
        in_c1_exit45614_0_0 => in_c1_exit45614_0_0,
        in_c1_exit45614_0_1 => in_c1_exit45614_0_1,
        in_c1_exit45614_0_2 => in_c1_exit45614_0_2,
        in_c1_exit45614_0_3 => in_c1_exit45614_0_3,
        in_c1_exit45614_0_4 => in_c1_exit45614_0_4,
        in_c0_exe743511_0 => in_c0_exe743511_0,
        in_c0_exe843613_0 => in_c0_exe843613_0,
        in_c1_exe145716_0 => in_c1_exe145716_0,
        in_c1_exe245818_0 => in_c1_exe245818_0,
        in_c1_exe345920_0 => in_c1_exe345920_0,
        in_memdep_phi2584_0 => in_memdep_phi2584_0,
        in_memdep_phi2636_0 => in_memdep_phi2636_0,
        in_memdep_phi2688_0 => in_memdep_phi2688_0,
        in_stall_in => bb_gemm_nn9W_B6_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_c0_exit4289_0 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_0,
        out_c0_exit4289_1 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_1,
        out_c0_exit4289_2 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_2,
        out_c0_exit4289_3 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_3,
        out_c0_exit4289_4 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_4,
        out_c0_exit4289_5 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_5,
        out_c0_exit4289_6 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_6,
        out_c0_exit4289_7 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_7,
        out_c0_exit4289_8 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_8,
        out_c0_exit4289_9 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_9,
        out_c0_exit4289_10 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_10,
        out_c0_exit4289_11 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_11,
        out_c1_exit45614_0 => gemm_nn9W_B6_merge_aunroll_x_out_c1_exit45614_0,
        out_c1_exit45614_1 => gemm_nn9W_B6_merge_aunroll_x_out_c1_exit45614_1,
        out_c1_exit45614_2 => gemm_nn9W_B6_merge_aunroll_x_out_c1_exit45614_2,
        out_c1_exit45614_3 => gemm_nn9W_B6_merge_aunroll_x_out_c1_exit45614_3,
        out_c1_exit45614_4 => gemm_nn9W_B6_merge_aunroll_x_out_c1_exit45614_4,
        out_c0_exe743511 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exe743511,
        out_c0_exe843613 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exe843613,
        out_c1_exe145716 => gemm_nn9W_B6_merge_aunroll_x_out_c1_exe145716,
        out_c1_exe245818 => gemm_nn9W_B6_merge_aunroll_x_out_c1_exe245818,
        out_c1_exe345920 => gemm_nn9W_B6_merge_aunroll_x_out_c1_exe345920,
        out_memdep_phi2584 => gemm_nn9W_B6_merge_aunroll_x_out_memdep_phi2584,
        out_memdep_phi2636 => gemm_nn9W_B6_merge_aunroll_x_out_memdep_phi2636,
        out_memdep_phi2688 => gemm_nn9W_B6_merge_aunroll_x_out_memdep_phi2688,
        out_stall_out_0 => gemm_nn9W_B6_merge_aunroll_x_out_stall_out_0,
        out_valid_out => gemm_nn9W_B6_merge_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nn9W_B6_stall_region(BLACKBOX,44)
    thebb_gemm_nn9W_B6_stall_region : bb_gemm_nn9W_B6_stall_region
    PORT MAP (
        in_c0_exit4289_0 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_0,
        in_c0_exit4289_1 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_1,
        in_c0_exit4289_2 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_2,
        in_c0_exit4289_3 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_3,
        in_c0_exit4289_4 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_4,
        in_c0_exit4289_5 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_5,
        in_c0_exit4289_6 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_6,
        in_c0_exit4289_7 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_7,
        in_c0_exit4289_8 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_8,
        in_c0_exit4289_9 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_9,
        in_c0_exit4289_10 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_10,
        in_c0_exit4289_11 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exit4289_11,
        in_c1_exit45614_0 => gemm_nn9W_B6_merge_aunroll_x_out_c1_exit45614_0,
        in_c1_exit45614_1 => gemm_nn9W_B6_merge_aunroll_x_out_c1_exit45614_1,
        in_c1_exit45614_2 => gemm_nn9W_B6_merge_aunroll_x_out_c1_exit45614_2,
        in_c1_exit45614_3 => gemm_nn9W_B6_merge_aunroll_x_out_c1_exit45614_3,
        in_c1_exit45614_4 => gemm_nn9W_B6_merge_aunroll_x_out_c1_exit45614_4,
        in_c0_exe743511 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exe743511,
        in_c0_exe843613 => gemm_nn9W_B6_merge_aunroll_x_out_c0_exe843613,
        in_c1_exe145716 => gemm_nn9W_B6_merge_aunroll_x_out_c1_exe145716,
        in_c1_exe245818 => gemm_nn9W_B6_merge_aunroll_x_out_c1_exe245818,
        in_c1_exe345920 => gemm_nn9W_B6_merge_aunroll_x_out_c1_exe345920,
        in_flush => in_flush,
        in_memdep_276_avm_readdata => in_memdep_276_avm_readdata,
        in_memdep_276_avm_readdatavalid => in_memdep_276_avm_readdatavalid,
        in_memdep_276_avm_waitrequest => in_memdep_276_avm_waitrequest,
        in_memdep_276_avm_writeack => in_memdep_276_avm_writeack,
        in_memdep_phi2584 => gemm_nn9W_B6_merge_aunroll_x_out_memdep_phi2584,
        in_memdep_phi2636 => gemm_nn9W_B6_merge_aunroll_x_out_memdep_phi2636,
        in_memdep_phi2688 => gemm_nn9W_B6_merge_aunroll_x_out_memdep_phi2688,
        in_stall_in => gemm_nn9W_B6_branch_out_stall_out,
        in_valid_in => gemm_nn9W_B6_merge_aunroll_x_out_valid_out,
        out_c0_exe11439 => bb_gemm_nn9W_B6_stall_region_out_c0_exe11439,
        out_c0_exe743511 => bb_gemm_nn9W_B6_stall_region_out_c0_exe743511,
        out_c0_exe843613 => bb_gemm_nn9W_B6_stall_region_out_c0_exe843613,
        out_c1_exe145716 => bb_gemm_nn9W_B6_stall_region_out_c1_exe145716,
        out_c1_exe245818 => bb_gemm_nn9W_B6_stall_region_out_c1_exe245818,
        out_c1_exe345920 => bb_gemm_nn9W_B6_stall_region_out_c1_exe345920,
        out_lsu_memdep_276_o_active => bb_gemm_nn9W_B6_stall_region_out_lsu_memdep_276_o_active,
        out_memdep_276 => bb_gemm_nn9W_B6_stall_region_out_memdep_276,
        out_memdep_276_avm_address => bb_gemm_nn9W_B6_stall_region_out_memdep_276_avm_address,
        out_memdep_276_avm_burstcount => bb_gemm_nn9W_B6_stall_region_out_memdep_276_avm_burstcount,
        out_memdep_276_avm_byteenable => bb_gemm_nn9W_B6_stall_region_out_memdep_276_avm_byteenable,
        out_memdep_276_avm_enable => bb_gemm_nn9W_B6_stall_region_out_memdep_276_avm_enable,
        out_memdep_276_avm_read => bb_gemm_nn9W_B6_stall_region_out_memdep_276_avm_read,
        out_memdep_276_avm_write => bb_gemm_nn9W_B6_stall_region_out_memdep_276_avm_write,
        out_memdep_276_avm_writedata => bb_gemm_nn9W_B6_stall_region_out_memdep_276_avm_writedata,
        out_memdep_phi2584 => bb_gemm_nn9W_B6_stall_region_out_memdep_phi2584,
        out_memdep_phi2636 => bb_gemm_nn9W_B6_stall_region_out_memdep_phi2636,
        out_memdep_phi2688 => bb_gemm_nn9W_B6_stall_region_out_memdep_phi2688,
        out_stall_out => bb_gemm_nn9W_B6_stall_region_out_stall_out,
        out_valid_out => bb_gemm_nn9W_B6_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- gemm_nn9W_B6_branch(BLACKBOX,45)
    thegemm_nn9W_B6_branch : gemm_nn9W_B6_branch
    PORT MAP (
        in_c0_exe11439 => bb_gemm_nn9W_B6_stall_region_out_c0_exe11439,
        in_c0_exe743511 => bb_gemm_nn9W_B6_stall_region_out_c0_exe743511,
        in_c0_exe843613 => bb_gemm_nn9W_B6_stall_region_out_c0_exe843613,
        in_c1_exe145716 => bb_gemm_nn9W_B6_stall_region_out_c1_exe145716,
        in_c1_exe245818 => bb_gemm_nn9W_B6_stall_region_out_c1_exe245818,
        in_c1_exe345920 => bb_gemm_nn9W_B6_stall_region_out_c1_exe345920,
        in_memdep_276 => bb_gemm_nn9W_B6_stall_region_out_memdep_276,
        in_memdep_phi2584 => bb_gemm_nn9W_B6_stall_region_out_memdep_phi2584,
        in_memdep_phi2636 => bb_gemm_nn9W_B6_stall_region_out_memdep_phi2636,
        in_memdep_phi2688 => bb_gemm_nn9W_B6_stall_region_out_memdep_phi2688,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_valid_in => bb_gemm_nn9W_B6_stall_region_out_valid_out,
        out_c0_exe743511 => gemm_nn9W_B6_branch_out_c0_exe743511,
        out_c0_exe843613 => gemm_nn9W_B6_branch_out_c0_exe843613,
        out_c1_exe145716 => gemm_nn9W_B6_branch_out_c1_exe145716,
        out_c1_exe245818 => gemm_nn9W_B6_branch_out_c1_exe245818,
        out_c1_exe345920 => gemm_nn9W_B6_branch_out_c1_exe345920,
        out_memdep_276 => gemm_nn9W_B6_branch_out_memdep_276,
        out_memdep_phi2584 => gemm_nn9W_B6_branch_out_memdep_phi2584,
        out_memdep_phi2636 => gemm_nn9W_B6_branch_out_memdep_phi2636,
        out_memdep_phi2688 => gemm_nn9W_B6_branch_out_memdep_phi2688,
        out_stall_out => gemm_nn9W_B6_branch_out_stall_out,
        out_valid_out_0 => gemm_nn9W_B6_branch_out_valid_out_0,
        out_valid_out_1 => gemm_nn9W_B6_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe743511(GPOUT,46)
    out_c0_exe743511 <= gemm_nn9W_B6_branch_out_c0_exe743511;

    -- out_c0_exe843613(GPOUT,47)
    out_c0_exe843613 <= gemm_nn9W_B6_branch_out_c0_exe843613;

    -- out_c1_exe145716(GPOUT,48)
    out_c1_exe145716 <= gemm_nn9W_B6_branch_out_c1_exe145716;

    -- out_c1_exe245818(GPOUT,49)
    out_c1_exe245818 <= gemm_nn9W_B6_branch_out_c1_exe245818;

    -- out_c1_exe345920(GPOUT,50)
    out_c1_exe345920 <= gemm_nn9W_B6_branch_out_c1_exe345920;

    -- out_lsu_memdep_276_o_active(GPOUT,51)
    out_lsu_memdep_276_o_active <= bb_gemm_nn9W_B6_stall_region_out_lsu_memdep_276_o_active;

    -- out_memdep_276(GPOUT,52)
    out_memdep_276 <= gemm_nn9W_B6_branch_out_memdep_276;

    -- out_memdep_276_avm_address(GPOUT,53)
    out_memdep_276_avm_address <= bb_gemm_nn9W_B6_stall_region_out_memdep_276_avm_address;

    -- out_memdep_276_avm_burstcount(GPOUT,54)
    out_memdep_276_avm_burstcount <= bb_gemm_nn9W_B6_stall_region_out_memdep_276_avm_burstcount;

    -- out_memdep_276_avm_byteenable(GPOUT,55)
    out_memdep_276_avm_byteenable <= bb_gemm_nn9W_B6_stall_region_out_memdep_276_avm_byteenable;

    -- out_memdep_276_avm_enable(GPOUT,56)
    out_memdep_276_avm_enable <= bb_gemm_nn9W_B6_stall_region_out_memdep_276_avm_enable;

    -- out_memdep_276_avm_read(GPOUT,57)
    out_memdep_276_avm_read <= bb_gemm_nn9W_B6_stall_region_out_memdep_276_avm_read;

    -- out_memdep_276_avm_write(GPOUT,58)
    out_memdep_276_avm_write <= bb_gemm_nn9W_B6_stall_region_out_memdep_276_avm_write;

    -- out_memdep_276_avm_writedata(GPOUT,59)
    out_memdep_276_avm_writedata <= bb_gemm_nn9W_B6_stall_region_out_memdep_276_avm_writedata;

    -- out_memdep_phi2584(GPOUT,60)
    out_memdep_phi2584 <= gemm_nn9W_B6_branch_out_memdep_phi2584;

    -- out_memdep_phi2636(GPOUT,61)
    out_memdep_phi2636 <= gemm_nn9W_B6_branch_out_memdep_phi2636;

    -- out_memdep_phi2688(GPOUT,62)
    out_memdep_phi2688 <= gemm_nn9W_B6_branch_out_memdep_phi2688;

    -- out_stall_out_0(GPOUT,63)
    out_stall_out_0 <= gemm_nn9W_B6_merge_aunroll_x_out_stall_out_0;

    -- out_valid_out_0(GPOUT,64)
    out_valid_out_0 <= gemm_nn9W_B6_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,65)
    out_valid_out_1 <= gemm_nn9W_B6_branch_out_valid_out_1;

END normal;
