ZeldaTrade2Script:
	faceplayer
	opentext
	checkevent EVENT_ZELDA2
	iftrue .AlreadyGiven
	writetext ZeldaTrade2DoYouHaveEonMailText
	waitbutton
	writetext ZeldaTrade2AskGiveAwayAnEonMailText
	yesorno
	iffalse .NoEonMail
	takeitem ZELDA2
	iffalse .NoEonMail
	writetext ZeldaTrade2PlayerGaveAwayTheEonMailText
	waitbutton
	writetext ZeldaTrade2ThisIsForYouText
	waitbutton
	verbosegiveitem ULTRA_BALL
	iffalse .NoRoom
	verbosegiveitem ZELDA3
	writetext ZeldaTrade2DaughterWillBeDelightedText
	setevent EVENT_ZELDA2
	waitbutton
	closetext
	end

.NoEonMail:
	writetext ZeldaTrade2TooBadText
	waitbutton
	closetext
	end

.NoRoom:
	giveitem ZELDA2
	writetext ZeldaTrade2AnotherTimeThenText
	waitbutton
	closetext
	end

.AlreadyGiven:
	writetext Zelda2AlreadyGivenText
	waitbutton
	closetext
	end

Zelda2AlreadyGivenText:
	text "Thank you!! My"
	line "daughter is so"
	cont "happy!"
	done


ZeldaTrade2DoYouHaveEonMailText:
	text "Oh my, your pack"
	line "looks so heavy!"

	para "Oh! Do you happen"
	line "to have FISHNETS?"

	para "My daughter is"
	line "after a pair."

	para "You can part with"
	line "some, can't you?"
	done

ZeldaTrade2AskGiveAwayAnEonMailText:
	text "Give away the"
	line "FISHNETS?"
	done

ZeldaTrade2ThisIsForYouText:
	text "Oh, that's great!"
	line "Thank you, honey!"

	para "Here, this is for"
	line "you in return!"
	done

ZeldaTrade2DaughterWillBeDelightedText:
	text "My daughter will"
	line "be delighted!"
	done

ZeldaTrade2TooBadText:
	text "Oh? You don't have"
	line "one? Too bad."
	done

ZeldaTrade2AnotherTimeThenText:
	text "Oh… Well, another"
	line "time, then."
	done

ZeldaTrade2PlayerGaveAwayTheEonMailText:
	text "<PLAYER> gave away"
	line "the FISHNETS."
	done