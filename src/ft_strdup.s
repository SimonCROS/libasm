section .text
	global _ft_strdup
	extern _ft_strlen
	extern _ft_strcpy
	extern _malloc

_ft_strdup:
	push	rbp
	mov	rbp, rsp
	call	_ft_strlen		;# len = ft_strlen(s1)
	inc	rax			;# len++ ('\0')
	mov	r13, rdi		;# save s1 in r13
	mov	rdi, rax		;# first argument = len
	call	_malloc			;# ret = malloc(len)
	test	rax, rax		;# (ret & ret) == 0 (NULL)
	je	L1			;# if equal, jump to L1
	mov	rdi, rax		;# first argument = ret
	mov	rsi, r13		;# second argument = s1
	call	_ft_strcpy		;# ret = ft_strcpy(ret, s1)
L1:
	pop	rbp
	ret
