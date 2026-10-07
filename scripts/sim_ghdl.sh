#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# sim_ghdl.sh - run the testbenches with GHDL (no Vivado needed)
#
#   ./scripts/sim_ghdl.sh          # capture unit test only (~2 s)
#   ./scripts/sim_ghdl.sh full     # + full-system test, renders VGA frames
#                                  #   to build/frame_*.png (~6 min)
# -----------------------------------------------------------------------------
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$root/build"
cd "$root/build"
rm -f work-obj08.cf

for f in la_pkg btn_debounce test_pattern capture_ctrl sample_ram vga_timing \
         ui_ctrl display seg7_ctrl la_top; do
    ghdl -a --std=08 "$root/rtl/$f.vhd"
done
ghdl -a --std=08 "$root/sim/tb_capture.vhd" "$root/sim/tb_la_top.vhd"

ghdl -e --std=08 tb_capture
ghdl -r --std=08 tb_capture

if [[ "${1:-}" == "full" ]]; then
    ghdl -e --std=08 -O2 tb_la_top
    ghdl -r --std=08 tb_la_top
    python3 "$root/scripts/ppm2png.py" frame_overview.ppm frame_zoomed.ppm
fi
