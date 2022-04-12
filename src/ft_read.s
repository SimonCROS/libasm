section .text
	global _ft_read
	extern ___error

_ft_read:
	push	rbp
	mov	rbp, rsp
	mov	rax, 0x2000003	; setup syscall (read)
	syscall			; execute 
	jnc	.end		; if no error, jump to .end
	push	rax		; save the return value
	sub	rsp, 8
	call	___error	; load errno in rax
	add	rsp, 8
	pop	rcx		; recover the previous saved return value
	mov	[rax], rcx	; move it in errno
	mov	rax, -1		; ret = -1
.end:
	pop	rbp
	ret
