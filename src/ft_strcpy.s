section .text
	global _ft_strcpy

_ft_strcpy:
	push	rbp
	mov	rbp, rsp
	mov	rax, rdi
	mov	rcx, -1
L1:
	mov	r8b, [rsi + rcx]
	mov	[rdi + rcx], r8b
	inc	rcx
	cmp	byte [rsi + rcx], 0
	jne	L1
	mov	byte [rdi + rcx], 0
	pop	rbp
	ret
