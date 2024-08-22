
#- Core makefile provides the following commands
# ip: generate ../design/<LIB> from ../cic/ip.json
# gds: generate gds/<CELL>.gds
# cdl: generate cdl/<CELL>.cdl
# lvs: Check cdl/<CELL>.cdl versus ../design/<LIB>/<CELL>.mag
# lpe: Extract parasitics lpe/<CELL>.spi
# drc: Run design rule checks on ../design/<LIB>/<CELL>.mag
include ../tech/make/core.make

LIB=JNW_TR_SKY130A
CELL=TOP
PREFIX=JNWTR_
#- Provide cells you want to check for the lvsall drcall commands
#CELLS = SUN_TR NCHDL PCHDL PCHL NCHL NCHDLA PCHDLA PCHDLCM NCHDLCM NCHLA PCHLA PCHLCM NCHLCM NCHDLCM2 PCHDLCM2 CPCHDLCM2 CNCHDLCM2 RG12TRIX1_CV CAP_10 CAP_20

CELLS = ANX1_CV ANX2_CV ANX4_CV ANX8_CV BFX1_CV  DFRNQNX1_CV DFTRIX1_CV DFTSPCX1_CV IVTRIX1_CV IVX1_CV IVX2_CV IVX4_CV IVX8_CV NCHDL NCHDLA NCHDLCM NCHDLCM2 NCHDLR NCHL NCHLA NCHLCM NDTRIX1_CV NDX1_CV NRTRIX1_CV NRX1_CV ORX1_CV ORX2_CV ORX4_CV PCHDL RG12TRIX1_CV RPPO16 RPPO2 RPPO4 RPPO8 SCX1_CV SUN_TR SWX2_CV SWX4_CV TAPCELLB_CV TGPD_CV TIEH_CV TIEL_CV

test:
	make xsch xlvs CELL=NCHDL
