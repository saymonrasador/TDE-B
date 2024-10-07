.model small
.stack 100H         ; define uma pilha de 256 bytes (100H)
.data
    VIDEO_SEGMENT dw 0A000h
    
    NAVE_X dw 2Fh          ;Posicao inicial X da nave
    NAVE_Y dw 64h           ;Posicao inicial Y da nave
    NAVE_HEIGHT dw 9        ;Altura da nave (9 pixels)
    NAVE_WIDTH dw 15        ;Largura da nave (15 pixels)
    SCREEN_HEIGHT dw 200    ;Altura da tela (320x200 modo gr?fico)
    VELOCIDADE_NAVE dw 4 ; Velocidade da nave (n?mero de pixels por movimento)
.code


DRAW_NAVE proc
    mov AX,VIDEO_SEGMENT
    mov ES,AX   ; Configura ES para apontar para o segmento de video

    ; Calcular o endereco de video baseado em X e Y (posicao da nave)
    mov BX, NAVE_Y 
    mov AX, 320
    mul BX           ; AX = NAVE_Y * 320 (cada linha tem 320 pixels)
    add AX, NAVE_X 
    mov DI, AX       ; DI recebe a posicao de memoria de video
    

    mov AL, 0Fh      ; Cor do pixel (branca)
    
   ; Desenhar a nave usando rep stosb
    mov CX, 9            ; N?mero de pixels a desenhar na primeira linha
    rep stosb            ; Desenha a primeira linha da nave
    add DI, 320 - 7      ; Avan?a 1 linha e ajusta a posi??o

    mov CX, 2            
    rep stosb            
    add DI, 320 - 2      

    mov CX, 2           
    rep stosb          
    add DI, 320 - 2     

    mov CX, 6           
    rep stosb            
    add DI, 320 - 6     

    mov CX, 13          
    rep stosb            
    add DI, 320 - 13    

    mov CX, 6            
    rep stosb           
    add DI, 320 - 6     

    mov CX, 2            
    rep stosb           
    add DI, 320 - 2     

    mov CX, 2            
    rep stosb          
    add DI, 320 - 4    

    mov CX, 9           
    rep stosb          

    ret
endp


CLEAR_NAVE proc
    mov AX, VIDEO_SEGMENT
    mov ES, AX   ; Configura ES para apontar para o segmento de v?deo

    ; Calcular o endere?o de v?deo baseado em X e Y (posi??o da nave)
    mov BX, NAVE_Y
    mov AX, 320
    mul BX           ; AX = NAVE_Y * 320 (cada linha tem 320 pixels)
    add AX, NAVE_X
    mov DI, AX       ; DI recebe a posi??o de mem?ria de v?deo

    mov AL, 00h      ; Cor do fundo (preto)
    
    
    ; Apagar a nave usando rep stosb
    mov CX, 9            ; N?mero de pixels a apagar na primeira linha
    rep stosb            ; Apaga a primeira linha da nave
    add DI, 320 - 7      ; Avan?a 1 linha e ajusta a posi??o

    mov CX, 2            
    rep stosb            
    add DI, 320 - 2      

    mov CX, 2           
    rep stosb            
    add DI, 320 - 2     

    mov CX, 6           
    rep stosb        
    add DI, 320 - 6      

    mov CX, 13          
    rep stosb           
    add DI, 320 - 13    

    mov CX, 6            
    rep stosb         
    add DI, 320 - 6      

    mov CX, 2          
    rep stosb          
    add DI, 320 - 2     

    mov CX, 2           
    rep stosb          
    add DI, 320 - 4    

    mov CX, 9          
    rep stosb         

    ret
endp


MOVE_NAVE proc
    ; Esperar por uma tecla pressionada
    mov AH, 01h          ; Checar se uma tecla foi pressionada
    int 16h              ; int do teclado
    jz END_MOVE_NAVE     ; Se nenhuma tecla foi pressionada, sai do procedimento
    mov AH, 00h          ; L? a tecla pressionada
    int 16h              ; int do teclado

    cmp AH, 48h          ; C?digo da seta para cima (?)
    je MOVE_UP
    cmp AH, 50h          ; C?digo da seta para baixo (?)
    je MOVE_DOWN
    jmp END_MOVE_NAVE    ; Se n?o for uma das teclas esperadas, sai do procedimento
    
    MOVE_UP:
    call CLEAR_NAVE      ; Apaga a nave na posi??o atual
    cmp NAVE_Y, 0        ; Verifica se a nave est? no limite superior
    jle END_MOVE_NAVE    ; Se j? est? no topo, n?o faz nada
    mov AX, VELOCIDADE_NAVE
    sub NAVE_Y, AX       ; Move a nave para cima diminuindo Y
    call DRAW_NAVE       ; Desenha a nave na nova posi??o
    jmp END_MOVE_NAVE

    MOVE_DOWN:
    call CLEAR_NAVE      ; Apaga a nave na posi??o atual
    mov AX, NAVE_Y       ; Verificar se a nave est? no limite inferior da tela
    add AX, NAVE_HEIGHT
    cmp AX, SCREEN_HEIGHT; Verifica se a nave vai ultrapassar a tela
    jge END_MOVE_NAVE    ; Se j? est? no limite inferior, n?o faz nada
    mov AX, VELOCIDADE_NAVE
    add NAVE_Y, AX       ; Move a nave para baixo aumentando Y
    call DRAW_NAVE       ; Desenha a nave na nova posi??o
    
    END_MOVE_NAVE:
    ret
endp



INICIO:   
    mov AX,@DATA
    mov DS,AX 
            
    mov AX, 13h     ;Configurar modo grafico 320x200 com 256 cores
    int 10h
   
    WAIT_LOOP:      ; Loop infinito para manter o grafico na tela
    call DRAW_NAVE
    call MOVE_NAVE
    jmp WAIT_LOOP
        
end INICIO