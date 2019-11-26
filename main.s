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
	mov	r3, #3728
	mov	r2, #100663296
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r0, #3
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+24
	mov	r3, #1
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	ldr	r0, .L4+36
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	insideOutNewStartBgPal
	.word	insideOutNewStartBgTiles
	.word	100720640
	.word	insideOutNewStartBgMap
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	517437
	.word	bundleofjoy
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
	mov	r3, #67108864
	mov	r2, #56320
	push	{r4, lr}
	mov	r4, #4352
	mov	r0, #5
	mov	lr, #8
	mov	ip, #10
	mov	r1, #0
	strh	r2, [r3, #8]	@ movhi
	ldr	r2, .L8
	strh	r4, [r3]	@ movhi
	ldr	r3, .L8+4
	str	r0, [r2]
	ldr	r0, .L8+8
	ldr	r2, .L8+12
	str	lr, [r3]
	ldr	r3, .L8+16
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	livesRemaining
	.word	enemiesRemaining
	.word	depressionLivesRemaining
	.word	frameCounter
	.word	setupInterrupts
	.word	setupSounds
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	winState.part.3, %function
winState.part.3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L12
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	initialize
.L13:
	.align	2
.L12:
	.word	buttons
	.size	winState.part.3, .-winState.part.3
	.set	loseState.part.4,winState.part.3
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
	.word	5856
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
	push	{r4, r5, r6, lr}
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
	pop	{r4, r5, r6, lr}
	bx	lr
.L33:
	pop	{r4, r5, r6, lr}
	b	goToInstructions
.L32:
	ldr	r3, .L34+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L34+12
	mov	r3, #1
	ldr	r2, .L34+16
	ldr	r1, .L34+20
	ldr	r0, .L34+24
	mov	lr, pc
	bx	r5
	bl	goToGame
	ldr	r3, .L34+28
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L23
.L35:
	.align	2
.L34:
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	1166688
	.word	chasingSadness
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
	push	{r4, r5, r6, lr}
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
	pop	{r4, r5, r6, lr}
	bx	lr
.L47:
	pop	{r4, r5, r6, lr}
	b	goToStart
.L46:
	ldr	r3, .L48+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L48+12
	mov	r3, #1
	ldr	r2, .L48+16
	ldr	r1, .L48+20
	ldr	r0, .L48+24
	mov	lr, pc
	bx	r5
	bl	goToGame
	ldr	r3, .L48+28
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L37
.L49:
	.align	2
.L48:
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	1166688
	.word	chasingSadness
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
	b	initialize
.L61:
	ldr	r3, .L63+24
	mov	lr, pc
	bx	r3
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
	.word	unpauseSound
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
	mov	r3, #67108864
	mov	ip, #7168
	mov	r1, #768
	mov	r0, #0
	ldr	r2, .L67
	push	{r4, lr}
	strh	ip, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r2, .L67+4
	ldrh	ip, [r2]
	ldr	r1, .L67+8
	strh	ip, [r3, #16]	@ movhi
	ldr	r4, .L67+12
	strh	r0, [r2]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L67+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L67+20
	mov	r2, #100663296
	ldr	r1, .L67+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L67+28
	ldr	r1, .L67+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #736
	ldr	r2, .L67+36
	ldr	r1, .L67+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L67+44
	ldr	r1, .L67+48
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L67+52
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L68:
	.align	2
.L67:
	.word	24068
	.word	hoff
	.word	pauseSound
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
	ldr	r3, .L71
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	winState.part.3
.L72:
	.align	2
.L71:
	.word	oldButtons
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
	ldr	r3, .L75
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	mov	r4, #0
	ldr	r3, .L75+4
	ldrh	r0, [r3]
	ldr	r2, .L75+8
	strh	r0, [r1, #16]	@ movhi
	strh	r4, [r3]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r3, r4
	ldr	r2, .L75+12
	ldr	r1, .L75+16
	ldr	r0, .L75+20
	ldr	r4, .L75+24
	mov	lr, pc
	bx	r4
	ldr	r4, .L75+28
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L75+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L75+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L75+40
	mov	r2, #100663296
	ldr	r1, .L75+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L75+48
	ldr	r1, .L75+52
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L75+56
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L76:
	.align	2
.L75:
	.word	hideSprites
	.word	hoff
	.word	stopSound
	.word	11025
	.word	368965
	.word	morethanafeeling
	.word	playSoundA
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
	ldr	r3, .L80
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	mov	r4, #0
	ldr	r3, .L80+4
	ldrh	r0, [r3]
	ldr	r2, .L80+8
	strh	r0, [r1, #16]	@ movhi
	strh	r4, [r3]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r3, r4
	ldr	r2, .L80+12
	ldr	r1, .L80+16
	ldr	r0, .L80+20
	ldr	r4, .L80+24
	mov	lr, pc
	bx	r4
	ldr	r4, .L80+28
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L80+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L80+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #6080
	mov	r2, #100663296
	ldr	r1, .L80+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L80+44
	ldr	r1, .L80+48
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L80+52
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L81:
	.align	2
.L80:
	.word	hideSprites
	.word	hoff
	.word	stopSound
	.word	11025
	.word	71279
	.word	sadnessCrying
	.word	playSoundA
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
	ldr	r3, .L93
	mov	lr, pc
	bx	r3
	ldr	r3, .L93+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L93+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L83
	ldr	r3, .L93+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L90
.L83:
	ldr	r3, .L93+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L91
.L84:
	ldr	r3, .L93+20
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L92
	pop	{r4, lr}
	bx	lr
.L92:
	pop	{r4, lr}
	b	goToLose
.L91:
	bl	goToWin
	b	.L84
.L90:
	bl	goToPause
	b	.L83
.L94:
	.align	2
.L93:
	.word	updateGame
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
	push	{r4, r7, fp, lr}
	ldr	r3, .L112
	mov	lr, pc
	bx	r3
	ldr	fp, .L112+4
	ldr	r5, .L112+8
	ldr	r10, .L112+12
	ldr	r9, .L112+16
	ldr	r8, .L112+20
	ldr	r7, .L112+24
	ldr	r6, .L112+28
	ldr	r4, .L112+32
.L96:
	ldrh	r2, [fp]
	strh	r2, [r5]	@ movhi
	ldr	r3, [r10]
	ldrh	ip, [r4, #48]
	strh	ip, [fp]	@ movhi
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L96
.L99:
	.word	.L98
	.word	.L100
	.word	.L101
	.word	.L102
	.word	.L103
	.word	.L104
.L104:
	tst	r2, #8
	beq	.L96
	ldr	r3, .L112+36
	mov	lr, pc
	bx	r3
	b	.L96
.L103:
	tst	r2, #8
	beq	.L96
	ldr	r3, .L112+40
	mov	lr, pc
	bx	r3
	b	.L96
.L102:
	mov	lr, pc
	bx	r6
	b	.L96
.L100:
	mov	lr, pc
	bx	r8
	b	.L96
.L98:
	mov	lr, pc
	bx	r9
	b	.L96
.L101:
	mov	lr, pc
	bx	r7
	b	.L96
.L113:
	.align	2
.L112:
	.word	initialize
	.word	buttons
	.word	oldButtons
	.word	state
	.word	startState
	.word	instructionsState
	.word	gameState
	.word	pauseState
	.word	67109120
	.word	loseState.part.4
	.word	winState.part.3
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
