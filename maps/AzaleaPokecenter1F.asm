	object_const_def
	const AZALEAPOKECENTER1F_NURSE
	const AZALEAPOKECENTER1F_GENTLEMAN
	const AZALEAPOKECENTER1F_SCIENTIST
	const AZALEAPOKECENTER1F_POKEFAN_F

AzaleaPokecenter1F_MapScripts:
	def_scene_scripts
	scene_script AzaleaPokecenter1FNoopScene ; unusable

	def_callbacks

AzaleaPokecenter1FNoopScene:
	end

AzaleaPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

AzaleaPokecenter1FGentlemanScript:
	
	jumptextfaceplayer AzaleaPokecenter1FGentlemanText

AzaleaPokecenter1FFishingGuruScript:
	jumptextfaceplayer AzaleaPokecenter1FFishingGuruText

AzaleaPokecenter1FPokefanFScript:
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

AzaleaPokecenter1FGentlemanText:
	text "Do your #MON"
	line "know HM moves?"

	para "Those moves can"
	line "be used even if"

	para "your #MON has"
	line "fainted."
	done

AzaleaPokecenter1FUnusedText: ; unreferenced
	text "This BILL gal"
	line "created the system"

	para "for storing"
	line "#MON in a PC."

	para "BILL's PC can"
	line "store up to 20"
	cont "#MON per BOX."
	done

AzaleaPokecenter1FFishingGuruText:
	text "This BILL gal"
	line "created the system"

	para "for storing"
	line "#MON in a PC."

	para "BILL's PC can"
	line "store up to 20"
	cont "#MON per BOX."
	done

AzaleaPokecenter1FPokefanFText:
	text "Do you know about"
	line "APRICORNS?"

	para "Crack one open,"
	line "hollow it out and"

	para "fit it with a"
	line "special device."

	para "Then you can catch"
	line "#MON with it."

	para "Before # BALLS"
	line "were invented,"

	para "everyone used"
	line "APRICORNS."
	done

AzaleaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, AZALEA_TOWN, 1
	warp_event  4,  7, AZALEA_TOWN, 1
	;warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FNurseScript, -1
	object_event  9,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FGentlemanScript, -1
	object_event  6,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FFishingGuruScript, -1
	object_event  1,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokecenter1FPokefanFScript, -1
