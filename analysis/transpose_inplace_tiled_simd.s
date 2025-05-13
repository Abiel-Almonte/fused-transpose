	.text
	.file	"transpose_inplace_tiled_simd.cpp"
	.globl	transpose_inplace_tiled_simd    # -- Begin function transpose_inplace_tiled_simd
	.p2align	4, 0x90
	.type	transpose_inplace_tiled_simd,@function
transpose_inplace_tiled_simd:           # @transpose_inplace_tiled_simd
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$304, %rsp                      # imm = 0x130
	.cfi_def_cfa_offset 360
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
                                        # kill: def $edx killed $edx def $rdx
                                        # kill: def $esi killed $esi def $rsi
	movl	%esi, %eax
	shrl	$5, %eax
	leal	31(%rsi), %ecx
	shrl	$5, %ecx
	cmpl	$32, %esi
	movq	%rdx, 16(%rsp)                  # 8-byte Spill
	movq	%rdi, 64(%rsp)                  # 8-byte Spill
	jae	.LBB0_1
# %bb.24:
	cmpl	%eax, %ecx
	jbe	.LBB0_168
# %bb.25:
	movl	%esi, %r10d
	andl	$7, %r10d
	shrl	$3, %esi
	xorl	%r11d, %r11d
	movl	%esi, %ebx
	jmp	.LBB0_16
.LBB0_1:
	movl	%ecx, 232(%rsp)                 # 4-byte Spill
	movq	%rsi, 240(%rsp)                 # 8-byte Spill
	movl	%edx, %ecx
	leal	(%rdx,%rdx), %esi
	leal	(%rdx,%rdx,2), %r10d
	leal	(,%rdx,4), %r8d
	leal	(%rdx,%rdx,4), %r11d
	leal	(%rsi,%rsi,2), %r14d
	leal	(,%rdx,8), %ebx
	movl	%ebx, %r9d
	subl	%edx, %r9d
                                        # kill: def $edx killed $edx killed $rdx def $rdx
	movq	%rcx, %r15
	shll	$5, %edx
	movq	%rdx, 296(%rsp)                 # 8-byte Spill
	leal	32(%rdx), %ecx
	movl	%ecx, 160(%rsp)                 # 4-byte Spill
	movl	%eax, %ecx
	movq	%rcx, 224(%rsp)                 # 8-byte Spill
	cmpl	$1, %eax
	movq	%rax, 248(%rsp)                 # 8-byte Spill
                                        # kill: def $eax killed $eax killed $rax def $rax
	adcl	$0, %eax
	movq	%rax, 256(%rsp)                 # 8-byte Spill
	movq	%r9, -56(%rsp)                  # 8-byte Spill
	leaq	(%rdi,%r9,4), %rax
	movq	%rax, 216(%rsp)                 # 8-byte Spill
	movq	%r14, -64(%rsp)                 # 8-byte Spill
	leaq	(%rdi,%r14,4), %rax
	movq	%rax, 208(%rsp)                 # 8-byte Spill
	movq	%r11, -112(%rsp)                # 8-byte Spill
	leaq	(%rdi,%r11,4), %rax
	movq	%rax, -8(%rsp)                  # 8-byte Spill
	movq	%r8, -120(%rsp)                 # 8-byte Spill
	leaq	(%rdi,%r8,4), %rax
	movq	%rax, -16(%rsp)                 # 8-byte Spill
	movq	%r10, -104(%rsp)                # 8-byte Spill
	leaq	(%rdi,%r10,4), %rax
	movq	%rax, -24(%rsp)                 # 8-byte Spill
	movq	%rsi, -48(%rsp)                 # 8-byte Spill
	leaq	(%rdi,%rsi,4), %rax
	movq	%rax, 104(%rsp)                 # 8-byte Spill
	leaq	(%rdi,%r15,4), %rax
	movq	%rax, 184(%rsp)                 # 8-byte Spill
	movl	$1, %eax
	movq	%rax, 200(%rsp)                 # 8-byte Spill
	movl	$32, 192(%rsp)                  # 4-byte Folded Spill
	xorl	%eax, %eax
	movq	%rax, 176(%rsp)                 # 8-byte Spill
	xorl	%ecx, %ecx
	movl	%ebx, -72(%rsp)                 # 4-byte Spill
	movq	%r15, -32(%rsp)                 # 8-byte Spill
	.p2align	4, 0x90
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
                                        #       Child Loop BB0_5 Depth 3
                                        #         Child Loop BB0_6 Depth 4
                                        #     Child Loop BB0_10 Depth 2
                                        #       Child Loop BB0_11 Depth 3
	movq	%rcx, 168(%rsp)                 # 8-byte Spill
	leaq	1(%rcx), %rax
	movq	%rax, 264(%rsp)                 # 8-byte Spill
	cmpq	224(%rsp), %rax                 # 8-byte Folded Reload
	movq	64(%rsp), %rdx                  # 8-byte Reload
	jae	.LBB0_9
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	movq	168(%rsp), %rax                 # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	shll	$5, %eax
	movl	%eax, 100(%rsp)                 # 4-byte Spill
	movl	192(%rsp), %eax                 # 4-byte Reload
	movq	200(%rsp), %rcx                 # 8-byte Reload
	.p2align	4, 0x90
.LBB0_4:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_5 Depth 3
                                        #         Child Loop BB0_6 Depth 4
	movl	%eax, 112(%rsp)                 # 4-byte Spill
	movl	%eax, %eax
	movq	%rcx, 272(%rsp)                 # 8-byte Spill
                                        # kill: def $ecx killed $ecx killed $rcx def $rcx
	imull	16(%rsp), %ecx                  # 4-byte Folded Reload
	shll	$5, %ecx
	addl	100(%rsp), %ecx                 # 4-byte Folded Reload
	leaq	(%rdx,%rcx,4), %rcx
	movq	%rcx, -88(%rsp)                 # 8-byte Spill
	leaq	(%rdx,%rax,4), %rcx
	movq	%rcx, -96(%rsp)                 # 8-byte Spill
	movq	216(%rsp), %rcx                 # 8-byte Reload
	leaq	(%rcx,%rax,4), %rcx
	movq	%rcx, 72(%rsp)                  # 8-byte Spill
	movq	208(%rsp), %rcx                 # 8-byte Reload
	leaq	(%rcx,%rax,4), %rcx
	movq	%rcx, 152(%rsp)                 # 8-byte Spill
	movq	-8(%rsp), %rcx                  # 8-byte Reload
	leaq	(%rcx,%rax,4), %rcx
	movq	%rcx, -40(%rsp)                 # 8-byte Spill
	movq	-16(%rsp), %rcx                 # 8-byte Reload
	leaq	(%rcx,%rax,4), %rcx
	movq	%rcx, 144(%rsp)                 # 8-byte Spill
	movq	-24(%rsp), %rcx                 # 8-byte Reload
	leaq	(%rcx,%rax,4), %rcx
	movq	%rcx, 136(%rsp)                 # 8-byte Spill
	movq	104(%rsp), %rcx                 # 8-byte Reload
	leaq	(%rcx,%rax,4), %rcx
	movq	%rcx, 128(%rsp)                 # 8-byte Spill
	movq	184(%rsp), %rcx                 # 8-byte Reload
	leaq	(%rcx,%rax,4), %rax
	movq	%rax, 120(%rsp)                 # 8-byte Spill
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB0_5:                                #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_6 Depth 4
	movq	%rax, 80(%rsp)                  # 8-byte Spill
	movl	%eax, %ecx
	movq	-96(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, -128(%rsp)                # 8-byte Spill
	movq	72(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 56(%rsp)                  # 8-byte Spill
	movq	152(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 48(%rsp)                  # 8-byte Spill
	movq	-40(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 40(%rsp)                  # 8-byte Spill
	movq	144(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 32(%rsp)                  # 8-byte Spill
	movq	136(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 8(%rsp)                   # 8-byte Spill
	movq	128(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 88(%rsp)                  # 8-byte Spill
	movq	120(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, (%rsp)                    # 8-byte Spill
	movq	%r13, -80(%rsp)                 # 8-byte Spill
	shlq	$5, %r13
	addq	-88(%rsp), %r13                 # 8-byte Folded Reload
	movq	%r13, 24(%rsp)                  # 8-byte Spill
	xorl	%r14d, %r14d
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB0_6:                                #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_4 Depth=2
                                        #       Parent Loop BB0_5 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	-128(%rsp), %rbp                # 8-byte Reload
	vmovups	(%rbp,%r15), %ymm0
	movq	(%rsp), %rax                    # 8-byte Reload
	vmovups	(%rax,%r15), %ymm4
	movq	88(%rsp), %r9                   # 8-byte Reload
	vmovups	(%r9,%r15), %ymm1
	movq	8(%rsp), %rsi                   # 8-byte Reload
	vmovups	(%rsi,%r15), %ymm5
	movq	32(%rsp), %rdx                  # 8-byte Reload
	vmovups	(%rdx,%r15), %ymm2
	movq	40(%rsp), %r8                   # 8-byte Reload
	vmovups	(%r8,%r15), %ymm6
	movq	48(%rsp), %r11                  # 8-byte Reload
	vmovups	(%r11,%r15), %ymm3
	movl	%r14d, %edi
	movq	24(%rsp), %rcx                  # 8-byte Reload
	leaq	(%rcx,%rdi,4), %rbx
	vmovups	(%rcx,%rdi,4), %ymm7
	movq	-32(%rsp), %r10                 # 8-byte Reload
	vmovups	(%rbx,%r10,4), %ymm8
	movq	-48(%rsp), %r10                 # 8-byte Reload
	vmovups	(%rbx,%r10,4), %ymm9
	movq	-104(%rsp), %r10                # 8-byte Reload
	vmovups	(%rbx,%r10,4), %ymm10
	movq	-120(%rsp), %r12                # 8-byte Reload
	vmovups	(%rbx,%r12,4), %ymm11
	movq	-112(%rsp), %r13                # 8-byte Reload
	vmovups	(%rbx,%r13,4), %ymm12
	movq	-64(%rsp), %r10                 # 8-byte Reload
	vmovups	(%rbx,%r10,4), %ymm13
	movq	-56(%rsp), %r10                 # 8-byte Reload
	vmovups	(%rbx,%r10,4), %ymm14
	vpunpckldq	%ymm8, %ymm7, %ymm15    # ymm15 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[4],ymm8[4],ymm7[5],ymm8[5]
	vpunpckhdq	%ymm8, %ymm7, %ymm7     # ymm7 = ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[6],ymm8[6],ymm7[7],ymm8[7]
	vpunpckldq	%ymm10, %ymm9, %ymm8    # ymm8 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[4],ymm10[4],ymm9[5],ymm10[5]
	vpunpckhdq	%ymm10, %ymm9, %ymm9    # ymm9 = ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[6],ymm10[6],ymm9[7],ymm10[7]
	vpunpckldq	%ymm12, %ymm11, %ymm10  # ymm10 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[4],ymm12[4],ymm11[5],ymm12[5]
	vpunpckhdq	%ymm12, %ymm11, %ymm11  # ymm11 = ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[6],ymm12[6],ymm11[7],ymm12[7]
	vpunpckldq	%ymm14, %ymm13, %ymm12  # ymm12 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[4],ymm14[4],ymm13[5],ymm14[5]
	vpunpckhdq	%ymm14, %ymm13, %ymm13  # ymm13 = ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[6],ymm14[6],ymm13[7],ymm14[7]
	vpunpcklqdq	%ymm8, %ymm15, %ymm14   # ymm14 = ymm15[0],ymm8[0],ymm15[2],ymm8[2]
	vpunpckhqdq	%ymm8, %ymm15, %ymm8    # ymm8 = ymm15[1],ymm8[1],ymm15[3],ymm8[3]
	vpunpcklqdq	%ymm12, %ymm10, %ymm15  # ymm15 = ymm10[0],ymm12[0],ymm10[2],ymm12[2]
	vpunpckhqdq	%ymm12, %ymm10, %ymm10  # ymm10 = ymm10[1],ymm12[1],ymm10[3],ymm12[3]
	vpunpcklqdq	%ymm9, %ymm7, %ymm12    # ymm12 = ymm7[0],ymm9[0],ymm7[2],ymm9[2]
	vpunpckhqdq	%ymm9, %ymm7, %ymm7     # ymm7 = ymm7[1],ymm9[1],ymm7[3],ymm9[3]
	vpunpcklqdq	%ymm13, %ymm11, %ymm9   # ymm9 = ymm11[0],ymm13[0],ymm11[2],ymm13[2]
	vpunpckhqdq	%ymm13, %ymm11, %ymm11  # ymm11 = ymm11[1],ymm13[1],ymm11[3],ymm13[3]
	vinsertf128	$1, %xmm15, %ymm14, %ymm13
	vperm2f128	$49, %ymm15, %ymm14, %ymm14 # ymm14 = ymm14[2,3],ymm15[2,3]
	movq	56(%rsp), %r10                  # 8-byte Reload
	vmovups	(%r10,%r15), %ymm15
	vmovups	%ymm13, (%rbp,%r15)
	vmovups	%ymm14, (%rdx,%r15)
	vinsertf128	$1, %xmm10, %ymm8, %ymm13
	vperm2f128	$49, %ymm10, %ymm8, %ymm8 # ymm8 = ymm8[2,3],ymm10[2,3]
	vmovups	%ymm13, (%rax,%r15)
	vmovups	%ymm8, (%r8,%r15)
	vinsertf128	$1, %xmm9, %ymm12, %ymm8
	vperm2f128	$49, %ymm9, %ymm12, %ymm9 # ymm9 = ymm12[2,3],ymm9[2,3]
	vmovups	%ymm8, (%r9,%r15)
	vmovups	%ymm9, (%r11,%r15)
	vinsertf128	$1, %xmm11, %ymm7, %ymm8
	vperm2f128	$49, %ymm11, %ymm7, %ymm7 # ymm7 = ymm7[2,3],ymm11[2,3]
	vmovups	%ymm8, (%rsi,%r15)
	vmovups	%ymm7, (%r10,%r15)
	vpunpckldq	%ymm4, %ymm0, %ymm7     # ymm7 = ymm0[0],ymm4[0],ymm0[1],ymm4[1],ymm0[4],ymm4[4],ymm0[5],ymm4[5]
	vpunpckhdq	%ymm4, %ymm0, %ymm0     # ymm0 = ymm0[2],ymm4[2],ymm0[3],ymm4[3],ymm0[6],ymm4[6],ymm0[7],ymm4[7]
	vpunpckldq	%ymm5, %ymm1, %ymm4     # ymm4 = ymm1[0],ymm5[0],ymm1[1],ymm5[1],ymm1[4],ymm5[4],ymm1[5],ymm5[5]
	vpunpckhdq	%ymm5, %ymm1, %ymm1     # ymm1 = ymm1[2],ymm5[2],ymm1[3],ymm5[3],ymm1[6],ymm5[6],ymm1[7],ymm5[7]
	vpunpckldq	%ymm6, %ymm2, %ymm5     # ymm5 = ymm2[0],ymm6[0],ymm2[1],ymm6[1],ymm2[4],ymm6[4],ymm2[5],ymm6[5]
	vpunpckhdq	%ymm6, %ymm2, %ymm2     # ymm2 = ymm2[2],ymm6[2],ymm2[3],ymm6[3],ymm2[6],ymm6[6],ymm2[7],ymm6[7]
	vpunpckldq	%ymm15, %ymm3, %ymm6    # ymm6 = ymm3[0],ymm15[0],ymm3[1],ymm15[1],ymm3[4],ymm15[4],ymm3[5],ymm15[5]
	vpunpckhdq	%ymm15, %ymm3, %ymm3    # ymm3 = ymm3[2],ymm15[2],ymm3[3],ymm15[3],ymm3[6],ymm15[6],ymm3[7],ymm15[7]
	vpunpcklqdq	%ymm4, %ymm7, %ymm8     # ymm8 = ymm7[0],ymm4[0],ymm7[2],ymm4[2]
	vpunpckhqdq	%ymm4, %ymm7, %ymm4     # ymm4 = ymm7[1],ymm4[1],ymm7[3],ymm4[3]
	vpunpcklqdq	%ymm6, %ymm5, %ymm7     # ymm7 = ymm5[0],ymm6[0],ymm5[2],ymm6[2]
	vpunpckhqdq	%ymm6, %ymm5, %ymm5     # ymm5 = ymm5[1],ymm6[1],ymm5[3],ymm6[3]
	vpunpcklqdq	%ymm1, %ymm0, %ymm6     # ymm6 = ymm0[0],ymm1[0],ymm0[2],ymm1[2]
	vpunpckhqdq	%ymm1, %ymm0, %ymm0     # ymm0 = ymm0[1],ymm1[1],ymm0[3],ymm1[3]
	vpunpcklqdq	%ymm3, %ymm2, %ymm1     # ymm1 = ymm2[0],ymm3[0],ymm2[2],ymm3[2]
	vpunpckhqdq	%ymm3, %ymm2, %ymm2     # ymm2 = ymm2[1],ymm3[1],ymm2[3],ymm3[3]
	vinsertf128	$1, %xmm7, %ymm8, %ymm3
	vmovups	%ymm3, (%rcx,%rdi,4)
	vperm2f128	$49, %ymm7, %ymm8, %ymm3 # ymm3 = ymm8[2,3],ymm7[2,3]
	vmovups	%ymm3, (%rbx,%r12,4)
	vinsertf128	$1, %xmm5, %ymm4, %ymm3
	movq	-32(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm3, (%rbx,%rax,4)
	vperm2f128	$49, %ymm5, %ymm4, %ymm3 # ymm3 = ymm4[2,3],ymm5[2,3]
	vmovups	%ymm3, (%rbx,%r13,4)
	vinsertf128	$1, %xmm1, %ymm6, %ymm3
	movq	-48(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm3, (%rbx,%rax,4)
	vperm2f128	$49, %ymm1, %ymm6, %ymm1 # ymm1 = ymm6[2,3],ymm1[2,3]
	movq	-64(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm1, (%rbx,%rax,4)
	vinsertf128	$1, %xmm2, %ymm0, %ymm1
	movq	-104(%rsp), %rax                # 8-byte Reload
	vmovups	%ymm1, (%rbx,%rax,4)
	vperm2f128	$49, %ymm2, %ymm0, %ymm0 # ymm0 = ymm0[2,3],ymm2[2,3]
	movq	-56(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm0, (%rbx,%rax,4)
	movl	-72(%rsp), %ebx                 # 4-byte Reload
	addq	$32, %r15
	addl	%ebx, %r14d
	cmpq	$128, %r15
	jne	.LBB0_6
# %bb.7:                                #   in Loop: Header=BB0_5 Depth=3
	movq	-80(%rsp), %r13                 # 8-byte Reload
	incq	%r13
	movq	80(%rsp), %rax                  # 8-byte Reload
	addl	%ebx, %eax
	cmpq	$4, %r13
	jne	.LBB0_5
# %bb.8:                                #   in Loop: Header=BB0_4 Depth=2
	movq	272(%rsp), %rcx                 # 8-byte Reload
	incq	%rcx
	movl	112(%rsp), %eax                 # 4-byte Reload
	addl	$32, %eax
	cmpq	224(%rsp), %rcx                 # 8-byte Folded Reload
	movq	64(%rsp), %rdx                  # 8-byte Reload
	jne	.LBB0_4
.LBB0_9:                                #   in Loop: Header=BB0_2 Depth=1
	movl	176(%rsp), %ecx                 # 4-byte Reload
	shlq	$2, %rcx
	movq	168(%rsp), %rax                 # 8-byte Reload
	imull	160(%rsp), %eax                 # 4-byte Folded Reload
	leaq	(%rdx,%rax,4), %rax
	movq	%rax, 72(%rsp)                  # 8-byte Spill
	leaq	(%rdx,%rcx), %rax
	movq	%rax, 152(%rsp)                 # 8-byte Spill
	movq	216(%rsp), %rax                 # 8-byte Reload
	addq	%rcx, %rax
	movq	%rax, -40(%rsp)                 # 8-byte Spill
	movq	208(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	%rax, 144(%rsp)                 # 8-byte Spill
	movq	-8(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	%rax, 136(%rsp)                 # 8-byte Spill
	movq	-16(%rsp), %rax                 # 8-byte Reload
	addq	%rcx, %rax
	movq	%rax, 128(%rsp)                 # 8-byte Spill
	movq	-24(%rsp), %rax                 # 8-byte Reload
	addq	%rcx, %rax
	movq	%rax, 120(%rsp)                 # 8-byte Spill
	movq	104(%rsp), %rax                 # 8-byte Reload
	addq	%rcx, %rax
	movq	%rax, 112(%rsp)                 # 8-byte Spill
	addq	184(%rsp), %rcx                 # 8-byte Folded Reload
	movq	%rcx, -96(%rsp)                 # 8-byte Spill
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB0_10:                               #   Parent Loop BB0_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_11 Depth 3
	movl	%edx, %ecx
	movq	152(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, -128(%rsp)                # 8-byte Spill
	movq	-40(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 56(%rsp)                  # 8-byte Spill
	movq	144(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 48(%rsp)                  # 8-byte Spill
	movq	136(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 40(%rsp)                  # 8-byte Spill
	movq	128(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 32(%rsp)                  # 8-byte Spill
	movq	120(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 8(%rsp)                   # 8-byte Spill
	movq	112(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 88(%rsp)                  # 8-byte Spill
	movq	-96(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, (%rsp)                    # 8-byte Spill
	movq	%r13, -88(%rsp)                 # 8-byte Spill
	shlq	$5, %r13
	addq	72(%rsp), %r13                  # 8-byte Folded Reload
	movq	%r13, 24(%rsp)                  # 8-byte Spill
	movq	%rdx, 80(%rsp)                  # 8-byte Spill
	movl	%edx, %r14d
	movq	%r9, -80(%rsp)                  # 8-byte Spill
	.p2align	4, 0x90
.LBB0_11:                               #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_10 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-128(%rsp), %r10                # 8-byte Reload
	vmovaps	(%r10,%r9), %ymm0
	movq	(%rsp), %rax                    # 8-byte Reload
	vmovups	(%rax,%r9), %ymm4
	movq	88(%rsp), %rbp                  # 8-byte Reload
	vmovups	(%rbp,%r9), %ymm1
	movq	8(%rsp), %r12                   # 8-byte Reload
	vmovups	(%r12,%r9), %ymm5
	movq	32(%rsp), %rdx                  # 8-byte Reload
	vmovups	(%rdx,%r9), %ymm2
	movq	40(%rsp), %r8                   # 8-byte Reload
	vmovups	(%r8,%r9), %ymm6
	movq	48(%rsp), %rbx                  # 8-byte Reload
	vmovups	(%rbx,%r9), %ymm3
	movl	%r14d, %esi
	movq	24(%rsp), %rcx                  # 8-byte Reload
	leaq	(%rcx,%rsi,4), %r15
	vmovaps	(%rcx,%rsi,4), %ymm7
	movq	-32(%rsp), %rdi                 # 8-byte Reload
	vmovups	(%r15,%rdi,4), %ymm8
	movq	-48(%rsp), %rdi                 # 8-byte Reload
	vmovups	(%r15,%rdi,4), %ymm9
	movq	-104(%rsp), %rdi                # 8-byte Reload
	vmovups	(%r15,%rdi,4), %ymm10
	movq	-120(%rsp), %rdi                # 8-byte Reload
	vmovups	(%r15,%rdi,4), %ymm11
	movq	-112(%rsp), %r13                # 8-byte Reload
	vmovups	(%r15,%r13,4), %ymm12
	movq	-64(%rsp), %r11                 # 8-byte Reload
	vmovups	(%r15,%r11,4), %ymm13
	movq	-56(%rsp), %r11                 # 8-byte Reload
	vmovups	(%r15,%r11,4), %ymm14
	vpunpckldq	%ymm8, %ymm7, %ymm15    # ymm15 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[4],ymm8[4],ymm7[5],ymm8[5]
	vpunpckhdq	%ymm8, %ymm7, %ymm7     # ymm7 = ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[6],ymm8[6],ymm7[7],ymm8[7]
	vpunpckldq	%ymm10, %ymm9, %ymm8    # ymm8 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[4],ymm10[4],ymm9[5],ymm10[5]
	vpunpckhdq	%ymm10, %ymm9, %ymm9    # ymm9 = ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[6],ymm10[6],ymm9[7],ymm10[7]
	vpunpckldq	%ymm12, %ymm11, %ymm10  # ymm10 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[4],ymm12[4],ymm11[5],ymm12[5]
	vpunpckhdq	%ymm12, %ymm11, %ymm11  # ymm11 = ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[6],ymm12[6],ymm11[7],ymm12[7]
	vpunpckldq	%ymm14, %ymm13, %ymm12  # ymm12 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[4],ymm14[4],ymm13[5],ymm14[5]
	vpunpckhdq	%ymm14, %ymm13, %ymm13  # ymm13 = ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[6],ymm14[6],ymm13[7],ymm14[7]
	vpunpcklqdq	%ymm8, %ymm15, %ymm14   # ymm14 = ymm15[0],ymm8[0],ymm15[2],ymm8[2]
	vpunpckhqdq	%ymm8, %ymm15, %ymm8    # ymm8 = ymm15[1],ymm8[1],ymm15[3],ymm8[3]
	vpunpcklqdq	%ymm12, %ymm10, %ymm15  # ymm15 = ymm10[0],ymm12[0],ymm10[2],ymm12[2]
	vpunpckhqdq	%ymm12, %ymm10, %ymm10  # ymm10 = ymm10[1],ymm12[1],ymm10[3],ymm12[3]
	vpunpcklqdq	%ymm9, %ymm7, %ymm12    # ymm12 = ymm7[0],ymm9[0],ymm7[2],ymm9[2]
	vpunpckhqdq	%ymm9, %ymm7, %ymm7     # ymm7 = ymm7[1],ymm9[1],ymm7[3],ymm9[3]
	vpunpcklqdq	%ymm13, %ymm11, %ymm9   # ymm9 = ymm11[0],ymm13[0],ymm11[2],ymm13[2]
	vpunpckhqdq	%ymm13, %ymm11, %ymm11  # ymm11 = ymm11[1],ymm13[1],ymm11[3],ymm13[3]
	vinsertf128	$1, %xmm15, %ymm14, %ymm13
	vperm2f128	$49, %ymm15, %ymm14, %ymm14 # ymm14 = ymm14[2,3],ymm15[2,3]
	movq	56(%rsp), %r11                  # 8-byte Reload
	vmovups	(%r11,%r9), %ymm15
	vmovaps	%ymm13, (%r10,%r9)
	vmovups	%ymm14, (%rdx,%r9)
	vinsertf128	$1, %xmm10, %ymm8, %ymm13
	vperm2f128	$49, %ymm10, %ymm8, %ymm8 # ymm8 = ymm8[2,3],ymm10[2,3]
	vmovups	%ymm13, (%rax,%r9)
	vmovups	%ymm8, (%r8,%r9)
	vinsertf128	$1, %xmm9, %ymm12, %ymm8
	vperm2f128	$49, %ymm9, %ymm12, %ymm9 # ymm9 = ymm12[2,3],ymm9[2,3]
	vmovups	%ymm8, (%rbp,%r9)
	vmovups	%ymm9, (%rbx,%r9)
	vinsertf128	$1, %xmm11, %ymm7, %ymm8
	vperm2f128	$49, %ymm11, %ymm7, %ymm7 # ymm7 = ymm7[2,3],ymm11[2,3]
	vmovups	%ymm8, (%r12,%r9)
	vmovups	%ymm7, (%r11,%r9)
	vpunpckldq	%ymm4, %ymm0, %ymm7     # ymm7 = ymm0[0],ymm4[0],ymm0[1],ymm4[1],ymm0[4],ymm4[4],ymm0[5],ymm4[5]
	vpunpckhdq	%ymm4, %ymm0, %ymm0     # ymm0 = ymm0[2],ymm4[2],ymm0[3],ymm4[3],ymm0[6],ymm4[6],ymm0[7],ymm4[7]
	vpunpckldq	%ymm5, %ymm1, %ymm4     # ymm4 = ymm1[0],ymm5[0],ymm1[1],ymm5[1],ymm1[4],ymm5[4],ymm1[5],ymm5[5]
	vpunpckhdq	%ymm5, %ymm1, %ymm1     # ymm1 = ymm1[2],ymm5[2],ymm1[3],ymm5[3],ymm1[6],ymm5[6],ymm1[7],ymm5[7]
	vpunpckldq	%ymm6, %ymm2, %ymm5     # ymm5 = ymm2[0],ymm6[0],ymm2[1],ymm6[1],ymm2[4],ymm6[4],ymm2[5],ymm6[5]
	vpunpckhdq	%ymm6, %ymm2, %ymm2     # ymm2 = ymm2[2],ymm6[2],ymm2[3],ymm6[3],ymm2[6],ymm6[6],ymm2[7],ymm6[7]
	vpunpckldq	%ymm15, %ymm3, %ymm6    # ymm6 = ymm3[0],ymm15[0],ymm3[1],ymm15[1],ymm3[4],ymm15[4],ymm3[5],ymm15[5]
	vpunpckhdq	%ymm15, %ymm3, %ymm3    # ymm3 = ymm3[2],ymm15[2],ymm3[3],ymm15[3],ymm3[6],ymm15[6],ymm3[7],ymm15[7]
	vpunpcklqdq	%ymm4, %ymm7, %ymm8     # ymm8 = ymm7[0],ymm4[0],ymm7[2],ymm4[2]
	vpunpckhqdq	%ymm4, %ymm7, %ymm4     # ymm4 = ymm7[1],ymm4[1],ymm7[3],ymm4[3]
	vpunpcklqdq	%ymm6, %ymm5, %ymm7     # ymm7 = ymm5[0],ymm6[0],ymm5[2],ymm6[2]
	vpunpckhqdq	%ymm6, %ymm5, %ymm5     # ymm5 = ymm5[1],ymm6[1],ymm5[3],ymm6[3]
	vpunpcklqdq	%ymm1, %ymm0, %ymm6     # ymm6 = ymm0[0],ymm1[0],ymm0[2],ymm1[2]
	vpunpckhqdq	%ymm1, %ymm0, %ymm0     # ymm0 = ymm0[1],ymm1[1],ymm0[3],ymm1[3]
	vpunpcklqdq	%ymm3, %ymm2, %ymm1     # ymm1 = ymm2[0],ymm3[0],ymm2[2],ymm3[2]
	vpunpckhqdq	%ymm3, %ymm2, %ymm2     # ymm2 = ymm2[1],ymm3[1],ymm2[3],ymm3[3]
	vinsertf128	$1, %xmm7, %ymm8, %ymm3
	vmovaps	%ymm3, (%rcx,%rsi,4)
	vperm2f128	$49, %ymm7, %ymm8, %ymm3 # ymm3 = ymm8[2,3],ymm7[2,3]
	vmovups	%ymm3, (%r15,%rdi,4)
	vinsertf128	$1, %xmm5, %ymm4, %ymm3
	movq	-32(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm3, (%r15,%rax,4)
	vperm2f128	$49, %ymm5, %ymm4, %ymm3 # ymm3 = ymm4[2,3],ymm5[2,3]
	vmovups	%ymm3, (%r15,%r13,4)
	vinsertf128	$1, %xmm1, %ymm6, %ymm3
	movq	-48(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm3, (%r15,%rax,4)
	vperm2f128	$49, %ymm1, %ymm6, %ymm1 # ymm1 = ymm6[2,3],ymm1[2,3]
	movq	-64(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm1, (%r15,%rax,4)
	vinsertf128	$1, %xmm2, %ymm0, %ymm1
	movq	-104(%rsp), %rax                # 8-byte Reload
	vmovups	%ymm1, (%r15,%rax,4)
	vperm2f128	$49, %ymm2, %ymm0, %ymm0 # ymm0 = ymm0[2,3],ymm2[2,3]
	movq	-56(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm0, (%r15,%rax,4)
	addq	$32, %r9
	addl	-72(%rsp), %r14d                # 4-byte Folded Reload
	cmpq	$128, %r9
	jne	.LBB0_11
# %bb.12:                               #   in Loop: Header=BB0_10 Depth=2
	movq	-88(%rsp), %r13                 # 8-byte Reload
	incq	%r13
	movq	-80(%rsp), %r9                  # 8-byte Reload
	addq	$32, %r9
	movq	80(%rsp), %rdx                  # 8-byte Reload
	movl	-72(%rsp), %eax                 # 4-byte Reload
	addl	%eax, %edx
	cmpq	$4, %r13
	jne	.LBB0_10
# %bb.13:                               #   in Loop: Header=BB0_2 Depth=1
	incq	200(%rsp)                       # 8-byte Folded Spill
	movl	160(%rsp), %eax                 # 4-byte Reload
	addl	%eax, 192(%rsp)                 # 4-byte Folded Spill
	movq	176(%rsp), %rcx                 # 8-byte Reload
	addl	%eax, %ecx
	movq	%rcx, 176(%rsp)                 # 8-byte Spill
	movq	264(%rsp), %rax                 # 8-byte Reload
	movq	%rax, %rcx
	cmpq	256(%rsp), %rax                 # 8-byte Folded Reload
	movq	-32(%rsp), %r15                 # 8-byte Reload
	jne	.LBB0_2
# %bb.14:
	movq	248(%rsp), %r9                  # 8-byte Reload
	cmpl	%r9d, 232(%rsp)                 # 4-byte Folded Reload
	movq	240(%rsp), %rax                 # 8-byte Reload
	jbe	.LBB0_168
# %bb.15:
	movl	%eax, %r11d
	andl	$-32, %r11d
	movl	%eax, %r10d
	andl	$7, %r10d
	movl	%eax, %ebx
	shrl	$3, %ebx
	andl	$3, %ebx
	cmpl	$32, %eax
	jae	.LBB0_26
.LBB0_16:
	movq	16(%rsp), %rdx                  # 8-byte Reload
	movq	64(%rsp), %rdi                  # 8-byte Reload
.LBB0_17:
	leal	1(%rdx), %eax
	movl	%eax, 112(%rsp)                 # 4-byte Spill
	imull	%eax, %r11d
	testl	%ebx, %ebx
	movl	%r10d, 104(%rsp)                # 4-byte Spill
	je	.LBB0_23
# %bb.18:
	movq	%r11, 168(%rsp)                 # 8-byte Spill
	movl	%r11d, %eax
	leaq	(%rdi,%rax,4), %r14
	movl	%edx, %r15d
	leal	(%rdx,%rdx), %eax
	leal	(%rdx,%rdx,2), %edi
	leal	(,%rdx,4), %ecx
	leal	(%rdx,%rdx,4), %r8d
	leal	(%rax,%rax,2), %r10d
	movq	%r10, (%rsp)                    # 8-byte Spill
	leal	(,%rdx,8), %esi
	movl	%esi, %r9d
	subl	%edx, %r9d
	movq	%rbx, 160(%rsp)                 # 8-byte Spill
	movl	%ebx, %edx
	leaq	(,%r9,4), %r11
	movq	%r11, 72(%rsp)                  # 8-byte Spill
	leaq	(,%r10,4), %r11
	movq	%r11, 152(%rsp)                 # 8-byte Spill
	movq	%r8, 88(%rsp)                   # 8-byte Spill
	leaq	(,%r8,4), %r11
	movq	%r11, -40(%rsp)                 # 8-byte Spill
	movq	%rcx, -64(%rsp)                 # 8-byte Spill
	leaq	(,%rcx,4), %rcx
	movq	%rcx, 144(%rsp)                 # 8-byte Spill
	movq	%rdi, %r8
	leaq	(,%rdi,4), %r10
	movq	%r10, 136(%rsp)                 # 8-byte Spill
	movq	%rax, -32(%rsp)                 # 8-byte Spill
	leaq	(,%rax,4), %rax
	movq	%rax, 128(%rsp)                 # 8-byte Spill
	movq	%r15, %rdi
	leaq	(,%r15,4), %rax
	movq	%rax, 120(%rsp)                 # 8-byte Spill
	xorl	%r10d, %r10d
	movq	%r14, -96(%rsp)                 # 8-byte Spill
	movq	%rdx, %rcx
	xorl	%r12d, %r12d
	movl	%esi, 8(%rsp)                   # 4-byte Spill
	movq	%r9, -72(%rsp)                  # 8-byte Spill
	movq	%rdx, 24(%rsp)                  # 8-byte Spill
	.p2align	4, 0x90
.LBB0_19:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_20 Depth 2
	movl	%r10d, %edx
	leaq	(,%rdx,4), %rax
	movq	%rax, -112(%rsp)                # 8-byte Spill
	movq	72(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rdx,4), %rax
	movq	%rax, -128(%rsp)                # 8-byte Spill
	movq	152(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rdx,4), %rax
	movq	%rax, 56(%rsp)                  # 8-byte Spill
	movq	-40(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rdx,4), %rax
	movq	%rax, 48(%rsp)                  # 8-byte Spill
	movq	144(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rdx,4), %rax
	movq	%rax, 40(%rsp)                  # 8-byte Spill
	movq	136(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rdx,4), %rax
	movq	%rax, -48(%rsp)                 # 8-byte Spill
	movq	128(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rdx,4), %rax
	movq	%rax, -56(%rsp)                 # 8-byte Spill
	movq	120(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rdx,4), %rax
	movq	%rax, 32(%rsp)                  # 8-byte Spill
	movq	%r12, %rax
	shlq	$5, %rax
	addq	-96(%rsp), %rax                 # 8-byte Folded Reload
	movq	%rax, -104(%rsp)                # 8-byte Spill
	movq	%r14, -80(%rsp)                 # 8-byte Spill
	movq	%r10, 80(%rsp)                  # 8-byte Spill
	movl	%r10d, %r15d
	movq	%r12, -88(%rsp)                 # 8-byte Spill
	movq	%r12, %rdx
	.p2align	4, 0x90
.LBB0_20:                               #   Parent Loop BB0_19 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-112(%rsp), %r11                # 8-byte Reload
	vmovaps	(%r14,%r11), %ymm0
	movq	32(%rsp), %r9                   # 8-byte Reload
	vmovups	(%r14,%r9), %ymm4
	movq	-56(%rsp), %rax                 # 8-byte Reload
	vmovups	(%r14,%rax), %ymm1
	movq	-48(%rsp), %rax                 # 8-byte Reload
	vmovups	(%r14,%rax), %ymm5
	movq	40(%rsp), %rbx                  # 8-byte Reload
	vmovups	(%r14,%rbx), %ymm2
	movq	48(%rsp), %r12                  # 8-byte Reload
	vmovups	(%r14,%r12), %ymm6
	movq	56(%rsp), %r10                  # 8-byte Reload
	vmovups	(%r14,%r10), %ymm3
	movl	%r15d, %eax
	movq	%rax, -120(%rsp)                # 8-byte Spill
	movq	-104(%rsp), %rcx                # 8-byte Reload
	leaq	(%rcx,%rax,4), %rsi
	vmovaps	(%rcx,%rax,4), %ymm7
	movq	%rdi, %rbp
	vmovups	(%rsi,%rdi,4), %ymm8
	movq	-32(%rsp), %rax                 # 8-byte Reload
	vmovups	(%rsi,%rax,4), %ymm9
	vmovups	(%rsi,%r8,4), %ymm10
	movq	-64(%rsp), %rax                 # 8-byte Reload
	vmovups	(%rsi,%rax,4), %ymm11
	movq	88(%rsp), %rcx                  # 8-byte Reload
	vmovups	(%rsi,%rcx,4), %ymm12
	movq	(%rsp), %rdi                    # 8-byte Reload
	vmovups	(%rsi,%rdi,4), %ymm13
	movq	-72(%rsp), %r13                 # 8-byte Reload
	vmovups	(%rsi,%r13,4), %ymm14
	movq	%rbp, %r13
	movq	%r8, %rbp
	movq	%rcx, %r8
	movq	%rdi, %rcx
	vpunpckldq	%ymm8, %ymm7, %ymm15    # ymm15 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[4],ymm8[4],ymm7[5],ymm8[5]
	vpunpckhdq	%ymm8, %ymm7, %ymm7     # ymm7 = ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[6],ymm8[6],ymm7[7],ymm8[7]
	vpunpckldq	%ymm10, %ymm9, %ymm8    # ymm8 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[4],ymm10[4],ymm9[5],ymm10[5]
	vpunpckhdq	%ymm10, %ymm9, %ymm9    # ymm9 = ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[6],ymm10[6],ymm9[7],ymm10[7]
	vpunpckldq	%ymm12, %ymm11, %ymm10  # ymm10 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[4],ymm12[4],ymm11[5],ymm12[5]
	vpunpckhdq	%ymm12, %ymm11, %ymm11  # ymm11 = ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[6],ymm12[6],ymm11[7],ymm12[7]
	vpunpckldq	%ymm14, %ymm13, %ymm12  # ymm12 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[4],ymm14[4],ymm13[5],ymm14[5]
	vpunpckhdq	%ymm14, %ymm13, %ymm13  # ymm13 = ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[6],ymm14[6],ymm13[7],ymm14[7]
	vpunpcklqdq	%ymm8, %ymm15, %ymm14   # ymm14 = ymm15[0],ymm8[0],ymm15[2],ymm8[2]
	vpunpckhqdq	%ymm8, %ymm15, %ymm8    # ymm8 = ymm15[1],ymm8[1],ymm15[3],ymm8[3]
	vpunpcklqdq	%ymm12, %ymm10, %ymm15  # ymm15 = ymm10[0],ymm12[0],ymm10[2],ymm12[2]
	vpunpckhqdq	%ymm12, %ymm10, %ymm10  # ymm10 = ymm10[1],ymm12[1],ymm10[3],ymm12[3]
	vpunpcklqdq	%ymm9, %ymm7, %ymm12    # ymm12 = ymm7[0],ymm9[0],ymm7[2],ymm9[2]
	vpunpckhqdq	%ymm9, %ymm7, %ymm7     # ymm7 = ymm7[1],ymm9[1],ymm7[3],ymm9[3]
	vpunpcklqdq	%ymm13, %ymm11, %ymm9   # ymm9 = ymm11[0],ymm13[0],ymm11[2],ymm13[2]
	vpunpckhqdq	%ymm13, %ymm11, %ymm11  # ymm11 = ymm11[1],ymm13[1],ymm11[3],ymm13[3]
	vinsertf128	$1, %xmm15, %ymm14, %ymm13
	vperm2f128	$49, %ymm15, %ymm14, %ymm14 # ymm14 = ymm14[2,3],ymm15[2,3]
	movq	-128(%rsp), %rax                # 8-byte Reload
	vmovups	(%r14,%rax), %ymm15
	vmovaps	%ymm13, (%r14,%r11)
	vmovups	%ymm14, (%r14,%rbx)
	vinsertf128	$1, %xmm10, %ymm8, %ymm13
	vperm2f128	$49, %ymm10, %ymm8, %ymm8 # ymm8 = ymm8[2,3],ymm10[2,3]
	vmovups	%ymm13, (%r14,%r9)
	vmovups	%ymm8, (%r14,%r12)
	vinsertf128	$1, %xmm9, %ymm12, %ymm8
	vperm2f128	$49, %ymm9, %ymm12, %ymm9 # ymm9 = ymm12[2,3],ymm9[2,3]
	movq	-56(%rsp), %rdi                 # 8-byte Reload
	vmovups	%ymm8, (%r14,%rdi)
	vmovups	%ymm9, (%r14,%r10)
	vinsertf128	$1, %xmm11, %ymm7, %ymm8
	vperm2f128	$49, %ymm11, %ymm7, %ymm7 # ymm7 = ymm7[2,3],ymm11[2,3]
	movq	-48(%rsp), %rdi                 # 8-byte Reload
	vmovups	%ymm8, (%r14,%rdi)
	vmovups	%ymm7, (%r14,%rax)
	vpunpckldq	%ymm4, %ymm0, %ymm7     # ymm7 = ymm0[0],ymm4[0],ymm0[1],ymm4[1],ymm0[4],ymm4[4],ymm0[5],ymm4[5]
	vpunpckhdq	%ymm4, %ymm0, %ymm0     # ymm0 = ymm0[2],ymm4[2],ymm0[3],ymm4[3],ymm0[6],ymm4[6],ymm0[7],ymm4[7]
	vpunpckldq	%ymm5, %ymm1, %ymm4     # ymm4 = ymm1[0],ymm5[0],ymm1[1],ymm5[1],ymm1[4],ymm5[4],ymm1[5],ymm5[5]
	vpunpckhdq	%ymm5, %ymm1, %ymm1     # ymm1 = ymm1[2],ymm5[2],ymm1[3],ymm5[3],ymm1[6],ymm5[6],ymm1[7],ymm5[7]
	vpunpckldq	%ymm6, %ymm2, %ymm5     # ymm5 = ymm2[0],ymm6[0],ymm2[1],ymm6[1],ymm2[4],ymm6[4],ymm2[5],ymm6[5]
	vpunpckhdq	%ymm6, %ymm2, %ymm2     # ymm2 = ymm2[2],ymm6[2],ymm2[3],ymm6[3],ymm2[6],ymm6[6],ymm2[7],ymm6[7]
	vpunpckldq	%ymm15, %ymm3, %ymm6    # ymm6 = ymm3[0],ymm15[0],ymm3[1],ymm15[1],ymm3[4],ymm15[4],ymm3[5],ymm15[5]
	vpunpckhdq	%ymm15, %ymm3, %ymm3    # ymm3 = ymm3[2],ymm15[2],ymm3[3],ymm15[3],ymm3[6],ymm15[6],ymm3[7],ymm15[7]
	vpunpcklqdq	%ymm4, %ymm7, %ymm8     # ymm8 = ymm7[0],ymm4[0],ymm7[2],ymm4[2]
	vpunpckhqdq	%ymm4, %ymm7, %ymm4     # ymm4 = ymm7[1],ymm4[1],ymm7[3],ymm4[3]
	vpunpcklqdq	%ymm6, %ymm5, %ymm7     # ymm7 = ymm5[0],ymm6[0],ymm5[2],ymm6[2]
	vpunpckhqdq	%ymm6, %ymm5, %ymm5     # ymm5 = ymm5[1],ymm6[1],ymm5[3],ymm6[3]
	vpunpcklqdq	%ymm1, %ymm0, %ymm6     # ymm6 = ymm0[0],ymm1[0],ymm0[2],ymm1[2]
	vpunpckhqdq	%ymm1, %ymm0, %ymm0     # ymm0 = ymm0[1],ymm1[1],ymm0[3],ymm1[3]
	vpunpcklqdq	%ymm3, %ymm2, %ymm1     # ymm1 = ymm2[0],ymm3[0],ymm2[2],ymm3[2]
	vpunpckhqdq	%ymm3, %ymm2, %ymm2     # ymm2 = ymm2[1],ymm3[1],ymm2[3],ymm3[3]
	vinsertf128	$1, %xmm7, %ymm8, %ymm3
	movq	-104(%rsp), %rax                # 8-byte Reload
	movq	-120(%rsp), %rdi                # 8-byte Reload
	vmovaps	%ymm3, (%rax,%rdi,4)
	movq	-72(%rsp), %r9                  # 8-byte Reload
	vperm2f128	$49, %ymm7, %ymm8, %ymm3 # ymm3 = ymm8[2,3],ymm7[2,3]
	movq	-64(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm3, (%rsi,%rax,4)
	vinsertf128	$1, %xmm5, %ymm4, %ymm3
	movq	%r13, %rdi
	vmovups	%ymm3, (%rsi,%r13,4)
	vperm2f128	$49, %ymm5, %ymm4, %ymm3 # ymm3 = ymm4[2,3],ymm5[2,3]
	vmovups	%ymm3, (%rsi,%r8,4)
	vinsertf128	$1, %xmm1, %ymm6, %ymm3
	movq	-32(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm3, (%rsi,%rax,4)
	vperm2f128	$49, %ymm1, %ymm6, %ymm1 # ymm1 = ymm6[2,3],ymm1[2,3]
	vmovups	%ymm1, (%rsi,%rcx,4)
	vinsertf128	$1, %xmm2, %ymm0, %ymm1
	movq	%rbp, %r8
	vmovups	%ymm1, (%rsi,%rbp,4)
	vperm2f128	$49, %ymm2, %ymm0, %ymm0 # ymm0 = ymm0[2,3],ymm2[2,3]
	vmovups	%ymm0, (%rsi,%r9,4)
	movl	8(%rsp), %esi                   # 4-byte Reload
	incq	%rdx
	addl	%esi, %r15d
	addq	$32, %r14
	movq	24(%rsp), %rax                  # 8-byte Reload
	cmpq	%rax, %rdx
	jb	.LBB0_20
# %bb.21:                               #   in Loop: Header=BB0_19 Depth=1
	movq	%rax, %rcx
	movq	-88(%rsp), %r12                 # 8-byte Reload
	incq	%r12
	movq	80(%rsp), %r10                  # 8-byte Reload
	addl	%esi, %r10d
	movq	-80(%rsp), %r14                 # 8-byte Reload
	addq	$32, %r14
	cmpq	%rax, %r12
	jne	.LBB0_19
# %bb.22:
	movq	160(%rsp), %rbx                 # 8-byte Reload
	testl	%ebx, %ebx
	movl	104(%rsp), %r10d                # 4-byte Reload
	movq	168(%rsp), %r11                 # 8-byte Reload
	je	.LBB0_23
# %bb.92:
	testl	%r10d, %r10d
	je	.LBB0_168
# %bb.93:
	leal	(,%rbx,8), %eax
	movl	%eax, %r14d
	orl	%r11d, %r14d
	movl	%eax, %ecx
	movq	16(%rsp), %r15                  # 8-byte Reload
	imull	%r15d, %ecx
	movl	%eax, %edx
	orl	$1, %edx
	imull	%r15d, %edx
	movl	%eax, %r12d
	orl	$2, %r12d
	imull	%r15d, %r12d
	movl	%eax, %r9d
	orl	$3, %r9d
	imull	%r15d, %r9d
	movl	%eax, %esi
	orl	$4, %esi
	imull	%r15d, %esi
	movq	%rsi, -120(%rsp)                # 8-byte Spill
	movl	%eax, %esi
	orl	$5, %esi
	imull	%r15d, %esi
	movq	%rsi, -112(%rsp)                # 8-byte Spill
	movq	%rax, (%rsp)                    # 8-byte Spill
                                        # kill: def $eax killed $eax killed $rax def $rax
	orl	$6, %eax
	imull	%r15d, %eax
	movq	%rax, -128(%rsp)                # 8-byte Spill
	movq	-32(%rsp), %rax                 # 8-byte Reload
	leal	(%rax,%rax,2), %esi
	movq	%rsi, -48(%rsp)                 # 8-byte Spill
	leal	(%r15,%r15,4), %esi
	movq	%rsi, -56(%rsp)                 # 8-byte Spill
	leal	(%r15,%r15,2), %esi
	movq	%rsi, -104(%rsp)                # 8-byte Spill
	xorl	%r13d, %r13d
                                        # kill: def $r15d killed $r15d killed $r15 def $r15
	movq	64(%rsp), %r8                   # 8-byte Reload
	movq	-64(%rsp), %rsi                 # 8-byte Reload
	jmp	.LBB0_94
	.p2align	4, 0x90
.LBB0_150:                              #   in Loop: Header=BB0_94 Depth=1
	movl	8(%rsp), %edi                   # 4-byte Reload
	addl	%edi, %r9d
	movq	%r9, -72(%rsp)                  # 8-byte Spill
	movq	-48(%rsp), %rax                 # 8-byte Reload
	addl	%edi, %eax
	movq	%rax, -48(%rsp)                 # 8-byte Spill
	movq	-56(%rsp), %rax                 # 8-byte Reload
	addl	%edi, %eax
	movq	%rax, -56(%rsp)                 # 8-byte Spill
	addl	%edi, %esi
	movq	-104(%rsp), %rax                # 8-byte Reload
	addl	%edi, %eax
	movq	%rax, -104(%rsp)                # 8-byte Spill
	movq	-32(%rsp), %rax                 # 8-byte Reload
	addl	%edi, %eax
	addl	%edi, %r15d
	addl	%edi, %r13d
	movq	-128(%rsp), %rdi                # 8-byte Reload
	addl	$8, %edi
	movq	%rdi, -128(%rsp)                # 8-byte Spill
	movq	-112(%rsp), %rdi                # 8-byte Reload
	addl	$8, %edi
	movq	%rdi, -112(%rsp)                # 8-byte Spill
	movq	-120(%rsp), %rdi                # 8-byte Reload
	addl	$8, %edi
	movq	%rdi, -120(%rsp)                # 8-byte Spill
	movq	%rbp, %r9
	addl	$8, %r9d
	addl	$8, %r12d
	addl	$8, %edx
	addl	$8, %ecx
	decl	%ebx
	je	.LBB0_151
.LBB0_94:                               # =>This Inner Loop Header: Depth=1
	movq	%rax, -32(%rsp)                 # 8-byte Spill
	leal	(%r14,%r13), %eax
	leal	(%r11,%rcx), %edi
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$1, %r10d
	je	.LBB0_101
# %bb.95:                               #   in Loop: Header=BB0_94 Depth=1
	leal	(%r11,%rdx), %eax
	leal	(%r14,%r13), %edi
	incl	%edi
	vmovss	(%r8,%rdi,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	vmovss	(%r8,%rax,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rdi,4)
	vmovss	%xmm0, (%r8,%rax,4)
	cmpl	$2, %r10d
	je	.LBB0_101
# %bb.96:                               #   in Loop: Header=BB0_94 Depth=1
	leal	(%r11,%r12), %eax
	leal	(%r14,%r13), %edi
	addl	$2, %edi
	vmovss	(%r8,%rdi,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	vmovss	(%r8,%rax,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rdi,4)
	vmovss	%xmm0, (%r8,%rax,4)
	cmpl	$3, %r10d
	je	.LBB0_101
# %bb.97:                               #   in Loop: Header=BB0_94 Depth=1
	leal	(%r11,%r9), %eax
	leal	(%r14,%r13), %edi
	addl	$3, %edi
	vmovss	(%r8,%rdi,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	vmovss	(%r8,%rax,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rdi,4)
	vmovss	%xmm0, (%r8,%rax,4)
	cmpl	$4, %r10d
	je	.LBB0_101
# %bb.98:                               #   in Loop: Header=BB0_94 Depth=1
	movq	-120(%rsp), %rax                # 8-byte Reload
	addl	%r11d, %eax
	leal	4(%r14,%r13), %edi
	vmovss	(%r8,%rdi,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	vmovss	(%r8,%rax,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rdi,4)
	vmovss	%xmm0, (%r8,%rax,4)
	cmpl	$5, %r10d
	je	.LBB0_101
# %bb.99:                               #   in Loop: Header=BB0_94 Depth=1
	movq	-112(%rsp), %rax                # 8-byte Reload
	addl	%r11d, %eax
	leal	5(%r14,%r13), %edi
	vmovss	(%r8,%rdi,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	vmovss	(%r8,%rax,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rdi,4)
	vmovss	%xmm0, (%r8,%rax,4)
	cmpl	$6, %r10d
	je	.LBB0_101
# %bb.100:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%r13), %eax
	addl	$6, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-128(%rsp), %rdi                # 8-byte Reload
	addl	%r11d, %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	.p2align	4, 0x90
.LBB0_101:                              #   in Loop: Header=BB0_94 Depth=1
	movq	%rsi, -64(%rsp)                 # 8-byte Spill
	leal	(%r14,%r15), %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	(%r11,%rcx), %edi
	incl	%edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$1, %r10d
	movq	-104(%rsp), %rbp                # 8-byte Reload
	je	.LBB0_108
# %bb.102:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%r15), %eax
	incl	%eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	1(%r11,%rdx), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$2, %r10d
	je	.LBB0_108
# %bb.103:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%r15), %eax
	addl	$2, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	1(%r11,%r12), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$3, %r10d
	je	.LBB0_108
# %bb.104:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%r15), %eax
	addl	$3, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	1(%r11,%r9), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$4, %r10d
	je	.LBB0_108
# %bb.105:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%r15), %eax
	addl	$4, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-120(%rsp), %rsi                # 8-byte Reload
	leal	1(%r11,%rsi), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$5, %r10d
	je	.LBB0_108
# %bb.106:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%r15), %eax
	addl	$5, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-112(%rsp), %rsi                # 8-byte Reload
	leal	1(%r11,%rsi), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$6, %r10d
	je	.LBB0_108
# %bb.107:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%r15), %eax
	addl	$6, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-128(%rsp), %rsi                # 8-byte Reload
	leal	(%r11,%rsi), %edi
	incl	%edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	.p2align	4, 0x90
.LBB0_108:                              #   in Loop: Header=BB0_94 Depth=1
	movq	-32(%rsp), %rsi                 # 8-byte Reload
	leal	(%r14,%rsi), %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	(%r11,%rcx), %edi
	addl	$2, %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$1, %r10d
	je	.LBB0_115
# %bb.109:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rsi), %eax
	incl	%eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	2(%r11,%rdx), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$2, %r10d
	je	.LBB0_115
# %bb.110:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rsi), %eax
	addl	$2, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	2(%r11,%r12), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$3, %r10d
	je	.LBB0_115
# %bb.111:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rsi), %eax
	addl	$3, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	2(%r11,%r9), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$4, %r10d
	je	.LBB0_115
# %bb.112:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rsi), %eax
	addl	$4, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-120(%rsp), %rdi                # 8-byte Reload
	leal	2(%r11,%rdi), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$5, %r10d
	je	.LBB0_115
# %bb.113:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rsi), %eax
	addl	$5, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-112(%rsp), %rdi                # 8-byte Reload
	leal	2(%r11,%rdi), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$6, %r10d
	je	.LBB0_115
# %bb.114:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rsi), %eax
	addl	$6, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-128(%rsp), %rsi                # 8-byte Reload
	leal	(%r11,%rsi), %edi
	addl	$2, %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	.p2align	4, 0x90
.LBB0_115:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rbp), %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	(%r11,%rcx), %edi
	addl	$3, %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$1, %r10d
	je	.LBB0_122
# %bb.116:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rbp), %eax
	incl	%eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	3(%r11,%rdx), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$2, %r10d
	je	.LBB0_122
# %bb.117:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rbp), %eax
	addl	$2, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	3(%r11,%r12), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$3, %r10d
	je	.LBB0_122
# %bb.118:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rbp), %eax
	addl	$3, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	3(%r11,%r9), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$4, %r10d
	je	.LBB0_122
# %bb.119:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rbp), %eax
	addl	$4, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-120(%rsp), %rsi                # 8-byte Reload
	leal	3(%r11,%rsi), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$5, %r10d
	je	.LBB0_122
# %bb.120:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rbp), %eax
	addl	$5, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-112(%rsp), %rsi                # 8-byte Reload
	leal	3(%r11,%rsi), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$6, %r10d
	je	.LBB0_122
# %bb.121:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rbp), %eax
	addl	$6, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-128(%rsp), %rsi                # 8-byte Reload
	leal	(%r11,%rsi), %edi
	addl	$3, %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	.p2align	4, 0x90
.LBB0_122:                              #   in Loop: Header=BB0_94 Depth=1
	movq	-64(%rsp), %rsi                 # 8-byte Reload
	leal	(%r14,%rsi), %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	(%r11,%rcx), %edi
	addl	$4, %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$1, %r10d
	je	.LBB0_129
# %bb.123:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rsi), %eax
	incl	%eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	4(%r11,%rdx), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$2, %r10d
	je	.LBB0_129
# %bb.124:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rsi), %eax
	addl	$2, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	4(%r11,%r12), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$3, %r10d
	je	.LBB0_129
# %bb.125:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rsi), %eax
	addl	$3, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	4(%r11,%r9), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$4, %r10d
	je	.LBB0_129
# %bb.126:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rsi), %eax
	addl	$4, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-120(%rsp), %rdi                # 8-byte Reload
	leal	4(%r11,%rdi), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$5, %r10d
	je	.LBB0_129
# %bb.127:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rsi), %eax
	addl	$5, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-112(%rsp), %rdi                # 8-byte Reload
	leal	4(%r11,%rdi), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$6, %r10d
	je	.LBB0_129
# %bb.128:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rsi), %eax
	addl	$6, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-128(%rsp), %rdi                # 8-byte Reload
	addl	%r11d, %edi
	addl	$4, %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	.p2align	4, 0x90
.LBB0_129:                              #   in Loop: Header=BB0_94 Depth=1
	movq	-56(%rsp), %rbp                 # 8-byte Reload
	leal	(%r14,%rbp), %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	(%r11,%rcx), %edi
	addl	$5, %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$1, %r10d
	je	.LBB0_136
# %bb.130:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rbp), %eax
	incl	%eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	5(%r11,%rdx), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$2, %r10d
	je	.LBB0_136
# %bb.131:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rbp), %eax
	addl	$2, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	5(%r11,%r12), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$3, %r10d
	je	.LBB0_136
# %bb.132:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rbp), %eax
	addl	$3, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	5(%r11,%r9), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$4, %r10d
	je	.LBB0_136
# %bb.133:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rbp), %eax
	addl	$4, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-120(%rsp), %rdi                # 8-byte Reload
	leal	5(%r11,%rdi), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$5, %r10d
	je	.LBB0_136
# %bb.134:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rbp), %eax
	addl	$5, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-112(%rsp), %rdi                # 8-byte Reload
	leal	5(%r11,%rdi), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$6, %r10d
	je	.LBB0_136
# %bb.135:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rbp), %eax
	addl	$6, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-128(%rsp), %rdi                # 8-byte Reload
	addl	%r11d, %edi
	addl	$5, %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	.p2align	4, 0x90
.LBB0_136:                              #   in Loop: Header=BB0_94 Depth=1
	movq	-48(%rsp), %rbp                 # 8-byte Reload
	leal	(%r14,%rbp), %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	(%r11,%rcx), %edi
	addl	$6, %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$1, %r10d
	je	.LBB0_143
# %bb.137:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rbp), %eax
	incl	%eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	6(%r11,%rdx), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$2, %r10d
	je	.LBB0_143
# %bb.138:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rbp), %eax
	addl	$2, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	6(%r11,%r12), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$3, %r10d
	je	.LBB0_143
# %bb.139:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rbp), %eax
	addl	$3, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	6(%r11,%r9), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$4, %r10d
	je	.LBB0_143
# %bb.140:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rbp), %eax
	addl	$4, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-120(%rsp), %rdi                # 8-byte Reload
	leal	6(%r11,%rdi), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$5, %r10d
	je	.LBB0_143
# %bb.141:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rbp), %eax
	addl	$5, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-112(%rsp), %rdi                # 8-byte Reload
	leal	6(%r11,%rdi), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$6, %r10d
	je	.LBB0_143
# %bb.142:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%rbp), %eax
	addl	$6, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-128(%rsp), %rdi                # 8-byte Reload
	addl	%r11d, %edi
	addl	$6, %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	.p2align	4, 0x90
.LBB0_143:                              #   in Loop: Header=BB0_94 Depth=1
	movq	%r9, %rbp
	movq	-72(%rsp), %r9                  # 8-byte Reload
	leal	(%r14,%r9), %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	(%r11,%rcx), %edi
	addl	$7, %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$1, %r10d
	je	.LBB0_150
# %bb.144:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%r9), %eax
	incl	%eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	7(%r11,%rdx), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$2, %r10d
	je	.LBB0_150
# %bb.145:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%r9), %eax
	addl	$2, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	7(%r11,%r12), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$3, %r10d
	je	.LBB0_150
# %bb.146:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%r9), %eax
	addl	$3, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	leal	7(%r11,%rbp), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$4, %r10d
	je	.LBB0_150
# %bb.147:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%r9), %eax
	addl	$4, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-120(%rsp), %rdi                # 8-byte Reload
	leal	7(%r11,%rdi), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$5, %r10d
	je	.LBB0_150
# %bb.148:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%r9), %eax
	addl	$5, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-112(%rsp), %rdi                # 8-byte Reload
	leal	7(%r11,%rdi), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	cmpl	$6, %r10d
	je	.LBB0_150
# %bb.149:                              #   in Loop: Header=BB0_94 Depth=1
	leal	(%r14,%r9), %eax
	addl	$6, %eax
	vmovss	(%r8,%rax,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movq	-128(%rsp), %rdi                # 8-byte Reload
	leal	7(%r11,%rdi), %edi
	vmovss	(%r8,%rdi,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r8,%rax,4)
	vmovss	%xmm0, (%r8,%rdi,4)
	jmp	.LBB0_150
.LBB0_23:
	shll	$3, %ebx
	orl	%r11d, %ebx
	xorl	%eax, %eax
	movq	%rax, (%rsp)                    # 8-byte Spill
	movl	%ebx, %r14d
.LBB0_151:
	testl	%r10d, %r10d
	je	.LBB0_168
# %bb.152:
	movq	(%rsp), %rdx                    # 8-byte Reload
	movl	%edx, %esi
	movq	16(%rsp), %rcx                  # 8-byte Reload
	imull	%ecx, %esi
	leal	(%r14,%rsi), %eax
	movl	%r10d, %edi
	leaq	-2(%rdi), %r8
	movq	%r8, 24(%rsp)                   # 8-byte Spill
	leal	1(%rdx,%r14), %r8d
	movq	%r8, 80(%rsp)                   # 8-byte Spill
	movq	%rdi, -128(%rsp)                # 8-byte Spill
	decq	%rdi
	movq	%rdi, 32(%rsp)                  # 8-byte Spill
	leal	1(%rsi,%r14), %edi
	movl	%eax, %eax
	movl	%ecx, %r8d
	movq	%r8, 88(%rsp)                   # 8-byte Spill
	leal	3(%rdx), %r8d
	movq	%r8, -88(%rsp)                  # 8-byte Spill
	leal	(,%rcx,4), %r12d
	movl	%r14d, %r15d
	movl	%esi, %ecx
	leaq	3(%rcx), %r8
	movq	%r8, 48(%rsp)                   # 8-byte Spill
	leal	2(%rdx), %r8d
	movq	%r8, -96(%rsp)                  # 8-byte Spill
	addq	$2, %rcx
	movq	%rcx, 56(%rsp)                  # 8-byte Spill
	leal	1(%rdx), %ecx
	movq	%rcx, 72(%rsp)                  # 8-byte Spill
	incl	%esi
	movq	%rsi, -80(%rsp)                 # 8-byte Spill
	movl	$1, %ecx
	movq	%rcx, -72(%rsp)                 # 8-byte Spill
	xorl	%ecx, %ecx
	movq	%rcx, 40(%rsp)                  # 8-byte Spill
	movl	%edi, -120(%rsp)                # 4-byte Spill
	movl	%edi, 8(%rsp)                   # 4-byte Spill
	xorl	%edx, %edx
	movq	%r12, -56(%rsp)                 # 8-byte Spill
	movq	64(%rsp), %r13                  # 8-byte Reload
	jmp	.LBB0_154
	.p2align	4, 0x90
.LBB0_153:                              #   in Loop: Header=BB0_154 Depth=1
	incq	-72(%rsp)                       # 8-byte Folded Spill
	decq	32(%rsp)                        # 8-byte Folded Spill
	addl	$2, 8(%rsp)                     # 4-byte Folded Spill
	movl	-120(%rsp), %eax                # 4-byte Reload
	addl	112(%rsp), %eax                 # 4-byte Folded Reload
	movl	%eax, -120(%rsp)                # 4-byte Spill
	movq	-64(%rsp), %r14                 # 8-byte Reload
	incl	%r14d
	movq	-104(%rsp), %rax                # 8-byte Reload
	movq	88(%rsp), %rcx                  # 8-byte Reload
	addq	%rcx, %rax
	addq	%rcx, 48(%rsp)                  # 8-byte Folded Spill
	addq	%rcx, 56(%rsp)                  # 8-byte Folded Spill
	addq	%rcx, 40(%rsp)                  # 8-byte Folded Spill
	movl	104(%rsp), %r10d                # 4-byte Reload
	movq	-112(%rsp), %rdx                # 8-byte Reload
	cmpl	%r10d, %edx
	je	.LBB0_168
.LBB0_154:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_160 Depth 2
                                        #     Child Loop BB0_164 Depth 2
                                        #     Child Loop BB0_167 Depth 2
	movq	%rax, -104(%rsp)                # 8-byte Spill
	movq	%r14, -64(%rsp)                 # 8-byte Spill
	leaq	1(%rdx), %rax
	movq	%rax, -112(%rsp)                # 8-byte Spill
	cmpl	%r10d, %eax
	jae	.LBB0_153
# %bb.155:                              #   in Loop: Header=BB0_154 Depth=1
	movq	%rdx, %rcx
	notq	%rcx
	addq	-128(%rsp), %rcx                # 8-byte Folded Reload
	movq	-72(%rsp), %rax                 # 8-byte Reload
	cmpq	$16, %rcx
	jb	.LBB0_162
# %bb.156:                              #   in Loop: Header=BB0_154 Depth=1
	movq	24(%rsp), %rsi                  # 8-byte Reload
	subq	%rdx, %rsi
	movq	80(%rsp), %rax                  # 8-byte Reload
	leal	(%rax,%rdx,2), %eax
	movl	%esi, %edi
	addl	%eax, %edi
	setb	%dil
	movq	-72(%rsp), %rax                 # 8-byte Reload
	cmpl	$1, 16(%rsp)                    # 4-byte Folded Reload
	jne	.LBB0_162
# %bb.157:                              #   in Loop: Header=BB0_154 Depth=1
	movq	-72(%rsp), %rax                 # 8-byte Reload
	testb	%dil, %dil
	jne	.LBB0_162
# %bb.158:                              #   in Loop: Header=BB0_154 Depth=1
	shrq	$32, %rsi
	movq	-72(%rsp), %rax                 # 8-byte Reload
	jne	.LBB0_162
# %bb.159:                              #   in Loop: Header=BB0_154 Depth=1
	movq	32(%rsp), %rsi                  # 8-byte Reload
	andq	$-16, %rsi
	movq	%rcx, %rdi
	andq	$-16, %rdi
	movq	-72(%rsp), %rax                 # 8-byte Reload
	addq	%rdi, %rax
	movl	-120(%rsp), %r8d                # 4-byte Reload
	movl	8(%rsp), %r9d                   # 4-byte Reload
	.p2align	4, 0x90
.LBB0_160:                              #   Parent Loop BB0_154 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%r8d, %r10d
	vmovups	(%r13,%r10,4), %ymm0
	vmovups	32(%r13,%r10,4), %ymm1
	movl	%r9d, %r11d
	vmovups	(%r13,%r11,4), %ymm2
	vmovups	32(%r13,%r11,4), %ymm3
	vmovups	%ymm2, (%r13,%r10,4)
	vmovups	%ymm3, 32(%r13,%r10,4)
	vmovups	%ymm0, (%r13,%r11,4)
	vmovups	%ymm1, 32(%r13,%r11,4)
	addl	$16, %r9d
	addl	$16, %r8d
	addq	$-16, %rsi
	jne	.LBB0_160
# %bb.161:                              #   in Loop: Header=BB0_154 Depth=1
	cmpq	%rdi, %rcx
	je	.LBB0_153
	.p2align	4, 0x90
.LBB0_162:                              #   in Loop: Header=BB0_154 Depth=1
	movq	-128(%rsp), %rcx                # 8-byte Reload
                                        # kill: def $ecx killed $ecx killed $rcx def $rcx
	subl	%eax, %ecx
	movq	%rax, %r10
	andl	$3, %ecx
	movq	16(%rsp), %r9                   # 8-byte Reload
	movq	-104(%rsp), %rbx                # 8-byte Reload
	je	.LBB0_165
# %bb.163:                              # %.preheader1
                                        #   in Loop: Header=BB0_154 Depth=1
	movq	(%rsp), %rsi                    # 8-byte Reload
	addl	%eax, %esi
	imull	%r9d, %esi
	addl	-64(%rsp), %esi                 # 4-byte Folded Reload
	movq	%rax, %r10
	.p2align	4, 0x90
.LBB0_164:                              #   Parent Loop BB0_154 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	(%rbx,%r10), %edi
	vmovss	(%r13,%rdi,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movl	%esi, %r8d
	vmovss	(%r13,%r8,4), %xmm1             # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r13,%rdi,4)
	vmovss	%xmm0, (%r13,%r8,4)
	incq	%r10
	addl	%r9d, %esi
	decq	%rcx
	jne	.LBB0_164
.LBB0_165:                              #   in Loop: Header=BB0_154 Depth=1
	notq	%rax
	addq	-128(%rsp), %rax                # 8-byte Folded Reload
	cmpq	$3, %rax
	jb	.LBB0_153
# %bb.166:                              # %.preheader
                                        #   in Loop: Header=BB0_154 Depth=1
	movq	-88(%rsp), %rax                 # 8-byte Reload
	leal	(%rax,%r10), %edi
	movq	16(%rsp), %rsi                  # 8-byte Reload
	imull	%esi, %edi
	addl	-64(%rsp), %edi                 # 4-byte Folded Reload
	leaq	(%r15,%r10), %rax
	movq	%rax, -32(%rsp)                 # 8-byte Spill
	movq	-96(%rsp), %rax                 # 8-byte Reload
	leal	(%rax,%r10), %r14d
	imull	%esi, %r14d
	addl	%edx, %r14d
	movq	72(%rsp), %rax                  # 8-byte Reload
	leal	(%rax,%r10), %r9d
	imull	%esi, %r9d
	addl	%edx, %r9d
	movq	-80(%rsp), %rcx                 # 8-byte Reload
	addl	%r10d, %ecx
	movq	40(%rsp), %rax                  # 8-byte Reload
	addq	%r15, %rax
	movq	%rax, -48(%rsp)                 # 8-byte Spill
	movq	(%rsp), %r8                     # 8-byte Reload
	leal	(%r8,%r10), %ebp
	imull	%esi, %ebp
	addl	%edx, %ebp
	movq	-104(%rsp), %rdx                # 8-byte Reload
	movq	56(%rsp), %rsi                  # 8-byte Reload
	movq	48(%rsp), %r11                  # 8-byte Reload
	movq	-128(%rsp), %r8                 # 8-byte Reload
	.p2align	4, 0x90
.LBB0_167:                              #   Parent Loop BB0_154 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	(%r10,%rdx), %ebx
	vmovss	(%r13,%rbx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	%r15, %r12
	addl	%ebp, %r15d
	vmovss	(%r13,%r15,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r13,%rbx,4)
	vmovss	%xmm0, (%r13,%r15,4)
	movq	-48(%rsp), %rax                 # 8-byte Reload
	leal	(%rax,%rcx), %ebx
	vmovss	(%r13,%rbx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	(%r9,%r12), %r15d
	vmovss	(%r13,%r15,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r13,%rbx,4)
	vmovss	%xmm0, (%r13,%r15,4)
	movq	-32(%rsp), %rax                 # 8-byte Reload
	leal	(%rax,%rsi), %ebx
	vmovss	(%r13,%rbx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	(%r14,%r12), %r15d
	vmovss	(%r13,%r15,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r13,%rbx,4)
	vmovss	%xmm0, (%r13,%r15,4)
	leal	(%rax,%r11), %ebx
	vmovss	(%r13,%rbx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movl	%edi, %r15d
	vmovss	(%r13,%r15,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%r13,%rbx,4)
	vmovss	%xmm0, (%r13,%r15,4)
	movq	%r12, %r15
	movq	-56(%rsp), %r12                 # 8-byte Reload
	addq	$-4, %r8
	addl	%r12d, %edi
	addq	$4, %r11
	addq	%r12, %r14
	addq	$4, %rsi
	addq	%r12, %r9
	addq	$4, %rcx
	addq	%r12, %rbp
	addq	$4, %rdx
	cmpq	%r8, %r10
	jne	.LBB0_167
	jmp	.LBB0_153
.LBB0_168:
	addq	$304, %rsp                      # imm = 0x130
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	vzeroupper
	retq
.LBB0_26:
	.cfi_def_cfa_offset 360
	movl	%r11d, %ecx
	movq	16(%rsp), %rax                  # 8-byte Reload
	imull	%eax, %ecx
	movl	%ecx, 264(%rsp)                 # 4-byte Spill
	leal	(%rax,%rax,2), %r12d
	leal	(%rax,%rax,4), %r13d
	movq	-48(%rsp), %rsi                 # 8-byte Reload
	leal	(%rsi,%rsi,2), %ebp
	cmpl	$1, %r9d
	adcl	$0, %r9d
	movl	%ebx, %ecx
	shlq	$5, %rcx
	movq	%rcx, 80(%rsp)                  # 8-byte Spill
	movq	64(%rsp), %rcx                  # 8-byte Reload
	movq	-56(%rsp), %rdx                 # 8-byte Reload
	leaq	(%rcx,%rdx,4), %rdx
	movq	%rdx, 200(%rsp)                 # 8-byte Spill
	leaq	(%rcx,%rbp,4), %rdx
	movq	%rdx, 192(%rsp)                 # 8-byte Spill
	leal	(%r11,%rbx,8), %edx
	leal	(%r11,%rbx,8), %edi
	addl	$6, %edi
	imull	%eax, %edi
	movq	%rdi, -24(%rsp)                 # 8-byte Spill
	leal	(%r11,%rbx,8), %edi
	addl	$5, %edi
	imull	%eax, %edi
	movq	%rdi, -16(%rsp)                 # 8-byte Spill
	leal	(%r11,%rbx,8), %edi
	addl	$4, %edi
	imull	%eax, %edi
	movq	%rdi, -8(%rsp)                  # 8-byte Spill
	leal	(%r11,%rbx,8), %edi
	addl	$3, %edi
	imull	%eax, %edi
	movq	%rdi, -40(%rsp)                 # 8-byte Spill
	leal	(%r11,%rbx,8), %edi
	addl	$2, %edi
	imull	%eax, %edi
	movq	%rdi, -96(%rsp)                 # 8-byte Spill
	leal	(%r11,%rbx,8), %edi
	incl	%edi
	imull	%eax, %edi
	movq	%rdi, -88(%rsp)                 # 8-byte Spill
                                        # kill: def $eax killed $eax killed $rax def $rax
	movl	%edx, 100(%rsp)                 # 4-byte Spill
	imull	%edx, %eax
	movq	%rax, -80(%rsp)                 # 8-byte Spill
	leaq	(%rcx,%r13,4), %rax
	movq	%rax, 256(%rsp)                 # 8-byte Spill
	movq	-120(%rsp), %rax                # 8-byte Reload
	leaq	(%rcx,%rax,4), %rax
	movq	%rax, 240(%rsp)                 # 8-byte Spill
	leaq	(%rcx,%r12,4), %rax
	movq	%rax, 232(%rsp)                 # 8-byte Spill
	leaq	(%rcx,%rsi,4), %rax
	movq	%rax, 288(%rsp)                 # 8-byte Spill
	leaq	(%rcx,%r15,4), %rax
	movq	%rax, 280(%rsp)                 # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 184(%rsp)                 # 8-byte Spill
	movl	%r11d, %eax
	movl	%r11d, 176(%rsp)                # 4-byte Spill
	movl	%r10d, 104(%rsp)                # 4-byte Spill
	movq	%r11, 168(%rsp)                 # 8-byte Spill
	movq	%rbx, 160(%rsp)                 # 8-byte Spill
	movq	%r9, 248(%rsp)                  # 8-byte Spill
	movq	%r12, -104(%rsp)                # 8-byte Spill
	movq	%r13, 24(%rsp)                  # 8-byte Spill
	movq	%rbp, -64(%rsp)                 # 8-byte Spill
	jmp	.LBB0_27
	.p2align	4, 0x90
.LBB0_91:                               #   in Loop: Header=BB0_27 Depth=1
	movq	184(%rsp), %rcx                 # 8-byte Reload
	incq	%rcx
	movq	296(%rsp), %rax                 # 8-byte Reload
	addl	%eax, 176(%rsp)                 # 4-byte Folded Spill
	addl	%eax, 100(%rsp)                 # 4-byte Folded Spill
	movq	-24(%rsp), %rax                 # 8-byte Reload
	addl	$32, %eax
	movq	%rax, -24(%rsp)                 # 8-byte Spill
	movq	-16(%rsp), %rax                 # 8-byte Reload
	addl	$32, %eax
	movq	%rax, -16(%rsp)                 # 8-byte Spill
	movq	-8(%rsp), %rax                  # 8-byte Reload
	addl	$32, %eax
	movq	%rax, -8(%rsp)                  # 8-byte Spill
	movq	-40(%rsp), %rax                 # 8-byte Reload
	addl	$32, %eax
	movq	%rax, -40(%rsp)                 # 8-byte Spill
	movq	-96(%rsp), %rax                 # 8-byte Reload
	addl	$32, %eax
	movq	%rax, -96(%rsp)                 # 8-byte Spill
	movq	-88(%rsp), %rax                 # 8-byte Reload
	addl	$32, %eax
	movq	%rax, -88(%rsp)                 # 8-byte Spill
	movq	-80(%rsp), %rax                 # 8-byte Reload
	addl	$32, %eax
	movq	%rax, -80(%rsp)                 # 8-byte Spill
	movq	%rcx, %rax
	movq	%rcx, 184(%rsp)                 # 8-byte Spill
	cmpq	%r9, %rcx
	movq	160(%rsp), %rbx                 # 8-byte Reload
	je	.LBB0_17
.LBB0_27:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_29 Depth 2
                                        #       Child Loop BB0_30 Depth 3
                                        #     Child Loop BB0_34 Depth 2
	testl	%ebx, %ebx
	je	.LBB0_32
# %bb.28:                               # %.preheader7
                                        #   in Loop: Header=BB0_27 Depth=1
	movl	176(%rsp), %edx                 # 4-byte Reload
	shlq	$2, %rdx
	movq	184(%rsp), %rax                 # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax def $rax
	shll	$5, %eax
	addl	264(%rsp), %eax                 # 4-byte Folded Reload
	movq	64(%rsp), %rcx                  # 8-byte Reload
	leaq	(%rcx,%rax,4), %rax
	movq	%rax, 136(%rsp)                 # 8-byte Spill
	leaq	(%rcx,%rdx), %rax
	movq	%rax, 128(%rsp)                 # 8-byte Spill
	movq	200(%rsp), %rax                 # 8-byte Reload
	addq	%rdx, %rax
	movq	%rax, 120(%rsp)                 # 8-byte Spill
	movq	192(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rdx), %rax
	movq	%rax, 112(%rsp)                 # 8-byte Spill
	movq	256(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rdx), %rax
	movq	%rax, 272(%rsp)                 # 8-byte Spill
	movq	240(%rsp), %rax                 # 8-byte Reload
	addq	%rdx, %rax
	movq	%rax, 224(%rsp)                 # 8-byte Spill
	movq	232(%rsp), %rax                 # 8-byte Reload
	addq	%rdx, %rax
	movq	%rax, 216(%rsp)                 # 8-byte Spill
	movq	288(%rsp), %rax                 # 8-byte Reload
	addq	%rdx, %rax
	movq	%rax, 208(%rsp)                 # 8-byte Spill
	addq	280(%rsp), %rdx                 # 8-byte Folded Reload
	movq	%rdx, 144(%rsp)                 # 8-byte Spill
	xorl	%eax, %eax
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB0_29:                               #   Parent Loop BB0_27 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_30 Depth 3
	movq	%rax, 72(%rsp)                  # 8-byte Spill
	movl	%eax, %edi
	movq	128(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rdi,4), %rax
	movq	%rax, -112(%rsp)                # 8-byte Spill
	movq	120(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rdi,4), %rax
	movq	%rax, -128(%rsp)                # 8-byte Spill
	movq	112(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rdi,4), %rax
	movq	%rax, 56(%rsp)                  # 8-byte Spill
	movq	272(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rdi,4), %rax
	movq	%rax, 48(%rsp)                  # 8-byte Spill
	movq	224(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rdi,4), %rax
	movq	%rax, 40(%rsp)                  # 8-byte Spill
	movq	216(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rdi,4), %rax
	movq	%rax, 32(%rsp)                  # 8-byte Spill
	movq	208(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rdi,4), %rax
	movq	%rax, 8(%rsp)                   # 8-byte Spill
	movq	144(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rdi,4), %rax
	movq	%rax, 88(%rsp)                  # 8-byte Spill
	movq	%r15, 152(%rsp)                 # 8-byte Spill
	shlq	$5, %r15
	addq	136(%rsp), %r15                 # 8-byte Folded Reload
	movq	%r15, (%rsp)                    # 8-byte Spill
	xorl	%r14d, %r14d
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB0_30:                               #   Parent Loop BB0_27 Depth=1
                                        #     Parent Loop BB0_29 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-112(%rsp), %r10                # 8-byte Reload
	vmovups	(%r10,%rdi), %ymm0
	movq	88(%rsp), %rdx                  # 8-byte Reload
	vmovups	(%rdx,%rdi), %ymm4
	movq	8(%rsp), %rax                   # 8-byte Reload
	vmovups	(%rax,%rdi), %ymm1
	movq	32(%rsp), %r8                   # 8-byte Reload
	vmovups	(%r8,%rdi), %ymm5
	movq	40(%rsp), %rsi                  # 8-byte Reload
	vmovups	(%rsi,%rdi), %ymm2
	movq	48(%rsp), %r13                  # 8-byte Reload
	vmovups	(%r13,%rdi), %ymm6
	movq	56(%rsp), %rbx                  # 8-byte Reload
	vmovups	(%rbx,%rdi), %ymm3
	movl	%r14d, %r12d
	movq	(%rsp), %rcx                    # 8-byte Reload
	leaq	(%rcx,%r12,4), %r9
	vmovups	(%rcx,%r12,4), %ymm7
	movq	-32(%rsp), %r11                 # 8-byte Reload
	vmovups	(%r9,%r11,4), %ymm8
	movq	-48(%rsp), %r11                 # 8-byte Reload
	vmovups	(%r9,%r11,4), %ymm9
	movq	-104(%rsp), %r11                # 8-byte Reload
	vmovups	(%r9,%r11,4), %ymm10
	movq	-120(%rsp), %r15                # 8-byte Reload
	vmovups	(%r9,%r15,4), %ymm11
	movq	24(%rsp), %rbp                  # 8-byte Reload
	vmovups	(%r9,%rbp,4), %ymm12
	movq	-64(%rsp), %r11                 # 8-byte Reload
	vmovups	(%r9,%r11,4), %ymm13
	movq	-56(%rsp), %r11                 # 8-byte Reload
	vmovups	(%r9,%r11,4), %ymm14
	vpunpckldq	%ymm8, %ymm7, %ymm15    # ymm15 = ymm7[0],ymm8[0],ymm7[1],ymm8[1],ymm7[4],ymm8[4],ymm7[5],ymm8[5]
	vpunpckhdq	%ymm8, %ymm7, %ymm7     # ymm7 = ymm7[2],ymm8[2],ymm7[3],ymm8[3],ymm7[6],ymm8[6],ymm7[7],ymm8[7]
	vpunpckldq	%ymm10, %ymm9, %ymm8    # ymm8 = ymm9[0],ymm10[0],ymm9[1],ymm10[1],ymm9[4],ymm10[4],ymm9[5],ymm10[5]
	vpunpckhdq	%ymm10, %ymm9, %ymm9    # ymm9 = ymm9[2],ymm10[2],ymm9[3],ymm10[3],ymm9[6],ymm10[6],ymm9[7],ymm10[7]
	vpunpckldq	%ymm12, %ymm11, %ymm10  # ymm10 = ymm11[0],ymm12[0],ymm11[1],ymm12[1],ymm11[4],ymm12[4],ymm11[5],ymm12[5]
	vpunpckhdq	%ymm12, %ymm11, %ymm11  # ymm11 = ymm11[2],ymm12[2],ymm11[3],ymm12[3],ymm11[6],ymm12[6],ymm11[7],ymm12[7]
	vpunpckldq	%ymm14, %ymm13, %ymm12  # ymm12 = ymm13[0],ymm14[0],ymm13[1],ymm14[1],ymm13[4],ymm14[4],ymm13[5],ymm14[5]
	vpunpckhdq	%ymm14, %ymm13, %ymm13  # ymm13 = ymm13[2],ymm14[2],ymm13[3],ymm14[3],ymm13[6],ymm14[6],ymm13[7],ymm14[7]
	vpunpcklqdq	%ymm8, %ymm15, %ymm14   # ymm14 = ymm15[0],ymm8[0],ymm15[2],ymm8[2]
	vpunpckhqdq	%ymm8, %ymm15, %ymm8    # ymm8 = ymm15[1],ymm8[1],ymm15[3],ymm8[3]
	vpunpcklqdq	%ymm12, %ymm10, %ymm15  # ymm15 = ymm10[0],ymm12[0],ymm10[2],ymm12[2]
	vpunpckhqdq	%ymm12, %ymm10, %ymm10  # ymm10 = ymm10[1],ymm12[1],ymm10[3],ymm12[3]
	vpunpcklqdq	%ymm9, %ymm7, %ymm12    # ymm12 = ymm7[0],ymm9[0],ymm7[2],ymm9[2]
	vpunpckhqdq	%ymm9, %ymm7, %ymm7     # ymm7 = ymm7[1],ymm9[1],ymm7[3],ymm9[3]
	vpunpcklqdq	%ymm13, %ymm11, %ymm9   # ymm9 = ymm11[0],ymm13[0],ymm11[2],ymm13[2]
	vpunpckhqdq	%ymm13, %ymm11, %ymm11  # ymm11 = ymm11[1],ymm13[1],ymm11[3],ymm13[3]
	vinsertf128	$1, %xmm15, %ymm14, %ymm13
	vperm2f128	$49, %ymm15, %ymm14, %ymm14 # ymm14 = ymm14[2,3],ymm15[2,3]
	movq	-128(%rsp), %r11                # 8-byte Reload
	vmovups	(%r11,%rdi), %ymm15
	vmovups	%ymm13, (%r10,%rdi)
	vmovups	%ymm14, (%rsi,%rdi)
	vinsertf128	$1, %xmm10, %ymm8, %ymm13
	vperm2f128	$49, %ymm10, %ymm8, %ymm8 # ymm8 = ymm8[2,3],ymm10[2,3]
	vmovups	%ymm13, (%rdx,%rdi)
	vmovups	%ymm8, (%r13,%rdi)
	vinsertf128	$1, %xmm9, %ymm12, %ymm8
	vperm2f128	$49, %ymm9, %ymm12, %ymm9 # ymm9 = ymm12[2,3],ymm9[2,3]
	vmovups	%ymm8, (%rax,%rdi)
	vmovups	%ymm9, (%rbx,%rdi)
	vinsertf128	$1, %xmm11, %ymm7, %ymm8
	vperm2f128	$49, %ymm11, %ymm7, %ymm7 # ymm7 = ymm7[2,3],ymm11[2,3]
	vmovups	%ymm8, (%r8,%rdi)
	vmovups	%ymm7, (%r11,%rdi)
	vpunpckldq	%ymm4, %ymm0, %ymm7     # ymm7 = ymm0[0],ymm4[0],ymm0[1],ymm4[1],ymm0[4],ymm4[4],ymm0[5],ymm4[5]
	vpunpckhdq	%ymm4, %ymm0, %ymm0     # ymm0 = ymm0[2],ymm4[2],ymm0[3],ymm4[3],ymm0[6],ymm4[6],ymm0[7],ymm4[7]
	vpunpckldq	%ymm5, %ymm1, %ymm4     # ymm4 = ymm1[0],ymm5[0],ymm1[1],ymm5[1],ymm1[4],ymm5[4],ymm1[5],ymm5[5]
	vpunpckhdq	%ymm5, %ymm1, %ymm1     # ymm1 = ymm1[2],ymm5[2],ymm1[3],ymm5[3],ymm1[6],ymm5[6],ymm1[7],ymm5[7]
	vpunpckldq	%ymm6, %ymm2, %ymm5     # ymm5 = ymm2[0],ymm6[0],ymm2[1],ymm6[1],ymm2[4],ymm6[4],ymm2[5],ymm6[5]
	vpunpckhdq	%ymm6, %ymm2, %ymm2     # ymm2 = ymm2[2],ymm6[2],ymm2[3],ymm6[3],ymm2[6],ymm6[6],ymm2[7],ymm6[7]
	vpunpckldq	%ymm15, %ymm3, %ymm6    # ymm6 = ymm3[0],ymm15[0],ymm3[1],ymm15[1],ymm3[4],ymm15[4],ymm3[5],ymm15[5]
	vpunpckhdq	%ymm15, %ymm3, %ymm3    # ymm3 = ymm3[2],ymm15[2],ymm3[3],ymm15[3],ymm3[6],ymm15[6],ymm3[7],ymm15[7]
	vpunpcklqdq	%ymm4, %ymm7, %ymm8     # ymm8 = ymm7[0],ymm4[0],ymm7[2],ymm4[2]
	vpunpckhqdq	%ymm4, %ymm7, %ymm4     # ymm4 = ymm7[1],ymm4[1],ymm7[3],ymm4[3]
	vpunpcklqdq	%ymm6, %ymm5, %ymm7     # ymm7 = ymm5[0],ymm6[0],ymm5[2],ymm6[2]
	vpunpckhqdq	%ymm6, %ymm5, %ymm5     # ymm5 = ymm5[1],ymm6[1],ymm5[3],ymm6[3]
	vpunpcklqdq	%ymm1, %ymm0, %ymm6     # ymm6 = ymm0[0],ymm1[0],ymm0[2],ymm1[2]
	vpunpckhqdq	%ymm1, %ymm0, %ymm0     # ymm0 = ymm0[1],ymm1[1],ymm0[3],ymm1[3]
	vpunpcklqdq	%ymm3, %ymm2, %ymm1     # ymm1 = ymm2[0],ymm3[0],ymm2[2],ymm3[2]
	vpunpckhqdq	%ymm3, %ymm2, %ymm2     # ymm2 = ymm2[1],ymm3[1],ymm2[3],ymm3[3]
	vinsertf128	$1, %xmm7, %ymm8, %ymm3
	vmovups	%ymm3, (%rcx,%r12,4)
	vperm2f128	$49, %ymm7, %ymm8, %ymm3 # ymm3 = ymm8[2,3],ymm7[2,3]
	vmovups	%ymm3, (%r9,%r15,4)
	vinsertf128	$1, %xmm5, %ymm4, %ymm3
	movq	-32(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm3, (%r9,%rax,4)
	vperm2f128	$49, %ymm5, %ymm4, %ymm3 # ymm3 = ymm4[2,3],ymm5[2,3]
	vmovups	%ymm3, (%r9,%rbp,4)
	vinsertf128	$1, %xmm1, %ymm6, %ymm3
	movq	-48(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm3, (%r9,%rax,4)
	vperm2f128	$49, %ymm1, %ymm6, %ymm1 # ymm1 = ymm6[2,3],ymm1[2,3]
	movq	-64(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm1, (%r9,%rax,4)
	vinsertf128	$1, %xmm2, %ymm0, %ymm1
	movq	-104(%rsp), %rax                # 8-byte Reload
	vmovups	%ymm1, (%r9,%rax,4)
	vperm2f128	$49, %ymm2, %ymm0, %ymm0 # ymm0 = ymm0[2,3],ymm2[2,3]
	movq	-56(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm0, (%r9,%rax,4)
	addq	$32, %rdi
	addl	-72(%rsp), %r14d                # 4-byte Folded Reload
	cmpq	%rdi, 80(%rsp)                  # 8-byte Folded Reload
	jne	.LBB0_30
# %bb.31:                               #   in Loop: Header=BB0_29 Depth=2
	movq	152(%rsp), %r15                 # 8-byte Reload
	incq	%r15
	movq	72(%rsp), %rax                  # 8-byte Reload
	addl	-72(%rsp), %eax                 # 4-byte Folded Reload
	cmpq	$4, %r15
	jne	.LBB0_29
.LBB0_32:                               #   in Loop: Header=BB0_27 Depth=1
	movl	104(%rsp), %r10d                # 4-byte Reload
	testl	%r10d, %r10d
	movq	16(%rsp), %rdx                  # 8-byte Reload
	movq	64(%rsp), %rdi                  # 8-byte Reload
	movq	168(%rsp), %r11                 # 8-byte Reload
	movq	248(%rsp), %r9                  # 8-byte Reload
	movq	-48(%rsp), %rbx                 # 8-byte Reload
	movq	-120(%rsp), %rsi                # 8-byte Reload
	movq	-56(%rsp), %r14                 # 8-byte Reload
	movq	-104(%rsp), %r12                # 8-byte Reload
	movq	24(%rsp), %r13                  # 8-byte Reload
	movq	-64(%rsp), %rbp                 # 8-byte Reload
	je	.LBB0_91
# %bb.33:                               # %.preheader5
                                        #   in Loop: Header=BB0_27 Depth=1
	xorl	%r8d, %r8d
	movl	100(%rsp), %eax                 # 4-byte Reload
	movl	%eax, %r15d
	jmp	.LBB0_34
	.p2align	4, 0x90
.LBB0_90:                               #   in Loop: Header=BB0_34 Depth=2
	addl	$8, %r8d
	addl	-72(%rsp), %r15d                # 4-byte Folded Reload
	cmpl	$32, %r8d
	je	.LBB0_91
.LBB0_34:                               #   Parent Loop BB0_27 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-80(%rsp), %rax                 # 8-byte Reload
	addl	%r8d, %eax
	movl	%r15d, %ecx
	vmovss	(%rdi,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	(%rdi,%rax,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rcx,4)
	vmovss	%xmm0, (%rdi,%rax,4)
	cmpl	$1, %r10d
	je	.LBB0_41
# %bb.35:                               #   in Loop: Header=BB0_34 Depth=2
	leal	1(%r15), %eax
	movq	-88(%rsp), %rcx                 # 8-byte Reload
	addl	%r8d, %ecx
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$2, %r10d
	je	.LBB0_41
# %bb.36:                               #   in Loop: Header=BB0_34 Depth=2
	leal	2(%r15), %eax
	movq	-96(%rsp), %rcx                 # 8-byte Reload
	addl	%r8d, %ecx
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$3, %r10d
	je	.LBB0_41
# %bb.37:                               #   in Loop: Header=BB0_34 Depth=2
	leal	3(%r15), %eax
	movq	-40(%rsp), %rcx                 # 8-byte Reload
	addl	%r8d, %ecx
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$4, %r10d
	je	.LBB0_41
# %bb.38:                               #   in Loop: Header=BB0_34 Depth=2
	leal	4(%r15), %eax
	movq	-8(%rsp), %rcx                  # 8-byte Reload
	addl	%r8d, %ecx
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$5, %r10d
	je	.LBB0_41
# %bb.39:                               #   in Loop: Header=BB0_34 Depth=2
	leal	5(%r15), %eax
	movq	-16(%rsp), %rcx                 # 8-byte Reload
	addl	%r8d, %ecx
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$6, %r10d
	je	.LBB0_41
# %bb.40:                               #   in Loop: Header=BB0_34 Depth=2
	leal	6(%r15), %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-24(%rsp), %rcx                 # 8-byte Reload
	addl	%r8d, %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	.p2align	4, 0x90
.LBB0_41:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%rdx,%r15), %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-80(%rsp), %rcx                 # 8-byte Reload
	addl	%r8d, %ecx
	incl	%ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$1, %r10d
	je	.LBB0_48
# %bb.42:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%rdx,%r15), %eax
	incl	%eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-88(%rsp), %rcx                 # 8-byte Reload
	leal	1(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$2, %r10d
	je	.LBB0_48
# %bb.43:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%rdx,%r15), %eax
	addl	$2, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-96(%rsp), %rcx                 # 8-byte Reload
	leal	1(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$3, %r10d
	je	.LBB0_48
# %bb.44:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%rdx,%r15), %eax
	addl	$3, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-40(%rsp), %rcx                 # 8-byte Reload
	leal	1(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$4, %r10d
	je	.LBB0_48
# %bb.45:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%rdx,%r15), %eax
	addl	$4, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-8(%rsp), %rcx                  # 8-byte Reload
	leal	1(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$5, %r10d
	je	.LBB0_48
# %bb.46:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%rdx,%r15), %eax
	addl	$5, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-16(%rsp), %rcx                 # 8-byte Reload
	leal	1(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$6, %r10d
	je	.LBB0_48
# %bb.47:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%rdx,%r15), %eax
	addl	$6, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-24(%rsp), %rcx                 # 8-byte Reload
	addl	%r8d, %ecx
	incl	%ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	.p2align	4, 0x90
.LBB0_48:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%rbx,%r15), %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-80(%rsp), %rcx                 # 8-byte Reload
	addl	%r8d, %ecx
	addl	$2, %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$1, %r10d
	je	.LBB0_55
# %bb.49:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%rbx,%r15), %eax
	incl	%eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-88(%rsp), %rcx                 # 8-byte Reload
	leal	2(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$2, %r10d
	je	.LBB0_55
# %bb.50:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%rbx,%r15), %eax
	addl	$2, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-96(%rsp), %rcx                 # 8-byte Reload
	leal	2(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$3, %r10d
	je	.LBB0_55
# %bb.51:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%rbx,%r15), %eax
	addl	$3, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-40(%rsp), %rcx                 # 8-byte Reload
	leal	2(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$4, %r10d
	je	.LBB0_55
# %bb.52:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%rbx,%r15), %eax
	addl	$4, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-8(%rsp), %rcx                  # 8-byte Reload
	leal	2(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$5, %r10d
	je	.LBB0_55
# %bb.53:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%rbx,%r15), %eax
	addl	$5, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-16(%rsp), %rcx                 # 8-byte Reload
	leal	2(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$6, %r10d
	je	.LBB0_55
# %bb.54:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%rbx,%r15), %eax
	addl	$6, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-24(%rsp), %rcx                 # 8-byte Reload
	addl	%r8d, %ecx
	addl	$2, %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	.p2align	4, 0x90
.LBB0_55:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r12,%r15), %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-80(%rsp), %rcx                 # 8-byte Reload
	addl	%r8d, %ecx
	addl	$3, %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$1, %r10d
	je	.LBB0_62
# %bb.56:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r12,%r15), %eax
	incl	%eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-88(%rsp), %rcx                 # 8-byte Reload
	leal	3(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$2, %r10d
	je	.LBB0_62
# %bb.57:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r12,%r15), %eax
	addl	$2, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-96(%rsp), %rcx                 # 8-byte Reload
	leal	3(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$3, %r10d
	je	.LBB0_62
# %bb.58:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r12,%r15), %eax
	addl	$3, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-40(%rsp), %rcx                 # 8-byte Reload
	leal	3(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$4, %r10d
	je	.LBB0_62
# %bb.59:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r12,%r15), %eax
	addl	$4, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-8(%rsp), %rcx                  # 8-byte Reload
	leal	3(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$5, %r10d
	je	.LBB0_62
# %bb.60:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r12,%r15), %eax
	addl	$5, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-16(%rsp), %rcx                 # 8-byte Reload
	leal	3(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$6, %r10d
	je	.LBB0_62
# %bb.61:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r12,%r15), %eax
	addl	$6, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-24(%rsp), %rcx                 # 8-byte Reload
	addl	%r8d, %ecx
	addl	$3, %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	.p2align	4, 0x90
.LBB0_62:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%rsi,%r15), %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-80(%rsp), %rcx                 # 8-byte Reload
	addl	%r8d, %ecx
	addl	$4, %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$1, %r10d
	je	.LBB0_69
# %bb.63:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%rsi,%r15), %eax
	incl	%eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-88(%rsp), %rcx                 # 8-byte Reload
	leal	4(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$2, %r10d
	je	.LBB0_69
# %bb.64:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%rsi,%r15), %eax
	addl	$2, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-96(%rsp), %rcx                 # 8-byte Reload
	leal	4(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$3, %r10d
	je	.LBB0_69
# %bb.65:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%rsi,%r15), %eax
	addl	$3, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-40(%rsp), %rcx                 # 8-byte Reload
	leal	4(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$4, %r10d
	je	.LBB0_69
# %bb.66:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%rsi,%r15), %eax
	addl	$4, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-8(%rsp), %rcx                  # 8-byte Reload
	leal	4(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$5, %r10d
	je	.LBB0_69
# %bb.67:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%rsi,%r15), %eax
	addl	$5, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-16(%rsp), %rcx                 # 8-byte Reload
	leal	4(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$6, %r10d
	je	.LBB0_69
# %bb.68:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%rsi,%r15), %eax
	addl	$6, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-24(%rsp), %rcx                 # 8-byte Reload
	addl	%r8d, %ecx
	addl	$4, %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	.p2align	4, 0x90
.LBB0_69:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r15,%r13), %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-80(%rsp), %rcx                 # 8-byte Reload
	addl	%r8d, %ecx
	addl	$5, %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$1, %r10d
	je	.LBB0_76
# %bb.70:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r15,%r13), %eax
	incl	%eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-88(%rsp), %rcx                 # 8-byte Reload
	leal	5(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$2, %r10d
	je	.LBB0_76
# %bb.71:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r15,%r13), %eax
	addl	$2, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-96(%rsp), %rcx                 # 8-byte Reload
	leal	5(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$3, %r10d
	je	.LBB0_76
# %bb.72:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r15,%r13), %eax
	addl	$3, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-40(%rsp), %rcx                 # 8-byte Reload
	leal	5(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$4, %r10d
	je	.LBB0_76
# %bb.73:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r15,%r13), %eax
	addl	$4, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-8(%rsp), %rcx                  # 8-byte Reload
	leal	5(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$5, %r10d
	je	.LBB0_76
# %bb.74:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r15,%r13), %eax
	addl	$5, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-16(%rsp), %rcx                 # 8-byte Reload
	leal	5(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$6, %r10d
	je	.LBB0_76
# %bb.75:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r15,%r13), %eax
	addl	$6, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-24(%rsp), %rcx                 # 8-byte Reload
	addl	%r8d, %ecx
	addl	$5, %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	.p2align	4, 0x90
.LBB0_76:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r15,%rbp), %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-80(%rsp), %rcx                 # 8-byte Reload
	addl	%r8d, %ecx
	addl	$6, %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$1, %r10d
	je	.LBB0_83
# %bb.77:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r15,%rbp), %eax
	incl	%eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-88(%rsp), %rcx                 # 8-byte Reload
	leal	6(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$2, %r10d
	je	.LBB0_83
# %bb.78:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r15,%rbp), %eax
	addl	$2, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-96(%rsp), %rcx                 # 8-byte Reload
	leal	6(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$3, %r10d
	je	.LBB0_83
# %bb.79:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r15,%rbp), %eax
	addl	$3, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-40(%rsp), %rcx                 # 8-byte Reload
	leal	6(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$4, %r10d
	je	.LBB0_83
# %bb.80:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r15,%rbp), %eax
	addl	$4, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-8(%rsp), %rcx                  # 8-byte Reload
	leal	6(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$5, %r10d
	je	.LBB0_83
# %bb.81:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r15,%rbp), %eax
	addl	$5, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-16(%rsp), %rcx                 # 8-byte Reload
	leal	6(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$6, %r10d
	je	.LBB0_83
# %bb.82:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r15,%rbp), %eax
	addl	$6, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-24(%rsp), %rcx                 # 8-byte Reload
	addl	%r8d, %ecx
	addl	$6, %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	.p2align	4, 0x90
.LBB0_83:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r14,%r15), %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-80(%rsp), %rcx                 # 8-byte Reload
	addl	%r8d, %ecx
	addl	$7, %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$1, %r10d
	je	.LBB0_90
# %bb.84:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r14,%r15), %eax
	incl	%eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-88(%rsp), %rcx                 # 8-byte Reload
	leal	7(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$2, %r10d
	je	.LBB0_90
# %bb.85:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r14,%r15), %eax
	addl	$2, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-96(%rsp), %rcx                 # 8-byte Reload
	leal	7(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$3, %r10d
	je	.LBB0_90
# %bb.86:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r14,%r15), %eax
	addl	$3, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-40(%rsp), %rcx                 # 8-byte Reload
	leal	7(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$4, %r10d
	je	.LBB0_90
# %bb.87:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r14,%r15), %eax
	addl	$4, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-8(%rsp), %rcx                  # 8-byte Reload
	leal	7(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$5, %r10d
	je	.LBB0_90
# %bb.88:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r14,%r15), %eax
	addl	$5, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-16(%rsp), %rcx                 # 8-byte Reload
	leal	7(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	cmpl	$6, %r10d
	je	.LBB0_90
# %bb.89:                               #   in Loop: Header=BB0_34 Depth=2
	leal	(%r14,%r15), %eax
	addl	$6, %eax
	vmovss	(%rdi,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-24(%rsp), %rcx                 # 8-byte Reload
	leal	7(%rcx,%r8), %ecx
	vmovss	(%rdi,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdi,%rax,4)
	vmovss	%xmm0, (%rdi,%rcx,4)
	jmp	.LBB0_90
.Lfunc_end0:
	.size	transpose_inplace_tiled_simd, .Lfunc_end0-transpose_inplace_tiled_simd
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 17.0.6 (9ubuntu1)"
	.section	".note.GNU-stack","",@progbits
