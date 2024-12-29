Function16c000: ; unreferenced
	; Only for CGB
	ldh a, [hCGB]
	and a
	ret z
	; Only do this once per boot cycle
	ldh a, [hSystemBooted]
	and a
	ret z
	; Disable the joypad during mobile setup
	ld a, [wJoypadDisable]
	push af
	set JOYPAD_DISABLE_SGB_TRANSFER_F, a
	ld [wJoypadDisable], a
	; Do stuff
	call MobileSystemSplashScreen_InitGFX ; Load GFX
	farcall SetRAMStateForMobile
	farcall EnableMobile
	call .RunJumptable
	farcall DisableMobile
	; Prevent this routine from running again
	; until the next time the system is turned on
	xor a
	ldh [hSystemBooted], a
	; Restore the flag state
	pop af
	ld [wJoypadDisable], a
	ret

.RunJumptable:
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wd002], a
	ld [wd003], a
.loop
	call DelayFrame
	farcall Function10635c
	ld a, [wd002]
	ld hl, .Jumptable
	rst JumpTable
	call Function16cb2e
	call Function16cbae
	ld a, [wd002]
	cp $ff
	jr nz, .loop
	ret

.Jumptable:
	dw .init
	dw Function16c0ba
	dw Function16c089
	dw Function16c09e
	dw Function16c0a8
	dw Function16c0dc
	dw Function16c0ec
	dw Function16c0ba
	dw Function16c0ca
	dw Function16c0dc
	dw Function16c0ec
	dw .quit

.init
	ld a, [wcf64]
	and a
	ret z
	ld [wd002], a
	xor a
	ld [wd003], a
	ret

.quit
	push af
	ld a, $ff
	ld [wd002], a
	pop af
	ret

Function16c089:
	ld a, $1
	ld [wd1eb], a
	ld [wd1f1], a
	xor a
	ldh [hWY], a
	call Function16c0fa
	ld a, [wd002]
	ld [wcf64], a
	ret

Function16c09e:
	ld a, [wcf64]
	cp $4
	ret nz
	call Function16c0fa
	ret

Function16c0a8:
	xor a
	ld [wd1eb], a
	ld [wd1f1], a
	call ClearSprites
	ld a, $90
	ldh [hWY], a
	call Function16c0fa
	ret

Function16c0ba:
	call Function16c943
	push af
	ld a, [wd003]
	inc a
	ld [wd003], a
	pop af
	call c, Function16c0fa
	ret

Function16c0ca:
	ld a, [wd003]
	cp $28
	push af
	ld a, [wd003]
	inc a
	ld [wd003], a
	pop af
	call z, Function16c0fa
	ret

Function16c0dc:
	call Function16ca11
	push af
	ld a, [wd003]
	inc a
	ld [wd003], a
	pop af
	call c, Function16c0fa
	ret

Function16c0ec:
	call ClearBGPalettes
	call ClearScreen
	push af
	ld a, $ff
	ld [wd002], a
	pop af
	ret

Function16c0fa:
	push af
	ld a, [wd002]
	inc a
	ld [wd002], a
	xor a
	ld [wd003], a
	pop af
	ret

MobileSystemSplashScreen_InitGFX:
	ret


Function16c943:

	ret

Function16ca11:
	
	ret

Function16cab6:
	
	ret

Function16cabb:
	
	ret

Function16cac4:
	
	ret

Function16cad8:
	
	ret

Function16cadc:
	
	ret

Function16cae8:
	
	ret

Function16cb08:
	
	ret

Function16cb0f:
	
	ret

Function16cb2e:
	
	ret

Function16cb40:
	
	ret

Function16cb5d:
	
	ret

Unknown_16cb86:
	db 7
	db  0,  0, 0, 1
	db  8,  0, 1, 1
	db  8,  8, 2, 0
	db  8, 16, 3, 0
	db 16,  0, 4, 1
	db 16,  8, 5, 0
	db 16, 16, 6, 0

Function16cba3:
	
	ret

Function16cbae:
	ld a, [wd1f1]
	and a
	ret z
	call Function16cbba
	call Function16cbd1
	ret

Function16cbba:
	ld hl, wd1f2
	inc [hl]
	ld a, [hl]
	cp $c
	ret c
	xor a
	ld [hl], a
	ld a, [wd1f3]
	inc a
	cp $4
	jr c, .asm_16cbcd
	xor a

.asm_16cbcd
	ld [wd1f3], a
	ret

Function16cbd1:
	ld a, [wd1f3]
	ld c, a
	ld b, 0
	ld hl, Unknown_16cbfb
	add hl, bc
	ld a, [hl]
	ld bc, 2
	ld hl, Unknown_16cfa3
	call AddNTimes
	ld de, wBGPals1 palette 1 color 2
	ld bc, PAL_COLOR_SIZE
	ld a, $5
	call FarCopyWRAM
	farcall ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

Unknown_16cbfb:
	db 0, 1, 2, 1, 0, 1, 2

Function16cc02:
	call Function16cc18
	call Function16cc49
	call Function16cc62
	call Function16cc25
	call Function16cc6e
	call Function16cb0f
	call Function16cba3
	ret

Function16cc18:
	ld hl, vTiles1
	ld de, MobileAdapterCheckGFX
	lb bc, BANK(MobileAdapterCheckGFX), 46
	call Get2bpp
	ret

Function16cc25:
	ld hl, Unknown_16cfa9
	ld de, wBGPals1 palette 1
	call .CopyPal
	ld hl, Unknown_16cfb1
	ld de, wOBPals1
	call .CopyPal
	ld hl, Unknown_16cfb9
	ld de, wOBPals1 palette 1
	call .CopyPal
	ret

.CopyPal:
	ld bc, 1 palettes
	ld a, $5
	jp FarCopyWRAM

Function16cc49:
	hlcoord 4, 15
	ld a, $80
	call Function16cc5a
	hlcoord 4, 16
	ld a, $90
	call Function16cc5a
	ret

Function16cc5a:
	ld c, $10
.asm_16cc5c
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_16cc5c
	ret

Function16cc62:
	hlcoord 0, 15, wAttrmap
	ld bc, $0028
	ld a, $1
	call ByteFill
	ret

Function16cc6e:
	hlbgcoord 0, 0, vBGMap1
	jr Function16cc73

Function16cc73:
	ldh a, [rVBK]
	push af
	ld a, $0
	ldh [rVBK], a
	push hl
	decoord 0, 0
	call Function16cc90
	pop hl
	ld a, $1
	ldh [rVBK], a
	decoord 0, 0, wAttrmap
	call Function16cc90
	pop af
	ldh [rVBK], a
	ret

Function16cc90:
	ld bc, $1214
.asm_16cc93
	push bc
.asm_16cc94
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_16cc94
	ld bc, $000c
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_16cc93
	ret

MobileAdapterCheckGFX:
INCBIN "gfx/mobile/mobile_splash_check.2bpp"

Unknown_16cfa3:
	RGB 31, 31, 31
	RGB 25, 27, 29
	RGB 16, 19, 25

Unknown_16cfa9:
	RGB 31, 31, 31
	RGB 25, 27, 29
	RGB 31, 31, 31
	RGB 07, 07, 07

Unknown_16cfb1:
	RGB 31, 31, 31
	RGB 13, 09, 18
	RGB 26, 21, 16
	RGB 07, 07, 07

Unknown_16cfb9:
	RGB 31, 31, 31
	RGB 18, 05, 02
	RGB 27, 11, 12
	RGB 07, 07, 07
