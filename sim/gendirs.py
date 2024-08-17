#!/usr/bin/env python3

import json
import os
import re

obj =  {"NCHDL","PCHDL"}

prefix = "JNWTR"
nch = "NCHDL"
ch_dir = "template"
ch_template = [
    "Makefile",
    "cicsim.yaml",
    "dc.meas",
    "dc.spi",
    "dc.yaml",
    "summary.yaml"
]

#- Generate NMOS
for name in obj:
    dirname = prefix + "_" + name
    if(not os.path.exists(dirname)):
        os.makedirs(dirname)

    isPmos = not name.startswith(f"NCH")

    for f in ch_template:
        fsrc = ch_dir + "/" + f
        fdst = dirname + "/" + f
        with open(fsrc) as fi:
            with open(fdst,"w") as fo:
                for line in fi:
                    if(isPmos):
                        line = re.sub("nfet","pfet",line)
                        line = re.sub("VD D 0","VD 0 D",line)
                        line = re.sub("VG G 0","VG 0 G",line)

                    line = re.sub(nch,name,line)

                    fo.write(line)
        os.system(f"git add {fdst}")
    os.system(f"git add {dirname}/results/*.csv")
    os.system(f"git add {dirname}/README.md")
