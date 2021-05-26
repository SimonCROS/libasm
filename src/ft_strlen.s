section .text
	global _ft_strlen

_ft_strlen:
			push		rbp
			mov			rbp, rsp

			xor			rcx, rcx
			jmp			_while

_then:
			inc			rdi
			inc			rcx

_while:
			cmp			byte [rdi], 0
			jne			_then

_end:
			pop			rbp
			mov			rax, rcx
			ret
