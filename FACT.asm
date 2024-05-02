DATA SEGMENT
    NUM  DW 05H    ; Number for which factorial is to be calculated (5 in this case)
    FACT DW 0      ; Variable to store the factorial result
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA   ; Load the address of the data segment into AX
    MOV DS, AX     ; Set DS to point to the data segment

    MOV CX, NUM    ; Load NUM into CX (the counter for the loop)
    MOV AX, 1      ; Initialize AX to 1 (as the factorial starts from 1)

FACTORIAL:
    MUL CX         ; Multiply AX by CX (updating AX with the product)
    LOOP FACTORIAL ; Decrements CX and repeats the loop until CX becomes 0

    MOV [FACT], AX ; Stores the result (factorial) from AX into the memory location FACT

    ; Display the result
    MOV AX, 4C02H  ; DOS function to print a 16-bit value
    MOV BX, FACT   ; Load the address of FACT into BX
    MOV BX,[BX]
    INT 21H        ; Call DOS interrupt

CODE ENDS
END START
