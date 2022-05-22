
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    MOV AH, 2H
    MOV DL, '?'
    INT 21H
    
    MOV AH, 1H
    INT 21H
    
    MOV BL, AL
    
    MOV AH, 2H
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV DL, BL
    INT 21H
    
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN

ret




