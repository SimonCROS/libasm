section .text
	global _ft_strdup
	extern _ft_strlen
	extern _ft_strcpy
	extern _malloc

_ft_strdup:
	push	rbp
	mov	rbp, rsp
	push	rdi			;# save s1 in the stack
	sub	rsp, 8
	call	_ft_strlen		;# len = ft_strlen(s1)
	inc	rax			;# len++ ('\0')
	mov	rdi, rax		;# first argument = len
	call	_malloc			;# ret = malloc(len)
	test	rax, rax		;# (ret & ret) == 0 (NULL)
	je	.end			;# if equal, jump to .end
	add	rsp, 8
	mov	rdi, rax		;# first argument = ret
	pop	rsi			;# second argument = s1 (from stack)
	call	_ft_strcpy		;# ret = ft_strcpy(ret, s1)
.end:
	mov	rsp, rbp
	pop	rbp
	ret
