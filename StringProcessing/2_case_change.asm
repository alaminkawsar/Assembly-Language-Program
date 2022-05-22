.MODEL SMALL
.STACK 100H

.DATA
STR DB 50 DUP('$')
NEWLINE DB 0AH,0DH,'$'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    MOV SI,0
    
    READ:
        INT 21H
        CMP AL,0DH
        JE END_READ
        ;CHECK A GREATER AND Z LESS
        CMP AL,' '
        JE CHECK_BELLOW
        CMP AL,'Z'
        JLE MAKE_LOWER
        SUB AL,'a'
        ADD AL,'A'
        JMP CHECK_BELLOW
        MAKE_LOWER:
        SUB AL,'A'
        ADD AL,'a'
        
        CHECK_BELLOW:
        MOV STR[SI],AL
        INC SI
        
        JMP READ
    END_READ:
    MOV STR[SI],'$'
    
    CALL PRINTLINE
    
    ;PRINT
    MOV CX,SI
    MOV SI,0
    
    MOV AH,2
    PRINTSTRING:
        MOV DL,STR[SI]
        INT 21H
        INC SI
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