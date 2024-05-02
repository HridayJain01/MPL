DATA_SEG SEGMENT
    ARR_1 DB 'abcba'
    LEN    DW 5
    PAL    DB ?
DATA_SEG ENDS

CODE_SEG SEGMENT
    ASSUME CS:CODE_SEG, DS:DATA_SEG
START:
    MOV AX, DATA_SEG      
    MOV DS, AX

    MOV SI, OFFSET ARR_1 
    MOV DI, SI             
    MOV BX, LEN
    DEC BX
    ADD DI, BX

AGAIN:        
    MOV AL, [SI]          
    CMP AL, [DI]          
    JNZ NO_PAL             
    INC SI
    DEC DI
    CMP SI, DI
    JB AGAIN               
    JMP PALINDROME         
NO_PAL: 
    MOV PAL, 00H           
    JMP PRINT_RESULT
PALINDROME: 
    MOV PAL, 0FFH          
PRINT_RESULT:
    
    MOV DL, PAL            
    MOV AH, 02H            
               

EXIT:        
    MOV AH, 4CH            
    INT 21H
CODE_SEG ENDS
END START
