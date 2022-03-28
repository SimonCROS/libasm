	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.intel_syntax noprefix
	.globl	_a                              ## -- Begin function a
	.p2align	4, 0x90
_a:                                     ## @a
## %bb.0:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	rbx
	push	rax
	mov	rbx, qword ptr [rdi]
	test	rbx, rbx
	je	LBB0_10
## %bb.1:
	mov	rax, qword ptr [rbx + 8]
	test	rax, rax
	je	LBB0_10
## %bb.2:
	mov	r14, rsi
	jmp	LBB0_4
	.p2align	4, 0x90
LBB0_3:                                 ##   in Loop: Header=BB0_4 Depth=1
	mov	eax, 0
	test	r15d, r15d
	je	LBB0_10
LBB0_4:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_6 Depth 2
	test	rax, rax
	je	LBB0_10
## %bb.5:                               ##   in Loop: Header=BB0_4 Depth=1
	xor	r15d, r15d
	jmp	LBB0_6
	.p2align	4, 0x90
LBB0_8:                                 ##   in Loop: Header=BB0_6 Depth=2
	mov	rcx, qword ptr [rbx]
	mov	rax, qword ptr [rbx + 8]
	mov	rdx, qword ptr [rax]
	mov	qword ptr [rbx], rdx
	mov	qword ptr [rax], rcx
	mov	r15d, 1
	test	rax, rax
	je	LBB0_3
LBB0_6:                                 ##   Parent Loop BB0_4 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	rdi, qword ptr [rbx]
	mov	rsi, qword ptr [rax]
	xor	eax, eax
	call	r14
	test	eax, eax
	jg	LBB0_8
## %bb.7:                               ##   in Loop: Header=BB0_6 Depth=2
	mov	rax, qword ptr [rbx + 8]
	test	rax, rax
	jne	LBB0_6
	jmp	LBB0_3
LBB0_10:
	add	rsp, 8
	pop	rbx
	pop	r14
	pop	r15
	pop	rbp
	ret
                                        ## -- End function
.subsections_via_symbols
