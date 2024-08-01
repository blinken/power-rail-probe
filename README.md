# Power rail probe

<img src="./doc/v1.0.1/1.0.1-3-2000.JPG" />

**An Open Hardware low-noise power rail oscilloscope probe**, loosely based on the excellent writeup by
[Andrew Levido](https://circuitcellar.com/research-design-hub/projects/building-a-power-rail-probe/)
[[PDF archive](doc/circuit_cellar-building_a_power_rail_probe.pdf)].

The probe allows you to measure millivolt-level ripple on a power rail up to 20V,
using a normal oscilloscope, by applying a vertical offset. This open design costs <10% of the price of the [Tektronix TPR1000](https://www.tek.com/en/datasheet/active-power-rail-probes).

Here's how it works:

<img src="./doc/diagram.png" alt="Connection diagram" width="700">

<img src="./doc/example-measurement-20V-rail.png" alt="Example measurement showing ~50mV ripple on a 20V rail" width="700">

*Measurement of 60mV p-p ripple on a 20V rail (ie. ripple 19.97V - 20.03V) using an inexpensive [Picoscope 2204A](https://www.picotech.com/oscilloscope/2000/picoscope-2000-specifications)*

The probe is directly connected to a power rail you're interested in (eg, via a
1X oscilloscope probe, or a direct cable connection).  AC is passed, and an
adjustable offset is applied to the DC voltage. The offset is fixed, allowing
DC sag and drift to be examined.

Your oscilloscope sees 0V DC, allowing power supply ripple and transients to be
viewed at the 1 mV/div setting, rather than 5 V/div. It's effectively a much
more powerful DC offset function for your oscilloscope.

## Specifications

### v1.0.1

 * Max voltage offset ±20V
 * Input impedance 50kΩ (0 - 30kHz) / 50Ω (30kHz - 1GHz)
 * Average signal attenuation of 1:1.2 (-0.9 dB +/- 1dB)
 * Frequency response (S12) flat within 1dB through 490MHz
 * Noise <500 µV<sub>p-p</sub> over full bandwidth
 * Active signal range ±1V
 * Indication of over-range signal (above or below offset setting)
 * High-precision Nidec M-1305 5-turn potentiometer for accurate offset adjustment
 * Isolation between chassis/USB and BNC test connectors
 * Battery powered to minimise noise
 * Li-Ion 18650 batteries rechargeable via USB-C connector (9V+ USB-PD supply required) or via DC barrel jack

The probe should be connected to an oscilloscope set to 50-ohm input impedance, and
works best with inputs <1-ohm impedance.

[Feedback and comments on the design](https://github.com/blinken/power-rail-probe/issues) are very much appreciated.

## How to buy

Version 1.0 is available [to purchase fully assembled here](https://paradar.co.uk/products/low-noise-oscilloscope-power-rail-probe)
for approx. £249 (USD $317, EUR €287). Purchasing a fully assembled unit helps to fund development!

If you would like to assemble the v1.0 probe yourself, blank PCBs, enclosures
and machined front panels are also available at [paradar.co.uk](https://paradar.co.uk/products/low-noise-oscilloscope-power-rail-probe).

Gerber files and a full BOM & schematic are available below under a CC BY-SA 4.0 license.

## Versions

The project is under active development, and there are several versions:

| Version | Status | Description | Performance |
| ------- | ------ | ----------- | ---------- |
| [v1.0](https://github.com/blinken/power-rail-probe/tree/v1.0) | Completed | Initial proof-of-concept | Functions well. Frequency response flat within 1.3dB to 500MHz. Similar (or slightly better) noise levels vs v1.1 |
| v1.0.1 | Complete, characterised and [available](https://paradar.co.uk/products/low-noise-oscilloscope-power-rail-probe) | Fix bugs from 1.0 and improve manufacturability | Untested, but likely to be identical to v1.0 |
| v1.1 | Simulation complete | Includes additional compensation & lessons learned from v1.0 | Untested. Frequency response estimated from simulation as flat to within 0.5dB to 1GHz |

## Schematic

### v1.0

[[PDF](doc/schematic.pdf)] [[KiCanvas](https://kicanvas.org/?github=https%3A%2F%2Fgithub.com%2Fblinken%2Fpower-rail-probe%2Fblob%2Fv1.0%2Flow-noise-power-probe.kicad_sch)]

<img src="./doc/schematic.png" alt="Power rail probe, schematic" width="700">

### v1.0.1

[[KiCanvas](https://kicanvas.org/?github=https%3A%2F%2Fgithub.com%2Fblinken%2Fpower-rail-probe%2Fblob%2Fmain%2Flow-noise-power-probe.kicad_sch)]

## Layout

### v1.0

[[PDF](doc/layout.pdf)] [[KiCanvas](https://kicanvas.org/?github=https%3A%2F%2Fgithub.com%2Fblinken%2Fpower-rail-probe%2Fblob%2Fv1.0%2Flow-noise-power-probe.kicad_pcb)]

<img src="./doc/layout.png" alt="Power rail probe, PCB layout" width="700">

### v1.0.1

This version is under active development.

[[KiCanvas](https://kicanvas.org/?github=https%3A%2F%2Fgithub.com%2Fblinken%2Fpower-rail-probe%2Fblob%2Fmain%2Flow-noise-power-probe.kicad_pcb)]

## Frequency response

### v1.0.1

The probe's frequency response is flat within 1dB between approximately 3MHz and 490MHz, and flat within 2.5dB between approximately 150kHz and 550Mhz.

<img src="./doc/v1.0.1/1.0.1-fr-3.jpg" alt="Chart of frequency response from 5MHz to 700MHz" width="700">

<img src="./doc/v1.0.1/1.0.1-fr-2.jpg" alt="Chart of frequency response from 200kHz to 10MHz" width="700">

<img src="./doc/v1.0.1/1.0.1-fr-1.jpg" alt="Chart of frequency response from 10kHz to 300kHz" width="700">

### v1.0

Performance is flat within 1.3dB to 500MHz, aside from a 3.7dB dip at approx 1.2MHz.

<img src="./doc/v1.0/characterisation/freq-S12-5MHz.jpg" alt="Chart of frequency response from 300kHz to 5MHz" width="700">

<img src="./doc/v1.0/characterisation/freq-S12-500MHz.jpg" alt="Chart of frequency response from 300kHz to 500MHz" width="700">

### v1.1

This version has not yet been manufactured, and the results below are from simulation in SPICE.

Frequency response is flat within 0.5dB to 1GHz, with the exception of a 2.5dB peak at 71.8kHz.

<img src="./doc/v1.1/spice/v1.1-ac-response.jpg" alt="Chart frequency response 10Hz and 1GHz" width="700">

The chart above was obtained through simulation with TINA-TI SPICE, assuming an
input impedance of 0.1Ω. Measuring the frequency response with a 50Ω source
(ie. a standard VNA) will produce different results.

[[Simulation files](./doc/v1.1/spice)]

## Noise analysis

The design aims to minimise the noise introduced by the instrument. Low-noise
operation is achieved with battery operation, and by avoiding semiconductors in
the critical path.  Batteries are recharged when the instrument is turned off.

### v1.0 & v1.1

The total noise introduced by the probe ([simulated in TINA-TI SPICE v9](./doc/v1.1/spice)) is
78.7 µVrms when measuring over the total instrument bandwidth 10Hz and 1GHz.

The noise introduced depends on the bandwidth of the measurement. Reducing the
measured bandwidth will reduce the noise introduced, and so the numbers below
are a worst-case upper limit. For example, a measurement between 10kHz and
20kHz, the probe will introduce 12.9 µVrms noise (-84.8 dBm).

| Measurement bandwidth  | Total RMS noise | Total peak-to-peak noise (6σ) | Power (Z<sub>0</sub>=50Ω) |
| --- | --- | --- | --- |
| 10Hz - 10kHz | 12.9 µV<sub>rms</sub> | 77.4 µV<sub>p-p</sub> | -84.8 dBm |
| 1kHz - 10kHz | 11.9 µV<sub>rms</sub> | 71.4 µV<sub>p-p</sub> | -85.5 dBm |
| 10Hz - 100kHz | 76.3 µV<sub>rms</sub> | 457.8 µV<sub>p-p</sub> | -69.3 dBm |
| 10Hz - 1MHz | 78.4 µV<sub>rms</sub> | 470.4 µV<sub>p-p</sub> | -69.1 dBm |
| 10Hz - 10MHz | 78.5 µV<sub>rms</sub> | 471.0 µV<sub>p-p</sub> | -69.1 dBm |
| 10Hz - 100MHz | 78.5 µV<sub>rms</sub> | 471.0 µV<sub>p-p</sub> | -69.1 dBm |
| 10Hz - 1GHz | 78.7 µV<sub>rms</sub> | 472.2 µV<sub>p-p</sub> | -69.1 dBm |

<img src="./doc/v1.1/spice/v1.1-total-noise.jpg" alt="Chart of total noise between 10Hz and 1GHz" width="700">

<img src="./doc/v1.1/spice/v1.1-output-noise.jpg" alt="Chart of output noise between 10Hz and 1GHz" width="700">


## Bill of materials

### v1.0

[[CSV](./bom/low-noise-power-probe-bom-pcba.csv)]

 * [LMP7731](https://www.ti.com/lit/ds/symlink/lmp7731.pdf) Ultra-low noise precision RRIO opamp
 * [OPA322](https://www.ti.com/lit/ds/symlink/opa322.pdf) 20-MHz low-noise 1.8-V RRIO opamp
 * [ADP7142AUJZ-2.5](https://www.analog.com/media/en/technical-documentation/data-sheets/ADP7142.pdf) +2.5V 200 mA low noise LDO Linear Regulator
 * [ADP7182AUJZ-2.5](https://www.analog.com/media/en/technical-documentation/data-sheets/ADP7182.pdf) -2.5V 200 mA low noise LDO Linear Regulator
 * [MCP73213T-A6SI/MF](https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/DataSheets/20002190D.pdf) Dual-cell, Li-Ion/Li-Polymer charge management controller, 8.4V float
 * [HUSB238](https://en.hynetek.com/uploadfiles/site/219/news/1ad9e8fa-b39c-46a5-a984-152771d4ac69.pdf) Standalone USB PD sink controller
 * 2x [Amphenol 031-5431-10RFX](https://www.farnell.com/cad/2353820.pdf) isolated BNC connectors
 * [Multicomp 1M31T2B4M7QE](https://www.farnell.com/datasheets/1810474.pdf) 3PDT switch
 * [Molex 105450-0101](https://www.molex.com/en-us/products/part-detail/1054500101) USB-C receptacle
 * [Nidec M-1303](https://www.mouser.co.uk/datasheet/2/972/m-1827099.pdf) 5k 3-turn potentiometer
 * [DC050-T](https://datasheet.lcsc.com/lcsc/1912111437_SHOU-HAN-DC050-T_C431534.pdf) barrel jack connector
 * Selection of SMD resistors, capacitors, LEDs and diodes as marked
 * An aluminium extrusion case suitable for a 70x114mm board - eg, [AliExpress](https://www.aliexpress.com/item/1005003326971939.html)

A blank PCB, aluminium extrusion case and machined front/rear panels can be purchased as a kit from [paradar.co.uk](https://paradar.co.uk/products/low-noise-oscilloscope-power-rail-probe?variant=43212423233713).

<img src="./doc/case.png" alt="Aluminium enclosure 70x115mm internal size" width="400">
<img src="./doc/case-diagram.png" alt="Aluminium enclosure, diagram with dimensions" width="400">

## Front/rear panel layout

### v1.0

Click to expand.

<img src="./doc/front-panel-sketch.png" alt="Power rail probe, front panel layout diagram" width="400">
<img src="./doc/rear-panel-sketch.png" alt="Power rail probe, rear panel layout diagram" width="400">

## License

[CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)
