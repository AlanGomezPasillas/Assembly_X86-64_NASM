%include "macros.asm"

section .data
    prompt db "Escribe tu nombre: "
    prompt_len equ $ - prompt
    
    nala db 10,"Nala> "
    nala_len equ $ - nala

    saludo db "Hola "
    saludo_len equ $ - saludo

    nombre_len equ 20

section .bss
    nombre resb nombre_len

section .text
    global _start

_start:
    ;prompt
    push prompt_len
    push prompt
    call _print
    ;entrada nombre
    mov rax, 0
    mov rdi, 0
    mov rsi, nombre	   ;Esta es la corrección
    mov rdx, nombre_len
    ;push nombre_len     <-Este es el error
    ;push nombre	   hice push en la entrada
    syscall
    ;nala
    push nala_len
    push nala
    call _print
    ;saludo
    push saludo_len
    push saludo
    call _print
    ;salida nombre
    push nombre_len
    push nombre
    call _print

    salir 0

_print:
    pop rbx

    mov rax, 1
    mov rdi, 1
    pop rsi 
    pop rdx
    syscall

    jmp rbx
