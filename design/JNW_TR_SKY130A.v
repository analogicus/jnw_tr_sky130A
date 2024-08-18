
//-------------------------------------------------------------
// JNWTR_PCHDL <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_PCHDL(D,G,S,B);
input logic G;
input logic S;
input logic B;
input logic D;
endmodule

//-------------------------------------------------------------
// JNWTR_NCHDL <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_NCHDL(D,G,S,B);
input logic G;
input logic S;
input logic B;
input logic D;
endmodule

//-------------------------------------------------------------
// JNWTR_RES2 <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_RES2(N,P,B);
input logic N;
input logic P;
endmodule

//-------------------------------------------------------------
// JNWTR_RES4 <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_RES4(N,P,B);
input logic N;
input logic P;
endmodule

//-------------------------------------------------------------
// JNWTR_RES8 <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_RES8(N,P,B);
input logic N;
input logic P;
endmodule

//-------------------------------------------------------------
// JNWTR_RES16 <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_RES16(N,P,B);
input logic N;
input logic P;
endmodule

//-------------------------------------------------------------
// JNWTR_RPPO2 <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_RPPO2(P,N,B);
input logic B;
input logic P;
input logic N;
JNWTR_RES2 XA1 (N,P,B);
endmodule

//-------------------------------------------------------------
// JNWTR_RPPO4 <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_RPPO4(P,N,B);
input logic B;
input logic P;
input logic N;
JNWTR_RES4 XA1 (N,P,B);
endmodule

//-------------------------------------------------------------
// JNWTR_RPPO8 <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_RPPO8(P,N,B);
input logic B;
input logic P;
input logic N;
JNWTR_RES8 XA1 (N,P,B);
endmodule

//-------------------------------------------------------------
// JNWTR_RPPO16 <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_RPPO16(P,N,B);
input logic B;
input logic P;
input logic N;
JNWTR_RES16 XA1 (N,P,B);
endmodule

//-------------------------------------------------------------
// JNWTR_TAPCELLB_CV <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_TAPCELLB_CV(AVDD,AVSS);
input logic AVDD;
input logic AVSS;
JNWTR_NCHDL MN1 (AVSS,AVSS,AVSS,AVSS);
JNWTR_PCHDL MP1 (AVDD,AVDD,AVDD,AVDD);
endmodule

//-------------------------------------------------------------
// JNWTR_TIEH_CV <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_TIEH_CV(Y,AVDD,AVSS);
input logic Y;
input logic AVDD;
input logic AVSS;
JNWTR_NCHDL MN0 (A,A,AVSS,AVSS);
JNWTR_PCHDL MP0 (Y,A,AVDD,AVDD);
endmodule

//-------------------------------------------------------------
// JNWTR_TIEL_CV <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_TIEL_CV(Y,AVDD,AVSS);
input logic Y;
input logic AVDD;
input logic AVSS;
JNWTR_NCHDL MN0 (Y,A,AVSS,AVSS);
JNWTR_PCHDL MP0 (A,A,AVDD,AVDD);
endmodule

//-------------------------------------------------------------
// JNWTR_IVX1_CV <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_IVX1_CV(A,Y,AVDD,AVSS);
input logic A;
input logic Y;
input logic AVDD;
input logic AVSS;
JNWTR_NCHDL MN0 (Y,A,AVSS,AVSS);
JNWTR_PCHDL MP0 (Y,A,AVDD,AVDD);
endmodule

//-------------------------------------------------------------
// JNWTR_IVX2_CV <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_IVX2_CV(A,Y,AVDD,AVSS);
input logic A;
input logic Y;
input logic AVDD;
input logic AVSS;
JNWTR_NCHDL MN0 (Y,A,AVSS,AVSS);
JNWTR_NCHDL MN1 (AVSS,A,Y,AVSS);
JNWTR_PCHDL MP0 (Y,A,AVDD,AVDD);
JNWTR_PCHDL MP1 (AVDD,A,Y,AVDD);
endmodule

//-------------------------------------------------------------
// JNWTR_IVX4_CV <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_IVX4_CV(A,Y,AVDD,AVSS);
input logic A;
input logic Y;
input logic AVDD;
input logic AVSS;
JNWTR_NCHDL MN0 (Y,A,AVSS,AVSS);
JNWTR_NCHDL MN1 (AVSS,A,Y,AVSS);
JNWTR_NCHDL MN2 (Y,A,AVSS,AVSS);
JNWTR_NCHDL MN3 (AVSS,A,Y,AVSS);
JNWTR_PCHDL MP0 (Y,A,AVDD,AVDD);
JNWTR_PCHDL MP1 (AVDD,A,Y,AVDD);
JNWTR_PCHDL MP2 (Y,A,AVDD,AVDD);
JNWTR_PCHDL MP3 (AVDD,A,Y,AVDD);
endmodule

//-------------------------------------------------------------
// JNWTR_IVX8_CV <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_IVX8_CV(A,Y,AVDD,AVSS);
input logic A;
input logic Y;
input logic AVDD;
input logic AVSS;
JNWTR_NCHDL MN0 (Y,A,AVSS,AVSS);
JNWTR_NCHDL MN1 (AVSS,A,Y,AVSS);
JNWTR_NCHDL MN2 (Y,A,AVSS,AVSS);
JNWTR_NCHDL MN3 (AVSS,A,Y,AVSS);
JNWTR_NCHDL MN4 (Y,A,AVSS,AVSS);
JNWTR_NCHDL MN5 (AVSS,A,Y,AVSS);
JNWTR_NCHDL MN6 (Y,A,AVSS,AVSS);
JNWTR_NCHDL MN7 (AVSS,A,Y,AVSS);
JNWTR_PCHDL MP0 (Y,A,AVDD,AVDD);
JNWTR_PCHDL MP1 (AVDD,A,Y,AVDD);
JNWTR_PCHDL MP2 (Y,A,AVDD,AVDD);
JNWTR_PCHDL MP3 (AVDD,A,Y,AVDD);
JNWTR_PCHDL MP4 (Y,A,AVDD,AVDD);
JNWTR_PCHDL MP5 (AVDD,A,Y,AVDD);
JNWTR_PCHDL MP6 (Y,A,AVDD,AVDD);
JNWTR_PCHDL MP7 (AVDD,A,Y,AVDD);
endmodule

//-------------------------------------------------------------
// JNWTR_BFX1_CV <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_BFX1_CV(A,Y,AVDD,AVSS);
input logic A;
input logic Y;
input logic AVDD;
input logic AVSS;
JNWTR_NCHDL MN0 (AVSS,A,B,AVSS);
JNWTR_NCHDL MN1 (Y,B,AVSS,AVSS);
JNWTR_PCHDL MP0 (AVDD,A,B,AVDD);
JNWTR_PCHDL MP1 (Y,B,AVDD,AVDD);
endmodule

//-------------------------------------------------------------
// JNWTR_NRX1_CV <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_NRX1_CV(A,B,Y,AVDD,AVSS);
input logic A;
input logic B;
input logic Y;
input logic AVDD;
input logic AVSS;
JNWTR_NCHDL MN0 (Y,A,AVSS,AVSS);
JNWTR_NCHDL MN1 (AVSS,B,Y,AVSS);
JNWTR_PCHDL MP0 (N1,A,AVDD,AVDD);
JNWTR_PCHDL MP1 (Y,B,N1,AVDD);
endmodule

//-------------------------------------------------------------
// JNWTR_NDX1_CV <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_NDX1_CV(A,B,Y,AVDD,AVSS);
input logic A;
input logic B;
input logic Y;
input logic AVDD;
input logic AVSS;
JNWTR_NCHDL MN0 (N1,A,AVSS,AVSS);
JNWTR_NCHDL MN1 (Y,B,N1,AVSS);
JNWTR_PCHDL MP0 (Y,A,AVDD,AVDD);
JNWTR_PCHDL MP1 (AVDD,B,Y,AVDD);
endmodule

//-------------------------------------------------------------
// JNWTR_ORX1_CV <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_ORX1_CV(A,B,Y,AVDD,AVSS);
input logic A;
input logic B;
input logic Y;
input logic AVDD;
input logic AVSS;
JNWTR_NRX1_CV XA1 (A,B,YN,AVDD,AVSS);
JNWTR_IVX1_CV XA2 (YN,Y,AVDD,AVSS);
endmodule

//-------------------------------------------------------------
// JNWTR_ANX1_CV <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_ANX1_CV(A,B,Y,AVDD,AVSS);
input logic A;
input logic B;
input logic Y;
input logic AVDD;
input logic AVSS;
JNWTR_NDX1_CV XA1 (A,B,YN,AVDD,AVSS);
JNWTR_IVX1_CV XA2 (YN,Y,AVDD,AVSS);
endmodule

//-------------------------------------------------------------
// JNWTR_DFTSPCX1_CV <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_DFTSPCX1_CV(D,CK,Q,AVDD,AVSS);
input logic D;
input logic CK;
input logic Q;
input logic AVDD;
input logic AVSS;
JNWTR_NCHDL MN0 (N1,D,AVSS,AVSS);
JNWTR_NCHDL MN2 (N2,CK,Q,AVSS);
JNWTR_NCHDL MN1 (AVSS,N1,N2,AVSS);
JNWTR_PCHDL MP1 (N3,D,AVDD,AVDD);
JNWTR_PCHDL MP0 (N1,CK,N3,AVDD);
JNWTR_PCHDL MP2 (Q,N1,AVDD,AVDD);
endmodule

//-------------------------------------------------------------
// JNWTR_IVTRIX1_CV <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_IVTRIX1_CV(A,C,CN,Y,AVDD,AVSS);
input logic A;
input logic CN;
input logic C;
input logic Y;
input logic AVDD;
input logic AVSS;
JNWTR_NCHDL MN0 (N1,A,AVSS,AVSS);
JNWTR_NCHDL MN1 (Y,C,N1,AVSS);
JNWTR_PCHDL MP0 (N2,A,AVDD,AVDD);
JNWTR_PCHDL MP1 (Y,CN,N2,AVDD);
endmodule

//-------------------------------------------------------------
// JNWTR_NDTRIX1_CV <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_NDTRIX1_CV(A,C,CN,RN,Y,AVDD,AVSS);
input logic A;
input logic CN;
input logic C;
input logic RN;
input logic Y;
input logic AVDD;
input logic AVSS;
JNWTR_NCHDL MN2 (N1,RN,AVSS,AVSS);
JNWTR_NCHDL MN0 (N2,A,N1,AVSS);
JNWTR_NCHDL MN1 (Y,C,N2,AVSS);
JNWTR_PCHDL MP2 (AVDD,RN,N2,AVDD);
JNWTR_PCHDL MP0 (N2,A,AVDD,AVDD);
JNWTR_PCHDL MP1 (Y,CN,N2,AVDD);
endmodule

//-------------------------------------------------------------
// JNWTR_DFRNQNX1_CV <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_DFRNQNX1_CV(D,CK,RN,Q,QN,AVDD,AVSS);
input logic D;
input logic CK;
input logic Q;
input logic QN;
input logic AVDD;
input logic AVSS;
input logic RN;
JNWTR_TAPCELLB_CV XA0 (AVDD,AVSS);
JNWTR_NDX1_CV XA1 (CK,RN,CKN,AVDD,AVSS);
JNWTR_IVX1_CV XA2 (CKN,CKB,AVDD,AVSS);
JNWTR_IVTRIX1_CV XA3 (D,CKN,CKB,A0,AVDD,AVSS);
JNWTR_IVTRIX1_CV XA4 (A1,CKB,CKN,A0,AVDD,AVSS);
JNWTR_IVX1_CV XA5 (A0,A1,AVDD,AVSS);
JNWTR_IVTRIX1_CV XA6 (A1,CKB,CKN,QN,AVDD,AVSS);
JNWTR_NDTRIX1_CV XA7 (Q,CKN,CKB,RN,QN,AVDD,AVSS);
JNWTR_IVX1_CV XA8 (QN,Q,AVDD,AVSS);
endmodule

//-------------------------------------------------------------
// JNWTR_SCX1_CV <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_SCX1_CV(A,Y,AVDD,AVSS);
input logic A;
input logic Y;
input logic AVDD;
input logic AVSS;
JNWTR_NCHDL XA2 (N1,A,AVSS,AVSS);
JNWTR_NCHDL XA3 (SCO,A,N1,AVSS);
JNWTR_NCHDL XA4a (AVDD,SCO,N1,AVSS);
JNWTR_NCHDL XA4b (AVDD,SCO,N1,AVSS);
JNWTR_NCHDL XA5 (Y,SCO,AVSS,AVSS);
JNWTR_PCHDL XB0 (N2,A,AVDD,AVDD);
JNWTR_PCHDL XB1 (SCO,A,N2,AVDD);
JNWTR_PCHDL XB3a (N2,SCO,AVSS,AVDD);
JNWTR_PCHDL XB3b (N2,SCO,AVSS,AVDD);
JNWTR_PCHDL XB4 (Y,SCO,AVDD,AVDD);
endmodule

//-------------------------------------------------------------
// JNWTR_CAPX1 <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_CAPX1(A,B);
input logic A;
input logic B;
endmodule

//-------------------------------------------------------------
// JNWTR_CAPX4 <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_CAPX4(A,B);
input logic A;
input logic B;
JNWTR_CAPX1 XA1 (A,B);
JNWTR_CAPX1 XA2 (A,B);
JNWTR_CAPX1 XB1 (A,B);
JNWTR_CAPX1 XB2 (A,B);
endmodule

//-------------------------------------------------------------
// JNWTR_TGX2_CV <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_TGX2_CV(A,C,B,AVDD,AVSS);
input logic C;
input logic A;
input logic B;
input logic AVDD;
input logic AVSS;
JNWTR_NCHDL MN0 (AVSS,C,CN,AVSS);
JNWTR_NCHDL MN1 (B,C,A,AVSS);
JNWTR_NCHDL MN1b (B,C,A,AVSS);
JNWTR_PCHDL MP0 (AVDD,C,CN,AVDD);
JNWTR_PCHDL MP1 (B,CN,A,AVDD);
JNWTR_PCHDL MP1b (B,CN,A,AVDD);
endmodule

//-------------------------------------------------------------
// JNWTR_DFTRIX1_CV <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_DFTRIX1_CV(D,CK,C,CN,Y,AVDD,AVSS);
input logic D;
input logic C;
input logic CK;
input logic CN;
input logic Y;
input logic AVDD;
input logic AVSS;
JNWTR_TAPCELLB_CV XA3 (AVDD,AVSS);
JNWTR_DFRNQNX1_CV XA2 (D,CK,C,NC,QN,AVDD,AVSS);
JNWTR_IVTRIX1_CV XA0 (QN,C,CN,Y,AVDD,AVSS);
endmodule

//-------------------------------------------------------------
// JNWTR_CKDIV2_CV <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_CKDIV2_CV(AVDD,AVSS,CKI,CKO,CKO50DC,RN);
input logic AVDD;
input logic AVSS;
input logic CKI;
input logic CKO;
input logic CKO50DC;
input logic RN;
JNWTR_TAPCELLB_CV XA12v (AVDD,AVSS);
JNWTR_BFX1_CV XA1 (CKI,CKIB,AVDD,AVSS);
JNWTR_IVX1_CV XA2 (CKIB,CKIN,AVDD,AVSS);
JNWTR_DFRNQNX1_CV XA4 (QNI,CKIN,RN,CKO50DC,QN,AVDD,AVSS);
JNWTR_IVX1_CV XA3 (CKO50DC,QNI,AVDD,AVSS);
JNWTR_ANX1_CV XA5 (CKO50DC,CKI,CKO,AVDD,AVSS);
endmodule

//-------------------------------------------------------------
// JNWTR_TOP <class 'cicpy.core.layoutcell.LayoutCell'>
//-------------------------------------------------------------
module JNWTR_TOP(AVDD,AVSS);
input logic AVSS;
input logic AVDD;
JNWTR_TAPCELLB_CV XA0 (AVDD,AVSS);
JNWTR_TIEH_CV XA1 (Y1,AVDD,AVSS);
JNWTR_TIEL_CV XA2 (Y2,AVDD,AVSS);
JNWTR_TAPCELLB_CV XB0 (AVDD,AVSS);
JNWTR_IVX1_CV XB3 (A3,Y3,AVDD,AVSS);
JNWTR_IVX2_CV XB4 (A4,Y4,AVDD,AVSS);
JNWTR_IVX4_CV XB5 (A5,Y5,AVDD,AVSS);
JNWTR_IVX8_CV XB6 (A6,Y6,AVDD,AVSS);
JNWTR_TAPCELLB_CV XC0 (AVDD,AVSS);
JNWTR_BFX1_CV XC7 (A7,Y7,AVDD,AVSS);
JNWTR_TAPCELLB_CV XD0 (AVDD,AVSS);
JNWTR_NRX1_CV XD8 (A8,B8,Y8,AVDD,AVSS);
JNWTR_NDX1_CV XD9 (A9,B9,Y9,AVDD,AVSS);
JNWTR_ORX1_CV XD10 (A10,B10,Y10,AVDD,AVSS);
JNWTR_ANX1_CV XD11 (A11,B11,Y11,AVDD,AVSS);
JNWTR_TAPCELLB_CV XE0 (AVDD,AVSS);
JNWTR_SCX1_CV XE12 (A12,Y12,AVDD,AVSS);
JNWTR_TAPCELLB_CV XG0 (AVDD,AVSS);
JNWTR_TGX2_CV XG1 (A16,C16,B16,AVDD,AVSS);
JNWTR_RPPO2 XH1 (P17,N17,AVSS);
JNWTR_RPPO4 XI1 (P18,N18,AVSS);
JNWTR_RPPO8 XJ1 (P19,N19,AVSS);
JNWTR_RPPO16 XK1 (P20,N20,AVSS);
JNWTR_TAPCELLB_CV XL0 (AVDD,AVSS);
JNWTR_CKDIV2_CV XL1 (AVDD,AVSS,CKI21,CKO21,CKO50DC21,RN21);
JNWTR_TAPCELLB_CV XM0 (AVDD,AVSS);
JNWTR_DFTRIX1_CV XM1 (D22,CK22,C22,CN22,Y22,AVDD,AVSS);
JNWTR_DFTSPCX1_CV XM2 (D23,CK23,Q23,AVDD,AVSS);
JNWTR_TAPCELLB_CV XN0 (AVDD,AVSS);
JNWTR_DFRNQNX1_CV XN2 (D25,CK25,RN25,Q25,QN25,AVDD,AVSS);
JNWTR_CAPX4 XO1 (A26,B26);
JNWTR_CAPX1 XO0 (A27,B27);
endmodule
