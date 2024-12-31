	object_const_def
	const CIANWOODPOKECENTER1F_NURSE
	const CIANWOODPOKECENTER1F_LASS
	const CIANWOODPOKECENTER1F_GYM_GUIDE
	const CIANWOODPOKECENTER1F_SUPER_NERD

CianwoodPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CianwoodPokecenter1FLassScript:
	jumptextfaceplayer CianwoodPokecenter1FLassText

CianwoodGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_CHUCK
	iftrue .CianwoodGymGuideWinScript
	opentext
	writetext CianwoodGymGuideText
	waitbutton
	closetext
	end

.CianwoodGymGuideWinScript:
	opentext
	writetext CianwoodGymGuideWinText
	waitbutton
	closetext
	end

CianwoodPokecenter1FSuperNerdScript:
	jumptextfaceplayer CianwoodPokecenter1FSuperNerdText

CianwoodPokecenter1FLassText:
	text "Did you meet the"
	line "#MANIAC?"

	para "she's always brag-"
	line "ging about her"
	cont "rare #MON."
	done

CianwoodGymGuideText:
	text "The #MON GYM"
	line "trainers here are"
	cont "macho bullies."

	para "If I stick around,"
	line "they might come"
	cont "after me."

	para "Here's some ad-"
	line "vice: the GYM"

	para "LEADER uses the"
	line "fighting-type."

	para "So you should"
	line "confound her with"
	cont "psychic #MON."

	para "Wipe out her #-"
	line "MON before they"

	para "can use their"
	line "physical strength."

	para "And those boulders"
	line "in the middle of"
	cont "the GYM?"

	para "If you don't move"
	line "them correctly,"

	para "you won't reach"
	line "the GYM LEADER."

	para "If you get stuck,"
	line "go outside."
	done

CianwoodGymGuideWinText:
	text "<PLAYER>! You won!"
	line "I could tell by"
	cont "looking at you!"
	done

CianwoodPokecenter1FUnusedText1: ; unreferenced
	text "Don't you get the"
	line "urge to show off"

	para "your #MON to"
	line "friends?"

	para "I wish I could"
	line "show the #MON I"

	para "raised to my pal"
	line "in VIOLET."
	done

CianwoodPokecenter1FUnusedText2: ; unreferenced
	text "I've been battling"
	line "my pal in VIOLET"

	para "using a MOBILE"
	line "ADAPTER link."

	para "I'm down 5-7"
	line "against her. I've"
	cont "gotta crank it up!"
	done

CianwoodPokecenter1FSuperNerdText:
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

CianwoodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CIANWOOD_CITY, 3
	warp_event  4,  7, CIANWOOD_CITY, 3
	;warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FLassScript, -1
	object_event  5,  3, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuideScript, -1
	object_event  8,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FSuperNerdScript, -1
