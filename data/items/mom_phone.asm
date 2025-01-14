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
	momitem    1800,   600, MOM_ITEM, SUPER_POTION
	momitem   8000,   270, MOM_ITEM, REPEL
	momitem   14000,   600, MOM_ITEM, SUPER_POTION
	momitem  20000,  1200, MOM_ITEM, ULTRA_BALL
	momitem  30000,  3000, MOM_ITEM, MOON_STONE
	momitem  38000,   600, MOM_ITEM, SUPER_POTION
	momitem  60000,  1200, MOM_ITEM, ULTRA_BALL
	momitem  80000,   900, MOM_ITEM, HYPER_POTION
	momitem  100000,  1200, MOM_ITEM, ULTRA_BALL
	momitem 200000, 22800, MOM_ITEM, MASTER_BALL
.End

	bigdt 0 ; unused
