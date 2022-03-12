section .text
	global _ft_strlen

_ft_strlen:
	push	rbp
	mov	rbp, rsp
	mov	rax, -1			; i = -1
L1:
	inc	rax			; i++
	cmp	byte [rdi + rax], 0	; i == 0
	jne	L1			; if not equal, jump to L1
	pop	rbp
	ret
