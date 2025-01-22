v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {State dependent feedback
- If SCO is 0, input was 1, then PMOS pulls N2 to AVSS, making it harder to pull up SCO
- If SCO is 1, input was 0, then NMOS pulls N1 to AVDD, making it harder to pull down SCO} 10 -130 0 0 0.3 0.3 {}
T {Schmitt trigger} 350 -720 0 0 1 1 {}
N 330 -260 350 -260 {lab=N1}
N 270 -230 290 -230 {lab=A}
N 330 -230 350 -230 {lab=AVSS}
N 270 -320 290 -320 {lab=A}
N 330 -320 350 -320 {lab=AVSS}
N 470 -320 490 -320 {lab=SCO}
N 530 -320 550 -320 {lab=AVSS}
N 650 -320 670 -320 {lab=SCO}
N 710 -320 730 -320 {lab=AVSS}
N 900 -230 920 -230 {lab=SCO}
N 960 -230 980 -230 {lab=AVSS}
N 330 -520 350 -520 {lab=N2}
N 270 -550 290 -550 {lab=A}
N 330 -550 350 -550 {lab=AVDD}
N 270 -460 290 -460 {lab=A}
N 330 -460 350 -460 {lab=AVDD}
N 900 -550 920 -550 {lab=SCO}
N 960 -550 980 -550 {lab=AVDD}
N 510 -520 710 -520 {lab=N2}
N 350 -520 510 -520 {lab=N2}
N 330 -520 330 -490 {lab=N2}
N 330 -610 330 -580 {lab=AVDD}
N 330 -610 960 -610 {lab=AVDD}
N 960 -610 960 -580 {lab=AVDD}
N 350 -610 350 -550 {lab=AVDD}
N 980 -610 980 -550 {lab=AVDD}
N 960 -610 980 -610 {lab=AVDD}
N 350 -460 380 -460 {lab=AVDD}
N 380 -610 380 -460 {lab=AVDD}
N 330 -430 330 -350 {lab=SCO}
N 330 -420 480 -420 {lab=SCO}
N 480 -420 680 -420 {lab=SCO}
N 900 -550 900 -420 {lab=SCO}
N 680 -420 900 -420 {lab=SCO}
N 330 -290 530 -290 {lab=N1}
N 530 -290 710 -290 {lab=N1}
N 330 -290 330 -260 {lab=N1}
N 330 -200 330 -170 {lab=AVSS}
N 330 -170 960 -170 {lab=AVSS}
N 960 -200 960 -170 {lab=AVSS}
N 350 -230 350 -170 {lab=AVSS}
N 980 -230 980 -170 {lab=AVSS}
N 960 -170 980 -170 {lab=AVSS}
N 960 -520 960 -260 {lab=Y}
N 900 -420 900 -230 {lab=SCO}
N 470 -420 470 -320 {lab=SCO}
N 650 -420 650 -320 {lab=SCO}
N 550 -320 550 -170 {lab=AVSS}
N 730 -320 730 -170 {lab=AVSS}
N 610 -610 610 -350 {lab=AVDD}
N 350 -320 390 -320 {lab=AVSS}
N 390 -320 390 -170 {lab=AVSS}
N 270 -550 270 -460 {lab=A}
N 270 -460 270 -320 {lab=A}
N 270 -320 270 -230 {lab=A}
N 220 -390 270 -390 {lab=A}
N 220 -610 330 -610 {lab=AVDD}
N 220 -170 330 -170 {lab=AVSS}
N 470 -490 490 -490 {lab=SCO}
N 470 -490 470 -420 {lab=SCO}
N 530 -490 610 -490 {lab=AVDD}
N 710 -490 750 -490 {lab=AVDD}
N 750 -610 750 -490 {lab=AVDD}
N 530 -350 710 -350 {lab=AVDD}
N 550 -460 550 -320 {lab=AVSS}
N 530 -460 710 -460 {lab=AVSS}
N 650 -490 670 -490 {lab=SCO}
N 650 -490 650 -420 {lab=SCO}
C {devices/ipin.sym} 220 -390 0 0 {name=p0 lab=A}
C {devices/opin.sym} 960 -380 0 0 {name=p1 lab=Y}
C {devices/ipin.sym} 220 -610 0 0 {name=p2 lab=AVDD}
C {devices/ipin.sym} 220 -170 0 0 {name=p3 lab=AVSS}
C {JNW_TR_SKY130A/JNWTR_NCHDL.sym} 290 -230 0 0 {name=XXA2}
C {devices/lab_pin.sym} 350 -260 2 0 {name=l0 sig_type=std_logic lab=N1 }
C {JNW_TR_SKY130A/JNWTR_NCHDL.sym} 290 -320 0 0 {name=XXA3}
C {devices/lab_pin.sym} 330 -380 2 0 {name=l4 sig_type=std_logic lab=SCO }
C {JNW_TR_SKY130A/JNWTR_NCHDL.sym} 490 -320 0 0 {name=XXA4a}
C {JNW_TR_SKY130A/JNWTR_NCHDL.sym} 670 -320 0 0 {name=XXA4b}
C {JNW_TR_SKY130A/JNWTR_NCHDL.sym} 920 -230 0 0 {name=XXA5}
C {JNW_TR_SKY130A/JNWTR_PCHDL.sym} 290 -550 0 0 {name=XXB0}
C {devices/lab_pin.sym} 330 -500 2 0 {name=l20 sig_type=std_logic lab=N2 }
C {JNW_TR_SKY130A/JNWTR_PCHDL.sym} 290 -460 0 0 {name=XXB1}
C {JNW_TR_SKY130A/JNWTR_PCHDL.sym} 490 -490 0 0 {name=XXB3a}
C {JNW_TR_SKY130A/JNWTR_PCHDL.sym} 670 -490 0 0 {name=XXB3b}
C {JNW_TR_SKY130A/JNWTR_PCHDL.sym} 920 -550 0 0 {name=XXB4}
C {cborder/border_xs.sym} 0 0 0 0 {user="Carsten Wulff" company="Wulff Consulting AS"}
