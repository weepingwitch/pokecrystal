MainMenu_Mobile:
	ret
Function49f0a:
	ret
Function49f16:
	ret

.joy_loop
	call ScrollingMenuJoypad
	ld hl, wMenuCursorY
	ld b, [hl]
	push bc

.check_buttons
	bit A_BUTTON_F, a
	jr nz, .a_button
	bit B_BUTTON_F, a
	jr nz, .b_button
	jr .next

.a_button
	ld hl, wMenuCursorY
	ld a, [hl]
	cp 1
	jp z, Function4a098
	cp 2
	jp z, Function4a0b9
	cp 3
	jp z, Function4a0c2
	cp 4
	jp z, Function4a100
	ld a, 1
	call MenuClickSound
.b_button
	pop bc
	call ClearBGPalettes
	call ClearTilemap
	ld a, MUSIC_MAIN_MENU
	ld [wMapMusic], a
	ld de, MUSIC_MAIN_MENU
	call Function4a6c5
	ret

.next
	ld hl, wMenuCursorY
	ld a, [hl]
	dec a
	ld hl, MobileStrings2
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 1, 13
	ld b, 4
	ld c, SCREEN_HEIGHT
	call ClearBox
	hlcoord 1, 14
	call PlaceString
	jp .useless_jump

.useless_jump
	call MobileMenu_InitMenuBuffers
	pop bc
	ld hl, wMenuCursorY
	ld [hl], b
	ld b, $a
	ld c, $1
	hlcoord 5, 1
	call ClearBox
	jp .joy_loop

MobileString1:
	db   "めいしフォルダー"
	next "あいさつ"
	next "プロフィール"
	next "せ<TTE>い"
	next "もどる"
	db   "@"

MobileStrings2:
; string 0
String_0x49fe9:
	db   "めいし<WO>つくったり"
	next "ほぞんしておける　フォルダーです@"
; string 1
	db   "モバイルたいせんや　じぶんのめいしで"
	next "つかう　あいさつ<WO>つくります@"
; string 2
	db   "あなた<NO>じゅうしょや　ねんれいの"
	next "せ<TTE>い<WO>かえられます@"
; string 3
	db  "モバイルセンター<NI>せつぞくするとき"
	next "ひつような　こと<WO>きめます@"
; string 4
	db   "まえ<NO>がめん　<NI>もどります"
	next "@"

MobileMenu_InitMenuBuffers:
	ld hl, w2DMenuCursorInitY
	ld a, 2
	ld [hli], a
	ld a, 5 ; w2DMenuCursorInitX
	ld [hli], a
	ld a, 5 ; w2DMenuNumRows
	ld [hli], a
	ld a, 1 ; w2DMenuNumCols
	ld [hli], a
	ld [hl], $0 ; w2DMenuFlags1
	set 5, [hl]
	inc hl
	xor a ; w2DMenuFlags2
	ld [hli], a
	ld a, $20 ; w2DMenuCursorOffsets
	ld [hli], a
	; could have done "ld a, A_BUTTON | D_UP | D_DOWN | B_BUTTON" instead
	ld a, A_BUTTON
	add D_UP
	add D_DOWN
	add B_BUTTON
	ld [hli], a ; wMenuJoypadFilter
	ld a, 1
	ld [hli], a ; wMenuCursorY, wMenuCursorX
	ld [hli], a ; wMenuCursorY, wMenuCursorX
	ret

Function4a098:
	ld a, 2
	call MenuClickSound
	call PlaceHollowCursor
	call WaitBGMap
	call LoadStandardMenuHeader
	farcall Function89de0
	call Call_ExitMenu
	call MG_Mobile_Layout_LoadPals
	call Function4a485
	pop bc
	jp Function49f16

Function4a0b9:
	ld a, 2
	call MenuClickSound
	pop bc
	jp Function4a4c4

Function4a0c2:
	ret

Function4a100:
	ld a, 2
	call MenuClickSound
	call ClearBGPalettes
	call Function4a13b
	call ClearBGPalettes
	call ClearTilemap

asm_4a111:
	pop bc
	call LoadFontsExtra
	jp Function49f0a

Function4a118:
	
	ret

Function4a13b:
	ret

Function4a149:
	ret

Function4a195:
	ret

asm_4a19d:
	bit 0, a
	ret

String_4a1ef:
	db   "モバイルセンター<WO>えらぶ"
	next "ログインパスワード<WO>いれる"
	next "もどる@"

Function4a20e:
	ld a, $1
	call MenuClickSound
	farcall Function1719c8
	call ClearBGPalettes
	call DelayFrame
	jr Function4a239

Function4a221:
	ld a, $1
	call MenuClickSound
	call Function4a28a
	jr c, Function4a239
	call Function4a373
	ld a, $2
	ld [wMenuCursorY], a
	jr .asm_4a235
.asm_4a235
	pop bc
	jp Function4a149

Function4a239:
	pop bc
	jp Function4a13b

Strings_4a23d:
	db   "いつも　せつぞく<WO>する"
	next "モバイルセンター<WO>えらびます@"

	db   "モバイルセンター<NI>せつぞくするとき"
	next "つかうパスワード<WO>ほぞんできます@"

	db   "まえ<NO>がめん　<NI>もどります@"

	db   "@"

Function4a28a:
	
	ret

MenuHeader_0x4a346: ; unreferenced
	db MENU_BACKUP_TILES ; flags
	menu_coords 12, 0, SCREEN_WIDTH - 1, 6

String_4a34b:
	db   "いれなおす"
	next "けす"
	next "もどる@"

DeleteSavedLoginPasswordText:
	text_far _DeleteSavedLoginPasswordText
	text_end

DeletedTheLoginPasswordText:
	text_far _DeletedTheLoginPasswordText
	text_end

DeletePassword_YesNo_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 14, 7, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw MenuData_0x4a36a
	db 2 ; default option

MenuData_0x4a36a:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING | STATICMENU_WRAP ; flags
	db 2 ; items
	db "はい@"
	db "いいえ@"

Function4a373:
	ld hl, w2DMenuCursorInitY
	ld a, $4
	ld [hli], a
	ld a, $2
	ld [hli], a
	ld a, $3
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hl], $0
	set 5, [hl]
	inc hl
	xor a
	ld [hli], a
	ld a, $20
	ld [hli], a
	ld a, $1
	add $40
	add $80
	add $2
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hli], a
	ret

Function4a39a: ; unreferenced
	call Function4a485
	call Function4a492
	call Function4a3aa
	call SetDefaultBGPAndOBP
	ret

Function4a3a7:
	call Function4a485
Function4a3aa:
	hlcoord 0, 0
	lb bc, 3, 1
	xor a
	call Function4a6d8
	lb bc, 1, 1
	ld a, $1
	call Function4a6d8
	lb bc, 1, 1
	xor a
	call Function4a6d8
	lb bc, 1, 1
	ld a, $1
	call Function4a6d8
	lb bc, 4, 1
	ld a, $2
	call Function4a6d8
	lb bc, 1, 1
	ld a, $3
	call Function4a6d8
	lb bc, 1, 1
	ld a, " "
	call Function4a6d8
	hlcoord 1, 0
	ld a, $1
	lb bc, 3, 18
	call Function4a6d8
	lb bc, 1, 18
	ld a, $0
	call Function4a6d8
	lb bc, 1, 18
	ld a, $1
	call Function4a6d8
	lb bc, 1, 18
	ld a, $2
	call Function4a6d8
	lb bc, 11, 18
	ld a, " "
	call Function4a6d8
	hlcoord 19, 0
	lb bc, 3, 1
	ld a, $0
	call Function4a6d8
	lb bc, 1, 1
	ld a, $1
	call Function4a6d8
	lb bc, 1, 1
	xor a
	call Function4a6d8
	lb bc, 1, 1
	ld a, $1
	call Function4a6d8
	lb bc, 4, 1
	ld a, $2
	call Function4a6d8
	lb bc, 1, 1
	ld a, $3
	call Function4a6d8
	lb bc, 1, 1
	ld a, " "
	call Function4a6d8
	ret

Function4a449: ; unreferenced
	ld bc, 3 * SCREEN_WIDTH
	ld a, $0
	hlcoord 0, 0
	call ByteFill
	ld bc, 2 * SCREEN_WIDTH
	ld a, $1
	call ByteFill
	ld bc, 2 * SCREEN_WIDTH
	ld a, $0
	call ByteFill
	ld bc, 2 * SCREEN_WIDTH
	ld a, $1
	call ByteFill
	ld bc, SCREEN_WIDTH
	ld a, $2
	call ByteFill
	ld bc, SCREEN_WIDTH
	ld a, $3
	call ByteFill
	ld bc, SCREEN_WIDTH
	ld a, " "
	call ByteFill
	ret

Function4a485:
	ld de, MobileMenuGFX
	ld hl, vTiles2 tile $00
	lb bc, BANK(MobileMenuGFX), 13
	call Get2bpp
	ret

Function4a492:
	call _CrystalCGB_MobileLayout0
	ret

MainMenu_MobileStudium:
	ld a, [wStartDay]
	ld b, a
	ld a, [wStartHour]
	ld c, a
	ld a, [wStartMinute]
	ld d, a
	ld a, [wStartSecond]
	ld e, a
	push bc
	push de
	farcall MobileStudium
	call ClearBGPalettes
	pop de
	pop bc
	ld a, b
	ld [wStartDay], a
	ld a, c
	ld [wStartHour], a
	ld a, d
	ld [wStartMinute], a
	ld a, e
	ld [wStartSecond], a
	ret

Function4a4c4:
	ret

Function4a545:
	call ScrollingMenuJoypad
	ld hl, wMenuCursorY
	ld b, [hl]
	push bc

asm_4a54d:
	bit 0, a
	jr nz, .asm_4a557
	bit 1, a
	jr nz, .asm_4a574
	jr .asm_4a57e
.asm_4a557
	ld hl, wMenuCursorY
	ld a, [hl]
	cp $1
	jp z, Function4a6ab
	cp $2
	jp z, Function4a6ab
	cp $3
	jp z, Function4a6ab
	cp $4
	jp z, Function4a6ab
	ld a, $1
	call MenuClickSound
.asm_4a574
	pop bc
	call ClearBGPalettes
	call ClearTilemap
	jp Function49f0a
.asm_4a57e
	ld hl, wMenuCursorY
	ld a, [hl]
	dec a
	add a
	push af
	ld hl, Strings_4a5f6
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 1, 13
	ld b, $4
	ld c, $12
	call ClearBox
	hlcoord 1, 14
	call PlaceString
	pop af
	inc a
	ld hl, Strings_4a5f6
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 1, 16
	call PlaceString
	jp Function4a5b0

Function4a5b0:
	call Function4a680
	pop bc
	ld hl, wMenuCursorY
	ld [hl], b
	ld b, $a
	ld c, $1
	hlcoord 3, 1
	call ClearBox
	jp Function4a545

String_4a5c5:
	db "じこしょうかい@"
String_4a5cd:
	db "たいせん　<GA>はじまるとき@"
String_4a5da:
	db "たいせん　<NI>かったとき@"
String_4a5e6:
	db "たいせん　<NI>まけたとき@"
String_4a5f2:
	db "もどる@"

Strings_4a5f6:
	db "めいし　や　ニュース　<NI>のせる@"
	db "あなた<NO>あいさつです@"
	db "モバイル　たいせん<GA>はじまるとき@"
	db "あいて<NI>みえる　あいさつです@"
	db "モバイル　たいせんで　かったとき@"
	db "あいて<NI>みえる　あいさつです@"
	db "モバイル　たいせんで　まけたとき@"
	db "あいて<NI>みえる　あいさつです@"
	db "まえ<NO>がめん　<NI>もどります@"
	db "@"

Function4a680:
	ld hl, w2DMenuCursorInitY
	ld a, $2
	ld [hli], a
	ld a, $3
	ld [hli], a
	ld a, $5
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hl], $0
	set 5, [hl]
	inc hl
	xor a
	ld [hli], a
	ld a, $20
	ld [hli], a
	ld a, $1
	add $40
	add $80
	add $2
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret

Function4a6ab:
	ret
Function4a6c5:
	ld a, $5
	ld [wMusicFade], a
	ld a, e
	ld [wMusicFadeID], a
	ld a, d
	ld [wMusicFadeID + 1], a
	ld c, 22
	call DelayFrames
	ret

Function4a6d8:
	
	ret

if DEF(_DEBUG)
MainMenu_DebugRoom:
	farcall _DebugRoom
	ret
endc
