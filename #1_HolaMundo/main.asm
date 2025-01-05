section .data       ;creando seccion de datos
    txt db "Hola, Mundo =)",10  ;definiendo bytes para la frase

section .text     ;creando seccion de texto
    global _start   ;creando nuestra funcion principal

_start:           ;definiendo la funcion principal
    mov rax, 1      ;utilizando la llamada para imprimir
    mov rdi, 1      ;utilizando el STD OUT para salida de datos
    mov rsi, txt    ;imprimiendo el texto
    mov rdx, 15     ;definiendo la cantidad de bytes a imprimir
    syscall       ;llamada al sistema

    mov rax, 60     ;utilizar la llamada para salir
    mov rdi, 0      ;retornando 0 (sin errores)
    syscall       ;llamada al sistema
