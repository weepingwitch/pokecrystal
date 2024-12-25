MACRO momitem
; money to trigger, cost, kind, item
	bigdt \1, \2
	db \3, \4
ENDM

MomItems_1:
	momitem      0,   600, MOM_ITEM, SUPER_POTION
	momitem      0,    90, MOM_ITEM, ANTIDOTE
	momitem      0,   180, MOM_ITEM, POKE_BALL
	momitem      0,   450, MOM_ITEM, ESCAPE_ROPE
	momitem      0,   500, MOM_ITEM, GREAT_BALL
.End

MomItems_2:
	momitem    900,   600, MOM_ITEM, SUPER_POTION
	momitem   4000,   270, MOM_ITEM, REPEL
	momitem   7000,   600, MOM_ITEM, SUPER_POTION
	momitem  10000,  1200, MOM_ITEM, ULTRA_BALL
	momitem  15000,  3000, MOM_ITEM, MOON_STONE
	momitem  19000,   600, MOM_ITEM, SUPER_POTION
	momitem  30000,  1200, MOM_ITEM, ULTRA_BALL
	momitem  40000,   900, MOM_ITEM, HYPER_POTION
	momitem  50000,  1200, MOM_ITEM, ULTRA_BALL
	momitem 100000, 22800, MOM_ITEM, MASTER_BALL
.End

	bigdt 0 ; unused
