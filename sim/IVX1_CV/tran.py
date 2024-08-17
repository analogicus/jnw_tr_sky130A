#!/usr/bin/env python3

#!/usr/bin/env python3
import pandas as pd
import yaml

def main(name):
    yamlfile = name + ".yaml"
    # Read result yaml file
    with open(yamlfile) as fi:
        obj = yaml.safe_load(fi)


    obj["tpd"] = (obj["tpdr"] + obj["tpdf"])/2

    # Save new yaml file
    with open(yamlfile,"w") as fo:
        yaml.dump(obj,fo)
