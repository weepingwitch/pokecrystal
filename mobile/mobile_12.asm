InitMobileProfile:
	ret

Function48157:
	ret

Function48187:
	
	ret


Function4820d:
	ret

Function48272:
	jp Function4840c

MobileString_PersonalInfo:
	db "Personal Info@"

Function48283:
	ret

asm_4828d:
	ret

Function48304:
	ret

Function48383:
	
	ret

Function483bb:
	
	ret

Function483e8:
	
	ret

Function4840c:
	ret

Mobile12_Bin2Dec:
	push bc
	push af
	push de
	push hl
	ld hl, .DigitStrings
.loop
	and a
	jr z, .got_string
	inc hl
	inc hl
	dec a
	jr .loop
.got_string
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	pop de
	pop af
	pop bc
	ret

.DigitStrings:
	db "0@"
	db "1@"
	db "2@"
	db "3@"
	db "4@"
	db "5@"
	db "6@"
	db "7@"
	db "8@"
	db "9@"

MobileProfileString:         db "  Mobile Profile@"
MobileString_Gender:         db "Gender@"
MobileString_Age:            db "Age@"
MobileString_Address:        db "Address@"
MobileString_ZipCode:        db "Zip Code@"
MobileString_OK:             db "OK@"
MobileString_ProfileChanged: db "Profile Changed@"
MobileDesc_Gender:           db "Boy or girl?@"
MobileDesc_Age:              db "How old are you?@"
MobileDesc_Address:          db "Where do you live?@"
MobileDesc_ZipCode:          db "Your zip code?@"

MenuHeader_0x484f1:
	db MENU_BACKUP_TILES ; flags
	menu_coords 11, 2, SCREEN_WIDTH - 1, 7
	dw MenuData_0x484f9
	db 1 ; default option

MenuData_0x484f9:
	db STATICMENU_CURSOR | STATICMENU_WRAP ; flags
	db 2 ; items
Strings_484fb:
String_484fb: db "Boy@"
String_484ff: db "Girl@"

MenuHeader_0x48504:
	db MENU_BACKUP_TILES ; flags
	menu_coords 10, 0, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1

MenuHeader_0x48509:
	db MENU_BACKUP_TILES ; flags
	menu_coords 10, 5, SCREEN_WIDTH - 1, 7

MenuHeader_0x4850e:
	db MENU_BACKUP_TILES ; flags
	menu_coords 10, 9, SCREEN_WIDTH - 1, TEXTBOX_Y - 1

MenuHeader_0x48513:
	db MENU_BACKUP_TILES ; flags
	menu_coords 11, 1, 18, 12
	dw MenuData_0x4851b
	db 1 ; default option

MenuData_0x4851b:
	db SCROLLINGMENU_DISPLAY_ARROWS | SCROLLINGMENU_ENABLE_RIGHT | SCROLLINGMENU_ENABLE_LEFT | SCROLLINGMENU_CALL_FUNCTION1_CANCEL ; flags
	db 6, 0 ; rows, columns
	db SCROLLINGMENU_ITEMS_NORMAL ; item format
	dba .Items
	dba Function483e8
	dba NULL
	dba NULL

.Items:
	db 46
for x, 46
	db x
endr
	db -1


Function48689:
	
	ret

Function486bf:
	ld hl, w2DMenuCursorInitY
	ld a, [wd002]
	bit 6, a
	jr nz, .start_at_6
	ld a, 4
	ld [hli], a
	jr .got_init_y

.start_at_6
	ld a, 6
	ld [hli], a
.got_init_y
	ld a, 1
	ld [hli], a ; init x
	ld a, [wd002]
	bit 6, a
	jr nz, .check_wd479
	call Function48725
	ld a, 4
	jr nc, .got_num_rows_1
	ld a, 5
.got_num_rows_1
	ld [hli], a
	jr .got_num_rows_2

.check_wd479
	ld a, [wd479]
	bit 1, a
	jr nz, .four_rows
	call Function48725
	jr c, .four_rows
	ld a, 3
	ld [hli], a
	jr .got_num_rows_2

.four_rows
	ld a, 4
	ld [hli], a
.got_num_rows_2
	ld a, 1
	ld [hli], a ; num cols
	ld [hl], 0 ; flags 1
	set 5, [hl]
	inc hl
	xor a
	ld [hli], a ; flags 2
	ld a, $20
	ld [hli], a ; cursor offsets
	ld a, A_BUTTON
	add D_UP
	add D_DOWN
	push af
	ld a, [wd002]
	bit 6, a
	jr z, .got_joypad_mask
	pop af
	add B_BUTTON
	push af
.got_joypad_mask
	pop af
	ld [hli], a
	ld a, $1
	ld [hli], a ; cursor y
	ld [hli], a ; cursor x
	xor a
	ld [hli], a ; off char
	ld [hli], a ; cursor tile
	ld [hli], a ; cursor tile + 1
	ret

Function48725:
;	 ld a, [wd003]
;	 and $f
;	 cp $f
;	 jr nz, .clear_carry
;	 scf
;	 ret
; .clear_carry
;	 and a
;	 ret

	ld a, [wd003]
	bit 0, a
	jr z, .clear_carry
	bit 1, a
	jr z, .clear_carry
	bit 2, a
	jr z, .clear_carry
	bit 3, a
	jr z, .clear_carry
	scf
	ret

.clear_carry
	and a
	ret

Function4873c:
	ld hl, w2DMenuCursorInitY
	ld a, 4
	ld [hli], a
	ld a, 12
	ld [hli], a ; init x
	ld a, 2
	ld [hli], a ; num rows
	ld a, 1
	ld [hli], a ; num cols
	ld [hl], 0 ; flags 1
	set 5, [hl]
	inc hl
	xor a
	ld [hli], a ; flags 2
	ln a, 2, 0
	ld [hli], a ; cursor offsets
	ld a, A_BUTTON
	add B_BUTTON
	ld [hli], a ; joypad filter
	; ld a, [wPlayerGender]
	; xor 1 << PLAYERGENDER_FEMALE_F
	; inc a
	ld a, [wPlayerGender]
	and a
	jr z, .male
	ld a, 2
	jr .okay_gender

.male
	ld a, 1
.okay_gender
	ld [hli], a ; cursor y
	ld a, $1
	ld [hli], a ; cursor x
	xor a
	ld [hli], a ; off char
	ld [hli], a ; cursor tile
	ld [hli], a ; cursor tile + 1
	ret

Function4876f:
	ret

Function487ec:
	push hl
	ld de, wd473
	call Function487ff
	pop hl
rept 4
	inc hl
endr
	ld de, String_4880d
	call PlaceString
	ret

Function487ff:
	push hl
	ld a, " "
	ld [hli], a
	ld [hl], a
	pop hl
	ld b, PRINTNUM_LEADINGZEROS | 1
	ld c, 3
	call PrintNum
	ret

String_4880d:
	db "@"

Function4880e:
	ldh a, [hJoyPressed]
	and A_BUTTON
	jp nz, Function488b9
	ldh a, [hJoyPressed]
	and B_BUTTON
	jp nz, Function488b4
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .asm_48843
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_48838
	ld a, [hl]
	and D_LEFT
	jr nz, .asm_4884f
	ld a, [hl]
	and D_RIGHT
	jr nz, .asm_4885f
	call DelayFrame
	and a
	ret
.asm_48838
	ld hl, wd473
	ld a, [hl]
	and a
	jr z, .asm_48840
	dec a
.asm_48840
	ld [hl], a
	jr .asm_4886f
.asm_48843
	ld hl, wd473
	ld a, [hl]
	cp $64
	jr nc, .asm_4884c
	inc a
.asm_4884c
	ld [hl], a
	jr .asm_4886f
.asm_4884f
	ld a, [wd473]
	cp $5b
	jr c, .asm_48858
	ld a, $5a
.asm_48858
	add $a
	ld [wd473], a
	jr .asm_4886f
.asm_4885f
	ld a, [wd473]
	cp $a
	jr nc, .asm_48868
	ld a, $a
.asm_48868
	sub $a
	ld [wd473], a
	jr .asm_4886f
.asm_4886f
	ld a, [wd473]
	and a
	jr z, .asm_48887
	cp $64
	jr z, .asm_48898
	jr z, .asm_488a7
	hlcoord 12, 5
	ld [hl], $10
	hlcoord 12, 7
	ld [hl], $11
	jr .asm_488a7
.asm_48887
	hlcoord 10, 5
	ld b, $1
	ld c, $8
	call Function48cdc
	hlcoord 12, 5
	ld [hl], $10
	jr .asm_488a7
.asm_48898
	hlcoord 10, 5
	ld b, $1
	ld c, $8
	call Function48cdc
	hlcoord 12, 7
	ld [hl], $11
.asm_488a7
	hlcoord 11, 6
	call Function487ec
	call WaitBGMap
	ld a, $1
	and a
	ret

Function488b4:
	ld a, $0
	and a
	scf
	ret

Function488b9:
	ld a, [wd003]
	set 1, a
	ld [wd003], a
	scf
	ret

MobileUpArrowGFX:
INCBIN "gfx/mobile/up_arrow.1bpp"

MobileDownArrowGFX:
INCBIN "gfx/mobile/down_arrow.1bpp"

Function488d3:
	ret

Function4895a: ; unreferenced
	ldh a, [hJoyPressed]
	and a
	jr z, .asm_48965
	pop bc
	ld b, $1
	push bc
	jr asm_48972

.asm_48965
	ldh a, [hJoyLast]
	and a
	jr z, asm_48972

	pop bc
	ld b, $1
	push bc

Function4896e:
	pop bc
	ld b, $0
	push bc

asm_48972:
	ret

Function489ea:
	
	ret

String_48a38:
	db "-@"

Function48a3a:
	ret

Function48a9a:
	scf
	ret

MenuHeader_0x48a9c:
	db MENU_BACKUP_TILES ; flags
	menu_coords 10, 8, SCREEN_WIDTH - 1, 13

String_48aa1:
	db   "Tell Now"
	next "Tell Later@"

Function48ab5:
	ret

Function48bd7:
	ret

Function48c00:
	push af
	hlcoord 11, 10
	call Function489ea
	ld a, $1
	and a
	pop bc
	ld a, b
	ret

Function48c0d:
	xor a
	and a

Function48c0f:
	
	ret

Function48c11:
	
	ret

Function48c4d:
	
	ret

Function48c5a:
	push af
	ld a, [hl]
	and $f0
	ld [hl], a
	pop af
	or [hl]
	ld [hl], a
	ret

Function48c63:
	ret

Function48c8e: ; unreferenced
	ld hl, wd019 + $11
	ld d, h
	ld e, l
	farcall Function48c63
	hlcoord 10, 7
	call PlaceString
	call WaitBGMap
	ret

Function48ca3: ; unreferenced
	push af
	push bc
	push de
	push hl
	ld b, 0
	ld c, 0
	ld d, 0
.asm_48cad
	cp 100
	jr c, .asm_48cb6
	sub 100
	inc b
	jr .asm_48cad

.asm_48cb6
	cp 10
	jr c, .asm_48cbf
	sub 10
	inc c
	jr .asm_48cb6

.asm_48cbf
	cp 1
	jr c, .asm_48cc7
	dec a
	inc d
	jr .asm_48cbf

.asm_48cc7
	ld a, b
	call Mobile12_Bin2Dec
	inc hl
	ld a, c
	call Mobile12_Bin2Dec
	inc hl
	ld a, d
	call Mobile12_Bin2Dec
	pop hl
	pop de
	pop bc
	pop af
	ret

Function48cda:
	ld h, d
	ld l, e

Function48cdc:
	push bc
	push hl
	call Function48cfd
	pop hl
	pop bc
	ld de, wAttrmap - wTilemap
	add hl, de
	inc b
	inc b
	inc c
	inc c
	ld a, $0
.asm_48ced
	push bc
	push hl
.asm_48cef
	ld [hli], a
	dec c
	jr nz, .asm_48cef
	pop hl
	ld de, $14
	add hl, de
	pop bc
	dec b
	jr nz, .asm_48ced
	ret

Function48cfd:
	push hl
	ld a, $4
	ld [hli], a
	inc a
	call Function48d2a
	inc a
	ld [hl], a
	pop hl
	ld de, $14
	add hl, de
.asm_48d0c
	push hl
	ld a, $7
	ld [hli], a
	ld a, $7f
	call Function48d2a
	ld [hl], $8
	pop hl
	ld de, $14
	add hl, de
	dec b
	jr nz, .asm_48d0c
	ld a, $9
	ld [hli], a
	ld a, $a
	call Function48d2a
	ld [hl], $b
	ret

Function48d2a:
	ld d, c
.asm_48d2b
	ld [hli], a
	dec d
	jr nz, .asm_48d2b
	ret

Function48d30:
	ld hl, wd475
	call Function48d4a
	ld hl, wd477
	call Function48d4a
	ret

Function48d3d:
	ld hl, wd475
	call Function48d94
	ld hl, wd477
	call Function48d94
	ret

Function48d4a:
	inc hl
	ld a, [hl]
	ld b, a
	and $f
	ld c, a
	srl b
	srl b
	srl b
	srl b
	push bc
	ld c, 10
	ld a, b
	call SimpleMultiply
	pop bc
	add c
	ld [hld], a
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	srl a
	srl a
	srl a
	srl a
	ld c, 10
	call SimpleMultiply
	ld b, a
	ld a, [hli]
	and $f
	add b
	ldh [hMultiplicand + 2], a
	ld a, 100
	ldh [hMultiplier], a
	call Multiply
	ldh a, [hProduct + 2]
	ld b, a
	ldh a, [hProduct + 3]
	ld c, a
	ld e, [hl]
	add e
	ld c, a
	ld a, b
	adc 0
	ld b, a
	ld a, c
	ld [hld], a
	ld [hl], b
	ret

Function48d94:
	xor a
	ldh [hDividend + 0], a
	ldh [hDividend + 1], a
	ld a, [hli]
	ldh [hDividend + 0], a
	ld a, [hl]
	ldh [hDividend + 1], a
	ld a, 100
	ldh [hDivisor], a
	ld b, 2
	call Divide
	ldh a, [hRemainder]
	ld c, 10
	call SimpleDivide
	sla b
	sla b
	sla b
	sla b
	or b
	ld [hld], a
	ldh a, [hQuotient + 3]
	ld c, 10
	call SimpleDivide
	sla b
	sla b
	sla b
	sla b
	or b
	ld [hl], a
	ret
