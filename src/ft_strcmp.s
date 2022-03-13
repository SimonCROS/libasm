section .text
	global _ft_strcmp

_ft_strcmp:
	push	rbp
	mov	rbp, rsp
	xor	ecx, ecx		; i = 0
.while:
	movzx	eax, byte [rdi + rcx]	; c1 = *s1
	movsx	edx, byte [rsi + rcx]	; c2 = *s2
	test	eax, eax		; (c1 & c1) == 0
	je	.end			; if equal, jump to .end
	inc	rcx			; i++
	cmp	eax, edx		; c1 == c2
	je	.while			; if equal, jump to .while
.end:
	sub	eax, edx		; ret = c1 - c2
	pop	rbp
	ret
