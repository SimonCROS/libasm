;#section .text
;#	global _ft_list_remove_if
;#
;#_ft_list_remove_if:
;#	push	rbp
;#	mov	rbp, rsp
;#	push	r12
;#	push	r13
;#	mov	r12, rdi		; begin_list = rdi
;#.while:
;#	cmp	 ptr [r12], 0		; *begin_list == NULL
;#	je	.end			; if equal, jump to end
;#	mov	r13, [r12]		; elem = *begin_list
;#	mov	rdi, [r13]		; rdi = elem->data
;#	call	rdx			; cmp(rdi, rsi)
;#	; TODO
;#	mov	r13, [r12]		; elem = *begin_list
;#	mov	r8, [r13 + 8]		; tmp = (*begin_list)->next
;#	mov	[r12], r8		; *begin_list = tmp
;#	jmp	.while			; loop
;#.end:
;#	pop	r13
;#	pop	r12
;#	pop	rbp
;#	ret
;#

	.section	__TEXT,__text,regular,pure_instructions
	.globl		_ft_list_remove_if

_ft_list_remove_if:
	push	rbp
	mov	rbp, rsp
	push	r12
	push	r13
	push	r14
	push	r15
	push	[rdi]
	mov	r12, rdi		;# begin_list = rdi
	mov	r14, rdx		;# cmp = rdx
	mov	r15, rcx		;# free = rcx
	mov	r8, [r12]		;# tmp = *begin_list
LBB0_3:
	mov	[r12], r8		;# *begin_list = tmp
	cmp	qword ptr [r12], 0	;# *begin_list == NULL
	je	LBB0_4			;# if equal, jump to end
	mov	r13, [r12]		;# elem = *begin_list
	mov	rdi, [r13]		;# rdi = elem->data
	push	rsi			;# save rsi
	call	r14			;# cmp(rdi, rsi)
	pop	rsi			;# restore rsi
	mov	r13, [r12]		;# elem = *begin_list
	mov	r8, [r13 + 8]		;# tmp = (*begin_list)->next
	test	rax, rax		;# if rdi != rsi (using cmp)
	jne	LBB0_3			;# continue
	push	[r13]			;# push elem.data
	mov	rdi, r13		;# rdi = elem
	call	free			;# free(rdi)
	mov	r12, r8 ;# TODO
	pop	rdi			;# restore elem.data
	test	r15, r15		;# if free_ptr == NULL

	jmp	LBB0_3			;# loop
LBB0_4:
	pop	r8
	mov	[r12], r8
	pop	r15
	pop	r14
	pop	r13
	pop	r12
	pop	rbp
	ret
