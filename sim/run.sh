#!/bin/bash

echo "Compiling RTL..."
iverilog -g2012 ../rtl/*.v -o test.out

echo "Running simulation..."
vvp test.out

echo "Opening GTKWave..."
gtkwave wave.vcd
