vlib work
vlib msim

vlib msim/dist_mem_gen_v8_0_9
vlib msim/work

vmap dist_mem_gen_v8_0_9 msim/dist_mem_gen_v8_0_9
vmap work msim/work

vcom -work dist_mem_gen_v8_0_9 -64 -93 \
"../../../ipstatic/dist_mem_gen_v8_0_9/simulation/dist_mem_gen_v8_0.vhd" \

vcom -work work -64 -93 \
"../../../ip/dist_mem_gen_0/sim/dist_mem_gen_0.vhd" \


