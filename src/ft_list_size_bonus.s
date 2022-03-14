section .text
	global _ft_list_size

_ft_list_size:
	push	rbp
	mov	rbp, rsp
	mov	rax, -1			; i = -1
.while:
	inc	rax			; i++
	test	rdi, rdi		; begin_list == NULL
	je	.end			; if equal, jump to end
	mov	rdi, [rdi + 8]		; begin_list = begin_list->next
	jmp	.while			; loop
.end:
	pop	rbp
	ret
