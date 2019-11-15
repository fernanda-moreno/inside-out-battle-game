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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #256
	mov	r1, #67108864
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r4, .L4
	strh	r3, [r1]	@ movhi
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r3, #3264
	mov	r2, #100663296
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	insideOutStartBgPal
	.word	insideOutStartBgTiles
	.word	100720640
	.word	insideOutStartBgMap
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #67108864
	mov	r4, #4352
	mov	ip, #56320
	mov	r1, #5
	mov	lr, #8
	mov	r0, #10
	mov	r2, #0
	strh	r4, [r3]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	ldr	r3, .L8
	ldr	ip, .L8+4
	str	r1, [r3]
	ldr	r1, .L8+8
	ldr	r3, .L8+12
	str	lr, [ip]
	pop	{r4, lr}
	str	r0, [r1]
	str	r2, [r3]
	b	goToStart
.L9:
	.align	2
.L8:
	.word	livesRemaining
	.word	enemiesRemaining
	.word	depressionLivesRemaining
	.word	frameCounter
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseState.part.2, %function
pauseState.part.2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #67108864
	mov	r4, #4352
	mov	ip, #56320
	mov	r1, #5
	mov	lr, #8
	mov	r0, #10
	mov	r2, #0
	strh	r4, [r3]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	ldr	r3, .L12
	ldr	ip, .L12+4
	str	r1, [r3]
	ldr	r1, .L12+8
	ldr	r3, .L12+12
	str	lr, [ip]
	pop	{r4, lr}
	str	r0, [r1]
	str	r2, [r3]
	b	goToStart
.L13:
	.align	2
.L12:
	.word	livesRemaining
	.word	enemiesRemaining
	.word	depressionLivesRemaining
	.word	frameCounter
	.size	pauseState.part.2, .-pauseState.part.2
	.set	winState.part.3,pauseState.part.2
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L16
	mov	r2, #83886080
	ldr	r1, .L16+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L16+8
	mov	r2, #100663296
	ldr	r1, .L16+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L16+16
	ldr	r1, .L16+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L16+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	DMANow
	.word	instructionsBgPal
	.word	5840
	.word	instructionsBgTiles
	.word	100720640
	.word	instructionsBgMap
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #56320
	mov	r2, #4352
	push	{r4, lr}
	mov	r0, #3
	ldr	r4, .L20
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r1, .L20+4
	mov	r3, #256
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	ldr	r3, .L20+8
	mov	r2, #100663296
	ldr	r1, .L20+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #6144
	ldr	r2, .L20+16
	ldr	r1, .L20+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L20+24
	ldr	r1, .L20+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L20+32
	ldr	r1, .L20+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L20+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L21:
	.align	2
.L20:
	.word	DMANow
	.word	skyBgPal
	.word	25536
	.word	skyBgTiles
	.word	100720640
	.word	skyBgMap
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	startState
	.syntax unified
	.arm
	.fpu softvfp
	.type	startState, %function
startState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L34
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L23
	ldr	r2, .L34+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L32
.L23:
	tst	r3, #2
	beq	.L22
	ldr	r3, .L34+4
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L33
.L22:
	pop	{r4, lr}
	bx	lr
.L33:
	pop	{r4, lr}
	b	goToInstructions
.L32:
	bl	goToGame
	ldr	r3, .L34+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L23
.L35:
	.align	2
.L34:
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	startState, .-startState
	.align	2
	.global	instructionsState
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructionsState, %function
instructionsState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L48
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L37
	ldr	r2, .L48+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L46
.L37:
	tst	r3, #4
	beq	.L36
	ldr	r3, .L48+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L47
.L36:
	pop	{r4, lr}
	bx	lr
.L47:
	pop	{r4, lr}
	b	goToStart
.L46:
	bl	goToGame
	ldr	r3, .L48+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L37
.L49:
	.align	2
.L48:
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	instructionsState, .-instructionsState
	.align	2
	.global	pauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseState, %function
pauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	ldr	r1, .L63
	ldr	r0, .L63+4
	ldrh	r2, [r1]
	push	{r4, r5, r6, lr}
	strh	r2, [r3, #20]	@ movhi
	ldr	r3, [r0]
	ldr	r2, .L63+8
	add	r3, r3, #1
	smull	r4, r5, r3, r2
	asr	r2, r3, #31
	rsb	r2, r2, r5, asr #2
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, lsl #1
	str	r3, [r0]
	ldrheq	r3, [r1]
	ldr	r4, .L63+12
	addeq	r3, r3, #1
	strheq	r3, [r1]	@ movhi
	ldr	r3, .L63+16
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L52
	ldr	r2, .L63+20
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L61
.L52:
	tst	r3, #4
	beq	.L50
	ldr	r3, .L63+20
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L62
.L50:
	pop	{r4, r5, r6, lr}
	bx	lr
.L62:
	pop	{r4, r5, r6, lr}
	b	pauseState.part.2
.L61:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L52
.L64:
	.align	2
.L63:
	.word	hoff1
	.word	frameCounter
	.word	1717986919
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.size	pauseState, .-pauseState
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r0, #7168
	mov	r1, #768
	push	{r4, lr}
	mov	lr, #0
	ldr	r3, .L67
	strh	r0, [r2, #8]	@ movhi
	ldr	ip, .L67+4
	strh	r3, [r2, #10]	@ movhi
	strh	r1, [r2]	@ movhi
	ldrh	r1, [ip]
	ldr	r4, .L67+8
	strh	r1, [r2, #16]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L67+12
	mov	r0, #3
	strh	lr, [ip]	@ movhi
	mov	lr, pc
	bx	r4
	ldr	r3, .L67+16
	mov	r2, #100663296
	ldr	r1, .L67+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L67+24
	ldr	r1, .L67+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #736
	ldr	r2, .L67+32
	ldr	r1, .L67+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L67+40
	ldr	r1, .L67+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L67+48
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L68:
	.align	2
.L67:
	.word	24068
	.word	hoff
	.word	DMANow
	.word	pauseFearPal
	.word	4720
	.word	pauseFearTiles
	.word	100720640
	.word	pauseFearMap
	.word	100679680
	.word	pauseSky_2Tiles
	.word	100724736
	.word	pauseSky_2Map
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	winState
	.syntax unified
	.arm
	.fpu softvfp
	.type	winState, %function
winState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L74
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L74+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	winState.part.3
.L75:
	.align	2
.L74:
	.word	oldButtons
	.word	buttons
	.size	winState, .-winState
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L78
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	lr, #0
	ldr	ip, .L78+4
	ldrh	r1, [ip]
	ldr	r4, .L78+8
	strh	r1, [r2, #16]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L78+12
	mov	r0, #3
	strh	lr, [ip]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L78+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L78+20
	mov	r2, #100663296
	ldr	r1, .L78+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L78+28
	ldr	r1, .L78+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L78+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L79:
	.align	2
.L78:
	.word	hideSprites
	.word	hoff
	.word	DMANow
	.word	shadowOAM
	.word	winJoyPal
	.word	5616
	.word	winJoyTiles
	.word	100720640
	.word	winJoyMap
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	loseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseState, %function
loseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	winState
	.size	loseState, .-loseState
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L83
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	lr, #0
	ldr	ip, .L83+4
	ldrh	r1, [ip]
	ldr	r4, .L83+8
	strh	r1, [r2, #16]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L83+12
	mov	r0, #3
	strh	lr, [ip]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L83+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #6080
	mov	r2, #100663296
	ldr	r1, .L83+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L83+24
	ldr	r1, .L83+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L83+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L84:
	.align	2
.L83:
	.word	hideSprites
	.word	hoff
	.word	DMANow
	.word	shadowOAM
	.word	loseSadnessPal
	.word	loseSadnessTiles
	.word	100720640
	.word	loseSadnessMap
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	gameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameState, %function
gameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L96
	mov	lr, pc
	bx	r3
	ldr	r3, .L96+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L96+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L96+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L86
	ldr	r3, .L96+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L93
.L86:
	ldr	r3, .L96+20
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L94
.L87:
	ldr	r3, .L96+24
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L95
	pop	{r4, lr}
	bx	lr
.L95:
	pop	{r4, lr}
	b	goToLose
.L94:
	bl	goToWin
	b	.L87
.L93:
	bl	goToPause
	b	.L86
.L97:
	.align	2
.L96:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	depressionLivesRemaining
	.word	livesRemaining
	.size	gameState, .-gameState
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #4352
	push	{r4, r7, fp, lr}
	mov	r7, #56320
	mov	r6, #5
	mov	r4, #8
	mov	ip, #10
	mov	r1, #0
	strh	r2, [r3]	@ movhi
	ldr	r5, .L110
	ldr	lr, .L110+4
	ldr	r0, .L110+8
	ldr	r2, .L110+12
	strh	r7, [r3, #8]	@ movhi
	ldr	r3, .L110+16
	str	r6, [r5]
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r6, .L110+20
	ldr	r8, .L110+24
	ldr	r5, .L110+28
	ldr	fp, .L110+32
	ldr	r10, .L110+36
	ldr	r9, .L110+40
	ldr	r7, .L110+44
	ldr	r4, .L110+48
.L99:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L100:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L100
.L102:
	.word	.L101
	.word	.L103
	.word	.L104
	.word	.L105
	.word	.L106
	.word	.L106
.L106:
	mov	lr, pc
	bx	r7
	b	.L99
.L105:
	ldr	r3, .L110+52
	mov	lr, pc
	bx	r3
	b	.L99
.L104:
	mov	lr, pc
	bx	r9
	b	.L99
.L103:
	mov	lr, pc
	bx	r10
	b	.L99
.L101:
	mov	lr, pc
	bx	fp
	b	.L99
.L111:
	.align	2
.L110:
	.word	livesRemaining
	.word	enemiesRemaining
	.word	depressionLivesRemaining
	.word	frameCounter
	.word	goToStart
	.word	state
	.word	buttons
	.word	oldButtons
	.word	startState
	.word	instructionsState
	.word	gameState
	.word	winState
	.word	67109120
	.word	pauseState
	.size	main, .-main
	.comm	frameCounter,4,4
	.comm	hoff1,2,2
	.comm	hoff,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	enemiesRemaining,4,4
	.comm	depressionLivesRemaining,4,4
	.comm	livesRemaining,4,4
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
