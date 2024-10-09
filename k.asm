.model small
.stack 100H         ; define uma pilha de 256 bytes (100H)
.data
    VIDEO_SEGMENT dw 0A000h
    
    NAVE_X dw 2Fh          ;Posicao inicial X da nave principal
    NAVE_Y dw 64h          ;Posicao inicial Y da nave principal
    ALIEN_X dw 104h        ;Posicao inicial X da nave alienigena
    ALIEN_Y dw 64h         ;Posicao inicial Y da nave alienigena
    NAVE_HEIGHT dw 9       ;Altura da nave (9 pixels)
    NAVE_WIDTH dw 15       ;Largura da nave (15 pixels)
    SCREEN_HEIGHT dw 200   ;Altura da tela (320x200 modo gr?fico)
    VELOCIDADE_NAVE dw 4   ; Velocidade da nave principal
    
    NAVE_FIXA_Y dw 0, 19, 38, 57, 76, 95, 114, 133 ;coordenadas das 8 naves fixas
    NAVE_CORES db 9h, 0Ah, 6h, 5h, 0Eh, 7h, 0Dh, 0Ch ; Cores das naves
    ;;escreve ARCADE GAME na tela
    ASCII_ART  db  ' ___ _______  ____ _____    __| _/____ ',
               db  ' \__ \\_  __ \/ ___\\__  \  / __ |/ __ \',
               db  '  / _ \|  | \|  \___ / __ \/ /_/ \  ___/',
               db  ' (___  /__|   \___  >____  |____ |\___  ',
               db  '    \/           \/     \/     \/    \/$',
.code

DRAW_ALL_NAVES proc
    ; Desenhar as 8 naves
    mov CX, 8          
    xor BX, BX 
    
    DRAW_LOOP:
    mov AX, BX           
    shl AX, 1            ; Cada entrada em NAVE_FIXA_Y tem 2 bytes, por isso desloca
    mov SI, offset NAVE_FIXA_Y  
    add SI, AX           ; Calcula o endereco Y da nave e passa para DX
    mov DX, [SI]         ; DX e a posicao Y das naves fixas 
    
    mov AL, [NAVE_CORES + BX]   ; Cor da nave fixa
    
    push CX              ; Salvar contador do loop (CX)
    call DRAW_NAVE       ; Desenhar a nave fixa
    pop CX
    inc BX               ; Proxima nave fixa
    loop DRAW_LOOP       ; Decrementa CX=8 ate CX=0
    
    
    ; Desenhar a nave principal
    mov CX, NAVE_X       
    mov DX, NAVE_Y       
    mov AL, 0Fh          ; Cor da nave principal
    call DRAW_NAVE      

    ret
endp



DRAW_NAVE proc
    mov AX, VIDEO_SEGMENT
    mov ES, AX    ; Configura ES para apontar para o segmento de video

    ; Calcular o endereco de video baseado em X e Y (posicao da nave)
    mov AX, 320
    mul DX  
    add AX, CX
    mov DI, AX     ; DI recebe a posicao de memoria de video
    
    
    ; Desenhar a nave usando a cor passada em AL
    mov CX, 9        ; Numero de pixels a desenhar na primeira linha
    rep stosb        ; Desenha a primeira linha da nave
    add DI, 320 - 7  ; Avanca 1 linha e ajusta a posicao

    mov CX, 2        ; Segunda linha
    rep stosb        
    add DI, 320 - 2
    
    mov CX, 2        ; Terceira linha
    rep stosb        
    add DI, 320 - 2

    mov CX, 6        ; Quarta linha
    rep stosb        
    add DI, 320 - 6

    mov CX, 13       ; Quinta linha
    rep stosb        
    add DI, 320 - 13

    mov CX, 6        ; Sexta linha
    rep stosb        
    add DI, 320 - 6

    mov CX, 2        ; Setima linha
    rep stosb        
    add DI, 320 - 2

    mov CX, 2        ; Oitava linha
    rep stosb        
    add DI, 320 - 4

    mov CX, 9        ; Nona linha
    rep stosb

    ret
endp



DRAW_ALIEN proc
    mov AX,VIDEO_SEGMENT
    mov ES,AX   ; Configura ES para apontar para o segmento de video

    ; Calcular o endereco de video baseado em X e Y (posicao da nave)
    mov BX, ALIEN_Y 
    mov AX, 320
    mul BX           ; AX = NAVE_Y * 320 (cada linha tem 320 pixels)
    add AX, ALIEN_X 
    mov DI, AX       ; DI recebe a posicao de memoria de video
    

    mov AL, 9h      ; Cor do pixel (branca)
    
    
    ; Desenhar a nave usando a cor passada em AL
    add DI, 9
    mov CX, 6        ; Numero de pixels a desenhar na primeira linha
    rep stosb        ; Desenha a primeira linha da nave
    add DI, 320 - 6  ; Avanca 1 linha e ajusta a posicao

    mov CX, 1        ; Segunda linha
    rep stosb        
    add DI, 320 - 7
    
    mov CX, 0        ; Terceira linha
    rep stosb        
    add DI, 320 - 0

    mov CX, 5        ; Quarta linha
    rep stosb        
    add DI, 320 - 9

    mov CX, 13       ; Quinta linha
    rep stosb        
    add DI, 320 - 8

    mov CX, 5        ; Sexta linha
    rep stosb        
    add DI, 320 + 1

    mov CX, 0        ; Setima linha
    rep stosb        
    add DI, 320 - 0

    mov CX, 2        ; Oitava linha
    rep stosb        
    add DI, 320 - 2

    mov CX, 6        ; Nona linha
    rep stosb

    ret
endp

DRAW_MENU proc
    ;; Escreve o nome do jogo que esta na area de dados
    mov AX, VIDEO_SEGMENT
    mov ES, AX
    mov SI, offset ASCII_ART
    mov DX, SI
    call PRINT_STRING
endp

; Escreve uma string terminada por '$' na tela, cujo endereço
; está no registrador DX
PRINT_STRING proc
    push AX
    mov AH, 09h
    int 21h
    pop AX
    ret
endp


MOVE_NAVE proc
    push AX
    ; Esperar por uma tecla pressionada
    call GET_INPUT
    jz END_MOVE_NAVE      ; Se nao houver tecla pressionada, sai do procedimento

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
    pop AX
    ret
endp



CLEAR_NAVE proc
    ; Recebe a posi??o X e Y em NAVE_X, NAVE_Y
    mov AX, VIDEO_SEGMENT
    mov ES, AX   ; Configura ES para apontar para o segmento de v?deo

    ; Calcular o endere?o de v?deo baseado em X e Y (posi??o da nave)
    mov BX, NAVE_Y 
    mov AX, 320
    mul BX           ; AX = NAVE_Y * 320 (cada linha tem 320 pixels)
    add AX, NAVE_X
    mov DI, AX       ; DI recebe a posi??o de mem?ria de v?deo

    ; Apagar a nave usando a cor preta (0)
    mov AL, 0        ; Cor do fundo (preto)
    mov CX, 9        ; N?mero de pixels a apagar na primeira linha
    rep stosb        ; Apaga a primeira linha da nave
    add DI, 320 - 7  ; Avan?a 1 linha e ajusta a posi??o

    ; Apagar as linhas restantes da nave
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


GET_INPUT proc
    mov AH, 01h
    int 16h
    jz GET_INPUT_EXIT

    mov AH, 00h
    int 16h

    GET_INPUT_EXIT:
    ret
endp


LIMPA_TELA proc
    mov AX, 13h     ;Configurar modo gr?fico 320x200 com 256 cores
    int 10h
    ret
endp

INICIO:   
    mov AX,@DATA
    mov DS,AX 
            
    call LIMPA_TELA
    call DRAW_MENU
    WAIT_MEU:
    call GET_INPUT
    cmp AL, 'S'
    jne WAIT_MEU

    call LIMPA_TELA

    WAIT_LOOP:      ; Loop infinito para manter o gr?fico na tela
    call MOVE_NAVE  ; Mover a nave principal
    call DRAW_ALL_NAVES
    call DRAW_ALIEN
    jmp WAIT_LOOP
        
end INICIO