v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 510 -230 530 -230 {lab=A}
N 570 -300 590 -300 {lab=Y}
N 510 -330 530 -330 {lab=A}
N 570 -400 570 -360 {lab=AVDD}
N 360 -400 570 -400 {lab=AVDD}
N 360 -150 570 -150 {lab=AVSS}
N 570 -200 570 -150 {lab=AVSS}
N 570 -230 600 -230 {lab=AVSS}
N 600 -230 600 -200 {lab=AVSS}
N 570 -200 600 -200 {lab=AVSS}
N 510 -260 570 -260 {lab=A}
N 510 -260 510 -230 {lab=A}
N 510 -330 510 -260 {lab=A}
N 590 -300 660 -300 {lab=Y}
N 570 -330 600 -330 {lab=AVDD}
N 600 -360 600 -330 {lab=AVDD}
N 570 -360 600 -360 {lab=AVDD}
C {devices/iopin.sym} 660 -300 0 0 {name=p0 lab=Y}
C {devices/iopin.sym} 360 -400 0 1 {name=p1 lab=AVDD}
C {devices/iopin.sym} 360 -150 0 1 {name=p2 lab=AVSS}
C {JNW_TR_SKY130A/JNWTR_NCHDL.sym} 530 -230 0 0 {name=XMN0}
C {JNW_TR_SKY130A/JNWTR_PCHDL.sym} 530 -330 0 0 {name=XMP0}
C {devices/lab_pin.sym} 510 -330 0 0 {name=l5 sig_type=std_logic lab=A }
C {cborder/border_xs.sym} 0 0 0 0 {user="Carsten Wulff" company="Wulff Consulting"}
