.MODEL SMALL

.STACK 100H

.DATA

VAR1 DB 40 DUP(?)
VAR2 DB ?
NEWLINE DB 0AH,0DH,'$'
.CODE

MAIN PROC
    mov ax,@DATA
    mov ds,ax
    
    MOV AH,1
    MOV SI,0
    GETSTRING:
        MOV AH,1
        INT 21H
        CMP AL,0DH
        JE END_GETSTRING
        MOV VAR1+SI,AL
       
        INC SI
        JMP GETSTRING
    
    END_GETSTRING:
    MOV VAR1+SI,'$'
    CALL PRINTLINE
    
    MOV CX,SI
    MOV AH,2
    PRINTSTRING:
        DEC SI
        MOV  DL, VAR1[SI]
        INT 21H   
    LOOP PRINTSTRING
   
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP 
    
    PRINTLINE PROC
        PUSH DX
        PUSH AX
        LEA DX,NEWLINE
        MOV AH,9
        INT 21H
        POP AX
        POP DX
        RET
        PRINTLINE ENDP 
        
END MAIN




