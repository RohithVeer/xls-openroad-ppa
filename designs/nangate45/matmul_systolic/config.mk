export DESIGN_NAME = matmul_systolic
export PLATFORM = nangate45

export VERILOG_FILES = \
/home/rv/GSOC-2026/rtl/matmul_systolic.v \
/home/rv/GSOC-2026/rtl/pe.v

export SDC_FILE = /home/rv/GSOC-2026/OpenROAD-flow-scripts/flow/designs/nangate45/matmul_systolic/constraint.sdc

export CLOCK_PORT = clk
export CLOCK_PERIOD = 5.0

# Floorplan settings
export CORE_UTILIZATION = 40
export PLACE_DENSITY = 0.6
