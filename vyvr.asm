section .data
codes: db '0123456789ABCDEF'
section .text
	global _start

_start:
	;1122 in raxd
	mov rax, 0xa122e344f56d7788
	mov rdi, 1
	mov rdx,1
	mov rcx
	
.loop:
	push rax
	sub rcx, 4
	; cl - nizhnie 4 bytes of rcx
	sar rax, cl
	and rax, 0xf
	lea rsi, [codes+rax]
	mov rax, 1

	; сохраняем рсх потому что при выполнении сискол он не сохр
	push rcx
	syscall
	pop rcx
	
	pop rax
	test rcx, rcx
	jnz .loop

	mov rax, 60
	xor rdi, rdi
	syscall
