section .text
	global _ft_list_push_front
	extern _malloc

_ft_list_push_front:
	push	rbp
	mov	rbp, rsp
	push	r12
	push	r13
	mov	r12, rdi		; save begin_list before malloc
	mov	r13, rsi		; save data before malloc

	mov	rdi, 16			; size = 16
	call	_malloc			; malloc(size)
	test	rax, rax
	je	.end			; if malloc fails, jump to end

	mov	[rax], r13		; new_elem.data = data
	mov	rcx, [r12]		; tmp = *begin_list
	mov	[rax + 8], rcx		; new_elem.next = tmp
	mov	[r12], rax		; *begin_list = new_elem
.end:
	pop	r13
	pop	r12
	pop	rbp
	ret
