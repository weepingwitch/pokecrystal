ZeldaTrade3Script:
	faceplayer
	opentext
	checkevent EVENT_ZELDA3
	iftrue .AlreadyGiven
	writetext ZeldaTrade3DoYouHaveEonMailText
	waitbutton
	writetext ZeldaTrade3AskGiveAwayAnEonMailText
	yesorno
	iffalse .NoEonMail
	takeitem ZELDA3
	iffalse .NoEonMail
	writetext ZeldaTrade3PlayerGaveAwayTheEonMailText
	waitbutton
	writetext ZeldaTrade3ThisIsForYouText
	waitbutton
	verbosegiveitem ULTRA_BALL
	iffalse .NoRoom
	verbosegiveitem ZELDA4
	writetext ZeldaTrade3DaughterWillBeDelightedText
	setevent EVENT_ZELDA3
	waitbutton
	closetext
	end

.NoEonMail:
	writetext ZeldaTrade3TooBadText
	waitbutton
	closetext
	end

.NoRoom:
	giveitem ZELDA3
	writetext ZeldaTrade3AnotherTimeThenText
	waitbutton
	closetext
	end

.AlreadyGiven:
	writetext Zelda3AlreadyGivenText
	waitbutton
	closetext
	end

Zelda3AlreadyGivenText:
	text "Thank you!! My"
	line "daughter is so"
	cont "happy!"
	done


ZeldaTrade3DoYouHaveEonMailText:
	text "Oh my, your pack"
	line "looks so heavy!"

	para "Oh! Do you happen"
	line "to have ESTRADIOL?"

	para "My daughter is"
	line "after a pair."

	para "You can part with"
	line "some, can't you?"
	done

ZeldaTrade3AskGiveAwayAnEonMailText:
	text "Give away the"
	line "ESTRADIOL?"
	done

ZeldaTrade3ThisIsForYouText:
	text "Oh, that's great!"
	line "Thank you, honey!"

	para "Here, this is for"
	line "you in return!"
	done

ZeldaTrade3DaughterWillBeDelightedText:
	text "My daughter will"
	line "be delighted!"
	done

ZeldaTrade3TooBadText:
	text "Oh? You don't have"
	line "one? Too bad."
	done

ZeldaTrade3AnotherTimeThenText:
	text "Oh… Well, another"
	line "time, then."
	done

ZeldaTrade3PlayerGaveAwayTheEonMailText:
	text "<PLAYER> gave away"
	line "the ESTRADIOL."
	done