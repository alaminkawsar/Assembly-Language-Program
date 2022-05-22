.MODEL SMALL
.STACK 100H

.DATA
STR DB 50 DUP('$')
NEWLINE DB 0AH,0DH,'$'
VOWEL DB '0'
CONSONANT DB '0'
DIGIT DB '0'
WORD DB '1'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV SI,0
    MOV AH,1
    
    READ:
        INT 21H
        CMP AL,0DH
        JE END_READ
        
        MOV STR[SI],AL
        INC SI
        
        JMP READ
    END_READ:
    
    MOV CX,SI
    MOV SI,0
    
    ITERATE:
        MOV AL,STR[SI]
        
        CMP AL,' '
        JE GO_WO
        
        CMP AL,'a'
        JE GO_VO
        
        CMP AL,'e'
        JE GO_VO
        
        CMP AL,'i'
        JE GO_VO
        
        CMP AL,'o'
        JE GO_VO
        
        CMP AL,'u'
        JE GO_VO
        
        CMP AL,'1'
        JGE CHECK_9
        CHECK_9:
        CMP AL,'9'
        JLE GO_DIG
        
        INC CONSONANT
        JMP LAST
        
        GO_DIG:
        INC DIGIT
        JMP LAST
        
        GO_VO:
        INC VOWEL
        JMP LAST
        
        GO_WO:
        INC WORD
        
        LAST:
        INC SI
        
    LOOP ITERATE
    
    CALL PRINTLINE
    
    ;WORDS PRINT
    MOV DL,WORD
    MOV AH,2
    INT 21
    
    CALL PRINTLINE
    
    ;VOWELS PRINT
    MOV DL, VOWEL
    MOV AH,2
    INT 21H
    
    CALL PRINTLINE
    
    ;CONSONANT
    MOV DL, CONSONANT
    MOV AH,2
    INT 21H
    
    CALL PRINTLINE
    
    ;DIGIT
    MOV DL, DIGIT
    MOV AH,2
    INT 21H
    
    
    
    MAIN ENDP

PRINTLINE PROC
    PUSH AX
    PUSH DX
    
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H
    
    POP DX
    POP AX
    
    PRINTLINE ENDP
END MAIN
    
    
        
            
    
        
    