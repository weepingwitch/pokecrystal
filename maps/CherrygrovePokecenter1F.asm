	object_const_def
	const CHERRYGROVEPOKECENTER1F_NURSE
	const CHERRYGROVEPOKECENTER1F_FISHER
	const CHERRYGROVEPOKECENTER1F_GENTLEMAN
	const CHERRYGROVEPOKECENTER1F_TEACHER

CherrygrovePokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CherrygrovePokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CherrygrovePokecenter1FFisherScript:
	jumptextfaceplayer CherrygrovePokecenter1FFisherText

CherrygrovePokecenter1FGentlemanScript:
	jumptextfaceplayer CherrygrovePokecenter1FGentlemanText



CherrygrovePokecenter1FTeacherScript:
	faceplayer
	opentext
	writetext CherrygrovePokecenter1FTeacherDoYouHaveEonMailText
	waitbutton
	writetext CherrygrovePokecenter1FTeacherAskGiveAwayAnEonMailText
	yesorno
	iffalse .NoEonMail
	takeitem ZELDA1
	iffalse .NoEonMail
	writetext CherrygrovePokecenter1FTeacherPlayerGaveAwayTheEonMailText
	waitbutton
	writetext CherrygrovePokecenter1FTeacherThisIsForYouText
	waitbutton
	verbosegiveitem GREAT_BALL
	iffalse .NoRoom
	verbosegiveitem ZELDA2
	writetext CherrygrovePokecenter1FTeacherDaughterWillBeDelightedText
	waitbutton
	closetext
	end

.NoEonMail:
	writetext CherrygrovePokecenter1FTeacherTooBadText
	waitbutton
	closetext
	end

.NoRoom:
	giveitem ZELDA1
	writetext CherrygrovePokecenter1FTeacherAnotherTimeThenText
	waitbutton
	closetext
	end

CherrygrovePokecenter1FFisherText:
	text "It's great. I can"
	line "store any number"

	para "of #MON, and"
	line "it's all free."
	done

CherrygrovePokecenter1FGentlemanText:
	text "That PC is free"
	line "for any trainer"
	cont "to use."
	done

CherrygrovePokecenter1FTeacherDoYouHaveEonMailText:
	text "Oh my, your pack"
	line "looks so heavy!"

	para "Oh! Do you happen"
	line "to have BLAHAJ?"

	para "My daughter is"
	line "after one."

	para "You can part with"
	line "one, can't you?"
	done

CherrygrovePokecenter1FTeacherAskGiveAwayAnEonMailText:
	text "Give away the"
	line "BLAHAJ?"
	done

CherrygrovePokecenter1FTeacherThisIsForYouText:
	text "Oh, that's great!"
	line "Thank you, honey!"

	para "Here, this is for"
	line "you in return!"
	done

CherrygrovePokecenter1FTeacherDaughterWillBeDelightedText:
	text "My daughter will"
	line "be delighted!"
	done

CherrygrovePokecenter1FTeacherTooBadText:
	text "Oh? You don't have"
	line "one? Too bad."
	done

CherrygrovePokecenter1FTeacherAnotherTimeThenText:
	text "Oh… Well, another"
	line "time, then."
	done

CherrygrovePokecenter1FTeacherPlayerGaveAwayTheEonMailText:
	text "<PLAYER> gave away"
	line "BLAHAJ"
	done
CherrygrovePokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CHERRYGROVE_CITY, 2
	warp_event  4,  7, CHERRYGROVE_CITY, 2
	;warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FNurseScript, -1
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FFisherScript, -1
	object_event  8,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FGentlemanScript, -1
	object_event  1,  6, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CherrygrovePokecenter1FTeacherScript, -1
