%include "macros.asm"

section .data
    prompt db "Escribe tu nombre: "
    prompt_len equ $ - prompt
    
    tu db 10,"Tu: "
    tu_len equ $ - tu

    nala db 10,"Nala> "
    nala_len equ $ - nala

    saludo db "Hola "
    saludo_len equ $ - saludo

    pregunta db "En que te puedo ayudar?"
    pregun_len equ $ - pregunta

    chiste db "No tengo Nala que decirte jeje."
    chiste_len equ $ - chiste
    
    resp_salir db "Salir"
    resp_salir_len equ $ - resp_salir

    resp_chiste db "Chiste"
    resp_chiste_len equ $ - resp_chiste

    despedida db "Nos vemos 0.0...",10
    despedida_len equ $ - despedida

    nombre_len equ 20
    petici_len equ 20

section .bss
    nombre resb nombre_len
    peticion resb petici_len

section .text
    global _start

_start:
    push prompt_len
    push prompt
    call _print

    mov rax, 0
    mov rdi, 0
    mov rsi, nombre
    mov rdx, nombre_len
    syscall

    push nombre_len
    push nombre
    push saludo_len
    push saludo
    push 2
    call _hi

    .loop:
	push pregun_len
	push pregunta
	push 1
	call _hi
	
	push tu_len
	push tu
	call _print

	mov rax, 0
	mov rdi, 0
	mov rsi, peticion
	mov rdx, petici_len
	syscall
	
	mov rcx, resp_chiste_len
	mov rdi, resp_chiste
	mov rsi, peticion
	repe cmpsb

	je .chiste
    
	mov rcx, resp_salir_len
	mov rdi, resp_salir
	mov rsi, peticion
	repe cmpsb
	
	je .salir
	
	jne .loop
	
    .chiste:
	push chiste_len
	push chiste
	push 1
	call _hi

	jmp .loop
    
    .salir:
	push despedida_len
	push despedida
	push 1
	call _hi

	exit 0

_hi:
    pop r8
    pop r9
    push nala_len
    push nala
    add r9, 1
    
    .loop:
	call _print
	dec r9
	jnz .loop

    jmp r8

_print:
    pop rbx

    mov rax, 1
    mov rdi, 1
    pop rsi 
    pop rdx
    syscall

    jmp rbx
