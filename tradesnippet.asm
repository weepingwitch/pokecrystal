ZeldaTrade6Script:
	faceplayer
	opentext
	checkevent EVENT_ZELDA6
	iftrue .AlreadyGiven
	writetext ZeldaTrade6DoYouHaveEonMailText
	waitbutton
	writetext ZeldaTrade6AskGiveAwayAnEonMailText
	yesorno
	iffalse .NoEonMail
	takeitem ZELDA6
	iffalse .NoEonMail
	writetext ZeldaTrade6PlayerGaveAwayTheEonMailText
	waitbutton
	writetext ZeldaTrade6ThisIsForYouText
	waitbutton
	verbosegiveitem MASTER_BALL
	iffalse .NoRoom
	writetext ZeldaTrade6DaughterWillBeDelightedText
	setevent EVENT_ZELDA6
	waitbutton
	closetext
	end

.NoEonMail:
	writetext ZeldaTrade6TooBadText
	waitbutton
	closetext
	end

.NoRoom:
	giveitem ZELDA6
	writetext ZeldaTrade6AnotherTimeThenText
	waitbutton
	closetext
	end

.AlreadyGiven:
	writetext Zelda6AlreadyGivenText
	waitbutton
	closetext
	end

Zelda6AlreadyGivenText:
	text "Thank you!! My"
	line "daughter is so"
	cont "happy!"
	done


ZeldaTrade6DoYouHaveEonMailText:
	text "Oh my, your pack"
	line "looks so heavy!"

	para "Oh! Do you happen"
	line "to have PICKLES?"

	para "My daughter is"
	line "after some."

	para "You can part with"
	line "it, can't you?"
	done

ZeldaTrade6AskGiveAwayAnEonMailText:
	text "Give away the"
	line "PICKLES?"
	done

ZeldaTrade6ThisIsForYouText:
	text "Oh, that's great!"
	line "Thank you, honey!"

	para "Here, this is for"
	line "you in return!"
	done

ZeldaTrade6DaughterWillBeDelightedText:
	text "My daughter will"
	line "be delighted!"
	done

ZeldaTrade6TooBadText:
	text "Oh? You don't have"
	line "one? Too bad."
	done

ZeldaTrade6AnotherTimeThenText:
	text "Oh… Well, another"
	line "time, then."
	done

ZeldaTrade6PlayerGaveAwayTheEonMailText:
	text "<PLAYER> gave away"
	line "the PICKLES."
	done