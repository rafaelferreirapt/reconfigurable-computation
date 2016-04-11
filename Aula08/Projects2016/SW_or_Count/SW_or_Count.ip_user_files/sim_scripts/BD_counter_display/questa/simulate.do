onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BD_counter_display_opt

do {wave.do}

view wave
view structure
view signals

do {BD_counter_display.udo}

run -all

quit -force
