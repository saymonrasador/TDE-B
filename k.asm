.model small
.stack 100H         ; Pilha de 256 bytes

.data
    VIDEO_SEGMENT dw 0A000h 
    
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
                    
    NAVE_PRINCIPAL_X dw 2Fh            ; Posicao X da nave principal
    NAVE_PRINCIPAL_Y dw 50h           ; Posicao Y da nave principal
    NAVE_Y_START dw 20               ; Posicao inicial Y da primeira nave fixa
    SPACING     dw 20               ; Espacamento entre as naves
    COR_NAVES db 0Eh, 05h, 09h, 0Ah, 0Bh, 0Ch, 0Dh, 04h
    VELOCIDADE dw 2   
    
.code

SET_VIDEO_MODE proc
    ; Configurar modo de video 13h (320x200, 256 cores)
    mov AX, 0013h    
    int 10h         
    ret
endp



DRAW_NAVE proc
    push BX
    push CX
    push DX
    push SI
    push AX
      
    ; ES aponta para o segmento de video
    mov AX, VIDEO_SEGMENT  
    mov ES, AX
    
    ; Calcular posicao da nave --> CX=X e DX=Y
    mov AX, 320  
    mul DX            ; Multiplica Y por 320 para achar a linha(Y)
    add AX, CX        ; Soma o deslocamento para achar a coluna(X)
    mov DI, AX        ; DI aponta para o pixel da nave

    ; DS aponta para o segmento de dados
    mov AX, @DATA
    mov DS, AX        
    
 
    
    ; Recupera tipo de nave (AH) e a cor da nave (AL)
    pop AX            
    
    ; AH e o tipo da nave
    cmp AH, 1           
    je DRAW_ALIADA
    cmp AH, 2           
    je DRAW_ALIENIGENA
    
    DRAW_ALIADA:
    mov SI, OFFSET NAVE_ALIADA  ; Aponta para o desenho da nave aliada
    jmp CONTINUEE

    DRAW_ALIENIGENA:
    mov SI, OFFSET NAVE_ALIENIGENA ; Aponta para o desenho da nave alien?gena
    
   
    ; AL e a cor da nave
    CONTINUEE:
    mov DL, AL          ; Faz uma c?pia da cor no registrador DL
    push DX             ; Salva a posi??o Y da nave
       
  
    
    ; Definir limites do desenho da nave
    mov CX, 9           
    mov BX, 15          
    
    CLD                 ; Limpa o flag de direcao (incrementa SI/DI)
    DRAW_LINE:
    push CX             ; Salvar contador de linhas
    mov CX, BX          ; Contador CX recebe o valor 15 (numero de pixels)
        
    DRAW_PIXEL:
    lodsb               ; Carrega o pixel da nave (apontado por SI) em AL
    cmp AL, 0Fh         ; Verifica se o pixel e 0FH
    jne NOT_0Fh        
    mov AL, DL          ; DL possui o valor original de AL (cor)
    
    NOT_0Fh:
    stosb               ; Aplica a cor de AL no pixel da nave (ES:DI)
    loop DRAW_PIXEL     ; loop ate acabar a linha 

    pop CX              ; Contador CX passa a valer 9 (altura da nave)
    ; Ajustar DI para pular para proxima linha
    mov AX, 320
    sub AX, BX
    add DI, AX          ; Mover DI para a proxima linha
    loop DRAW_LINE      ; loop ate acabar a coluna
    
    pop DX
    pop SI
    pop DX
    pop CX
    pop BX
    ret
endp



DRAW_8_NAVES proc
    mov CX, 8                ; Contador CX do numero de naves fixas
    mov DX, NAVE_Y_START     ; Posicao Y inicial das naves fixas

    DRAW_LOOP:
    push DX          
    push CX             

    ; Definir a cor
    mov SI, CX                 ; Valor de CX determina a posicao de COR_NAVES
    mov BX, OFFSET COR_NAVES
    mov AL, [BX + SI]          ; Acessa a cor correspondente e guarda em AL
    
    mov CX, 0           ; Posicao X=0
    call DRAW_NAVE  

    pop CX              
    pop DX              
    add DX, SPACING     ; Quantidade de espacamento em DX (Y)
    loop DRAW_LOOP
    
    ret
endp



DRAW_NAVE_PRINCIPAL proc
    mov DX, NAVE_PRINCIPAL_Y 
    mov CX, NAVE_PRINCIPAL_X 
    mov AL, 0FH
    mov AH, 1
    call DRAW_NAVE 

    ret
endp


DRAW_NAVE_ALIENIGENA proc
    mov DX, 80
    mov CX, 160
    mov AL, 09H
    mov AH, 2
    call DRAW_NAVE 

    ret
endp


MOVE_NAVE_PRINCIPAL proc
    ; Verifica se ha uma tecla pressionada
    mov AH, 1          
    int 16h             
    jz NO_UPDATE       

    ; Le codigo das teclas
    mov AH, 0          
    int 16h             
    cmp AL, 'o'
    je MOVE_UP
    cmp AL, 'O'
    je MOVE_UP
    cmp AL, 'l'
    je MOVE_DOWN
    cmp AL, 'L'
    je MOVE_DOWN

    NO_UPDATE:
    ret                 ; Nao houve atualizacao, retorna

    MOVE_UP:
    mov AX, NAVE_PRINCIPAL_Y
    cmp AX,20           ; LIMITE SUPERIOR
    jle NO_UPDATE    
    sub AX, VELOCIDADE                   ; Move a nave para cima
    mov NAVE_PRINCIPAL_Y, AX    ; Atualiza posicao X
    jmp DRAW            ; Apos mover, desenha a nave na nova posicao

    MOVE_DOWN:
    mov AX, NAVE_PRINCIPAL_Y
    cmp AX, 160         ; LIMITE INFERIOR
    jge NO_UPDATE      
    add AX, VELOCIDADE          ; Move a nave para baixo
    mov NAVE_PRINCIPAL_Y, AX    ; Atualiza posicao X

    DRAW:
    call DRAW_NAVE_PRINCIPAL  ; Redesenha a principal na nova posicao
    ret
endp





INICIO:   
    mov AX,@DATA 
    mov DS,AX

    call SET_VIDEO_MODE
    call DRAW_8_NAVES
    call DRAW_NAVE_PRINCIPAL
    call DRAW_NAVE_ALIENIGENA
    
    
    MAIN_LOOP:
    call MOVE_NAVE_PRINCIPAL

    ; Aqui adicionamos o resto da logica do jogo (deteccao de colisao, etc.)

    jmp MAIN_LOOP        

end INICIO