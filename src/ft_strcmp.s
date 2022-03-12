section .text
	global _ft_strcmp

_ft_strcmp:
	push	rbp
	mov	rbp, rsp
	xor	ecx, ecx		; i = 0
L1:
	movzx	eax, byte [rdi + rcx]	; c1 = *s1
	movsx	edx, byte [rsi + rcx]	; c2 = *s2
	test	eax, eax		; (c1 & c1) == 0
	je	L2			; if equal, jump to L2
	inc	rcx			; i++
	cmp	eax, edx		; c1 == c2
	je	L1			; if equal, jump to L1
L2:
	sub	eax, edx		; ret = c1 - c2
	pop	rbp
	ret
