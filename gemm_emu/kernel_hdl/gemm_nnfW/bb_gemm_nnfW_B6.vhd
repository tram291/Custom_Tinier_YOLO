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

-- VHDL created from bb_gemm_nnfW_B6
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

entity bb_gemm_nnfW_B6 is
    port (
        in_c0_exit1443_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1443_0_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exit1443_0_2 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit1443_0_3 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1443_0_4 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1443_0_5 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1443_0_6 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit1443_0_7 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1443_0_8 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1443_0_9 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exit1443_0_10 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exit1443_0_11 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit1708_0_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit1708_0_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exit1708_0_2 : in std_logic_vector(63 downto 0);  -- ufix64
        in_A : in std_logic_vector(63 downto 0);  -- ufix64
        in_B : in std_logic_vector(63 downto 0);  -- ufix64
        in_C : in std_logic_vector(63 downto 0);  -- ufix64
        in_K : in std_logic_vector(31 downto 0);  -- ufix32
        in_M : in std_logic_vector(31 downto 0);  -- ufix32
        in_N : in std_logic_vector(31 downto 0);  -- ufix32
        in_c0_exe71515_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_exe81527_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c1_exe117110_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_lda : in std_logic_vector(31 downto 0);  -- ufix32
        in_ldc : in std_logic_vector(31 downto 0);  -- ufix32
        in_memdep_5_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memdep_5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_5_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe71515 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe81527 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c1_exe117110 : out std_logic_vector(0 downto 0);  -- ufix1
        out_lsu_memdep_5_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_5 : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_5_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memdep_5_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        out_memdep_5_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_5_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_5_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_5_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_5_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_gemm_nnfW_B6;

architecture normal of bb_gemm_nnfW_B6 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component gemm_nnfW_B6_merge is
        port (
            in_c0_exit1443_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1443_0_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1443_0_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit1443_0_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1443_0_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1443_0_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1443_0_6 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit1443_0_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1443_0_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1443_0_9 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit1443_0_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1443_0_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit1708_0_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit1708_0_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit1708_0_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe71515_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe81527_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe117110_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit1443_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit1443_1 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit1443_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit1443_3 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit1443_4 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit1443_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit1443_6 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit1443_7 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit1443_8 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit1443_9 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit1443_10 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit1443_11 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit1708_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit1708_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit1708_2 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe71515 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe81527 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe117110 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component bb_gemm_nnfW_B6_stall_region is
        port (
            in_c0_exit1443_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1443_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c0_exit1443_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit1443_3 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1443_4 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1443_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1443_6 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit1443_7 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1443_8 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1443_9 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exit1443_10 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exit1443_11 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit1708_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit1708_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exit1708_2 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe71515 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe81527 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe117110 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_5_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memdep_5_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_5_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_5_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe11155 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe71515 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe81527 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe117110 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_memdep_5_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_5_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memdep_5_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memdep_5_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_5_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_5_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_5_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_5_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component gemm_nnfW_B6_branch is
        port (
            in_c0_exe11155 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe71515 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_exe81527 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_exe117110 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_5 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe71515 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe81527 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exe117110 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_5 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_3 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_4 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_6 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_7 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_8 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_9 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_10 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_11 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B6_merge_aunroll_x_out_c1_exit1708_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B6_merge_aunroll_x_out_c1_exit1708_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B6_merge_aunroll_x_out_c1_exit1708_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal gemm_nnfW_B6_merge_aunroll_x_out_c0_exe71515 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B6_merge_aunroll_x_out_c0_exe81527 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B6_merge_aunroll_x_out_c1_exe117110 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B6_merge_aunroll_x_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B6_merge_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_stall_region_out_c0_exe11155 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_stall_region_out_c0_exe71515 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_stall_region_out_c0_exe81527 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_stall_region_out_c1_exe117110 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_stall_region_out_lsu_memdep_5_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_stall_region_out_memdep_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_stall_region_out_memdep_5_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal bb_gemm_nnfW_B6_stall_region_out_memdep_5_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal bb_gemm_nnfW_B6_stall_region_out_memdep_5_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_gemm_nnfW_B6_stall_region_out_memdep_5_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_stall_region_out_memdep_5_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_stall_region_out_memdep_5_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_stall_region_out_memdep_5_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal bb_gemm_nnfW_B6_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_gemm_nnfW_B6_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B6_branch_out_c0_exe71515 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B6_branch_out_c0_exe81527 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B6_branch_out_c1_exe117110 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B6_branch_out_memdep_5 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B6_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B6_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal gemm_nnfW_B6_branch_out_valid_out_1 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- gemm_nnfW_B6_merge_aunroll_x(BLACKBOX,2)
    thegemm_nnfW_B6_merge_aunroll_x : gemm_nnfW_B6_merge
    PORT MAP (
        in_c0_exit1443_0_0 => in_c0_exit1443_0_0,
        in_c0_exit1443_0_1 => in_c0_exit1443_0_1,
        in_c0_exit1443_0_2 => in_c0_exit1443_0_2,
        in_c0_exit1443_0_3 => in_c0_exit1443_0_3,
        in_c0_exit1443_0_4 => in_c0_exit1443_0_4,
        in_c0_exit1443_0_5 => in_c0_exit1443_0_5,
        in_c0_exit1443_0_6 => in_c0_exit1443_0_6,
        in_c0_exit1443_0_7 => in_c0_exit1443_0_7,
        in_c0_exit1443_0_8 => in_c0_exit1443_0_8,
        in_c0_exit1443_0_9 => in_c0_exit1443_0_9,
        in_c0_exit1443_0_10 => in_c0_exit1443_0_10,
        in_c0_exit1443_0_11 => in_c0_exit1443_0_11,
        in_c1_exit1708_0_0 => in_c1_exit1708_0_0,
        in_c1_exit1708_0_1 => in_c1_exit1708_0_1,
        in_c1_exit1708_0_2 => in_c1_exit1708_0_2,
        in_c0_exe71515_0 => in_c0_exe71515_0,
        in_c0_exe81527_0 => in_c0_exe81527_0,
        in_c1_exe117110_0 => in_c1_exe117110_0,
        in_stall_in => bb_gemm_nnfW_B6_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        out_c0_exit1443_0 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_0,
        out_c0_exit1443_1 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_1,
        out_c0_exit1443_2 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_2,
        out_c0_exit1443_3 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_3,
        out_c0_exit1443_4 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_4,
        out_c0_exit1443_5 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_5,
        out_c0_exit1443_6 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_6,
        out_c0_exit1443_7 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_7,
        out_c0_exit1443_8 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_8,
        out_c0_exit1443_9 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_9,
        out_c0_exit1443_10 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_10,
        out_c0_exit1443_11 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_11,
        out_c1_exit1708_0 => gemm_nnfW_B6_merge_aunroll_x_out_c1_exit1708_0,
        out_c1_exit1708_1 => gemm_nnfW_B6_merge_aunroll_x_out_c1_exit1708_1,
        out_c1_exit1708_2 => gemm_nnfW_B6_merge_aunroll_x_out_c1_exit1708_2,
        out_c0_exe71515 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exe71515,
        out_c0_exe81527 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exe81527,
        out_c1_exe117110 => gemm_nnfW_B6_merge_aunroll_x_out_c1_exe117110,
        out_stall_out_0 => gemm_nnfW_B6_merge_aunroll_x_out_stall_out_0,
        out_valid_out => gemm_nnfW_B6_merge_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_gemm_nnfW_B6_stall_region(BLACKBOX,37)
    thebb_gemm_nnfW_B6_stall_region : bb_gemm_nnfW_B6_stall_region
    PORT MAP (
        in_c0_exit1443_0 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_0,
        in_c0_exit1443_1 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_1,
        in_c0_exit1443_2 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_2,
        in_c0_exit1443_3 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_3,
        in_c0_exit1443_4 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_4,
        in_c0_exit1443_5 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_5,
        in_c0_exit1443_6 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_6,
        in_c0_exit1443_7 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_7,
        in_c0_exit1443_8 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_8,
        in_c0_exit1443_9 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_9,
        in_c0_exit1443_10 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_10,
        in_c0_exit1443_11 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exit1443_11,
        in_c1_exit1708_0 => gemm_nnfW_B6_merge_aunroll_x_out_c1_exit1708_0,
        in_c1_exit1708_1 => gemm_nnfW_B6_merge_aunroll_x_out_c1_exit1708_1,
        in_c1_exit1708_2 => gemm_nnfW_B6_merge_aunroll_x_out_c1_exit1708_2,
        in_c0_exe71515 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exe71515,
        in_c0_exe81527 => gemm_nnfW_B6_merge_aunroll_x_out_c0_exe81527,
        in_c1_exe117110 => gemm_nnfW_B6_merge_aunroll_x_out_c1_exe117110,
        in_flush => in_flush,
        in_memdep_5_avm_readdata => in_memdep_5_avm_readdata,
        in_memdep_5_avm_readdatavalid => in_memdep_5_avm_readdatavalid,
        in_memdep_5_avm_waitrequest => in_memdep_5_avm_waitrequest,
        in_memdep_5_avm_writeack => in_memdep_5_avm_writeack,
        in_stall_in => gemm_nnfW_B6_branch_out_stall_out,
        in_valid_in => gemm_nnfW_B6_merge_aunroll_x_out_valid_out,
        out_c0_exe11155 => bb_gemm_nnfW_B6_stall_region_out_c0_exe11155,
        out_c0_exe71515 => bb_gemm_nnfW_B6_stall_region_out_c0_exe71515,
        out_c0_exe81527 => bb_gemm_nnfW_B6_stall_region_out_c0_exe81527,
        out_c1_exe117110 => bb_gemm_nnfW_B6_stall_region_out_c1_exe117110,
        out_lsu_memdep_5_o_active => bb_gemm_nnfW_B6_stall_region_out_lsu_memdep_5_o_active,
        out_memdep_5 => bb_gemm_nnfW_B6_stall_region_out_memdep_5,
        out_memdep_5_avm_address => bb_gemm_nnfW_B6_stall_region_out_memdep_5_avm_address,
        out_memdep_5_avm_burstcount => bb_gemm_nnfW_B6_stall_region_out_memdep_5_avm_burstcount,
        out_memdep_5_avm_byteenable => bb_gemm_nnfW_B6_stall_region_out_memdep_5_avm_byteenable,
        out_memdep_5_avm_enable => bb_gemm_nnfW_B6_stall_region_out_memdep_5_avm_enable,
        out_memdep_5_avm_read => bb_gemm_nnfW_B6_stall_region_out_memdep_5_avm_read,
        out_memdep_5_avm_write => bb_gemm_nnfW_B6_stall_region_out_memdep_5_avm_write,
        out_memdep_5_avm_writedata => bb_gemm_nnfW_B6_stall_region_out_memdep_5_avm_writedata,
        out_stall_out => bb_gemm_nnfW_B6_stall_region_out_stall_out,
        out_valid_out => bb_gemm_nnfW_B6_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- gemm_nnfW_B6_branch(BLACKBOX,38)
    thegemm_nnfW_B6_branch : gemm_nnfW_B6_branch
    PORT MAP (
        in_c0_exe11155 => bb_gemm_nnfW_B6_stall_region_out_c0_exe11155,
        in_c0_exe71515 => bb_gemm_nnfW_B6_stall_region_out_c0_exe71515,
        in_c0_exe81527 => bb_gemm_nnfW_B6_stall_region_out_c0_exe81527,
        in_c1_exe117110 => bb_gemm_nnfW_B6_stall_region_out_c1_exe117110,
        in_memdep_5 => bb_gemm_nnfW_B6_stall_region_out_memdep_5,
        in_stall_in_0 => in_stall_in_0,
        in_stall_in_1 => in_stall_in_1,
        in_valid_in => bb_gemm_nnfW_B6_stall_region_out_valid_out,
        out_c0_exe71515 => gemm_nnfW_B6_branch_out_c0_exe71515,
        out_c0_exe81527 => gemm_nnfW_B6_branch_out_c0_exe81527,
        out_c1_exe117110 => gemm_nnfW_B6_branch_out_c1_exe117110,
        out_memdep_5 => gemm_nnfW_B6_branch_out_memdep_5,
        out_stall_out => gemm_nnfW_B6_branch_out_stall_out,
        out_valid_out_0 => gemm_nnfW_B6_branch_out_valid_out_0,
        out_valid_out_1 => gemm_nnfW_B6_branch_out_valid_out_1,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe71515(GPOUT,39)
    out_c0_exe71515 <= gemm_nnfW_B6_branch_out_c0_exe71515;

    -- out_c0_exe81527(GPOUT,40)
    out_c0_exe81527 <= gemm_nnfW_B6_branch_out_c0_exe81527;

    -- out_c1_exe117110(GPOUT,41)
    out_c1_exe117110 <= gemm_nnfW_B6_branch_out_c1_exe117110;

    -- out_lsu_memdep_5_o_active(GPOUT,42)
    out_lsu_memdep_5_o_active <= bb_gemm_nnfW_B6_stall_region_out_lsu_memdep_5_o_active;

    -- out_memdep_5(GPOUT,43)
    out_memdep_5 <= gemm_nnfW_B6_branch_out_memdep_5;

    -- out_memdep_5_avm_address(GPOUT,44)
    out_memdep_5_avm_address <= bb_gemm_nnfW_B6_stall_region_out_memdep_5_avm_address;

    -- out_memdep_5_avm_burstcount(GPOUT,45)
    out_memdep_5_avm_burstcount <= bb_gemm_nnfW_B6_stall_region_out_memdep_5_avm_burstcount;

    -- out_memdep_5_avm_byteenable(GPOUT,46)
    out_memdep_5_avm_byteenable <= bb_gemm_nnfW_B6_stall_region_out_memdep_5_avm_byteenable;

    -- out_memdep_5_avm_enable(GPOUT,47)
    out_memdep_5_avm_enable <= bb_gemm_nnfW_B6_stall_region_out_memdep_5_avm_enable;

    -- out_memdep_5_avm_read(GPOUT,48)
    out_memdep_5_avm_read <= bb_gemm_nnfW_B6_stall_region_out_memdep_5_avm_read;

    -- out_memdep_5_avm_write(GPOUT,49)
    out_memdep_5_avm_write <= bb_gemm_nnfW_B6_stall_region_out_memdep_5_avm_write;

    -- out_memdep_5_avm_writedata(GPOUT,50)
    out_memdep_5_avm_writedata <= bb_gemm_nnfW_B6_stall_region_out_memdep_5_avm_writedata;

    -- out_stall_out_0(GPOUT,51)
    out_stall_out_0 <= gemm_nnfW_B6_merge_aunroll_x_out_stall_out_0;

    -- out_valid_out_0(GPOUT,52)
    out_valid_out_0 <= gemm_nnfW_B6_branch_out_valid_out_0;

    -- out_valid_out_1(GPOUT,53)
    out_valid_out_1 <= gemm_nnfW_B6_branch_out_valid_out_1;

END normal;
