.model small
.stack 100H         ; Pilha de 256 bytes

.data
    VIDEO_SEGMENT dw 0A000H 
    
    NAVE_ALIADA db 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0, 0, 0, 0, 0, 0 
                db 0, 0, 0Fh, 0Fh, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  
                db 0, 0, 0Fh, 0Fh, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  
                db 0, 0, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0, 0, 0, 0, 0, 0, 0, 0 
                db 0, 0, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh
                db 0, 0, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0, 0, 0, 0, 0, 0, 0, 0 
                db 0, 0, 0Fh, 0Fh, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  
                db 0, 0, 0Fh, 0Fh, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
                db 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0, 0, 0, 0, 0, 0
              
    NAVE_ALIENIGENA db 0, 0, 0, 0, 0, 0, 0, 0, 0, 09h, 09h, 09h, 09h, 09h, 09h 
                    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 09h, 09h, 0, 0, 0, 0  
                    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  
                    db 0, 0, 0, 0, 09h, 09h, 09h, 09h, 09h, 0, 0, 0, 0, 0, 0 
                    db 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 09h, 0, 0, 0
                    db 0, 0, 0, 0, 09h, 09h, 09h, 09h, 09h, 0, 0, 0, 0, 0, 0 
                    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  
                    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 09h, 09h, 0, 0, 0, 0  
                    db 0, 0, 0, 0, 0, 0, 0, 0, 0, 09h, 09h, 09h, 09h, 09h, 09h 

    DESENHO_TIRO db 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0, 0, 0, 0, 0, 0, 0, 0 
                 db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  
                 db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  
                 db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
                 db 0, 0, 0, 0, 0, 0, 0, 0, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh
                 db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
                 db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  
                 db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  
                 db 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0, 0, 0, 0, 0, 0, 0, 0 
                    
    NAVE_PRINCIPAL_X dw 2Fh        
    NAVE_PRINCIPAL_Y dw 50h      
    NAVE_ALIENIGENA_X dw 12Ch    
    NAVE_ALIENIGENA_Y dw 50h    
    TIRO_X dw 1Fh        
    TIRO_Y dw 50h         
    TIRO_ATIVO db 0             ; 0 = tiro inativo, 1 = tiro ativo
    NAVE_Y_START dw 20          ; Posicao inicial Y da primeira nave fixa
    SPACING     dw 20           ; Espacamento entre as naves fixas
    COR_NAVE_PRINCIPAl db 0Fh
    COR_NAVES db 0Eh, 05h, 09h, 0Ah, 0Bh, 0Ch, 0Dh, 03h
    VELOCIDADE_PRINCIPAL dw 2
    VELOCIDADE_ALIENIGENA dw 3
    VELOCIDADE_TIRO dw 6
    VELOCIDADE_DIAGONAL dw 2
    
.code

SET_VIDEO_MODE proc
    mov AX, 0013h       ; Modo de video 13h (320x200, 256 cores)
    int 10h         
    ret
endp

;------------------- DESENHAR -------------------

DRAW_8_NAVES proc
    mov CX, 8               ; Numero de naves fixas         
    mov DX, NAVE_Y_START    ; Posicao Y inicial das naves fixas

    DRAW_LOOP:
    push DX                
    push CX                

    ; Definir a cor
    mov SI, CX               
    mov BX, OFFSET COR_NAVES ; BX aponta para vetor das cores
    mov AL, [BX + SI]        ; SI muda o valor conforme CX e guarda a COR em AL
    
    xor BX, BX              ; Naves fixas posicionadas em X=0
    call DRAW_DESENHO
   
    pop CX              
    pop DX              
    add DX, SPACING         ; Espaco entre as naves
    loop DRAW_LOOP
    
    ret
endp

; BX=posicao X / DX=posicao Y / AL=cor
DRAW_DESENHO proc
    push AX                 ; Salva o Tipo do Desenho (AH) e a Cor (AL)
    mov ES, VIDEO_SEGMENT   ; ES aponta para o segmento de video
    
    ; Calcular posicao da nave e armazena em DI
    mov AX, 320  
    mul DX              ; Multiplica Y por 320 para achar a linha(Y)
    add AX, BX          ; Soma o deslocamento para achar a coluna(X)
    mov DI, AX          ; DI aponta para o pixel da nave
    
    pop AX              ; Compara o valor AH = Tipo de Desenho            
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
    push DX            
    
    ; Definir limites do desenho da nave
    mov CX, 9                
    mov BX, 15
    
    CLD                 ; Limpa o flag de direcao e incrementa SI/DI
    DRAW_LINE:
    push CX         
    mov CX, BX          ; Contador CX recebe o valor 15 (comprimento do desenho)
        
    DRAW_PIXEL:
    lodsb               ; Carrega o pixel da nave (apontado por SI) em AL
    cmp AL, 0Fh         ; Verifica se o pixel e 0FH
    jne NOT_0Fh         ; Se nao for preto entao troca a cor atual pela cor AL       
    mov AL, DL          ; lodsb altera valor de AL. DL retorna valor de Al original
    
    NOT_0Fh:
    stosb               ; Aplica a cor de AL no pixel da nave (ES:DI)
    loop DRAW_PIXEL     ; loop ate acabar a linha 
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
    mov BX, NAVE_PRINCIPAL_X 
    mov AL, COR_NAVE_PRINCIPAL   
    mov AH, 1           ; Tipo da nave
    call DRAW_DESENHO 

    ret
endp


DRAW_NAVE_ALIENIGENA proc
    mov DX, NAVE_ALIENIGENA_Y
    mov BX, NAVE_ALIENIGENA_X
    mov AL, 09H         ; Cor da nave
    mov AH, 2           ; Tipo da nave
    call DRAW_DESENHO 

    ret
endp


DRAW_TIRO proc
    mov DX, TIRO_Y
    mov BX, TIRO_X
    mov AL, 0FH     ; Cor da nave
    mov AH, 3       ; Tipo da nave
    call DRAW_DESENHO

    ret
endp

;------------------- MOVER -------------------

MOVE_NAVE_PRINCIPAL proc
    mov DX, [NAVE_PRINCIPAL_Y]
    mov BX, [NAVE_PRINCIPAL_X]
    
    in AL, 60h          ; Porta 60h que detecta multiplas teclas
    
    cmp AL, 48h         ; Codigo da tecla ?
    je MOVE_UP
    cmp AL, 50h         ; Codigo da tecla ?
    je MOVE_DOWN
    cmp AL, 39h         ; Codigo da tecla espaco
    je DISPARAR_TIRO

    FIM_MOVE:
    call MOVE_TIRO     
    ret
   
    DISPARAR_TIRO:
    cmp TIRO_ATIVO, 0          ; Verifica se o tiro esta inativo
    jne FIM_MOVE               ; Se ja esta ativo, ignora o comando de disparo
    mov TIRO_ATIVO, 1          ; Ativa o tiro
    mov [TIRO_Y], DX           ; Posicao Y inicial do tiro
    mov BX, [NAVE_PRINCIPAL_X]
    add BX, 15                 ; Posicao X inicial do tiro (A frente da nave)
    mov [TIRO_X], BX
    ret
endp


MOVE_NAVE_ALIENIGENA proc
    mov DX, [NAVE_ALIENIGENA_Y]
    mov BX, [NAVE_ALIENIGENA_X]
    mov CL, 2       ; Tipo de desenho
    
    cmp BX, 1           ; Checa se ja chegou na posicao zero
    jge NAO_REINICIA    ; Salta se BX maior ou igual a 0 
    call APAGAR_NAVE  
    mov BX, 12Ch        ; Reinicia a posicao da nave alienigena
    mov [NAVE_ALIENIGENA_X], BX
    
    NAO_REINICIA:
    call MOVE_UP        ; Continua o movimento continuo
    
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
    mov DI, DX             ; DI contem a posicao Y atual da nave principal
    sub DI, VELOCIDADE_PRINCIPAL 
    cmp DI, 20             ; Limite superior da tela
    jl FIM_UP              ; Se esta acima do limite, termina a funcao
    push DI
    call APAGAR_NAVE
    pop DI 
    mov [NAVE_PRINCIPAL_Y], DI  ; Atualiza posicao da nave e redesenha   
    call DRAW_NAVE_PRINCIPAL
    jmp FIM_UP

    VAI_MOVER_ALIENIGENA_UP:
    mov DI, [NAVE_ALIENIGENA_X]     ; DI contem a posicao X atual da nave alienigena
    sub DI, VELOCIDADE_ALIENIGENA
    push DI
    call APAGAR_NAVE
    pop DI      
    mov [NAVE_ALIENIGENA_X], DI     ; Atualiza posicao da nave e redesenha 
    call MOVE_DIAGONAL
    call DRAW_NAVE_ALIENIGENA
    
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
    mov DI, DX              ; DI contem a posicao Y atual da nave principal
    add DI, VELOCIDADE_PRINCIPAL
    cmp DI, 160             ; Limite superior da tela
    jg FIM_DOWN             ; Se esta acima do limite, termina a funcao
    push DI
    call APAGAR_NAVE
    pop DI 
    mov [NAVE_PRINCIPAL_Y], DI  ; Atualiza posicao da nave e redesenha    
    call DRAW_NAVE_PRINCIPAL
    jmp FIM_DOWN


    VAI_MOVER_TIRO_DOWN:
    mov DI, [TIRO_X]        ; Carrega a posicao X atual do tiro
    add DI, VELOCIDADE_TIRO                
    cmp DI, 306             ; Limite da tela a direita
    jg DESATIVAR_TIRO 
    push DI
    call APAGAR_NAVE        
    pop DI
    mov [TIRO_X], DI    ; Atualiza posicao do tiro e redesenha
    call DRAW_TIRO          
    jmp FIM_DOWN

    DESATIVAR_TIRO:
    push DI
    call APAGAR_NAVE    ; Apaga a posicao anterior do tiro
    pop DI
    mov TIRO_ATIVO, 0   ; Desativa o tiro ao ultrapassar o limite da tela

    FIM_DOWN:
    ret
endp


; BX=posicao X / DX=posicao Y
APAGAR_NAVE proc
    ; Calcular posicao da nave e armazena em DI
    mov AX, 320       
    mul DX            ; Multiplica Y por 320 para achar a linha(Y)
    add AX, BX        ; Soma o deslocamento para achar a coluna(X)
    mov DI, AX        ; DI aponta para o pixel da nave

    ; Define a largura (BX), altura (CX) e cor (AL) a ser desenhado
    mov CX, 9           
    mov BX, 15        
    mov AL, 0        

    CLD                 ; Limpa o flag de direcao para incrementar SI e DI
    PINTA_PIXEL_PRETO:
    push CX         ; Salva contador de linhas
    mov CX, BX      ; CX recebe a altura do desenho
    rep stosb       ; Substitue todos pixels por 0 (preto)
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
    mov CL, 3   ; Tipo de desenho
    call MOVE_DOWN
    call CHECK_COLISAO_TIRO

    FIM_TIRO:
    ret
endp


; BX=posicao X / DX=posicao Y 
MOVE_DIAGONAL proc
    ; Funcao do BIOS para obter o tempo do sistema
    mov AH, 00H     
    int 1AH              

    ; Usar DX para obter um valor aleatorio entre 0 e 9
    mov AX, DX
    xor DX, DX           ; Zera DX para a divisao
    mov CX, 10           ; Divisor para obter valores entre 0 e 9
    div CX               ; O resto da divisao fica em DX
    ; Decidir direcao com base na paridade de DL
    test DL, 1           ; Verifica se DL e impar (bit menos significativo = 1)
    jnz VAI_MOVER_DIAGONAL_DOWN ; Se DL for impar, mover para baixo
    jmp VAI_MOVER_DIAGONAL_UP   ; Se DL for par, mover para cima

    VAI_MOVER_DIAGONAL_UP:
    mov DI, [NAVE_ALIENIGENA_Y]     
    push DI
    call APAGAR_NAVE
    pop DI      
    sub DI, VELOCIDADE_DIAGONAL
    mov [NAVE_ALIENIGENA_Y], DI 
    call DRAW_NAVE_ALIENIGENA
    jmp FIM_DIAGONAL

    VAI_MOVER_DIAGONAL_DOWN:
    mov DI, [NAVE_ALIENIGENA_Y]     
    push DI
    call APAGAR_NAVE
    pop DI  
    add DI, VELOCIDADE_DIAGONAL    
    mov [NAVE_ALIENIGENA_Y], DI 
    call DRAW_NAVE_ALIENIGENA
    
    FIM_DIAGONAL:
    ret
endp


GERAR_POSICAO_ALEATORIA proc
    ; Funcao do BIOS para obter o tempo do sistema
    mov AH, 00h          
    int 1Ah      

    ; Usar DX para obter um valor aleatorio entre 20 e 80
    mov AX, DX       
    xor DX, DX          ; Zera DX para a divisao
    mov CX, 61          ; Divisor para limitar o valor de AX para 0-60
    div CX              ; Divide AX por 61 (resto em DX)
    add DX, 40          ; Ajuste para posicao 20-80  
    mov [NAVE_ALIENIGENA_Y], DX
    mov [NAVE_ALIENIGENA_X], 12Ch

    ret                 
endp


;------------------- COLIDIR -------------------

CHECK_COLISAO_TIRO proc
    ; Verificar se ha sobreposicao na posicao X
    mov AX, [TIRO_X]             
    mov SI, [NAVE_ALIENIGENA_X]   
    add SI, 15                     ; Largura do desenho
    cmp AX, [NAVE_ALIENIGENA_X]
    jl FIM_COLISAO                 ; Se o tiro estiver a esquerda, nenhuma colisao
    cmp AX, SI
    jg FIM_COLISAO                 ; Se o tiro estiver a direita, nenhuma colisao  
    
    ; Verificar se ha sobreposicao na posicao Y
    mov AX, [TIRO_Y]               
    mov SI, [NAVE_ALIENIGENA_Y]   
    sub SI, 9                      ; Altura do desenho
    cmp AX, SI
    jl FIM_COLISAO                 ; Se o tiro estiver acima, sem colisao
    mov SI, [NAVE_ALIENIGENA_Y]    ; Restaura posicao inicial da nave alienigena
    add SI, 9                      ; Altura do desenho
    cmp AX, SI
    jg FIM_COLISAO                 ; Se o tiro estiver abaixo, sem colisao

    
    ; Apaga o tiro na posicao atual
    mov BX, [TIRO_X]
    mov DX, [TIRO_Y]
    call APAGAR_NAVE
    
    ; Apagar nave alienigena na posicao atual
    mov TIRO_ATIVO, 0              ; Desativa o tiro
    mov BX, [NAVE_ALIENIGENA_X]
    mov DX, [NAVE_ALIENIGENA_Y]
    call APAGAR_NAVE               

    call GERAR_POSICAO_ALEATORIA
    FIM_COLISAO:
    ret
endp


CHECK_COLISAO_8_NAVES proc  
    mov CX, 8                    ; Numero de naves fixas para checar colisao
    mov DX, NAVE_Y_START         ; Posicao Y inicial das naves fixas
    xor BX, BX                   ; Posicao X inicial das naves fixas

    DRAW_LOOP_COLISAO:          
    ; Verificar se ha sobreposicao na posicao X
    mov AX, [NAVE_ALIENIGENA_X]      
    mov SI, BX                      ; Copia valor de BX para SI
    add SI, 15                      
    cmp AX, [NAVE_ALIENIGENA_X]
    jl SEM_COLISAO                  ; Nave esta a esquerda, entao sem colisao
    cmp AX, SI
    jg SEM_COLISAO                  ; Nave esta a direita, entao sem colisao

    ; Verificar se ha sobreposicao na posicao Y
    mov AX, DX                      ; AX = posicao Y da nave fixa atual
    mov SI, [NAVE_ALIENIGENA_Y]     ; Copia valor de BX para SI
    sub SI, 9                       
    cmp AX, SI
    jl SEM_COLISAO                  ; Nave esta acima, entao sem colisao
    mov SI, [NAVE_ALIENIGENA_Y]
    add SI, 9                       
    cmp AX, SI
    jg SEM_COLISAO                  ; Nave esta abaixo, entao sem colisao

    ; Colisao detectada: se cor for diferente de preto, entao apaga nave fixa
    cmp AL, 0h
    jne NOT_0h
    NOT_0h:
    call APAGAR_NAVE  
    jmp FIM_COLISAO_8_NAVES     ; Sair do loop apos detectar colisao

    SEM_COLISAO:                    
    add DX, SPACING             ; Atualiza posicao Y para a proxima nave
    loop DRAW_LOOP_COLISAO      ; Proxima iteracao do loop

    FIM_COLISAO_8_NAVES:
    ret
endp


CHECK_COLISAO_NAVE_PRINCIPAL proc
    ; Verificar se ha sobreposicao na posicao X
    mov AX, [NAVE_ALIENIGENA_X]             
    mov SI, [NAVE_PRINCIPAL_X]   
    add SI, 15                     
    cmp AX, [NAVE_ALIENIGENA_X]
    jl FIM_COLISAO_NAVE_PRINCIPAL  ; Se o tiro estiver a esquerda, nenhuma colisao
    cmp AX, SI
    jg FIM_COLISAO_NAVE_PRINCIPAL  ; Se o tiro estiver a direita, nenhuma colisao  
    
    ; Verificar se ha sobreposicao na posicao Y
    mov AX, [NAVE_PRINCIPAL_Y]               
    mov SI, [NAVE_ALIENIGENA_Y]   
    sub SI, 9                      
    cmp AX, SI
    jl FIM_COLISAO_NAVE_PRINCIPAL  ; Se o tiro estiver acima, sem colisao
    mov SI, [NAVE_ALIENIGENA_Y]    ; Restaura posicao inicial da nave alienigena
    add SI, 9                      
    cmp AX, SI
    jg FIM_COLISAO_NAVE_PRINCIPAL  ; Se o tiro estiver abaixo, sem colisao
    
    ; Apaga o tiro na posicao atual
    mov BX, [NAVE_PRINCIPAL_X]
    mov DX, [NAVE_PRINCIPAL_Y]

    ; Apagar nave alienigena na posicao atual
    mov BX, [NAVE_ALIENIGENA_X]
    mov DX, [NAVE_ALIENIGENA_Y]
    call APAGAR_NAVE  
    call TROCAR_NAVE

    call GERAR_POSICAO_ALEATORIA 
    FIM_COLISAO_NAVE_PRINCIPAL:
    ret
endp


;------------------- TROCAR -------------------

TROCAR_NAVE proc
    mov CX, 8               ; Contador para as 8 naves
    mov DX, NAVE_Y_START    ; Posicao Y inicial das naves fixas

    DRAW_LOOP_TROCAR:
    push DX                                       

    mov ES, VIDEO_SEGMENT  
    ; Calcular posicao da nave e armazena em DI
    mov DI, DX
    mov AX, 320  
    mul DX              ; Multiplica Y por 320 para achar a linha e salva em AX
    mov DI, AX          ; DI aponta para o pixel da nave
    
    mov AL, ES:[DI]     ; Carrega o byte em ES:DI (pixel) para AL
    ; Verifica se AL e diferente de 0h (preto)
    cmp AL, 0h        
    push AX    
    jne SALVAR_COR      ; Se for diferente de preto, jmp

    RESTAURAR:
    pop AX
    pop DX     
    add DX, SPACING     ; Espacamento entre as naves
    loop DRAW_LOOP_TROCAR   
    
    FIM_JOGO:
    ret
    
    SALVAR_COR:  
    mov AX, DI        ; Encontrar valor de DX a partir de DI
    mov CX, 320  
    xor DX, DX        
    div CX            
    mov BX, 0
    mov DX, AX
    call APAGAR_NAVE
    
    pop AX
    mov [COR_NAVE_PRINCIPAL], AL
    
    pop DX
    ret
endp



;------------------- INICIO -------------------
INICIO:   
    mov AX,@DATA 
    mov DS,AX

    call SET_VIDEO_MODE
    call DRAW_8_NAVES
    call DRAW_NAVE_PRINCIPAL 
    
    MAIN_LOOP:
    ; Intervalo de 35 ms (35000 microssegundos)
    xor CX, CX          ; Parte superior (16 bits mais significativos)
    mov DX, 4E20h       ; Define o tempo (88B8H = 35.000)
    mov AH, 86h
    int 15h             ; Executa o delay de 35 ms
    
    call MOVE_NAVE_PRINCIPAL
    call MOVE_NAVE_ALIENIGENA
    call MOVE_TIRO
    call CHECK_COLISAO_8_NAVES
    call CHECK_COLISAO_NAVE_PRINCIPAL

    jmp MAIN_LOOP        

end INICIO
