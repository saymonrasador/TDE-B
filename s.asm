.model small
.stack 100H         ; define uma pilha de 256 bytes (100H)
.data     
    WINDOW_WIDTH dw 140h
    WINDOW_HEIGHT dw 0C8h
    WINDOW_BOUNDS dw 6 ;tamanho da borda da tela

    TIME_AUX db 0

    BALL_ORIGINAL_X dw 0A0h
    BALL_ORIGINAL_Y dw 64h
    BALL_X dw 0A0h
    BALL_Y dw 64h
    BALL_SIZE dw 04h;tamanho da bola (04h = 5 pixels)
    BALL_VELOCITY_X dw 05h
    BALL_VELOCITY_Y dw 02h
    
    PADDLE_LEFT_X dw 0Ah
    PADDLE_LEFT_Y dw 0Ah
    
    PADDLE_RIGHT_X dw 130h
    PADDLE_RIGHT_Y dw 0Ah
    
    PADDLE_WIDTH dw 05h
    PADDLE_HEIGHT dw 1fh
    PADDLE_VELOCITY dw 05h
    
    
.code  
  
MOVE_PADDLES proc
     mov AH,01h             ;pega o status do teclado  
     int 16h                ;configuracao do teclado
     JZ CHECK_RIGHT_PADDLE_MOVEMENT

     
     mov AH,00h             ;espera ler tecla e le caractere
     INT 16h
     
     cmp AL,77h             ;letra w
     JE MOVE_LEFT_PADDLE_UP
     cmp AL,57h             ;letra W
     JE MOVE_LEFT_PADDLE_UP
     
     cmp AL,73h             ;letra S
     JE MOVE_LEFT_PADDLE_DOWN
     cmp AL,53h             ;letra s
     JE MOVE_LEFT_PADDLE_DOWN
     jmp CHECK_RIGHT_PADDLE_MOVEMENT
     
     MOVE_LEFT_PADDLE_UP:
        mov AX,PADDLE_VELOCITY
        sub PADDLE_LEFT_Y,AX
        
        MOV AX, WINDOW_BOUNDS
        cmp PADDLE_LEFT_Y,AX
        JL FIX_PADDLE_LEFT_TOP_POSITION
        jmp CHECK_RIGHT_PADDLE_MOVEMENT
        
        FIX_PADDLE_LEFT_TOP_POSITION:
            mov PADDLE_LEFT_Y,AX
            jmp CHECK_RIGHT_PADDLE_MOVEMENT
          
    MOVE_LEFT_PADDLE_DOWN:
        mov AX,PADDLE_VELOCITY
        add PADDLE_LEFT_Y,AX
        mov AX,WINDOW_HEIGHT
        sub AX,WINDOW_BOUNDS
        sub AX,PADDLE_HEIGHT
        cmp PADDLE_LEFT_Y, AX
        JG FIX_PADDLE_LEFT_BOTTOM_POSITION
        jmp CHECK_RIGHT_PADDLE_MOVEMENT
    
        FIX_PADDLE_LEFT_BOTTOM_POSITION:
            mov PADDLE_LEFT_Y,AX
            jmp CHECK_RIGHT_PADDLE_MOVEMENT 
        
        
        
            
    CHECK_RIGHT_PADDLE_MOVEMENT: 
        cmp AL,6fh             ;tecla ?
        JE MOVE_RIGHT_PADDLE_UP
        cmp AL,6ch             ;tecla ?
        JE MOVE_RIGHT_PADDLE_DOWN
        jmp EXIT_PADDLE_MOVIMENT
        
        
        MOVE_RIGHT_PADDLE_UP:
            mov AX,PADDLE_VELOCITY
            sub PADDLE_RIGHT_Y,AX
        
            MOV AX, WINDOW_BOUNDS
            cmp PADDLE_RIGHT_Y,AX
            JL FIX_PADDLE_RIGHT_TOP_POSITION
            jmp EXIT_PADDLE_MOVIMENT
        
            FIX_PADDLE_RIGHT_TOP_POSITION:
                mov PADDLE_RIGHT_Y,AX
                jmp EXIT_PADDLE_MOVIMENT
        
        MOVE_RIGHT_PADDLE_DOWN:
            mov AX,PADDLE_VELOCITY
            add PADDLE_RIGHT_Y,AX
            mov AX,WINDOW_HEIGHT
            sub AX,WINDOW_BOUNDS
            sub AX,PADDLE_HEIGHT
            cmp PADDLE_RIGHT_Y, AX
            JG FIX_PADDLE_RIGHT_BOTTOM_POSITION
            jmp EXIT_PADDLE_MOVIMENT
    
            FIX_PADDLE_RIGHT_BOTTOM_POSITION:
                mov PADDLE_RIGHT_Y,AX
                jmp EXIT_PADDLE_MOVIMENT
        
    EXIT_PADDLE_MOVIMENT:
        

ret
endp



RESET_BALL_POSITION proc
    mov AX, BALL_ORIGINAL_X
    mov BALL_X, AX
    
    mov AX, BALL_ORIGINAL_Y
    mov BALL_Y, AX

ret
endp


DRAW_BALL proc
    mov CX,BALL_X      ;coluna (X)
    mov DX,BALL_Y      ;linha (Y)
    
    DRAW_BALL_HORIZONTAL:
        mov AH,0Ch      ;configura??o de pixel
        mov AL,0Fh      ;cor do pixel BRANCA
        mov BH,00h      ;define o numero da pagina
        int 10h
        
        inc CX
       
        mov AX,CX       ; verifica se CX-BALL>BALL_SIZE. Caso for pula a linha
        sub AX,BALL_X   
        cmp AX,BALL_SIZE
        JNG DRAW_BALL_HORIZONTAL
        
        mov CX,BALL_X   ;CX vai para o inicio da coluna
        inc DX          ;Pula para linha de baixo
        
        mov AX,DX
        sub AX,BALL_Y
        cmp AX,BALL_SIZE
        JNG DRAW_BALL_HORIZONTAL
    
ret
endp


DRAW_PADDLES proc
    mov CX,PADDLE_LEFT_X      ;coluna (X)
    mov DX,PADDLE_LEFT_Y      ;linha (Y)

    DRAW_PADDLE_LEFT_HORIZONTAL:
        mov AH,0Ch      ;configura?a? de pixel
        mov AL,0Fh      ;cor do pixel BRANCA
        mov BH,00h      ;define o numero da pagina
        int 10h
        
        inc CX
           
        mov AX,CX       ;verifica se CX-BADDLE_LEFT_X>PADDLE_WIDTH. Caso for pula a linha
        sub AX,PADDLE_LEFT_X 
        cmp AX,PADDLE_WIDTH
        JNG DRAW_PADDLE_LEFT_HORIZONTAL
         
        mov CX,PADDLE_LEFT_X   ;CX vai para o inicio da coluna
        inc DX          ;Pula para linha de baixo
            
        mov AX,DX   ;verifica se DX-BADDLE_LEFT_Y>PADDLE_HEIGTH. Caso for pula a linha
        sub AX,PADDLE_LEFT_Y
        cmp AX,PADDLE_HEIGHT
        JNG DRAW_PADDLE_LEFT_HORIZONTAL

      
        
    mov CX,PADDLE_RIGHT_X      ;coluna (X)
    mov DX,PADDLE_RIGHT_Y      ;linha (Y)
    
    DRAW_PADDLE_RIGHT_HORIZONTAL:
        mov AH,0Ch      ;configura?a? de pixel
        mov AL,0Fh      ;cor do pixel BRANCA
        mov BH,00h      ;define o numero da pagina
        int 10h
        
        inc CX
           
        mov AX,CX       ;verifica se CX-BADDLE_LEFT_X>PADDLE_WIDTH. Caso for pula a linha
        sub AX,PADDLE_RIGHT_X 
        cmp AX,PADDLE_WIDTH
        JNG DRAW_PADDLE_RIGHT_HORIZONTAL
         
        mov CX,PADDLE_RIGHT_X   ;CX vai para o inicio da coluna
        inc DX          ;Pula para linha de baixo
            
        mov AX,DX   ;verifica se DX-BADDLE_LEFT_Y>PADDLE_HEIGTH. Caso for pula a linha
        sub AX,PADDLE_RIGHT_Y
        cmp AX,PADDLE_HEIGHT
        JNG DRAW_PADDLE_RIGHT_HORIZONTAL
ret
endp




CLEAR_SCREEN proc
    mov AH,00h      ;configura??o de video
    mov AL,13h      ;escolhendo a configura??o de video 
    int 10h
    
    mov AH,0Bh      ;configura??o de background
    mov BH,00h      ;configura??o de background
    mov BL,00h      ;cor fundo PRETO
    int 10h
ret
endp


MOVE_BALL proc
    
    ;X
    mov AX,BALL_VELOCITY_X
    add BALL_X,AX
    
    mov AX,WINDOW_BOUNDS
    cmp BALL_X,AX
    JL RESET_POSITION
    
    mov AX,WINDOW_WIDTH
    sub AX,BAll_SIZE
    sub AX,WINDOW_BOUNDS
    cmp BALL_X,AX   ;BALL_X>WINDOW_WIDTCH-BALL_SIZE (Y colide)
    JG RESET_POSITION
     
    jmp MOVE_BALL_VERTICALLY
    RESET_POSITION:
        call RESET_BALL_POSITION
        ret
    
    ;Y
    MOVE_BALL_VERTICALLY:
        mov AX,BALL_VELOCITY_Y
        add BALL_Y,AX
    
    mov AX,WINDOW_BOUNDS
    cmp BALL_Y,AX
    JL NEG_VELOCITY_Y ;BALL_Y<0 (x colide)
    
    mov AX,WINDOW_HEIGHT
    sub AX,BAll_SIZE
    sub AX,WINDOW_BOUNDS
    cmp BALL_Y,AX   ;BALL_Y>WINDOW_HEIGHT-BALL_SIZE (x colide)
    JG NEG_VELOCITY_Y
    
    
    ;BALL_X + BALL_SIZE > PADDLE_RIGHT_X    && 
    ;BALL_X < PADDLE_RIGHT_X + PADDLE_WIDTH && 
    ;BALL_Y + BALL_SIZE > PADDLE_RIGHT_Y    && 
    ;BALL_Y < PADDLE_RIGHT_Y + PADDLE_HEIGHT
    
    mov AX,BALL_X
    add AX,BALL_SIZE
    cmp AX,PADDLE_RIGHT_X
    JNG CHECK_COLLISION_WITH_LEFT_PADDLE
    
    mov AX,PADDLE_RIGHT_X
    add AX,PADDLE_WIDTH
    cmp BALL_X,AX
    JNL CHECK_COLLISION_WITH_LEFT_PADDLE
    
    mov AX,BALL_Y
    add AX,BALL_SIZE
    cmp AX,PADDLE_RIGHT_Y
    JNG CHECK_COLLISION_WITH_LEFT_PADDLE
    
    mov AX,PADDLE_RIGHT_Y
    add AX,PADDLE_HEIGHT
    cmp BALL_Y,AX
    JNL CHECK_COLLISION_WITH_LEFT_PADDLE
    
    jmp NEG_VELOCITY_X           
    
    
    
    ;BALL_X + BALL_SIZE > PADDLE_LEFT_X    && 
    ;BALL_X < PADDLE_LEFT_X + PADDLE_WIDTH && 
    ;BALL_Y + BALL_SIZE > PADDLE_LEFT_Y    && 
    ;BALL_Y < PADDLE_LEFT_Y + PADDLE_HEIGHT
    
    CHECK_COLLISION_WITH_LEFT_PADDLE:
        mov AX,BALL_X
        add AX,BALL_SIZE
        cmp AX,PADDLE_LEFT_X
        JNG EXIT_COLLISION_CHECK
        
        mov AX,PADDLE_LEFT_X
        add AX,PADDLE_WIDTH
        cmp BALL_X,AX
        JNL EXIT_COLLISION_CHECK
        
        mov AX,BALL_Y
        add AX,BALL_SIZE
        cmp AX,PADDLE_LEFT_Y
        JNG EXIT_COLLISION_CHECK
        
        mov AX,PADDLE_LEFT_Y
        add AX,PADDLE_HEIGHT
        cmp BALL_Y,AX
        JNL EXIT_COLLISION_CHECK
        
        jmp NEG_VELOCITY_X
        
        
    NEG_VELOCITY_Y:
        neg BALL_VELOCITY_Y
        ret
    NEG_VELOCITY_X:
        neg BALL_VELOCITY_X
        ret            
    EXIT_COLLISION_CHECK:
        ret 
        
endp


    
INICIO:   
    mov AX, @DATA
    mov DS, AX 
             
    call CLEAR_SCREEN
    
    CHECK_TIME:
        mov AH,2Ch      ;configura??o do tempo do sistema
        int 21h
    
        cmp DL,TIME_AUX
        JE CHECK_TIME   ;se o tempo ? o mesmo, check novamente
    
        mov TIME_AUX,DL ;atualiza o tempo
        
        call CLEAR_SCREEN
        call MOVE_BALL
        call DRAW_BALL
        CALL MOVE_PADDLES
        call DRAW_PADDLES
        
        jmp CHECK_TIME

     
end INICIO

