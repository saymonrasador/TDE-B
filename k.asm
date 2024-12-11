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
    TIRO_ATIVO db 0             ; 0 = tiro inativo, 1=tiro ativo
    NAVE_Y_START dw 20          ; Posicao inicial Y da primeira nave fixa
    SPACING     dw 20           ; Espacamento entre as naves fixas
    COR_NAVE_PRINCIPAl db 0Fh
    COR_NAVES db 0Eh, 05h, 09h, 0Ah, 0Bh, 0Ch, 0Dh, 03h
    VELOCIDADE_PRINCIPAL dw 2
    VELOCIDADE_ALIENIGENA dw 3
    VELOCIDADE_TIRO dw 6
    VELOCIDADE_DIAGONAL dw 2

    ;;escreve ARCADE GAME na tela
    TITULO_JOGO db "   _  __    ____  _____  ____  ____     " 
                db "  / |/ /   / ___\/__ __\/  _ \/  __\    "
                db "  |   /____|    \  / \  | / \||  \/|    "
                db "  |   \____\___ |  | |  | |-|||    /    "
                db "  \_|\_\   \____/  \_/  \_/ \|\_/\_\    "
                db "                                        "
                db "  ____  ____  _____  ____  ____  _      "
                db " /  __\/  _ \/__ __\/  __\/  _ \/ \     "
                db " |  \/|| / \|  / \  |  \/|| / \|| |     "
                db " |  __/| |-||  | |  |    /| \_/|| |_/\  "
                db " \_/   \_/ \|  \_/  \_/\_\\____/\____/  "
                db "                                        $"
    setor1   db "               _                 __     "  
             db "              | |               /  |    "
             db "    ___   ___ | |_  ___   _ __  `| |    "
             db "   / __| / _ \| __|/ _ \ | '__|  | |    "
             db "   \__ \|  __/| |_| (_) || |    _| |_   "
             db "   |___/ \___| \__|\___/ |_|    \___/   $" 
    setor2   db "              _                 _____   "
             db "             | |               / __  \  "
             db "   ___   ___ | |_  ___   _ __  `' / /'  "
             db "  / __| / _ \| __|/ _ \ | '__|   / /    "
             db "  \__ \|  __/| |_| (_) || |    ./ /___  "
             db "  |___/ \___| \__|\___/ |_|    \_____/  "
             db "                                        $"
    setor3   db "              _                 _____   "
             db "             | |               |____ |  "
             db "   ___   ___ | |_  ___   _ __      / /  "
             db "  / __| / _ \| __|/ _ \ | '__|     \ \  "
             db "  \__ \|  __/| |_| (_) || |    .___/ /  "
             db "  |___/ \___| \__|\___/ |_|    \____/   "
             db "                                        $"
    GAME_OVER_TEXT db 18 dup(" "), "GAME", 18 dup(" ")
                   db 18 dup(" "), "OVER$", 18 dup(" ")
    VENCEDOR_TEXT db 15 dup(" "), "VENCEDOR!", 16 dup(" "), "$"
                                    
    LABEL_SCORE db "SCORE:$"
    SCORE_TEXT db 5 dup("0")
    LABEL_TEMPO_DECORRIDO db "TEMPO:$"
    TEMPO_DECORRIDO_TEXT db 2 dup("0")

    SCORE dw 0
    SETOR_ATUAL db 1 ;;setor atual do jogo

    TEMPO_TITULO_SETOR db 4 ;; 4 segundos
    TEMPO_SETOR db 30 ;; 60 segundos
    TICKS dw 0 ;;variavel representa o numero de iteracoes do loop principal


    MAPA_JOGO db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
              db "==++***###******+=+#**##******###******#" 
              db "****************************************$"

    BOTAO_SELECIONADO db 0           ; 0=BOTAO_INICIAR, 1=BOTAO_SAIR
    TYPE_NAVE_MENU db 0            ; 0=NAVE_PRINCIPAL, 1=NAVE_ALIENIGENA
    BOTAO_INICIAR db 15 dup (" "), 0DAh, 0C4h, 0C4h, 0C4h, 0C4h, 0C4h, 0C4h, 0C4h, 0BFh, 16 dup (" ")
                  db 15 dup (" "), 0B3h, " JOGAR ", 0B3h, 16 dup (" ")
                  db 15 dup (" "), 0C0h, 0C4h, 0C4h, 0C4h, 0C4h, 0C4h, 0C4h, 0C4h, 0D9h, 16 dup (" "), "$"

    BOTAO_SAIR db 15 dup (" "), 0DAh, 0C4h, 0C4h, 0C4h, 0C4h, 0C4h, 0C4h, 0C4h, 0BFh, 16 dup (" ")
               db 15 dup (" "), 0B3h, " SAIR  ", 0B3h, 16 dup (" ")
               db 15 dup (" "), 0C0h, 0C4h, 0C4h, 0C4h, 0C4h, 0C4h, 0C4h, 0C4h, 0D9h, 16 dup (" "), "$"
    
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

DRAW_MENU proc
    push BX
    push CX
    push AX
    push ES

    mov ax, @DATA
    mov es, ax
    mov BH, 0   ; pagina 0
    mov CX, 1E0h ; numero de caracteres
    mov BL, 0Ah ; cor do texto (verde)
    mov AL, 0h  ; modo de cores
    MOV DH, 00h ; linha 0
    MOV DL, 1   ; coluna 1
    lea BP, TITULO_JOGO
    mov AH, 13h           ; define funcao de escrita
    int 10h               ; chama a interrupcao de video para escrever

    call WRITE_BOTOES_MENU

    pop ES
    pop AX
    pop CX
    pop BX
    ret
endp

WRITE_BOTOES_MENU proc
    push DX
    push CX
    push AX
    push BX
    push BP
    push ES

    ;;configs para ambos botoes
    mov ax, @DATA
    mov es, ax
    mov BH, 0   ; pagina 0
    mov CX, 78h ; numero de caracteres

    ;----------BTN JOGAR----------------
    mov BL, 0Fh ; cor do texto (branco)
    cmp BOTAO_SELECIONADO, 0
    je SELECT_BOTAO_JOGAR
    WRITE_BTN_JOGAR:
    mov AL, 0h  ; modo de cores
    MOV DL, 0   ; coluna 0
    MOV DH, 12h ; linha 18
    lea BP, BOTAO_INICIAR
    mov AH, 13h           ; define funcao de escrita
    int 10h               ; chama a interrupcao de video para escrever
    ;-----------------------------------
    ;----------BTN SAIR----------------
    mov BL, 0Fh ; cor do texto (branco)
    cmp BOTAO_SELECIONADO, 1
    je SELECT_BOTAO_SAIR
    WRITE_BTN_SAIR:
    mov AL, 0h  ; modo de cores
    MOV DL, 0   ; coluna 0
    MOV DH, 15h           ; linha 21
    lea BP, BOTAO_SAIR
    mov AH, 13h           ;defina funcao de escrita
    int 10h               ;chama a interrupcao de video para escrever
    jmp FIM_WRITE_BOTOES_MENU
    ;-----------------------------------

    SELECT_BOTAO_JOGAR:
    MOV BL, 0Ch ;; cor vermelha
    jmp WRITE_BTN_JOGAR

    SELECT_BOTAO_SAIR:
    MOV BL, 0Ch ;; cor vermelha
    jmp WRITE_BTN_SAIR

    FIM_WRITE_BOTOES_MENU:
    pop ES
    pop BP
    pop BX
    pop AX
    pop CX
    pop DX
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

MOVE_HORIZONTAL proc
    push DX
    push BX
    push DI
    push AX

    mov DX, [NAVE_PRINCIPAL_Y]     

    cmp TYPE_NAVE_MENU, 0
    je MOVE_NAVE_PRINCIPAL_MENU
    cmp TYPE_NAVE_MENU, 1
    je MOVE_NAVE_ALIENIGENA_MENU
    jmp FIM_MOVE_HORIZONTAL

 ;-------MOVIMENTO DAS NAVES----------------
    MOVE_NAVE_PRINCIPAL_MENU:
    mov BX, [NAVE_PRINCIPAL_X] 
    mov DI, BX       ; DI contem a posicao X atual da nave principal
    cmp DI, 319    ; Limite da tela a direita
    jge CHEGOU_LIMITE_DIREITA

    add DI, VELOCIDADE_PRINCIPAL
    push DI
    call APAGAR_NAVE
    pop DI
    mov [NAVE_PRINCIPAL_X], DI  ; Atualiza posicao da nave e redesenha    
    call DRAW_NAVE_PRINCIPAL
    jmp FIM_MOVE_HORIZONTAL

    MOVE_NAVE_ALIENIGENA_MENU:
    mov BX, [NAVE_ALIENIGENA_X]
    mov DI, BX       ; DI contem a posicao X atual da nave alienigena
    cmp DI, 0h     ; Limite da tela a esquerda
    jle CHEGOU_LIMITE_ESQUERDA

    sub DI, VELOCIDADE_PRINCIPAL
    push DI
    call APAGAR_NAVE
    pop DI
    mov [NAVE_ALIENIGENA_X], DI  ; Atualiza posicao da nave e redesenha
    call DRAW_NAVE_ALIENIGENA
    jmp FIM_MOVE_HORIZONTAL
    ;------------------------------------------

    ;------TRATAMENTO DE LIMITES--------------
    CHEGOU_LIMITE_DIREITA:
    mov TYPE_NAVE_MENU, 1
    push DI
    call APAGAR_NAVE
    pop DI
    mov [NAVE_ALIENIGENA_X], DI  ; Atualiza posicao da nave e redesenha
    call DRAW_NAVE_ALIENIGENA
    jmp FIM_MOVE_HORIZONTAL

    CHEGOU_LIMITE_ESQUERDA:
    mov TYPE_NAVE_MENU, 0
    push DI
    call APAGAR_NAVE
    pop DI
    mov [NAVE_PRINCIPAL_X], DI  ; Atualiza posicao da nave e redesenha
    call DRAW_NAVE_PRINCIPAL
    jmp FIM_MOVE_HORIZONTAL
    ;------------------------------------------
    
    FIM_MOVE_HORIZONTAL:
    pop AX
    pop DI
    pop BX
    pop DX
    ret
endp

DRAW_TITULO_SETOR proc
    push BX
    push DX
    push AX
    push ES
    
    mov ax, @DATA
    mov es, ax
    mov BH, 0   ; pagina 0
    mov CX, 0F0h ; numero de caracteres
    mov AL, 0h  ; modo de cores
    MOV DH, 08h ; linha 8
    MOV DL, 1   ; coluna 1
    
    ;;DEFINE O SETOR ATUAL
    cmp SETOR_ATUAL, 2
    je DEFINE_SETOR2
    cmp SETOR_ATUAL, 3
    je DEFINE_SETOR3
    jmp DEFINE_SETOR1

    ESCREVE_SETOR_TELA:
    mov AH, 13h           ; define funcao de escrita
    int 10h               ; chama a interrupcao de video para escrever
    jmp FIM_DRAW_SETOR
    
    DEFINE_SETOR1:
    lea BP, setor1
    mov BL, 09h ; cor do texto (Azul claro)
    jmp ESCREVE_SETOR_TELA

    DEFINE_SETOR2:
    lea BP, setor2
    mov BL, 0Dh ; cor do texto (Magenta claro)
    jmp ESCREVE_SETOR_TELA

    DEFINE_SETOR3:
    lea BP, setor3
    mov BL, 0Ch ; cor do texto (Vermelho claro)
    jmp ESCREVE_SETOR_TELA

    FIM_DRAW_SETOR:
    pop ES
    pop AX
    pop DX
    pop BX
    ret
endp

CHECK_FIM_TICKS proc
    ;; OS TEMPOS ENVOLVIDOS NAO PODEM SER MAIORES QUE 65535 ms
    ;; PARAMETROS: constante TICKS e AL = tempo limite em segundos
    ;; RETORNO: AX = 0 se o tempo limite foi atingido, AX = 1 caso contrario
    push CX
    push DX
    push AX

    ;; Calcula o tempo decorrido
    mov ax, TICKS   ;; quantidade de ticks ate o momento
    xor DX, DX
    mov DX, 35      ;; cada tick eh 35 ms
    mul DX          ;; AX*DX -> resultado em DX:AX
    mov CX, 1000    ;; convertendo para segundos (1s = 1000ms)
    div CX          ;; AX/CX-> resultado em AX, resto em DX
    mov CX, AX     ;; CX = tempo decorrido em segundos

    ;; recupera o tempo limite
    xor ax, ax
    pop AX
 
    ;;verifica se o tempo limite foi atingido
    cmp CL, AL ;; compara apenas a parte baixa
    jge LIMITE_ATINGIDO ; pula se tempo decorrido >= tempo limite
    mov ax, 1
    jmp FIM_CHECK_FIM_TICKS

    LIMITE_ATINGIDO:
    mov ax, 0

    FIM_CHECK_FIM_TICKS:
    pop DX
    pop CX
    ret
endp

DRAW_STATUS_BAR proc
   push BX
    push DX
    push AX
    push ES

    mov ax, @DATA
    mov es, ax
    mov BH, 0   ; pagina 0

    ;-----------SCORE------------------
    mov BL, 0Fh  ; cor do texto (branco)
    mov AL, 0h   ; modo de cores
    MOV DH, 00h  ; linha 0
    MOV DL, 00h  ; coluna 0
    lea BP, LABEL_SCORE
    mov CX, 06h ; numero de caracteres
    mov AH, 13h           ; define funcao de escrita
    int 10h               ; chama a interrupcao de video para escrever

    mov BL, 02h  ; cor do texto (verde)
    mov AL, 0h   ; modo de cores
    MOV DH, 00h  ; linha 0
    MOV DL, 07h  ; coluna 8
    lea BP, SCORE_TEXT
    mov CX, 05h ; numero de caracteres
    mov AH, 13h           ; define funcao de escrita
    int 10h               ; chama a interrupcao de video para escrever

    ;----------TEMPO------------------
    mov BL, 0Fh  ; cor do texto (branco)
    mov AL, 0h   ; modo de cores
    MOV DH, 00h  ; linha 0
    MOV DL, 31  ; coluna 0
    lea BP, LABEL_TEMPO_DECORRIDO
    mov CX, 06h ; numero de caracteres
    mov AH, 13h           ; define funcao de escrita
    int 10h               ; chama a interrupcao de video para escrever

    mov BL, 02h  ; cor do texto (verde)
    mov AL, 0h   ; modo de cores
    MOV DH, 00h  ; linha 0
    MOV DL, 38  ; coluna 8
    lea BP, TEMPO_DECORRIDO_TEXT
    mov CX, 02h ; numero de caracteres
    mov AH, 13h           ; define funcao de escrita
    int 10h               ; chama a interrupcao de video para escrever

    pop ES
    pop AX
    pop DX
    pop BX
    ret
endp

REFRESH_TEMPO_DECORRIDO proc
    ;;Essa fun??o ? respons?vel por atualizar a vari?vel TEMPO_DECORRIDO_TEXT
    push CX
    push DX
    push AX
    push DI

    ;;1. converter TICKS para tempo decorrido em segundos
    mov ax, TICKS   ;; quantidade de ticks ate o momento
    xor DX, DX
    mov DX, 35      ;; cada tick eh 35 ms
    mul DX          ;; AX*DX -> resultado em DX:AX
    mov CX, 1000    ;; convertendo para segundos (1s = 1000ms)
    div CX          ;; AX/CX-> resultado em AX, resto em DX

    ;;2. converter os segundos em caracteres ASCII
    xor CL, CL
    xor AH, AH
    mov CL, 10
    div CL ;;AL=AL/10,AH=AL%10
    add AL, '0' ;;unidade
    add AH, '0' ;;dezena

    ;;3. atualizar a variavel TEMPO_DECORRIDO_TEXT
    cld
    mov DI, offset TEMPO_DECORRIDO_TEXT
    mov [DI], AL
    mov [DI+1], AH

    pop DI
    pop AX
    pop DX
    pop CX
    ret
endp

DRAW_GAME_OVER proc
    push BX
    push DX
    push AX
    push ES

    call SET_VIDEO_MODE

    mov ax, @DATA
    mov es, ax
    mov BH, 0   ; pagina 0

    mov BL, 0Ah  ; cor do texto (verde claro)
    mov AL, 0h   ; modo de cores
    MOV DH, 08h  ; linha 0
    MOV DL, 00h  ; coluna 0
    lea BP, VENCEDOR_TEXT
    mov CX, 28h ; numero de caracteres
    mov AH, 13h           ; define funcao de escrita
    int 10h               ; chama a interrupcao de video para escrever


    pop ES
    pop AX
    pop DX
    pop BX
    ret
endp

DRAW_MAPA proc
    
    ret
endp

SETUP_TELA_JOGO proc
    mov [NAVE_PRINCIPAL_X], 2Fh
    mov [NAVE_PRINCIPAL_Y], 50h
    mov [NAVE_ALIENIGENA_X], 12Ch
    mov [NAVE_ALIENIGENA_Y], 50h
    mov TICKS, 0
    call SET_VIDEO_MODE
    call DRAW_8_NAVES
    call DRAW_NAVE_PRINCIPAL
    call DRAW_MAPA
    ret
endp

NEXT_BTN proc
    push AX

    xor BOTAO_SELECIONADO, 1
    call WRITE_BOTOES_MENU
    
    pop AX
    ret
endp
;------------------- INICIO -------------------
INICIO:   
    mov AX, @DATA 
    mov DS,AX

    ;------------TELA MENU----------------
    MENU:
    call SET_VIDEO_MODE
    call DRAW_MENU

    mov [NAVE_PRINCIPAL_X], 0h
    mov [NAVE_PRINCIPAL_Y], 70h
    mov [NAVE_ALIENIGENA_X], 0h
    mov [NAVE_ALIENIGENA_Y], 70h

    WAIT_MEU:
    ; Intervalo de 35 ms (35000 microssegundos)
    xor CX, CX          ; Parte superior (16 bits mais significativos)
    mov DX, 4E20h       ; Define o tempo (88B8H = 35.000)
    mov AH, 86h
    int 15h             ; Executa o delay de 35 ms
    call MOVE_HORIZONTAL
    call GET_INPUT
    cmp AL, 'w' ;; tecla para cima
    je NEXT__BTN
    cmp AL, 's' ;; tecla para baixo
    je NEXT__BTN 
    cmp AL, 0Dh ;; tecla enter
    jne WAIT_MEU
    jmp COMECAR_JOGO
    ;-------------------------------------

    ;;--------------JUMPS GAMBIARRA----------------
    NEXT__BTN: 
    call NEXT_BTN
    jmp WAIT_MEU

    GAME_OVER:
    call DRAW_GAME_OVER
    LOOP_GAME_OVER:
    call GET_INPUT
    cmp AL, 'r'
    je MENU
    jmp LOOP_GAME_OVER

    ;-----------TELA TITULO SETOR----------------
    COMECAR_JOGO:
    call SET_VIDEO_MODE
    call DRAW_TITULO_SETOR
    mov TICKS, 0
    AWAIT_SETOR:
    ; Intervalo de 35 ms (35000 microssegundos)
    xor CX, CX          ; Parte superior (16 bits mais significativos)
    mov DX, 4E20h       ; Define o tempo (88B8H = 35.000)
    mov AH, 86h
    int 15h             ; Executa o delay de 35 ms
    add TICKS, 1
    mov al, TEMPO_TITULO_SETOR
    call CHECK_FIM_TICKS
    cmp ax, 1
    je AWAIT_SETOR
    ;-----------TELA JOGO----------------
    ;;reseta posicao da nave principal
    call SETUP_TELA_JOGO
    MAIN_LOOP:
    ; Intervalo de 35 ms (35000 microssegundos)
    xor CX, CX          ; Parte superior (16 bits mais significativos)
    mov DX, 4E20h       ; Define o tempo (88B8H = 35.000)
    mov AH, 86h
    int 15h             ; Executa o delay de 35 ms
    add TICKS, 1
    call REFRESH_TEMPO_DECORRIDO
    
    call MOVE_NAVE_PRINCIPAL
    call MOVE_NAVE_ALIENIGENA
    call MOVE_TIRO
    call CHECK_COLISAO_8_NAVES
    call CHECK_COLISAO_NAVE_PRINCIPAL
    call DRAW_STATUS_BAR
    
    mov al, TEMPO_SETOR
    call CHECK_FIM_TICKS
    cmp ax, 1
    je MAIN_LOOP
    add SETOR_ATUAL, 1
    cmp SETOR_ATUAL, 4
    jne COMECAR_JOGO
    jmp GAME_OVER
    ;-------------------------------------

end INICIO