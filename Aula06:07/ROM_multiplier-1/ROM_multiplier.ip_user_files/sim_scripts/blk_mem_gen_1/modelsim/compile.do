vlib work
vlib msim

vlib msim/blk_mem_gen_v8_3_1
vlib msim/work

vmap blk_mem_gen_v8_3_1 msim/blk_mem_gen_v8_3_1
vmap work msim/work

vcom -work blk_mem_gen_v8_3_1 -64 -93 \
"../../../ipstatic/blk_mem_gen_v8_3_1/simulation/blk_mem_gen_v8_3.vhd" \

vcom -work work -64 -93 \
"../../../ip/blk_mem_gen_1/sim/blk_mem_gen_1.vhd" \


