section .text
	global _ft_strcpy

_ft_strcpy:
			push		rbp
			mov			rbp, rsp

			jmp			_while

_then:
			mov			r9, [rsi]
			mov			[rdi], r9
			inc			rsi
			inc			rdi

_while:
			cmp			byte [rsi], 0
			jne			_then

_end:
			mov			byte [rdi], 0
			pop			rbp
