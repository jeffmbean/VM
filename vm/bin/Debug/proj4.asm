SIZE .INT 30;//GLOBAL VARIABLES
THREADSIZE .INT 5;
ARRAY .INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
.INT 0;
NUMENTRIES .INT 0;
ARRINDEX .INT 8;
O .BYT O;
V .BYT V;
E .BYT E;
R .BYT R;
F .BYT F;
L .BYT L;
W .BYT W;
U .BYT U;
N .BYT N;
D .BYT D;
A .BYT A;
C .BYT C;
T .BYT T;
I .BYT I;
S .BYT S;
G .BYT G;
M .BYT M;
B .BYT B;
P .BYT P;
H .BYT H;
: .BYT :;
ZERO .INT 0;
ONE .INT 1;
FOUR .INT 4;
FIVE .INT 5;
EIGHT .INT 8;
FOURTEEN .INT 14;
FIFTEEN .INT 15;
CRETURN .INT 13;// "\r"
NEWLINE .INT 10;//"\n"
SPACE .INT 32;//" "
LPAR .INT 40;//"("
RPAR .INT 41;//")"


//SETUP
MOV FP SB;//INITIALIZE FP
MOV SP SB;//INITIALIZE SP
LDA R1 ARRAY;//R1 = CURRENT OPEN INDEX TO ARRAY BEGINNING
LDR R3 ZERO;//R3 = # OF ENTRIES TO ARRAY

WHILE JMP GETNUM;
RETGETNUM LDR R4 ZERO;
TRP 4;//GET NUMBER FROM USER
CMP R4 R0;//SEE IF USER ENTERED 0 TO EXIT
BRZ R4 EXITPART1;
LDR R2 SIZE;
CMP R2 R3;
BRZ R2 EXITPART1;
STR R0 R1;//PUT INPUT IN ARRAY BEGINNING
ADI R1 4;//INCREMENT INDEX
ADI R3 1;//INCREMENT # OF ENTRIES

//SETUP TO CALL FACTORIAL(N)
//ALWAYS TEST FOR OVERFLOW
MOV R5 SP;
ADI R5 -12;//CHANGE TO THE NUMBER OF stored items X 4 ((# OF PARAMETERS X 4) + 8)
CMP R5 SL;
BLT R5 OVERFLOW;
//ACTIVATION RECORD BEG
MOV R4 FP;//SAVE TO BE PFP
MOV FP SP;//SET FP
ADI SP -4;
STR R4 SP;STORE PFP
ADI SP -4;//ACTIVATION RECORD BEG
//****PASS PARAMETERS HERE****
STR R0 SP;//USER INPUT
ADI SP -4;
//****END OF PARAMETERS****
MOV R4 PC;//ACTIVATION RECORD END
ADI R4 44;//CALCULATE RETURN ADDRESS TO JUST AFTER JMP
STR R4 FP;//STORE RETURN ADDRESS
JMP FACTORIAL;

//STORE FINAL NUMBER AT END OF ARRAY
LDR R4 FP;
STR R4 R1;//PUT INPUT IN ARRAY BEGINNING
ADI R1 4;//INCREMENT INDEX
ADI R3 1;//INCREMENT # OF ENTRIES
//PRINT FACTORIAL OF X IS Y
JMP PRINTFACTORIAL;
RETFROMPRINT JMP WHILE;

EXITPART1 JMP PRINTARRAY;
RETPRINTARRAY JMP THREADS;

//THREADS
THREADS LDB R0 NEWLINE;
TRP 3;
LDB R0 T;
TRP 3;
LDB R0 H;
TRP 3;
LDB R0 R;
TRP 3;
LDB R0 E;
TRP 3;
LDB R0 A;
TRP 3;
LDB R0 D;
TRP 3;
LDB R0 I;
TRP 3;
LDB R0 N;
TRP 3;
LDB R0 G;
TRP 3;
LDB R0 NEWLINE;
TRP 3;

RUN R9 STARTTHREAD;
RUN R9 STARTTHREAD;
RUN R9 STARTTHREAD;
RUN R9 STARTTHREAD;
RUN R9 STARTTHREAD;    
BLK;

TRP 0;//END PROGRAM


//*******FUNCTIONS************

//FACTORIAL() 
FACTORIAL ADI SP 4;//PEEK N
LDR R5 SP;//R5=N
ADI SP -4;//END PEEK
LDR R6 ZERO;
CMP R6 R5;//IF (N == 0)
BNZ R6 ELSE;
//DE-ALLOCATE ACTIVATION RECORD
//ALWAYS TEST FOR UNDERFLOW
MOV SP FP;//DE-ALLOCATE CURRENT ACTIVATION RECORD
MOV R5 SP;
CMP R5 SB;
BGT R5 UNDERFLOW;
LDR R5 FP;
//STORE RETURN 1
LDR R6 ONE;
STR R6 FP;//STORE 1 AT FP
MOV R4 FP;
ADI R4 -4;
LDR FP R4;
JMR R5;
//SETUP TO CALL FACTORIAL(N) RECURSIVELY
//ALWAYS TEST FOR OVERFLOW
ELSE MOV R6 SP;
ADI R6 -12;//CHANGE TO THE NUMBER OF stored items X 4 ((# OF PARAMETERS X 4) + 8)
CMP R6 SL;
BLT R6 OVERFLOW;
//ACTIVATION RECORD BEG
MOV R7 FP;//SAVE TO BE PFP
MOV FP SP;//SET FP
ADI SP -4;
STR R7 SP;STORE PFP
ADI SP -4;//ACTIVATION RECORD BEG
//****PASS PARAMETERS HERE****
ADI R5 -1;//N-1
STR R5 SP;//STORE N-1
ADI SP -4;
//****END OF PARAMETERS****
MOV R4 PC;//ACTIVATION RECORD END
ADI R4 44;//CALCULATE RETURN ADDRESS TO JUST AFTER JMP
STR R4 FP;//STORE RETURN ADDRESS
JMP FACTORIAL;
//MULTIPLY N * FACT(N-1)
LDR R7 SP;//RETURN VALUE
ADI SP 4;
LDR R6 SP;//POP STORED N
MUL R6 R7;
//DE-ALLOCATE ACTIVATION RECORD
//ALWAYS TEST FOR UNDERFLOW
MOV SP FP;//DE-ALLOCATE CURRENT ACTIVATION RECORD
MOV R5 SP;
CMP R5 SB;
BGT R5 UNDERFLOW;
LDR R5 FP;
//STORE RETURN VALUE
STR R6 FP;//STORE N AT FP
MOV R4 FP;
ADI R4 -4;
LDR FP R4;
JMR R5;

//OVERFLOW
OVERFLOW LDB R0 O;
TRP 3;
LDB R0 V;
TRP 3;
LDB R0 E;
TRP 3;
LDB R0 R;
TRP 3;
LDB R0 F;
TRP 3;
LDB R0 L;
TRP 3;
LDB R0 O;
TRP 3;
LDB R0 W;
TRP 3;
TRP 0;

//UNDERFLOW
UNDERFLOW LDB R0 O;
TRP 3;
LDB R0 U;
TRP 3;
LDB R0 N;
TRP 3;
LDB R0 D;
TRP 3;
LDB R0 E;
TRP 3;
LDB R0 R;
TRP 3;
LDB R0 F;
TRP 3;
LDB R0 L;
TRP 3;
LDB R0 O;
TRP 3;
LDB R0 W;
TRP 3;
TRP 0;

PRINTFACTORIAL LDB R0 F;
TRP 3;
LDB R0 A;
TRP 3;
LDB R0 C;
TRP 3;
LDB R0 T;
TRP 3;
LDB R0 O;
TRP 3;
LDB R0 R;
TRP 3;
LDB R0 I;
TRP 3;
LDB R0 A;
TRP 3;
LDB R0 L;
TRP 3;
LDB R0 SPACE;
TRP 3;
LDB R0 O;
TRP 3;
LDB R0 F;
TRP 3;
LDB R0 SPACE;
TRP 3;
//GET X
MOV R5 R1;
ADI R5 -8;
LDR R0 R5;
TRP 1;//PRINT X
LDB R0 SPACE;
TRP 3;
LDB R0 I;
TRP 3;
LDB R0 S;
TRP 3;
LDB R0 SPACE;
TRP 3;
//GET Y
MOV R5 R1;
ADI R5 -4;
LDR R0 R5;
TRP 1;//PRINT Y
LDB R0 NEWLINE;
TRP 3;
JMP RETFROMPRINT;

PRINTARRAY LDB R0 NEWLINE;
TRP 3;
LDB R0 A;
TRP 3;
LDB R0 D;
TRP 3;
LDB R0 D;
TRP 3;
LDB R0 R;
TRP 3;
LDB R0 E;
TRP 3;
LDB R0 S;
TRP 3;
LDB R0 S;
TRP 3;
LDB R0 I;
TRP 3;
LDB R0 N;
TRP 3;
LDB R0 G;
TRP 3;
LDB R0 SPACE;
TRP 3;
LDB R0 M;
TRP 3;
LDB R0 O;
TRP 3;
LDB R0 D;
TRP 3;
LDB R0 E;
TRP 3;
LDB R0 SPACE;
TRP 3;
LDB R0 NEWLINE;
TRP 3;
LDA R1 ARRAY;//R1 IS BEGINNING R3 IS THE #OF ENTRIES
LDR R2 FOUR;
MUL R2 R3;//R2 IS THE NUMBER OF ENTRIES * 4 TO GET THE INDEX TO THE LAST NUMBER
ADI R2 4;
LDR R4 ZERO;
WHILELESSTHANSIZE MOV R5 R4;
CMP R5 R3;
BRZ R5 ENDWHILE;
LDR R0 R1;//FRONT
ADI R1 4;//INCREMENT FRONT
TRP 1;
LDB R0 SPACE;
TRP 3;
LDR R0 R2;//END
ADI R2 -4;//DECREMENT END
TRP 1;
LDB R0 SPACE;
TRP 3;
ADI R4 2;//INCREMENT #OF ENTRIES PRINTED
JMP WHILELESSTHANSIZE;
ENDWHILE LDB R0 NEWLINE;
TRP 3;
JMP RETPRINTARRAY;

GETNUM LDB R0 E;
TRP 3;
LDB R0 N;
TRP 3;
LDB R0 T;
TRP 3;
LDB R0 E;
TRP 3;
LDB R0 R;
TRP 3;
LDB R0 SPACE;
TRP 3;
LDB R0 U;
TRP 3;
LDB R0 P;
TRP 3;
LDB R0 SPACE;
TRP 3;
LDB R0 T;
TRP 3;
LDB R0 O;
TRP 3;
LDB R0 SPACE;
TRP 3;
LDR R0 FIFTEEN;
TRP 1;
LDB R0 SPACE;
TRP 3;
LDB R0 N;
TRP 3;
LDB R0 U;
TRP 3;
LDB R0 M;
TRP 3;
LDB R0 B;
TRP 3;
LDB R0 E;
TRP 3;
LDB R0 R;
TRP 3;
LDB R0 S;
TRP 3;
LDB R0 SPACE;
TRP 3;
LDR R0 ONE;
TRP 1;
LDB R0 SPACE;
TRP 3;
LDB R0 A;
TRP 3;
LDB R0 T;
TRP 3;
LDB R0 SPACE;
TRP 3;
LDB R0 A;
TRP 3;
LDB R0 SPACE;
TRP 3;
LDB R0 T;
TRP 3;
LDB R0 I;
TRP 3;
LDB R0 M;
TRP 3;
LDB R0 E;
TRP 3;
LDB R0 SPACE;
TRP 3;
LDB R0 LPAR;
TRP 3;
LDR R0 ZERO;
TRP 1;
LDB R0 SPACE;
TRP 3;
LDB R0 T;
TRP 3;
LDB R0 O;
TRP 3;
LDB R0 SPACE;
TRP 3;
LDB R0 S;
TRP 3;
LDB R0 T;
TRP 3;
LDB R0 O;
TRP 3;
LDB R0 P;
TRP 3;
LDB R0 RPAR;
TRP 3;
LDB R0 SPACE;
TRP 3;
LDB R0 :;
TRP 3;
LDB R0 SPACE;
TRP 3;
JMP RETGETNUM;

******************THREADS*****************************************
******************THREADS*****************************************

//SETUP
STARTTHREAD LCK;
MOV FP SB;//INITIALIZE FP
MOV SP SB;//INITIALIZE SP
LDA R2 ARRINDEX;
LDR R1 R2;//R1 = CURRENT OPEN INDEX TO ARRAY BEGINNING
LDA R5 NUMENTRIES;
LDR R3 R5;//R3 = # OF ENTRIES TO ARRAY

JMP GETNUM2;
RETGETNUM2 LDR R4 ZERO;
TRP 4;//GET NUMBER FROM USER
CMP R4 R0;//SEE IF USER ENTERED 0 TO EXIT
BRZ R4 EXITP12;
LDR R2 THREADSIZE;
CMP R2 R3;
BRZ R2 EXITP12;
STR R0 R1;//PUT INPUT IN ARRAY BEGINNING
ADI R1 4;//INCREMENT INDEX
ADI R3 1;//INCREMENT # OF ENTRIES

//SETUP TO CALL FACTORIAL(N)
//ALWAYS TEST FOR OVERFLOW
MOV R5 SP;
ADI R5 -12;//CHANGE TO THE NUMBER OF stored items X 4 ((# OF PARAMETERS X 4) + 8)
CMP R5 SL;
BLT R5 OVERFLOW;
//ACTIVATION RECORD BEG
MOV R4 FP;//SAVE TO BE PFP
MOV FP SP;//SET FP
ADI SP -4;
STR R4 SP;STORE PFP
ADI SP -4;//ACTIVATION RECORD BEG
//****PASS PARAMETERS HERE****
STR R0 SP;//USER INPUT
ADI SP -4;
//****END OF PARAMETERS****
MOV R4 PC;//ACTIVATION RECORD END
ADI R4 44;//CALCULATE RETURN ADDRESS TO JUST AFTER JMP
STR R4 FP;//STORE RETURN ADDRESS
JMP FACTORIAL2;
//STORE FINAL NUMBER AT END OF ARRAY
LDR R4 FP;
STR R4 R1;//PUT INPUT IN ARRAY BEGINNING
ADI R1 4;//INCREMENT INDEX
ADI R3 1;//INCREMENT # OF ENTRIES
LDA R5 ARRINDEX;
STR R1 R5;
LDA R5 NUMENTRIES;
STR R3 R5;
ULK;
LDR R7 EIGHT;
LDA R8 ARRINDEX;
STR R7 R8;
//PRINT FACTORIAL OF X IS Y
JMP PRINTFACTORIAL2;
RETFROMPRINT2 JMP EXITP12;

EXITP12 JMP PRINTARRAY2;


//*******FUNCTIONS************

//FACTORIAL() 
FACTORIAL2 ADI SP 4;//PEEK N
LDR R5 SP;//R5=N
ADI SP -4;//END PEEK
LDR R6 ZERO;
CMP R6 R5;//IF (N == 0)
BNZ R6 ELSE2;
//DE-ALLOCATE ACTIVATION RECORD
//ALWAYS TEST FOR UNDERFLOW
MOV SP FP;//DE-ALLOCATE CURRENT ACTIVATION RECORD
MOV R5 SP;
CMP R5 SB;
BGT R5 UNDERFLOW;
LDR R5 FP;
//STORE RETURN 1
LDR R6 ONE;
STR R6 FP;//STORE 1 AT FP
MOV R4 FP;
ADI R4 -4;
LDR FP R4;
JMR R5;
//SETUP TO CALL FACTORIAL(N) RECURSIVELY
//ALWAYS TEST FOR OVERFLOW
ELSE2 MOV R6 SP;
ADI R6 -12;//CHANGE TO THE NUMBER OF stored items X 4 ((# OF PARAMETERS X 4) + 8)
CMP R6 SL;
BLT R6 OVERFLOW;
//ACTIVATION RECORD BEG
MOV R7 FP;//SAVE TO BE PFP
MOV FP SP;//SET FP
ADI SP -4;
STR R7 SP;STORE PFP
ADI SP -4;//ACTIVATION RECORD BEG
//****PASS PARAMETERS HERE****
ADI R5 -1;//N-1
STR R5 SP;//STORE N-1
ADI SP -4;
//****END OF PARAMETERS****
MOV R4 PC;//ACTIVATION RECORD END
ADI R4 44;//CALCULATE RETURN ADDRESS TO JUST AFTER JMP
STR R4 FP;//STORE RETURN ADDRESS
JMP FACTORIAL2;
//MULTIPLY N * FACT(N-1)
LDR R7 SP;//RETURN VALUE
ADI SP 4;
LDR R6 SP;//POP STORED N
MUL R6 R7;
//DE-ALLOCATE ACTIVATION RECORD
//ALWAYS TEST FOR UNDERFLOW
MOV SP FP;//DE-ALLOCATE CURRENT ACTIVATION RECORD
MOV R5 SP;
CMP R5 SB;
BGT R5 UNDERFLOW;
LDR R5 FP;
//STORE RETURN VALUE
STR R6 FP;//STORE N AT FP
MOV R4 FP;
ADI R4 -4;
LDR FP R4;
JMR R5;

PRINTFACTORIAL2 LDB R0 F;
TRP 3;
LDB R0 A;
TRP 3;
LDB R0 C;
TRP 3;
LDB R0 T;
TRP 3;
LDB R0 O;
TRP 3;
LDB R0 R;
TRP 3;
LDB R0 I;
TRP 3;
LDB R0 A;
TRP 3;
LDB R0 L;
TRP 3;
LDB R0 SPACE;
TRP 3;
LDB R0 O;
TRP 3;
LDB R0 F;
TRP 3;
LDB R0 SPACE;
TRP 3;
//GET X
LCK;
LDA R1 ARRINDEX;
LDR R5 R1;
LDR R0 R5;
ADI R5 4;
TRP 1;//PRINT X
STR R5 R1;
ULK;
LDB R0 SPACE;
TRP 3;
LDB R0 I;
TRP 3;
LDB R0 S;
TRP 3;
LDB R0 SPACE;
TRP 3;
//GET Y
LCK;
LDA R1 ARRINDEX;
LDR R5 R1;
LDR R0 R5;
ADI R5 4;
TRP 1;//PRINT Y
STR R5 R1;
ULK;
LDB R0 NEWLINE;
TRP 3;
END;
JMP RETFROMPRINT2;

GETNUM2 LDB R0 E;
TRP 3;
LDB R0 N;
TRP 3;
LDB R0 T;
TRP 3;
LDB R0 E;
TRP 3;
LDB R0 R;
TRP 3;
LDB R0 SPACE;
TRP 3;
LDR R0 FIVE;
TRP 1;
LDB R0 SPACE;
TRP 3;
LDB R0 N;
TRP 3;
LDB R0 U;
TRP 3;
LDB R0 M;
TRP 3;
LDB R0 B;
TRP 3;
LDB R0 E;
TRP 3;
LDB R0 R;
TRP 3;
LDB R0 S;
TRP 3;
LDB R0 SPACE;
TRP 3;
LDR R0 ONE;
TRP 1;
LDB R0 SPACE;
TRP 3;
LDB R0 A;
TRP 3;
LDB R0 T;
TRP 3;
LDB R0 SPACE;
TRP 3;
LDB R0 A;
TRP 3;
LDB R0 SPACE;
TRP 3;
LDB R0 T;
TRP 3;
LDB R0 I;
TRP 3;
LDB R0 M;
TRP 3;
LDB R0 E;
TRP 3;
LDB R0 :;
TRP 3;
LDB R0 SPACE;
TRP 3;
JMP RETGETNUM2;
