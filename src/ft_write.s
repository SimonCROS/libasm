section .text
	global _ft_write
	extern ___error

_ft_write:
	push	rbp
	mov	rbp, rsp
	mov	rax, 0x2000004	; setup syscall (write)
	syscall			; execute 
	jnc	L1		; if no error, jump to L1
	push	rax		; save the return value
	call	___error	; load errno in rax
	pop	rcx		; recover the previous saved return value
	mov	[rax], rcx	; move it in errno
	mov	rax, -1		; ret = -1
L1:
	pop	rbp
	ret
