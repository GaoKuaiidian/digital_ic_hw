onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/reset_n
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/clk
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/data_in
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/wr_en
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/data_o
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/rd_en
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/full
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/empty
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/wr_real_en
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/rd_real_en
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/wr_ptr
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/rd_ptr
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/QA
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CLKA
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CLKB
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CENA
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CENB
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/BWENB
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AA
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AB
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/DB
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/mem_array
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/QA_int
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AA_int
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AB_int
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CLKA_int
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CLKB_int
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CENA_int
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CENB_int
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/BWENB_int
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/DB_int
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/QA_latched
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AA_latched
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AB_latched
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/DB_latched
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CENA_latched
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CENB_latched
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/BWENB_latched
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/LAST_CLKA
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/LAST_CLKB
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AA0_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AA1_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AA2_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AA3_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AA4_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AA5_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AB0_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AB1_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AB2_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AB3_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AB4_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AB5_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CENA_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CENB_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CLKA_CYC_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CLKB_CYC_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CLKA_H_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CLKB_H_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CLKA_L_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CLKB_L_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/DB0_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/DB1_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/DB2_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/DB3_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/DB4_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/DB5_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/DB6_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/DB7_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/BWENB0_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/BWENB1_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/BWENB2_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/BWENB3_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/BWENB4_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/BWENB5_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/BWENB6_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/BWENB7_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/BWENB_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/A_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/B_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/VIOA_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/VIOB_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/LAST_VIOA_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/LAST_VIOB_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AA_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AB_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/DB_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/LAST_CENA_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/LAST_CENB_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/LAST_AA_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/LAST_AB_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/LAST_DB_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/LAST_BWENB_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/LAST_CLKA_CYC_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/LAST_CLKB_CYC_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/LAST_CLKA_H_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/LAST_CLKB_H_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/LAST_CLKA_L_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/LAST_CLKB_L_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/data_tmp
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CEA_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CEB_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/clkconfA_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/clkconfB_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/clkconf_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/WRB0_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/WRB1_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/WRB2_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/WRB3_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/WRB4_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/WRB5_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/WRB6_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/WRB7_flag
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/i
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/j
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/wenn
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/lb
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/hb
add wave -noupdate -expand -group u_S65 -group u_S65 /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/n
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/mem_array
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/BWENB
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AA
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/AB
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/DB
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/QA
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CLKA
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CLKB
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CENA
add wave -noupdate /tb_FIFO64x8/u_FIFO64x8/u_S65NLLHS2PH64x8/CENB
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {32000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 487
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {721824 ps}
