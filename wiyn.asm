section .data
	text1 db "ty kto?", 10
	text2 db "hey, "

section .bss
	name resb 16

section .text
	global _start

_start:

	call _printT1
	call _getN
	call _printT2
	call _printName

	mov rax, 60
	mov rdi, 0
	syscall

_printT1:
	mov rax, 1
	mov rdi, 1
	mov rsi, text1
	mov rdx, 8
	syscall
	ret

_printT2:
	mov rax, 1
	mov rdi, 1
	mov rsi, text2
	mov rdx, 5
	syscall
	ret

_getN:
	mov rax, 0
	mov rdi, 0
	mov rsi, name
	mov rdx, 16
	syscall 
	ret

_printName:
	mov rax, 1
	mov rdi, 1
	mov rsi, name
	mov rdx, 16
	syscall
	ret
