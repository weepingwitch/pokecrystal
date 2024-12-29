Function115d99:
	
	ret

Function115dc3:
	xor a
	ld [wc305], a
	ld a, $a0
	ld hl, wShadowOAMSprite31
	ld bc, 8 * SPRITEOAMSTRUCT_LENGTH
	call ByteFill
	ret

Function115dd3:
	
	ret

Function115e18:
	ld a, c
	ld [wc30a], a
	xor a
	ld [wc30b], a
	jr Function115e2b

Function115e22:
	ld hl, wc30c
	dec [hl]
	ret nz
	ld hl, wc30b
	inc [hl]

Function115e2b:
	ret

.not_end
	ld [wc309], a
	ld a, [hl]
	ld [wc30c], a
	ret


Function11615a:
	
	ret

Function11619d:
	
	ret


Function116468:
	
	ret
