#!/usr/bin/env python3

import json
import os
import re
import pandas as pd

#with open("../cic/cells.json") as fi:
#    obj = json.load(fi)

obj =  {"NCHDL","PCHDL"}


prefix = "JNWTR"

typ = "/results/dc_Sch_typical.csv"
etc = "/results/dc_Sch_etc.csv"

dfs = list()
for name in obj:


    dirname = prefix + "_" + name
    isPmos = not name.startswith(f"NCH")

    ftyp = dirname + typ
    dtyp = pd.read_csv(ftyp)
    fetc = dirname + etc
    if(os.path.exists(fetc)):
        detc = pd.read_csv(fetc)
        df = pd.concat([dtyp,detc])
    else:
        df = dtyp
    df["Name"] = name
    #conts = re.findall("CH_(\d+)C",name)
    #lengths = re.findall("CH_\d+C(\d+F\d+)",name   )
    if(isPmos):
        df["isPmos"] = 1
    else:
        df["isPmos"] = 0
    #df["Contacts"] = int(conts[0])
    #df["Length"] = float(lengths[0].replace("F","."))

    dfs.append(df)



dfa = pd.concat(dfs)
dfa.to_csv("all.csv")
