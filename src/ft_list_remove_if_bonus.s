section .text
	global _ft_list_remove_if
	extern _free

_ft_list_remove_if:
	push	rbp
	mov	rbp, rsp
	push	rbx			;# t_list *elem;
	push	r12			;# t_list **begin_list;
	push	r13			;# void *data_ref;
	push	r14			;# int (*cmp)();
	push	r15			;# void (*free_fct)(void *);
	sub	rsp, 8
	mov	r12, rdi
	mov	r13, rsi
	mov	r14, rdx
	mov	r15, rcx
LBB0_0:					;# while ((elem = *begin_list)) {
	mov	rbx, [r12]
	test	rbx, rbx
	je	LBB0_4
	mov	rdi, [rbx]		;# 	if (cmp(elem->data, data_ref) == 0) {
	mov	rsi, r13
	call	r14
	test	rax, rax
	jne	LBB0_1
	test	r15, r15		;# 		if (free_fct)
	je	LBB0_2
	mov	rdi, [rbx]		;# 			free_fct(elem->data);
	call	r15
LBB0_2:
	mov	r8, [rbx + 8]	 	;# 		*begin_list = elem->next;
	mov	[r12], r8
	mov	rdi, rbx		;# 		free(elem);
	call	_free
	jmp	LBB0_0			;# 		continue;
LBB0_1:					;# 	}
	lea	r12, [rbx + 8]		;# 	begin_list = &elem->next;
	jmp	LBB0_0
LBB0_4:					;# }
	add	rsp, 8
	pop	r15
	pop	r14
	pop	r13
	pop	r12
	pop	rbx
	pop	rbp
	ret
