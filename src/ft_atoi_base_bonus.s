;# section .text
;# 	global _ft_atoi_base
;#	extern _ft_strlen

.data
	spaces:
		.byte 0x09,0x0a,0x0b,0x0c,0x0d,0x20,0x0			;# '\t\n\v\f\r \0'
	symbols:
		.byte 0x2b,0x2d,0x0					;# '\t\n\v\f\r +-\0'
	invalide:
		.byte 0x09,0x0a,0x0b,0x0c,0x0d,0x20,0x2b,0x2d,0x0	;# '\t\n\v\f\r +-\0'

.text
	.globl _ft_atoi_base
	.extern _ft_strlen

_index_of:
	push	rbp
	mov	rbp, rsp
	mov	rax, -1			;# i = -1
LIWHILE:
	inc	rax			;# i++
	cmp	byte ptr [rsi + rax], 0	;# stri[i] == 0
	je	LINOTFOUND		;# if equal, jump
	cmp	byte ptr [rsi + rax], dil	;# stri[i] == char
	jne	LIWHILE			;# return -1 if not found
	jmp	LIEND
LINOTFOUND:
	mov	rax, -1
LIEND:
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
	cmp	r9, 1			;# base[0] == '\0'
	jbe	LERROR			;# if equal or below, jump to LERROR
LCHECKBASE:
	mov	dil, [rdx]		;# rdi = *base
	cmp	dil, 0			;# rdi == '\0'
	je	LATOI			;# if equal, jump to LATOI
	inc	rdx			;# base++

	lea	rsi, [rip + invalide]
	call	_index_of		;# if char is whitespace or sign
	cmp	rax, -1
	jne	LERROR

	lea	rsi, [rdx]
	call	_index_of		;# if the current char appears twice
	cmp	rax, -1
	jne	LERROR

	jmp	LCHECKBASE		;# else loop
LATOI:
	mov	r10, 1
LSKIPSPACES:
	mov	dil, [r8]

	lea	rsi, [rip + spaces]
	call	_index_of
	cmp	rax, -1
	je	LPARSESYMS		;# if current char it not a space, jump to LPARSESYMS

	inc	r8
	jmp	LSKIPSPACES
LPARSESYMS:
	mov	dil, [r8]

	lea	rsi, [rip + symbols]
	call	_index_of
	cmp	rax, -1
	je	LPARSENUMS		;# if current char it not a space, jump to LPARSESYMS
	inc	r8
	cmp	rax, 1
	jne	LPARSESYMS
	imul	r10, -1
	jmp	LPARSESYMS
LPARSENUMS:
	xor	rdx, rdx
	mov	rsi, r11
hey:
LATOILOOP:
	mov	dil, [r8]

	call	_index_of
	cmp	rax, -1
	je	LATOIEND		;# if current char it not a space, jump to LPARSESYMS
	inc	r8
	imul	rdx, r9
	imul	rax, r10
	add	rdx, rax
	jmp	LATOILOOP
LATOIEND:
	mov	rax, rdx
	jmp	LEND
LERROR:
	mov	rax, 0
LEND:
	pop	rbp
	ret
