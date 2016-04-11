onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L secureip -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.BD_counter_display

do {wave.do}

view wave
view structure
view signals

do {BD_counter_display.udo}

run -all

quit -force
