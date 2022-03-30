section .text
	global _ft_list_sort
	extern _free

_ft_list_sort:
	push	rbp
	mov	rbp, rsp
	push	r12
	push	r13
	push	r14
	push	r15
	sub	rsp, 8

	cmp	qword [rdi], 0		; *begin_list == NULL
	je	.end			; jump to end if list is empty

	mov	r12, 1			; updated = 1
	mov	r13, rdi		; save rdi
	mov	r14, rsi		; save rsi
.while:
	cmp	r12, 1			; while updated
	jne	.end			; break
	xor	r12, r12		; updated = 0
	mov	r15, [r13]		; current = *begin_list
.all:
	cmp	qword [r15 + 8], 0	; while next
	je	.while			; break
	mov	rcx, r15		; prev = current
	mov	r15, [rcx + 8]		; current = prev->next
	mov	rdi, [rcx]		; rdi = prev->data
	mov	rsi, [r15]		; rsi = current->data
	push	rcx			; save rcx before call
	call	r14			; cmp(rdi, rsi)
	pop	rcx			; restore rcx
	cmp	eax, 0			; if result <= 0
	jle	.all			; loop
	mov	rdx, [rcx]		; [rcx] = [r15] and [r15] = [rcx]
	mov	rax, [r15]
	mov	[rcx], rax
	mov	[r15], rdx
	mov	r12, 1			; updated = 1
	jmp	.all			; loop
.end:
	add	rsp, 8
	pop	r15
	pop	r14
	pop	r13
	pop	r12
	pop	rbp
	ret
