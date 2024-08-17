
# JNW_TR_SKY130A

# Who
Carsten Wulff carsten@wulff.no

# Why
Library with digital cells, and standard transistors

# How
 Made with [ciccreator](https://github.com/wulffern/ciccreator). Source files in
 `cic/`
 

# What

| What      | Path                                                                         | Comment    |
|:----------|:-----------------------------------------------------------------------------|:-----------|
| Schematic | [design/JNW_TR_SKY130A/JNWTR_TOP.sch](design/JNW_TR_SKY130A/JNWTR_TOP.sch) |            |
| Layout    | [design/JNW_TR_SKY130A/JNWTR_TOP.mag](design/JNW_TR_SKY130A/JNWTR_TOP.mag) |            |
| Verilog   | [design/JNW_TR_SKY130A.v](design/JNW_TR_SKY130A.v)                         | Not tested |




# Changelog/Plan
| Version | Status | Comment                        |
|:--------|:-------|:-------------------------------|
| 0.1.0   | :white_check_mark:    | Initial version of the library |


# Transistors
| Cell        | Description |
|:------------|:------------|
| JNWTR_NCHDL | Unit NMOS   |
| JNWTR_PCHDL | Unit PMOS   |


| Name   |   gmid10_vgs |   gmid10_id |
|:-------|-------------:|------------:|
| NCHDL  |      806.916 |     22.8402 |
| PCHDL  |     -841.475 |     5.22893 |


 
# Digital cells

| Cell              | Description                                         |
|:------------------|:----------------------------------------------------|
| JNWTR_ANX1_CV     | AND                                                 |
| JNWTR_BFX1_CV     | Buffer                                              |
| JNWTR_DFRNQNX1_CV | D Flip-flop with inverted output and inverted reset |
| JNWTR_IVTRIX1_CV  | Tristate inverter, enable                           |
| JNWTR_IVX1_CV     | Inverter                                            |
| JNWTR_NDTRIX1_CV  | Tristate NAND                                       |
| JNWTR_NDX1_CV     | NAND                                                |
| JNWTR_NRX1_CV     | NOR                                                 |
| JNWTR_ORX1_CV     | OR                                                  |
| JNWTR_SCX1_CV     | Schmitt-trigger                                     |
| JNWTR_TAPCELLB_CV | Bulk connection                                     |
| JNWTR_TIEH_CV     | Tie high                                            |
| JNWTR_TIEL_CV     | Tie low                                             |




# Key parameters
| Parameter           | Min     | Typ           | Max     | Unit  |
| :---                | :-:     | :-:           | :-:     | :---: |
| Technology          |         | SKY130A  |         |       |
| AVDD                | 1.7    | 1.8           | 1.9    | V     |
| Temperature         | -40     | 27            | 125     | C     |


