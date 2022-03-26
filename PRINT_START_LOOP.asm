
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here    
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    MOV AH, 2
    MOV CX, 256   
    MOV DL, 0
    PRINT_LOOP:
    INT 21H
    INC DL
    DEC CX
    JNZ PRINT_LOOP
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN

ret




