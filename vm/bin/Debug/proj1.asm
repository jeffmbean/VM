A1 .INT 1;
A2 .INT 2;
A3 .INT 3;
A4 .INT 4;
A5 .INT 5;
A6 .INT 6;
B1 .INT 300;
B2 .INT 150;
B3 .INT 50;
B4 .INT 20;
B5 .INT 10;
B6 .INT 5;
C1 .INT 500;
C2 .INT 2;
C3 .INT 5;
C4 .INT 10;
N1 .BYT B;
N2 .BYT E;
N3 .BYT A;
N4 .BYT N;
N5 .BYT ,;
N6 .BYT J;
N7 .BYT E;
N8 .BYT F;
N9 .BYT F;
BL .INT 10;
SP .INT 32;
LDB R0 N1;//PRINT NAME
TRP 3;
LDB R0 N2;
TRP 3;
LDB R0 N3;
TRP 3;
LDB R0 N4;
TRP 3;
LDB R0 N5;
TRP 3;
LDB R0 N6;
TRP 3;
LDB R0 N7;
TRP 3;
LDB R0 N8;
TRP 3;
LDB R0 N9;
TRP 3;//END OF PRINT NAME
LDB R0 BL;
TRP 3;//NEWLINE
TRP 3;//NEWLINE
LDB R3 SP;//LOAD SPACE TO BE USED
LDR R1 B1;//ADD LIST B
LDR R2 B2;//B2
ADD R1 R2;
MOV R0 R1;
TRP 1;
MOV R0 R3;
TRP 3;//SPACE
TRP 3;//SPACE
LDR R2 B3;//B3
ADD R1 R2;
MOV R0 R1;
TRP 1;
MOV R0 R3;
TRP 3;//SPACE
TRP 3;//SPACE
LDR R2 B4;//B4
ADD R1 R2;
MOV R0 R1;
TRP 1;
MOV R0 R3;
TRP 3;//SPACE
TRP 3;//SPACE
LDR R2 B5;//B5
ADD R1 R2;
MOV R0 R1;
TRP 1;
MOV R0 R3;
TRP 3;//SPACE
TRP 3;//SPACE
LDR R2 B6;//B6
ADD R1 R2;
MOV R0 R1;
TRP 1;
MOV R4 R1;//END OF LIST B ADDITION. STORE IN R4
LDB R0 BL;
TRP 3;//NEWLINE
TRP 3;//NEWLINE
LDR R1 A1;//MULTIPLY LIST A
LDR R2 A2;//A2
MUL R1 R2;
MOV R0 R1;
TRP 1;
MOV R0 R3;
TRP 3;//SPACE
TRP 3;//SPACE
LDR R2 A3;//A3
MUL R1 R2;
MOV R0 R1;
TRP 1;
MOV R0 R3;
TRP 3;//SPACE
TRP 3;//SPACE
LDR R2 A4;//A4
MUL R1 R2;
MOV R0 R1;
TRP 1;
MOV R0 R3;
TRP 3;//SPACE
TRP 3;//SPACE
LDR R2 A5;//A5
MUL R1 R2;
MOV R0 R1;
TRP 1;
MOV R0 R3;
TRP 3;//SPACE
TRP 3;//SPACE
LDR R2 A6;//A6
MUL R1 R2;
MOV R0 R1;
TRP 1;
MOV R5 R1;//END OF LIST A MULTIPLY. STORE IN R5
LDB R0 BL;
TRP 3;//NEWLINE
TRP 3;//NEWLINE
MOV R0 R4;//DIVIDE RESULT OF LIST B BY LIST B
LDR R1 B1;//B1
DIV R0 R1;
TRP 1;
MOV R0 R3;
TRP 3;//SPACE
TRP 3;//SPACE
MOV R0 R4;
LDR R1 B2;//B2
DIV R0 R1;
TRP 1;
MOV R0 R3;
TRP 3;//SPACE
TRP 3;//SPACE
MOV R0 R4;
LDR R1 B3;//B3
DIV R0 R1;
TRP 1;
MOV R0 R3;
TRP 3;//SPACE
TRP 3;//SPACE
MOV R0 R4;
LDR R1 B4;//B4
DIV R0 R1;
TRP 1;
MOV R0 R3;
TRP 3;//SPACE
TRP 3;//SPACE
MOV R0 R4;
LDR R1 B5;//B5
DIV R0 R1;
TRP 1;
MOV R0 R3;
TRP 3;//SPACE
TRP 3;//SPACE
MOV R0 R4;
LDR R1 B6;//B6
DIV R0 R1;
TRP 1;//END OF DIVIDED BY LIST B
LDB R0 BL;
TRP 3;//NEWLINE
TRP 3;//NEWLINE
MOV R1 R5;//SUBTRACT LIST C FROM RESULT IN MULTIPLY OF LIST A
LDR R2 C1;//C1
SUB R1 R2;
MOV R0 R1;
TRP 1;
MOV R0 R3;
TRP 3;//SPACE
TRP 3;//SPACE
MOV R0 R5;
LDR R2 C2;//C2
SUB R1 R2;
MOV R0 R1;
TRP 1;
MOV R0 R3;
TRP 3;//SPACE
TRP 3;//SPACE
MOV R0 R5;
LDR R2 C3;//C3
SUB R1 R2;
MOV R0 R1;
TRP 1;
MOV R0 R3;
TRP 3;//SPACE
TRP 3;//SPACE
MOV R0 R5;
LDR R2 C4;//C4
SUB R1 R2;
MOV R0 R1;
TRP 1;//END OF SUBTRACT LIST C
TRP 0;//END PROGRAM.