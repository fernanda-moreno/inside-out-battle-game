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
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMemoryBalls.part.3, %function
updateMemoryBalls.part.3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L19
	add	r1, r3, #40
	ldm	r1, {r1, r2}
	cmp	r2, r1
	movge	r2, #1
	addlt	r1, r2, #1
	addlt	r2, r1, r2
	str	r2, [r3, #44]
	ldr	r3, .L19+4
	add	r1, r3, #40
	ldm	r1, {r1, r2}
	cmp	r2, r1
	movge	r2, #1
	addlt	r1, r2, #1
	addlt	r2, r1, r2
	str	r2, [r3, #44]
	mov	r2, #0
	ldr	r3, .L19+8
	str	r2, [r3]
	bx	lr
.L20:
	.align	2
.L19:
	.word	memball1
	.word	memball2
	.word	memballCounter
	.size	updateMemoryBalls.part.3, .-updateMemoryBalls.part.3
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
	ldr	r3, .L23
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
.L24:
	.align	2
.L23:
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
	ldr	r3, .L87
	ldrh	r3, [r3, #48]
	ldr	r5, .L87+4
	tst	r3, #32
	sub	sp, sp, #20
	ldr	r0, [r5]
	bne	.L26
	cmp	r0, #10
	ldrgt	r3, [r5, #8]
	subgt	r0, r0, r3
	strgt	r0, [r5]
.L26:
	ldr	r3, .L87
	ldrh	r3, [r3, #48]
	tst	r3, #16
	ldr	r2, [r5, #16]
	bne	.L27
	rsb	r3, r2, #120
	cmp	r3, r0
	ldrgt	r3, [r5, #8]
	addgt	r0, r0, r3
	strgt	r0, [r5]
.L27:
	ldr	r3, .L87
	ldrh	r3, [r3, #48]
	tst	r3, #64
	ldr	r1, [r5, #4]
	bne	.L28
	cmp	r1, #10
	ldrgt	r3, [r5, #12]
	subgt	r1, r1, r3
	strgt	r1, [r5, #4]
.L28:
	ldr	r3, .L87
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L29
	cmp	r1, #139
	ldrle	r3, [r5, #12]
	addle	r1, r1, r3
	strle	r1, [r5, #4]
.L29:
	ldr	r3, .L87
	ldrh	r3, [r3, #48]
	ands	r3, r3, #1
	ldr	ip, [r5, #24]
	bne	.L79
	cmp	ip, #19
	bgt	.L32
.L79:
	add	ip, ip, #1
.L31:
	ldr	r3, [r5, #28]
	cmp	r3, #1
	str	ip, [r5, #24]
	ldr	r3, [r5, #20]
	beq	.L77
	ldr	r7, .L87+8
.L36:
	ldr	r4, .L87+12
	ldr	r8, .L87+16
	add	r6, r4, #352
	b	.L42
.L40:
	add	r4, r4, #44
	cmp	r4, r6
	beq	.L81
.L42:
	cmp	r0, #10
	ble	.L40
	ldr	ip, [r4, #28]
	cmp	ip, #0
	beq	.L40
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
	add	r4, r4, #44
	strne	r3, [r8]
	ldmeq	r5, {r0, r1}
	strne	r0, [r5]
	ldrne	r1, [r5, #4]
	add	r2, r5, #16
	cmp	r4, r6
	ldm	r2, {r2, r3}
	bne	.L42
.L81:
	ldr	r4, .L87+20
	ldr	ip, [r4, #32]
	cmp	ip, #0
	bne	.L82
.L43:
	ldr	r4, .L87+24
	ldr	ip, [r4, #32]
	cmp	ip, #0
	bne	.L83
.L46:
	ldr	ip, .L87+28
	ldr	lr, [r5, #28]
	ldrh	ip, [ip]
	cmp	lr, #1
	and	ip, ip, #512
	beq	.L84
	cmp	ip, #0
	beq	.L50
	ldr	ip, .L87+32
	ldrh	ip, [ip]
	tst	ip, #512
	moveq	ip, #1
	streq	ip, [r5, #28]
.L50:
	ldr	ip, .L87+36
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
	ldrne	r3, .L87+16
	strne	r2, [r3]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L32:
	ldr	r4, .L87+40
	mov	ip, r4
	b	.L35
.L33:
	add	r3, r3, #1
	cmp	r3, #30
	add	ip, ip, #40
	beq	.L34
.L35:
	ldr	lr, [ip, #32]
	cmp	lr, #0
	bne	.L33
	mov	ip, #1
	add	r3, r3, r3, lsl #2
	lsl	r3, r3, #3
	str	r0, [r4, r3]
	add	r3, r4, r3
	str	r1, [r3, #4]
	str	ip, [r3, #32]
.L34:
	mov	ip, #1
	b	.L31
.L84:
	cmp	ip, #0
	beq	.L50
	ldr	ip, .L87+32
	ldrh	ip, [ip]
	tst	ip, #512
	moveq	ip, #3
	streq	ip, [r5, #28]
	b	.L50
.L77:
	ldr	r4, .L87+44
	mov	r9, #0
	ldr	r7, .L87+8
	ldr	r8, .L87+16
	add	r6, r4, #800
	b	.L39
.L37:
	add	r4, r4, #40
	cmp	r6, r4
	beq	.L36
.L39:
	ldr	ip, [r4, #32]
	cmp	ip, #0
	beq	.L37
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
	b	.L37
.L83:
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
	beq	.L85
	ldr	r2, .L87+16
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
	b	.L46
.L82:
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
	beq	.L86
	ldr	r2, .L87+16
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
	b	.L43
.L86:
	add	r2, r5, #16
	ldm	r5, {r0, r1}
	ldm	r2, {r2, r3}
	b	.L43
.L85:
	add	r2, r5, #16
	ldm	r5, {r0, r1}
	ldm	r2, {r2, r3}
	b	.L46
.L88:
	.align	2
.L87:
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
	ldr	r3, .L90
	ldr	r1, [r3]
	ldr	r0, [r3, #4]
	ldr	r2, [r3, #28]
	ldr	r3, .L90+4
	orr	r0, r0, #1024
	orr	r1, r1, #16384
	lsl	r2, r2, #5
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	bx	lr
.L91:
	.align	2
.L90:
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
	push	{r4, r5, lr}
	mov	r2, #1
	mov	r1, #64
	mov	r5, #2
	mov	r4, #80
	mov	lr, #200
	mov	ip, #0
	mov	r0, #5
	ldr	r3, .L94
	stmib	r3, {r4, r5}
	str	lr, [r3]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	ip, [r3, #24]
	str	r0, [r3, #36]
	str	r2, [r3, #12]
	str	r2, [r3, #28]
	str	r2, [r3, #40]
	pop	{r4, r5, lr}
	bx	lr
.L95:
	.align	2
.L94:
	.word	depression
	.size	initDepression, .-initDepression
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
	ldr	r0, .L97
	ldr	r2, [r0]
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r3, [r0, #40]
	ldr	r1, .L97+4
	ldr	r0, [r0, #4]
	lsl	r3, r3, #5
	add	r3, r3, #26
	strh	r2, [r1, #202]	@ movhi
	strh	r0, [r1, #200]	@ movhi
	strh	r3, [r1, #204]	@ movhi
	bx	lr
.L98:
	.align	2
.L97:
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
	push	{r4, r5, r6, r7, r8, r9, fp, lr}
	mov	r5, #5
	mov	r9, #16
	ldr	r4, .L103
	ldr	r6, .L103+4
	ldr	r8, .L103+8
	ldr	r7, .L103+12
.L100:
	str	r9, [r4, #16]
	str	r9, [r4, #20]
	mov	lr, pc
	bx	r6
	smull	fp, ip, r0, r8
	asr	r2, r0, #31
	rsb	r3, r2, ip, asr #2
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r0, r0, r3, lsl #1
	add	r0, r0, #10
	str	r0, [r4, #4]
	mov	lr, pc
	bx	r6
	mov	r1, #1
	smull	fp, ip, r0, r7
	asr	r2, r0, #31
	rsb	r3, r2, ip, asr #6
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #4
	str	r5, [r4, #32]
	sub	r3, r0, r3, lsl r1
	add	r5, r5, r1
	add	r3, r3, #40
	cmp	r5, #13
	str	r3, [r4]
	str	r1, [r4, #12]
	str	r1, [r4, #28]
	add	r4, r4, #44
	bne	.L100
	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
	bx	lr
.L104:
	.align	2
.L103:
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
	ldr	r5, .L122
	ldr	r7, .L122+4
	ldr	r6, .L122+8
	ldr	r9, .L122+12
	sub	sp, sp, #20
	add	r10, r5, #1200
.L106:
	ldr	r4, .L122+16
	b	.L110
.L108:
	add	r4, r4, #44
	cmp	r4, r6
	beq	.L121
.L110:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L108
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L108
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
	add	r4, r4, #44
	strne	r8, [r5, #32]
	strne	r3, [r7]
	cmp	r4, r6
	bne	.L110
.L121:
	add	r5, r5, #40
	cmp	r5, r10
	bne	.L106
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L105
	bl	initMiniDepressions
	mov	r3, #8
	str	r3, [r7]
.L105:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L123:
	.align	2
.L122:
	.word	b
	.word	enemiesRemaining
	.word	miniDep1+352
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
	mov	r5, #38
	ldr	r3, .L130
	ldr	r0, .L130+4
	add	lr, r3, #352
.L127:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	ldr	r2, [r3, #32]
	lsl	r1, r2, #3
	ldmne	r3, {r2, r4}
	add	ip, r0, r1
	orrne	r2, r2, #16384
	lsleq	r2, r2, #3
	add	r3, r3, #44
	strhne	r5, [ip, #4]	@ movhi
	strhne	r2, [ip, #2]	@ movhi
	strhne	r4, [r0, r1]	@ movhi
	strheq	r6, [r0, r2]	@ movhi
	cmp	r3, lr
	bne	.L127
	pop	{r4, r5, r6, lr}
	bx	lr
.L131:
	.align	2
.L130:
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
	ldr	ip, .L136
	ldr	r3, .L136+4
	ldr	r4, [ip, #4]
	ldr	lr, [ip]
	add	ip, r3, #1200
.L133:
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
	bne	.L133
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L137:
	.align	2
.L136:
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
	ldr	r3, .L153
	ldr	r3, [r3, #28]
	cmp	r3, #1
	str	lr, [sp, #-4]!
	beq	.L151
	cmp	r3, #3
	bne	.L144
	ldr	r3, [r0, #32]
	cmp	r3, #0
	ldr	r3, [r0, #36]
	bne	.L152
.L148:
	mov	r1, #512
	ldr	r2, .L153+4
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
.L144:
	ldr	lr, [sp], #4
	bx	lr
.L151:
	ldr	r3, [r0, #32]
	cmp	r3, #0
	movne	lr, #54
	ldr	r3, [r0, #36]
	beq	.L148
.L150:
	ldr	r2, [r0]
	ldr	ip, .L153+4
	ldr	r0, [r0, #4]
	lsl	r3, r3, #3
	add	r1, ip, r3
	orr	r2, r2, #16384
	strh	r0, [ip, r3]	@ movhi
	strh	lr, [r1, #4]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L152:
	mov	lr, #118
	b	.L150
.L154:
	.align	2
.L153:
	.word	player
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
	ldr	r0, .L165
	mov	r3, #0
	mov	r2, r0
	b	.L158
.L156:
	add	r3, r3, #1
	cmp	r3, #30
	add	r2, r2, #40
	bxeq	lr
.L158:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L156
	mov	r1, #1
	ldr	r2, .L165+4
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
.L166:
	.align	2
.L165:
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
	ldr	ip, .L171
	ldr	r3, .L171+4
	ldr	r4, [ip, #4]
	ldr	lr, [ip]
	add	ip, r3, #800
.L168:
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
	bne	.L168
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L172:
	.align	2
.L171:
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
	bne	.L186
	mov	r1, #512
	ldr	r2, .L187
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L186:
	str	lr, [sp, #-4]!
	mov	lr, #56
	ldr	r2, [r0]
	ldr	ip, .L187
	ldr	r0, [r0, #4]
	lsl	r3, r3, #3
	add	r1, ip, r3
	orr	r2, r2, #16384
	strh	lr, [r1, #4]	@ movhi
	strh	r0, [ip, r3]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L188:
	.align	2
.L187:
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
	mov	r9, #16
	ldr	r5, .L193
	ldr	r7, .L193+4
	str	r9, [r5, #24]
	str	r9, [r5, #28]
	mov	lr, pc
	bx	r7
	ldr	fp, .L193+8
	smull	r1, r2, r0, fp
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r0, r0, r3, lsl #1
	add	r0, r0, #1
	str	r0, [r5, #4]
	mov	lr, pc
	bx	r7
	mov	r8, #5
	mov	r6, #1
	mov	r1, #70
	ldr	r10, .L193+12
	smull	r2, r3, r0, r10
	add	r2, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr r8
	rsb	r3, r3, r3, lsl #4
	ldr	r4, .L193+16
	sub	r0, r0, r3, lsl #2
	add	r0, r0, #25
	str	r1, [r5, #36]
	str	r0, [r5]
	str	r6, [r5, #32]
	str	r6, [r5, #44]
	str	r8, [r5, #40]
	str	r9, [r4, #24]
	str	r9, [r4, #28]
	mov	lr, pc
	bx	r7
	smull	r2, r3, r0, fp
	asr	r2, r0, #31
	rsb	r3, r2, r3, asr #2
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r0, r0, r3, lsl r6
	add	r0, r0, r6
	str	r0, [r4, #4]
	mov	lr, pc
	bx	r7
	mov	ip, #71
	smull	r1, r2, r0, r10
	asr	r3, r0, #31
	add	r2, r0, r2
	rsb	r3, r3, r2, asr r8
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #2
	add	r0, r0, #25
	str	r8, [r4, #40]
	str	r6, [r4, #32]
	str	r6, [r4, #44]
	str	r0, [r4]
	str	ip, [r4, #36]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L194:
	.align	2
.L193:
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
	ldr	r2, .L197
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #30
	str	r3, [r2]
	bxne	lr
	b	updateMemoryBalls.part.3
.L198:
	.align	2
.L197:
	.word	memballCounter
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
	ldr	r2, .L206
	ldr	r3, [r2, #32]
	cmp	r3, #0
	str	lr, [sp, #-4]!
	ldr	r3, [r2, #36]
	beq	.L200
	ldr	r0, [r2, #44]
	ldr	ip, [r2]
	ldr	r1, .L206+4
	lsl	r3, r3, #3
	ldr	lr, [r2, #4]
	lsl	r2, r0, #5
	add	r2, r2, #14
	orr	r0, ip, #16384
	add	ip, r1, r3
	strh	lr, [r1, r3]	@ movhi
	strh	r0, [ip, #2]	@ movhi
	strh	r2, [ip, #4]	@ movhi
.L201:
	ldr	r2, .L206+8
	ldr	r3, [r2, #32]
	cmp	r3, #0
	ldr	r3, [r2, #36]
	bne	.L205
	mov	r2, #512
	lsl	r3, r3, #3
	strh	r2, [r1, r3]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L200:
	mov	r2, #512
	ldr	r1, .L206+4
	lsl	r3, r3, #3
	strh	r2, [r1, r3]	@ movhi
	b	.L201
.L205:
	ldr	r0, [r2, #44]
	ldr	ip, [r2]
	ldr	lr, [r2, #4]
	lsl	r3, r3, #3
	lsl	r2, r0, #5
	add	r2, r2, #12
	orr	r0, ip, #16384
	add	ip, r1, r3
	strh	lr, [r1, r3]	@ movhi
	strh	r0, [ip, #2]	@ movhi
	strh	r2, [ip, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L207:
	.align	2
.L206:
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
	ldr	r2, .L210
	str	r6, [r2]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r0, [r2, #4]
	str	r1, [r2, #16]
	ldr	r2, .L210+4
	str	r5, [r2]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r0, [r2, #4]
	str	r1, [r2, #16]
	ldr	r2, .L210+8
	str	r4, [r2]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r0, [r2, #4]
	str	r1, [r2, #16]
	ldr	r2, .L210+12
	str	lr, [r2]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r0, [r2, #4]
	str	r1, [r2, #16]
	ldr	r2, .L210+16
	pop	{r4, r5, r6, lr}
	stmib	r2, {r0, r3}
	str	r3, [r2, #12]
	str	r1, [r2, #16]
	str	ip, [r2]
	bx	lr
.L211:
	.align	2
.L210:
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
	ldr	r3, .L219
	ldr	r3, [r3]
	cmp	r3, #5
	beq	.L218
	cmp	r3, #4
	bne	.L215
	mov	r0, #0
	mov	r2, #1
	ldr	r1, .L219+4
	ldr	r3, .L219+8
	str	r0, [r1, #16]
	str	r2, [r3, #16]
	bx	lr
.L215:
	cmp	r3, #3
	bne	.L216
	mov	r0, #0
	mov	r2, #1
	ldr	r1, .L219+8
	ldr	r3, .L219+12
	str	r0, [r1, #16]
	str	r2, [r3, #16]
	bx	lr
.L218:
	mov	r2, #1
	ldr	r3, .L219+4
	str	r2, [r3, #16]
	bx	lr
.L216:
	cmp	r3, #2
	bne	.L217
	mov	r0, #0
	mov	r2, #1
	ldr	r1, .L219+12
	ldr	r3, .L219+16
	str	r0, [r1, #16]
	str	r2, [r3, #16]
	bx	lr
.L217:
	cmp	r3, #1
	moveq	r0, #0
	ldreq	r1, .L219+16
	ldreq	r2, .L219+20
	streq	r0, [r1, #16]
	streq	r3, [r2, #16]
	bx	lr
.L220:
	.align	2
.L219:
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
	ldr	r3, .L232
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L222
	mov	r1, #34
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L232+4
	orr	r2, r2, #16384
	strh	r2, [r3, #162]	@ movhi
	strh	r0, [r3, #160]	@ movhi
	strh	r1, [r3, #164]	@ movhi
.L223:
	ldr	r2, .L232+8
	ldr	r1, [r2, #16]
	cmp	r1, #0
	moveq	r2, #512
	movne	r0, #34
	ldmne	r2, {r1, ip}
	orrne	r2, r1, #16384
	strhne	r2, [r3, #154]	@ movhi
	strheq	r2, [r3, #152]	@ movhi
	ldr	r2, .L232+12
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
	ldr	r2, .L232+16
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
	ldr	r2, .L232+20
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
.L222:
	mov	r2, #512
	ldr	r3, .L232+4
	strh	r2, [r3, #160]	@ movhi
	b	.L223
.L233:
	.align	2
.L232:
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
	ldr	r0, .L236
	str	r3, [r0, #8]
	str	fp, [r0]
	str	r3, [r0, #12]
	str	r1, [r0, #4]
	str	r2, [r0, #16]
	ldr	r0, .L236+4
	str	r3, [r0, #8]
	str	r10, [r0]
	str	r3, [r0, #12]
	str	r1, [r0, #4]
	str	r2, [r0, #16]
	ldr	r0, .L236+8
	str	r3, [r0, #8]
	str	r9, [r0]
	str	r3, [r0, #12]
	str	r1, [r0, #4]
	str	r2, [r0, #16]
	ldr	r0, .L236+12
	str	r3, [r0, #8]
	str	r8, [r0]
	str	r3, [r0, #12]
	str	r1, [r0, #4]
	str	r2, [r0, #16]
	ldr	r0, .L236+16
	str	r3, [r0, #8]
	str	r7, [r0]
	str	r3, [r0, #12]
	str	r1, [r0, #4]
	str	r2, [r0, #16]
	ldr	r0, .L236+20
	str	r3, [r0, #8]
	str	r6, [r0]
	str	r3, [r0, #12]
	str	r1, [r0, #4]
	str	r2, [r0, #16]
	ldr	r0, .L236+24
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	str	r5, [r0]
	str	r1, [r0, #4]
	str	r2, [r0, #16]
	ldr	r0, .L236+28
	str	r4, [r0]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	str	r1, [r0, #4]
	str	r2, [r0, #16]
	ldr	r0, .L236+32
	str	lr, [r0]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	str	r1, [r0, #4]
	str	r2, [r0, #16]
	ldr	r0, .L236+36
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	stmib	r0, {r1, r3}
	str	r3, [r0, #12]
	str	r2, [r0, #16]
	str	ip, [r0]
	bx	lr
.L237:
	.align	2
.L236:
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
	ldr	r3, .L240
	mov	lr, pc
	bx	r3
	mov	r3, #16
	mov	r1, #1
	mov	r0, #2
	mov	lr, #80
	mov	ip, #64
	mov	r4, #0
	mov	r8, #10
	mov	r7, #20
	mov	r6, #200
	mov	r5, #5
	ldr	r2, .L240+4
	str	r3, [r2, #16]
	str	r3, [r2, #20]
	ldr	r3, .L240+8
	str	r8, [r2]
	str	r7, [r2, #24]
	str	r0, [r2, #8]
	str	r0, [r2, #12]
	str	r0, [r3, #8]
	str	r6, [r3]
	str	r5, [r3, #36]
	str	lr, [r2, #4]
	str	lr, [r3, #4]
	str	r1, [r2, #28]
	str	r1, [r3, #12]
	str	r1, [r3, #28]
	str	r1, [r3, #40]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r4, [r3, #24]
	bl	initMiniDepressions
	bl	initPlayerBullets
	bl	initBadBullets
	bl	initMemoryBalls
	bl	initLives
	bl	initEnemyLives
	ldr	r3, .L240+12
	ldr	r2, .L240+16
	ldrh	ip, [r3, #48]
	ldr	r3, .L240+20
	strh	r4, [r2]	@ movhi
	strh	ip, [r3]	@ movhi
	ldr	r0, .L240+24
	ldr	r1, .L240+28
	ldr	r2, .L240+32
	ldr	r3, .L240+36
	strh	r4, [r0]	@ movhi
	str	r4, [r1]
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L241:
	.align	2
.L240:
	.word	hideSprites
	.word	player
	.word	depression
	.word	67109120
	.word	hOff
	.word	buttons
	.word	hOff1
	.word	frameCounter
	.word	memballCounter
	.word	depCounter
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
	ldr	r3, .L254
	ldr	r3, [r3]
	cmp	r3, #9
	beq	.L253
	cmp	r3, #8
	bne	.L245
	mov	r2, #0
	ldr	r3, .L254+4
	str	r2, [r3, #16]
	bx	lr
.L245:
	cmp	r3, #7
	bne	.L246
	mov	r2, #0
	ldr	r3, .L254+8
	str	r2, [r3, #16]
	bx	lr
.L253:
	mov	r2, #0
	ldr	r3, .L254+12
	str	r2, [r3, #16]
	bx	lr
.L246:
	cmp	r3, #6
	bne	.L248
	mov	r2, #0
	ldr	r3, .L254+16
	str	r2, [r3, #16]
	bx	lr
.L248:
	cmp	r3, #5
	bne	.L244
	mov	r2, #0
	ldr	r3, .L254+20
	str	r2, [r3, #16]
	bx	lr
.L244:
	cmp	r3, #4
	bne	.L247
	mov	r2, #0
	ldr	r3, .L254+24
	str	r2, [r3, #16]
	bx	lr
.L247:
	cmp	r3, #3
	bne	.L249
	mov	r2, #0
	ldr	r3, .L254+28
	str	r2, [r3, #16]
	bx	lr
.L249:
	cmp	r3, #2
	bne	.L252
	mov	r2, #0
	ldr	r3, .L254+32
	str	r2, [r3, #16]
	bx	lr
.L252:
	cmp	r3, #1
	bne	.L250
	mov	r2, #0
	ldr	r3, .L254+36
	str	r2, [r3, #16]
	bx	lr
.L250:
	cmp	r3, #0
	ldreq	r2, .L254+40
	streq	r3, [r2, #16]
	bx	lr
.L255:
	.align	2
.L254:
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
	ldr	r3, .L286
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L257
	mov	r1, #36
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L286+4
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	r3, .L286+8
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L259
.L278:
	mov	r1, #36
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L286+12
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	r3, .L286+16
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L261
.L279:
	mov	r1, #36
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L286+20
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	r3, .L286+24
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L263
.L280:
	mov	r1, #36
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L286+28
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	r3, .L286+32
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L265
.L281:
	mov	r1, #36
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L286+36
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	r3, .L286+40
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L267
.L282:
	mov	r1, #36
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L286+44
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	r3, .L286+48
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L269
.L283:
	mov	r1, #36
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L286+52
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	r3, .L286+56
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L271
.L284:
	mov	r1, #36
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L286+60
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	r3, .L286+64
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L273
.L285:
	mov	r1, #36
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L286+68
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	r3, .L286+72
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L277
.L275:
	mov	r2, #512
	ldr	r3, .L286+76
	strh	r2, [r3]	@ movhi
	bx	lr
.L257:
	mov	r2, #512
	ldr	r3, .L286+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L286+8
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L278
.L259:
	mov	r2, #512
	ldr	r3, .L286+12
	strh	r2, [r3]	@ movhi
	ldr	r3, .L286+16
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L279
.L261:
	mov	r2, #512
	ldr	r3, .L286+20
	strh	r2, [r3]	@ movhi
	ldr	r3, .L286+24
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L280
.L263:
	mov	r2, #512
	ldr	r3, .L286+28
	strh	r2, [r3]	@ movhi
	ldr	r3, .L286+32
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L281
.L265:
	mov	r2, #512
	ldr	r3, .L286+36
	strh	r2, [r3]	@ movhi
	ldr	r3, .L286+40
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L282
.L267:
	mov	r2, #512
	ldr	r3, .L286+44
	strh	r2, [r3]	@ movhi
	ldr	r3, .L286+48
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L283
.L269:
	mov	r2, #512
	ldr	r3, .L286+52
	strh	r2, [r3]	@ movhi
	ldr	r3, .L286+56
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L284
.L271:
	mov	r2, #512
	ldr	r3, .L286+60
	strh	r2, [r3]	@ movhi
	ldr	r3, .L286+64
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L285
.L273:
	mov	r2, #512
	ldr	r3, .L286+68
	strh	r2, [r3]	@ movhi
	ldr	r3, .L286+72
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L275
.L277:
	mov	r1, #36
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L286+76
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	bx	lr
.L287:
	.align	2
.L286:
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
	ldr	r1, .L300
	ldr	r3, [r1]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	push	{r4, r5, r6, lr}
	mov	r6, #512
	mov	r4, #38
	ldr	r5, .L300+4
	ldr	r0, .L300+8
	strh	r3, [r5, #202]	@ movhi
	ldr	r3, [r0, #4]
	orr	r3, r3, #1024
	ldr	r2, [r1, #40]
	strh	r3, [r5]	@ movhi
	ldr	r3, [r0, #28]
	ldr	ip, [r1, #4]
	ldr	r1, [r0]
	lsl	r3, r3, #5
	lsl	r2, r2, #5
	add	r2, r2, #26
	orr	r1, r1, #16384
	strh	r3, [r5, #4]	@ movhi
	ldr	r3, .L300+12
	strh	r1, [r5, #2]	@ movhi
	strh	r2, [r5, #204]	@ movhi
	strh	ip, [r5, #200]	@ movhi
	add	ip, r3, #352
.L291:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	ldr	r2, [r3, #32]
	lsl	r1, r2, #3
	ldmne	r3, {r2, lr}
	add	r0, r5, r1
	orrne	r2, r2, #16384
	lsleq	r2, r2, #3
	add	r3, r3, #44
	strhne	r4, [r0, #4]	@ movhi
	strhne	r2, [r0, #2]	@ movhi
	strhne	lr, [r5, r1]	@ movhi
	strheq	r6, [r5, r2]	@ movhi
	cmp	r3, ip
	bne	.L291
	ldr	r4, .L300+16
	add	r6, r4, #1200
.L292:
	mov	r0, r4
	add	r4, r4, #40
	bl	drawPlayerBullets
	cmp	r4, r6
	bne	.L292
	mov	lr, #512
	mov	r6, #56
	ldr	r3, .L300+20
	add	r0, r3, #800
.L295:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	ldr	r2, [r3, #36]
	ldrne	r1, [r3]
	lslne	r2, r2, #3
	ldrne	r4, [r3, #4]
	addne	ip, r5, r2
	orrne	r1, r1, #16384
	lsleq	r2, r2, #3
	add	r3, r3, #40
	strhne	r4, [r5, r2]	@ movhi
	strhne	r6, [ip, #4]	@ movhi
	strhne	r1, [ip, #2]	@ movhi
	strheq	lr, [r5, r2]	@ movhi
	cmp	r3, r0
	bne	.L295
	bl	drawMemoryBalls
	bl	drawLives
	bl	drawEnemyLives
	ldr	r3, .L300+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L300+28
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L300+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L301:
	.align	2
.L300:
	.word	depression
	.word	shadowOAM
	.word	player
	.word	miniDep1
	.word	b
	.word	bb
	.word	waitForVBlank
	.word	DMANow
	.size	drawGame, .-drawGame
	.align	2
	.global	setupSounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L303
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L304:
	.align	2
.L303:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #0
	mov	r5, r2
	ldr	r2, .L307+8
	ldr	r2, [r2]
	sub	sp, sp, #12
	ldr	r8, .L307+12
	mov	r7, r1
	mov	r10, r0
	str	r3, [sp, #4]
	str	r6, [r2, #20]
	mov	r1, r0
	ldr	r2, .L307+16
	mov	r3, #910163968
	mov	r0, #1
	ldr	r4, .L307+20
	mov	lr, pc
	bx	r4
	strh	r6, [r8, #2]	@ movhi
	mov	r1, r5
	ldr	r3, .L307+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r2, #128
	mov	r3, #1
	rsb	r0, r0, #0
	ldr	r4, .L307+28
	lsl	r0, r0, #16
	lsr	r0, r0, #16
	strh	r0, [r8]	@ movhi
	ldr	fp, .L307+32
	strh	r2, [r8, #2]	@ movhi
	mov	r0, r7
	str	r3, [r4, #12]
	mov	lr, pc
	bx	fp
	ldr	r8, .L307+36
	adr	r3, .L307
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r8
	mov	r8, r0
	mov	r0, r5
	mov	r9, r1
	mov	lr, pc
	bx	fp
	ldr	fp, .L307+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	fp
	ldr	r3, .L307+44
	mov	lr, pc
	bx	r3
	ldr	r3, [sp, #4]
	str	r6, [r4, #28]
	str	r0, [r4, #20]
	str	r10, [r4]
	str	r7, [r4, #4]
	str	r5, [r4, #8]
	str	r3, [r4, #16]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L308:
	.align	3
.L307:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109120
	.word	67109024
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #0
	mov	r5, r2
	ldr	r2, .L311+8
	ldr	r2, [r2]
	sub	sp, sp, #12
	ldr	r8, .L311+12
	mov	r7, r1
	mov	r10, r0
	str	r3, [sp, #4]
	str	r6, [r2, #32]
	mov	r1, r0
	ldr	r2, .L311+16
	mov	r3, #910163968
	mov	r0, #2
	ldr	r4, .L311+20
	mov	lr, pc
	bx	r4
	strh	r6, [r8, #6]	@ movhi
	mov	r1, r5
	ldr	r3, .L311+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r2, #128
	mov	r3, #1
	rsb	r0, r0, #0
	ldr	r4, .L311+28
	lsl	r0, r0, #16
	lsr	r0, r0, #16
	strh	r0, [r8, #4]	@ movhi
	ldr	fp, .L311+32
	strh	r2, [r8, #6]	@ movhi
	mov	r0, r7
	str	r3, [r4, #12]
	mov	lr, pc
	bx	fp
	ldr	r8, .L311+36
	adr	r3, .L311
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r8
	mov	r8, r0
	mov	r0, r5
	mov	r9, r1
	mov	lr, pc
	bx	fp
	ldr	fp, .L311+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	fp
	ldr	r3, .L311+44
	mov	lr, pc
	bx	r3
	ldr	r3, [sp, #4]
	str	r6, [r4, #28]
	str	r0, [r4, #20]
	str	r10, [r4]
	str	r7, [r4, #4]
	str	r5, [r4, #8]
	str	r3, [r4, #16]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L312:
	.align	3
.L311:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109120
	.word	67109028
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
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
	ldr	r5, .L332
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
	ldr	r4, .L332+4
	suble	r3, r3, r2
	rsble	r2, r2, #0
	sub	sp, sp, #16
	strle	r3, [r5, #4]
	strle	r2, [r5, #12]
	ldr	r7, .L332+8
	ldr	r9, .L332+12
	ldr	r8, .L332+16
	add	r6, r4, #1200
	b	.L319
.L317:
	add	r4, r4, #40
	cmp	r6, r4
	beq	.L331
.L319:
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L317
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L317
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
	beq	.L317
	mov	ip, #13
	mov	r3, #0
	ldr	r2, .L332+20
	mov	r1, #3328
	mov	r0, r9
	str	ip, [r5, #40]
	bl	playSoundB
	mov	r2, #0
	ldr	r3, [r8]
	sub	r3, r3, #1
	cmp	r3, r2
	str	r2, [r4, #32]
	add	r4, r4, #40
	streq	r3, [r5, #28]
	cmp	r6, r4
	str	r3, [r8]
	bne	.L319
.L331:
	ldr	r2, .L332+24
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #20
	str	r3, [r2]
	bne	.L313
	add	r1, r5, #36
	ldm	r1, {r1, r3}
	cmp	r3, r1
	movgt	r3, #1
	addle	r3, r3, #4
	str	r3, [r5, #40]
	mov	r3, #0
	str	r3, [r2]
.L313:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L333:
	.align	2
.L332:
	.word	depression
	.word	b
	.word	collision
	.word	shoot
	.word	depressionLivesRemaining
	.word	11025
	.word	depCounter
	.size	updateDepression, .-updateDepression
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
	ldr	r1, .L364
	ldr	r3, .L364+4
	ldr	r2, [r1]
	ldrh	ip, [r3]
	add	r2, r2, #1
	push	{r4, lr}
	str	r2, [r1]
	strh	ip, [r0, #16]	@ movhi
	ldrh	r2, [r3]
	ldr	r1, .L364+8
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
	ldr	r3, .L364+12
	add	r1, r3, #1200
.L337:
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
	bne	.L337
	ldr	r3, .L364+16
	add	r1, r3, #800
.L340:
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
	bne	.L340
	ldr	r4, .L364+20
	ldr	r3, [r4, #24]
	cmp	r3, #30
	addne	r2, r3, #1
	beq	.L360
.L342:
	ldr	r0, .L364+24
	ldr	r3, [r0]
	add	r3, r3, #1
	cmp	r3, #30
	str	r2, [r4, #24]
	str	r3, [r0]
	beq	.L361
.L344:
	add	r3, r3, #1
	cmp	r3, #30
	str	r3, [r0]
	beq	.L362
.L345:
	bl	updateLives
	mov	r4, #10
	bl	updateLives
	bl	updateLives
	bl	updateLives
	bl	updateLives
.L346:
	bl	updateEnemyLives
	subs	r4, r4, #1
	bne	.L346
	pop	{r4, lr}
	bx	lr
.L360:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L363
.L343:
	mov	r2, #1
	b	.L342
.L362:
	bl	updateMemoryBalls.part.3
	b	.L345
.L361:
	bl	updateMemoryBalls.part.3
	ldr	r3, [r0]
	b	.L344
.L363:
	mov	r0, r4
	bl	fireBadBullets.part.2
	b	.L343
.L365:
	.align	2
.L364:
	.word	frameCounter
	.word	hOff
	.word	waitForVBlank
	.word	b
	.word	bb
	.word	depression
	.word	memballCounter
	.size	updateGame, .-updateGame
	.align	2
	.global	interruptHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L385
	ldrh	r1, [r3, #2]
	tst	r1, #1
	strh	r2, [r3, #8]	@ movhi
	beq	.L380
	ldr	r0, .L385+4
	ldr	r3, [r0, #12]
	cmp	r3, r2
	push	{r4, lr}
	beq	.L369
	ldr	r3, [r0, #28]
	ldr	r2, [r0, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #28]
	blt	.L369
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L383
	ldr	r1, .L385+8
	ldr	r2, .L385+12
	ldr	r1, [r1]
	str	r3, [r0, #12]
	str	r3, [r1, #20]
	strh	r3, [r2, #2]	@ movhi
.L369:
	ldr	r0, .L385+16
	ldr	r3, [r0, #12]
	cmp	r3, #0
	beq	.L373
	ldr	r3, [r0, #28]
	ldr	r2, [r0, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #28]
	blt	.L373
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L384
	ldr	r1, .L385+8
	ldr	r2, .L385+12
	ldr	r1, [r1]
	str	r3, [r0, #12]
	str	r3, [r1, #32]
	strh	r3, [r2, #6]	@ movhi
.L373:
	mov	r2, #1
	ldr	r3, .L385
	strh	r2, [r3, #2]	@ movhi
	mov	r2, #1
	ldr	r3, .L385
	pop	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L380:
	mov	r2, #1
	ldr	r3, .L385
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L383:
	ldm	r0, {r0, r1, r2}
	bl	playSoundA
	b	.L369
.L384:
	ldm	r0, {r0, r1, r2}
	bl	playSoundB
	b	.L373
.L386:
	.align	2
.L385:
	.word	67109376
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	str	lr, [sp, #-4]!
	mov	lr, #1
	ldrh	r1, [r0, #4]
	ldr	r3, .L389
	orr	r1, r1, #8
	ldrh	r2, [r3]
	ldr	ip, .L389+4
	strh	r1, [r0, #4]	@ movhi
	ldr	r1, .L389+8
	orr	r2, r2, lr
	strh	lr, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [ip, #4092]
	bx	lr
.L390:
	.align	2
.L389:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	pauseSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L392
	ldr	r0, .L392+4
	ldr	r1, .L392+8
	str	r3, [r0, #12]
	str	r3, [r1, #12]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L393:
	.align	2
.L392:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #128
	mov	r3, #1
	ldr	r2, .L395
	ldr	ip, .L395+4
	ldr	r0, .L395+8
	strh	r1, [r2, #2]	@ movhi
	str	r3, [ip, #12]
	strh	r1, [r2, #6]	@ movhi
	str	r3, [r0, #12]
	bx	lr
.L396:
	.align	2
.L395:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L398
	ldr	r2, .L398+4
	ldr	r1, [r1]
	ldr	ip, .L398+8
	ldr	r0, .L398+12
	str	r3, [r1, #20]
	str	r3, [ip, #12]
	strh	r3, [r2, #2]	@ movhi
	str	r3, [r0, #12]
	str	r3, [r1, #32]
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L399:
	.align	2
.L398:
	.word	dma
	.word	67109120
	.word	soundA
	.word	soundB
	.size	stopSound, .-stopSound
	.comm	hOff1,2,2
	.comm	hOff,2,2
	.comm	depCounter,4,4
	.comm	memballCounter,4,4
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
	.comm	memball2,48,4
	.comm	memball1,48,4
	.comm	bb,800,4
	.comm	b,1200,4
	.comm	miniDep1,352,4
	.comm	depression,44,4
	.comm	player,32,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
