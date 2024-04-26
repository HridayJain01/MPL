;PALINDROME
Data Segment 
String1 DB 'MONALIS'
STRING DB 'PALI',13,10,'$'
Pal DB 00H 
Data ends 
Extra Segment 
String2 DB 07H DUP(?) 
Extra ends 
Code Segment 
Assume CS:Code, DS:Data , ES:Extra
START: 
MOV AX,Data 
MOV DS, AX 
MOV AX,Extra 
MOV ES, AX 
LEA SI,String1 
LEA DI,String2+06H 
MOV CX,007H
BACK: 
CLD 
LODSB 
STD 
STOSB 
LOOP BACK
;REVERSE ENDS
;PALINDROME STARTS
LEA SI,String1
LEA DI,String2
mov cx,7
cld
 repe cmpsb
 jnz skip
 inc Pal
skip:
 mov al,Pal
 LEA DX,STRING
 
MOV AH,9
INT 21H
Code ENDS
END START
