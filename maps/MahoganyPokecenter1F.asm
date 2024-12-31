	object_const_def
	const MAHOGANYPOKECENTER1F_NURSE
	const MAHOGANYPOKECENTER1F_POKEFAN_M
	const MAHOGANYPOKECENTER1F_YOUNGSTER
	const MAHOGANYPOKECENTER1F_COOLTRAINER_F

MahoganyPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

MahoganyPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

MahoganyPokecenter1FPokefanMScript:
	jumptextfaceplayer MahoganyPokecenter1FPokefanMText

MahoganyPokecenter1FYoungsterScript:
	jumptextfaceplayer MahoganyPokecenter1FYoungsterText

MahoganyPokecenter1FCooltrainerFScript:
	jumptextfaceplayer MahoganyPokecenter1FCooltrainerFText

MahoganyPokecenter1FPokefanMText:
	text "What's this? TEAM"
	line "ROCKET has come"
	cont "back?"

	para "I saw some girls in"
	line "black at LAKE OF"
	cont "RAGE…"
	done

MahoganyPokecenter1FYoungsterText:
	text "I stop my #MON"
	line "from evolving too"
	cont "early."

	para "I make them learn"
	line "certain moves be-"
	cont "fore I let them"
	cont "evolve."
	done

MahoganyPokecenter1FCooltrainerFText:
	faceplayer
	opentext
	checkevent EVENT_ZELDA4
	iftrue .AlreadyGiven
	writetext ZeldaTrade4DoYouHaveEonMailText
	waitbutton
	writetext ZeldaTrade4AskGiveAwayAnEonMailText
	yesorno
	iffalse .NoEonMail
	takeitem ZELDA4
	iffalse .NoEonMail
	writetext ZeldaTrade4PlayerGaveAwayTheEonMailText
	waitbutton
	writetext ZeldaTrade4ThisIsForYouText
	waitbutton
	verbosegiveitem ULTRA_BALL
	iffalse .NoRoom
	verbosegiveitem ZELDA5
	writetext ZeldaTrade4DaughterWillBeDelightedText
	setevent EVENT_ZELDA4
	waitbutton
	closetext
	end

.NoEonMail:
	writetext ZeldaTrade4TooBadText
	waitbutton
	closetext
	end

.NoRoom:
	giveitem ZELDA4
	writetext ZeldaTrade4AnotherTimeThenText
	waitbutton
	closetext
	end

.AlreadyGiven:
	writetext Zelda4AlreadyGivenText
	waitbutton
	closetext
	end

Zelda4AlreadyGivenText:
	text "Thank you!! My"
	line "daughter is so"
	cont "happy!"
	done


ZeldaTrade4DoYouHaveEonMailText:
	text "Oh my, your pack"
	line "looks so heavy!"

	para "Oh! Do you happen"
	line "to have EYELINER?"

	para "My daughter is"
	line "after a stick."

	para "You can part with"
	line "it, can't you?"
	done

ZeldaTrade4AskGiveAwayAnEonMailText:
	text "Give away the"
	line "EYELINER?"
	done

ZeldaTrade4ThisIsForYouText:
	text "Oh, that's great!"
	line "Thank you, honey!"

	para "Here, this is for"
	line "you in return!"
	done

ZeldaTrade4DaughterWillBeDelightedText:
	text "My daughter will"
	line "be delighted!"
	done

ZeldaTrade4TooBadText:
	text "Oh? You don't have"
	line "one? Too bad."
	done

ZeldaTrade4AnotherTimeThenText:
	text "Oh… Well, another"
	line "time, then."
	done

ZeldaTrade4PlayerGaveAwayTheEonMailText:
	text "<PLAYER> gave away"
	line "the EYELINER."
	done

MahoganyPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, MAHOGANY_TOWN, 4
	warp_event  4,  7, MAHOGANY_TOWN, 4
	;warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FPokefanMScript, -1
	object_event  1,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FYoungsterScript, -1
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FCooltrainerFScript, -1
