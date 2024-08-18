#!/usr/bin/env python3
import re

#- For some reason the RPPO resistors are off by 0.16 um. I
# I can't figure out why, so why not hack the schematic. Not an ideal solution, nor a good solution,
# but reduces the noise for my students


def replaceLength(fname):
    with open(fname) as fi:
        buff = fi.read()

    ar = re.findall(r"L=(\S+)\n",buff,re.MULTILINE)

    for a in ar:
        v = float(a)+0.16
        buff = re.sub(f"L={a}",f"L={v}",buff)

    with open(fname,"w") as fo:
        fo.write(buff)
for n in (2, 4, 8, 16):
    replaceLength(f"../design/JNW_TR_SKY130A/JNWTR_RES{n}.sch")
