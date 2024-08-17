#!/usr/bin/env python3

import json
import os
import re
import pandas as pd
import matplotlib.pyplot as plt




def toMarkdown(df,params,pmos=False):
    ss = ""
    if(pmos):
        ss += "\n\n### PCH\n\n"
        df = df[df["isPmos"]== 1]
    else:
        ss += "\n\n### NCH\n\n"
        df = df[df["isPmos"]== 0]
    dfg = df.groupby(["Name"])
    dfa =  dfg[params].median().reset_index()
    ss += dfa.to_markdown(index=False)

    return ss




df = pd.read_csv("all.csv")


ss = "# Transistors"

ss += "\n\n## Medium inversion\n\n"
ss += toMarkdown(df,["gmid10_vgs","gmid10_id"],pmos=False)
ss += toMarkdown(df,["gmid10_vgs","gmid10_id"],pmos=True)

ss +="\n\n## Weak inversion\n\n"
ss += toMarkdown(df,["gmid15_vgs","gmid15_id"],pmos=False)
ss += toMarkdown(df,["gmid15_vgs","gmid15_id"],pmos=True)

with open("README.md","w") as fo:
    fo.write(ss)
