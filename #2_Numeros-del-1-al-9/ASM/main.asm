section .data
	;MAX equ 9
	;MAX db 50
section .bss
	num resb 1
section .text
	global _start

_start:
	;mov rcx, 50
	;mov [num], rcx
	;mov [num], BYTE 50
	;mov rcx, num

	mov rax, 1
	mov rdi, 1
	;mov rsi, rcx
	;mov rsi, MAX
	;mov rsi, num
	mov rdx, 8
	syscall

	mov rax, 60
	mov rdi, 0
	syscall
