section .text
	global _ft_strlen

_ft_strlen:
	push	rbp
	mov	rbp, rsp
	mov	rax, -1			; i = -1
.while:
	inc	rax			; i++
	cmp	byte [rdi + rax], 0	; i == 0
	jne	.while			; if not equal, jump to .while
	pop	rbp
	ret
