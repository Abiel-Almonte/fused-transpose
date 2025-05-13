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
	subq	$328, %rsp                      # imm = 0x148
	.cfi_def_cfa_offset 384
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
                                        # kill: def $esi killed $esi def $rsi
	leal	31(%rsi), %ecx
	shrl	$5, %ecx
	movl	%esi, %eax
	shrl	$5, %eax
	cmpl	$32, %esi
	movq	%rsi, (%rsp)                    # 8-byte Spill
	movq	%rdi, 48(%rsp)                  # 8-byte Spill
	jae	.LBB0_1
# %bb.85:
	cmpl	%eax, %ecx
	jbe	.LBB0_172
# %bb.86:
	movl	%esi, %eax
	shrl	$3, %eax
	movl	%eax, 40(%rsp)                  # 4-byte Spill
	movl	%esi, %edi
	andl	$7, %edi
	xorl	%ecx, %ecx
	movl	%esi, %r15d
	jmp	.LBB0_87
.LBB0_1:
	movl	%ecx, 256(%rsp)                 # 4-byte Spill
	movl	%esi, %ecx
	leal	(%rsi,%rsi), %edx
	leal	(%rsi,%rsi,2), %r10d
	leal	(,%rsi,4), %r8d
	leal	(%rsi,%rsi,4), %ebx
	leal	(%rdx,%rdx,2), %r14d
	leal	(,%rsi,8), %r11d
	movl	%r11d, %r9d
	subl	%esi, %r9d
                                        # kill: def $esi killed $esi killed $rsi def $rsi
	shll	$5, %esi
	movq	%rsi, 280(%rsp)                 # 8-byte Spill
	addl	$32, %esi
	movl	%esi, -12(%rsp)                 # 4-byte Spill
	movl	%eax, %esi
	movq	%rsi, 200(%rsp)                 # 8-byte Spill
	cmpl	$1, %eax
	movq	%rax, 264(%rsp)                 # 8-byte Spill
                                        # kill: def $eax killed $eax killed $rax def $rax
	adcl	$0, %eax
	movq	%rax, 272(%rsp)                 # 8-byte Spill
	movq	%r9, -96(%rsp)                  # 8-byte Spill
	leaq	(%rdi,%r9,4), %rax
	movq	%rax, 192(%rsp)                 # 8-byte Spill
	movq	%r14, -120(%rsp)                # 8-byte Spill
	leaq	(%rdi,%r14,4), %rax
	movq	%rax, 248(%rsp)                 # 8-byte Spill
	movq	%rbx, 24(%rsp)                  # 8-byte Spill
	leaq	(%rdi,%rbx,4), %rax
	movq	%rax, 240(%rsp)                 # 8-byte Spill
	movq	%r8, -24(%rsp)                  # 8-byte Spill
	leaq	(%rdi,%r8,4), %rax
	movq	%rax, 232(%rsp)                 # 8-byte Spill
	movq	%r10, -128(%rsp)                # 8-byte Spill
	leaq	(%rdi,%r10,4), %rax
	movq	%rax, -40(%rsp)                 # 8-byte Spill
	movq	%rdx, -88(%rsp)                 # 8-byte Spill
	leaq	(%rdi,%rdx,4), %rax
	movq	%rax, -48(%rsp)                 # 8-byte Spill
	movq	%rcx, -112(%rsp)                # 8-byte Spill
	leaq	(%rdi,%rcx,4), %rax
	movq	%rax, -56(%rsp)                 # 8-byte Spill
	movl	$1, %eax
	movq	%rax, 184(%rsp)                 # 8-byte Spill
	movl	$32, 36(%rsp)                   # 4-byte Folded Spill
	xorl	%eax, %eax
	movq	%rax, 64(%rsp)                  # 8-byte Spill
	xorl	%ecx, %ecx
	movl	%r11d, -104(%rsp)               # 4-byte Spill
	.p2align	4, 0x90
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
                                        #       Child Loop BB0_5 Depth 3
                                        #         Child Loop BB0_6 Depth 4
                                        #     Child Loop BB0_10 Depth 2
                                        #       Child Loop BB0_11 Depth 3
	movq	%rcx, 40(%rsp)                  # 8-byte Spill
	leaq	1(%rcx), %rax
	movq	%rax, 224(%rsp)                 # 8-byte Spill
	cmpq	200(%rsp), %rax                 # 8-byte Folded Reload
	movq	48(%rsp), %rsi                  # 8-byte Reload
	jae	.LBB0_9
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	movq	40(%rsp), %rax                  # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	shll	$5, %eax
	movl	%eax, -28(%rsp)                 # 4-byte Spill
	movl	36(%rsp), %eax                  # 4-byte Reload
	movq	184(%rsp), %rcx                 # 8-byte Reload
	.p2align	4, 0x90
.LBB0_4:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_5 Depth 3
                                        #         Child Loop BB0_6 Depth 4
	movl	%eax, 72(%rsp)                  # 4-byte Spill
	movl	%eax, %eax
	movq	%rcx, 208(%rsp)                 # 8-byte Spill
                                        # kill: def $ecx killed $ecx killed $rcx def $rcx
	imull	(%rsp), %ecx                    # 4-byte Folded Reload
	shll	$5, %ecx
	addl	-28(%rsp), %ecx                 # 4-byte Folded Reload
	leaq	(%rsi,%rcx,4), %rcx
	movq	%rcx, -72(%rsp)                 # 8-byte Spill
	leaq	(%rsi,%rax,4), %rcx
	movq	%rcx, -8(%rsp)                  # 8-byte Spill
	movq	192(%rsp), %rcx                 # 8-byte Reload
	leaq	(%rcx,%rax,4), %rcx
	movq	%rcx, 8(%rsp)                   # 8-byte Spill
	movq	248(%rsp), %rcx                 # 8-byte Reload
	leaq	(%rcx,%rax,4), %rcx
	movq	%rcx, 112(%rsp)                 # 8-byte Spill
	movq	240(%rsp), %rcx                 # 8-byte Reload
	leaq	(%rcx,%rax,4), %rcx
	movq	%rcx, -80(%rsp)                 # 8-byte Spill
	movq	232(%rsp), %rcx                 # 8-byte Reload
	leaq	(%rcx,%rax,4), %rcx
	movq	%rcx, 104(%rsp)                 # 8-byte Spill
	movq	-40(%rsp), %rcx                 # 8-byte Reload
	leaq	(%rcx,%rax,4), %rcx
	movq	%rcx, 96(%rsp)                  # 8-byte Spill
	movq	-48(%rsp), %rcx                 # 8-byte Reload
	leaq	(%rcx,%rax,4), %rcx
	movq	%rcx, 88(%rsp)                  # 8-byte Spill
	movq	-56(%rsp), %rcx                 # 8-byte Reload
	leaq	(%rcx,%rax,4), %rax
	movq	%rax, 80(%rsp)                  # 8-byte Spill
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB0_5:                                #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_6 Depth 4
	movq	%rax, 120(%rsp)                 # 8-byte Spill
	movl	%eax, %ecx
	movq	-8(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 16(%rsp)                  # 8-byte Spill
	movq	8(%rsp), %rax                   # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 176(%rsp)                 # 8-byte Spill
	movq	112(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 168(%rsp)                 # 8-byte Spill
	movq	-80(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 160(%rsp)                 # 8-byte Spill
	movq	104(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 152(%rsp)                 # 8-byte Spill
	movq	96(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 144(%rsp)                 # 8-byte Spill
	movq	88(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 136(%rsp)                 # 8-byte Spill
	movq	80(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 56(%rsp)                  # 8-byte Spill
	movq	%r13, -64(%rsp)                 # 8-byte Spill
	shlq	$5, %r13
	addq	-72(%rsp), %r13                 # 8-byte Folded Reload
	movq	%r13, 128(%rsp)                 # 8-byte Spill
	xorl	%r14d, %r14d
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB0_6:                                #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_4 Depth=2
                                        #       Parent Loop BB0_5 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movq	16(%rsp), %r9                   # 8-byte Reload
	vmovaps	(%r9,%r15), %ymm0
	movq	56(%rsp), %r8                   # 8-byte Reload
	vmovups	(%r8,%r15), %ymm4
	movq	136(%rsp), %rcx                 # 8-byte Reload
	vmovups	(%rcx,%r15), %ymm1
	movq	144(%rsp), %rbx                 # 8-byte Reload
	vmovups	(%rbx,%r15), %ymm5
	movq	152(%rsp), %rdi                 # 8-byte Reload
	vmovups	(%rdi,%r15), %ymm2
	movq	160(%rsp), %rsi                 # 8-byte Reload
	vmovups	(%rsi,%r15), %ymm6
	movq	168(%rsp), %rdx                 # 8-byte Reload
	vmovups	(%rdx,%r15), %ymm3
	movl	%r14d, %r12d
	movq	128(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%r12,4), %r11
	vmovaps	(%rax,%r12,4), %ymm7
	movq	-112(%rsp), %r10                # 8-byte Reload
	vmovups	(%r11,%r10,4), %ymm8
	movq	-88(%rsp), %r10                 # 8-byte Reload
	vmovups	(%r11,%r10,4), %ymm9
	movq	-128(%rsp), %r10                # 8-byte Reload
	vmovups	(%r11,%r10,4), %ymm10
	movq	-24(%rsp), %r13                 # 8-byte Reload
	vmovups	(%r11,%r13,4), %ymm11
	movq	24(%rsp), %rbp                  # 8-byte Reload
	vmovups	(%r11,%rbp,4), %ymm12
	movq	-120(%rsp), %r10                # 8-byte Reload
	vmovups	(%r11,%r10,4), %ymm13
	movq	-96(%rsp), %r10                 # 8-byte Reload
	vmovups	(%r11,%r10,4), %ymm14
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
	movq	176(%rsp), %r10                 # 8-byte Reload
	vmovups	(%r10,%r15), %ymm15
	vmovaps	%ymm13, (%r9,%r15)
	vmovups	%ymm14, (%rdi,%r15)
	vinsertf128	$1, %xmm10, %ymm8, %ymm13
	vperm2f128	$49, %ymm10, %ymm8, %ymm8 # ymm8 = ymm8[2,3],ymm10[2,3]
	vmovups	%ymm13, (%r8,%r15)
	vmovups	%ymm8, (%rsi,%r15)
	vinsertf128	$1, %xmm9, %ymm12, %ymm8
	vperm2f128	$49, %ymm9, %ymm12, %ymm9 # ymm9 = ymm12[2,3],ymm9[2,3]
	vmovups	%ymm8, (%rcx,%r15)
	vmovups	%ymm9, (%rdx,%r15)
	vinsertf128	$1, %xmm11, %ymm7, %ymm8
	vperm2f128	$49, %ymm11, %ymm7, %ymm7 # ymm7 = ymm7[2,3],ymm11[2,3]
	vmovups	%ymm8, (%rbx,%r15)
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
	vmovaps	%ymm3, (%rax,%r12,4)
	vperm2f128	$49, %ymm7, %ymm8, %ymm3 # ymm3 = ymm8[2,3],ymm7[2,3]
	vmovups	%ymm3, (%r11,%r13,4)
	vinsertf128	$1, %xmm5, %ymm4, %ymm3
	movq	-112(%rsp), %rax                # 8-byte Reload
	vmovups	%ymm3, (%r11,%rax,4)
	vperm2f128	$49, %ymm5, %ymm4, %ymm3 # ymm3 = ymm4[2,3],ymm5[2,3]
	vmovups	%ymm3, (%r11,%rbp,4)
	vinsertf128	$1, %xmm1, %ymm6, %ymm3
	movq	-88(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm3, (%r11,%rax,4)
	vperm2f128	$49, %ymm1, %ymm6, %ymm1 # ymm1 = ymm6[2,3],ymm1[2,3]
	movq	-120(%rsp), %rax                # 8-byte Reload
	vmovups	%ymm1, (%r11,%rax,4)
	vinsertf128	$1, %xmm2, %ymm0, %ymm1
	movq	-128(%rsp), %rax                # 8-byte Reload
	vmovups	%ymm1, (%r11,%rax,4)
	vperm2f128	$49, %ymm2, %ymm0, %ymm0 # ymm0 = ymm0[2,3],ymm2[2,3]
	movq	-96(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm0, (%r11,%rax,4)
	movl	-104(%rsp), %r11d               # 4-byte Reload
	addq	$32, %r15
	addl	%r11d, %r14d
	cmpq	$128, %r15
	jne	.LBB0_6
# %bb.7:                                #   in Loop: Header=BB0_5 Depth=3
	movq	-64(%rsp), %r13                 # 8-byte Reload
	incq	%r13
	movq	120(%rsp), %rax                 # 8-byte Reload
	addl	%r11d, %eax
	cmpq	$4, %r13
	jne	.LBB0_5
# %bb.8:                                #   in Loop: Header=BB0_4 Depth=2
	movq	208(%rsp), %rcx                 # 8-byte Reload
	incq	%rcx
	movl	72(%rsp), %eax                  # 4-byte Reload
	addl	$32, %eax
	cmpq	200(%rsp), %rcx                 # 8-byte Folded Reload
	movq	48(%rsp), %rsi                  # 8-byte Reload
	jne	.LBB0_4
.LBB0_9:                                #   in Loop: Header=BB0_2 Depth=1
	movl	64(%rsp), %ecx                  # 4-byte Reload
	shlq	$2, %rcx
	movq	40(%rsp), %rax                  # 8-byte Reload
	imull	-12(%rsp), %eax                 # 4-byte Folded Reload
	leaq	(%rsi,%rax,4), %rax
	movq	%rax, 8(%rsp)                   # 8-byte Spill
	leaq	(%rsi,%rcx), %rax
	movq	%rax, 112(%rsp)                 # 8-byte Spill
	movq	192(%rsp), %rax                 # 8-byte Reload
	addq	%rcx, %rax
	movq	%rax, -80(%rsp)                 # 8-byte Spill
	movq	248(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	%rax, 104(%rsp)                 # 8-byte Spill
	movq	240(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	%rax, 96(%rsp)                  # 8-byte Spill
	movq	232(%rsp), %rax                 # 8-byte Reload
	addq	%rcx, %rax
	movq	%rax, 88(%rsp)                  # 8-byte Spill
	movq	-40(%rsp), %rax                 # 8-byte Reload
	addq	%rcx, %rax
	movq	%rax, 80(%rsp)                  # 8-byte Spill
	movq	-48(%rsp), %rax                 # 8-byte Reload
	addq	%rcx, %rax
	movq	%rax, 72(%rsp)                  # 8-byte Spill
	addq	-56(%rsp), %rcx                 # 8-byte Folded Reload
	movq	%rcx, -8(%rsp)                  # 8-byte Spill
	xorl	%edx, %edx
	xorl	%r8d, %r8d
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB0_10:                               #   Parent Loop BB0_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_11 Depth 3
	movl	%edx, %ecx
	movq	112(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 16(%rsp)                  # 8-byte Spill
	movq	-80(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 176(%rsp)                 # 8-byte Spill
	movq	104(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 168(%rsp)                 # 8-byte Spill
	movq	96(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 160(%rsp)                 # 8-byte Spill
	movq	88(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 152(%rsp)                 # 8-byte Spill
	movq	80(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 144(%rsp)                 # 8-byte Spill
	movq	72(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 136(%rsp)                 # 8-byte Spill
	movq	-8(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 56(%rsp)                  # 8-byte Spill
	movq	%r13, -72(%rsp)                 # 8-byte Spill
	shlq	$5, %r13
	addq	8(%rsp), %r13                   # 8-byte Folded Reload
	movq	%r13, 128(%rsp)                 # 8-byte Spill
	movq	%rdx, 120(%rsp)                 # 8-byte Spill
	movl	%edx, %r14d
	movq	%r8, -64(%rsp)                  # 8-byte Spill
	.p2align	4, 0x90
.LBB0_11:                               #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_10 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	16(%rsp), %r9                   # 8-byte Reload
	vmovaps	(%r9,%r8), %ymm0
	movq	56(%rsp), %rax                  # 8-byte Reload
	vmovups	(%rax,%r8), %ymm4
	movq	136(%rsp), %rbp                 # 8-byte Reload
	vmovups	(%rbp,%r8), %ymm1
	movq	144(%rsp), %rbx                 # 8-byte Reload
	vmovups	(%rbx,%r8), %ymm5
	movq	152(%rsp), %rsi                 # 8-byte Reload
	vmovups	(%rsi,%r8), %ymm2
	movq	160(%rsp), %rdx                 # 8-byte Reload
	vmovups	(%rdx,%r8), %ymm6
	movq	168(%rsp), %r11                 # 8-byte Reload
	vmovups	(%r11,%r8), %ymm3
	movl	%r14d, %edi
	movq	128(%rsp), %rcx                 # 8-byte Reload
	leaq	(%rcx,%rdi,4), %r15
	vmovaps	(%rcx,%rdi,4), %ymm7
	movq	-112(%rsp), %r10                # 8-byte Reload
	vmovups	(%r15,%r10,4), %ymm8
	movq	-88(%rsp), %r10                 # 8-byte Reload
	vmovups	(%r15,%r10,4), %ymm9
	movq	-128(%rsp), %r10                # 8-byte Reload
	vmovups	(%r15,%r10,4), %ymm10
	movq	-24(%rsp), %r12                 # 8-byte Reload
	vmovups	(%r15,%r12,4), %ymm11
	movq	24(%rsp), %r13                  # 8-byte Reload
	vmovups	(%r15,%r13,4), %ymm12
	movq	-120(%rsp), %r10                # 8-byte Reload
	vmovups	(%r15,%r10,4), %ymm13
	movq	-96(%rsp), %r10                 # 8-byte Reload
	vmovups	(%r15,%r10,4), %ymm14
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
	movq	176(%rsp), %r10                 # 8-byte Reload
	vmovups	(%r10,%r8), %ymm15
	vmovaps	%ymm13, (%r9,%r8)
	vmovups	%ymm14, (%rsi,%r8)
	vinsertf128	$1, %xmm10, %ymm8, %ymm13
	vperm2f128	$49, %ymm10, %ymm8, %ymm8 # ymm8 = ymm8[2,3],ymm10[2,3]
	vmovups	%ymm13, (%rax,%r8)
	vmovups	%ymm8, (%rdx,%r8)
	vinsertf128	$1, %xmm9, %ymm12, %ymm8
	vperm2f128	$49, %ymm9, %ymm12, %ymm9 # ymm9 = ymm12[2,3],ymm9[2,3]
	vmovups	%ymm8, (%rbp,%r8)
	vmovups	%ymm9, (%r11,%r8)
	vinsertf128	$1, %xmm11, %ymm7, %ymm8
	vperm2f128	$49, %ymm11, %ymm7, %ymm7 # ymm7 = ymm7[2,3],ymm11[2,3]
	vmovups	%ymm8, (%rbx,%r8)
	vmovups	%ymm7, (%r10,%r8)
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
	vmovaps	%ymm3, (%rcx,%rdi,4)
	vperm2f128	$49, %ymm7, %ymm8, %ymm3 # ymm3 = ymm8[2,3],ymm7[2,3]
	vmovups	%ymm3, (%r15,%r12,4)
	vinsertf128	$1, %xmm5, %ymm4, %ymm3
	movq	-112(%rsp), %rax                # 8-byte Reload
	vmovups	%ymm3, (%r15,%rax,4)
	vperm2f128	$49, %ymm5, %ymm4, %ymm3 # ymm3 = ymm4[2,3],ymm5[2,3]
	vmovups	%ymm3, (%r15,%r13,4)
	vinsertf128	$1, %xmm1, %ymm6, %ymm3
	movq	-88(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm3, (%r15,%rax,4)
	vperm2f128	$49, %ymm1, %ymm6, %ymm1 # ymm1 = ymm6[2,3],ymm1[2,3]
	movq	-120(%rsp), %rax                # 8-byte Reload
	vmovups	%ymm1, (%r15,%rax,4)
	vinsertf128	$1, %xmm2, %ymm0, %ymm1
	movq	-128(%rsp), %rax                # 8-byte Reload
	vmovups	%ymm1, (%r15,%rax,4)
	vperm2f128	$49, %ymm2, %ymm0, %ymm0 # ymm0 = ymm0[2,3],ymm2[2,3]
	movq	-96(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm0, (%r15,%rax,4)
	addq	$32, %r8
	addl	-104(%rsp), %r14d               # 4-byte Folded Reload
	cmpq	$128, %r8
	jne	.LBB0_11
# %bb.12:                               #   in Loop: Header=BB0_10 Depth=2
	movq	-72(%rsp), %r13                 # 8-byte Reload
	incq	%r13
	movq	-64(%rsp), %r8                  # 8-byte Reload
	addq	$32, %r8
	movq	120(%rsp), %rdx                 # 8-byte Reload
	movl	-104(%rsp), %r11d               # 4-byte Reload
	addl	%r11d, %edx
	cmpq	$4, %r13
	jne	.LBB0_10
# %bb.13:                               #   in Loop: Header=BB0_2 Depth=1
	incq	184(%rsp)                       # 8-byte Folded Spill
	movl	-12(%rsp), %eax                 # 4-byte Reload
	addl	%eax, 36(%rsp)                  # 4-byte Folded Spill
	movq	64(%rsp), %rcx                  # 8-byte Reload
	addl	%eax, %ecx
	movq	%rcx, 64(%rsp)                  # 8-byte Spill
	movq	224(%rsp), %rax                 # 8-byte Reload
	movq	%rax, %rcx
	cmpq	272(%rsp), %rax                 # 8-byte Folded Reload
	jne	.LBB0_2
# %bb.14:
	movq	264(%rsp), %rax                 # 8-byte Reload
	cmpl	%eax, 256(%rsp)                 # 4-byte Folded Reload
	movq	(%rsp), %rsi                    # 8-byte Reload
	jbe	.LBB0_172
# %bb.15:
	movl	%esi, %ecx
	andl	$-32, %ecx
	movl	%esi, %r15d
	andl	$31, %r15d
	movl	%r15d, %edx
	shrl	$3, %edx
	movl	%esi, %edi
	andl	$7, %edi
	cmpl	$32, %esi
	movl	%edx, 40(%rsp)                  # 4-byte Spill
	jae	.LBB0_16
.LBB0_87:
	movq	48(%rsp), %rdx                  # 8-byte Reload
	jmp	.LBB0_88
.LBB0_16:
	movq	%rax, %rbx
	leal	7(%r15), %r8d
	shrl	$3, %r8d
	movl	%ecx, %eax
	imull	%esi, %eax
	movl	%eax, 36(%rsp)                  # 4-byte Spill
	leal	(%rsi,%rsi,2), %ebp
	leal	(%rsi,%rsi,4), %r9d
	movq	-88(%rsp), %r10                 # 8-byte Reload
	leal	(%r10,%r10,2), %r14d
	movq	%r14, -128(%rsp)                # 8-byte Spill
	movl	%esi, %eax
	andl	$24, %eax
	cmpl	$1, %edx
                                        # kill: def $edx killed $edx def $rdx
	adcl	$0, %edx
	cmpl	$1, %r8d
	adcl	$0, %r8d
	cmpl	$1, %ebx
	adcl	$0, %ebx
	movq	%rbx, 264(%rsp)                 # 8-byte Spill
	shlq	$5, %rdx
	movq	%rdx, 120(%rsp)                 # 8-byte Spill
	movq	%r8, 232(%rsp)                  # 8-byte Spill
	movl	%r8d, %edx
	shll	$3, %edx
	movl	%edx, 240(%rsp)                 # 4-byte Spill
	leal	(%rcx,%rax), %edx
	leal	(%rcx,%rax), %r8d
	addl	$6, %r8d
	imull	%esi, %r8d
	movq	%r8, -56(%rsp)                  # 8-byte Spill
	leal	(%rcx,%rax), %r8d
	addl	$5, %r8d
	imull	%esi, %r8d
	movq	%r8, -48(%rsp)                  # 8-byte Spill
	leal	(%rcx,%rax), %r8d
	addl	$4, %r8d
	imull	%esi, %r8d
	movq	%r8, -40(%rsp)                  # 8-byte Spill
	leal	(%rcx,%rax), %r8d
	addl	$3, %r8d
	imull	%esi, %r8d
	movq	%r8, -80(%rsp)                  # 8-byte Spill
	leal	(%rcx,%rax), %r8d
	addl	$2, %r8d
	imull	%esi, %r8d
	movq	%r8, -72(%rsp)                  # 8-byte Spill
	addl	%ecx, %eax
	incl	%eax
	imull	%esi, %eax
	movl	%esi, %r8d
	movl	%edx, -12(%rsp)                 # 4-byte Spill
	imull	%edx, %r8d
	movq	%r8, -64(%rsp)                  # 8-byte Spill
	movq	48(%rsp), %rdx                  # 8-byte Reload
	movq	-96(%rsp), %rbx                 # 8-byte Reload
	leaq	(%rdx,%rbx,4), %r8
	movq	%r8, 272(%rsp)                  # 8-byte Spill
	leaq	(%rdx,%r14,4), %r8
	movq	%r8, 256(%rsp)                  # 8-byte Spill
	movq	%r9, 24(%rsp)                   # 8-byte Spill
	leaq	(%rdx,%r9,4), %r8
	movq	%r8, 320(%rsp)                  # 8-byte Spill
	movq	%rax, %r9
	movq	-24(%rsp), %r8                  # 8-byte Reload
	leaq	(%rdx,%r8,4), %rax
	movq	%rax, 312(%rsp)                 # 8-byte Spill
	leaq	(%rdx,%rbp,4), %rax
	movq	%rax, 304(%rsp)                 # 8-byte Spill
	leaq	(%rdx,%r10,4), %rax
	movq	%rax, 296(%rsp)                 # 8-byte Spill
	movq	-112(%rsp), %rax                # 8-byte Reload
	leaq	(%rdx,%rax,4), %rax
	movq	%rax, 288(%rsp)                 # 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 64(%rsp)                  # 8-byte Spill
	movq	%rcx, 216(%rsp)                 # 8-byte Spill
	movl	%ecx, %eax
	movl	%ecx, 224(%rsp)                 # 4-byte Spill
	movq	280(%rsp), %r14                 # 8-byte Reload
	movl	%edi, -28(%rsp)                 # 4-byte Spill
	movq	%r15, 184(%rsp)                 # 8-byte Spill
	movq	%rbp, -120(%rsp)                # 8-byte Spill
	jmp	.LBB0_17
	.p2align	4, 0x90
.LBB0_83:                               #   in Loop: Header=BB0_17 Depth=1
	movq	64(%rsp), %rcx                  # 8-byte Reload
	incq	%rcx
	addl	%r14d, 224(%rsp)                # 4-byte Folded Spill
	addl	%r14d, -12(%rsp)                # 4-byte Folded Spill
	movq	-56(%rsp), %rax                 # 8-byte Reload
	addl	$32, %eax
	movq	%rax, -56(%rsp)                 # 8-byte Spill
	movq	-48(%rsp), %rax                 # 8-byte Reload
	addl	$32, %eax
	movq	%rax, -48(%rsp)                 # 8-byte Spill
	movq	-40(%rsp), %rax                 # 8-byte Reload
	addl	$32, %eax
	movq	%rax, -40(%rsp)                 # 8-byte Spill
	movq	-80(%rsp), %rax                 # 8-byte Reload
	addl	$32, %eax
	movq	%rax, -80(%rsp)                 # 8-byte Spill
	movq	-72(%rsp), %rax                 # 8-byte Reload
	addl	$32, %eax
	movq	%rax, -72(%rsp)                 # 8-byte Spill
	addl	$32, %r9d
	movq	-64(%rsp), %rax                 # 8-byte Reload
	addl	$32, %eax
	movq	%rax, -64(%rsp)                 # 8-byte Spill
	movq	%rcx, %rax
	movq	%rcx, 64(%rsp)                  # 8-byte Spill
	cmpq	264(%rsp), %rcx                 # 8-byte Folded Reload
	je	.LBB0_84
.LBB0_17:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_20 Depth 2
                                        #       Child Loop BB0_21 Depth 3
                                        #     Child Loop BB0_26 Depth 2
	testl	%r15d, %r15d
	je	.LBB0_83
# %bb.18:                               #   in Loop: Header=BB0_17 Depth=1
	cmpl	$8, %r15d
	movq	%r9, -8(%rsp)                   # 8-byte Spill
	jb	.LBB0_24
# %bb.19:                               # %.preheader7
                                        #   in Loop: Header=BB0_17 Depth=1
	movl	224(%rsp), %ecx                 # 4-byte Reload
	shlq	$2, %rcx
	movq	64(%rsp), %rax                  # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	shll	$5, %eax
	addl	36(%rsp), %eax                  # 4-byte Folded Reload
	movl	%eax, %eax
	leaq	(%rdx,%rax,4), %rax
	movq	%rax, 96(%rsp)                  # 8-byte Spill
	leaq	(%rdx,%rcx), %rax
	movq	%rax, 88(%rsp)                  # 8-byte Spill
	movq	272(%rsp), %rax                 # 8-byte Reload
	addq	%rcx, %rax
	movq	%rax, 80(%rsp)                  # 8-byte Spill
	movq	256(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	%rax, 72(%rsp)                  # 8-byte Spill
	movq	320(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx), %rax
	movq	%rax, 208(%rsp)                 # 8-byte Spill
	movq	312(%rsp), %rax                 # 8-byte Reload
	addq	%rcx, %rax
	movq	%rax, 200(%rsp)                 # 8-byte Spill
	movq	304(%rsp), %rax                 # 8-byte Reload
	addq	%rcx, %rax
	movq	%rax, 192(%rsp)                 # 8-byte Spill
	movq	296(%rsp), %rax                 # 8-byte Reload
	addq	%rcx, %rax
	movq	%rax, 248(%rsp)                 # 8-byte Spill
	addq	288(%rsp), %rcx                 # 8-byte Folded Reload
	movq	%rcx, 104(%rsp)                 # 8-byte Spill
	xorl	%eax, %eax
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB0_20:                               #   Parent Loop BB0_17 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_21 Depth 3
	movq	%rax, 8(%rsp)                   # 8-byte Spill
	movl	%eax, %ecx
	movq	88(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 16(%rsp)                  # 8-byte Spill
	movq	80(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 176(%rsp)                 # 8-byte Spill
	movq	72(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 168(%rsp)                 # 8-byte Spill
	movq	208(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 160(%rsp)                 # 8-byte Spill
	movq	200(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 152(%rsp)                 # 8-byte Spill
	movq	192(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 144(%rsp)                 # 8-byte Spill
	movq	248(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 136(%rsp)                 # 8-byte Spill
	movq	104(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rcx,4), %rax
	movq	%rax, 56(%rsp)                  # 8-byte Spill
	movq	%rdi, 112(%rsp)                 # 8-byte Spill
	shlq	$5, %rdi
	addq	96(%rsp), %rdi                  # 8-byte Folded Reload
	movq	%rdi, 128(%rsp)                 # 8-byte Spill
	xorl	%r14d, %r14d
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_21:                               #   Parent Loop BB0_17 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	16(%rsp), %r9                   # 8-byte Reload
	vmovaps	(%r9,%rdx), %ymm0
	movq	56(%rsp), %rsi                  # 8-byte Reload
	vmovups	(%rsi,%rdx), %ymm4
	movq	136(%rsp), %r13                 # 8-byte Reload
	vmovups	(%r13,%rdx), %ymm1
	movq	144(%rsp), %rcx                 # 8-byte Reload
	vmovups	(%rcx,%rdx), %ymm5
	movq	152(%rsp), %r8                  # 8-byte Reload
	vmovups	(%r8,%rdx), %ymm2
	movq	160(%rsp), %rbp                 # 8-byte Reload
	vmovups	(%rbp,%rdx), %ymm6
	movq	168(%rsp), %r11                 # 8-byte Reload
	vmovups	(%r11,%rdx), %ymm3
	movl	%r14d, %edi
	movq	128(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rdi,4), %r15
	vmovaps	(%rax,%rdi,4), %ymm7
	movq	-112(%rsp), %r10                # 8-byte Reload
	vmovups	(%r15,%r10,4), %ymm8
	movq	-88(%rsp), %r10                 # 8-byte Reload
	vmovups	(%r15,%r10,4), %ymm9
	movq	-120(%rsp), %r10                # 8-byte Reload
	vmovups	(%r15,%r10,4), %ymm10
	movq	-24(%rsp), %rbx                 # 8-byte Reload
	vmovups	(%r15,%rbx,4), %ymm11
	movq	24(%rsp), %r12                  # 8-byte Reload
	vmovups	(%r15,%r12,4), %ymm12
	movq	-128(%rsp), %r10                # 8-byte Reload
	vmovups	(%r15,%r10,4), %ymm13
	movq	-96(%rsp), %r10                 # 8-byte Reload
	vmovups	(%r15,%r10,4), %ymm14
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
	movq	176(%rsp), %r10                 # 8-byte Reload
	vmovups	(%r10,%rdx), %ymm15
	vmovaps	%ymm13, (%r9,%rdx)
	vmovups	%ymm14, (%r8,%rdx)
	vinsertf128	$1, %xmm10, %ymm8, %ymm13
	vperm2f128	$49, %ymm10, %ymm8, %ymm8 # ymm8 = ymm8[2,3],ymm10[2,3]
	vmovups	%ymm13, (%rsi,%rdx)
	vmovups	%ymm8, (%rbp,%rdx)
	vinsertf128	$1, %xmm9, %ymm12, %ymm8
	vperm2f128	$49, %ymm9, %ymm12, %ymm9 # ymm9 = ymm12[2,3],ymm9[2,3]
	vmovups	%ymm8, (%r13,%rdx)
	vmovups	%ymm9, (%r11,%rdx)
	vinsertf128	$1, %xmm11, %ymm7, %ymm8
	vperm2f128	$49, %ymm11, %ymm7, %ymm7 # ymm7 = ymm7[2,3],ymm11[2,3]
	vmovups	%ymm8, (%rcx,%rdx)
	vmovups	%ymm7, (%r10,%rdx)
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
	vmovaps	%ymm3, (%rax,%rdi,4)
	vperm2f128	$49, %ymm7, %ymm8, %ymm3 # ymm3 = ymm8[2,3],ymm7[2,3]
	vmovups	%ymm3, (%r15,%rbx,4)
	vinsertf128	$1, %xmm5, %ymm4, %ymm3
	movq	-112(%rsp), %rax                # 8-byte Reload
	vmovups	%ymm3, (%r15,%rax,4)
	vperm2f128	$49, %ymm5, %ymm4, %ymm3 # ymm3 = ymm4[2,3],ymm5[2,3]
	vmovups	%ymm3, (%r15,%r12,4)
	vinsertf128	$1, %xmm1, %ymm6, %ymm3
	movq	-88(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm3, (%r15,%rax,4)
	vperm2f128	$49, %ymm1, %ymm6, %ymm1 # ymm1 = ymm6[2,3],ymm1[2,3]
	movq	-128(%rsp), %rax                # 8-byte Reload
	vmovups	%ymm1, (%r15,%rax,4)
	vinsertf128	$1, %xmm2, %ymm0, %ymm1
	movq	-120(%rsp), %rax                # 8-byte Reload
	vmovups	%ymm1, (%r15,%rax,4)
	vperm2f128	$49, %ymm2, %ymm0, %ymm0 # ymm0 = ymm0[2,3],ymm2[2,3]
	movq	-96(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm0, (%r15,%rax,4)
	addq	$32, %rdx
	addl	-104(%rsp), %r14d               # 4-byte Folded Reload
	cmpq	%rdx, 120(%rsp)                 # 8-byte Folded Reload
	jne	.LBB0_21
# %bb.22:                               #   in Loop: Header=BB0_20 Depth=2
	movq	112(%rsp), %rdi                 # 8-byte Reload
	incq	%rdi
	movq	8(%rsp), %rax                   # 8-byte Reload
	movl	-104(%rsp), %r11d               # 4-byte Reload
	addl	%r11d, %eax
	cmpq	232(%rsp), %rdi                 # 8-byte Folded Reload
	jne	.LBB0_20
# %bb.23:                               #   in Loop: Header=BB0_17 Depth=1
	movq	184(%rsp), %r15                 # 8-byte Reload
	testl	%r15d, %r15d
	movq	(%rsp), %rsi                    # 8-byte Reload
	movq	48(%rsp), %rdx                  # 8-byte Reload
	movl	-28(%rsp), %edi                 # 4-byte Reload
	movq	-88(%rsp), %r10                 # 8-byte Reload
	movq	-24(%rsp), %r8                  # 8-byte Reload
	movq	-96(%rsp), %rbx                 # 8-byte Reload
	movq	280(%rsp), %r14                 # 8-byte Reload
	movq	-120(%rsp), %rbp                # 8-byte Reload
	movq	-8(%rsp), %r9                   # 8-byte Reload
	je	.LBB0_83
.LBB0_24:                               #   in Loop: Header=BB0_17 Depth=1
	testl	%edi, %edi
	je	.LBB0_83
# %bb.25:                               # %.preheader5
                                        #   in Loop: Header=BB0_17 Depth=1
	xorl	%r12d, %r12d
	movl	-12(%rsp), %eax                 # 4-byte Reload
	movl	%eax, %r13d
	jmp	.LBB0_26
	.p2align	4, 0x90
.LBB0_82:                               #   in Loop: Header=BB0_26 Depth=2
	addl	$8, %r12d
	addl	%r11d, %r13d
	cmpl	%r12d, 240(%rsp)                # 4-byte Folded Reload
	je	.LBB0_83
.LBB0_26:                               #   Parent Loop BB0_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-64(%rsp), %rax                 # 8-byte Reload
	addl	%r12d, %eax
	movl	%r13d, %ecx
	vmovss	(%rdx,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	(%rdx,%rax,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rcx,4)
	vmovss	%xmm0, (%rdx,%rax,4)
	cmpl	$1, %edi
	je	.LBB0_33
# %bb.27:                               #   in Loop: Header=BB0_26 Depth=2
	leal	1(%r13), %eax
	leal	(%r9,%r12), %ecx
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$2, %edi
	je	.LBB0_33
# %bb.28:                               #   in Loop: Header=BB0_26 Depth=2
	leal	2(%r13), %eax
	movq	-72(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$3, %edi
	je	.LBB0_33
# %bb.29:                               #   in Loop: Header=BB0_26 Depth=2
	leal	3(%r13), %eax
	movq	-80(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$4, %edi
	je	.LBB0_33
# %bb.30:                               #   in Loop: Header=BB0_26 Depth=2
	leal	4(%r13), %eax
	movq	-40(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$5, %edi
	je	.LBB0_33
# %bb.31:                               #   in Loop: Header=BB0_26 Depth=2
	leal	5(%r13), %eax
	movq	-48(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$6, %edi
	je	.LBB0_33
# %bb.32:                               #   in Loop: Header=BB0_26 Depth=2
	leal	6(%r13), %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-56(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	.p2align	4, 0x90
.LBB0_33:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%rsi,%r13), %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-64(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	incl	%ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$1, %edi
	je	.LBB0_40
# %bb.34:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%rsi,%r13), %eax
	incl	%eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	1(%r9,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$2, %edi
	je	.LBB0_40
# %bb.35:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%rsi,%r13), %eax
	addl	$2, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-72(%rsp), %rcx                 # 8-byte Reload
	leal	1(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$3, %edi
	je	.LBB0_40
# %bb.36:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%rsi,%r13), %eax
	addl	$3, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-80(%rsp), %rcx                 # 8-byte Reload
	leal	1(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$4, %edi
	je	.LBB0_40
# %bb.37:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%rsi,%r13), %eax
	addl	$4, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-40(%rsp), %rcx                 # 8-byte Reload
	leal	1(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$5, %edi
	je	.LBB0_40
# %bb.38:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%rsi,%r13), %eax
	addl	$5, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-48(%rsp), %rcx                 # 8-byte Reload
	leal	1(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$6, %edi
	je	.LBB0_40
# %bb.39:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%rsi,%r13), %eax
	addl	$6, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-56(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	incl	%ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	.p2align	4, 0x90
.LBB0_40:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r10,%r13), %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-64(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	addl	$2, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$1, %edi
	je	.LBB0_47
# %bb.41:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r10,%r13), %eax
	incl	%eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	2(%r9,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$2, %edi
	je	.LBB0_47
# %bb.42:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r10,%r13), %eax
	addl	$2, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-72(%rsp), %rcx                 # 8-byte Reload
	leal	2(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$3, %edi
	je	.LBB0_47
# %bb.43:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r10,%r13), %eax
	addl	$3, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-80(%rsp), %rcx                 # 8-byte Reload
	leal	2(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$4, %edi
	je	.LBB0_47
# %bb.44:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r10,%r13), %eax
	addl	$4, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-40(%rsp), %rcx                 # 8-byte Reload
	leal	2(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$5, %edi
	je	.LBB0_47
# %bb.45:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r10,%r13), %eax
	addl	$5, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-48(%rsp), %rcx                 # 8-byte Reload
	leal	2(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$6, %edi
	je	.LBB0_47
# %bb.46:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r10,%r13), %eax
	addl	$6, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-56(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	addl	$2, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	.p2align	4, 0x90
.LBB0_47:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%rbp,%r13), %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-64(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	addl	$3, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$1, %edi
	je	.LBB0_54
# %bb.48:                               #   in Loop: Header=BB0_26 Depth=2
	leal	1(%rbp,%r13), %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	(%r9,%r12), %ecx
	addl	$3, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$2, %edi
	je	.LBB0_54
# %bb.49:                               #   in Loop: Header=BB0_26 Depth=2
	leal	2(%rbp,%r13), %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-72(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	addl	$3, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$3, %edi
	je	.LBB0_54
# %bb.50:                               #   in Loop: Header=BB0_26 Depth=2
	leal	3(%rbp,%r13), %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-80(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	addl	$3, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$4, %edi
	je	.LBB0_54
# %bb.51:                               #   in Loop: Header=BB0_26 Depth=2
	leal	4(%rbp,%r13), %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-40(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	addl	$3, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$5, %edi
	je	.LBB0_54
# %bb.52:                               #   in Loop: Header=BB0_26 Depth=2
	leal	5(%rbp,%r13), %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-48(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	addl	$3, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$6, %edi
	je	.LBB0_54
# %bb.53:                               #   in Loop: Header=BB0_26 Depth=2
	leal	6(%rbp,%r13), %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-56(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	addl	$3, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	.p2align	4, 0x90
.LBB0_54:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r8,%r13), %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-64(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	addl	$4, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$1, %edi
	je	.LBB0_61
# %bb.55:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r8,%r13), %eax
	incl	%eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	4(%r9,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$2, %edi
	je	.LBB0_61
# %bb.56:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r8,%r13), %eax
	addl	$2, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-72(%rsp), %rcx                 # 8-byte Reload
	leal	4(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$3, %edi
	je	.LBB0_61
# %bb.57:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r8,%r13), %eax
	addl	$3, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-80(%rsp), %rcx                 # 8-byte Reload
	leal	4(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$4, %edi
	je	.LBB0_61
# %bb.58:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r8,%r13), %eax
	addl	$4, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-40(%rsp), %rcx                 # 8-byte Reload
	leal	4(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$5, %edi
	je	.LBB0_61
# %bb.59:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r8,%r13), %eax
	addl	$5, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-48(%rsp), %rcx                 # 8-byte Reload
	leal	4(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$6, %edi
	je	.LBB0_61
# %bb.60:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r8,%r13), %eax
	addl	$6, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-56(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	addl	$4, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	.p2align	4, 0x90
.LBB0_61:                               #   in Loop: Header=BB0_26 Depth=2
	movq	24(%rsp), %r9                   # 8-byte Reload
	leal	(%r9,%r13), %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-64(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	addl	$5, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$1, %edi
	je	.LBB0_68
# %bb.62:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r9,%r13), %eax
	incl	%eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-8(%rsp), %rcx                  # 8-byte Reload
	leal	5(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$2, %edi
	je	.LBB0_68
# %bb.63:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r9,%r13), %eax
	addl	$2, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-72(%rsp), %rcx                 # 8-byte Reload
	leal	5(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$3, %edi
	je	.LBB0_68
# %bb.64:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r9,%r13), %eax
	addl	$3, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-80(%rsp), %rcx                 # 8-byte Reload
	leal	5(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$4, %edi
	je	.LBB0_68
# %bb.65:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r9,%r13), %eax
	addl	$4, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-40(%rsp), %rcx                 # 8-byte Reload
	leal	5(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$5, %edi
	je	.LBB0_68
# %bb.66:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r9,%r13), %eax
	addl	$5, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-48(%rsp), %rcx                 # 8-byte Reload
	leal	5(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$6, %edi
	je	.LBB0_68
# %bb.67:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r9,%r13), %eax
	addl	$6, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-56(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	addl	$5, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	.p2align	4, 0x90
.LBB0_68:                               #   in Loop: Header=BB0_26 Depth=2
	movq	-128(%rsp), %r9                 # 8-byte Reload
	leal	(%r9,%r13), %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-64(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	addl	$6, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$1, %edi
	je	.LBB0_75
# %bb.69:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r9,%r13), %eax
	incl	%eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-8(%rsp), %rcx                  # 8-byte Reload
	leal	6(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$2, %edi
	je	.LBB0_75
# %bb.70:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r9,%r13), %eax
	addl	$2, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-72(%rsp), %rcx                 # 8-byte Reload
	leal	6(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$3, %edi
	je	.LBB0_75
# %bb.71:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r9,%r13), %eax
	addl	$3, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-80(%rsp), %rcx                 # 8-byte Reload
	leal	6(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$4, %edi
	je	.LBB0_75
# %bb.72:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r9,%r13), %eax
	addl	$4, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-40(%rsp), %rcx                 # 8-byte Reload
	leal	6(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$5, %edi
	je	.LBB0_75
# %bb.73:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r9,%r13), %eax
	addl	$5, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-48(%rsp), %rcx                 # 8-byte Reload
	leal	6(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$6, %edi
	je	.LBB0_75
# %bb.74:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%r9,%r13), %eax
	addl	$6, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-56(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	addl	$6, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	.p2align	4, 0x90
.LBB0_75:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%rbx,%r13), %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-64(%rsp), %rcx                 # 8-byte Reload
	addl	%r12d, %ecx
	addl	$7, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$1, %edi
	movq	-8(%rsp), %r9                   # 8-byte Reload
	je	.LBB0_82
# %bb.76:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%rbx,%r13), %eax
	incl	%eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	7(%r9,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$2, %edi
	je	.LBB0_82
# %bb.77:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%rbx,%r13), %eax
	addl	$2, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-72(%rsp), %rcx                 # 8-byte Reload
	leal	7(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$3, %edi
	je	.LBB0_82
# %bb.78:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%rbx,%r13), %eax
	addl	$3, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-80(%rsp), %rcx                 # 8-byte Reload
	leal	7(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$4, %edi
	je	.LBB0_82
# %bb.79:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%rbx,%r13), %eax
	addl	$4, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-40(%rsp), %rcx                 # 8-byte Reload
	leal	7(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$5, %edi
	je	.LBB0_82
# %bb.80:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%rbx,%r13), %eax
	addl	$5, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-48(%rsp), %rcx                 # 8-byte Reload
	leal	7(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$6, %edi
	je	.LBB0_82
# %bb.81:                               #   in Loop: Header=BB0_26 Depth=2
	leal	(%rbx,%r13), %eax
	addl	$6, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-56(%rsp), %rcx                 # 8-byte Reload
	leal	7(%rcx,%r12), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	jmp	.LBB0_82
.LBB0_84:
	movq	216(%rsp), %rcx                 # 8-byte Reload
.LBB0_88:
	leal	1(%rsi), %eax
	movl	%eax, 8(%rsp)                   # 4-byte Spill
	cmpl	$8, %r15d
	movl	%edi, -28(%rsp)                 # 4-byte Spill
	jb	.LBB0_94
# %bb.89:
	movq	%r15, 184(%rsp)                 # 8-byte Spill
	movq	%rcx, 216(%rsp)                 # 8-byte Spill
                                        # kill: def $ecx killed $ecx killed $rcx def $rcx
	imull	8(%rsp), %ecx                   # 4-byte Folded Reload
	movq	%rcx, 192(%rsp)                 # 8-byte Spill
	movl	%ecx, %eax
	leaq	(%rdx,%rax,4), %rdx
	movl	%esi, %r14d
	leal	(%rsi,%rsi), %r15d
	leal	(%rsi,%rsi,2), %edi
	leal	(,%rsi,4), %r8d
	leal	(%rsi,%rsi,4), %r9d
	leal	(%r15,%r15,2), %r10d
	leal	(,%rsi,8), %ebx
	movl	%ebx, %ecx
	subl	%esi, %ecx
	movl	40(%rsp), %eax                  # 4-byte Reload
	movl	%eax, %esi
	movq	%rsi, 120(%rsp)                 # 8-byte Spill
	cmpl	$1, %eax
                                        # kill: def $eax killed $eax def $rax
	adcl	$0, %eax
	movq	%rax, -80(%rsp)                 # 8-byte Spill
	movq	%rcx, -88(%rsp)                 # 8-byte Spill
	leaq	(,%rcx,4), %rax
	movq	%rax, 104(%rsp)                 # 8-byte Spill
	movq	%rdi, %rcx
	movq	%r10, -112(%rsp)                # 8-byte Spill
	leaq	(,%r10,4), %rax
	movq	%rax, 96(%rsp)                  # 8-byte Spill
	movq	%r9, -96(%rsp)                  # 8-byte Spill
	leaq	(,%r9,4), %rax
	movq	%rax, 88(%rsp)                  # 8-byte Spill
	movq	%r8, 128(%rsp)                  # 8-byte Spill
	leaq	(,%r8,4), %rax
	movq	%rax, 80(%rsp)                  # 8-byte Spill
	leaq	(,%rdi,4), %rax
	movq	%rax, 72(%rsp)                  # 8-byte Spill
	leaq	(,%r15,4), %rax
	movq	%rax, 208(%rsp)                 # 8-byte Spill
	leaq	(,%r14,4), %rax
	movq	%rax, 200(%rsp)                 # 8-byte Spill
	xorl	%edi, %edi
	movq	%rdx, 112(%rsp)                 # 8-byte Spill
	movq	%rdx, %r9
	xorl	%r11d, %r11d
	movl	%ebx, 56(%rsp)                  # 4-byte Spill
	movq	%rcx, -128(%rsp)                # 8-byte Spill
	movq	%r15, -120(%rsp)                # 8-byte Spill
	movq	%r14, -104(%rsp)                # 8-byte Spill
	movq	128(%rsp), %r13                 # 8-byte Reload
	.p2align	4, 0x90
.LBB0_90:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_91 Depth 2
	movl	%edi, %esi
	leaq	(,%rsi,4), %rax
	movq	%rax, -24(%rsp)                 # 8-byte Spill
	movq	104(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rsi,4), %rax
	movq	%rax, 24(%rsp)                  # 8-byte Spill
	movq	96(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rsi,4), %rax
	movq	%rax, 16(%rsp)                  # 8-byte Spill
	movq	88(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rsi,4), %rax
	movq	%rax, 176(%rsp)                 # 8-byte Spill
	movq	80(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rsi,4), %rax
	movq	%rax, 168(%rsp)                 # 8-byte Spill
	movq	72(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%rsi,4), %rax
	movq	%rax, 160(%rsp)                 # 8-byte Spill
	movq	208(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rsi,4), %rax
	movq	%rax, 152(%rsp)                 # 8-byte Spill
	movq	200(%rsp), %rax                 # 8-byte Reload
	leaq	(%rax,%rsi,4), %rax
	movq	%rax, 144(%rsp)                 # 8-byte Spill
	movq	%r11, %rax
	shlq	$5, %rax
	addq	112(%rsp), %rax                 # 8-byte Folded Reload
	movq	%rax, 136(%rsp)                 # 8-byte Spill
	movq	%r9, -72(%rsp)                  # 8-byte Spill
	movq	%rdi, -64(%rsp)                 # 8-byte Spill
	movl	%edi, %r10d
	movq	%r11, -8(%rsp)                  # 8-byte Spill
	.p2align	4, 0x90
.LBB0_91:                               #   Parent Loop BB0_90 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-24(%rsp), %rbp                 # 8-byte Reload
	vmovaps	(%r9,%rbp), %ymm0
	movq	144(%rsp), %rdx                 # 8-byte Reload
	vmovups	(%r9,%rdx), %ymm4
	movq	152(%rsp), %r12                 # 8-byte Reload
	vmovups	(%r9,%r12), %ymm1
	movq	160(%rsp), %rdi                 # 8-byte Reload
	vmovups	(%r9,%rdi), %ymm5
	movq	168(%rsp), %r8                  # 8-byte Reload
	vmovups	(%r9,%r8), %ymm2
	movq	176(%rsp), %rax                 # 8-byte Reload
	vmovups	(%r9,%rax), %ymm6
	movq	16(%rsp), %r15                  # 8-byte Reload
	vmovups	(%r9,%r15), %ymm3
	movl	%r10d, %r14d
	movq	136(%rsp), %rcx                 # 8-byte Reload
	leaq	(%rcx,%r14,4), %rbx
	vmovaps	(%rcx,%r14,4), %ymm7
	movq	-104(%rsp), %rsi                # 8-byte Reload
	vmovups	(%rbx,%rsi,4), %ymm8
	movq	-120(%rsp), %rsi                # 8-byte Reload
	vmovups	(%rbx,%rsi,4), %ymm9
	movq	-128(%rsp), %rsi                # 8-byte Reload
	vmovups	(%rbx,%rsi,4), %ymm10
	vmovups	(%rbx,%r13,4), %ymm11
	movq	-96(%rsp), %rsi                 # 8-byte Reload
	vmovups	(%rbx,%rsi,4), %ymm12
	movq	-112(%rsp), %rsi                # 8-byte Reload
	vmovups	(%rbx,%rsi,4), %ymm13
	movq	-88(%rsp), %rsi                 # 8-byte Reload
	vmovups	(%rbx,%rsi,4), %ymm14
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
	movq	24(%rsp), %rsi                  # 8-byte Reload
	vmovups	(%r9,%rsi), %ymm15
	vmovaps	%ymm13, (%r9,%rbp)
	vmovups	%ymm14, (%r9,%r8)
	vinsertf128	$1, %xmm10, %ymm8, %ymm13
	vperm2f128	$49, %ymm10, %ymm8, %ymm8 # ymm8 = ymm8[2,3],ymm10[2,3]
	vmovups	%ymm13, (%r9,%rdx)
	vmovups	%ymm8, (%r9,%rax)
	vinsertf128	$1, %xmm9, %ymm12, %ymm8
	vperm2f128	$49, %ymm9, %ymm12, %ymm9 # ymm9 = ymm12[2,3],ymm9[2,3]
	vmovups	%ymm8, (%r9,%r12)
	vmovups	%ymm9, (%r9,%r15)
	vinsertf128	$1, %xmm11, %ymm7, %ymm8
	vperm2f128	$49, %ymm11, %ymm7, %ymm7 # ymm7 = ymm7[2,3],ymm11[2,3]
	vmovups	%ymm8, (%r9,%rdi)
	vmovups	%ymm7, (%r9,%rsi)
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
	vmovaps	%ymm3, (%rcx,%r14,4)
	movq	-104(%rsp), %r14                # 8-byte Reload
	movq	-120(%rsp), %r15                # 8-byte Reload
	movq	-128(%rsp), %rcx                # 8-byte Reload
	vperm2f128	$49, %ymm7, %ymm8, %ymm3 # ymm3 = ymm8[2,3],ymm7[2,3]
	vmovups	%ymm3, (%rbx,%r13,4)
	vinsertf128	$1, %xmm5, %ymm4, %ymm3
	vmovups	%ymm3, (%rbx,%r14,4)
	vperm2f128	$49, %ymm5, %ymm4, %ymm3 # ymm3 = ymm4[2,3],ymm5[2,3]
	movq	-96(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm3, (%rbx,%rax,4)
	vinsertf128	$1, %xmm1, %ymm6, %ymm3
	vmovups	%ymm3, (%rbx,%r15,4)
	vperm2f128	$49, %ymm1, %ymm6, %ymm1 # ymm1 = ymm6[2,3],ymm1[2,3]
	movq	-112(%rsp), %rax                # 8-byte Reload
	vmovups	%ymm1, (%rbx,%rax,4)
	vinsertf128	$1, %xmm2, %ymm0, %ymm1
	vmovups	%ymm1, (%rbx,%rcx,4)
	vperm2f128	$49, %ymm2, %ymm0, %ymm0 # ymm0 = ymm0[2,3],ymm2[2,3]
	movq	-88(%rsp), %rax                 # 8-byte Reload
	vmovups	%ymm0, (%rbx,%rax,4)
	movl	56(%rsp), %ebx                  # 4-byte Reload
	incq	%r11
	addl	%ebx, %r10d
	addq	$32, %r9
	cmpq	120(%rsp), %r11                 # 8-byte Folded Reload
	jb	.LBB0_91
# %bb.92:                               #   in Loop: Header=BB0_90 Depth=1
	movq	-8(%rsp), %r11                  # 8-byte Reload
	incq	%r11
	movq	-64(%rsp), %rdi                 # 8-byte Reload
	addl	%ebx, %edi
	movq	-72(%rsp), %r9                  # 8-byte Reload
	addq	$32, %r9
	cmpq	-80(%rsp), %r11                 # 8-byte Folded Reload
	jne	.LBB0_90
# %bb.93:
	cmpl	$7, 184(%rsp)                   # 4-byte Folded Reload
	movq	(%rsp), %rsi                    # 8-byte Reload
	movl	-28(%rsp), %edi                 # 4-byte Reload
	movq	216(%rsp), %rcx                 # 8-byte Reload
	ja	.LBB0_95
.LBB0_94:
	movl	%esi, %eax
	andl	$24, %eax
	testl	%edi, %edi
	je	.LBB0_172
.LBB0_156:
	orl	%ecx, %eax
	movl	%edi, %ecx
	leaq	-2(%rcx), %rdx
	movq	%rdx, -24(%rsp)                 # 8-byte Spill
	movl	%eax, %r15d
	imull	8(%rsp), %r15d                  # 4-byte Folded Reload
	leal	1(,%rax,2), %eax
	movq	%rax, 24(%rsp)                  # 8-byte Spill
	movq	%rcx, -128(%rsp)                # 8-byte Spill
	leaq	-1(%rcx), %rax
	movq	%rax, -120(%rsp)                # 8-byte Spill
	leal	1(%r15), %r13d
	movl	%r15d, %r11d
	movl	%esi, %eax
	movq	%rax, -104(%rsp)                # 8-byte Spill
	leal	(,%rsi,4), %ebp
	movl	$1, %r14d
	xorl	%eax, %eax
	movq	%rax, -88(%rsp)                 # 8-byte Spill
	movl	%r15d, %r12d
	movl	%r13d, -96(%rsp)                # 4-byte Spill
	xorl	%edx, %edx
	movq	48(%rsp), %rsi                  # 8-byte Reload
	jmp	.LBB0_158
	.p2align	4, 0x90
.LBB0_157:                              #   in Loop: Header=BB0_158 Depth=1
	incq	%r14
	decq	-120(%rsp)                      # 8-byte Folded Spill
	addl	$2, %r13d
	movl	-96(%rsp), %eax                 # 4-byte Reload
	addl	8(%rsp), %eax                   # 4-byte Folded Reload
	movl	%eax, -96(%rsp)                 # 4-byte Spill
	incl	%r12d
	addq	-104(%rsp), %r11                # 8-byte Folded Reload
	movq	-88(%rsp), %rax                 # 8-byte Reload
	addl	(%rsp), %eax                    # 4-byte Folded Reload
	movq	%rax, -88(%rsp)                 # 8-byte Spill
	movl	-28(%rsp), %edi                 # 4-byte Reload
	movq	-112(%rsp), %rdx                # 8-byte Reload
	cmpl	%edi, %edx
	je	.LBB0_172
.LBB0_158:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_164 Depth 2
                                        #     Child Loop BB0_168 Depth 2
                                        #     Child Loop BB0_171 Depth 2
	leaq	1(%rdx), %rax
	movq	%rax, -112(%rsp)                # 8-byte Spill
	cmpl	%edi, %eax
	jae	.LBB0_157
# %bb.159:                              #   in Loop: Header=BB0_158 Depth=1
	movq	%rdx, %rcx
	notq	%rcx
	addq	-128(%rsp), %rcx                # 8-byte Folded Reload
	movq	%r14, %rax
	cmpq	$16, %rcx
	jb	.LBB0_166
# %bb.160:                              #   in Loop: Header=BB0_158 Depth=1
	movq	-24(%rsp), %rdi                 # 8-byte Reload
	subq	%rdx, %rdi
	movq	24(%rsp), %rax                  # 8-byte Reload
	leal	(%rax,%rdx,2), %eax
	movl	%edi, %r8d
	addl	%eax, %r8d
	setb	%r8b
	movq	%r14, %rax
	cmpl	$1, (%rsp)                      # 4-byte Folded Reload
	jne	.LBB0_166
# %bb.161:                              #   in Loop: Header=BB0_158 Depth=1
	movq	%r14, %rax
	testb	%r8b, %r8b
	jne	.LBB0_166
# %bb.162:                              #   in Loop: Header=BB0_158 Depth=1
	shrq	$32, %rdi
	movq	%r14, %rax
	jne	.LBB0_166
# %bb.163:                              #   in Loop: Header=BB0_158 Depth=1
	movq	-120(%rsp), %rdi                # 8-byte Reload
	andq	$-16, %rdi
	movq	%rcx, %rax
	andq	$-16, %rax
	movq	%rax, 16(%rsp)                  # 8-byte Spill
	addq	%r14, %rax
	movl	-96(%rsp), %r9d                 # 4-byte Reload
	movl	%r13d, %ebx
	.p2align	4, 0x90
.LBB0_164:                              #   Parent Loop BB0_158 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%r9d, %r8d
	vmovups	(%rsi,%r8,4), %ymm0
	vmovups	32(%rsi,%r8,4), %ymm1
	movl	%ebx, %r10d
	vmovups	(%rsi,%r10,4), %ymm2
	vmovups	32(%rsi,%r10,4), %ymm3
	vmovups	%ymm2, (%rsi,%r8,4)
	vmovups	%ymm3, 32(%rsi,%r8,4)
	vmovups	%ymm0, (%rsi,%r10,4)
	vmovups	%ymm1, 32(%rsi,%r10,4)
	addl	$16, %ebx
	addl	$16, %r9d
	addq	$-16, %rdi
	jne	.LBB0_164
# %bb.165:                              #   in Loop: Header=BB0_158 Depth=1
	cmpq	16(%rsp), %rcx                  # 8-byte Folded Reload
	je	.LBB0_157
	.p2align	4, 0x90
.LBB0_166:                              #   in Loop: Header=BB0_158 Depth=1
	movq	-128(%rsp), %rcx                # 8-byte Reload
                                        # kill: def $ecx killed $ecx killed $rcx def $rcx
	subl	%eax, %ecx
	movq	%rax, %rdi
	andl	$3, %ecx
	movq	(%rsp), %rbx                    # 8-byte Reload
	je	.LBB0_169
# %bb.167:                              # %.preheader1
                                        #   in Loop: Header=BB0_158 Depth=1
	movl	%ebx, %r8d
	imull	%eax, %r8d
	addl	%r12d, %r8d
	movq	%rax, %rdi
	.p2align	4, 0x90
.LBB0_168:                              #   Parent Loop BB0_158 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	(%r11,%rdi), %r9d
	vmovss	(%rsi,%r9,4), %xmm0             # xmm0 = mem[0],zero,zero,zero
	movl	%r8d, %r10d
	vmovss	(%rsi,%r10,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rsi,%r9,4)
	vmovss	%xmm0, (%rsi,%r10,4)
	incq	%rdi
	addl	%ebx, %r8d
	decq	%rcx
	jne	.LBB0_168
.LBB0_169:                              #   in Loop: Header=BB0_158 Depth=1
	notq	%rax
	addq	-128(%rsp), %rax                # 8-byte Folded Reload
	cmpq	$3, %rax
	jb	.LBB0_157
# %bb.170:                              # %.preheader
                                        #   in Loop: Header=BB0_158 Depth=1
	movq	-128(%rsp), %rax                # 8-byte Reload
	subq	%rdi, %rax
	leal	3(%rdi), %ebx
	movq	(%rsp), %r10                    # 8-byte Reload
	imull	%r10d, %ebx
	addl	%edx, %ebx
	movq	-88(%rsp), %rcx                 # 8-byte Reload
	addl	%edi, %ecx
	leal	2(%rdi), %r8d
	imull	%r10d, %r8d
	addl	%edx, %r8d
	leal	1(%rdi), %r9d
	imull	%r10d, %r9d
	addl	%edx, %r9d
	imull	%r10d, %edi
	addl	%edx, %edi
	.p2align	4, 0x90
.LBB0_171:                              #   Parent Loop BB0_158 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	(%r15,%rcx), %edx
	vmovss	(%rsi,%rdx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	(%r15,%rdi), %r10d
	vmovss	(%rsi,%r10,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rsi,%rdx,4)
	vmovss	%xmm0, (%rsi,%r10,4)
	leal	1(%r15,%rcx), %edx
	vmovss	(%rsi,%rdx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	(%r15,%r9), %r10d
	vmovss	(%rsi,%r10,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rsi,%rdx,4)
	vmovss	%xmm0, (%rsi,%r10,4)
	leal	2(%r15,%rcx), %edx
	vmovss	(%rsi,%rdx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	(%r15,%r8), %r10d
	vmovss	(%rsi,%r10,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rsi,%rdx,4)
	vmovss	%xmm0, (%rsi,%r10,4)
	leal	3(%r15,%rcx), %edx
	vmovss	(%rsi,%rdx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	(%r15,%rbx), %r10d
	vmovss	(%rsi,%r10,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rsi,%rdx,4)
	vmovss	%xmm0, (%rsi,%r10,4)
	addl	%ebp, %ebx
	addl	$4, %ecx
	addl	%ebp, %r8d
	addl	%ebp, %r9d
	addl	%ebp, %edi
	addq	$-4, %rax
	jne	.LBB0_171
	jmp	.LBB0_157
.LBB0_95:
	testl	%edi, %edi
	je	.LBB0_172
# %bb.96:
	movl	%esi, %r14d
	andl	$24, %r14d
	movl	40(%rsp), %eax                  # 4-byte Reload
	cmpl	$1, %eax
	adcl	$0, %eax
	movl	%r14d, %r10d
	imull	%esi, %r10d
	movl	%r14d, %r11d
	orl	$1, %r11d
	imull	%esi, %r11d
	movl	%r14d, %ebx
	orl	$2, %ebx
	imull	%esi, %ebx
	movl	%r14d, %ecx
	orl	$3, %ecx
	imull	%esi, %ecx
	movq	%rcx, -112(%rsp)                # 8-byte Spill
	movl	%r14d, %ecx
	orl	$4, %ecx
	imull	%esi, %ecx
	movq	%rcx, -128(%rsp)                # 8-byte Spill
	movl	%r14d, %ecx
	orl	$5, %ecx
	imull	%esi, %ecx
	movq	%rcx, -120(%rsp)                # 8-byte Spill
	movl	%r14d, %ecx
	orl	$6, %ecx
	imull	%esi, %ecx
	movq	%rcx, -104(%rsp)                # 8-byte Spill
	movq	-88(%rsp), %r8                  # 8-byte Reload
	addl	%r14d, %r8d
	leal	(%rsi,%rsi,2), %r9d
	leal	(%r14,%r9,2), %ecx
	movq	%rcx, -96(%rsp)                 # 8-byte Spill
	leal	(%rsi,%rsi,4), %ebp
	addl	%r14d, %ebp
	leal	(%r14,%rsi,4), %r12d
	addl	%r14d, %r9d
	leal	(%r14,%rsi,2), %r15d
	leal	(%rsi,%r14), %r13d
	movq	%r14, -24(%rsp)                 # 8-byte Spill
                                        # kill: def $r14d killed $r14d killed $r14 def $r14
	movq	48(%rsp), %rdx                  # 8-byte Reload
	movq	192(%rsp), %rsi                 # 8-byte Reload
	jmp	.LBB0_97
	.p2align	4, 0x90
.LBB0_153:                              #   in Loop: Header=BB0_97 Depth=1
	movl	56(%rsp), %eax                  # 4-byte Reload
	addl	%eax, %r8d
	movq	-96(%rsp), %rcx                 # 8-byte Reload
	addl	%eax, %ecx
	movq	%rcx, -96(%rsp)                 # 8-byte Spill
	addl	%eax, %ebp
	addl	%eax, %r12d
	addl	%eax, %r9d
	addl	%eax, %r15d
	addl	%eax, %r13d
	addl	%eax, %r14d
	movq	-104(%rsp), %rax                # 8-byte Reload
	addl	$8, %eax
	movq	%rax, -104(%rsp)                # 8-byte Spill
	movq	-120(%rsp), %rax                # 8-byte Reload
	addl	$8, %eax
	movq	%rax, -120(%rsp)                # 8-byte Spill
	movq	-128(%rsp), %rax                # 8-byte Reload
	addl	$8, %eax
	movq	%rax, -128(%rsp)                # 8-byte Spill
	movq	-112(%rsp), %rax                # 8-byte Reload
	addl	$8, %eax
	movq	%rax, -112(%rsp)                # 8-byte Spill
	addl	$8, %ebx
	addl	$8, %r11d
	addl	$8, %r10d
	movl	40(%rsp), %eax                  # 4-byte Reload
	decl	%eax
	je	.LBB0_154
.LBB0_97:                               # =>This Inner Loop Header: Depth=1
	movl	%eax, 40(%rsp)                  # 4-byte Spill
	movq	%r8, -88(%rsp)                  # 8-byte Spill
	leal	(%rsi,%r14), %eax
	leal	(%rsi,%r10), %ecx
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$1, %edi
	je	.LBB0_104
# %bb.98:                               #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r11), %eax
	leal	(%rsi,%r14), %ecx
	incl	%ecx
	vmovss	(%rdx,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	(%rdx,%rax,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rcx,4)
	vmovss	%xmm0, (%rdx,%rax,4)
	cmpl	$2, %edi
	je	.LBB0_104
# %bb.99:                               #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%rbx), %eax
	leal	(%rsi,%r14), %ecx
	addl	$2, %ecx
	vmovss	(%rdx,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	(%rdx,%rax,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rcx,4)
	vmovss	%xmm0, (%rdx,%rax,4)
	cmpl	$3, %edi
	je	.LBB0_104
# %bb.100:                              #   in Loop: Header=BB0_97 Depth=1
	movq	-112(%rsp), %rax                # 8-byte Reload
	addl	%esi, %eax
	leal	3(%rsi,%r14), %ecx
	vmovss	(%rdx,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	(%rdx,%rax,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rcx,4)
	vmovss	%xmm0, (%rdx,%rax,4)
	cmpl	$4, %edi
	je	.LBB0_104
# %bb.101:                              #   in Loop: Header=BB0_97 Depth=1
	movq	-128(%rsp), %rax                # 8-byte Reload
	addl	%esi, %eax
	leal	4(%rsi,%r14), %ecx
	vmovss	(%rdx,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	(%rdx,%rax,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rcx,4)
	vmovss	%xmm0, (%rdx,%rax,4)
	cmpl	$5, %edi
	je	.LBB0_104
# %bb.102:                              #   in Loop: Header=BB0_97 Depth=1
	movq	-120(%rsp), %rax                # 8-byte Reload
	addl	%esi, %eax
	leal	5(%rsi,%r14), %ecx
	vmovss	(%rdx,%rcx,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vmovss	(%rdx,%rax,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rcx,4)
	vmovss	%xmm0, (%rdx,%rax,4)
	cmpl	$6, %edi
	je	.LBB0_104
# %bb.103:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r14), %eax
	addl	$6, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-104(%rsp), %rcx                # 8-byte Reload
	addl	%esi, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	.p2align	4, 0x90
.LBB0_104:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r13), %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	(%rsi,%r10), %ecx
	incl	%ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$1, %edi
	movq	-96(%rsp), %r8                  # 8-byte Reload
	je	.LBB0_111
# %bb.105:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r13), %eax
	incl	%eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	1(%rsi,%r11), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$2, %edi
	je	.LBB0_111
# %bb.106:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r13), %eax
	addl	$2, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	1(%rsi,%rbx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$3, %edi
	je	.LBB0_111
# %bb.107:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r13), %eax
	addl	$3, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-112(%rsp), %rcx                # 8-byte Reload
	leal	1(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$4, %edi
	je	.LBB0_111
# %bb.108:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r13), %eax
	addl	$4, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-128(%rsp), %rcx                # 8-byte Reload
	leal	1(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$5, %edi
	je	.LBB0_111
# %bb.109:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r13), %eax
	addl	$5, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-120(%rsp), %rcx                # 8-byte Reload
	leal	1(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$6, %edi
	je	.LBB0_111
# %bb.110:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r13), %eax
	addl	$6, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-104(%rsp), %rcx                # 8-byte Reload
	addl	%esi, %ecx
	incl	%ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	.p2align	4, 0x90
.LBB0_111:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r15), %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	(%rsi,%r10), %ecx
	addl	$2, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$1, %edi
	je	.LBB0_118
# %bb.112:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r15), %eax
	incl	%eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	2(%rsi,%r11), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$2, %edi
	je	.LBB0_118
# %bb.113:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r15), %eax
	addl	$2, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	2(%rsi,%rbx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$3, %edi
	je	.LBB0_118
# %bb.114:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r15), %eax
	addl	$3, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-112(%rsp), %rcx                # 8-byte Reload
	leal	2(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$4, %edi
	je	.LBB0_118
# %bb.115:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r15), %eax
	addl	$4, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-128(%rsp), %rcx                # 8-byte Reload
	leal	2(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$5, %edi
	je	.LBB0_118
# %bb.116:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r15), %eax
	addl	$5, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-120(%rsp), %rcx                # 8-byte Reload
	leal	2(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$6, %edi
	je	.LBB0_118
# %bb.117:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r15), %eax
	addl	$6, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-104(%rsp), %rcx                # 8-byte Reload
	addl	%esi, %ecx
	addl	$2, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	.p2align	4, 0x90
.LBB0_118:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r9), %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	(%rsi,%r10), %ecx
	addl	$3, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$1, %edi
	je	.LBB0_125
# %bb.119:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r9), %eax
	incl	%eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	3(%rsi,%r11), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$2, %edi
	je	.LBB0_125
# %bb.120:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r9), %eax
	addl	$2, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	3(%rsi,%rbx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$3, %edi
	je	.LBB0_125
# %bb.121:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r9), %eax
	addl	$3, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-112(%rsp), %rcx                # 8-byte Reload
	leal	3(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$4, %edi
	je	.LBB0_125
# %bb.122:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r9), %eax
	addl	$4, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-128(%rsp), %rcx                # 8-byte Reload
	leal	3(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$5, %edi
	je	.LBB0_125
# %bb.123:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r9), %eax
	addl	$5, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-120(%rsp), %rcx                # 8-byte Reload
	leal	3(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$6, %edi
	je	.LBB0_125
# %bb.124:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r9), %eax
	addl	$6, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-104(%rsp), %rcx                # 8-byte Reload
	addl	%esi, %ecx
	addl	$3, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	.p2align	4, 0x90
.LBB0_125:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r12), %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	(%rsi,%r10), %ecx
	addl	$4, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$1, %edi
	je	.LBB0_132
# %bb.126:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r12), %eax
	incl	%eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	4(%rsi,%r11), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$2, %edi
	je	.LBB0_132
# %bb.127:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r12), %eax
	addl	$2, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	4(%rsi,%rbx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$3, %edi
	je	.LBB0_132
# %bb.128:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r12), %eax
	addl	$3, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-112(%rsp), %rcx                # 8-byte Reload
	leal	4(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$4, %edi
	je	.LBB0_132
# %bb.129:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r12), %eax
	addl	$4, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-128(%rsp), %rcx                # 8-byte Reload
	leal	4(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$5, %edi
	je	.LBB0_132
# %bb.130:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r12), %eax
	addl	$5, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-120(%rsp), %rcx                # 8-byte Reload
	leal	4(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$6, %edi
	je	.LBB0_132
# %bb.131:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r12), %eax
	addl	$6, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-104(%rsp), %rcx                # 8-byte Reload
	addl	%esi, %ecx
	addl	$4, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	.p2align	4, 0x90
.LBB0_132:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%rbp), %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	(%rsi,%r10), %ecx
	addl	$5, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$1, %edi
	je	.LBB0_139
# %bb.133:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%rbp), %eax
	incl	%eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	5(%rsi,%r11), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$2, %edi
	je	.LBB0_139
# %bb.134:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%rbp), %eax
	addl	$2, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	5(%rsi,%rbx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$3, %edi
	je	.LBB0_139
# %bb.135:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%rbp), %eax
	addl	$3, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-112(%rsp), %rcx                # 8-byte Reload
	leal	5(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$4, %edi
	je	.LBB0_139
# %bb.136:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%rbp), %eax
	addl	$4, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-128(%rsp), %rcx                # 8-byte Reload
	leal	5(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$5, %edi
	je	.LBB0_139
# %bb.137:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%rbp), %eax
	addl	$5, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-120(%rsp), %rcx                # 8-byte Reload
	leal	5(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$6, %edi
	je	.LBB0_139
# %bb.138:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%rbp), %eax
	addl	$6, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-104(%rsp), %rcx                # 8-byte Reload
	addl	%esi, %ecx
	addl	$5, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	.p2align	4, 0x90
.LBB0_139:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r8), %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	(%rsi,%r10), %ecx
	addl	$6, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$1, %edi
	je	.LBB0_146
# %bb.140:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r8), %eax
	incl	%eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	6(%rsi,%r11), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$2, %edi
	je	.LBB0_146
# %bb.141:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r8), %eax
	addl	$2, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	6(%rsi,%rbx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$3, %edi
	je	.LBB0_146
# %bb.142:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r8), %eax
	addl	$3, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-112(%rsp), %rcx                # 8-byte Reload
	leal	6(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$4, %edi
	je	.LBB0_146
# %bb.143:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r8), %eax
	addl	$4, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-128(%rsp), %rcx                # 8-byte Reload
	leal	6(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$5, %edi
	je	.LBB0_146
# %bb.144:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r8), %eax
	addl	$5, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-120(%rsp), %rcx                # 8-byte Reload
	leal	6(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$6, %edi
	je	.LBB0_146
# %bb.145:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r8), %eax
	addl	$6, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-104(%rsp), %rcx                # 8-byte Reload
	addl	%esi, %ecx
	addl	$6, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	.p2align	4, 0x90
.LBB0_146:                              #   in Loop: Header=BB0_97 Depth=1
	movq	-88(%rsp), %r8                  # 8-byte Reload
	leal	(%rsi,%r8), %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	(%rsi,%r10), %ecx
	addl	$7, %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$1, %edi
	je	.LBB0_153
# %bb.147:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r8), %eax
	incl	%eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	7(%rsi,%r11), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$2, %edi
	je	.LBB0_153
# %bb.148:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r8), %eax
	addl	$2, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	leal	7(%rsi,%rbx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$3, %edi
	je	.LBB0_153
# %bb.149:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r8), %eax
	addl	$3, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-112(%rsp), %rcx                # 8-byte Reload
	leal	7(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$4, %edi
	je	.LBB0_153
# %bb.150:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r8), %eax
	addl	$4, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-128(%rsp), %rcx                # 8-byte Reload
	leal	7(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$5, %edi
	je	.LBB0_153
# %bb.151:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r8), %eax
	addl	$5, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-120(%rsp), %rcx                # 8-byte Reload
	leal	7(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	cmpl	$6, %edi
	je	.LBB0_153
# %bb.152:                              #   in Loop: Header=BB0_97 Depth=1
	leal	(%rsi,%r8), %eax
	addl	$6, %eax
	vmovss	(%rdx,%rax,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movq	-104(%rsp), %rcx                # 8-byte Reload
	leal	7(%rsi,%rcx), %ecx
	vmovss	(%rdx,%rcx,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm1, (%rdx,%rax,4)
	vmovss	%xmm0, (%rdx,%rcx,4)
	jmp	.LBB0_153
.LBB0_154:
	movq	(%rsp), %rsi                    # 8-byte Reload
	movq	216(%rsp), %rcx                 # 8-byte Reload
	movq	-24(%rsp), %rax                 # 8-byte Reload
	testl	%edi, %edi
	jne	.LBB0_156
.LBB0_172:
	addq	$328, %rsp                      # imm = 0x148
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
.Lfunc_end0:
	.size	transpose_inplace_tiled_simd, .Lfunc_end0-transpose_inplace_tiled_simd
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 17.0.6 (9ubuntu1)"
	.section	".note.GNU-stack","",@progbits
