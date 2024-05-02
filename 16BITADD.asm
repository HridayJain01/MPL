DATA SEGMENT
NUM1 DW 1234H
NUM2 DW 5678H
SUM  DW 00H
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
MOV AX, DATA     ; Load the address of the data segment into AX
MOV DS, AX       ; Set DS to point to the data segment

; Load NUM1 into AX
MOV AX, NUM1

; Add NUM2 to AX
ADD AX, NUM2

; Store the result in the SUM variable
MOV SUM, AX

; Print the result
MOV AX, SUM      ; Move the result to AX
CALL PRINT_AX    ; Call subroutine to print AX

; Exit the program
MOV AH, 4CH      ; DOS function to terminate the program
INT 21H          ; Call DOS interrupt

PRINT_AX PROC
    MOV CX, 4        ; Number of nibbles in a word (16-bit number)
PRINT_LOOP:
    ROL AX, 4        ; Rotate AX left by 4 bits
    MOV DL, AH       ; Move the higher nibble of AX to DL
    AND DL, 0FH      ; Mask out all but the lowest 4 bits (hex digit)
    CMP DL, 10       ; Check if DL is less than or equal to 9
    JB PRINT_DIGIT   ; Jump if DL is a valid digit
    ADD DL, 7        ; Adjust DL if it's a letter (A-F)
PRINT_DIGIT:
    ADD DL, '0'      ; Convert the value in DL to ASCII
    MOV AH, 02H      ; DOS function to print character
    INT 21H          ; Call DOS interrupt
    LOOP PRINT_LOOP  ; Repeat until all nibbles are printed
    RET
PRINT_AX ENDP

CODE ENDS
END START
