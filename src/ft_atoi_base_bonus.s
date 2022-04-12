section .data
	spaces	db 0x09,0x0a,0x0b,0x0c,0x0d,0x20,0x0		; '\t\n\v\f\r \0'
	symbols	db 0x2b,0x2d,0x0				; '+-\0'
	invalid	db 0x09,0x0a,0x0b,0x0c,0x0d,0x20,0x2b,0x2d,0x0	; '\t\n\v\f\r +-\0'

section .text
	global _ft_atoi_base
	extern _ft_strlen
	extern _malloc

_index_of:
	push	rbp
	mov	rbp, rsp
	mov	rax, -1			; i = -1
.while:
	inc	rax			; i++
	cmp	byte [rsi + rax], 0	; stri[i] == 0
	je	.not_found		; if equal, jump
	cmp	byte [rsi + rax], dil	; stri[i] == char
	jne	.while			; return -1 if not found
	jmp	.end
.not_found:
	mov	rax, -1
.end:
	pop	rbp
	ret

_ft_atoi_base:
	push	rbp
	mov	rbp, rsp
	mov	r8, rdi
	mov	rdx, rsi
	mov	rdi, rsi
	mov	r11, rsi
	call	_ft_strlen
	mov	r9, rax
	cmp	r9, 1			; base[0] == '\0'
	jbe	.error			; if equal or below, jump to .error
.base:
	mov	dil, [rdx]		; rdi = *base
	cmp	dil, 0			; rdi == '\0'
	je	.main			; if equal, jump to .main
	inc	rdx			; base++

	lea	rsi, [rel invalid]
	call	_index_of		; if char is whitespace or sign
	cmp	rax, -1
	jne	.error

	lea	rsi, [rdx]
	call	_index_of		; if the current char appears twice
	cmp	rax, -1
	jne	.error

	jmp	.base			; else loop
.main:
	mov	r10, 1
.spaces:
	mov	dil, [r8]

	lea	rsi, [rel spaces]
	call	_index_of
	cmp	rax, -1
	je	.symbols		; if current char it not a space, jump to .symbols

	inc	r8
	jmp	.spaces
.symbols:
	mov	dil, [r8]

	lea	rsi, [rel symbols]
	call	_index_of
	cmp	rax, -1
	je	.numbers		; if current char it not a aymbol, jump to .numbers
	inc	r8
	cmp	rax, 1
	jne	.symbols
	imul	r10, -1			; if symbol is a minus, invert the sign (r10)
	jmp	.symbols
.numbers:
	xor	rdx, rdx
	mov	rsi, r11
.numbers_loop:
	mov	dil, [r8]

	call	_index_of
	cmp	rax, -1
	je	.finished		; if current char it not a space, jump to .symbols
	inc	r8
	imul	rdx, r9
	imul	rax, r10
	add	rdx, rax
	jmp	.numbers_loop
.finished:
	mov	rax, rdx
	jmp	.end
.error:
	mov	rax, 0
.end:
	pop	rbp
	ret
