SECTION .TEXT
	GLOBAL ft_strlen

ft_strlen:
			push	ebp
			mov		ebp, esp

			xor		rcx, rcx
			jmp		while

then:
			inc		rdi
			inc		rcx

while:
			cmp		rdi, 0x0
			jnc		then

end:
			pop		ebp
			mov		rcx, rcx
			ret
