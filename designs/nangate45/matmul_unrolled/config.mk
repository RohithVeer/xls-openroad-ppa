export DESIGN_NAME = matmul_unrolled
export PLATFORM = nangate45

export VERILOG_FILES = \
/home/rv/GSOC-2026/rtl/matmul_unrolled.v

export SDC_FILE = /home/rv/GSOC-2026/OpenROAD-flow-scripts/flow/designs/nangate45/matmul_unrolled/constraint.sdc

export CLOCK_PORT = clk
export CLOCK_PERIOD = 5.0

export CORE_UTILIZATION = 40
export PLACE_DENSITY = 0.6
