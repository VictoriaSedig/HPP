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
.LC5:
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
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%esi, %ebx
	subq	$288, %rsp
	movq	%rdi, -264(%rbp)
	vmovsd	%xmm0, -216(%rbp)
	leaq	.LC5(%rip), %rdi
	movl	%esi, -228(%rbp)
	call	puts@PLT
	testl	%ebx, %ebx
	jle	.L69
	vmovsd	-216(%rbp), %xmm5
	leal	-1(%rbx), %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	%rax, %rdx
	movl	%eax, -300(%rbp)
	addq	$2, %rax
	movl	$1, %r12d
	movq	%rax, -272(%rbp)
	leal	-2(%rbx), %eax
	movl	%edx, %ebx
	andl	$-4, %edx
	movl	%eax, -232(%rbp)
	movl	%edx, -292(%rbp)
	shrl	$2, %ebx
	vmovaps	%xmm0, %xmm1
	vmulsd	%xmm5, %xmm5, %xmm6
	leal	-1(%rbx), %eax
	vmovddup	%xmm5, %xmm5
	movl	%eax, -296(%rbp)
	leal	-3(%rbx), %eax
	andl	$-2, %eax
	vmovaps	%xmm5, -144(%rbp)
	movl	%eax, -304(%rbp)
	addl	$2, %eax
	movl	%eax, -328(%rbp)
	leal	1(%rdx), %eax
	movl	%eax, -324(%rbp)
	vmovddup	%xmm6, %xmm5
	vmovsd	%xmm6, -240(%rbp)
	vmovaps	%xmm5, -288(%rbp)
	.p2align 4,,10
	.p2align 3
.L56:
	movq	-264(%rbp), %rax
	vmulsd	%xmm0, %xmm1, %xmm7
	cmpl	$1, -228(%rbp)
	movq	-8(%rax,%r12,8), %r13
	vmovsd	%xmm7, -224(%rbp)
	movq	$0x000000000, 0(%r13)
	je	.L63
	cmpl	$2, -232(%rbp)
	jbe	.L64
	xorl	%r15d, %r15d
	cmpl	$1, -296(%rbp)
	vmovaps	.LC3(%rip), %xmm4
	vmovddup	%xmm1, %xmm1
	vmovddup	%xmm0, %xmm0
	leaq	8(%r13), %r14
	jbe	.L65
	vmovaps	.LC6(%rip), %xmm6
	vmulpd	%xmm0, %xmm1, %xmm1
	vmovaps	.LC8(%rip), %xmm7
	vmovaps	%xmm6, -160(%rbp)
	vmovaps	.LC7(%rip), %xmm6
	vmovaps	%xmm7, -192(%rbp)
	vmovaps	%xmm6, -176(%rbp)
	vmulpd	-288(%rbp), %xmm1, %xmm6
	vmovaps	%xmm1, -320(%rbp)
.L59:
	vpshufd	$238, %xmm4, %xmm5
	vcvtdq2pd	%xmm4, %xmm3
	vpaddd	.LC6(%rip), %xmm4, %xmm1
	prefetchw	144(%r14)
	vmovaps	%xmm6, -208(%rbp)
	vmovaps	-144(%rbp), %xmm6
	addq	$64, %r14
	vcvtdq2pd	%xmm5, %xmm5
	vmovaps	%xmm4, -128(%rbp)
	vmulpd	%xmm6, %xmm3, %xmm3
	vmulpd	%xmm6, %xmm5, %xmm5
	vmovaps	%xmm1, -256(%rbp)
	vmulpd	.LC7(%rip), %xmm3, %xmm0
	vmovaps	%xmm3, -112(%rbp)
	vmulpd	.LC7(%rip), %xmm5, %xmm2
	vmovaps	%xmm5, -96(%rbp)
	vinsertf128	$0x1, %xmm2, %ymm0, %ymm0
	call	_ZGVdN4v_sin@PLT
	vmovaps	-96(%rbp), %xmm5
	vmovaps	-112(%rbp), %xmm3
	vmovapd	%ymm0, -80(%rbp)
	vmulpd	.LC8(%rip), %xmm3, %xmm3
	vmulpd	.LC8(%rip), %xmm5, %xmm0
	vinsertf128	$0x1, %xmm0, %ymm3, %ymm0
	call	_ZGVdN4v_sin@PLT
	vmovapd	-80(%rbp), %ymm2
	vmovaps	-208(%rbp), %xmm6
	vmovaps	-256(%rbp), %xmm1
	vmovaps	-144(%rbp), %xmm5
	vmovaps	-128(%rbp), %xmm4
	vmulpd	%xmm6, %xmm2, %xmm3
	vextractf128	$0x1, %ymm2, %xmm2
	vpaddd	.LC9(%rip), %xmm4, %xmm4
	vmulpd	%xmm6, %xmm2, %xmm2
	vmulpd	%xmm0, %xmm3, %xmm3
	vextractf128	$0x1, %ymm0, %xmm0
	vmovaps	%xmm4, -128(%rbp)
	vmulpd	%xmm0, %xmm2, %xmm2
	vmovups	%xmm3, -64(%r14)
	vcvtdq2pd	%xmm1, %xmm3
	vpshufd	$238, %xmm1, %xmm1
	vcvtdq2pd	%xmm1, %xmm1
	vmovups	%xmm2, -48(%r14)
	vmulpd	%xmm5, %xmm3, %xmm3
	vmulpd	%xmm5, %xmm1, %xmm1
	vmulpd	.LC7(%rip), %xmm3, %xmm0
	vmovaps	%xmm3, -112(%rbp)
	vmulpd	.LC7(%rip), %xmm1, %xmm2
	vmovaps	%xmm1, -96(%rbp)
	vinsertf128	$0x1, %xmm2, %ymm0, %ymm0
	call	_ZGVdN4v_sin@PLT
	vmovaps	-112(%rbp), %xmm3
	vmovaps	-96(%rbp), %xmm1
	vmovapd	%ymm0, -80(%rbp)
	vmulpd	.LC8(%rip), %xmm1, %xmm1
	vmulpd	.LC8(%rip), %xmm3, %xmm0
	vinsertf128	$0x1, %xmm1, %ymm0, %ymm0
	call	_ZGVdN4v_sin@PLT
	vmovapd	-80(%rbp), %ymm2
	vmovaps	-208(%rbp), %xmm6
	movl	%r15d, %eax
	addl	$2, %r15d
	vmovaps	-128(%rbp), %xmm4
	vmulpd	%xmm6, %xmm2, %xmm1
	vextractf128	$0x1, %ymm2, %xmm2
	vmulpd	%xmm6, %xmm2, %xmm2
	vmulpd	%xmm0, %xmm1, %xmm1
	vextractf128	$0x1, %ymm0, %xmm0
	vmulpd	%xmm0, %xmm2, %xmm2
	vmovups	%xmm1, -32(%r14)
	vmovups	%xmm2, -16(%r14)
	cmpl	-304(%rbp), %eax
	jne	.L59
	vmovaps	-320(%rbp), %xmm1
	movl	-328(%rbp), %r15d
.L58:
	vmulpd	-288(%rbp), %xmm1, %xmm5
	vmovaps	%xmm5, -208(%rbp)
	.p2align 4,,10
	.p2align 3
.L60:
	vmovaps	%xmm4, %xmm1
	vmovaps	-144(%rbp), %xmm7
	vmovaps	-176(%rbp), %xmm5
	incl	%r15d
	vpaddd	-160(%rbp), %xmm4, %xmm4
	addq	$32, %r14
	vcvtdq2pd	%xmm1, %xmm3
	vpshufd	$238, %xmm1, %xmm1
	vcvtdq2pd	%xmm1, %xmm1
	vmulpd	%xmm7, %xmm3, %xmm3
	vmovaps	%xmm4, -128(%rbp)
	vmulpd	%xmm7, %xmm1, %xmm1
	vmulpd	%xmm5, %xmm3, %xmm0
	vmovaps	%xmm3, -112(%rbp)
	vmulpd	%xmm5, %xmm1, %xmm2
	vmovaps	%xmm1, -96(%rbp)
	vinsertf128	$0x1, %xmm2, %ymm0, %ymm0
	call	_ZGVdN4v_sin@PLT
	vmovaps	-192(%rbp), %xmm6
	vmovaps	-112(%rbp), %xmm3
	vmovaps	-96(%rbp), %xmm1
	vmovapd	%ymm0, -80(%rbp)
	vmulpd	%xmm6, %xmm3, %xmm0
	vmulpd	%xmm6, %xmm1, %xmm1
	vinsertf128	$0x1, %xmm1, %ymm0, %ymm0
	call	_ZGVdN4v_sin@PLT
	vmovapd	-80(%rbp), %ymm2
	vmovaps	-208(%rbp), %xmm4
	vmulpd	%xmm4, %xmm2, %xmm1
	vextractf128	$0x1, %ymm2, %xmm2
	vmulpd	%xmm4, %xmm2, %xmm2
	vmovaps	-128(%rbp), %xmm4
	vmulpd	%xmm0, %xmm1, %xmm1
	vextractf128	$0x1, %ymm0, %xmm0
	vmulpd	%xmm0, %xmm2, %xmm2
	vmovups	%xmm1, -32(%r14)
	vmovups	%xmm2, -16(%r14)
	cmpl	%r15d, %ebx
	ja	.L60
	movl	-300(%rbp), %ecx
	cmpl	%ecx, -292(%rbp)
	je	.L68
	movl	-324(%rbp), %r14d
	vzeroupper
.L57:
	vxorps	%xmm7, %xmm7, %xmm7
	vcvtsi2sdl	%r14d, %xmm7, %xmm1
	vmulsd	-216(%rbp), %xmm1, %xmm1
	vmulsd	.LC10(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, -96(%rbp)
	call	sin@PLT
	vmovsd	-96(%rbp), %xmm1
	vmovsd	%xmm0, -80(%rbp)
	vmulsd	.LC11(%rip), %xmm1, %xmm0
	call	sin@PLT
	movslq	%r14d, %rcx
	leal	1(%r14), %edx
	leaq	0(,%rcx,8), %r15
	vmulsd	-80(%rbp), %xmm0, %xmm0
	vmulsd	-224(%rbp), %xmm0, %xmm0
	vmulsd	-240(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%r15)
	cmpl	%edx, -228(%rbp)
	jle	.L63
	vxorps	%xmm7, %xmm7, %xmm7
	vcvtsi2sdl	%edx, %xmm7, %xmm1
	vmulsd	-216(%rbp), %xmm1, %xmm1
	vmulsd	.LC10(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, -96(%rbp)
	call	sin@PLT
	vmovsd	-96(%rbp), %xmm1
	vmovsd	%xmm0, -80(%rbp)
	vmulsd	.LC11(%rip), %xmm1, %xmm0
	call	sin@PLT
	leal	2(%r14), %eax
	vmulsd	-80(%rbp), %xmm0, %xmm0
	vmulsd	-224(%rbp), %xmm0, %xmm0
	vmulsd	-240(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%r13,%r15)
	cmpl	%eax, -228(%rbp)
	jle	.L63
	vxorps	%xmm7, %xmm7, %xmm7
	vcvtsi2sdl	%eax, %xmm7, %xmm1
	vmulsd	-216(%rbp), %xmm1, %xmm1
	vmulsd	.LC10(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, -96(%rbp)
	call	sin@PLT
	vmovsd	-96(%rbp), %xmm1
	vmovsd	%xmm0, -80(%rbp)
	vmulsd	.LC11(%rip), %xmm1, %xmm0
	call	sin@PLT
	vmulsd	-80(%rbp), %xmm0, %xmm0
	vmulsd	-224(%rbp), %xmm0, %xmm0
	vmulsd	-240(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, 16(%r13,%r15)
.L63:
	movl	%r12d, %eax
	incq	%r12
	cmpq	-272(%rbp), %r12
	je	.L69
.L71:
	vxorps	%xmm7, %xmm7, %xmm7
	vcvtsi2sdl	%eax, %xmm7, %xmm2
	vmulsd	-216(%rbp), %xmm2, %xmm2
	vmulsd	.LC10(%rip), %xmm2, %xmm0
	vmovsd	%xmm2, -96(%rbp)
	call	sin@PLT
	vmovsd	-96(%rbp), %xmm2
	vmovsd	%xmm0, -80(%rbp)
	vmulsd	.LC12(%rip), %xmm2, %xmm0
	call	sin@PLT
	vmovsd	-80(%rbp), %xmm1
	jmp	.L56
	.p2align 4,,7
	.p2align 3
.L68:
	vzeroupper
	movl	%r12d, %eax
	incq	%r12
	cmpq	-272(%rbp), %r12
	jne	.L71
.L69:
	addq	$288, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L64:
	.cfi_restore_state
	movl	$1, %r14d
	jmp	.L57
.L65:
	vmovaps	.LC6(%rip), %xmm7
	vmovaps	.LC8(%rip), %xmm5
	vmulpd	%xmm0, %xmm1, %xmm1
	vmovaps	%xmm7, -160(%rbp)
	vmovaps	.LC7(%rip), %xmm7
	vmovaps	%xmm5, -192(%rbp)
	vmovaps	%xmm7, -176(%rbp)
	jmp	.L58
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
	jle	.L80
	vmovaps	.LC13(%rip), %xmm6
	movl	%esi, %ecx
	vmovq	.LC14(%rip), %xmm5
	leal	-1(%rsi), %eax
	shrl	%ecx
	movl	%esi, %r9d
	vxorpd	%xmm3, %xmm3, %xmm3
	movq	%rax, %r11
	leal	-5(%rcx), %r10d
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	andl	$-2, %r9d
	andl	$-4, %r10d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	vmovaps	%xmm6, %xmm4
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leal	4(%r10), %ebp
	leaq	8(%rdi,%rax,8), %rbx
	.p2align 4,,10
	.p2align 3
.L74:
	movq	(%rdi), %r8
	cmpl	$1, %r11d
	jbe	.L81
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm6, %xmm2
	movq	%r8, %rax
	xorl	%edx, %edx
	cmpl	$4, %ecx
	jbe	.L75
	vmovaps	%xmm4, %xmm2
.L77:
	vandps	16(%rax), %xmm4, %xmm7
	movl	%edx, %r12d
	prefetcht0	464(%rax)
	addl	$4, %edx
	vandps	(%rax), %xmm4, %xmm1
	addq	$64, %rax
	vaddpd	%xmm7, %xmm1, %xmm1
	vandps	-32(%rax), %xmm4, %xmm7
	vaddpd	%xmm7, %xmm1, %xmm1
	vandps	-16(%rax), %xmm4, %xmm7
	vaddpd	%xmm7, %xmm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	cmpl	%r10d, %r12d
	jne	.L77
	movl	%ebp, %edx
	.p2align 4,,10
	.p2align 3
.L75:
	vandps	(%rax), %xmm2, %xmm1
	incl	%edx
	addq	$16, %rax
	vaddpd	%xmm1, %xmm0, %xmm0
	cmpl	%edx, %ecx
	ja	.L75
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vaddsd	%xmm0, %xmm3, %xmm3
	cmpl	%esi, %r9d
	je	.L76
	movl	%r9d, %eax
.L79:
	movslq	%eax, %rdx
	incl	%eax
	salq	$3, %rdx
	vmovsd	(%r8,%rdx), %xmm0
	vandps	%xmm5, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm3, %xmm3
	cmpl	%eax, %esi
	jle	.L76
	vmovsd	8(%r8,%rdx), %xmm0
	vandps	%xmm5, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm3, %xmm3
.L76:
	addq	$8, %rdi
	cmpq	%rbx, %rdi
	jne	.L74
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	vmovaps	%xmm3, %xmm0
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,7
	.p2align 3
.L81:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L79
.L80:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	vxorpd	%xmm3, %xmm3, %xmm3
	vmovaps	%xmm3, %xmm0
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
	jle	.L107
	movl	%esi, %ecx
	leal	-1(%rsi), %eax
	movl	%esi, %r9d
	vxorpd	%xmm2, %xmm2, %xmm2
	shrl	%ecx
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rax, %r11
	andl	$-2, %r9d
	leal	-5(%rcx), %r10d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	andl	$-4, %r10d
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leal	4(%r10), %ebp
	leaq	8(%rdi,%rax,8), %rbx
	.p2align 4,,10
	.p2align 3
.L96:
	movq	(%rdi), %r8
	cmpl	$1, %r11d
	jbe	.L98
	vxorps	%xmm0, %xmm0, %xmm0
	movq	%r8, %rax
	xorl	%edx, %edx
	cmpl	$4, %ecx
	jbe	.L92
.L94:
	vmovups	16(%rax), %xmm1
	vmovups	(%rax), %xmm4
	movl	%edx, %r12d
	prefetcht0	464(%rax)
	vmovups	32(%rax), %xmm5
	vmovups	48(%rax), %xmm6
	addl	$4, %edx
	addq	$64, %rax
	vmulpd	%xmm1, %xmm1, %xmm1
	vfmadd231pd	%xmm4, %xmm4, %xmm1
	vfmadd231pd	%xmm5, %xmm5, %xmm1
	vfmadd231pd	%xmm6, %xmm6, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	cmpl	%r10d, %r12d
	jne	.L94
	movl	%ebp, %edx
	.p2align 4,,10
	.p2align 3
.L92:
	vmovups	(%rax), %xmm3
	incl	%edx
	addq	$16, %rax
	vfmadd231pd	%xmm3, %xmm3, %xmm0
	cmpl	%edx, %ecx
	ja	.L92
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	vaddsd	%xmm0, %xmm2, %xmm2
	cmpl	%esi, %r9d
	je	.L93
	movl	%r9d, %eax
.L97:
	movslq	%eax, %rdx
	incl	%eax
	salq	$3, %rdx
	vmovsd	(%r8,%rdx), %xmm7
	vfmadd231sd	%xmm7, %xmm7, %xmm2
	cmpl	%eax, %esi
	jle	.L93
	vmovsd	8(%r8,%rdx), %xmm0
	vfmadd231sd	%xmm0, %xmm0, %xmm2
.L93:
	addq	$8, %rdi
	cmpq	%rbx, %rdi
	jne	.L96
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	vsqrtsd	%xmm2, %xmm2, %xmm0
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,7
	.p2align 3
.L98:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L97
.L107:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	vxorpd	%xmm0, %xmm0, %xmm0
	ret
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
	vmovsd	(%rax), %xmm0
	testl	%esi, %esi
	jle	.L122
	vmovaps	.LC13(%rip), %xmm5
	movl	%esi, %ecx
	vmovq	.LC14(%rip), %xmm4
	leal	-1(%rsi), %eax
	shrl	%ecx
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%esi, %r9d
	movq	%rax, %r11
	leal	-5(%rcx), %r10d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	andl	$-2, %r9d
	andl	$-4, %r10d
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	vmovaps	%xmm5, %xmm3
	leaq	8(%rdi,%rax,8), %rbx
	leal	4(%r10), %ebp
	.p2align 4,,10
	.p2align 3
.L110:
	movq	(%rdi), %r8
	cmpl	$1, %r11d
	jbe	.L116
	vmovddup	%xmm0, %xmm0
	vmovaps	%xmm5, %xmm2
	movq	%r8, %rax
	xorl	%edx, %edx
	cmpl	$4, %ecx
	jbe	.L111
	vmovaps	%xmm3, %xmm2
.L113:
	vandps	16(%rax), %xmm3, %xmm6
	movl	%edx, %r12d
	prefetcht0	464(%rax)
	addl	$4, %edx
	vandps	(%rax), %xmm3, %xmm1
	addq	$64, %rax
	vmaxpd	%xmm6, %xmm1, %xmm1
	vandps	-32(%rax), %xmm3, %xmm6
	vmaxpd	%xmm6, %xmm1, %xmm1
	vandps	-16(%rax), %xmm3, %xmm6
	vmaxpd	%xmm6, %xmm1, %xmm1
	vmaxpd	%xmm1, %xmm0, %xmm0
	cmpl	%r10d, %r12d
	jne	.L113
	movl	%ebp, %edx
	.p2align 4,,10
	.p2align 3
.L111:
	vandps	(%rax), %xmm2, %xmm1
	incl	%edx
	addq	$16, %rax
	vmaxpd	%xmm1, %xmm0, %xmm0
	cmpl	%edx, %ecx
	ja	.L111
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vmaxpd	%xmm0, %xmm1, %xmm0
	cmpl	%esi, %r9d
	je	.L112
	movl	%r9d, %eax
.L115:
	movslq	%eax, %rdx
	incl	%eax
	salq	$3, %rdx
	vmovsd	(%r8,%rdx), %xmm1
	vandps	%xmm4, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
	cmpl	%eax, %esi
	jle	.L112
	vmovsd	8(%r8,%rdx), %xmm1
	vandps	%xmm4, %xmm1, %xmm1
	vmaxsd	%xmm1, %xmm0, %xmm0
.L112:
	addq	$8, %rdi
	cmpq	%rbx, %rdi
	jne	.L110
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,7
	.p2align 3
.L116:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L115
.L122:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
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
	jle	.L146
	movl	%ecx, %ebx
	leal	-3(%rcx), %eax
	vmovsd	.LC16(%rip), %xmm4
	vmovaps	.LC15(%rip), %xmm5
	subl	$2, %ebx
	movq	$1, -96(%rsp)
	addq	$2, %rax
	movq	%rax, -88(%rsp)
	movl	%ebx, -20(%rsp)
	movl	%ebx, %eax
	shrl	%eax
	movl	%eax, -52(%rsp)
	subl	$5, %eax
	vmovaps	%xmm4, %xmm2
	vmovaps	%xmm5, %xmm3
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
	leaq	8(%rcx), %r15
	movq	%rax, -104(%rsp)
	.p2align 4,,10
	.p2align 3
.L133:
	movq	-96(%rsp), %rax
	movq	-80(%rsp), %rdi
	movq	(%rdi,%rax,8), %rdx
	movq	8(%rdi,%rax,8), %rbp
	movq	-8(%rdi,%rax,8), %rbx
	movq	-64(%rsp), %rdi
	leaq	8(%rbp), %r9
	movq	(%rdi,%rax,8), %r13
	movq	-72(%rsp), %rdi
	leaq	8(%rbx), %r10
	movq	(%rdi,%rax,8), %r12
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
	je	.L134
	leaq	24(%r13), %rax
	cmpq	%rax, %rdi
	setnb	%al
	cmpq	%r8, %r11
	setnb	%sil
	orl	%esi, %eax
	testb	$1, %al
	je	.L134
	cmpl	$4, -52(%rsp)
	leaq	8(%rdx), %r14
	leaq	16(%rdx), %rsi
	jbe	.L135
	vmovaps	%xmm3, %xmm1
	xorl	%r8d, %r8d
.L129:
	vmovups	-8(%rsi), %xmm6
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
	vfmsubpd	-64(%r10), %xmm3, %xmm6, %xmm0
	vsubpd	-64(%r9), %xmm0, %xmm0
	vsubpd	-64(%r11), %xmm0, %xmm0
	vsubpd	-80(%rsi), %xmm0, %xmm0
	vsubpd	-64(%rsi), %xmm0, %xmm0
	vmovups	%xmm0, -64(%rdi)
	vmovups	-56(%rsi), %xmm6
	vfmsubpd	-48(%r10), %xmm3, %xmm6, %xmm0
	vsubpd	-48(%r9), %xmm0, %xmm0
	vsubpd	-48(%r11), %xmm0, %xmm0
	vsubpd	-64(%rsi), %xmm0, %xmm0
	vsubpd	-48(%rsi), %xmm0, %xmm0
	vmovups	%xmm0, -48(%rdi)
	vmovups	-40(%rsi), %xmm7
	vfmsubpd	-32(%r10), %xmm3, %xmm7, %xmm0
	vsubpd	-32(%r9), %xmm0, %xmm0
	vsubpd	-32(%r11), %xmm0, %xmm0
	vsubpd	-48(%rsi), %xmm0, %xmm0
	vsubpd	-32(%rsi), %xmm0, %xmm0
	vmovups	%xmm0, -32(%rdi)
	vmovups	-24(%rsi), %xmm6
	vfmsubpd	-16(%r10), %xmm3, %xmm6, %xmm0
	vsubpd	-16(%r9), %xmm0, %xmm0
	vsubpd	-16(%r11), %xmm0, %xmm0
	vsubpd	-32(%rsi), %xmm0, %xmm0
	movq	%rax, -32(%rsp)
	movl	%r8d, %eax
	addl	$4, %r8d
	vsubpd	-16(%rsi), %xmm0, %xmm0
	vmovups	%xmm0, -16(%rdi)
	cmpl	-16(%rsp), %eax
	jne	.L129
	movl	-12(%rsp), %r8d
.L128:
	movq	%rdx, -48(%rsp)
	xorl	%eax, %eax
	movq	%rbx, -40(%rsp)
	movl	-52(%rsp), %edx
	movq	-32(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L130:
	vmovups	(%r14,%rax), %xmm6
	incl	%r8d
	vfmsubpd	(%r10,%rax), %xmm1, %xmm6, %xmm0
	vsubpd	(%r9,%rax), %xmm0, %xmm0
	vsubpd	(%r11,%rax), %xmm0, %xmm0
	vsubpd	(%rbx,%rax), %xmm0, %xmm0
	vsubpd	(%rsi,%rax), %xmm0, %xmm0
	vmovups	%xmm0, (%rdi,%rax)
	addq	$16, %rax
	cmpl	%r8d, %edx
	ja	.L130
	movl	-20(%rsp), %edi
	movq	-48(%rsp), %rdx
	movq	-40(%rsp), %rbx
	cmpl	%edi, -24(%rsp)
	je	.L132
	vmovsd	(%rdx,%rcx), %xmm7
	vmovsd	0(%r13,%rcx), %xmm1
	movq	-104(%rsp), %rax
	vaddsd	0(%rbp,%rcx), %xmm1, %xmm1
	vfmsubsd	(%rbx,%rcx), %xmm2, %xmm7, %xmm0
	vsubsd	%xmm1, %xmm0, %xmm0
	vmovsd	(%rdx,%r15), %xmm1
	vaddsd	(%rdx,%rax), %xmm1, %xmm1
	vsubsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rcx)
.L132:
	incq	-96(%rsp)
	movq	-96(%rsp), %rax
	cmpq	-88(%rsp), %rax
	jne	.L133
.L146:
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
.L134:
	.cfi_restore_state
	movq	-88(%rsp), %rsi
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L127:
	vmovsd	(%rdx,%rax,8), %xmm7
	vmovsd	0(%r13,%rax,8), %xmm1
	vfmsubsd	(%rbx,%rax,8), %xmm4, %xmm7, %xmm0
	vaddsd	0(%rbp,%rax,8), %xmm1, %xmm1
	vsubsd	%xmm1, %xmm0, %xmm0
	vmovsd	8(%rdx,%rax,8), %xmm1
	vaddsd	-8(%rdx,%rax,8), %xmm1, %xmm1
	vsubsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rax,8)
	incq	%rax
	cmpq	%rsi, %rax
	jne	.L127
	jmp	.L132
.L135:
	movq	%rdx, -32(%rsp)
	vmovaps	%xmm5, %xmm1
	xorl	%r8d, %r8d
	jmp	.L128
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
	jle	.L158
	leal	-11(%rdx), %eax
	vmovsd	.LC17(%rip), %xmm3
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
.L153:
	movq	(%r12,%rbp,8), %rdx
	movq	-8(%r12,%rbp,8), %r9
	movq	8(%r12,%rbp,8), %r10
	movq	(%r14,%rbp,8), %r11
	vmovsd	(%rdx), %xmm0
	cmpl	$10, %r13d
	jle	.L154
	leaq	80(%r9), %r8
	leaq	80(%r10), %rdi
	movl	$1, %eax
	leaq	88(%rdx), %rcx
	leaq	80(%r11), %rsi
.L151:
	vmovsd	-72(%r8), %xmm1
	vmovsd	-72(%rcx), %xmm2
	prefetcht0	(%r8)
	prefetcht0	(%rdi)
	prefetcht0	(%rsi)
	prefetcht0	(%rcx)
	addl	$8, %eax
	addq	$64, %r8
	addq	$64, %rdi
	addq	$64, %rcx
	addq	$64, %rsi
	vaddsd	-136(%rsi), %xmm2, %xmm2
	vaddsd	-136(%rdi), %xmm1, %xmm1
	vaddsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vmovsd	%xmm0, -144(%rcx)
	vmovsd	-128(%rdi), %xmm1
	vmovsd	-128(%rsi), %xmm2
	vaddsd	-128(%r8), %xmm1, %xmm1
	vaddsd	-128(%rcx), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm1
	vmovsd	%xmm1, -136(%rcx)
	vmovsd	-120(%rdi), %xmm0
	vmovsd	-120(%rsi), %xmm2
	vaddsd	-120(%r8), %xmm0, %xmm0
	vaddsd	-120(%rcx), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm0, %xmm0
	vmovsd	-112(%rcx), %xmm2
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm1
	vmovsd	%xmm1, -128(%rcx)
	vmovsd	-112(%r8), %xmm0
	vaddsd	-112(%rsi), %xmm2, %xmm2
	vaddsd	-112(%rdi), %xmm0, %xmm0
	vaddsd	%xmm2, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	-104(%rcx), %xmm1
	vmulsd	%xmm3, %xmm0, %xmm0
	vmovsd	%xmm0, -120(%rcx)
	vmovsd	-104(%r8), %xmm2
	vaddsd	-104(%rsi), %xmm1, %xmm1
	vaddsd	-104(%rdi), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	-96(%rcx), %xmm2
	vaddsd	%xmm0, %xmm1, %xmm1
	vmulsd	%xmm3, %xmm1, %xmm0
	vmovsd	%xmm0, -112(%rcx)
	vmovsd	-96(%r8), %xmm1
	vaddsd	-96(%rdi), %xmm1, %xmm1
	vaddsd	-96(%rsi), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	-88(%rcx), %xmm2
	vaddsd	%xmm0, %xmm1, %xmm1
	vmulsd	%xmm3, %xmm1, %xmm1
	vmovsd	%xmm1, -104(%rcx)
	vmovsd	-88(%r8), %xmm0
	vaddsd	-88(%rsi), %xmm2, %xmm2
	vaddsd	-88(%rdi), %xmm0, %xmm0
	vaddsd	%xmm2, %xmm0, %xmm0
	vmovsd	-80(%rcx), %xmm2
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm1
	vmovsd	%xmm1, -96(%rcx)
	vmovsd	-80(%r8), %xmm0
	vaddsd	-80(%rsi), %xmm2, %xmm2
	vaddsd	-80(%rdi), %xmm0, %xmm0
	vaddsd	%xmm2, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vmovsd	%xmm0, -88(%rcx)
	cmpl	-4(%rsp), %eax
	jne	.L151
.L150:
	cltq
	.p2align 4,,10
	.p2align 3
.L152:
	vmovsd	(%r10,%rax,8), %xmm1
	vmovsd	(%r11,%rax,8), %xmm2
	vaddsd	(%r9,%rax,8), %xmm1, %xmm1
	vaddsd	8(%rdx,%rax,8), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax,8)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L152
	incq	%rbp
	cmpq	%r15, %rbp
	jne	.L153
.L158:
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
.L154:
	.cfi_restore_state
	movl	$1, %eax
	jmp	.L150
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
	jle	.L164
	movslq	%esi, %rax
	movq	(%rdi), %r9
	decl	%esi
	leaq	-8(,%rax,8), %rcx
	xorl	%eax, %eax
	movq	(%rdi,%rcx), %r8
	.p2align 4,,10
	.p2align 3
.L162:
	movq	(%rdi,%rax,8), %rdx
	movq	$0x000000000, (%r9,%rax,8)
	movq	$0x000000000, (%r8,%rax,8)
	movq	$0x000000000, (%rdx)
	movq	$0x000000000, (%rdx,%rcx)
	movq	%rax, %rdx
	incq	%rax
	cmpq	%rdx, %rsi
	jne	.L162
.L164:
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
	jle	.L189
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
	vmovaps	.LC15(%rip), %xmm3
	vmovsd	.LC16(%rip), %xmm2
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
.L167:
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
	je	.L177
	cmpl	$2, %r12d
	jbe	.L177
	movq	%r9, %rdi
	movq	%r8, %rcx
	cmpl	$4, %r10d
	jbe	.L179
	vmovaps	%xmm3, %xmm1
	xorl	%eax, %eax
.L174:
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
	jne	.L174
	movl	-12(%rsp), %esi
.L173:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L168:
	vmovups	(%rcx,%rax,2), %xmm5
	incl	%esi
	vmovhpd	16(%rcx,%rax,2), %xmm5, %xmm0
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovups	%xmm0, (%rdi,%rax)
	addq	$16, %rax
	cmpl	%esi, %r10d
	ja	.L168
	vmulsd	(%r8,%r13), %xmm2, %xmm0
	movq	-48(%rsp), %rax
	vmovsd	%xmm0, (%r9,%rax)
	cmpl	-40(%rsp), %ebx
	jle	.L169
	movq	-32(%rsp), %rax
	vmulsd	(%r8,%rax), %xmm2, %xmm0
	movq	-24(%rsp), %rax
	vmovsd	%xmm0, (%r9,%rax)
.L169:
	addq	$16, %r11
	addq	$8, %rdx
	cmpq	%r15, %r11
	jne	.L167
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
.L177:
	.cfi_restore_state
	cmpl	$8, %ebx
	jle	.L178
	leaq	304(%r8), %rcx
	leaq	152(%r9), %rsi
	xorl	%eax, %eax
.L171:
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
	jne	.L171
.L170:
	cltq
	.p2align 4,,10
	.p2align 3
.L172:
	movq	%rax, %rcx
	salq	$4, %rcx
	vmulsd	(%r8,%rcx), %xmm2, %xmm0
	vmovsd	%xmm0, (%r9,%rax,8)
	incq	%rax
	cmpl	%eax, %ebx
	jg	.L172
	jmp	.L169
.L179:
	vmovaps	%xmm4, %xmm1
	xorl	%esi, %esi
	jmp	.L173
.L178:
	xorl	%eax, %eax
	jmp	.L170
.L189:
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
	jle	.L193
	movl	%edx, %ebp
	cmpl	$8, %edx
	jle	.L226
	leal	-9(%rdx), %r15d
	leaq	80(%rdi), %r13
	xorl	%ebx, %ebx
	andl	$-8, %r15d
	leal	8(%r15), %eax
	movl	%eax, 16(%rsp)
	leal	-1(%rdx), %eax
	movq	%rax, %r15
	leaq	8(,%rax,8), %r14
.L196:
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
	jne	.L196
.L197:
	movl	%r15d, %r8d
	movslq	%ebx, %rbx
	leaq	8(,%r8,8), %r14
	.p2align 4,,10
	.p2align 3
.L195:
	movq	(%r12,%rbx,8), %rdi
	movq	%r14, %rdx
	xorl	%esi, %esi
	incq	%rbx
	call	memset@PLT
	cmpl	%ebx, %ebp
	jg	.L195
.L193:
	movl	36(%rsp), %edi
	leal	-1(%rdi), %esi
	movl	%esi, 124(%rsp)
	testl	%esi, %esi
	jle	.L224
	movq	8(%rsp), %rax
	vmovaps	.LC18(%rip), %xmm6
	vmovaps	.LC19(%rip), %xmm5
	vmovsd	.LC20(%rip), %xmm4
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
.L208:
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
	je	.L199
	leaq	31(%r10), %rax
	subq	%r11, %rax
	cmpq	$62, %rax
	jbe	.L199
	cmpl	$4, 120(%rsp)
	leaq	8(%rdx), %r14
	leaq	8(%rsi), %rax
	movq	%r11, %r8
	movq	%r14, 40(%rsp)
	movq	%rax, 48(%rsp)
	jbe	.L209
	vmovaps	%xmm2, %xmm8
	vmovaps	%xmm3, %xmm9
	movq	%r10, %rdi
	movq	%r10, %rbp
	movq	%rsi, %r9
	movq	%rdx, %rcx
	xorl	%ebx, %ebx
	movq	%rdx, %r10
.L201:
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
	jne	.L201
	movq	%r14, 40(%rsp)
	movq	%r10, %rdx
	movq	%rbp, %r10
	movq	%rcx, %rbp
	movq	%rax, 48(%rsp)
	movl	140(%rsp), %ebx
.L200:
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
.L202:
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
	ja	.L202
	movl	128(%rsp), %edi
	movq	80(%rsp), %rdx
	movq	88(%rsp), %r10
	movq	96(%rsp), %rsi
	movq	104(%rsp), %r11
	cmpl	%edi, 124(%rsp)
	je	.L207
	leaq	(%rdx,%r15), %rax
	leaq	(%rsi,%r15), %rcx
	vmovsd	.LC20(%rip), %xmm1
	movq	8(%rsp), %rbx
	vmovsd	(%rax), %xmm0
	vmovsd	.LC17(%rip), %xmm8
	addq	%rbx, %rdx
	vmovsd	%xmm0, (%r10,%r12)
	vaddsd	(%rcx), %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r11,%r12)
	vmovsd	(%rax), %xmm0
	vaddsd	(%rdx), %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%r10,%r13)
	vmovsd	(%rsi,%rbx), %xmm0
	vmovsd	(%rax), %xmm1
	vaddsd	(%rcx), %xmm0, %xmm0
	vaddsd	(%rdx), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm8, %xmm0, %xmm0
	vmovsd	%xmm0, (%r11,%r13)
.L207:
	addq	$16, 16(%rsp)
	addq	$8, 24(%rsp)
	movq	16(%rsp), %rax
	cmpq	72(%rsp), %rax
	jne	.L208
.L224:
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
.L199:
	.cfi_restore_state
	cmpl	$5, 36(%rsp)
	jle	.L210
	vmovsd	.LC17(%rip), %xmm8
	vmovaps	%xmm4, %xmm1
	leaq	56(%rdx), %rcx
	leaq	104(%r10), %r9
	leaq	56(%rsi), %rdi
	leaq	104(%r11), %r8
	xorl	%eax, %eax
.L205:
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
	vmovsd	-88(%rdi), %xmm7
	vaddsd	-80(%rcx), %xmm0, %xmm0
	vaddsd	-80(%rdi), %xmm7, %xmm7
	vaddsd	%xmm7, %xmm0, %xmm0
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
	vmovsd	-72(%rcx), %xmm0
	vmovsd	-80(%rdi), %xmm7
	vaddsd	-80(%rcx), %xmm0, %xmm0
	vaddsd	-72(%rdi), %xmm7, %xmm7
	vaddsd	%xmm7, %xmm0, %xmm0
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
	vmovsd	-72(%rdi), %xmm7
	vaddsd	-64(%rcx), %xmm0, %xmm0
	vaddsd	-64(%rdi), %xmm7, %xmm7
	vaddsd	%xmm7, %xmm0, %xmm0
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
	vmovsd	-64(%rdi), %xmm7
	vaddsd	-56(%rcx), %xmm0, %xmm0
	vaddsd	-56(%rdi), %xmm7, %xmm7
	vaddsd	%xmm7, %xmm0, %xmm0
	vmulsd	%xmm8, %xmm0, %xmm0
	vmovsd	%xmm0, -112(%r8)
	cmpl	136(%rsp), %eax
	jne	.L205
.L204:
	movl	124(%rsp), %edi
	movslq	%eax, %rcx
	salq	$3, %rcx
	.p2align 4,,10
	.p2align 3
.L206:
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
	vmovsd	(%rsi,%rcx), %xmm0
	vaddsd	8(%rdx,%rcx), %xmm7, %xmm7
	vaddsd	8(%rsi,%rcx), %xmm0, %xmm0
	vaddsd	%xmm0, %xmm7, %xmm7
	vmulsd	%xmm8, %xmm7, %xmm7
	vmovsd	%xmm7, 8(%r11,%rcx,2)
	addq	$8, %rcx
	cmpl	%eax, %edi
	jg	.L206
	jmp	.L207
.L209:
	movq	%rsi, 112(%rsp)
	vmovaps	%xmm6, %xmm8
	vmovaps	%xmm5, %xmm9
	movq	%r10, %rdi
	movq	%rsi, %r9
	movq	%rdx, %rbp
	movq	%rdx, %rcx
	xorl	%ebx, %ebx
	jmp	.L200
.L210:
	vmovsd	.LC20(%rip), %xmm1
	vmovsd	.LC17(%rip), %xmm8
	xorl	%eax, %eax
	jmp	.L204
.L226:
	xorl	%ebx, %ebx
	leal	-1(%rdx), %r15d
	jmp	.L197
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
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movq	%rsi, 56(%rsp)
	movq	%rdx, 64(%rsp)
	vmovsd	%xmm0, 120(%rsp)
	vmovsd	%xmm1, 152(%rsp)
	testl	%edi, %edi
	jle	.L294
	leal	-1(%rdi), %eax
	movl	%eax, 104(%rsp)
	cmpl	$12, %eax
	jbe	.L295
	vmovaps	.LC2(%rip), %xmm0
	movl	%edi, %edx
	xorl	%eax, %eax
	shrl	$2, %edx
	.p2align 4,,10
	.p2align 3
.L230:
	incl	%eax
	vpslld	$1, %xmm0, %xmm0
	cmpl	%eax, %edx
	jne	.L230
	vpsrldq	$8, %xmm0, %xmm1
	vpmulld	%xmm1, %xmm0, %xmm0
	movl	%edi, %edx
	andl	$-4, %edx
	leal	1(%rdx), %eax
	vpsrldq	$4, %xmm0, %xmm1
	vpmulld	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %ebx
	cmpl	%edx, %edi
	je	.L231
.L229:
	leal	1(%rax), %edx
	leal	(%rbx,%rbx), %ecx
	cmpl	%edx, %edi
	jl	.L304
	leal	2(%rax), %edx
	leal	0(,%rbx,4), %ecx
	cmpl	%edx, %edi
	jl	.L304
	leal	3(%rax), %edx
	leal	0(,%rbx,8), %ecx
	cmpl	%edx, %edi
	jl	.L304
	movl	%ebx, %ecx
	leal	4(%rax), %edx
	sall	$4, %ecx
	cmpl	%edx, %edi
	jl	.L304
	movl	%ebx, %ecx
	leal	5(%rax), %edx
	sall	$5, %ecx
	cmpl	%edx, %edi
	jl	.L304
	movl	%ebx, %ecx
	leal	6(%rax), %edx
	sall	$6, %ecx
	cmpl	%edx, %edi
	jl	.L304
	movl	%ebx, %ecx
	leal	7(%rax), %edx
	sall	$7, %ecx
	cmpl	%edx, %edi
	jl	.L304
	movl	%ebx, %ecx
	leal	8(%rax), %edx
	sall	$8, %ecx
	cmpl	%edx, %edi
	jl	.L304
	movl	%ebx, %ecx
	leal	9(%rax), %edx
	sall	$9, %ecx
	cmpl	%edx, %edi
	jl	.L304
	movl	%ebx, %edx
	leal	10(%rax), %ecx
	sall	$10, %edx
	cmpl	%ecx, %edi
	jl	.L307
	movl	%ebx, %edx
	leal	11(%rax), %ecx
	sall	$11, %edx
	cmpl	%ecx, %edi
	jl	.L307
	movl	%ebx, %edx
	addl	$12, %eax
	sall	$12, %edx
	cmpl	%eax, %edi
	jl	.L307
	sall	$13, %ebx
.L231:
	leal	1(%rbx), %eax
	movl	%eax, 96(%rsp)
	movl	%eax, 52(%rsp)
	cmpl	$1, %edi
	jle	.L228
	leal	-2(%rdi), %eax
	cmpl	$12, %eax
	jbe	.L308
	movl	104(%rsp), %edx
	vmovaps	.LC2(%rip), %xmm0
	xorl	%eax, %eax
	shrl	$2, %edx
	.p2align 4,,10
	.p2align 3
.L233:
	incl	%eax
	vpslld	$1, %xmm0, %xmm0
	cmpl	%eax, %edx
	jne	.L233
	vpsrldq	$8, %xmm0, %xmm1
	vpmulld	%xmm1, %xmm0, %xmm0
	movl	104(%rsp), %esi
	vpsrldq	$4, %xmm0, %xmm1
	vpmulld	%xmm1, %xmm0, %xmm0
	movl	%esi, %edx
	andl	$-4, %edx
	leal	1(%rdx), %eax
	vmovd	%xmm0, %ebp
	cmpl	%esi, %edx
	je	.L234
.L232:
	leal	1(%rax), %edx
	leal	(%rbp,%rbp), %ecx
	cmpl	%edx, %edi
	jle	.L317
	leal	2(%rax), %edx
	leal	0(,%rbp,4), %ecx
	cmpl	%edx, %edi
	jle	.L317
	leal	3(%rax), %edx
	leal	0(,%rbp,8), %ecx
	cmpl	%edx, %edi
	jle	.L317
	movl	%ebp, %ecx
	leal	4(%rax), %edx
	sall	$4, %ecx
	cmpl	%edx, %edi
	jle	.L317
	movl	%ebp, %ecx
	leal	5(%rax), %edx
	sall	$5, %ecx
	cmpl	%edx, %edi
	jle	.L317
	movl	%ebp, %ecx
	leal	6(%rax), %edx
	sall	$6, %ecx
	cmpl	%edx, %edi
	jle	.L317
	movl	%ebp, %ecx
	leal	7(%rax), %edx
	sall	$7, %ecx
	cmpl	%edx, %edi
	jle	.L317
	movl	%ebp, %ecx
	leal	8(%rax), %edx
	sall	$8, %ecx
	cmpl	%edx, %edi
	jle	.L317
	movl	%ebp, %ecx
	leal	9(%rax), %edx
	sall	$9, %ecx
	cmpl	%edx, %edi
	jle	.L317
	movl	%ebp, %edx
	leal	10(%rax), %ecx
	sall	$10, %edx
	cmpl	%ecx, %edi
	jle	.L320
	movl	%ebp, %edx
	leal	11(%rax), %ecx
	sall	$11, %edx
	cmpl	%ecx, %edi
	jle	.L320
	movl	%ebp, %edx
	addl	$12, %eax
	sall	$12, %edx
	cmpl	%eax, %edi
	jle	.L320
	sall	$13, %ebp
.L234:
	incl	%ebp
.L235:
	movslq	52(%rsp), %r14
	leaq	0(,%r14,8), %r15
	movq	%r15, %rdi
	call	malloc@PLT
	leal	-7(%rbx), %edi
	movl	%edi, 100(%rsp)
	movq	%rax, 72(%rsp)
	cmpl	$7, %ebx
	jle	.L322
	leaq	88(%rax), %r12
	xorl	%r13d, %r13d
.L238:
	movl	$8, %esi
	movq	%r14, %rdi
	prefetchw	(%r12)
	addl	$8, %r13d
	call	calloc@PLT
	movl	$8, %esi
	movq	%r14, %rdi
	addq	$64, %r12
	movq	%rax, -152(%r12)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r14, %rdi
	movq	%rax, -144(%r12)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r14, %rdi
	movq	%rax, -136(%r12)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r14, %rdi
	movq	%rax, -128(%r12)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r14, %rdi
	movq	%rax, -120(%r12)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r14, %rdi
	movq	%rax, -112(%r12)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r14, %rdi
	movq	%rax, -104(%r12)
	call	calloc@PLT
	movq	%rax, -96(%r12)
	cmpl	%r13d, 100(%rsp)
	jg	.L238
.L237:
	movq	72(%rsp), %r12
	movslq	%r13d, %r13
	.p2align 4,,10
	.p2align 3
.L239:
	movl	$8, %esi
	movq	%r14, %rdi
	call	calloc@PLT
	movq	%rax, (%r12,%r13,8)
	incq	%r13
	leal	-1(%r13), %eax
	cmpl	%eax, %ebx
	jg	.L239
	movslq	%ebp, %r13
	leaq	0(,%r13,8), %rax
	movq	%rax, %rdi
	movq	%rax, 8(%rsp)
	call	malloc@PLT
	movq	%rax, 88(%rsp)
	cmpl	$8, %ebp
	jle	.L323
	leaq	88(%rax), %r12
	leal	-9(%rbp), %eax
	xorl	%edx, %edx
	andl	$-8, %eax
	movl	%ebx, 24(%rsp)
	movl	%edx, %ebx
	addl	$8, %eax
	movl	%eax, 20(%rsp)
.L241:
	movl	$8, %esi
	movq	%r13, %rdi
	prefetchw	(%r12)
	addl	$8, %ebx
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	addq	$64, %r12
	movq	%rax, -152(%r12)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	movq	%rax, -144(%r12)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	movq	%rax, -136(%r12)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	movq	%rax, -128(%r12)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	movq	%rax, -120(%r12)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	movq	%rax, -112(%r12)
	call	calloc@PLT
	movl	$8, %esi
	movq	%r13, %rdi
	movq	%rax, -104(%r12)
	call	calloc@PLT
	movq	%rax, -96(%r12)
	cmpl	20(%rsp), %ebx
	jne	.L241
	movl	%ebx, %edx
	movl	24(%rsp), %ebx
.L240:
	movslq	%edx, %r12
	movl	%ebx, 20(%rsp)
	movq	%r12, %rbx
	movq	88(%rsp), %r12
	.p2align 4,,10
	.p2align 3
.L242:
	movl	$8, %esi
	movq	%r13, %rdi
	call	calloc@PLT
	movq	%rax, (%r12,%rbx,8)
	incq	%rbx
	cmpl	%ebx, %ebp
	jg	.L242
	movl	20(%rsp), %ebx
	movq	%r15, %rdi
	call	malloc@PLT
	movq	%rax, %r12
	cmpl	$7, %ebx
	jle	.L324
	movl	%ebx, 20(%rsp)
	leaq	88(%rax), %r15
	xorl	%edx, %edx
	movl	%edx, %ebx
.L244:
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
	cmpl	%ebx, 100(%rsp)
	jg	.L244
	movl	%ebx, %edx
	movl	20(%rsp), %ebx
.L243:
	movslq	%edx, %r15
	.p2align 4,,10
	.p2align 3
.L245:
	movl	$8, %esi
	movq	%r14, %rdi
	call	calloc@PLT
	movq	%rax, (%r12,%r15,8)
	incq	%r15
	leal	-1(%r15), %eax
	cmpl	%eax, %ebx
	jg	.L245
	movq	8(%rsp), %rdi
	call	malloc@PLT
	movq	%rax, 80(%rsp)
	cmpl	$8, %ebp
	jle	.L325
	leal	-9(%rbp), %r15d
	leaq	88(%rax), %r14
	andl	$-8, %r15d
	leal	8(%r15), %eax
	xorl	%r15d, %r15d
	movl	%eax, 8(%rsp)
.L247:
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
	cmpl	8(%rsp), %r15d
	jne	.L247
.L246:
	movslq	%r15d, %r14
	movq	80(%rsp), %r15
	.p2align 4,,10
	.p2align 3
.L248:
	movl	$8, %esi
	movq	%r13, %rdi
	call	calloc@PLT
	movq	%rax, (%r15,%r14,8)
	incq	%r14
	cmpl	%r14d, %ebp
	jg	.L248
	vmovsd	.LC21(%rip), %xmm0
	movq	72(%rsp), %rsi
	leal	-1(%rbp), %eax
	movl	%eax, 20(%rsp)
	movq	%r12, 112(%rsp)
	movq	%rax, %rdi
	salq	$4, %rax
	movl	%edi, %r15d
	andl	$-2, %edi
	shrl	%r15d
	movl	%edi, %edx
	vdivsd	152(%rsp), %xmm0, %xmm3
	leaq	32(%rsi,%rax), %rax
	movq	%rax, 208(%rsp)
	movq	%r13, %rax
	salq	$4, %rax
	subq	$8, %rax
	movq	%rax, 176(%rsp)
	leaq	0(,%r13,8), %rax
	movq	%rax, 168(%rsp)
	leal	-5(%r15), %eax
	andl	$-4, %eax
	movl	%eax, 48(%rsp)
	addl	$4, %eax
	movl	%eax, 232(%rsp)
	leal	(%rdi,%rdi), %eax
	movslq	%eax, %rcx
	addl	$2, %eax
	leaq	0(,%rcx,8), %rdi
	movl	%edx, %ecx
	cltq
	movq	%rdi, 184(%rsp)
	leaq	0(,%rcx,8), %rdi
	salq	$3, %rax
	movq	%rdi, 192(%rsp)
	leal	1(%rdx), %edi
	movl	%edi, 28(%rsp)
	movq	%rax, 40(%rsp)
	movl	%edi, %eax
	movl	96(%rsp), %edi
	salq	$3, %rax
	movq	%rax, 32(%rsp)
	movslq	%ebx, %rax
	leaq	8(,%rax,8), %rcx
	movq	%rcx, 8(%rsp)
	addq	%rsi, %rcx
	movl	%edi, %r13d
	movq	%rcx, 200(%rsp)
	andl	$-2, %edi
	shrl	%r13d
	leal	-5(%r13), %eax
	andl	$-4, %eax
	movl	%eax, 24(%rsp)
	addl	$4, %eax
	movl	%eax, 128(%rsp)
	movslq	%edi, %rax
	movq	%rax, 216(%rsp)
	leaq	0(,%rax,8), %r14
	movq	%rax, %r11
	leaq	16(%rsi), %rax
	movl	%r11d, %r12d
	movq	%rax, 224(%rsp)
	leal	-9(%rbp), %eax
	movl	%eax, 236(%rsp)
	vmovsd	%xmm3, 160(%rsp)
.L280:
	movl	52(%rsp), %edx
	movq	64(%rsp), %rsi
	movq	56(%rsp), %rdi
	call	GS_update
	movl	52(%rsp), %ecx
	movq	64(%rsp), %rdx
	movq	72(%rsp), %rsi
	movq	56(%rsp), %rdi
	call	L_def
	movl	236(%rsp), %eax
	movl	%r12d, 132(%rsp)
	movl	%r13d, 144(%rsp)
	movq	%r14, 136(%rsp)
	movl	%ebx, 148(%rsp)
	movq	224(%rsp), %r10
	movq	88(%rsp), %r11
	movq	184(%rsp), %r8
	andl	$-8, %eax
	movq	168(%rsp), %r12
	movq	176(%rsp), %r13
	addl	$8, %eax
	movq	192(%rsp), %rbx
	movq	208(%rsp), %r14
	movl	%eax, 108(%rsp)
	vmovsd	.LC16(%rip), %xmm2
	vmovaps	.LC15(%rip), %xmm3
	.p2align 4,,10
	.p2align 3
.L249:
	movq	(%r11), %r9
	movq	-16(%r10), %rdi
	prefetcht0	(%r10)
	leaq	(%r9,%r12), %rax
	leaq	(%rdi,%r13), %rdx
	cmpq	%rax, %rdi
	setnb	%al
	cmpq	%rdx, %r9
	setnb	%dl
	orl	%edx, %eax
	testb	$1, %al
	je	.L260
	cmpl	$2, 20(%rsp)
	jbe	.L260
	movq	%r9, %rsi
	movq	%rdi, %rdx
	cmpl	$4, %r15d
	jbe	.L327
	vmovaps	%xmm3, %xmm1
	xorl	%eax, %eax
.L256:
	vmovups	(%rdx), %xmm4
	prefetcht0	624(%rdx)
	prefetcht0	688(%rdx)
	movl	%eax, %ecx
	prefetchw	304(%rsi)
	subq	$-128, %rdx
	addq	$64, %rsi
	addl	$4, %eax
	vmovhpd	-112(%rdx), %xmm4, %xmm0
	vmulpd	%xmm3, %xmm0, %xmm0
	vmovups	%xmm0, -64(%rsi)
	vmovups	-96(%rdx), %xmm6
	vmovhpd	-80(%rdx), %xmm6, %xmm0
	vmulpd	%xmm3, %xmm0, %xmm0
	vmovups	%xmm0, -48(%rsi)
	vmovups	-64(%rdx), %xmm7
	vmovhpd	-48(%rdx), %xmm7, %xmm0
	vmulpd	%xmm3, %xmm0, %xmm0
	vmovups	%xmm0, -32(%rsi)
	vmovups	-32(%rdx), %xmm4
	vmovhpd	-16(%rdx), %xmm4, %xmm0
	vmulpd	%xmm3, %xmm0, %xmm0
	vmovups	%xmm0, -16(%rsi)
	cmpl	48(%rsp), %ecx
	jne	.L256
	movl	232(%rsp), %ecx
.L255:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L250:
	vmovups	(%rdx,%rax,2), %xmm6
	incl	%ecx
	vmovhpd	16(%rdx,%rax,2), %xmm6, %xmm0
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovups	%xmm0, (%rsi,%rax)
	addq	$16, %rax
	cmpl	%ecx, %r15d
	ja	.L250
	vmulsd	(%rdi,%r8), %xmm2, %xmm0
	vmovsd	%xmm0, (%r9,%rbx)
	cmpl	28(%rsp), %ebp
	jle	.L251
	movq	40(%rsp), %rax
	vmulsd	(%rdi,%rax), %xmm2, %xmm0
	movq	32(%rsp), %rax
	vmovsd	%xmm0, (%r9,%rax)
.L251:
	addq	$16, %r10
	addq	$8, %r11
	cmpq	%r14, %r10
	jne	.L249
	vmovsd	152(%rsp), %xmm1
	vmovsd	120(%rsp), %xmm0
	movq	88(%rsp), %rdx
	movq	80(%rsp), %rsi
	movl	104(%rsp), %edi
	movl	132(%rsp), %r12d
	movl	144(%rsp), %r13d
	movq	136(%rsp), %r14
	movl	148(%rsp), %ebx
	call	multigrid_vcycle
	movl	52(%rsp), %edx
	movq	80(%rsp), %rsi
	movl	%ebp, %ecx
	movq	112(%rsp), %rdi
	call	prol_P
	movl	%ebp, 108(%rsp)
	movl	%r15d, 132(%rsp)
	xorl	%r11d, %r11d
	movq	112(%rsp), %rbp
	movq	56(%rsp), %r15
	movl	96(%rsp), %r8d
	.p2align 4,,10
	.p2align 3
.L261:
	movq	(%r15,%r11), %rdx
	movq	0(%rbp,%r11), %r9
	leaq	15(%rdx), %rax
	subq	%r9, %rax
	cmpq	$30, %rax
	jbe	.L371
	cmpl	$4, %r13d
	jbe	.L329
	movq	%r9, %rdi
	movq	%rdx, %rsi
	xorl	%eax, %eax
.L269:
	vmovups	(%rsi), %xmm1
	prefetcht0	320(%rdi)
	vmovups	48(%rsi), %xmm5
	prefetcht0	320(%rsi)
	addq	$64, %rsi
	movl	%eax, %ecx
	addq	$64, %rdi
	addl	$4, %eax
	vsubpd	-64(%rdi), %xmm1, %xmm0
	vmovups	-48(%rsi), %xmm1
	vmovups	%xmm0, -64(%rsi)
	vsubpd	-48(%rdi), %xmm1, %xmm0
	vmovups	-32(%rsi), %xmm1
	vmovups	%xmm0, -48(%rsi)
	vsubpd	-32(%rdi), %xmm1, %xmm0
	vmovups	%xmm0, -32(%rsi)
	vsubpd	-16(%rdi), %xmm5, %xmm0
	vmovups	%xmm0, -16(%rsi)
	movq	%rsi, %r10
	cmpl	24(%rsp), %ecx
	jne	.L269
	movl	128(%rsp), %ecx
.L268:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L262:
	vmovups	(%rsi,%rax), %xmm7
	incl	%ecx
	vsubpd	(%rdi,%rax), %xmm7, %xmm0
	vmovups	%xmm0, (%r10,%rax)
	addq	$16, %rax
	cmpl	%ecx, %r13d
	ja	.L262
	cmpl	%r8d, %r12d
	je	.L267
	addq	%r14, %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%r9,%r14), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx)
.L267:
	addq	$8, %r11
	cmpq	8(%rsp), %r11
	jne	.L261
	movl	52(%rsp), %edx
	movq	56(%rsp), %rdi
	movq	64(%rsp), %rsi
	movl	108(%rsp), %ebp
	movl	132(%rsp), %r15d
	call	GS_update
	movq	216(%rsp), %rax
	movq	72(%rsp), %rdx
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	200(%rsp), %rdi
	movl	24(%rsp), %r10d
	movl	96(%rsp), %r8d
	leaq	0(,%rax,8), %r9
	.p2align 4,,10
	.p2align 3
.L273:
	movq	(%rdx), %rsi
	cmpl	$1, %ebx
	je	.L279
	vxorps	%xmm0, %xmm0, %xmm0
	movq	%rsi, %rax
	xorl	%ecx, %ecx
	cmpl	$4, %r13d
	jbe	.L274
.L276:
	vmovups	16(%rax), %xmm4
	vmovups	(%rax), %xmm6
	movl	%ecx, %r11d
	prefetcht0	464(%rax)
	vmovups	32(%rax), %xmm7
	vmovups	48(%rax), %xmm5
	addl	$4, %ecx
	addq	$64, %rax
	vmulpd	%xmm4, %xmm4, %xmm4
	vfmadd231pd	%xmm6, %xmm6, %xmm4
	vfmadd231pd	%xmm7, %xmm7, %xmm4
	vfmadd231pd	%xmm5, %xmm5, %xmm4
	vaddpd	%xmm4, %xmm0, %xmm0
	cmpl	%r10d, %r11d
	jne	.L276
	movl	128(%rsp), %ecx
	.p2align 4,,10
	.p2align 3
.L274:
	vmovups	(%rax), %xmm5
	incl	%ecx
	addq	$16, %rax
	vfmadd231pd	%xmm5, %xmm5, %xmm0
	cmpl	%ecx, %r13d
	ja	.L274
	vunpckhpd	%xmm0, %xmm0, %xmm4
	vaddpd	%xmm0, %xmm4, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm1
	cmpl	%r8d, %r12d
	je	.L275
	vmovsd	(%rsi,%r9), %xmm6
	movq	%r9, %rax
	vfmadd231sd	%xmm6, %xmm6, %xmm1
	cmpl	%ebx, %r12d
	jge	.L275
.L293:
	vmovsd	8(%rsi,%rax), %xmm0
	vfmadd231sd	%xmm0, %xmm0, %xmm1
.L275:
	addq	$8, %rdx
	cmpq	%rdi, %rdx
	jne	.L273
	vsqrtsd	%xmm1, %xmm1, %xmm0
	vmulsd	160(%rsp), %xmm0, %xmm0
	vcomisd	.LC22(%rip), %xmm0
	ja	.L280
	movq	112(%rsp), %r12
	cmpl	$7, %ebx
	jle	.L331
	movq	72(%rsp), %rax
	xorl	%r13d, %r13d
	leaq	96(%rax), %r14
.L282:
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
	cmpl	100(%rsp), %r13d
	jl	.L282
.L281:
	movq	72(%rsp), %r14
	movslq	%r13d, %r13
	.p2align 4,,10
	.p2align 3
.L283:
	movq	(%r14,%r13,8), %rdi
	incq	%r13
	call	free@PLT
	leal	-1(%r13), %eax
	cmpl	%ebx, %eax
	jl	.L283
	movq	72(%rsp), %rdi
	call	free@PLT
	cmpl	$8, %ebp
	jle	.L332
	movq	88(%rsp), %rax
	leal	-9(%rbp), %r13d
	xorl	%r14d, %r14d
	andl	$-8, %r13d
	addl	$8, %r13d
	leaq	96(%rax), %r15
.L285:
	movq	-96(%r15), %rdi
	prefetcht0	(%r15)
	addl	$8, %r14d
	addq	$64, %r15
	call	free@PLT
	movq	-152(%r15), %rdi
	call	free@PLT
	movq	-144(%r15), %rdi
	call	free@PLT
	movq	-136(%r15), %rdi
	call	free@PLT
	movq	-128(%r15), %rdi
	call	free@PLT
	movq	-120(%r15), %rdi
	call	free@PLT
	movq	-112(%r15), %rdi
	call	free@PLT
	movq	-104(%r15), %rdi
	call	free@PLT
	cmpl	%r13d, %r14d
	jne	.L285
.L284:
	movq	88(%rsp), %r13
	movslq	%r14d, %r14
	.p2align 4,,10
	.p2align 3
.L286:
	movq	0(%r13,%r14,8), %rdi
	incq	%r14
	call	free@PLT
	cmpl	%r14d, %ebp
	jg	.L286
	movq	88(%rsp), %rdi
	call	free@PLT
	cmpl	$7, %ebx
	jle	.L333
	leaq	96(%r12), %r14
	xorl	%r13d, %r13d
.L288:
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
	cmpl	100(%rsp), %r13d
	jl	.L288
.L287:
	movslq	%r13d, %r13
	.p2align 4,,10
	.p2align 3
.L289:
	movq	(%r12,%r13,8), %rdi
	incq	%r13
	call	free@PLT
	leal	-1(%r13), %eax
	cmpl	%eax, %ebx
	jg	.L289
	movq	%r12, %rdi
	call	free@PLT
	cmpl	$8, %ebp
	jle	.L334
	movq	80(%rsp), %rax
	leal	-9(%rbp), %r13d
	xorl	%ebx, %ebx
	andl	$-8, %r13d
	leaq	96(%rax), %r12
.L291:
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
	movl	%ebx, %eax
	addl	$8, %ebx
	cmpl	%eax, %r13d
	jne	.L291
.L290:
	movq	80(%rsp), %r12
	movslq	%ebx, %rbx
	.p2align 4,,10
	.p2align 3
.L292:
	movq	(%r12,%rbx,8), %rdi
	incq	%rbx
	call	free@PLT
	cmpl	%ebx, %ebp
	jg	.L292
	movq	80(%rsp), %rdi
	addq	$248, %rsp
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
.L294:
	.cfi_restore_state
	movl	$2, 52(%rsp)
	movl	$1, %ebx
.L228:
	cmpl	$1, %edi
	jne	.L321
	vmovsd	120(%rsp), %xmm3
	movq	64(%rsp), %rbx
	movq	56(%rsp), %rax
	vmulsd	%xmm3, %xmm3, %xmm0
	movq	8(%rbx), %rdx
	movq	8(%rax), %rax
	vmulsd	8(%rdx), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rax)
	addq	$248, %rsp
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
.L317:
	.cfi_restore_state
	movl	%ecx, %ebp
	jmp	.L234
.L304:
	movl	%ecx, %ebx
	jmp	.L231
.L307:
	movl	%edx, %ebx
	jmp	.L231
.L320:
	movl	%edx, %ebp
	jmp	.L234
	.p2align 4,,7
	.p2align 3
.L260:
	cmpl	$8, %ebp
	jle	.L326
	leaq	304(%rdi), %rdx
	leaq	152(%r9), %rcx
	xorl	%eax, %eax
.L253:
	vmulsd	-304(%rdx), %xmm2, %xmm0
	prefetcht0	(%rdx)
	prefetcht0	64(%rdx)
	prefetchw	(%rcx)
	addl	$8, %eax
	subq	$-128, %rdx
	addq	$64, %rcx
	vmovsd	%xmm0, -216(%rcx)
	vmulsd	-416(%rdx), %xmm2, %xmm0
	vmovsd	%xmm0, -208(%rcx)
	vmulsd	-400(%rdx), %xmm2, %xmm0
	vmovsd	%xmm0, -200(%rcx)
	vmulsd	-384(%rdx), %xmm2, %xmm0
	vmovsd	%xmm0, -192(%rcx)
	vmulsd	-368(%rdx), %xmm2, %xmm0
	vmovsd	%xmm0, -184(%rcx)
	vmulsd	-352(%rdx), %xmm2, %xmm0
	vmovsd	%xmm0, -176(%rcx)
	vmulsd	-336(%rdx), %xmm2, %xmm0
	vmovsd	%xmm0, -168(%rcx)
	vmulsd	-320(%rdx), %xmm2, %xmm0
	vmovsd	%xmm0, -160(%rcx)
	cmpl	108(%rsp), %eax
	jne	.L253
.L252:
	cltq
	.p2align 4,,10
	.p2align 3
.L254:
	movq	%rax, %rdx
	salq	$4, %rdx
	vmulsd	(%rdi,%rdx), %xmm2, %xmm0
	vmovsd	%xmm0, (%r9,%rax,8)
	incq	%rax
	cmpl	%eax, %ebp
	jg	.L254
	jmp	.L251
	.p2align 4,,7
	.p2align 3
.L371:
	cmpl	$7, %ebx
	jle	.L328
	leaq	160(%rdx), %rcx
	leaq	160(%r9), %rsi
	xorl	%eax, %eax
.L265:
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
	cmpl	100(%rsp), %eax
	jl	.L265
.L264:
	cltq
	.p2align 4,,10
	.p2align 3
.L266:
	vmovsd	(%rdx,%rax,8), %xmm0
	vsubsd	(%r9,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax,8)
	incq	%rax
	leal	-1(%rax), %ecx
	cmpl	%ecx, %ebx
	jg	.L266
	jmp	.L267
	.p2align 4,,7
	.p2align 3
.L279:
	vmovsd	(%rsi), %xmm4
	xorl	%eax, %eax
	vfmadd231sd	%xmm4, %xmm4, %xmm1
	jmp	.L293
.L329:
	movq	%rdx, %r10
	movq	%r9, %rdi
	movq	%rdx, %rsi
	xorl	%ecx, %ecx
	jmp	.L268
.L327:
	vmovaps	.LC15(%rip), %xmm1
	xorl	%ecx, %ecx
	jmp	.L255
.L328:
	xorl	%eax, %eax
	jmp	.L264
.L326:
	xorl	%eax, %eax
	jmp	.L252
.L295:
	movl	$1, %eax
	movl	$1, %ebx
	jmp	.L229
.L308:
	movl	$1, %ebp
	movl	$1, %eax
	jmp	.L232
.L322:
	xorl	%r13d, %r13d
	jmp	.L237
.L334:
	xorl	%ebx, %ebx
	jmp	.L290
.L333:
	xorl	%r13d, %r13d
	jmp	.L287
.L332:
	xorl	%r14d, %r14d
	jmp	.L284
.L325:
	xorl	%r15d, %r15d
	jmp	.L246
.L324:
	xorl	%edx, %edx
	jmp	.L243
.L323:
	xorl	%edx, %edx
	jmp	.L240
.L331:
	xorl	%r13d, %r13d
	jmp	.L281
.L321:
	leal	-1(%rdi), %eax
	movl	$2, %ebp
	movl	%eax, 104(%rsp)
	leal	1(%rbx), %eax
	movl	%eax, 96(%rsp)
	jmp	.L235
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
	jle	.L397
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
.L374:
	movq	(%r12,%rbx,8), %rdx
	movq	0(%r13,%rbx,8), %r9
	leaq	15(%rdx), %rax
	subq	%r9, %rax
	cmpq	$30, %rax
	jbe	.L385
	cmpl	$1, %ebp
	je	.L385
	cmpl	$4, %esi
	jbe	.L387
	movq	%r9, %r8
	movq	%rdx, %rdi
	xorl	%eax, %eax
.L382:
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
	jne	.L382
	movl	-12(%rsp), %ecx
.L381:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L375:
	vmovups	(%rdi,%rax), %xmm1
	incl	%ecx
	vsubpd	(%r8,%rax), %xmm1, %xmm0
	vmovups	%xmm0, (%r10,%rax)
	addq	$16, %rax
	cmpl	%ecx, %esi
	ja	.L375
	cmpl	%ebp, %r15d
	je	.L380
	addq	%r11, %rdx
	vmovsd	(%rdx), %xmm0
	vsubsd	(%r9,%r11), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx)
.L380:
	leaq	1(%rbx), %rax
	cmpq	%r14, %rbx
	je	.L395
.L400:
	movq	%rax, %rbx
	jmp	.L374
	.p2align 4,,7
	.p2align 3
.L385:
	cmpl	$8, %ebp
	jle	.L386
	leaq	160(%rdx), %rcx
	leaq	160(%r9), %rdi
	xorl	%eax, %eax
.L378:
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
	jne	.L378
.L377:
	cltq
	.p2align 4,,10
	.p2align 3
.L379:
	vmovsd	(%rdx,%rax,8), %xmm0
	vsubsd	(%r9,%rax,8), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax,8)
	incq	%rax
	cmpl	%eax, %ebp
	jg	.L379
	leaq	1(%rbx), %rax
	cmpq	%r14, %rbx
	jne	.L400
.L395:
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
.L387:
	.cfi_restore_state
	movq	%rdx, %r10
	movq	%r9, %r8
	movq	%rdx, %rdi
	xorl	%ecx, %ecx
	jmp	.L381
.L386:
	xorl	%eax, %eax
	jmp	.L377
.L397:
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
	jle	.L411
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
	jle	.L414
	leal	-9(%rsi), %r15d
	leaq	80(%rdi), %r13
	xorl	%ebx, %ebx
	andl	$-8, %r15d
	leal	8(%r15), %eax
	movl	%eax, 12(%rsp)
	leal	-1(%rsi), %eax
	movq	%rax, %r15
	leaq	8(,%rax,8), %r14
.L405:
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
	jne	.L405
.L406:
	movl	%r15d, %ecx
	movslq	%ebx, %rbx
	leaq	8(,%rcx,8), %r13
	.p2align 4,,10
	.p2align 3
.L404:
	movq	(%r12,%rbx,8), %rdi
	movq	%r13, %rdx
	xorl	%esi, %esi
	incq	%rbx
	call	memset@PLT
	cmpl	%ebx, %ebp
	jg	.L404
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
.L411:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
.L414:
	.cfi_def_cfa_offset 80
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	xorl	%ebx, %ebx
	leal	-1(%rsi), %r15d
	jmp	.L406
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
	jle	.L419
	vmovq	.LC14(%rip), %xmm2
	vmovsd	.LC22(%rip), %xmm1
	leal	-1(%rdx), %r9d
	xorl	%r10d, %r10d
.L417:
	movq	(%rdi,%r10,8), %r8
	movq	(%rsi,%r10,8), %rcx
	xorl	%eax, %eax
	jmp	.L418
	.p2align 4,,7
	.p2align 3
.L425:
	leaq	1(%rax), %rdx
	cmpq	%rax, %r9
	je	.L424
	movq	%rdx, %rax
.L418:
	vmovsd	(%r8,%rax,8), %xmm0
	vsubsd	(%rcx,%rax,8), %xmm0, %xmm0
	vandps	%xmm2, %xmm0, %xmm0
	vcomisd	%xmm1, %xmm0
	jbe	.L425
	xorl	%eax, %eax
	ret
	.p2align 4,,7
	.p2align 3
.L424:
	leaq	1(%r10), %rax
	cmpq	%r10, %r9
	je	.L422
	movq	%rax, %r10
	jmp	.L417
.L419:
	movl	$1, %eax
	ret
.L422:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE56:
	.size	verify, .-verify
	.section	.rodata.str1.1
.LC24:
	.string	"\nResult OK!"
.LC25:
	.string	"\nResult not OK!"
.LC27:
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
	vmovsd	.LC23(%rip), %xmm2
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
	vmovsd	.LC23(%rip), %xmm2
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
	je	.L427
	leaq	.LC24(%rip), %rdi
	call	puts@PLT
.L428:
	vxorps	%xmm1, %xmm1, %xmm1
	leaq	.LC27(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	vcvtsi2sdq	40(%rsp), %xmm1, %xmm0
	vmovaps	%xmm0, %xmm2
	vcvtsi2sdq	16(%rsp), %xmm1, %xmm0
	vfmsub231sd	.LC26(%rip), %xmm2, %xmm0
	vcvtsi2sdq	24(%rsp), %xmm1, %xmm2
	vcvtsi2sdq	32(%rsp), %xmm1, %xmm1
	vfnmadd231sd	.LC26(%rip), %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
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
	jne	.L431
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
.L427:
	.cfi_restore_state
	leaq	.LC25(%rip), %rdi
	call	puts@PLT
	jmp	.L428
.L431:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.rodata.str1.1
.LC28:
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
	jle	.L439
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
	leaq	.LC28(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.p2align 4,,10
	.p2align 3
.L434:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L435:
	movq	0(%rbp), %rax
	movq	%r12, %rsi
	movl	$1, %edi
	vmovsd	(%rax,%rbx), %xmm0
	movl	$1, %eax
	addq	$8, %rbx
	call	__printf_chk@PLT
	cmpq	%rbx, %r13
	jne	.L435
	movl	$10, %edi
	addq	$8, %rbp
	call	putchar@PLT
	cmpq	%r14, %rbp
	jne	.L434
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
.L439:
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
	.align 16
.LC3:
	.long	1
	.long	2
	.long	3
	.long	4
	.align 16
.LC6:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC7:
	.long	1413754136
	.long	1074340347
	.long	1413754136
	.long	1074340347
	.align 16
.LC8:
	.long	3700601565
	.long	1075168253
	.long	3700601565
	.long	1075168253
	.align 16
.LC9:
	.long	8
	.long	8
	.long	8
	.long	8
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC10:
	.long	1413754136
	.long	1074340347
	.align 8
.LC11:
	.long	3700601565
	.long	1075168253
	.align 8
.LC12:
	.long	450716388
	.long	1074906499
	.section	.rodata.cst16
	.align 16
.LC13:
	.long	4294967295
	.long	2147483647
	.long	4294967295
	.long	2147483647
	.align 16
.LC14:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.align 16
.LC15:
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.section	.rodata.cst8
	.align 8
.LC16:
	.long	0
	.long	1074790400
	.align 8
.LC17:
	.long	0
	.long	1070596096
	.section	.rodata.cst16
	.align 16
.LC18:
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.align 16
.LC19:
	.long	0
	.long	1070596096
	.long	0
	.long	1070596096
	.section	.rodata.cst8
	.align 8
.LC20:
	.long	0
	.long	1071644672
	.align 8
.LC21:
	.long	0
	.long	1072693248
	.align 8
.LC22:
	.long	2296604913
	.long	1055193269
	.align 8
.LC23:
	.long	0
	.long	1063256064
	.align 8
.LC26:
	.long	2696277389
	.long	1051772663
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
