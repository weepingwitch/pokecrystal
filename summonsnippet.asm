VioletCitySuperNerdScript:
    faceplayer
    opentext
    checkevent EVENT_GIVEN_SUMMONCHARM
	iftrue .statustext
    writetext GetSummonText
    closetext
    end 
.statustext
    ld a, [wWildScaleToggle]
	and a
	jr z, .statoff
.staton
    writetext SummonOnText
    closetext
    end
.statoff
    writetext SummonOffText
    closetext
    end

GetSummonText:
    text_far _SomeKidVioletText
    text_end

SummonOnText:
    text_far _SummonOnText
    text_end

SummonOffText:
    text_far _SummonOffText
    text_end