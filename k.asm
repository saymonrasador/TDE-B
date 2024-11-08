.model small
.stack 100H         ; Pilha de 256 bytes

.data
    VIDEO_SEGMENT dw 0A000H 
    
    NAVE_ALIADA db 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0h, 0h, 0h, 0h, 0h, 0h 
              db 0h,   0H, 0Fh, 0Fh, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h  
              db 0h,   0h, 0Fh, 0Fh, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h  
              db 0h,   0h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h 
              db 0h,   0h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh
              db 0h,   0h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h 
              db 0h,   0h, 0Fh, 0Fh, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h  
              db 0h,   0h, 0Fh, 0Fh, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h 
              db 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0h, 0h, 0h, 0h, 0h, 0h
              
    NAVE_ALIENIGENA db 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 09h, 09h, 09h, 09h, 09h, 09h 
              db 0h, 0H, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 09h, 09h, 0h, 0h, 0h, 0h  
              db 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h  
              db 0h, 0h, 0h, 0h, 09h, 09h, 09h, 09h, 09h, 0h, 0h, 0h, 0h, 0h, 0h 
              db 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 0h, 0h, 0h
              db 0h, 0h, 0h, 0h, 09h, 09h, 09h, 09h, 09h, 0h, 0h, 0h, 0h, 0h, 0h 
              db 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h  
              db 0h, 0H, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 09h, 09h, 0h, 0h, 0h, 0h  
              db 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 09h, 09h, 09h, 09h, 09h, 09h 

    DESENHO_TIRO db 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h 
              db 0h, 0H, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h  
              db 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h  
              db 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h 
              db 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh
              db 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h 
              db 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h  
              db 0h, 0H, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h  
              db 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h 
                    
    NAVE_PRINCIPAL_X dw 2Fh         ; Posicao X da nave principal
    NAVE_PRINCIPAL_Y dw 50h         ; Posicao Y da nave principal
    NAVE_ALIENIGENA_X dw 10Eh     ; Posicao X da nave alienigena
    NAVE_ALIENIGENA_Y dw 50h      ; Posicao Y da nave alienigena
    TIRO_X dw 1Fh               ; Posicao X do tiro
    TIRO_Y dw 50h               ; Posicao Y do tiro
    TIRO_ATIVO db 0    ; 0 = tiro inativo, 1 = tiro ativo
    NAVE_Y_START dw 20              ; Posicao inicial Y da primeira nave fixa
    SPACING     dw 20               ; Espacamento entre as naves
    COR_NAVES db 0Eh, 05h, 09h, 0Ah, 0Bh, 0Ch, 0Dh, 04h
    VELOCIDADE dw 3 
    
.code

SET_VIDEO_MODE proc
    mov AX, 0013h       ; Modo de video 13h (320x200, 256 cores)
    int 10h         
    ret
endp

;------------------- DESENHAR -------------------

DRAW_8_NAVES proc
    mov CX, 8          
    mov DX, NAVE_Y_START     ; Posicao Y inicial das naves fixas

    DRAW_LOOP:
    push DX         ; Salva DX pois e a posicao de cada uma das naves         
    push CX         ; Salva CX pois e o contador do loop             

    ; Definir a cor
    mov SI, CX               
    mov BX, OFFSET COR_NAVES
    mov AL, [BX + SI]        ; CX muda o valor de COR_NAVES e guarda em AL
    
    mov CX, 0           ; Posicao X=0
    call DRAW_DESENHO  

    pop CX              
    pop DX              
    add DX, SPACING     ; Quantidade de espacamento entre as naves
    loop DRAW_LOOP
    
    ret
endp


DRAW_DESENHO proc
    push AX     ; Salva o tipo de nave (AH) e a cor da nave (AL)
      
    mov AX, VIDEO_SEGMENT   ; ES aponta para o segmento de video
    mov ES, AX
    
    ; Calcular posicao da nave --> CX=X e DX=Y
    mov AX, 320  
    mul DX            ; Multiplica Y por 320 para achar a linha(Y)
    add AX, CX        ; Soma o deslocamento para achar a coluna(X)
    mov DI, AX        ; DI aponta para o pixel da nave
    
    pop AX               
    
    cmp AH, 1         
    je DRAW_ALIADA
    cmp AH, 2           
    je DRAW_ALIENIGENA
    cmp AH, 3           
    je DRAW_DESENHO_TIRO
    DRAW_ALIADA:
    mov SI, OFFSET NAVE_ALIADA  
    jmp CONTINUE_DESENHO
    DRAW_ALIENIGENA:
    mov SI, OFFSET NAVE_ALIENIGENA
    jmp CONTINUE_DESENHO 
    DRAW_DESENHO_TIRO:
    mov SI, OFFSET DESENHO_TIRO  

    
    CONTINUE_DESENHO:
    mov DL, AL          ; Faz uma copia da cor no registrador DL
    push DX             ; Salva a posicao Y da nave
       
    mov CX, 9       ; Definir limites do desenho da nave           
    mov BX, 15          
    CLD             ; Limpa o flag de direcao e incrementa SI/DI
    DRAW_LINE:
    push CX         ; Salvar contador de linhas
    mov CX, BX      ; Contador CX recebe o valor 15 (numero de pixels)
        
    DRAW_PIXEL:
    lodsb               ; Carrega o pixel da nave (apontado por SI) em AL
    cmp AL, 0Fh         ; Verifica se o pixel e 0FH
    jne NOT_0Fh        
    mov AL, DL          ; DL possui o valor original de AL (cor)
    
    NOT_0Fh:
    stosb           ; Aplica a cor de AL no pixel da nave (ES:DI)
    loop DRAW_PIXEL ; loop ate acabar a linha 

    pop CX              ; Contador CX passa a valer 9 novamente (altura da nave)

    mov AX, 320         ; Acha a posicao Y
    sub AX, BX          ; Volta 15 pixels em X      
    add DI, AX          ; Mover DI para a proxima linha
    loop DRAW_LINE      ; loop ate acabar a coluna
    
    pop DX
    ret
endp


DRAW_NAVE_PRINCIPAL proc
    mov DX, NAVE_PRINCIPAL_Y 
    mov CX, NAVE_PRINCIPAL_X 
    mov AL, 0FH         ; Cor da nave
    mov AH, 1           ; Tipo da nave
    call DRAW_DESENHO 

    ret
endp


DRAW_NAVE_ALIENIGENA proc
    mov DX, NAVE_ALIENIGENA_Y
    mov CX, NAVE_ALIENIGENA_X
    mov AL, 09H         ; Cor da nave
    mov AH, 2           ; Tipo da nave
    call DRAW_DESENHO 

    ret
endp


DRAW_TIRO proc
    mov DX, TIRO_Y
    mov CX, TIRO_X
    mov AL, 0FH     ; Cor da nave
    mov AH, 3       ; Tipo da nave
    call DRAW_DESENHO

    ret
endp

;------------------- MOVER -------------------

MOVE_NAVE_PRINCIPAL proc
    mov DX, [NAVE_PRINCIPAL_Y]
    mov BX, [NAVE_PRINCIPAL_X]
    mov CL, 1        ; Tipo da nave
    
    ; Checa se uma tecla foi pressionada
    mov AH, 1       
    int 16h
    jz FIM_MOVE      ; Sai se nenhuma tecla foi pressionada

   ; Pega o valor da tecla pressionada
    mov AH, 0        
    int 16h
    cmp AL, 20h
    je DISPARAR_TIRO 
    cmp AL, 'o'
    je MOVE_UP
    cmp AL, 'O'
    je MOVE_UP
    cmp AL, 'L'
    je MOVE_DOWN
    cmp AL, 'l'
    je MOVE_DOWN  
    
    DISPARAR_TIRO:
    cmp TIRO_ATIVO, 0          ; Verifica se o tiro est? inativo
    jne FIM_MOVE               ; Se j? est? ativo, ignora o comando de disparo
    mov TIRO_ATIVO, 1          ; Ativa o tiro
    mov [TIRO_Y], DX           ; Posi??o Y inicial do tiro
    mov BX, [NAVE_PRINCIPAL_X]
    add BX, 15                 ; Posi??o X inicial do tiro (? frente da nave)
    mov [TIRO_X], BX
    
    FIM_MOVE:
    call MOVE_TIRO 
    ret
endp


MOVE_NAVE_ALIENIGENA proc
    mov DX, [NAVE_ALIENIGENA_Y]
    mov BX, [NAVE_ALIENIGENA_X]
    mov CL, 2       ; Tipo da nave
    
    cmp BX, 1           ; Checa se ja chegou na posicao zero
    jge NAO_REINICIA    ; Salta se BX maior ou igual a 0 
    call APAGAR_NAVE    ; Apaga a nave na posicao 1 
    mov BX, 10Eh        ; Reinicia a posicao para a posicao inicial
    mov [NAVE_ALIENIGENA_X], BX ; Atualiza a posicao X da nave alienigena
    jmp FIM_ALIENIGENA        ; Salta para o final para evitar redesenho
    
    NAO_REINICIA:
    call MOVE_UP
    
    FIM_ALIENIGENA:
    ret
endp



; BX=posicao X / DX=posicao Y 
MOVE_UP proc
    cmp CL, 1
    je VAI_MOVER_PRINCIPAL_UP
    cmp CL, 2
    je VAI_MOVER_ALIENIGENA_UP

    VAI_MOVER_PRINCIPAL_UP:
    mov DI, DX             ; DI contem a posicao atual de Y em pixels
    sub DI, VELOCIDADE 
    cmp DI, 20             ; Limite superior da tela
    jl FIM_UP              ; Se esta acima do limite, termina a funcao
    push DI
    call APAGAR_NAVE
    pop DI 
    mov [NAVE_PRINCIPAL_Y], DI   
    call DRAW_NAVE_PRINCIPAL
    jmp FIM_UP

    VAI_MOVER_ALIENIGENA_UP:
    mov DI, [NAVE_ALIENIGENA_X]             ; DI contem a posicao atual de X em pixels
    sub DI, 3
    push DI
    call APAGAR_NAVE
    pop DI      
    mov [NAVE_ALIENIGENA_X], DI 
    call DRAW_NAVE_ALIENIGENA
    call MOVE_DIAGONAL
    
    FIM_UP:
    ret
endp


; BX=posicao X / DX=posicao Y 
MOVE_DOWN proc 
    cmp CL, 1
    je VAI_MOVER_PRINCIPAL_DOWN
    cmp CL, 3
    je VAI_MOVER_TIRO_DOWN

    VAI_MOVER_PRINCIPAL_DOWN:
    mov DI, DX             ; DI contem a posicao atual de Y em pixels
    add DI, VELOCIDADE 
    cmp DI, 160             ; Limite superior da tela
    jg FIM_DOWN              ; Se esta acima do limite, termina a funcao
    push DI
    call APAGAR_NAVE
    pop DI 
    mov [NAVE_PRINCIPAL_Y], DI   
    call DRAW_NAVE_PRINCIPAL
    jmp FIM_DOWN


    VAI_MOVER_TIRO_DOWN:
    mov DI, [TIRO_X]         ; Carrega a posicao X atual do tiro
    add DI, 7                ; Velocidade do tiro
    cmp DI, 306               ; Limite da tela a direita
    jg DESATIVAR_TIRO         ; Desativa o tiro se ultrapassar o limite da tela
    push DI
    call APAGAR_NAVE           ; Apaga a posicao anterior do tiro
    pop DI
    mov [TIRO_X], DI           ; Atualiza a nova posicao X do tiro
    call DRAW_TIRO             ; Desenha o tiro na nova posicao
    jmp FIM_DOWN

    DESATIVAR_TIRO:
    push DI
    call APAGAR_NAVE           ; Apaga a posicao anterior do tiro
    pop DI
    mov TIRO_ATIVO, 0          ; Desativa o tiro ao ultrapassar o limite da tela

    FIM_DOWN:
    ret
endp


; BX=posicao X / DX=posicao Y 
MOVE_DIAGONAL proc
    VAI_MOVER_DIAGONAL_UP:
    mov DI, [NAVE_ALIENIGENA_Y]             ; DI contem a posicao atual de X em pixels
    sub DI, 1
    push DI
    call APAGAR_NAVE
    pop DI      
    mov [NAVE_ALIENIGENA_Y], DI 
    call DRAW_NAVE_ALIENIGENA
    jmp FIM_DIAGONAL

    VAI_MOVER_DIAGONAL_DOWN:
    mov DI, [NAVE_ALIENIGENA_Y]             ; DI contem a posicao atual de X em pixels
    add DI, 1
    push DI
    call APAGAR_NAVE
    pop DI      
    mov [NAVE_ALIENIGENA_Y], DI 
    call DRAW_NAVE_ALIENIGENA
    
    FIM_DIAGONAL:
    ret
endp


; BX=posicao X / DX=posicao Y
APAGAR_NAVE proc
    mov AX, 320       ; Calcular posicao da nave --> CX=X e DX=Y
    mul DX            ; Multiplica Y por 320 para achar a linha(Y)
    add AX, BX        ; Soma o deslocamento para achar a coluna(X)
    mov DI, AX        ; DI aponta para o pixel da nave

    mov CX, 9           ; Altura da nave fixa (9 pixels de altura)
    mov BX, 15          ; Largura da nave fixa (15 pixels de largura)
    mov AL, 0           ; Cor de apagamento (0 para preto)

    CLD                 ; Limpa o flag de direcao para incrementar SI e DI
    PINTA_PIXEL_PRETO:
    push CX         ; Salva contador de linhas
    mov CX, BX      ; Configura o contador para largura da nave
    rep stosb       ; Apaga a linha com colocando 0 (preto)
    pop CX          ; Restaura contador de linhas
    add DI, 320     ; Vai para a proxima linha no buffer de video
    sub DI, BX
    loop PINTA_PIXEL_PRETO; Repete para cada linha da nave
    ret
endp


MOVE_TIRO proc
    cmp TIRO_ATIVO, 1
    jne FIM_TIRO           

    mov DX, [TIRO_Y]          
    mov BX, [TIRO_X] 
    mov CL, 3
    call MOVE_DOWN
    call CHECK_COLISAO_TIRO

    FIM_TIRO:
    ret
endp


CHECK_COLISAO_TIRO proc
    ; Verificar se ha sobreposicao na posicao X
    mov AX, [TIRO_X]             
    mov CX, [NAVE_ALIENIGENA_X]   
    add CX, 15                     ; Largura do desenho
    cmp AX, [NAVE_ALIENIGENA_X]
    jl FIM_COLISAO                 ; Se o tiro estiver a esquerda, nenhuma colisao
    cmp AX, CX
    jg FIM_COLISAO                 ; Se o tiro estiver a direita, nenhuma colisao  
    
    ; Verificar se h? sobreposi??o na posi??o Y
    mov AX, [TIRO_Y]               
    mov CX, [NAVE_ALIENIGENA_Y]   
    sub CX, 9                      ; Altura do desenho
    cmp AX, CX
    jl FIM_COLISAO                 ; Se o tiro estiver acima, sem colis?o
    mov CX, [NAVE_ALIENIGENA_Y]    ; Restaura posi??o inicial da nave alien?gena
    add CX, 9                      ; Altura do desenho
    cmp AX, CX
    jg FIM_COLISAO                 ; Se o tiro estiver abaixo, sem colis?o
    
    ; Apaga o tiro na posicao atual
    mov BX, [TIRO_X]
    mov DX, [TIRO_Y]
    call APAGAR_NAVE
    
    ; Apagar nave alienigena na posicao atual
    mov TIRO_ATIVO, 0              ; Desativa o tiro
    mov BX, [NAVE_ALIENIGENA_X]
    mov DX, [NAVE_ALIENIGENA_Y]
    call APAGAR_NAVE               

    mov NAVE_ALIENIGENA_X, 10Eh     ; Redefinir a posicao da nave alienigena   

    FIM_COLISAO:
    ret
endp


;------------------- INICIO -------------------
INICIO:   
    mov AX,@DATA 
    mov DS,AX

    call SET_VIDEO_MODE
    call DRAW_8_NAVES
    
    ;call DRAW_TIRO
    call DRAW_NAVE_PRINCIPAL 
    call DRAW_NAVE_ALIENIGENA

    
    MAIN_LOOP:
    ; Intervalo de 35 ms (35000 microssegundos)
    mov CX, 0           ; Parte superior (16 bits mais significativos)
    mov DX, 88B8h       ; Define o tempo (88B8H = 35.000)
    mov AH, 86h
    int 15h             ; Executa o delay de 35 ms
    
    call MOVE_NAVE_PRINCIPAL
    call MOVE_NAVE_ALIENIGENA
    call MOVE_TIRO

    jmp MAIN_LOOP        

end INICIO
