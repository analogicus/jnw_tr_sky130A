
include ../tech/make/sim.make

#include ../cic/cells

LIB=JNW_TR_SKY130A
CELL=JNW_TR
PREFIX=JNWTR_

CELLS= NCHDL PCHDL

all:
	cd IVX1_CV; make all
	cd RPPO; make all
	${foreach c, ${CELLS}, ${MAKE} run NAME=${c};}


test:
	${MAKE} run CORNER="typical" NAME=NCHDL


post:
	${foreach c, ${CELLS}, cat header.md ${PREFIX}${c}/README.md > ../docs/${PREFIX}${c}.md;}

run:
	test -d ${PREFIX}${NAME} && cd ${PREFIX}${NAME} && make ${CORNER} OPT=${OPT}

gen:
	python3 gendirs.py

parse:
	python3 parse.py

summary:
	python3 plot.py
	cat header.md README.md > ../docs/_mos/all.md
