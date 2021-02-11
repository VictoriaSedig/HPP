	.file	"Multigrid0.c"
	.text
	.p2align 4,,10
	.p2align 3
	.globl	alloc_matrix
	.type	alloc_matrix, @function
alloc_matrix:
.LFB41:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movslq	%edi, %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	leaq	0(,%rbp,8), %rdi
	call	malloc@PLT
	movq	%rax, %r13
	testl	%ebp, %ebp
	jle	.L1
	movq	%rbp, %r12
	cmpl	$8, %ebp
	jle	.L6
	leal	-9(%rbp), %r15d
	leaq	88(%rax), %r14
	xorl	%ebx, %ebx
	andl	$-8, %r15d
	addl	$8, %r15d
.L4:
	movl	$8, %esi
	movq	%rbp, %rdi
	prefetchw	(%r14)
	addl	$8, %ebx
	call	calloc@PLT
	movl	$8, %esi
	movq	%rbp, %rdi
	addq	$64, %r14
	movq	%rax, -152(%r14)
	call	calloc@PLT
	movl	$8, %esi
	movq	%rbp, %rdi
	movq	%rax, -144(%r14)
	call	calloc@PLT
	movl	$8, %esi
	movq	%rbp, %rdi
	movq	%rax, -136(%r14)
	call	calloc@PLT
	movl	$8, %esi
	movq	%rbp, %rdi
	movq	%rax, -128(%r14)
	call	calloc@PLT
	movl	$8, %esi
	movq	%rbp, %rdi
	movq	%rax, -120(%r14)
	call	calloc@PLT
	movl	$8, %esi
	movq	%rbp, %rdi
	movq	%rax, -112(%r14)
	call	calloc@PLT
	movl	$8, %esi
	movq	%rbp, %rdi
	movq	%rax, -104(%r14)
	call	calloc@PLT
	movq	%rax, -96(%r14)
	cmpl	%r15d, %ebx
	jne	.L4
.L3:
	movslq	%ebx, %rbx
	.p2align 4,,10
	.p2align 3
.L5:
	movl	$8, %esi
	movq	%rbp, %rdi
	call	calloc@PLT
	movq	%rax, 0(%r13,%rbx,8)
	incq	%rbx
	cmpl	%ebx, %r12d
	jg	.L5
.L1:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r13, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L6:
	.cfi_restore_state
	xorl	%ebx, %ebx
	jmp	.L3
	.cfi_endproc
.LFE41:
	.size	alloc_matrix, .-alloc_matrix
	.p2align 4,,10
	.p2align 3
	.globl	dealloc_matrix
	.type	dealloc_matrix, @function
dealloc_matrix:
.LFB42:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	testl	%esi, %esi
	jle	.L12
	movl	%esi, %ebp
	cmpl	$8, %esi
	jle	.L16
	leal	-9(%rsi), %eax
	leaq	96(%rdi), %r13
	xorl	%ebx, %ebx
	andl	$-8, %eax
	leal	8(%rax), %r14d
.L14:
	movq	-96(%r13), %rdi
	prefetcht0	0(%r13)
	addl	$8, %ebx
	addq	$64, %r13
	call	free@PLT
	movq	-152(%r13), %rdi
	call	free@PLT
	movq	-144(%r13), %rdi
	call	free@PLT
	movq	-136(%r13), %rdi
	call	free@PLT
	movq	-128(%r13), %rdi
	call	free@PLT
	movq	-120(%r13), %rdi
	call	free@PLT
	movq	-112(%r13), %rdi
	call	free@PLT
	movq	-104(%r13), %rdi
	call	free@PLT
	cmpl	%r14d, %ebx
	jne	.L14
.L13:
	movslq	%ebx, %rbx
	.p2align 4,,10
	.p2align 3
.L15:
	movq	(%r12,%rbx,8), %rdi
	incq	%rbx
	call	free@PLT
	cmpl	%ebx, %ebp
	jg	.L15
.L12:
	movq	%r12, %rdi
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	free@PLT
.L16:
	.cfi_restore_state
	xorl	%ebx, %ebx
	jmp	.L13
	.cfi_endproc
.LFE42:
	.size	dealloc_matrix, .-dealloc_matrix
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"r"
.LC1:
	.string	"%lf\n"
	.text
	.p2align 4,,10
	.p2align 3
	.globl	read_data
	.type	read_data, @function
read_data:
.LFB43:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbp
	movq	%rsi, %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	leaq	.LC0(%rip), %rsi
	movl	%edx, %ebx
	call	fopen@PLT
	testq	%rax, %rax
	je	.L26
	testl	%ebx, %ebx
	jle	.L25
	movq	%rax, %r12
	leal	-1(%rbx), %eax
	leaq	8(%rbp,%rax,8), %r15
	leaq	8(,%rax,8), %r14
	leaq	.LC1(%rip), %r13
	.p2align 4,,10
	.p2align 3
.L23:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L24:
	movq	0(%rbp), %rdx
	movq	%r13, %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	addq	%rbx, %rdx
	addq	$8, %rbx
	call	__isoc99_fscanf@PLT
	cmpq	%rbx, %r14
	jne	.L24
	addq	$8, %rbp
	cmpq	%r15, %rbp
	jne	.L23
.L25:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L26:
	.cfi_restore_state
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	movl	$-1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE43:
	.size	read_data, .-read_data
	.p2align 4,,10
	.p2align 3
	.globl	get_m
	.type	get_m, @function
get_m:
.LFB44:
	.cfi_startproc
	endbr64
	testl	%edi, %edi
	jle	.L36
	leal	-1(%rdi), %eax
	cmpl	$12, %eax
	jbe	.L37
	vmovaps	.LC2(%rip), %xmm0
	movl	%edi, %edx
	xorl	%eax, %eax
	shrl	$2, %edx
	.p2align 4,,10
	.p2align 3
.L33:
	incl	%eax
	vpslld	$1, %xmm0, %xmm0
	cmpl	%edx, %eax
	jne	.L33
	vpsrldq	$8, %xmm0, %xmm1
	vpmulld	%xmm1, %xmm0, %xmm0
	movl	%edi, %ecx
	andl	$-4, %ecx
	leal	1(%rcx), %edx
	vpsrldq	$4, %xmm0, %xmm1
	vpmulld	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %eax
	cmpl	%ecx, %edi
	je	.L53
.L32:
	leal	1(%rdx), %ecx
	leal	(%rax,%rax), %esi
	cmpl	%ecx, %edi
	jl	.L48
	leal	2(%rdx), %ecx
	leal	0(,%rax,4), %esi
	cmpl	%ecx, %edi
	jl	.L48
	leal	3(%rdx), %ecx
	leal	0(,%rax,8), %esi
	cmpl	%ecx, %edi
	jl	.L48
	movl	%eax, %esi
	leal	4(%rdx), %ecx
	sall	$4, %esi
	cmpl	%ecx, %edi
	jl	.L48
	movl	%eax, %esi
	leal	5(%rdx), %ecx
	sall	$5, %esi
	cmpl	%ecx, %edi
	jl	.L48
	movl	%eax, %esi
	leal	6(%rdx), %ecx
	sall	$6, %esi
	cmpl	%ecx, %edi
	jl	.L48
	movl	%eax, %esi
	leal	7(%rdx), %ecx
	sall	$7, %esi
	cmpl	%ecx, %edi
	jl	.L48
	movl	%eax, %esi
	leal	8(%rdx), %ecx
	sall	$8, %esi
	cmpl	%ecx, %edi
	jl	.L48
	movl	%eax, %esi
	leal	9(%rdx), %ecx
	sall	$9, %esi
	cmpl	%ecx, %edi
	jl	.L48
	movl	%eax, %esi
	leal	10(%rdx), %ecx
	sall	$10, %esi
	cmpl	%ecx, %edi
	jl	.L48
	movl	%eax, %esi
	leal	11(%rdx), %ecx
	sall	$11, %esi
	cmpl	%ecx, %edi
	jl	.L48
	movl	%eax, %ecx
	addl	$12, %edx
	sall	$12, %ecx
	cmpl	%edx, %edi
	jl	.L49
	sall	$13, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L48:
	movl	%esi, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L53:
	ret
	.p2align 4,,7
	.p2align 3
.L36:
	movl	$1, %eax
	ret
.L37:
	movl	$1, %eax
	movl	$1, %edx
	jmp	.L32
.L49:
	movl	%ecx, %eax
	ret
	.cfi_endproc
.LFE44:
	.size	get_m, .-get_m
	.section	.rodata.str1.1
.LC3:
	.string	"\n"
	.text
	.p2align 4,,10
	.p2align 3
	.globl	fill_f
	.type	fill_f, @function
fill_f:
.LFB45:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%esi, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	leaq	.LC3(%rip), %rdi
	vmovsd	%xmm0, (%rsp)
	call	puts@PLT
	testl	%r13d, %r13d
	jle	.L65
	vmovsd	(%rsp), %xmm2
	leal	-1(%r13), %eax
	xorl	%r14d, %r14d
	movq	%rax, 48(%rsp)
	leal	-9(%r13), %eax
	andl	$-8, %eax
	addl	$8, %eax
	vmulsd	%xmm2, %xmm2, %xmm6
	movl	%eax, 60(%rsp)
	vmovsd	%xmm6, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L56:
	vxorps	%xmm6, %xmm6, %xmm6
	xorl	%ebx, %ebx
	vcvtsi2sdl	%r14d, %xmm6, %xmm1
	vmulsd	.LC4(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 16(%rsp)
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	16(%rsp), %xmm1
	vmovsd	%xmm0, 8(%rsp)
	vmulsd	.LC6(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	movq	(%r15,%r14,8), %r12
	vmovsd	%xmm0, 16(%rsp)
	leaq	48(%r12), %rbp
	cmpl	$8, %r13d
	jle	.L60
.L59:
	vxorps	%xmm4, %xmm4, %xmm4
	prefetchw	0(%rbp)
	addq	$64, %rbp
	vcvtsi2sdl	%ebx, %xmm4, %xmm1
	vmulsd	.LC4(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 32(%rsp)
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	32(%rsp), %xmm1
	vmovsd	%xmm0, 24(%rsp)
	vmulsd	.LC5(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	40(%rsp), %xmm5
	vxorps	%xmm4, %xmm4, %xmm4
	leal	1(%rbx), %eax
	vmovaps	%xmm0, %xmm1
	vmulsd	24(%rsp), %xmm5, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vcvtsi2sdl	%eax, %xmm4, %xmm1
	vmovsd	%xmm1, 32(%rsp)
	vmulsd	8(%rsp), %xmm0, %xmm0
	vmulsd	16(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, -112(%rbp)
	vmulsd	.LC4(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	32(%rsp), %xmm1
	vmovsd	%xmm0, 24(%rsp)
	vmulsd	.LC5(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	40(%rsp), %xmm5
	vxorps	%xmm4, %xmm4, %xmm4
	leal	2(%rbx), %eax
	vmovaps	%xmm0, %xmm1
	vmulsd	24(%rsp), %xmm5, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vcvtsi2sdl	%eax, %xmm4, %xmm1
	vmovsd	%xmm1, 32(%rsp)
	vmulsd	8(%rsp), %xmm0, %xmm0
	vmulsd	16(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, -104(%rbp)
	vmulsd	.LC4(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	32(%rsp), %xmm1
	vmovsd	%xmm0, 24(%rsp)
	vmulsd	.LC5(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	40(%rsp), %xmm5
	vxorps	%xmm4, %xmm4, %xmm4
	leal	3(%rbx), %eax
	vmovaps	%xmm0, %xmm1
	vmulsd	24(%rsp), %xmm5, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vcvtsi2sdl	%eax, %xmm4, %xmm1
	vmulsd	8(%rsp), %xmm0, %xmm0
	vmovsd	%xmm1, 32(%rsp)
	vmulsd	16(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, -96(%rbp)
	vmulsd	.LC4(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	32(%rsp), %xmm1
	vmovsd	%xmm0, 24(%rsp)
	vmulsd	.LC5(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	40(%rsp), %xmm5
	vxorps	%xmm4, %xmm4, %xmm4
	leal	4(%rbx), %eax
	vmovaps	%xmm0, %xmm1
	vmulsd	24(%rsp), %xmm5, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vcvtsi2sdl	%eax, %xmm4, %xmm1
	vmovsd	%xmm1, 32(%rsp)
	vmulsd	8(%rsp), %xmm0, %xmm0
	vmulsd	16(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, -88(%rbp)
	vmulsd	.LC4(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	32(%rsp), %xmm1
	vmovsd	%xmm0, 24(%rsp)
	vmulsd	.LC5(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	40(%rsp), %xmm5
	vxorps	%xmm4, %xmm4, %xmm4
	leal	5(%rbx), %eax
	vmovaps	%xmm0, %xmm1
	vmulsd	24(%rsp), %xmm5, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vcvtsi2sdl	%eax, %xmm4, %xmm1
	vmovsd	%xmm1, 32(%rsp)
	vmulsd	8(%rsp), %xmm0, %xmm0
	vmulsd	16(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, -80(%rbp)
	vmulsd	.LC4(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	32(%rsp), %xmm1
	vmovsd	%xmm0, 24(%rsp)
	vmulsd	.LC5(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	40(%rsp), %xmm5
	vxorps	%xmm4, %xmm4, %xmm4
	leal	6(%rbx), %eax
	vmovaps	%xmm0, %xmm1
	vmulsd	24(%rsp), %xmm5, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vcvtsi2sdl	%eax, %xmm4, %xmm1
	vmovsd	%xmm1, 32(%rsp)
	vmulsd	8(%rsp), %xmm0, %xmm0
	vmulsd	16(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, -72(%rbp)
	vmulsd	.LC4(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	32(%rsp), %xmm1
	vmovsd	%xmm0, 24(%rsp)
	vmulsd	.LC5(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	40(%rsp), %xmm5
	vxorps	%xmm4, %xmm4, %xmm4
	leal	7(%rbx), %eax
	addl	$8, %ebx
	vmovaps	%xmm0, %xmm1
	vmulsd	24(%rsp), %xmm5, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vcvtsi2sdl	%eax, %xmm4, %xmm1
	vmovsd	%xmm1, 32(%rsp)
	vmulsd	8(%rsp), %xmm0, %xmm0
	vmulsd	16(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, -64(%rbp)
	vmulsd	.LC4(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	32(%rsp), %xmm1
	vmovsd	%xmm0, 24(%rsp)
	vmulsd	.LC5(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	40(%rsp), %xmm5
	vmovaps	%xmm0, %xmm1
	vmulsd	24(%rsp), %xmm5, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vmulsd	8(%rsp), %xmm0, %xmm0
	vmulsd	16(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, -56(%rbp)
	cmpl	60(%rsp), %ebx
	jne	.L59
.L60:
	movslq	%ebx, %rbx
	.p2align 4,,10
	.p2align 3
.L57:
	vxorps	%xmm3, %xmm3, %xmm3
	vcvtsi2sdl	%ebx, %xmm3, %xmm1
	vmulsd	.LC4(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 32(%rsp)
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	32(%rsp), %xmm1
	vmovsd	%xmm0, 24(%rsp)
	vmulsd	.LC5(%rip), %xmm1, %xmm0
	vmulsd	(%rsp), %xmm0, %xmm0
	call	sin@PLT
	vmovsd	40(%rsp), %xmm4
	vmovaps	%xmm0, %xmm1
	vmulsd	24(%rsp), %xmm4, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vmulsd	8(%rsp), %xmm0, %xmm0
	vmulsd	16(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rbx,8)
	incq	%rbx
	cmpl	%ebx, %r13d
	jg	.L57
	leaq	1(%r14), %rax
	cmpq	48(%rsp), %r14
	je	.L65
	movq	%rax, %r14
	jmp	.L56
	.p2align 4,,7
	.p2align 3
.L65:
	addq	$72, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE45:
	.size	fill_f, .-fill_f
	.p2align 4,,10
	.p2align 3
	.globl	L1_norm
	.type	L1_norm, @function
L1_norm:
.LFB46:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L75
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	vmovaps	.LC8(%rip), %xmm5
	leal	-1(%rsi), %eax
	movq	%rdi, %r8
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%esi, %ebx
	vmovq	.LC9(%rip), %xmm3
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	8(%rdi,%rax,8), %rsi
	movl	%ebx, %edi
	movl	%ebx, %r10d
	shrl	%edi
	andl	$-2, %r10d
	leal	-5(%rdi), %r11d
	vmovaps	%xmm5, %xmm4
	andl	$-4, %r11d
	leal	4(%r11), %ebp
	.p2align 4,,10
	.p2align 3
.L69:
	movq	(%r8), %rcx
	cmpl	$1, %ebx
	je	.L76
	vmovaps	%xmm5, %xmm6
	movq	%rcx, %rax
	xorl	%edx, %edx
	cmpl	$4, %edi
	jbe	.L70
	vmovaps	%xmm4, %xmm6
.L72:
	vandps	(%rax), %xmm4, %xmm1
	movl	%edx, %r9d
	prefetcht0	400(%rax)
	addl	$4, %edx
	addq	$64, %rax
	vaddsd	%xmm1, %xmm0, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vandps	-48(%rax), %xmm4, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm2
	vandps	-16(%rax), %xmm4, %xmm1
	vaddsd	%xmm0, %xmm2, %xmm2
	vandps	-32(%rax), %xmm4, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
	vunpckhpd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm2, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm2
	vunpckhpd	%xmm1, %xmm1, %xmm0
	vaddsd	%xmm2, %xmm0, %xmm0
	cmpl	%r11d, %r9d
	jne	.L72
	movl	%ebp, %edx
	.p2align 4,,10
	.p2align 3
.L70:
	vandps	(%rax), %xmm6, %xmm1
	incl	%edx
	addq	$16, %rax
	vaddsd	%xmm0, %xmm1, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	cmpl	%edx, %edi
	ja	.L70
	cmpl	%ebx, %r10d
	je	.L71
	movslq	%r10d, %rax
.L74:
	vmovsd	(%rcx,%rax,8), %xmm1
	vandps	%xmm3, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
.L71:
	addq	$8, %r8
	cmpq	%rsi, %r8
	jne	.L69
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,7
	.p2align 3
.L76:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L74
.L75:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	vxorpd	%xmm0, %xmm0, %xmm0
	ret
	.cfi_endproc
.LFE46:
	.size	L1_norm, .-L1_norm
	.p2align 4,,10
	.p2align 3
	.globl	L2_norm
	.type	L2_norm, @function
L2_norm:
.LFB47:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L94
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leal	-1(%rsi), %eax
	movq	%rdi, %r8
	vxorpd	%xmm3, %xmm3, %xmm3
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%esi, %ebx
	leaq	8(%rdi,%rax,8), %rsi
	movl	%ebx, %edi
	movl	%ebx, %r10d
	vmovaps	%xmm3, %xmm0
	shrl	%edi
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	andl	$-2, %r10d
	leal	-5(%rdi), %r11d
	andl	$-4, %r11d
	leal	4(%r11), %ebp
	.p2align 4,,10
	.p2align 3
.L87:
	movq	(%r8), %rcx
	cmpl	$1, %ebx
	je	.L95
	movq	%rcx, %rax
	xorl	%edx, %edx
	cmpl	$4, %edi
	jbe	.L88
.L90:
	vmovups	(%rax), %xmm2
	movl	%edx, %r9d
	prefetcht0	400(%rax)
	addl	$4, %edx
	addq	$64, %rax
	vmulpd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm0, %xmm1
	vunpckhpd	%xmm2, %xmm2, %xmm0
	vmovups	-48(%rax), %xmm2
	vmulpd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	%xmm2, %xmm1, %xmm0
	vunpckhpd	%xmm2, %xmm2, %xmm1
	vmovups	-16(%rax), %xmm2
	vmulpd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm0, %xmm1, %xmm1
	vmovups	-32(%rax), %xmm0
	vmulpd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vunpckhpd	%xmm2, %xmm2, %xmm1
	vaddsd	%xmm2, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	cmpl	%r11d, %r9d
	jne	.L90
	movl	%ebp, %edx
	.p2align 4,,10
	.p2align 3
.L88:
	vmovups	(%rax), %xmm1
	incl	%edx
	addq	$16, %rax
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	cmpl	%edx, %edi
	ja	.L88
	cmpl	%ebx, %r10d
	je	.L89
	movslq	%r10d, %rax
.L93:
	vmovsd	(%rcx,%rax,8), %xmm1
	vfmadd231sd	%xmm1, %xmm1, %xmm0
.L89:
	addq	$8, %r8
	cmpq	%rsi, %r8
	jne	.L87
	vucomisd	%xmm0, %xmm3
	vsqrtsd	%xmm0, %xmm0, %xmm1
	ja	.L104
.L85:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	vmovaps	%xmm1, %xmm0
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,7
	.p2align 3
.L95:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L93
.L94:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovaps	%xmm1, %xmm0
	ret
.L104:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	vmovsd	%xmm1, 8(%rsp)
	call	sqrt@PLT
	vmovsd	8(%rsp), %xmm1
	jmp	.L85
	.cfi_endproc
.LFE47:
	.size	L2_norm, .-L2_norm
	.p2align 4,,10
	.p2align 3
	.globl	Max_norm
	.type	Max_norm, @function
Max_norm:
.LFB48:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rax
	vmovsd	(%rax), %xmm1
	testl	%esi, %esi
	jle	.L105
	vmovq	.LC9(%rip), %xmm2
	leal	-1(%rsi), %eax
	salq	$3, %rax
	leaq	8(%rax,%rdi), %rsi
	leaq	8(%rax), %rcx
	.p2align 4,,10
	.p2align 3
.L110:
	movq	(%rdi), %rax
	leaq	(%rcx,%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L109:
	vmovsd	(%rax), %xmm0
	addq	$8, %rax
	vandps	%xmm2, %xmm0, %xmm0
	vmaxsd	%xmm1, %xmm0, %xmm1
	cmpq	%rax, %rdx
	jne	.L109
	addq	$8, %rdi
	cmpq	%rdi, %rsi
	jne	.L110
.L105:
	vmovaps	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE48:
	.size	Max_norm, .-Max_norm
	.p2align 4,,10
	.p2align 3
	.globl	L_def
	.type	L_def, @function
L_def:
.LFB49:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, -80(%rsp)
	movq	%rsi, -72(%rsp)
	movq	%rdx, -64(%rsp)
	movl	%ecx, -56(%rsp)
	cmpl	$2, %ecx
	jle	.L135
	leal	-3(%rcx), %eax
	leal	-2(%rcx), %ebx
	vmovsd	.LC11(%rip), %xmm3
	vmovaps	.LC10(%rip), %xmm4
	addq	$2, %rax
	movl	%ebx, -20(%rsp)
	movl	$1, %r15d
	movq	%rax, -88(%rsp)
	movl	%ebx, %eax
	shrl	%eax
	movl	%eax, -52(%rsp)
	subl	$5, %eax
	vmovaps	%xmm3, %xmm1
	vmovaps	%xmm4, %xmm2
	andl	$-4, %eax
	movl	%eax, -16(%rsp)
	addl	$4, %eax
	movl	%eax, -12(%rsp)
	movl	%ebx, %eax
	orl	$1, %ebx
	movslq	%ebx, %rcx
	andl	$-2, %eax
	salq	$3, %rcx
	movl	%eax, -24(%rsp)
	leaq	-8(%rcx), %rax
	movq	%rax, -96(%rsp)
	leaq	8(%rcx), %rax
	movq	%rax, -104(%rsp)
	.p2align 4,,10
	.p2align 3
.L122:
	movq	-80(%rsp), %rax
	movq	(%rax,%r15,8), %rdx
	movq	-8(%rax,%r15,8), %rbx
	movq	8(%rax,%r15,8), %rbp
	movq	-64(%rsp), %rax
	leaq	8(%rbx), %r10
	movq	(%rax,%r15,8), %r13
	movq	-72(%rsp), %rax
	leaq	8(%rbp), %r9
	movq	(%rax,%r15,8), %r12
	leaq	24(%rbx), %rax
	leaq	8(%r13), %r11
	leaq	8(%r12), %rdi
	leaq	24(%r12), %r8
	cmpq	%rax, %rdi
	setnb	%r14b
	cmpq	%r8, %r10
	setnb	%al
	orl	%eax, %r14d
	leaq	32(%rdx), %rax
	cmpq	%rax, %rdi
	setnb	%sil
	cmpq	%r8, %rdx
	setnb	%al
	orl	%esi, %eax
	andl	%r14d, %eax
	cmpl	$3, -56(%rsp)
	setne	%sil
	andl	%esi, %eax
	leaq	24(%rbp), %rsi
	cmpq	%rsi, %rdi
	setnb	%sil
	cmpq	%r8, %r9
	setnb	%r14b
	orl	%r14d, %esi
	andl	%eax, %esi
	andl	$1, %esi
	je	.L123
	leaq	24(%r13), %rax
	cmpq	%rax, %rdi
	setnb	%al
	cmpq	%r8, %r11
	setnb	%sil
	orl	%esi, %eax
	testb	$1, %al
	je	.L123
	cmpl	$4, -52(%rsp)
	leaq	8(%rdx), %r14
	leaq	16(%rdx), %rsi
	jbe	.L124
	vmovaps	%xmm2, %xmm5
	xorl	%r8d, %r8d
.L118:
	vmovups	-8(%rsi), %xmm7
	prefetcht0	136(%rsi)
	prefetcht0	144(%r10)
	prefetcht0	144(%r9)
	prefetcht0	128(%rsi)
	prefetcht0	144(%rsi)
	prefetcht0	144(%r11)
	prefetchw	144(%rdi)
	leaq	48(%rsi), %rax
	leaq	56(%rsi), %r14
	addq	$64, %r10
	addq	$64, %r9
	addq	$64, %rsi
	addq	$64, %r11
	addq	$64, %rdi
	vfmsubpd	-64(%r10), %xmm2, %xmm7, %xmm0
	vsubpd	-64(%r9), %xmm0, %xmm0
	vsubpd	-80(%rsi), %xmm0, %xmm0
	vsubpd	-64(%rsi), %xmm0, %xmm0
	vsubpd	-64(%r11), %xmm0, %xmm0
	vmovups	%xmm0, -64(%rdi)
	vmovups	-56(%rsi), %xmm6
	vfmsubpd	-48(%r10), %xmm2, %xmm6, %xmm0
	vsubpd	-48(%r9), %xmm0, %xmm0
	vsubpd	-64(%rsi), %xmm0, %xmm0
	vsubpd	-48(%rsi), %xmm0, %xmm0
	vsubpd	-48(%r11), %xmm0, %xmm0
	vmovups	%xmm0, -48(%rdi)
	vmovups	-40(%rsi), %xmm7
	vfmsubpd	-32(%r10), %xmm2, %xmm7, %xmm0
	vsubpd	-32(%r9), %xmm0, %xmm0
	vsubpd	-48(%rsi), %xmm0, %xmm0
	vsubpd	-32(%rsi), %xmm0, %xmm0
	vsubpd	-32(%r11), %xmm0, %xmm0
	vmovups	%xmm0, -32(%rdi)
	vmovups	-24(%rsi), %xmm6
	vfmsubpd	-16(%r10), %xmm2, %xmm6, %xmm0
	vsubpd	-16(%r9), %xmm0, %xmm0
	vsubpd	-32(%rsi), %xmm0, %xmm0
	vsubpd	-16(%rsi), %xmm0, %xmm0
	movq	%rax, -32(%rsp)
	movl	%r8d, %eax
	addl	$4, %r8d
	vsubpd	-16(%r11), %xmm0, %xmm0
	vmovups	%xmm0, -16(%rdi)
	cmpl	-16(%rsp), %eax
	jne	.L118
	movl	-12(%rsp), %r8d
.L117:
	movq	%rdx, -48(%rsp)
	xorl	%eax, %eax
	movq	%rbx, -40(%rsp)
	movq	-32(%rsp), %rdx
	movl	-52(%rsp), %ebx
	.p2align 4,,10
	.p2align 3
.L119:
	vmovups	(%r14,%rax), %xmm6
	incl	%r8d
	vfmsubpd	(%r10,%rax), %xmm5, %xmm6, %xmm0
	vsubpd	(%r9,%rax), %xmm0, %xmm0
	vsubpd	(%rdx,%rax), %xmm0, %xmm0
	vsubpd	(%rsi,%rax), %xmm0, %xmm0
	vsubpd	(%r11,%rax), %xmm0, %xmm0
	vmovups	%xmm0, (%rdi,%rax)
	addq	$16, %rax
	cmpl	%r8d, %ebx
	ja	.L119
	movl	-20(%rsp), %edi
	movq	-48(%rsp), %rdx
	movq	-40(%rsp), %rbx
	cmpl	%edi, -24(%rsp)
	je	.L121
	vmovsd	(%rdx,%rcx), %xmm7
	movq	-96(%rsp), %rax
	vfmsubsd	(%rbx,%rcx), %xmm1, %xmm7, %xmm0
	vsubsd	0(%rbp,%rcx), %xmm0, %xmm0
	vsubsd	(%rdx,%rax), %xmm0, %xmm0
	movq	-104(%rsp), %rax
	vsubsd	(%rdx,%rax), %xmm0, %xmm0
	vsubsd	0(%r13,%rcx), %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rcx)
.L121:
	incq	%r15
	cmpq	-88(%rsp), %r15
	jne	.L122
.L135:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,7
	.p2align 3
.L123:
	.cfi_restore_state
	movq	-88(%rsp), %rsi
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L116:
	vmovsd	(%rdx,%rax,8), %xmm5
	vfmsubsd	(%rbx,%rax,8), %xmm3, %xmm5, %xmm0
	vsubsd	0(%rbp,%rax,8), %xmm0, %xmm0
	vsubsd	-8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	8(%rdx,%rax,8), %xmm0, %xmm0
	vsubsd	0(%r13,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rax,8)
	incq	%rax
	cmpq	%rsi, %rax
	jne	.L116
	jmp	.L121
.L124:
	movq	%rdx, -32(%rsp)
	vmovaps	%xmm4, %xmm5
	xorl	%r8d, %r8d
	jmp	.L117
	.cfi_endproc
.LFE49:
	.size	L_def, .-L_def
	.p2align 4,,10
	.p2align 3
	.globl	GS_update
	.type	GS_update, @function
GS_update:
.LFB50:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leal	-1(%rdx), %ebx
	cmpl	$1, %ebx
	jle	.L147
	leal	-11(%rdx), %eax
	vmovsd	.LC12(%rip), %xmm2
	leal	-3(%rdx), %r15d
	movq	%rdi, %r12
	andl	$-8, %eax
	movq	%rsi, %r14
	movl	%edx, %r13d
	addq	$2, %r15
	addl	$9, %eax
	movl	$1, %ebp
	movl	%eax, -4(%rsp)
	.p2align 4,,10
	.p2align 3
.L142:
	movq	(%r12,%rbp,8), %rdx
	movq	-8(%r12,%rbp,8), %r9
	movq	8(%r12,%rbp,8), %r10
	movq	(%r14,%rbp,8), %r11
	vmovsd	(%rdx), %xmm0
	cmpl	$10, %r13d
	jle	.L143
	leaq	80(%r9), %r8
	leaq	80(%r10), %rdi
	movl	$1, %eax
	leaq	88(%rdx), %rcx
	leaq	80(%r11), %rsi
.L140:
	vmovsd	-72(%r8), %xmm1
	prefetcht0	(%r8)
	prefetcht0	(%rdi)
	prefetcht0	(%rsi)
	prefetcht0	(%rcx)
	addl	$8, %eax
	addq	$64, %r8
	addq	$64, %rdi
	addq	$64, %rcx
	addq	$64, %rsi
	vaddsd	-136(%rdi), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vaddsd	-136(%rcx), %xmm0, %xmm0
	vaddsd	-136(%rsi), %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, -144(%rcx)
	vmovsd	-128(%rdi), %xmm1
	vaddsd	-128(%r8), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vaddsd	-128(%rcx), %xmm0, %xmm0
	vaddsd	-128(%rsi), %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm1
	vmovsd	%xmm1, -136(%rcx)
	vmovsd	-120(%rdi), %xmm0
	vaddsd	-120(%r8), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vaddsd	-120(%rcx), %xmm0, %xmm0
	vaddsd	-120(%rsi), %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm1
	vmovsd	%xmm1, -128(%rcx)
	vmovsd	-112(%r8), %xmm0
	vaddsd	-112(%rdi), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vaddsd	-112(%rcx), %xmm0, %xmm0
	vaddsd	-112(%rsi), %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm1
	vmovsd	%xmm1, -120(%rcx)
	vmovsd	-104(%r8), %xmm0
	vaddsd	-104(%rdi), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vaddsd	-104(%rcx), %xmm0, %xmm0
	vaddsd	-104(%rsi), %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm1
	vmovsd	%xmm1, -112(%rcx)
	vmovsd	-96(%r8), %xmm0
	vaddsd	-96(%rdi), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vaddsd	-96(%rcx), %xmm0, %xmm0
	vaddsd	-96(%rsi), %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm1
	vmovsd	%xmm1, -104(%rcx)
	vmovsd	-88(%r8), %xmm0
	vaddsd	-88(%rdi), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vaddsd	-88(%rcx), %xmm0, %xmm0
	vaddsd	-88(%rsi), %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm1
	vmovsd	%xmm1, -96(%rcx)
	vmovsd	-80(%r8), %xmm0
	vaddsd	-80(%rdi), %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vaddsd	-80(%rcx), %xmm0, %xmm0
	vaddsd	-80(%rsi), %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, -88(%rcx)
	cmpl	-4(%rsp), %eax
	jne	.L140
.L139:
	cltq
	.p2align 4,,10
	.p2align 3
.L141:
	vmovsd	(%r10,%rax,8), %xmm1
	vaddsd	(%r9,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vaddsd	8(%rdx,%rax,8), %xmm0, %xmm0
	vaddsd	(%r11,%rax,8), %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax,8)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L141
	incq	%rbp
	cmpq	%r15, %rbp
	jne	.L142
.L147:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,7
	.p2align 3
.L143:
	.cfi_restore_state
	movl	$1, %eax
	jmp	.L139
	.cfi_endproc
.LFE50:
	.size	GS_update, .-GS_update
	.p2align 4,,10
	.p2align 3
	.globl	set_BC
	.type	set_BC, @function
set_BC:
.LFB51:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L153
	movslq	%esi, %rax
	movq	(%rdi), %r9
	decl	%esi
	leaq	-8(,%rax,8), %rcx
	xorl	%eax, %eax
	movq	(%rdi,%rcx), %r8
	.p2align 4,,10
	.p2align 3
.L151:
	movq	(%rdi,%rax,8), %rdx
	movq	$0x000000000, (%r9,%rax,8)
	movq	$0x000000000, (%r8,%rax,8)
	movq	$0x000000000, (%rdx)
	movq	$0x000000000, (%rdx,%rcx)
	movq	%rax, %rdx
	incq	%rax
	cmpq	%rdx, %rsi
	jne	.L151
.L153:
	ret
	.cfi_endproc
.LFE51:
	.size	set_BC, .-set_BC
	.p2align 4,,10
	.p2align 3
	.globl	res_R
	.type	res_R, @function
res_R:
.LFB52:
	.cfi_startproc
	endbr64
	testl	%edx, %edx
	jle	.L178
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edx, %ebx
	movq	%rsi, %rdx
	leal	-1(%rbx), %eax
	movslq	%ebx, %rbp
	vmovaps	.LC10(%rip), %xmm3
	vmovsd	.LC11(%rip), %xmm2
	movq	%rax, %r12
	leaq	16(%rdi), %r11
	salq	$4, %rax
	leaq	32(%rdi,%rax), %r15
	movl	%r12d, %r10d
	movq	%rbp, %rax
	movl	%r12d, %ecx
	salq	$4, %rax
	shrl	%r10d
	andl	$-2, %ecx
	salq	$3, %rbp
	leaq	-8(%rax), %r14
	leal	-5(%r10), %eax
	movl	%ecx, %esi
	vmovaps	%xmm3, %xmm4
	andl	$-4, %eax
	leaq	0(,%rsi,8), %rdi
	movl	%eax, -36(%rsp)
	movq	%rdi, -48(%rsp)
	addl	$4, %eax
	movl	%eax, -12(%rsp)
	leal	(%rcx,%rcx), %eax
	movslq	%eax, %r13
	leal	1(%rcx), %edi
	addl	$2, %eax
	cltq
	movl	%edi, -40(%rsp)
	salq	$3, %r13
	salq	$3, %rax
	movq	%rax, -32(%rsp)
	movl	%edi, %eax
	salq	$3, %rax
	movq	%rax, -24(%rsp)
	leal	-9(%rbx), %eax
	andl	$-8, %eax
	addl	$8, %eax
	movl	%eax, -16(%rsp)
	.p2align 4,,10
	.p2align 3
.L156:
	movq	(%rdx), %r9
	movq	-16(%r11), %r8
	prefetcht0	(%r11)
	leaq	(%r9,%rbp), %rax
	leaq	(%r8,%r14), %rcx
	cmpq	%rax, %r8
	setnb	%al
	cmpq	%rcx, %r9
	setnb	%cl
	orl	%ecx, %eax
	testb	$1, %al
	je	.L166
	cmpl	$2, %r12d
	jbe	.L166
	movq	%r9, %rdi
	movq	%r8, %rcx
	cmpl	$4, %r10d
	jbe	.L168
	vmovaps	%xmm3, %xmm1
	xorl	%eax, %eax
.L163:
	vmovups	(%rcx), %xmm6
	prefetcht0	624(%rcx)
	prefetcht0	688(%rcx)
	movl	%eax, %esi
	prefetchw	304(%rdi)
	subq	$-128, %rcx
	addq	$64, %rdi
	addl	$4, %eax
	vmovhpd	-112(%rcx), %xmm6, %xmm0
	vmulpd	%xmm3, %xmm0, %xmm0
	vmovups	%xmm0, -64(%rdi)
	vmovups	-96(%rcx), %xmm7
	vmovhpd	-80(%rcx), %xmm7, %xmm0
	vmulpd	%xmm3, %xmm0, %xmm0
	vmovups	%xmm0, -48(%rdi)
	vmovups	-64(%rcx), %xmm6
	vmovhpd	-48(%rcx), %xmm6, %xmm0
	vmulpd	%xmm3, %xmm0, %xmm0
	vmovups	%xmm0, -32(%rdi)
	vmovups	-32(%rcx), %xmm7
	vmovhpd	-16(%rcx), %xmm7, %xmm0
	vmulpd	%xmm3, %xmm0, %xmm0
	vmovups	%xmm0, -16(%rdi)
	cmpl	-36(%rsp), %esi
	jne	.L163
	movl	-12(%rsp), %esi
.L162:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L157:
	vmovups	(%rcx,%rax,2), %xmm5
	incl	%esi
	vmovhpd	16(%rcx,%rax,2), %xmm5, %xmm0
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovups	%xmm0, (%rdi,%rax)
	addq	$16, %rax
	cmpl	%esi, %r10d
	ja	.L157
	vmulsd	(%r8,%r13), %xmm2, %xmm0
	movq	-48(%rsp), %rax
	vmovsd	%xmm0, (%r9,%rax)
	cmpl	-40(%rsp), %ebx
	jle	.L158
	movq	-32(%rsp), %rax
	vmulsd	(%r8,%rax), %xmm2, %xmm0
	movq	-24(%rsp), %rax
	vmovsd	%xmm0, (%r9,%rax)
.L158:
	addq	$16, %r11
	addq	$8, %rdx
	cmpq	%r15, %r11
	jne	.L156
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,7
	.p2align 3
.L166:
	.cfi_restore_state
	cmpl	$8, %ebx
	jle	.L167
	leaq	304(%r8), %rcx
	leaq	152(%r9), %rsi
	xorl	%eax, %eax
.L160:
	vmulsd	-304(%rcx), %xmm2, %xmm0
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	prefetchw	(%rsi)
	addl	$8, %eax
	subq	$-128, %rcx
	addq	$64, %rsi
	vmovsd	%xmm0, -216(%rsi)
	vmulsd	-416(%rcx), %xmm2, %xmm0
	vmovsd	%xmm0, -208(%rsi)
	vmulsd	-400(%rcx), %xmm2, %xmm0
	vmovsd	%xmm0, -200(%rsi)
	vmulsd	-384(%rcx), %xmm2, %xmm0
	vmovsd	%xmm0, -192(%rsi)
	vmulsd	-368(%rcx), %xmm2, %xmm0
	vmovsd	%xmm0, -184(%rsi)
	vmulsd	-352(%rcx), %xmm2, %xmm0
	vmovsd	%xmm0, -176(%rsi)
	vmulsd	-336(%rcx), %xmm2, %xmm0
	vmovsd	%xmm0, -168(%rsi)
	vmulsd	-320(%rcx), %xmm2, %xmm0
	vmovsd	%xmm0, -160(%rsi)
	cmpl	-16(%rsp), %eax
	jne	.L160
.L159:
	cltq
	.p2align 4,,10
	.p2align 3
.L161:
	movq	%rax, %rcx
	salq	$4, %rcx
	vmulsd	(%r8,%rcx), %xmm2, %xmm0
	vmovsd	%xmm0, (%r9,%rax,8)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L161
	jmp	.L158
.L168:
	vmovaps	%xmm4, %xmm1
	xorl	%esi, %esi
	jmp	.L162
.L167:
	xorl	%eax, %eax
	jmp	.L159
.L178:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
	.cfi_endproc
.LFE52:
	.size	res_R, .-res_R
	.p2align 4,,10
	.p2align 3
	.globl	prol_P
	.type	prol_P, @function
prol_P:
.LFB53:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	movq	%rsi, 8(%rsp)
	movl	%ecx, 36(%rsp)
	testl	%edx, %edx
	jle	.L182
	movl	%edx, %ebp
	cmpl	$8, %edx
	jle	.L215
	leal	-9(%rdx), %r15d
	leaq	80(%rdi), %r13
	xorl	%ebx, %ebx
	andl	$-8, %r15d
	leal	8(%r15), %eax
	movl	%eax, 16(%rsp)
	leal	-1(%rdx), %eax
	movq	%rax, %r15
	leaq	8(,%rax,8), %r14
.L185:
	movq	-80(%r13), %rdi
	movq	%r14, %rdx
	xorl	%esi, %esi
	prefetcht0	0(%r13)
	addl	$8, %ebx
	addq	$64, %r13
	call	memset@PLT
	movq	-136(%r13), %rdi
	movq	%r14, %rdx
	xorl	%esi, %esi
	call	memset@PLT
	movq	-128(%r13), %rdi
	movq	%r14, %rdx
	xorl	%esi, %esi
	call	memset@PLT
	movq	-120(%r13), %rdi
	movq	%r14, %rdx
	xorl	%esi, %esi
	call	memset@PLT
	movq	-112(%r13), %rdi
	movq	%r14, %rdx
	xorl	%esi, %esi
	call	memset@PLT
	movq	-104(%r13), %rdi
	movq	%r14, %rdx
	xorl	%esi, %esi
	call	memset@PLT
	movq	-96(%r13), %rdi
	movq	%r14, %rdx
	xorl	%esi, %esi
	call	memset@PLT
	movq	-88(%r13), %rdi
	movq	%r14, %rdx
	xorl	%esi, %esi
	call	memset@PLT
	cmpl	16(%rsp), %ebx
	jne	.L185
.L186:
	movl	%r15d, %r8d
	movslq	%ebx, %rbx
	leaq	8(,%r8,8), %r14
	.p2align 4,,10
	.p2align 3
.L184:
	movq	(%r12,%rbx,8), %rdi
	movq	%r14, %rdx
	xorl	%esi, %esi
	incq	%rbx
	call	memset@PLT
	cmpl	%ebx, %ebp
	jg	.L184
.L182:
	movl	36(%rsp), %edi
	leal	-1(%rdi), %esi
	movl	%esi, 124(%rsp)
	testl	%esi, %esi
	jle	.L213
	movq	8(%rsp), %rax
	vmovaps	.LC13(%rip), %xmm6
	vmovaps	.LC14(%rip), %xmm5
	vmovsd	.LC15(%rip), %xmm4
	movq	%rax, 24(%rsp)
	leaq	24(%r12), %rax
	vmovaps	%xmm6, %xmm2
	movq	%rax, 16(%rsp)
	leal	-2(%rdi), %eax
	vmovaps	%xmm5, %xmm3
	salq	$4, %rax
	leaq	40(%r12,%rax), %rax
	movq	%rax, 72(%rsp)
	movl	%esi, %eax
	leaq	8(,%rax,8), %rdx
	salq	$4, %rax
	movq	%rax, 56(%rsp)
	movq	%rdx, 64(%rsp)
	movl	%esi, %eax
	andl	$-2, %esi
	shrl	%eax
	movl	%esi, 128(%rsp)
	movl	%eax, 120(%rsp)
	subl	$5, %eax
	andl	$-4, %eax
	movl	%eax, 132(%rsp)
	addl	$4, %eax
	movl	%eax, 140(%rsp)
	movslq	%esi, %rax
	leaq	0(,%rax,8), %r13
	leal	(%rsi,%rsi), %eax
	cltq
	leaq	0(,%rax,8), %r12
	leaq	8(%r13), %rax
	movq	%rax, 8(%rsp)
	leal	-6(%rdi), %eax
	andl	$-4, %eax
	leaq	8(%r12), %r15
	addl	$4, %eax
	movl	%eax, 136(%rsp)
	movq	%r15, %rax
	movq	%r13, %r15
	movq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L197:
	movq	16(%rsp), %rax
	movq	24(%rsp), %rsi
	movq	56(%rsp), %rdi
	movq	-16(%rax), %r11
	movq	(%rsi), %rdx
	prefetcht0	(%rax)
	movq	-24(%rax), %r10
	movq	64(%rsp), %rax
	movq	8(%rsi), %rsi
	leaq	(%r11,%rdi), %r8
	leaq	(%rdx,%rax), %rbx
	leaq	(%r10,%rdi), %r9
	cmpq	%r8, %rdx
	setnb	%cl
	leaq	(%rsi,%rax), %rdi
	cmpq	%rbx, %r11
	setnb	%al
	orl	%eax, %ecx
	cmpq	%r9, %rdx
	setnb	%al
	cmpq	%rbx, %r10
	setnb	%bl
	orl	%ebx, %eax
	andl	%eax, %ecx
	cmpl	$2, 36(%rsp)
	setne	%al
	andl	%eax, %ecx
	cmpq	%r9, %rsi
	setnb	%r9b
	cmpq	%rdi, %r10
	setnb	%al
	orl	%eax, %r9d
	andl	%ecx, %r9d
	cmpq	%r8, %rsi
	setnb	%al
	cmpq	%rdi, %r11
	setnb	%cl
	orl	%ecx, %eax
	andl	%eax, %r9d
	andl	$1, %r9d
	je	.L188
	leaq	31(%r10), %rax
	subq	%r11, %rax
	cmpq	$62, %rax
	jbe	.L188
	cmpl	$4, 120(%rsp)
	leaq	8(%rdx), %r14
	leaq	8(%rsi), %rax
	movq	%r11, %r8
	movq	%r14, 40(%rsp)
	movq	%rax, 48(%rsp)
	jbe	.L198
	vmovaps	%xmm2, %xmm8
	vmovaps	%xmm3, %xmm9
	movq	%r10, %rdi
	movq	%r10, %rbp
	movq	%rsi, %r9
	movq	%rdx, %rcx
	xorl	%ebx, %ebx
	movq	%rdx, %r10
.L190:
	vmovups	(%rcx), %xmm7
	prefetcht0	80(%rcx)
	prefetcht0	80(%r9)
	prefetcht0	88(%rcx)
	prefetcht0	88(%r9)
	prefetchw	176(%rdi)
	prefetchw	240(%rdi)
	prefetchw	176(%r8)
	prefetchw	240(%r8)
	movq	%r9, %rax
	addq	$64, %rcx
	addq	$64, %r9
	addq	$64, %r14
	movl	%ebx, %edx
	subq	$-128, %rdi
	addq	$72, %rax
	vaddpd	-56(%rcx), %xmm7, %xmm0
	vaddpd	-64(%r9), %xmm7, %xmm1
	subq	$-128, %r8
	addl	$4, %ebx
	vmulpd	%xmm2, %xmm0, %xmm0
	vmulpd	%xmm2, %xmm1, %xmm1
	vunpcklpd	%xmm0, %xmm7, %xmm10
	vunpckhpd	%xmm0, %xmm7, %xmm7
	vmovups	%xmm10, -128(%rdi)
	vmovups	%xmm7, -112(%rdi)
	vmovups	-64(%rcx), %xmm7
	vaddpd	-56(%rcx), %xmm7, %xmm0
	vaddpd	-64(%r9), %xmm0, %xmm0
	vaddpd	-56(%r9), %xmm0, %xmm0
	vmulpd	%xmm3, %xmm0, %xmm0
	vunpcklpd	%xmm0, %xmm1, %xmm7
	vunpckhpd	%xmm0, %xmm1, %xmm0
	vmovups	%xmm7, -128(%r8)
	vmovups	%xmm0, -112(%r8)
	vmovups	-48(%rcx), %xmm7
	vaddpd	-40(%rcx), %xmm7, %xmm0
	vaddpd	-48(%r9), %xmm7, %xmm1
	vmulpd	%xmm2, %xmm0, %xmm0
	vmulpd	%xmm2, %xmm1, %xmm1
	vunpcklpd	%xmm0, %xmm7, %xmm10
	vunpckhpd	%xmm0, %xmm7, %xmm7
	vmovups	%xmm10, -96(%rdi)
	vmovups	%xmm7, -80(%rdi)
	vmovups	-48(%rcx), %xmm7
	vaddpd	-40(%rcx), %xmm7, %xmm0
	vaddpd	-48(%r9), %xmm0, %xmm0
	vaddpd	-40(%r9), %xmm0, %xmm0
	vmulpd	%xmm3, %xmm0, %xmm0
	vunpcklpd	%xmm0, %xmm1, %xmm7
	vunpckhpd	%xmm0, %xmm1, %xmm0
	vmovups	%xmm7, -96(%r8)
	vmovups	%xmm0, -80(%r8)
	vmovups	-32(%rcx), %xmm7
	vaddpd	-32(%r9), %xmm7, %xmm1
	vaddpd	-24(%rcx), %xmm7, %xmm0
	movq	%r14, 80(%rsp)
	vmulpd	%xmm2, %xmm0, %xmm0
	vmulpd	%xmm2, %xmm1, %xmm1
	vunpcklpd	%xmm0, %xmm7, %xmm10
	vunpckhpd	%xmm0, %xmm7, %xmm7
	vmovups	%xmm10, -64(%rdi)
	vmovups	%xmm7, -48(%rdi)
	vmovups	-32(%rcx), %xmm7
	vaddpd	-24(%rcx), %xmm7, %xmm0
	vaddpd	-32(%r9), %xmm0, %xmm0
	vaddpd	-24(%r9), %xmm0, %xmm0
	vmulpd	%xmm3, %xmm0, %xmm0
	vunpcklpd	%xmm0, %xmm1, %xmm7
	vunpckhpd	%xmm0, %xmm1, %xmm0
	vmovups	%xmm7, -64(%r8)
	vmovups	%xmm0, -48(%r8)
	vmovups	-16(%rcx), %xmm7
	vaddpd	-8(%rcx), %xmm7, %xmm0
	vaddpd	-16(%r9), %xmm7, %xmm1
	vmulpd	%xmm2, %xmm0, %xmm0
	vmulpd	%xmm2, %xmm1, %xmm1
	vunpcklpd	%xmm0, %xmm7, %xmm10
	vunpckhpd	%xmm0, %xmm7, %xmm7
	vmovups	%xmm10, -32(%rdi)
	vmovups	%xmm7, -16(%rdi)
	vmovups	-16(%rcx), %xmm7
	vaddpd	-8(%rcx), %xmm7, %xmm0
	movq	%rcx, 48(%rsp)
	vaddpd	-16(%r9), %xmm0, %xmm0
	vaddpd	-8(%r9), %xmm0, %xmm0
	movq	%r9, 112(%rsp)
	vmulpd	%xmm3, %xmm0, %xmm0
	vunpcklpd	%xmm0, %xmm1, %xmm7
	vunpckhpd	%xmm0, %xmm1, %xmm0
	vmovups	%xmm7, -32(%r8)
	vmovups	%xmm0, -16(%r8)
	cmpl	132(%rsp), %edx
	jne	.L190
	movq	%r14, 40(%rsp)
	movq	%r10, %rdx
	movq	%rbp, %r10
	movq	%rcx, %rbp
	movq	%rax, 48(%rsp)
	movl	140(%rsp), %ebx
.L189:
	movq	%rdx, 80(%rsp)
	movq	%r10, 88(%rsp)
	xorl	%eax, %eax
	movq	%rsi, 96(%rsp)
	movq	%r11, 104(%rsp)
	movl	120(%rsp), %edx
	movq	40(%rsp), %rsi
	movq	112(%rsp), %r10
	movq	48(%rsp), %r11
	.p2align 4,,10
	.p2align 3
.L191:
	vmovups	0(%rbp,%rax), %xmm1
	vmovups	(%rcx,%rax), %xmm10
	incl	%ebx
	vaddpd	(%r9,%rax), %xmm1, %xmm7
	vaddpd	(%rsi,%rax), %xmm1, %xmm1
	vmulpd	%xmm8, %xmm1, %xmm1
	vmulpd	%xmm8, %xmm7, %xmm7
	vunpcklpd	%xmm1, %xmm10, %xmm0
	vunpckhpd	%xmm1, %xmm10, %xmm1
	vmovups	%xmm0, (%rdi,%rax,2)
	vmovups	%xmm1, 16(%rdi,%rax,2)
	vmovups	0(%rbp,%rax), %xmm1
	vaddpd	(%r14,%rax), %xmm1, %xmm0
	vaddpd	(%r10,%rax), %xmm0, %xmm0
	vaddpd	(%r11,%rax), %xmm0, %xmm0
	vmulpd	%xmm9, %xmm0, %xmm0
	vunpcklpd	%xmm0, %xmm7, %xmm1
	vunpckhpd	%xmm0, %xmm7, %xmm0
	vmovups	%xmm1, (%r8,%rax,2)
	vmovups	%xmm0, 16(%r8,%rax,2)
	addq	$16, %rax
	cmpl	%ebx, %edx
	ja	.L191
	movl	128(%rsp), %edi
	movq	80(%rsp), %rdx
	movq	88(%rsp), %r10
	movq	96(%rsp), %rsi
	movq	104(%rsp), %r11
	cmpl	%edi, 124(%rsp)
	je	.L196
	leaq	(%rdx,%r15), %rax
	leaq	(%rsi,%r15), %rcx
	vmovsd	.LC15(%rip), %xmm1
	movq	8(%rsp), %rbx
	vmovsd	(%rax), %xmm0
	vmovsd	.LC12(%rip), %xmm8
	addq	%rbx, %rdx
	vmovsd	%xmm0, (%r10,%r12)
	vaddsd	(%rcx), %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r11,%r12)
	vmovsd	(%rax), %xmm0
	vaddsd	(%rdx), %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r10,%r13)
	vmovsd	(%rax), %xmm0
	vaddsd	(%rdx), %xmm0, %xmm0
	vaddsd	(%rcx), %xmm0, %xmm0
	vaddsd	(%rsi,%rbx), %xmm0, %xmm0
	vmulsd	%xmm8, %xmm0, %xmm0
	vmovsd	%xmm0, (%r11,%r13)
.L196:
	addq	$16, 16(%rsp)
	addq	$8, 24(%rsp)
	movq	16(%rsp), %rax
	cmpq	72(%rsp), %rax
	jne	.L197
.L213:
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,7
	.p2align 3
.L188:
	.cfi_restore_state
	cmpl	$5, 36(%rsp)
	jle	.L199
	vmovsd	.LC12(%rip), %xmm8
	vmovaps	%xmm4, %xmm1
	leaq	56(%rdx), %rcx
	leaq	104(%r10), %r9
	leaq	56(%rsi), %rdi
	leaq	104(%r11), %r8
	xorl	%eax, %eax
.L194:
	vmovsd	-56(%rcx), %xmm0
	prefetcht0	(%rcx)
	prefetcht0	(%rdi)
	prefetchw	(%r9)
	prefetchw	(%r8)
	addl	$4, %eax
	addq	$32, %rcx
	addq	$64, %r9
	addq	$32, %rdi
	addq	$64, %r8
	vmovsd	%xmm0, -168(%r9)
	vaddsd	-88(%rdi), %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vmovsd	%xmm0, -168(%r8)
	vmovsd	-88(%rcx), %xmm0
	vaddsd	-80(%rcx), %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vmovsd	%xmm0, -160(%r9)
	vmovsd	-88(%rcx), %xmm0
	vaddsd	-80(%rcx), %xmm0, %xmm0
	vaddsd	-88(%rdi), %xmm0, %xmm0
	vaddsd	-80(%rdi), %xmm0, %xmm0
	vmulsd	%xmm8, %xmm0, %xmm0
	vmovsd	%xmm0, -160(%r8)
	vmovsd	-80(%rcx), %xmm0
	vmovsd	%xmm0, -152(%r9)
	vaddsd	-80(%rdi), %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vmovsd	%xmm0, -152(%r8)
	vmovsd	-80(%rcx), %xmm0
	vaddsd	-72(%rcx), %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vmovsd	%xmm0, -144(%r9)
	vmovsd	-80(%rcx), %xmm0
	vaddsd	-72(%rcx), %xmm0, %xmm0
	vaddsd	-80(%rdi), %xmm0, %xmm0
	vaddsd	-72(%rdi), %xmm0, %xmm0
	vmulsd	%xmm8, %xmm0, %xmm0
	vmovsd	%xmm0, -144(%r8)
	vmovsd	-72(%rcx), %xmm0
	vmovsd	%xmm0, -136(%r9)
	vaddsd	-72(%rdi), %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vmovsd	%xmm0, -136(%r8)
	vmovsd	-72(%rcx), %xmm0
	vaddsd	-64(%rcx), %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vmovsd	%xmm0, -128(%r9)
	vmovsd	-72(%rcx), %xmm0
	vaddsd	-64(%rcx), %xmm0, %xmm0
	vaddsd	-72(%rdi), %xmm0, %xmm0
	vaddsd	-64(%rdi), %xmm0, %xmm0
	vmulsd	%xmm8, %xmm0, %xmm0
	vmovsd	%xmm0, -128(%r8)
	vmovsd	-64(%rcx), %xmm0
	vmovsd	%xmm0, -120(%r9)
	vaddsd	-64(%rdi), %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vmovsd	%xmm0, -120(%r8)
	vmovsd	-64(%rcx), %xmm0
	vaddsd	-56(%rcx), %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vmovsd	%xmm0, -112(%r9)
	vmovsd	-64(%rcx), %xmm0
	vaddsd	-56(%rcx), %xmm0, %xmm0
	vaddsd	-64(%rdi), %xmm0, %xmm0
	vaddsd	-56(%rdi), %xmm0, %xmm0
	vmulsd	%xmm8, %xmm0, %xmm0
	vmovsd	%xmm0, -112(%r8)
	cmpl	136(%rsp), %eax
	jne	.L194
.L193:
	movl	124(%rsp), %edi
	movslq	%eax, %rcx
	salq	$3, %rcx
	.p2align 4,,10
	.p2align 3
.L195:
	vmovsd	(%rdx,%rcx), %xmm7
	incl	%eax
	vmovsd	%xmm7, (%r10,%rcx,2)
	vaddsd	(%rsi,%rcx), %xmm7, %xmm7
	vmulsd	%xmm1, %xmm7, %xmm7
	vmovsd	%xmm7, (%r11,%rcx,2)
	vmovsd	8(%rdx,%rcx), %xmm0
	vaddsd	(%rdx,%rcx), %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%r10,%rcx,2)
	vmovsd	(%rdx,%rcx), %xmm7
	vaddsd	8(%rdx,%rcx), %xmm7, %xmm7
	vaddsd	(%rsi,%rcx), %xmm7, %xmm7
	vaddsd	8(%rsi,%rcx), %xmm7, %xmm7
	vmulsd	%xmm8, %xmm7, %xmm7
	vmovsd	%xmm7, 8(%r11,%rcx,2)
	addq	$8, %rcx
	cmpl	%eax, %edi
	jg	.L195
	jmp	.L196
.L198:
	movq	%rsi, 112(%rsp)
	vmovaps	%xmm6, %xmm8
	vmovaps	%xmm5, %xmm9
	movq	%r10, %rdi
	movq	%rsi, %r9
	movq	%rdx, %rbp
	movq	%rdx, %rcx
	xorl	%ebx, %ebx
	jmp	.L189
.L199:
	vmovsd	.LC15(%rip), %xmm1
	vmovsd	.LC12(%rip), %xmm8
	xorl	%eax, %eax
	jmp	.L193
.L215:
	xorl	%ebx, %ebx
	leal	-1(%rdx), %r15d
	jmp	.L186
	.cfi_endproc
.LFE53:
	.size	prol_P, .-prol_P
	.p2align 4,,10
	.p2align 3
	.globl	multigrid_vcycle
	.type	multigrid_vcycle, @function
multigrid_vcycle:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$232, %rsp
	.cfi_def_cfa_offset 288
	movq	%rsi, 104(%rsp)
	movq	%rdx, 48(%rsp)
	vmovsd	%xmm0, 112(%rsp)
	vmovsd	%xmm1, 64(%rsp)
	testl	%edi, %edi
	jle	.L286
	leal	-1(%rdi), %ecx
	cmpl	$12, %ecx
	jbe	.L287
	vmovaps	.LC2(%rip), %xmm0
	movl	%edi, %edx
	xorl	%eax, %eax
	shrl	$2, %edx
	.p2align 4,,10
	.p2align 3
.L219:
	incl	%eax
	vpslld	$1, %xmm0, %xmm0
	cmpl	%eax, %edx
	jne	.L219
	vpsrldq	$8, %xmm0, %xmm1
	vpmulld	%xmm1, %xmm0, %xmm0
	movl	%r12d, %edx
	andl	$-4, %edx
	leal	1(%rdx), %eax
	vpsrldq	$4, %xmm0, %xmm1
	vpmulld	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %ebp
	cmpl	%edx, %r12d
	je	.L220
.L218:
	leal	1(%rax), %edx
	leal	(%rbp,%rbp), %esi
	cmpl	%edx, %r12d
	jl	.L296
	leal	2(%rax), %edx
	leal	0(,%rbp,4), %esi
	cmpl	%edx, %r12d
	jl	.L296
	leal	3(%rax), %edx
	leal	0(,%rbp,8), %esi
	cmpl	%edx, %r12d
	jl	.L296
	movl	%ebp, %esi
	leal	4(%rax), %edx
	sall	$4, %esi
	cmpl	%edx, %r12d
	jl	.L296
	movl	%ebp, %esi
	leal	5(%rax), %edx
	sall	$5, %esi
	cmpl	%edx, %r12d
	jl	.L296
	movl	%ebp, %esi
	leal	6(%rax), %edx
	sall	$6, %esi
	cmpl	%edx, %r12d
	jl	.L296
	movl	%ebp, %esi
	leal	7(%rax), %edx
	sall	$7, %esi
	cmpl	%edx, %r12d
	jl	.L296
	movl	%ebp, %esi
	leal	8(%rax), %edx
	sall	$8, %esi
	cmpl	%edx, %r12d
	jl	.L296
	movl	%ebp, %esi
	leal	9(%rax), %edx
	sall	$9, %esi
	cmpl	%edx, %r12d
	jl	.L296
	movl	%ebp, %edx
	leal	10(%rax), %esi
	sall	$10, %edx
	cmpl	%esi, %r12d
	jl	.L299
	movl	%ebp, %edx
	leal	11(%rax), %esi
	sall	$11, %edx
	cmpl	%esi, %r12d
	jl	.L299
	movl	%ebp, %edx
	addl	$12, %eax
	sall	$12, %edx
	cmpl	%eax, %r12d
	jl	.L299
	sall	$13, %ebp
.L220:
	leal	1(%rbp), %eax
	movl	%eax, 44(%rsp)
	cmpl	$1, %r12d
	jle	.L217
	leal	-2(%r12), %eax
	cmpl	$12, %eax
	jbe	.L300
	vmovaps	.LC2(%rip), %xmm0
	movl	%ecx, %edx
	xorl	%eax, %eax
	shrl	$2, %edx
	.p2align 4,,10
	.p2align 3
.L222:
	incl	%eax
	vpslld	$1, %xmm0, %xmm0
	cmpl	%eax, %edx
	jne	.L222
	vpsrldq	$8, %xmm0, %xmm1
	vpmulld	%xmm1, %xmm0, %xmm0
	movl	%ecx, %edx
	andl	$-4, %edx
	leal	1(%rdx), %eax
	vpsrldq	$4, %xmm0, %xmm1
	vpmulld	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %ebx
	cmpl	%ecx, %edx
	je	.L223
.L221:
	leal	1(%rax), %edx
	leal	(%rbx,%rbx), %ecx
	cmpl	%edx, %r12d
	jle	.L309
	leal	2(%rax), %edx
	leal	0(,%rbx,4), %ecx
	cmpl	%edx, %r12d
	jle	.L309
	leal	3(%rax), %edx
	leal	0(,%rbx,8), %ecx
	cmpl	%edx, %r12d
	jle	.L309
	movl	%ebx, %ecx
	leal	4(%rax), %edx
	sall	$4, %ecx
	cmpl	%edx, %r12d
	jle	.L309
	movl	%ebx, %ecx
	leal	5(%rax), %edx
	sall	$5, %ecx
	cmpl	%edx, %r12d
	jle	.L309
	movl	%ebx, %ecx
	leal	6(%rax), %edx
	sall	$6, %ecx
	cmpl	%edx, %r12d
	jle	.L309
	movl	%ebx, %ecx
	leal	7(%rax), %edx
	sall	$7, %ecx
	cmpl	%edx, %r12d
	jle	.L309
	movl	%ebx, %ecx
	leal	8(%rax), %edx
	sall	$8, %ecx
	cmpl	%edx, %r12d
	jle	.L309
	movl	%ebx, %ecx
	leal	9(%rax), %edx
	sall	$9, %ecx
	cmpl	%edx, %r12d
	jle	.L309
	movl	%ebx, %edx
	leal	10(%rax), %ecx
	sall	$10, %edx
	cmpl	%ecx, %r12d
	jle	.L312
	movl	%ebx, %edx
	leal	11(%rax), %ecx
	sall	$11, %edx
	cmpl	%ecx, %r12d
	jle	.L312
	movl	%ebx, %edx
	addl	$12, %eax
	sall	$12, %edx
	cmpl	%eax, %r12d
	jle	.L312
	sall	$13, %ebx
.L223:
	incl	%ebx
.L224:
	movslq	44(%rsp), %r14
	leaq	0(,%r14,8), %rax
	movq	%rax, %rdi
	movq	%rax, 8(%rsp)
	call	malloc@PLT
	leal	-7(%rbp), %edi
	movl	%edi, 96(%rsp)
	movq	%rax, 56(%rsp)
	cmpl	$7, %ebp
	jle	.L314
	leaq	88(%rax), %r13
	xorl	%r15d, %r15d
.L227:
	movl	$8, %esi
	movq	%r14, %rdi
	prefetchw	0(%r13)
	addl	$8, %r15d
	call	calloc@PLT
	movl	$8, %esi
	movq	%r14, %rdi
	addq	$64, %r13
	movq	%rax, -152(%r13)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r14, %rdi
	movq	%rax, -144(%r13)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r14, %rdi
	movq	%rax, -136(%r13)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r14, %rdi
	movq	%rax, -128(%r13)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r14, %rdi
	movq	%rax, -120(%r13)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r14, %rdi
	movq	%rax, -112(%r13)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r14, %rdi
	movq	%rax, -104(%r13)
	call	calloc@PLT
	movq	%rax, -96(%r13)
	cmpl	%r15d, 96(%rsp)
	jg	.L227
.L226:
	movq	56(%rsp), %r13
	movslq	%r15d, %r15
	.p2align 4,,10
	.p2align 3
.L228:
	movl	$8, %esi
	movq	%r14, %rdi
	call	calloc@PLT
	movq	%rax, 0(%r13,%r15,8)
	incq	%r15
	leal	-1(%r15), %eax
	cmpl	%eax, %ebp
	jg	.L228
	movslq	%ebx, %r13
	leaq	0(,%r13,8), %rax
	movq	%rax, %rdi
	movq	%rax, (%rsp)
	call	malloc@PLT
	movq	%rax, 88(%rsp)
	cmpl	$8, %ebx
	jle	.L315
	leaq	88(%rax), %r15
	leal	-9(%rbx), %eax
	xorl	%edx, %edx
	andl	$-8, %eax
	movl	%ebx, 20(%rsp)
	movl	%edx, %ebx
	addl	$8, %eax
	movl	%eax, 16(%rsp)
.L230:
	movl	$8, %esi
	movq	%r13, %rdi
	prefetchw	(%r15)
	addl	$8, %ebx
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	addq	$64, %r15
	movq	%rax, -152(%r15)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	movq	%rax, -144(%r15)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	movq	%rax, -136(%r15)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	movq	%rax, -128(%r15)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	movq	%rax, -120(%r15)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	movq	%rax, -112(%r15)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	movq	%rax, -104(%r15)
	call	calloc@PLT
	movq	%rax, -96(%r15)
	cmpl	16(%rsp), %ebx
	jne	.L230
	movl	%ebx, %edx
	movl	20(%rsp), %ebx
.L229:
	movslq	%edx, %r15
	movl	%ebp, 16(%rsp)
	movq	%r15, %rbp
	movq	88(%rsp), %r15
	.p2align 4,,10
	.p2align 3
.L231:
	movl	$8, %esi
	movq	%r13, %rdi
	call	calloc@PLT
	movq	%rax, (%r15,%rbp,8)
	incq	%rbp
	cmpl	%ebp, %ebx
	jg	.L231
	movq	8(%rsp), %rdi
	movl	16(%rsp), %ebp
	call	malloc@PLT
	movq	%rax, 80(%rsp)
	cmpl	$7, %ebp
	jle	.L316
	movl	%ebx, 8(%rsp)
	leaq	88(%rax), %r15
	xorl	%edx, %edx
	movl	%edx, %ebx
.L233:
	movl	$8, %esi
	movq	%r14, %rdi
	prefetchw	(%r15)
	addl	$8, %ebx
	call	calloc@PLT
	movl	$8, %esi
	movq	%r14, %rdi
	addq	$64, %r15
	movq	%rax, -152(%r15)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r14, %rdi
	movq	%rax, -144(%r15)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r14, %rdi
	movq	%rax, -136(%r15)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r14, %rdi
	movq	%rax, -128(%r15)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r14, %rdi
	movq	%rax, -120(%r15)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r14, %rdi
	movq	%rax, -112(%r15)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r14, %rdi
	movq	%rax, -104(%r15)
	call	calloc@PLT
	movq	%rax, -96(%r15)
	cmpl	%ebx, 96(%rsp)
	jg	.L233
	movl	%ebx, %edx
	movl	8(%rsp), %ebx
.L232:
	movslq	%edx, %r15
	movl	%ebx, 8(%rsp)
	movq	%r15, %rbx
	movq	%r14, %r15
	movq	80(%rsp), %r14
	.p2align 4,,10
	.p2align 3
.L234:
	movl	$8, %esi
	movq	%r15, %rdi
	call	calloc@PLT
	movq	%rax, (%r14,%rbx,8)
	incq	%rbx
	leal	-1(%rbx), %eax
	cmpl	%eax, %ebp
	jg	.L234
	movq	(%rsp), %rdi
	movl	8(%rsp), %ebx
	call	malloc@PLT
	movq	%rax, 72(%rsp)
	cmpl	$8, %ebx
	jle	.L317
	leal	-9(%rbx), %r15d
	leaq	88(%rax), %r14
	andl	$-8, %r15d
	leal	8(%r15), %eax
	xorl	%r15d, %r15d
	movl	%eax, (%rsp)
.L236:
	movl	$8, %esi
	movq	%r13, %rdi
	prefetchw	(%r14)
	addl	$8, %r15d
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	addq	$64, %r14
	movq	%rax, -152(%r14)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	movq	%rax, -144(%r14)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	movq	%rax, -136(%r14)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	movq	%rax, -128(%r14)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	movq	%rax, -120(%r14)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	movq	%rax, -112(%r14)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	movq	%rax, -104(%r14)
	call	calloc@PLT
	movq	%rax, -96(%r14)
	cmpl	(%rsp), %r15d
	jne	.L236
.L235:
	movslq	%r15d, %r14
	movq	72(%rsp), %r15
	.p2align 4,,10
	.p2align 3
.L237:
	movl	$8, %esi
	movq	%r13, %rdi
	call	calloc@PLT
	movq	%rax, (%r15,%r14,8)
	incq	%r14
	cmpl	%r14d, %ebx
	jg	.L237
	vmovsd	64(%rsp), %xmm4
	vdivsd	%xmm4, %xmm4, %xmm0
	vcomisd	.LC16(%rip), %xmm0
	jbe	.L273
	movq	56(%rsp), %rsi
	leal	-1(%r12), %eax
	leal	1(%rbp), %r15d
	movl	%eax, 172(%rsp)
	leal	-1(%rbx), %eax
	movl	%r15d, %r11d
	movl	%eax, 8(%rsp)
	movl	%r15d, 120(%rsp)
	movq	%rax, %rdi
	salq	$4, %rax
	movl	%edi, %r14d
	andl	$-2, %edi
	andl	$-2, %r11d
	leaq	32(%rsi,%rax), %rax
	shrl	%r14d
	movl	%edi, %edx
	movslq	%r11d, %r12
	movq	%rax, 200(%rsp)
	movl	%r11d, (%rsp)
	movq	%r13, %rax
	salq	$3, %r12
	salq	$4, %rax
	subq	$8, %rax
	movq	%rax, 152(%rsp)
	leaq	0(,%r13,8), %rax
	movl	%r15d, %r13d
	movq	104(%rsp), %r15
	movq	%rax, 144(%rsp)
	leal	-5(%r14), %eax
	shrl	%r13d
	andl	$-4, %eax
	movl	%eax, 40(%rsp)
	addl	$4, %eax
	movl	%eax, 216(%rsp)
	leal	(%rdi,%rdi), %eax
	movslq	%eax, %rcx
	addl	$2, %eax
	leaq	0(,%rcx,8), %rdi
	movl	%edx, %ecx
	cltq
	movq	%rdi, 160(%rsp)
	leaq	0(,%rcx,8), %rdi
	salq	$3, %rax
	movq	%rdi, 176(%rsp)
	leal	1(%rdx), %edi
	movq	%rax, 32(%rsp)
	movl	%edi, 20(%rsp)
	movl	%edi, %eax
	salq	$3, %rax
	movq	%rax, 24(%rsp)
	movslq	%ebp, %rax
	leaq	8(,%rax,8), %rdi
	leal	-5(%r13), %eax
	andl	$-4, %eax
	movq	%rdi, 192(%rsp)
	addq	%rsi, %rdi
	movl	%eax, 16(%rsp)
	movq	%rdi, 184(%rsp)
	addl	$4, %eax
	movl	%eax, 100(%rsp)
	leaq	16(%rsi), %rax
	movq	%rax, 208(%rsp)
	leal	-9(%rbx), %eax
	movl	%eax, 220(%rsp)
.L272:
	movl	44(%rsp), %edx
	movq	48(%rsp), %rsi
	movq	%r15, %rdi
	call	GS_update
	movl	44(%rsp), %ecx
	movq	48(%rsp), %rdx
	movq	%r15, %rdi
	movq	56(%rsp), %rsi
	call	L_def
	movl	220(%rsp), %eax
	movl	%r13d, 124(%rsp)
	movq	%r12, 128(%rsp)
	movl	%ebp, 168(%rsp)
	movq	%r15, 136(%rsp)
	movq	208(%rsp), %r10
	movq	88(%rsp), %r11
	movq	152(%rsp), %r13
	andl	$-8, %eax
	movq	144(%rsp), %r12
	movq	160(%rsp), %r8
	addl	$8, %eax
	movq	176(%rsp), %rbp
	movq	200(%rsp), %r15
	movl	%eax, 104(%rsp)
	vmovsd	.LC11(%rip), %xmm3
	vmovaps	.LC10(%rip), %xmm4
	.p2align 4,,10
	.p2align 3
.L241:
	movq	-16(%r10), %rdi
	movq	(%r11), %r9
	prefetcht0	(%r10)
	leaq	(%rdi,%r13), %rax
	leaq	(%r9,%r12), %rdx
	cmpq	%rax, %r9
	setnb	%al
	cmpq	%rdx, %rdi
	setnb	%dl
	orl	%edx, %eax
	testb	$1, %al
	je	.L252
	cmpl	$2, 8(%rsp)
	jbe	.L252
	movq	%r9, %rsi
	movq	%rdi, %rdx
	cmpl	$4, %r14d
	jbe	.L319
	vmovaps	%xmm4, %xmm1
	xorl	%eax, %eax
.L248:
	vmovups	(%rdx), %xmm7
	prefetcht0	624(%rdx)
	prefetcht0	688(%rdx)
	movl	%eax, %ecx
	prefetchw	304(%rsi)
	subq	$-128, %rdx
	addq	$64, %rsi
	addl	$4, %eax
	vmovhpd	-112(%rdx), %xmm7, %xmm0
	vmulpd	%xmm4, %xmm0, %xmm0
	vmovups	%xmm0, -64(%rsi)
	vmovups	-96(%rdx), %xmm7
	vmovhpd	-80(%rdx), %xmm7, %xmm0
	vmulpd	%xmm4, %xmm0, %xmm0
	vmovups	%xmm0, -48(%rsi)
	vmovups	-64(%rdx), %xmm7
	vmovhpd	-48(%rdx), %xmm7, %xmm0
	vmulpd	%xmm4, %xmm0, %xmm0
	vmovups	%xmm0, -32(%rsi)
	vmovups	-32(%rdx), %xmm7
	vmovhpd	-16(%rdx), %xmm7, %xmm0
	vmulpd	%xmm4, %xmm0, %xmm0
	vmovups	%xmm0, -16(%rsi)
	cmpl	40(%rsp), %ecx
	jne	.L248
	movl	216(%rsp), %ecx
.L247:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L242:
	vmovups	(%rdx,%rax,2), %xmm5
	incl	%ecx
	vmovhpd	16(%rdx,%rax,2), %xmm5, %xmm0
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovups	%xmm0, (%rsi,%rax)
	addq	$16, %rax
	cmpl	%ecx, %r14d
	ja	.L242
	vmulsd	(%rdi,%r8), %xmm3, %xmm0
	vmovsd	%xmm0, (%r9,%rbp)
	cmpl	20(%rsp), %ebx
	jle	.L243
	movq	32(%rsp), %rax
	vmulsd	(%rdi,%rax), %xmm3, %xmm0
	movq	24(%rsp), %rax
	vmovsd	%xmm0, (%r9,%rax)
.L243:
	addq	$16, %r10
	addq	$8, %r11
	cmpq	%r15, %r10
	jne	.L241
	vmovsd	64(%rsp), %xmm1
	vmovsd	112(%rsp), %xmm0
	movq	88(%rsp), %rdx
	movq	72(%rsp), %rsi
	movl	172(%rsp), %edi
	movl	124(%rsp), %r13d
	movq	128(%rsp), %r12
	movl	168(%rsp), %ebp
	movq	136(%rsp), %r15
	call	multigrid_vcycle
	movl	44(%rsp), %edx
	movq	72(%rsp), %rsi
	movl	%ebx, %ecx
	movq	80(%rsp), %rdi
	call	prol_P
	movl	%ebx, 104(%rsp)
	movl	%r14d, 124(%rsp)
	xorl	%r11d, %r11d
	movq	80(%rsp), %rbx
	movl	120(%rsp), %r8d
	movq	192(%rsp), %r14
	.p2align 4,,10
	.p2align 3
.L253:
	movq	(%r15,%r11), %rdx
	movq	(%rbx,%r11), %r9
	leaq	15(%rdx), %rax
	subq	%r9, %rax
	cmpq	$30, %rax
	jbe	.L367
	cmpl	$4, %r13d
	jbe	.L321
	movq	%r9, %rdi
	movq	%rdx, %rsi
	xorl	%eax, %eax
.L261:
	vmovups	(%rsi), %xmm7
	prefetcht0	320(%rdi)
	vmovups	48(%rsi), %xmm5
	prefetcht0	320(%rsi)
	addq	$64, %rsi
	movl	%eax, %ecx
	addq	$64, %rdi
	addl	$4, %eax
	vsubpd	-64(%rdi), %xmm7, %xmm0
	vmovups	-48(%rsi), %xmm7
	vmovups	%xmm0, -64(%rsi)
	vsubpd	-48(%rdi), %xmm7, %xmm0
	vmovups	-32(%rsi), %xmm7
	vmovups	%xmm0, -48(%rsi)
	vsubpd	-32(%rdi), %xmm7, %xmm0
	vmovups	%xmm0, -32(%rsi)
	vsubpd	-16(%rdi), %xmm5, %xmm0
	vmovups	%xmm0, -16(%rsi)
	movq	%rsi, %r10
	cmpl	16(%rsp), %ecx
	jne	.L261
	movl	100(%rsp), %ecx
.L260:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L254:
	vmovups	(%rsi,%rax), %xmm6
	incl	%ecx
	vsubpd	(%rdi,%rax), %xmm6, %xmm0
	vmovups	%xmm0, (%r10,%rax)
	addq	$16, %rax
	cmpl	%ecx, %r13d
	ja	.L254
	cmpl	%r8d, (%rsp)
	je	.L259
	addq	%r12, %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%r9,%r12), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx)
.L259:
	addq	$8, %r11
	cmpq	%r14, %r11
	jne	.L253
	movl	44(%rsp), %edx
	movq	48(%rsp), %rsi
	movq	%r15, %rdi
	movl	104(%rsp), %ebx
	movl	124(%rsp), %r14d
	call	GS_update
	movq	56(%rsp), %rcx
	movl	(%rsp), %r9d
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	120(%rsp), %r8d
	movq	184(%rsp), %rdi
	movl	16(%rsp), %r10d
	.p2align 4,,10
	.p2align 3
.L265:
	movq	(%rcx), %rsi
	xorl	%eax, %eax
	movq	%rsi, %rdx
	cmpl	$4, %r13d
	jbe	.L266
.L268:
	vmovups	(%rdx), %xmm2
	vmovups	16(%rdx), %xmm1
	movl	%eax, %r11d
	prefetcht0	400(%rdx)
	addl	$4, %eax
	addq	$64, %rdx
	vmulpd	%xmm2, %xmm2, %xmm2
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm0, %xmm2, %xmm0
	vunpckhpd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm0, %xmm2, %xmm0
	vunpckhpd	%xmm1, %xmm1, %xmm2
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovups	-16(%rdx), %xmm1
	vmulpd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm0, %xmm2, %xmm2
	vmovups	-32(%rdx), %xmm0
	vmulpd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
	vunpckhpd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm2, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm2
	vunpckhpd	%xmm1, %xmm1, %xmm0
	vaddsd	%xmm2, %xmm0, %xmm0
	cmpl	%r10d, %r11d
	jne	.L268
	movl	100(%rsp), %eax
	.p2align 4,,10
	.p2align 3
.L266:
	vmovups	(%rdx), %xmm2
	incl	%eax
	addq	$16, %rdx
	vmulpd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm0, %xmm0
	vunpckhpd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm0, %xmm2, %xmm0
	cmpl	%eax, %r13d
	ja	.L266
	cmpl	%r8d, %r9d
	je	.L267
	vmovsd	(%rsi,%r12), %xmm1
	vfmadd231sd	%xmm1, %xmm1, %xmm0
.L267:
	addq	$8, %rcx
	cmpq	%rdi, %rcx
	jne	.L265
	vxorpd	%xmm6, %xmm6, %xmm6
	vsqrtsd	%xmm0, %xmm0, %xmm1
	vucomisd	%xmm0, %xmm6
	ja	.L368
.L271:
	vdivsd	64(%rsp), %xmm1, %xmm1
	vcomisd	.LC16(%rip), %xmm1
	ja	.L272
.L273:
	movq	56(%rsp), %rax
	xorl	%r12d, %r12d
	leaq	96(%rax), %r13
	cmpl	$7, %ebp
	jle	.L240
.L276:
	movq	-96(%r13), %rdi
	prefetcht0	0(%r13)
	addl	$8, %r12d
	addq	$64, %r13
	call	free@PLT
	movq	-152(%r13), %rdi
	call	free@PLT
	movq	-144(%r13), %rdi
	call	free@PLT
	movq	-136(%r13), %rdi
	call	free@PLT
	movq	-128(%r13), %rdi
	call	free@PLT
	movq	-120(%r13), %rdi
	call	free@PLT
	movq	-112(%r13), %rdi
	call	free@PLT
	movq	-104(%r13), %rdi
	call	free@PLT
	cmpl	96(%rsp), %r12d
	jl	.L276
.L240:
	movq	56(%rsp), %r13
	movslq	%r12d, %r12
	.p2align 4,,10
	.p2align 3
.L274:
	movq	0(%r13,%r12,8), %rdi
	incq	%r12
	call	free@PLT
	leal	-1(%r12), %eax
	cmpl	%eax, %ebp
	jg	.L274
	movq	56(%rsp), %rdi
	call	free@PLT
	cmpl	$8, %ebx
	jle	.L323
	movq	88(%rsp), %rax
	leal	-9(%rbx), %r12d
	xorl	%r13d, %r13d
	andl	$-8, %r12d
	addl	$8, %r12d
	leaq	96(%rax), %r14
.L278:
	movq	-96(%r14), %rdi
	prefetcht0	(%r14)
	addl	$8, %r13d
	addq	$64, %r14
	call	free@PLT
	movq	-152(%r14), %rdi
	call	free@PLT
	movq	-144(%r14), %rdi
	call	free@PLT
	movq	-136(%r14), %rdi
	call	free@PLT
	movq	-128(%r14), %rdi
	call	free@PLT
	movq	-120(%r14), %rdi
	call	free@PLT
	movq	-112(%r14), %rdi
	call	free@PLT
	movq	-104(%r14), %rdi
	call	free@PLT
	cmpl	%r12d, %r13d
	jne	.L278
.L277:
	movq	88(%rsp), %r12
	movslq	%r13d, %r13
	.p2align 4,,10
	.p2align 3
.L279:
	movq	(%r12,%r13,8), %rdi
	incq	%r13
	call	free@PLT
	cmpl	%r13d, %ebx
	jg	.L279
	movq	88(%rsp), %rdi
	call	free@PLT
	cmpl	$7, %ebp
	jle	.L324
	movq	80(%rsp), %rax
	xorl	%r12d, %r12d
	leaq	96(%rax), %r13
.L281:
	movq	-96(%r13), %rdi
	prefetcht0	0(%r13)
	addl	$8, %r12d
	addq	$64, %r13
	call	free@PLT
	movq	-152(%r13), %rdi
	call	free@PLT
	movq	-144(%r13), %rdi
	call	free@PLT
	movq	-136(%r13), %rdi
	call	free@PLT
	movq	-128(%r13), %rdi
	call	free@PLT
	movq	-120(%r13), %rdi
	call	free@PLT
	movq	-112(%r13), %rdi
	call	free@PLT
	movq	-104(%r13), %rdi
	call	free@PLT
	cmpl	96(%rsp), %r12d
	jl	.L281
.L280:
	movq	80(%rsp), %r13
	movslq	%r12d, %r12
	.p2align 4,,10
	.p2align 3
.L282:
	movq	0(%r13,%r12,8), %rdi
	incq	%r12
	call	free@PLT
	leal	-1(%r12), %eax
	cmpl	%eax, %ebp
	jg	.L282
	movq	80(%rsp), %rdi
	call	free@PLT
	cmpl	$8, %ebx
	jle	.L325
	movq	72(%rsp), %rax
	leal	-9(%rbx), %r13d
	xorl	%ebp, %ebp
	andl	$-8, %r13d
	leaq	96(%rax), %r12
.L284:
	movq	-96(%r12), %rdi
	prefetcht0	(%r12)
	addq	$64, %r12
	call	free@PLT
	movq	-152(%r12), %rdi
	call	free@PLT
	movq	-144(%r12), %rdi
	call	free@PLT
	movq	-136(%r12), %rdi
	call	free@PLT
	movq	-128(%r12), %rdi
	call	free@PLT
	movq	-120(%r12), %rdi
	call	free@PLT
	movq	-112(%r12), %rdi
	call	free@PLT
	movq	-104(%r12), %rdi
	call	free@PLT
	movl	%ebp, %eax
	addl	$8, %ebp
	cmpl	%eax, %r13d
	jne	.L284
.L283:
	movq	72(%rsp), %r12
	movslq	%ebp, %rbp
	.p2align 4,,10
	.p2align 3
.L285:
	movq	(%r12,%rbp,8), %rdi
	incq	%rbp
	call	free@PLT
	cmpl	%ebp, %ebx
	jg	.L285
	movq	72(%rsp), %rdi
	addq	$232, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	free@PLT
.L286:
	.cfi_restore_state
	movl	$2, 44(%rsp)
	movl	$1, %ebp
.L217:
	cmpl	$1, %r12d
	jne	.L313
	vmovsd	112(%rsp), %xmm4
	movq	48(%rsp), %rbx
	movq	104(%rsp), %rax
	vmulsd	%xmm4, %xmm4, %xmm0
	movq	8(%rbx), %rdx
	movq	8(%rax), %rax
	vmulsd	8(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rax)
	addq	$232, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L309:
	.cfi_restore_state
	movl	%ecx, %ebx
	jmp	.L223
.L296:
	movl	%esi, %ebp
	jmp	.L220
.L299:
	movl	%edx, %ebp
	jmp	.L220
.L312:
	movl	%edx, %ebx
	jmp	.L223
	.p2align 4,,7
	.p2align 3
.L367:
	cmpl	$7, %ebp
	jle	.L320
	leaq	160(%rdx), %rcx
	leaq	160(%r9), %rsi
	xorl	%eax, %eax
.L257:
	vmovsd	-160(%rcx), %xmm0
	prefetcht0	(%rsi)
	prefetcht0	(%rcx)
	addl	$8, %eax
	addq	$64, %rcx
	addq	$64, %rsi
	vsubsd	-224(%rsi), %xmm0, %xmm0
	vmovsd	%xmm0, -224(%rcx)
	vmovsd	-216(%rcx), %xmm0
	vsubsd	-216(%rsi), %xmm0, %xmm0
	vmovsd	%xmm0, -216(%rcx)
	vmovsd	-208(%rcx), %xmm0
	vsubsd	-208(%rsi), %xmm0, %xmm0
	vmovsd	%xmm0, -208(%rcx)
	vmovsd	-200(%rcx), %xmm0
	vsubsd	-200(%rsi), %xmm0, %xmm0
	vmovsd	%xmm0, -200(%rcx)
	vmovsd	-192(%rcx), %xmm0
	vsubsd	-192(%rsi), %xmm0, %xmm0
	vmovsd	%xmm0, -192(%rcx)
	vmovsd	-184(%rcx), %xmm0
	vsubsd	-184(%rsi), %xmm0, %xmm0
	vmovsd	%xmm0, -184(%rcx)
	vmovsd	-176(%rcx), %xmm0
	vsubsd	-176(%rsi), %xmm0, %xmm0
	vmovsd	%xmm0, -176(%rcx)
	vmovsd	-168(%rcx), %xmm0
	vsubsd	-168(%rsi), %xmm0, %xmm0
	vmovsd	%xmm0, -168(%rcx)
	cmpl	96(%rsp), %eax
	jl	.L257
.L256:
	cltq
	.p2align 4,,10
	.p2align 3
.L258:
	vmovsd	(%rdx,%rax,8), %xmm0
	vsubsd	(%r9,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax,8)
	incq	%rax
	leal	-1(%rax), %ecx
	cmpl	%ecx, %ebp
	jg	.L258
	jmp	.L259
	.p2align 4,,7
	.p2align 3
.L252:
	cmpl	$8, %ebx
	jle	.L318
	leaq	304(%rdi), %rdx
	leaq	152(%r9), %rcx
	xorl	%eax, %eax
.L245:
	vmulsd	-304(%rdx), %xmm3, %xmm0
	prefetcht0	(%rdx)
	prefetcht0	64(%rdx)
	prefetchw	(%rcx)
	addl	$8, %eax
	subq	$-128, %rdx
	addq	$64, %rcx
	vmovsd	%xmm0, -216(%rcx)
	vmulsd	-416(%rdx), %xmm3, %xmm0
	vmovsd	%xmm0, -208(%rcx)
	vmulsd	-400(%rdx), %xmm3, %xmm0
	vmovsd	%xmm0, -200(%rcx)
	vmulsd	-384(%rdx), %xmm3, %xmm0
	vmovsd	%xmm0, -192(%rcx)
	vmulsd	-368(%rdx), %xmm3, %xmm0
	vmovsd	%xmm0, -184(%rcx)
	vmulsd	-352(%rdx), %xmm3, %xmm0
	vmovsd	%xmm0, -176(%rcx)
	vmulsd	-336(%rdx), %xmm3, %xmm0
	vmovsd	%xmm0, -168(%rcx)
	vmulsd	-320(%rdx), %xmm3, %xmm0
	vmovsd	%xmm0, -160(%rcx)
	cmpl	104(%rsp), %eax
	jne	.L245
.L244:
	cltq
	.p2align 4,,10
	.p2align 3
.L246:
	movq	%rax, %rdx
	salq	$4, %rdx
	vmulsd	(%rdi,%rdx), %xmm3, %xmm0
	vmovsd	%xmm0, (%r9,%rax,8)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L246
	jmp	.L243
.L319:
	vmovaps	.LC10(%rip), %xmm1
	xorl	%ecx, %ecx
	jmp	.L247
.L321:
	movq	%rdx, %r10
	movq	%r9, %rdi
	movq	%rdx, %rsi
	xorl	%ecx, %ecx
	jmp	.L260
.L318:
	xorl	%eax, %eax
	jmp	.L244
.L320:
	xorl	%eax, %eax
	jmp	.L256
.L287:
	movl	$1, %eax
	movl	$1, %ebp
	jmp	.L218
.L300:
	movl	$1, %eax
	movl	$1, %ebx
	jmp	.L221
.L314:
	xorl	%r15d, %r15d
	jmp	.L226
.L325:
	xorl	%ebp, %ebp
	jmp	.L283
.L324:
	xorl	%r12d, %r12d
	jmp	.L280
.L323:
	xorl	%r13d, %r13d
	jmp	.L277
.L317:
	xorl	%r15d, %r15d
	jmp	.L235
.L316:
	xorl	%edx, %edx
	jmp	.L232
.L315:
	xorl	%edx, %edx
	jmp	.L229
.L368:
	vmovsd	%xmm1, 104(%rsp)
	call	sqrt@PLT
	vmovsd	104(%rsp), %xmm1
	jmp	.L271
.L313:
	movl	$2, %ebx
	jmp	.L224
	.cfi_endproc
.LFE40:
	.size	multigrid_vcycle, .-multigrid_vcycle
	.p2align 4,,10
	.p2align 3
	.globl	u_update
	.type	u_update, @function
u_update:
.LFB54:
	.cfi_startproc
	endbr64
	testl	%edx, %edx
	jle	.L394
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edx, %r15d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r13
	movl	%edx, %esi
	shrl	%esi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	andl	$-2, %r15d
	movq	%rdi, %r12
	leal	-5(%rsi), %eax
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%r15d, %r11d
	movl	%edx, %ebp
	andl	$-4, %eax
	leal	-1(%rdx), %r14d
	salq	$3, %r11
	xorl	%ebx, %ebx
	movl	%eax, -20(%rsp)
	addl	$4, %eax
	movl	%eax, -12(%rsp)
	leal	-9(%rdx), %eax
	andl	$-8, %eax
	addl	$8, %eax
	movl	%eax, -16(%rsp)
	.p2align 4,,10
	.p2align 3
.L371:
	movq	(%r12,%rbx,8), %rdx
	movq	0(%r13,%rbx,8), %r9
	leaq	15(%rdx), %rax
	subq	%r9, %rax
	cmpq	$30, %rax
	jbe	.L382
	cmpl	$1, %ebp
	je	.L382
	cmpl	$4, %esi
	jbe	.L384
	movq	%r9, %r8
	movq	%rdx, %rdi
	xorl	%eax, %eax
.L379:
	vmovups	(%rdi), %xmm2
	prefetcht0	320(%r8)
	vmovups	16(%rdi), %xmm3
	prefetcht0	320(%rdi)
	vmovups	32(%rdi), %xmm4
	vmovups	48(%rdi), %xmm5
	addq	$64, %rdi
	movl	%eax, %ecx
	addq	$64, %r8
	addl	$4, %eax
	vsubpd	-64(%r8), %xmm2, %xmm0
	vmovups	%xmm0, -64(%rdi)
	vsubpd	-48(%r8), %xmm3, %xmm0
	vmovups	%xmm0, -48(%rdi)
	vsubpd	-32(%r8), %xmm4, %xmm0
	vmovups	%xmm0, -32(%rdi)
	vsubpd	-16(%r8), %xmm5, %xmm0
	vmovups	%xmm0, -16(%rdi)
	movq	%rdi, %r10
	cmpl	-20(%rsp), %ecx
	jne	.L379
	movl	-12(%rsp), %ecx
.L378:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L372:
	vmovups	(%rdi,%rax), %xmm1
	incl	%ecx
	vsubpd	(%r8,%rax), %xmm1, %xmm0
	vmovups	%xmm0, (%r10,%rax)
	addq	$16, %rax
	cmpl	%ecx, %esi
	ja	.L372
	cmpl	%ebp, %r15d
	je	.L377
	addq	%r11, %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%r9,%r11), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx)
.L377:
	leaq	1(%rbx), %rax
	cmpq	%r14, %rbx
	je	.L392
.L397:
	movq	%rax, %rbx
	jmp	.L371
	.p2align 4,,7
	.p2align 3
.L382:
	cmpl	$8, %ebp
	jle	.L383
	leaq	160(%rdx), %rcx
	leaq	160(%r9), %rdi
	xorl	%eax, %eax
.L375:
	vmovsd	-160(%rcx), %xmm0
	prefetcht0	(%rdi)
	prefetcht0	(%rcx)
	addl	$8, %eax
	addq	$64, %rcx
	addq	$64, %rdi
	vsubsd	-224(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, -224(%rcx)
	vmovsd	-216(%rcx), %xmm0
	vsubsd	-216(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, -216(%rcx)
	vmovsd	-208(%rcx), %xmm0
	vsubsd	-208(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, -208(%rcx)
	vmovsd	-200(%rcx), %xmm0
	vsubsd	-200(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, -200(%rcx)
	vmovsd	-192(%rcx), %xmm0
	vsubsd	-192(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, -192(%rcx)
	vmovsd	-184(%rcx), %xmm0
	vsubsd	-184(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, -184(%rcx)
	vmovsd	-176(%rcx), %xmm0
	vsubsd	-176(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, -176(%rcx)
	vmovsd	-168(%rcx), %xmm0
	vsubsd	-168(%rdi), %xmm0, %xmm0
	vmovsd	%xmm0, -168(%rcx)
	cmpl	-16(%rsp), %eax
	jne	.L375
.L374:
	cltq
	.p2align 4,,10
	.p2align 3
.L376:
	vmovsd	(%rdx,%rax,8), %xmm0
	vsubsd	(%r9,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax,8)
	incq	%rax
	cmpl	%eax, %ebp
	jg	.L376
	leaq	1(%rbx), %rax
	cmpq	%r14, %rbx
	jne	.L397
.L392:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L384:
	.cfi_restore_state
	movq	%rdx, %r10
	movq	%r9, %r8
	movq	%rdx, %rdi
	xorl	%ecx, %ecx
	jmp	.L378
.L383:
	xorl	%eax, %eax
	jmp	.L374
.L394:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
	.cfi_endproc
.LFE54:
	.size	u_update, .-u_update
	.p2align 4,,10
	.p2align 3
	.globl	set_zeros
	.type	set_zeros, @function
set_zeros:
.LFB55:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L408
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebp
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	cmpl	$8, %esi
	jle	.L411
	leal	-9(%rsi), %r15d
	leaq	80(%rdi), %r13
	xorl	%ebx, %ebx
	andl	$-8, %r15d
	leal	8(%r15), %eax
	movl	%eax, 12(%rsp)
	leal	-1(%rsi), %eax
	movq	%rax, %r15
	leaq	8(,%rax,8), %r14
.L402:
	movq	-80(%r13), %rdi
	movq	%r14, %rdx
	xorl	%esi, %esi
	prefetcht0	0(%r13)
	addl	$8, %ebx
	addq	$64, %r13
	call	memset@PLT
	movq	-136(%r13), %rdi
	movq	%r14, %rdx
	xorl	%esi, %esi
	call	memset@PLT
	movq	-128(%r13), %rdi
	movq	%r14, %rdx
	xorl	%esi, %esi
	call	memset@PLT
	movq	-120(%r13), %rdi
	movq	%r14, %rdx
	xorl	%esi, %esi
	call	memset@PLT
	movq	-112(%r13), %rdi
	movq	%r14, %rdx
	xorl	%esi, %esi
	call	memset@PLT
	movq	-104(%r13), %rdi
	movq	%r14, %rdx
	xorl	%esi, %esi
	call	memset@PLT
	movq	-96(%r13), %rdi
	movq	%r14, %rdx
	xorl	%esi, %esi
	call	memset@PLT
	movq	-88(%r13), %rdi
	movq	%r14, %rdx
	xorl	%esi, %esi
	call	memset@PLT
	cmpl	12(%rsp), %ebx
	jne	.L402
.L403:
	movl	%r15d, %ecx
	movslq	%ebx, %rbx
	leaq	8(,%rcx,8), %r13
	.p2align 4,,10
	.p2align 3
.L401:
	movq	(%r12,%rbx,8), %rdi
	movq	%r13, %rdx
	xorl	%esi, %esi
	incq	%rbx
	call	memset@PLT
	cmpl	%ebx, %ebp
	jg	.L401
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L408:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
.L411:
	.cfi_def_cfa_offset 80
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	xorl	%ebx, %ebx
	leal	-1(%rsi), %r15d
	jmp	.L403
	.cfi_endproc
.LFE55:
	.size	set_zeros, .-set_zeros
	.p2align 4,,10
	.p2align 3
	.globl	verify
	.type	verify, @function
verify:
.LFB56:
	.cfi_startproc
	endbr64
	testl	%edx, %edx
	jle	.L416
	vmovq	.LC9(%rip), %xmm2
	vmovsd	.LC16(%rip), %xmm1
	leal	-1(%rdx), %r9d
	xorl	%r10d, %r10d
.L414:
	movq	(%rdi,%r10,8), %r8
	movq	(%rsi,%r10,8), %rcx
	xorl	%eax, %eax
	jmp	.L415
	.p2align 4,,7
	.p2align 3
.L422:
	leaq	1(%rax), %rdx
	cmpq	%rax, %r9
	je	.L421
	movq	%rdx, %rax
.L415:
	vmovsd	(%r8,%rax,8), %xmm0
	vsubsd	(%rcx,%rax,8), %xmm0, %xmm0
	vandps	%xmm2, %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	jbe	.L422
	xorl	%eax, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L421:
	leaq	1(%r10), %rax
	cmpq	%r10, %r9
	je	.L419
	movq	%rax, %r10
	jmp	.L414
.L416:
	movl	$1, %eax
	ret
.L419:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE56:
	.size	verify, .-verify
	.section	.rodata.str1.1
.LC18:
	.string	"\nResult OK!"
.LC19:
	.string	"\nResult not OK!"
.LC21:
	.string	"time = %lf s\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,10
	.p2align 3
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	$513, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movl	$1680762733, 49(%rsp)
	movw	$29793, 53(%rsp)
	movb	$0, 55(%rsp)
	call	alloc_matrix
	movl	$513, %edi
	movq	%rax, %r13
	call	alloc_matrix
	movl	$513, %edi
	movq	%rax, %r12
	call	alloc_matrix
	movl	$513, %edx
	movq	%r13, %rdi
	leaq	49(%rsp), %rsi
	movq	%rax, %rbp
	call	read_data
	vmovsd	.LC17(%rip), %xmm2
	movl	$513, %esi
	movq	%rbp, %rdi
	vmovaps	%xmm2, %xmm0
	call	fill_f
	movl	$513, %esi
	movq	%rbp, %rdi
	call	L2_norm
	xorl	%esi, %esi
	leaq	16(%rsp), %rdi
	vmovsd	%xmm0, 8(%rsp)
	call	gettimeofday@PLT
	vmovsd	.LC17(%rip), %xmm2
	vmovsd	8(%rsp), %xmm1
	movq	%rbp, %rdx
	movq	%r12, %rsi
	movl	$9, %edi
	vmovaps	%xmm2, %xmm0
	call	multigrid_vcycle
	xorl	%esi, %esi
	leaq	32(%rsp), %rdi
	call	gettimeofday@PLT
	movl	$513, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	verify
	testl	%eax, %eax
	je	.L424
	leaq	.LC18(%rip), %rdi
	call	puts@PLT
.L425:
	vxorps	%xmm2, %xmm2, %xmm2
	vmovsd	.LC20(%rip), %xmm3
	leaq	.LC21(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	vcvtsi2sdq	40(%rsp), %xmm2, %xmm0
	vdivsd	%xmm3, %xmm0, %xmm1
	vcvtsi2sdq	32(%rsp), %xmm2, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm0
	vcvtsi2sdq	24(%rsp), %xmm2, %xmm1
	vcvtsi2sdq	16(%rsp), %xmm2, %xmm2
	vdivsd	%xmm3, %xmm1, %xmm1
	vaddsd	%xmm2, %xmm1, %xmm2
	vsubsd	%xmm2, %xmm0, %xmm0
	call	__printf_chk@PLT
	movl	$513, %esi
	movq	%r13, %rdi
	call	dealloc_matrix
	movl	$513, %esi
	movq	%r12, %rdi
	call	dealloc_matrix
	movl	$513, %esi
	movq	%rbp, %rdi
	call	dealloc_matrix
	movq	56(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L428
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L424:
	.cfi_restore_state
	leaq	.LC19(%rip), %rdi
	call	puts@PLT
	jmp	.L425
.L428:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.rodata.str1.1
.LC22:
	.string	"%lf "
	.text
	.p2align 4,,10
	.p2align 3
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB57:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L436
	leal	-1(%rsi), %eax
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leaq	8(%rdi,%rax,8), %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	leaq	8(,%rax,8), %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	leaq	.LC22(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.p2align 4,,10
	.p2align 3
.L431:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L432:
	movq	0(%rbp), %rax
	movq	%r12, %rsi
	movl	$1, %edi
	vmovsd	(%rax,%rbx), %xmm0
	movl	$1, %eax
	addq	$8, %rbx
	call	__printf_chk@PLT
	cmpq	%rbx, %r13
	jne	.L432
	movl	$10, %edi
	addq	$8, %rbp
	call	putchar@PLT
	cmpq	%r14, %rbp
	jne	.L431
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L436:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	ret
	.cfi_endproc
.LFE57:
	.size	print_matrix, .-print_matrix
	.globl	epsilon
	.section	.rodata
	.align 8
	.type	epsilon, @object
	.size	epsilon, 8
epsilon:
	.long	2296604913
	.long	1055193269
	.globl	pi
	.align 8
	.type	pi, @object
	.size	pi, 8
pi:
	.long	1413754136
	.long	1074340347
	.globl	l
	.align 4
	.type	l, @object
	.size	l, 4
l:
	.long	9
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.long	1
	.long	1
	.long	1
	.long	1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	1413754136
	.long	1074340347
	.align 8
.LC5:
	.long	3700601565
	.long	1075168253
	.align 8
.LC6:
	.long	450716388
	.long	1074906499
	.section	.rodata.cst16
	.align 16
.LC8:
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.align 16
.LC9:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.align 16
.LC10:
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.section	.rodata.cst8
	.align 8
.LC11:
	.long	0
	.long	1074790400
	.align 8
.LC12:
	.long	0
	.long	1070596096
	.section	.rodata.cst16
	.align 16
.LC13:
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.align 16
.LC14:
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.section	.rodata.cst8
	.align 8
.LC15:
	.long	0
	.long	1071644672
	.align 8
.LC16:
	.long	2296604913
	.long	1055193269
	.align 8
.LC17:
	.long	0
	.long	1063256064
	.align 8
.LC20:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
