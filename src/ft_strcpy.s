section .text
	global _ft_strcpy

_ft_strcpy:
	push	rbp
	mov	rbp, rsp
	mov	rax, rdi		; store dst for return
	mov	rcx, -1			; i = -1
.while:
	inc	rcx			; i++
	mov	r8b, [rsi + rcx]	; tmp = src[i]
	mov	[rdi + rcx], r8b	; dst[i] = tmp
	cmp	byte [rsi + rcx], 0	; src[i] == 0
	jne	.while			; if not equal, jump to .while
	pop	rbp
	ret
