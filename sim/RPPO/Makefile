
######################################################################
##        Copyright (c) 2022 Carsten Wulff Software, Norway
## ###################################################################
## Created       : wulff at 2022-4-27
## ###################################################################
##  The MIT License (MIT)
##
##  Permission is hereby granted, free of charge, to any person obtaining a copy
##  of this software and associated documentation files (the "Software"), to deal
##  in the Software without restriction, including without limitation the rights
##  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
##  copies of the Software, and to permit persons to whom the Software is
##  furnished to do so, subject to the following conditions:
##
##  The above copyright notice and this permission notice shall be included in all
##  copies or substantial portions of the Software.
##
##  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
##  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
##  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
##  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
##  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
##  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
##  SOFTWARE.
##
######################################################################


include ../../tech/make/sim.make

TB=dc
VIEW=Sch

CELL=JNWTR_TOP
LIB =JNW_TR_SKY130A
#VIEW=Lay
#VIEW=Ver

OPT=

all:
	make typical tfs mc temp summary

typical: netlist
	cicsim run  --name ${VIEW}_typical ${TB} ${COPT} ${VIEW} ${MODE} Gt Ktt Tt Vt

tfs: netlist
	cicsim run  --name ${VIEW}_tfs ${TB} ${COPT} ${VIEW} ${MODE} Gt "Ktt,Kss,Kff" "Tt" "Vt"

mc: netlist
	cicsim run  --name ${VIEW}_mc --count 10 ${TB} ${COPT} ${VIEW} ${MODE} Gt "Kttmm" "Tt" "Vt"

temp: netlist
	cicsim run  --name ${VIEW}_temp ${TB} ${COPT} ${VIEW} ${MODE} Gt "Ktt" "Tt,Th,Tl" Vt

summary:
	cicsim summary --output "README.md"


clean:
	-rm -rf build
	-rm -rf clvs cdrc
	-rm *.ext
	-rm -rf output_*
	-rm -rf __pycache__
	-rm *.run
	-rm *.pdf
	-rm *.csv
