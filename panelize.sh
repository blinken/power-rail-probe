#!/bin/bash

kikit panelize  \
  --layout 'grid; rows: 1; cols: 1; space: 3mm;' \
  --source 'tolerance: 100mm' \
  --cuts vcuts \
  --framing 'frame; width: 5mm; space: 0mm;' \
  --tooling '3hole; hoffset: 2.5mm; voffset: 2.5mm; size: 1.5mm' \
  --fiducials '3fid; hoffset: 10mm; voffset: 2.5mm; coppersize: 2mm; opening: 1mm;' \
  --text 'simple; text: low noise power probe v2.0 JLCJLCJLCJLC; anchor: mt; voffset: 2.5mm; hjustify: center; vjustify: center;' \
  --post 'millradius: 1mm' \
  low-noise-power-probe.kicad_pcb low-noise-power-probe-panel.kicad_pcb
