section .text
	global _ft_strlen

_ft_strlen:
	push	rbp
	mov	rbp, rsp
	mov	rax, -1
L1:
	inc	rax
	cmp	byte [rdi + rax], 0
	jne	L1
	pop	rbp
	ret
