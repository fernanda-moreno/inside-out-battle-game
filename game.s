	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBadBullets.part.2, %function
fireBadBullets.part.2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L12
	mov	r3, #0
	mov	r2, ip
	b	.L4
.L2:
	add	r3, r3, #1
	cmp	r3, #20
	add	r2, r2, #40
	bxeq	lr
.L4:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L2
	str	lr, [sp, #-4]!
	mov	lr, #1
	ldr	r2, [r0, #4]
	add	r3, r3, r3, lsl #2
	ldr	r0, [r0]
	lsl	r3, r3, #3
	add	r1, ip, r3
	add	r2, r2, #10
	str	lr, [r1, #32]
	str	r0, [ip, r3]
	str	r2, [r1, #4]
	ldr	lr, [sp], #4
	bx	lr
.L13:
	.align	2
.L12:
	.word	bb
	.size	fireBadBullets.part.2, .-fireBadBullets.part.2
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #16
	mov	r4, #80
	mov	lr, #10
	mov	r2, #2
	mov	ip, #20
	mov	r0, #1
	ldr	r3, .L16
	str	r4, [r3, #4]
	str	lr, [r3]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	ip, [r3, #24]
	str	r0, [r3, #28]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, .L79
	ldrh	r3, [r3, #48]
	ldr	r5, .L79+4
	tst	r3, #32
	sub	sp, sp, #20
	ldr	r0, [r5]
	bne	.L19
	cmp	r0, #10
	ldrgt	r3, [r5, #8]
	subgt	r0, r0, r3
	strgt	r0, [r5]
.L19:
	ldr	r3, .L79
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L20
	cmp	r0, #89
	ldrle	r3, [r5, #8]
	addle	r0, r0, r3
	strle	r0, [r5]
.L20:
	ldr	r3, .L79
	ldrh	r3, [r3, #48]
	tst	r3, #64
	ldr	r1, [r5, #4]
	bne	.L21
	cmp	r1, #10
	ldrgt	r3, [r5, #12]
	subgt	r1, r1, r3
	strgt	r1, [r5, #4]
.L21:
	ldr	r3, .L79
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L22
	cmp	r1, #139
	ldrle	r3, [r5, #12]
	addle	r1, r1, r3
	strle	r1, [r5, #4]
.L22:
	ldr	r3, .L79
	ldrh	r3, [r3, #48]
	ands	r3, r3, #1
	ldr	r2, [r5, #24]
	bne	.L72
	cmp	r2, #19
	bgt	.L25
.L72:
	add	r2, r2, #1
.L24:
	ldr	r3, [r5, #28]
	str	r2, [r5, #24]
	cmp	r3, #1
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	beq	.L70
	ldr	r7, .L79+8
.L29:
	ldr	r4, .L79+12
	ldr	r8, .L79+16
	add	r6, r4, #288
	b	.L35
.L33:
	add	r4, r4, #36
	cmp	r6, r4
	beq	.L74
.L35:
	cmp	r0, #10
	ble	.L33
	ldr	ip, [r4, #28]
	cmp	ip, #0
	beq	.L33
	add	ip, r4, #16
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	ldr	lr, [r4, #4]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r3, [r8]
	ldrne	r0, [r5]
	subne	r3, r3, #1
	subne	r0, r0, #10
	add	r4, r4, #36
	strne	r3, [r8]
	ldmeq	r5, {r0, r1}
	strne	r0, [r5]
	ldrne	r1, [r5, #4]
	add	r2, r5, #16
	cmp	r6, r4
	ldm	r2, {r2, r3}
	bne	.L35
.L74:
	ldr	r4, .L79+20
	ldr	ip, [r4, #32]
	cmp	ip, #0
	bne	.L75
.L36:
	ldr	r4, .L79+24
	ldr	ip, [r4, #32]
	cmp	ip, #0
	bne	.L76
.L39:
	ldr	ip, .L79+28
	ldrh	ip, [ip]
	tst	ip, #512
	beq	.L42
	ldr	lr, .L79+32
	ldrh	lr, [lr]
	tst	lr, #512
	moveq	lr, #3
	streq	lr, [r5, #28]
.L42:
	tst	ip, #256
	beq	.L43
	ldr	ip, .L79+32
	ldrh	ip, [ip]
	tst	ip, #256
	moveq	ip, #1
	streq	ip, [r5, #28]
.L43:
	ldr	ip, .L79+36
	add	r4, ip, #16
	ldm	r4, {r4, lr}
	str	lr, [sp, #12]
	ldm	ip, {ip, lr}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	movne	r2, #0
	ldrne	r3, .L79+16
	strne	r2, [r3]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L25:
	ldr	lr, .L79+40
	mov	r2, lr
	b	.L28
.L26:
	add	r3, r3, #1
	cmp	r3, #30
	add	r2, r2, #40
	beq	.L27
.L28:
	ldr	ip, [r2, #32]
	cmp	ip, #0
	bne	.L26
	mov	r2, #1
	add	r3, r3, r3, lsl #2
	lsl	r3, r3, #3
	str	r0, [lr, r3]
	add	r3, lr, r3
	str	r1, [r3, #4]
	str	r2, [r3, #32]
.L27:
	mov	r2, #1
	b	.L24
.L70:
	ldr	r4, .L79+44
	mov	r9, #0
	ldr	r7, .L79+8
	ldr	r8, .L79+16
	add	r6, r4, #800
	b	.L32
.L30:
	add	r4, r4, #40
	cmp	r6, r4
	beq	.L29
.L32:
	ldr	ip, [r4, #32]
	cmp	ip, #0
	beq	.L30
	add	ip, r4, #24
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	ldr	lr, [r4, #4]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r3, [r8]
	add	r2, r5, #16
	subne	r3, r3, #1
	strne	r3, [r8]
	strne	r9, [r4, #32]
	ldm	r5, {r0, r1}
	ldm	r2, {r2, r3}
	b	.L30
.L76:
	add	ip, r4, #24
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	ldr	lr, [r4, #4]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L77
	ldr	r2, .L79+16
	ldr	r3, [r2]
	cmp	r3, #4
	addle	r3, r3, #1
	strle	r3, [r2]
	mov	r3, #0
	add	r2, r5, #16
	str	r3, [r4, #32]
	ldr	r0, [r5]
	ldr	r1, [r5, #4]
	ldm	r2, {r2, r3}
	b	.L39
.L75:
	add	ip, r4, #24
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	ldr	lr, [r4, #4]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L78
	ldr	r2, .L79+16
	ldr	r3, [r2]
	cmp	r3, #4
	addle	r3, r3, #1
	strle	r3, [r2]
	mov	r3, #0
	add	r2, r5, #16
	str	r3, [r4, #32]
	ldr	r0, [r5]
	ldr	r1, [r5, #4]
	ldm	r2, {r2, r3}
	b	.L36
.L78:
	add	r2, r5, #16
	ldm	r5, {r0, r1}
	ldm	r2, {r2, r3}
	b	.L36
.L77:
	add	r2, r5, #16
	ldm	r5, {r0, r1}
	ldm	r2, {r2, r3}
	b	.L39
.L80:
	.align	2
.L79:
	.word	67109120
	.word	player
	.word	collision
	.word	miniDep1
	.word	livesRemaining
	.word	memball1
	.word	memball2
	.word	oldButtons
	.word	buttons
	.word	depression
	.word	b
	.word	bb
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L82
	ldr	r1, [r3]
	ldr	r0, [r3, #4]
	ldr	r2, [r3, #28]
	ldr	r3, .L82+4
	orr	r0, r0, #1024
	orr	r1, r1, #16384
	lsl	r2, r2, #5
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	bx	lr
.L83:
	.align	2
.L82:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initDepression
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDepression, %function
initDepression:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #64
	mov	r4, #2
	mov	lr, #80
	mov	r2, #1
	mov	ip, #200
	mov	r0, #0
	ldr	r3, .L86
	str	r4, [r3, #8]
	stm	r3, {ip, lr}
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r0, [r3, #24]
	str	r2, [r3, #12]
	str	r2, [r3, #28]
	pop	{r4, lr}
	bx	lr
.L87:
	.align	2
.L86:
	.word	depression
	.size	initDepression, .-initDepression
	.align	2
	.global	updateDepression
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDepression, %function
updateDepression:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r5, .L104
	ldr	r2, [r5, #12]
	ldr	r1, [r5, #4]
	add	r3, r1, r2
	cmp	r3, #130
	str	r3, [r5, #4]
	moveq	r3, r1
	rsbeq	r2, r2, #0
	streq	r2, [r5, #12]
	streq	r1, [r5, #4]
	cmp	r3, #20
	ldrle	r2, [r5, #12]
	ldr	r4, .L104+4
	suble	r3, r3, r2
	rsble	r2, r2, #0
	sub	sp, sp, #16
	strle	r3, [r5, #4]
	strle	r2, [r5, #12]
	mov	r9, #0
	ldr	r7, .L104+8
	ldr	r8, .L104+12
	add	r6, r4, #1200
	b	.L94
.L92:
	add	r4, r4, #40
	cmp	r4, r6
	beq	.L103
.L94:
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L92
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L92
	add	r10, r4, #24
	ldm	r10, {r10, ip}
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	lr, [r4, #4]
	str	ip, [sp, #12]
	ldr	ip, [r4]
	ldm	r5, {r0, r1}
	str	r10, [sp, #8]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L92
	ldr	r3, [r8]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r9, [r4, #32]
	add	r4, r4, #40
	streq	r3, [r5, #28]
	cmp	r4, r6
	str	r3, [r8]
	bne	.L94
.L103:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L105:
	.align	2
.L104:
	.word	depression
	.word	b
	.word	collision
	.word	depressionLivesRemaining
	.size	updateDepression, .-updateDepression
	.align	2
	.global	drawDepression
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDepression, %function
drawDepression:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L107
	ldr	r3, [r2]
	mvn	r3, r3, lsl #17
	mov	r1, #122
	mvn	r3, r3, lsr #17
	ldr	r0, [r2, #4]
	ldr	r2, .L107+4
	strh	r3, [r2, #202]	@ movhi
	strh	r0, [r2, #200]	@ movhi
	strh	r1, [r2, #204]	@ movhi
	bx	lr
.L108:
	.align	2
.L107:
	.word	depression
	.word	shadowOAM
	.size	drawDepression, .-drawDepression
	.align	2
	.global	initMiniDepressions
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMiniDepressions, %function
initMiniDepressions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #5
	mov	r10, #16
	ldr	r4, .L113
	ldr	r6, .L113+4
	ldr	r8, .L113+8
	ldr	r7, .L113+12
.L110:
	mov	r9, #1
	str	r10, [r4, #16]
	str	r10, [r4, #20]
	str	r9, [r4, #8]
	mov	lr, pc
	bx	r6
	smull	fp, ip, r0, r8
	asr	r2, r0, #31
	rsb	r3, r2, ip, asr #2
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r0, r0, r3, lsl r9
	add	r0, r0, #10
	str	r0, [r4, #4]
	mov	lr, pc
	bx	r6
	smull	fp, ip, r0, r7
	asr	r2, r0, #31
	rsb	r3, r2, ip, asr #6
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #4
	str	r5, [r4, #32]
	sub	r3, r0, r3, lsl r9
	add	r5, r5, r9
	add	r3, r3, #40
	cmp	r5, #13
	str	r9, [r4, #28]
	str	r3, [r4]
	add	r4, r4, #36
	bne	.L110
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L114:
	.align	2
.L113:
	.word	miniDep1
	.word	rand
	.word	156180629
	.word	1616928865
	.size	initMiniDepressions, .-initMiniDepressions
	.align	2
	.global	updateMiniDepressions
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMiniDepressions, %function
updateMiniDepressions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, #0
	ldr	r5, .L132
	ldr	r7, .L132+4
	ldr	r6, .L132+8
	ldr	r9, .L132+12
	sub	sp, sp, #20
	add	r10, r5, #1200
.L116:
	ldr	r4, .L132+16
	b	.L120
.L118:
	add	r4, r4, #36
	cmp	r4, r6
	beq	.L131
.L120:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L118
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L118
	add	fp, r5, #24
	ldm	fp, {fp, ip}
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	lr, [r5, #4]
	str	ip, [sp, #12]
	ldr	ip, [r5]
	ldm	r4, {r0, r1}
	str	fp, [sp, #8]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	ldrne	r3, [r7]
	strne	r8, [r4, #28]
	subne	r3, r3, #1
	add	r4, r4, #36
	strne	r8, [r5, #32]
	strne	r3, [r7]
	cmp	r4, r6
	bne	.L120
.L131:
	add	r5, r5, #40
	cmp	r5, r10
	bne	.L116
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L115
	bl	initMiniDepressions
	mov	r3, #8
	str	r3, [r7]
.L115:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L133:
	.align	2
.L132:
	.word	b
	.word	enemiesRemaining
	.word	miniDep1+288
	.word	collision
	.word	miniDep1
	.size	updateMiniDepressions, .-updateMiniDepressions
	.align	2
	.global	drawMiniDepressions
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMiniDepressions, %function
drawMiniDepressions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, #512
	mov	r5, #60
	ldr	r3, .L140
	ldr	r0, .L140+4
	add	lr, r3, #288
.L137:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	ldr	r2, [r3, #32]
	lsl	r1, r2, #3
	ldmne	r3, {r2, r4}
	add	ip, r0, r1
	orrne	r2, r2, #16384
	lsleq	r2, r2, #3
	add	r3, r3, #36
	strhne	r5, [ip, #4]	@ movhi
	strhne	r2, [ip, #2]	@ movhi
	strhne	r4, [r0, r1]	@ movhi
	strheq	r6, [r0, r2]	@ movhi
	cmp	r3, lr
	bne	.L137
	pop	{r4, r5, r6, lr}
	bx	lr
.L141:
	.align	2
.L140:
	.word	miniDep1
	.word	shadowOAM
	.size	drawMiniDepressions, .-drawMiniDepressions
	.align	2
	.global	initPlayerBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayerBullets, %function
initPlayerBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r2, #30
	mov	r0, #16
	mvn	r7, #15
	mov	r1, #0
	mvn	r6, #1
	mov	r5, #2
	ldr	ip, .L146
	ldr	r3, .L146+4
	ldr	r4, [ip, #4]
	ldr	lr, [ip]
	add	ip, r3, #1200
.L143:
	str	r2, [r3, #36]
	str	r0, [r3, #28]
	str	r0, [r3, #24]
	str	r4, [r3, #12]
	str	lr, [r3, #8]
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	str	r1, [r3, #32]
	stm	r3, {r1, r7}
	add	r3, r3, #40
	cmp	r3, ip
	add	r2, r2, #1
	bne	.L143
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L147:
	.align	2
.L146:
	.word	player
	.word	b
	.size	initPlayerBullets, .-initPlayerBullets
	.align	2
	.global	updatePlayerBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayerBullets, %function
updatePlayerBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	ldrne	r2, [r0, #20]
	ldr	r3, [r0]
	strne	r3, [r0, #8]
	addne	r3, r3, r2
	strne	r3, [r0]
	cmp	r3, #230
	moveq	r3, #0
	streq	r3, [r0, #32]
	bx	lr
	.size	updatePlayerBullets, .-updatePlayerBullets
	.align	2
	.global	drawPlayerBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayerBullets, %function
drawPlayerBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	ldr	r3, [r0, #36]
	bne	.L161
	mov	r1, #512
	ldr	r2, .L162
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L161:
	str	lr, [sp, #-4]!
	mov	lr, #54
	ldr	r2, [r0]
	ldr	ip, .L162
	ldr	r0, [r0, #4]
	lsl	r3, r3, #3
	add	r1, ip, r3
	orr	r2, r2, #16384
	strh	lr, [r1, #4]	@ movhi
	strh	r0, [ip, r3]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L163:
	.align	2
.L162:
	.word	shadowOAM
	.size	drawPlayerBullets, .-drawPlayerBullets
	.align	2
	.global	firePlayerBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	firePlayerBullets, %function
firePlayerBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L174
	mov	r3, #0
	mov	r2, r0
	b	.L167
.L165:
	add	r3, r3, #1
	cmp	r3, #30
	add	r2, r2, #40
	bxeq	lr
.L167:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L165
	mov	r1, #1
	ldr	r2, .L174+4
	add	r3, r3, r3, lsl #2
	str	lr, [sp, #-4]!
	lsl	r3, r3, #3
	ldr	lr, [r2]
	ldr	ip, [r2, #4]
	add	r2, r0, r3
	str	lr, [r0, r3]
	str	ip, [r2, #4]
	str	r1, [r2, #32]
	ldr	lr, [sp], #4
	bx	lr
.L175:
	.align	2
.L174:
	.word	b
	.word	player
	.size	firePlayerBullets, .-firePlayerBullets
	.align	2
	.global	initBadBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBadBullets, %function
initBadBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r2, #100
	mov	r0, #16
	mvn	r7, #15
	mov	r1, #0
	mov	r6, #2
	mvn	r5, #1
	ldr	ip, .L180
	ldr	r3, .L180+4
	ldr	r4, [ip, #4]
	ldr	lr, [ip]
	add	ip, r3, #800
.L177:
	str	r2, [r3, #36]
	str	r0, [r3, #28]
	str	r0, [r3, #24]
	str	r4, [r3, #12]
	str	lr, [r3, #8]
	str	r6, [r3, #20]
	str	r5, [r3, #16]
	str	r1, [r3, #32]
	stm	r3, {r1, r7}
	add	r3, r3, #40
	cmp	r3, ip
	add	r2, r2, #1
	bne	.L177
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L181:
	.align	2
.L180:
	.word	depression
	.word	bb
	.size	initBadBullets, .-initBadBullets
	.align	2
	.global	updateBadBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBadBullets, %function
updateBadBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	ldrne	r2, [r0, #16]
	ldr	r3, [r0]
	strne	r3, [r0, #8]
	addne	r3, r3, r2
	strne	r3, [r0]
	cmp	r3, #0
	streq	r3, [r0, #32]
	bx	lr
	.size	updateBadBullets, .-updateBadBullets
	.align	2
	.global	drawBadBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBadBullets, %function
drawBadBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	ldr	r3, [r0, #36]
	bne	.L195
	mov	r1, #512
	ldr	r2, .L196
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L195:
	str	lr, [sp, #-4]!
	mov	lr, #56
	ldr	r2, [r0]
	ldr	ip, .L196
	ldr	r0, [r0, #4]
	lsl	r3, r3, #3
	add	r1, ip, r3
	orr	r2, r2, #16384
	strh	lr, [r1, #4]	@ movhi
	strh	r0, [ip, r3]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L197:
	.align	2
.L196:
	.word	shadowOAM
	.size	drawBadBullets, .-drawBadBullets
	.align	2
	.global	fireBadBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBadBullets, %function
fireBadBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	b	fireBadBullets.part.2
	.size	fireBadBullets, .-fireBadBullets
	.align	2
	.global	initMemoryBalls
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMemoryBalls, %function
initMemoryBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r7, #16
	ldr	r5, .L202
	ldr	r6, .L202+4
	str	r7, [r5, #24]
	str	r7, [r5, #28]
	mov	lr, pc
	bx	r6
	ldr	r10, .L202+8
	smull	r8, r9, r0, r10
	asr	r3, r0, #31
	rsb	r3, r3, r9, asr #2
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r0, r0, r3, lsl #1
	add	r0, r0, #1
	str	r0, [r5, #4]
	mov	lr, pc
	bx	r6
	mov	r8, #1
	mov	r1, #70
	ldr	r9, .L202+12
	smull	r2, r3, r0, r9
	add	r2, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	rsb	r3, r3, r3, lsl #4
	ldr	r4, .L202+16
	sub	r0, r0, r3, lsl #2
	add	r0, r0, #25
	str	r1, [r5, #36]
	str	r7, [r4, #24]
	str	r7, [r4, #28]
	str	r0, [r5]
	str	r8, [r5, #32]
	mov	lr, pc
	bx	r6
	smull	fp, ip, r0, r10
	asr	r2, r0, #31
	rsb	r3, r2, ip, asr #2
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r0, r0, r3, lsl r8
	add	r0, r0, r8
	str	r0, [r4, #4]
	mov	lr, pc
	bx	r6
	mov	r2, #71
	smull	r6, r7, r0, r9
	asr	r3, r0, #31
	add	r1, r0, r7
	rsb	r3, r3, r1, asr #5
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #2
	add	r0, r0, #25
	str	r8, [r4, #32]
	str	r0, [r4]
	str	r2, [r4, #36]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L203:
	.align	2
.L202:
	.word	memball1
	.word	rand
	.word	156180629
	.word	-2004318071
	.word	memball2
	.size	initMemoryBalls, .-initMemoryBalls
	.align	2
	.global	updateMemoryBalls
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMemoryBalls, %function
updateMemoryBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateMemoryBalls, .-updateMemoryBalls
	.align	2
	.global	drawMemoryBalls
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMemoryBalls, %function
drawMemoryBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L212
	ldr	r3, [r2, #32]
	cmp	r3, #0
	str	lr, [sp, #-4]!
	ldr	r3, [r2, #36]
	beq	.L206
	mov	ip, #46
	ldr	r1, .L212+4
	ldr	r0, [r2]
	lsl	r3, r3, #3
	ldr	lr, [r2, #4]
	orr	r2, r0, #16384
	add	r0, r1, r3
	strh	lr, [r1, r3]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	ip, [r0, #4]	@ movhi
.L207:
	ldr	r2, .L212+8
	ldr	r3, [r2, #32]
	cmp	r3, #0
	ldr	r3, [r2, #36]
	bne	.L211
	mov	r2, #512
	lsl	r3, r3, #3
	strh	r2, [r1, r3]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L206:
	mov	r2, #512
	ldr	r1, .L212+4
	lsl	r3, r3, #3
	strh	r2, [r1, r3]	@ movhi
	b	.L207
.L211:
	mov	ip, #44
	ldr	r0, [r2]
	ldr	lr, [r2, #4]
	lsl	r3, r3, #3
	orr	r2, r0, #16384
	add	r0, r1, r3
	strh	lr, [r1, r3]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	ip, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L213:
	.align	2
.L212:
	.word	memball1
	.word	shadowOAM
	.word	memball2
	.size	drawMemoryBalls, .-drawMemoryBalls
	.align	2
	.global	initLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLives, %function
initLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #16
	mov	r0, #130
	mov	r1, #1
	mov	r6, #10
	mov	r5, #30
	mov	r4, #50
	mov	lr, #70
	mov	ip, #90
	ldr	r2, .L216
	str	r6, [r2]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r0, [r2, #4]
	str	r1, [r2, #16]
	ldr	r2, .L216+4
	str	r5, [r2]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r0, [r2, #4]
	str	r1, [r2, #16]
	ldr	r2, .L216+8
	str	r4, [r2]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r0, [r2, #4]
	str	r1, [r2, #16]
	ldr	r2, .L216+12
	str	lr, [r2]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r0, [r2, #4]
	str	r1, [r2, #16]
	ldr	r2, .L216+16
	pop	{r4, r5, r6, lr}
	stmib	r2, {r0, r3}
	str	r3, [r2, #12]
	str	r1, [r2, #16]
	str	ip, [r2]
	bx	lr
.L217:
	.align	2
.L216:
	.word	life1
	.word	life2
	.word	life3
	.word	life4
	.word	life5
	.size	initLives, .-initLives
	.align	2
	.global	updateLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLives, %function
updateLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L225
	ldr	r3, [r3]
	cmp	r3, #5
	beq	.L224
	cmp	r3, #4
	bne	.L221
	mov	r0, #0
	mov	r2, #1
	ldr	r1, .L225+4
	ldr	r3, .L225+8
	str	r0, [r1, #16]
	str	r2, [r3, #16]
	bx	lr
.L221:
	cmp	r3, #3
	bne	.L222
	mov	r0, #0
	mov	r2, #1
	ldr	r1, .L225+8
	ldr	r3, .L225+12
	str	r0, [r1, #16]
	str	r2, [r3, #16]
	bx	lr
.L224:
	mov	r2, #1
	ldr	r3, .L225+4
	str	r2, [r3, #16]
	bx	lr
.L222:
	cmp	r3, #2
	bne	.L223
	mov	r0, #0
	mov	r2, #1
	ldr	r1, .L225+12
	ldr	r3, .L225+16
	str	r0, [r1, #16]
	str	r2, [r3, #16]
	bx	lr
.L223:
	cmp	r3, #1
	moveq	r0, #0
	ldreq	r1, .L225+16
	ldreq	r2, .L225+20
	streq	r0, [r1, #16]
	streq	r3, [r2, #16]
	bx	lr
.L226:
	.align	2
.L225:
	.word	livesRemaining
	.word	life5
	.word	life4
	.word	life3
	.word	life2
	.word	life1
	.size	updateLives, .-updateLives
	.align	2
	.global	drawLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L238
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L228
	mov	r1, #34
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L238+4
	orr	r2, r2, #16384
	strh	r2, [r3, #162]	@ movhi
	strh	r0, [r3, #160]	@ movhi
	strh	r1, [r3, #164]	@ movhi
.L229:
	ldr	r2, .L238+8
	ldr	r1, [r2, #16]
	cmp	r1, #0
	moveq	r2, #512
	movne	r0, #34
	ldmne	r2, {r1, ip}
	orrne	r2, r1, #16384
	strhne	r2, [r3, #154]	@ movhi
	strheq	r2, [r3, #152]	@ movhi
	ldr	r2, .L238+12
	ldr	r1, [r2, #16]
	strhne	ip, [r3, #152]	@ movhi
	strhne	r0, [r3, #156]	@ movhi
	cmp	r1, #0
	moveq	r2, #512
	movne	r0, #34
	ldmne	r2, {r1, ip}
	orrne	r2, r1, #16384
	strhne	r2, [r3, #146]	@ movhi
	strheq	r2, [r3, #144]	@ movhi
	ldr	r2, .L238+16
	ldr	r1, [r2, #16]
	strhne	ip, [r3, #144]	@ movhi
	strhne	r0, [r3, #148]	@ movhi
	cmp	r1, #0
	moveq	r2, #512
	movne	r0, #34
	ldmne	r2, {r1, ip}
	orrne	r2, r1, #16384
	strhne	r2, [r3, #138]	@ movhi
	strheq	r2, [r3, #136]	@ movhi
	ldr	r2, .L238+20
	ldr	r1, [r2, #16]
	strhne	ip, [r3, #136]	@ movhi
	strhne	r0, [r3, #140]	@ movhi
	cmp	r1, #0
	movne	r0, #34
	moveq	r2, #512
	ldmne	r2, {r1, ip}
	orrne	r2, r1, #16384
	strhne	r2, [r3, #130]	@ movhi
	strhne	ip, [r3, #128]	@ movhi
	strhne	r0, [r3, #132]	@ movhi
	strheq	r2, [r3, #128]	@ movhi
	bx	lr
.L228:
	mov	r2, #512
	ldr	r3, .L238+4
	strh	r2, [r3, #160]	@ movhi
	b	.L229
.L239:
	.align	2
.L238:
	.word	life1
	.word	shadowOAM
	.word	life2
	.word	life3
	.word	life4
	.word	life5
	.size	drawLives, .-drawLives
	.align	2
	.global	initEnemyLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemyLives, %function
initEnemyLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r3, #16
	mov	r1, #4
	mov	r2, #1
	mov	fp, #120
	mov	r10, #130
	mov	r9, #140
	mov	r8, #150
	mov	r7, #160
	mov	r6, #170
	mov	r5, #180
	mov	r4, #190
	mov	lr, #200
	mov	ip, #210
	ldr	r0, .L242
	str	r3, [r0, #8]
	str	fp, [r0]
	str	r3, [r0, #12]
	str	r1, [r0, #4]
	str	r2, [r0, #16]
	ldr	r0, .L242+4
	str	r3, [r0, #8]
	str	r10, [r0]
	str	r3, [r0, #12]
	str	r1, [r0, #4]
	str	r2, [r0, #16]
	ldr	r0, .L242+8
	str	r3, [r0, #8]
	str	r9, [r0]
	str	r3, [r0, #12]
	str	r1, [r0, #4]
	str	r2, [r0, #16]
	ldr	r0, .L242+12
	str	r3, [r0, #8]
	str	r8, [r0]
	str	r3, [r0, #12]
	str	r1, [r0, #4]
	str	r2, [r0, #16]
	ldr	r0, .L242+16
	str	r3, [r0, #8]
	str	r7, [r0]
	str	r3, [r0, #12]
	str	r1, [r0, #4]
	str	r2, [r0, #16]
	ldr	r0, .L242+20
	str	r3, [r0, #8]
	str	r6, [r0]
	str	r3, [r0, #12]
	str	r1, [r0, #4]
	str	r2, [r0, #16]
	ldr	r0, .L242+24
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	str	r5, [r0]
	str	r1, [r0, #4]
	str	r2, [r0, #16]
	ldr	r0, .L242+28
	str	r4, [r0]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	str	r1, [r0, #4]
	str	r2, [r0, #16]
	ldr	r0, .L242+32
	str	lr, [r0]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	str	r1, [r0, #4]
	str	r2, [r0, #16]
	ldr	r0, .L242+36
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	stmib	r0, {r1, r3}
	str	r3, [r0, #12]
	str	r2, [r0, #16]
	str	ip, [r0]
	bx	lr
.L243:
	.align	2
.L242:
	.word	eLife1
	.word	eLife2
	.word	eLife3
	.word	eLife4
	.word	eLife5
	.word	eLife6
	.word	eLife7
	.word	eLife8
	.word	eLife9
	.word	eLife10
	.size	initEnemyLives, .-initEnemyLives
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L246
	mov	lr, pc
	bx	r3
	mov	r3, #16
	mov	r0, #2
	mov	r1, #1
	mov	lr, #80
	mov	ip, #64
	mov	r4, #0
	mov	r7, #10
	mov	r6, #20
	mov	r5, #200
	ldr	r2, .L246+4
	str	r3, [r2, #16]
	str	r3, [r2, #20]
	ldr	r3, .L246+8
	str	r7, [r2]
	str	r6, [r2, #24]
	str	r0, [r2, #8]
	str	r0, [r2, #12]
	str	r0, [r3, #8]
	str	r5, [r3]
	str	lr, [r2, #4]
	str	lr, [r3, #4]
	str	r1, [r2, #28]
	str	r1, [r3, #12]
	str	r1, [r3, #28]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r4, [r3, #24]
	bl	initMiniDepressions
	bl	initPlayerBullets
	bl	initBadBullets
	bl	initMemoryBalls
	bl	initLives
	bl	initEnemyLives
	ldr	r3, .L246+12
	ldr	ip, .L246+16
	ldrh	r0, [r3, #48]
	ldr	r1, .L246+20
	ldr	r2, .L246+24
	ldr	r3, .L246+28
	strh	r4, [ip]	@ movhi
	strh	r4, [r2]	@ movhi
	str	r4, [r3]
	strh	r0, [r1]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L247:
	.align	2
.L246:
	.word	hideSprites
	.word	player
	.word	depression
	.word	67109120
	.word	hOff
	.word	buttons
	.word	hOff1
	.word	frameCounter
	.size	initGame, .-initGame
	.align	2
	.global	updateEnemyLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemyLives, %function
updateEnemyLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L260
	ldr	r3, [r3]
	cmp	r3, #9
	beq	.L259
	cmp	r3, #8
	bne	.L251
	mov	r2, #0
	ldr	r3, .L260+4
	str	r2, [r3, #16]
	bx	lr
.L251:
	cmp	r3, #7
	bne	.L252
	mov	r2, #0
	ldr	r3, .L260+8
	str	r2, [r3, #16]
	bx	lr
.L259:
	mov	r2, #0
	ldr	r3, .L260+12
	str	r2, [r3, #16]
	bx	lr
.L252:
	cmp	r3, #6
	bne	.L254
	mov	r2, #0
	ldr	r3, .L260+16
	str	r2, [r3, #16]
	bx	lr
.L254:
	cmp	r3, #5
	bne	.L250
	mov	r2, #0
	ldr	r3, .L260+20
	str	r2, [r3, #16]
	bx	lr
.L250:
	cmp	r3, #4
	bne	.L253
	mov	r2, #0
	ldr	r3, .L260+24
	str	r2, [r3, #16]
	bx	lr
.L253:
	cmp	r3, #3
	bne	.L255
	mov	r2, #0
	ldr	r3, .L260+28
	str	r2, [r3, #16]
	bx	lr
.L255:
	cmp	r3, #2
	bne	.L258
	mov	r2, #0
	ldr	r3, .L260+32
	str	r2, [r3, #16]
	bx	lr
.L258:
	cmp	r3, #1
	bne	.L256
	mov	r2, #0
	ldr	r3, .L260+36
	str	r2, [r3, #16]
	bx	lr
.L256:
	cmp	r3, #0
	ldreq	r2, .L260+40
	streq	r3, [r2, #16]
	bx	lr
.L261:
	.align	2
.L260:
	.word	depressionLivesRemaining
	.word	eLife9
	.word	eLife8
	.word	eLife10
	.word	eLife7
	.word	eLife6
	.word	eLife5
	.word	eLife4
	.word	eLife3
	.word	eLife2
	.word	eLife1
	.size	updateEnemyLives, .-updateEnemyLives
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	ldr	r1, .L287
	ldr	r3, .L287+4
	ldr	r2, [r1]
	ldrh	ip, [r3]
	add	r2, r2, #1
	push	{r4, lr}
	str	r2, [r1]
	strh	ip, [r0, #16]	@ movhi
	ldrh	r2, [r3]
	ldr	r1, .L287+8
	add	r2, r2, #1
	strh	r2, [r3]	@ movhi
	mov	lr, pc
	bx	r1
	bl	updatePlayer
	bl	updateDepression
	bl	updateMiniDepressions
	bl	updateMiniDepressions
	bl	updateMiniDepressions
	bl	updateMiniDepressions
	bl	updateMiniDepressions
	bl	updateMiniDepressions
	bl	updateMiniDepressions
	bl	updateMiniDepressions
	mov	ip, #0
	ldr	r3, .L287+12
	add	r1, r3, #1200
.L265:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	ldrne	r0, [r3, #20]
	ldr	r2, [r3]
	strne	r2, [r3, #8]
	addne	r2, r2, r0
	strne	r2, [r3]
	cmp	r2, #230
	streq	ip, [r3, #32]
	add	r3, r3, #40
	cmp	r1, r3
	bne	.L265
	ldr	r3, .L287+16
	add	r1, r3, #800
.L268:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	ldrne	r0, [r3, #16]
	ldr	r2, [r3]
	strne	r2, [r3, #8]
	addne	r2, r2, r0
	strne	r2, [r3]
	cmp	r2, #0
	streq	r2, [r3, #32]
	add	r3, r3, #40
	cmp	r3, r1
	bne	.L268
	ldr	r4, .L287+20
	ldr	r2, .L287+24
	ldr	r3, [r4, #24]
	smull	r0, r1, r3, r2
	asr	r2, r3, #31
	add	r1, r3, r1
	rsb	r2, r2, r1, asr #4
	rsb	r2, r2, r2, lsl #4
	cmp	r3, r2, lsl #1
	addne	r3, r3, #1
	bne	.L270
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L286
.L271:
	mov	r3, #1
.L270:
	str	r3, [r4, #24]
	mov	r4, #10
	bl	updateLives
	bl	updateLives
	bl	updateLives
	bl	updateLives
	bl	updateLives
.L272:
	bl	updateEnemyLives
	subs	r4, r4, #1
	bne	.L272
	pop	{r4, lr}
	bx	lr
.L286:
	mov	r0, r4
	bl	fireBadBullets.part.2
	b	.L271
.L288:
	.align	2
.L287:
	.word	frameCounter
	.word	hOff
	.word	waitForVBlank
	.word	b
	.word	bb
	.word	depression
	.word	-2004318071
	.size	updateGame, .-updateGame
	.align	2
	.global	drawEnemyLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemyLives, %function
drawEnemyLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L319
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L290
	mov	r1, #36
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L319+4
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	r3, .L319+8
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L292
.L311:
	mov	r1, #36
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L319+12
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	r3, .L319+16
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L294
.L312:
	mov	r1, #36
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L319+20
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	r3, .L319+24
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L296
.L313:
	mov	r1, #36
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L319+28
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	r3, .L319+32
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L298
.L314:
	mov	r1, #36
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L319+36
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	r3, .L319+40
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L300
.L315:
	mov	r1, #36
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L319+44
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	r3, .L319+48
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L302
.L316:
	mov	r1, #36
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L319+52
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	r3, .L319+56
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L304
.L317:
	mov	r1, #36
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L319+60
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	r3, .L319+64
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L306
.L318:
	mov	r1, #36
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L319+68
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	r3, .L319+72
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L310
.L308:
	mov	r2, #512
	ldr	r3, .L319+76
	strh	r2, [r3]	@ movhi
	bx	lr
.L290:
	mov	r2, #512
	ldr	r3, .L319+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L319+8
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L311
.L292:
	mov	r2, #512
	ldr	r3, .L319+12
	strh	r2, [r3]	@ movhi
	ldr	r3, .L319+16
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L312
.L294:
	mov	r2, #512
	ldr	r3, .L319+20
	strh	r2, [r3]	@ movhi
	ldr	r3, .L319+24
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L313
.L296:
	mov	r2, #512
	ldr	r3, .L319+28
	strh	r2, [r3]	@ movhi
	ldr	r3, .L319+32
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L314
.L298:
	mov	r2, #512
	ldr	r3, .L319+36
	strh	r2, [r3]	@ movhi
	ldr	r3, .L319+40
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L315
.L300:
	mov	r2, #512
	ldr	r3, .L319+44
	strh	r2, [r3]	@ movhi
	ldr	r3, .L319+48
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L316
.L302:
	mov	r2, #512
	ldr	r3, .L319+52
	strh	r2, [r3]	@ movhi
	ldr	r3, .L319+56
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L317
.L304:
	mov	r2, #512
	ldr	r3, .L319+60
	strh	r2, [r3]	@ movhi
	ldr	r3, .L319+64
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L318
.L306:
	mov	r2, #512
	ldr	r3, .L319+68
	strh	r2, [r3]	@ movhi
	ldr	r3, .L319+72
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L308
.L310:
	mov	r1, #36
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L319+76
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	bx	lr
.L320:
	.align	2
.L319:
	.word	eLife1
	.word	shadowOAM+480
	.word	eLife2
	.word	shadowOAM+488
	.word	eLife3
	.word	shadowOAM+496
	.word	eLife4
	.word	shadowOAM+504
	.word	eLife5
	.word	shadowOAM+512
	.word	eLife6
	.word	shadowOAM+520
	.word	eLife7
	.word	shadowOAM+528
	.word	eLife8
	.word	shadowOAM+536
	.word	eLife9
	.word	shadowOAM+544
	.word	eLife10
	.word	shadowOAM+552
	.size	drawEnemyLives, .-drawEnemyLives
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L335
	ldr	r3, [r1]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	mov	ip, #122
	push	{r4, r5, r6, lr}
	mov	r6, #512
	mov	r5, #60
	ldr	lr, [r1, #4]
	ldr	r2, .L335+4
	ldr	r1, .L335+8
	strh	r3, [r1, #202]	@ movhi
	ldr	r3, [r2]
	ldr	r0, [r2, #4]
	ldr	r2, [r2, #28]
	orr	r3, r3, #16384
	orr	r0, r0, #1024
	lsl	r2, r2, #5
	strh	r3, [r1, #2]	@ movhi
	ldr	r3, .L335+12
	strh	r0, [r1]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	strh	ip, [r1, #204]	@ movhi
	strh	lr, [r1, #200]	@ movhi
	add	lr, r3, #288
.L324:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	ldr	r2, [r3, #32]
	lsl	r0, r2, #3
	ldmne	r3, {r2, r4}
	add	ip, r1, r0
	orrne	r2, r2, #16384
	lsleq	r2, r2, #3
	add	r3, r3, #36
	strhne	r5, [ip, #4]	@ movhi
	strhne	r2, [ip, #2]	@ movhi
	strhne	r4, [r1, r0]	@ movhi
	strheq	r6, [r1, r2]	@ movhi
	cmp	r3, lr
	bne	.L324
	mov	r4, #512
	mov	r6, #54
	ldr	r3, .L335+16
	add	ip, r3, #1200
.L327:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	ldr	r2, [r3, #36]
	ldrne	r0, [r3]
	lslne	r2, r2, #3
	ldrne	r5, [r3, #4]
	addne	lr, r1, r2
	orrne	r0, r0, #16384
	lsleq	r2, r2, #3
	add	r3, r3, #40
	strhne	r5, [r1, r2]	@ movhi
	strhne	r6, [lr, #4]	@ movhi
	strhne	r0, [lr, #2]	@ movhi
	strheq	r4, [r1, r2]	@ movhi
	cmp	r3, ip
	bne	.L327
	mov	r4, #512
	mov	r6, #56
	ldr	r3, .L335+20
	add	ip, r3, #800
.L330:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	ldr	r2, [r3, #36]
	ldrne	r0, [r3]
	lslne	r2, r2, #3
	ldrne	r5, [r3, #4]
	addne	lr, r1, r2
	orrne	r0, r0, #16384
	lsleq	r2, r2, #3
	add	r3, r3, #40
	strhne	r5, [r1, r2]	@ movhi
	strhne	r6, [lr, #4]	@ movhi
	strhne	r0, [lr, #2]	@ movhi
	strheq	r4, [r1, r2]	@ movhi
	cmp	r3, ip
	bne	.L330
	bl	drawMemoryBalls
	bl	drawLives
	bl	drawEnemyLives
	ldr	r3, .L335+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L335+28
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L335+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L336:
	.align	2
.L335:
	.word	depression
	.word	player
	.word	shadowOAM
	.word	miniDep1
	.word	b
	.word	bb
	.word	waitForVBlank
	.word	DMANow
	.size	drawGame, .-drawGame
	.comm	hOff1,2,2
	.comm	hOff,2,2
	.comm	frameCounter,4,4
	.comm	shadowOAM,1024,4
	.comm	eLife10,20,4
	.comm	eLife9,20,4
	.comm	eLife8,20,4
	.comm	eLife7,20,4
	.comm	eLife6,20,4
	.comm	eLife5,20,4
	.comm	eLife4,20,4
	.comm	eLife3,20,4
	.comm	eLife2,20,4
	.comm	eLife1,20,4
	.comm	life5,20,4
	.comm	life4,20,4
	.comm	life3,20,4
	.comm	life2,20,4
	.comm	life1,20,4
	.comm	memball2,40,4
	.comm	memball1,40,4
	.comm	bb,800,4
	.comm	b,1200,4
	.comm	miniDep1,288,4
	.comm	depression,36,4
	.comm	player,32,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
