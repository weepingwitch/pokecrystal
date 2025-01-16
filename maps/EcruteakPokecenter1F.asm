	object_const_def
	const ECRUTEAKPOKECENTER1F_NURSE
	const ECRUTEAKPOKECENTER1F_POKEFAN_M
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_F
	const ECRUTEAKPOKECENTER1F_GYM_GUIDE
	const ECRUTEAKPOKECENTER1F_BILL

EcruteakPokecenter1F_MapScripts:
	def_scene_scripts
	scene_script EcruteakPokecenter1FMeetBillScene, SCENE_ECRUTEAKPOKECENTER1F_MEET_BILL
	scene_script EcruteakPokecenter1FNoopScene,     SCENE_ECRUTEAKPOKECENTER1F_NOOP

	def_callbacks

EcruteakPokecenter1FMeetBillScene:
	sdefer EcruteakPokcenter1FBillActivatesTimeCapsuleScript
	end

EcruteakPokecenter1FNoopScene:
	end

EcruteakPokcenter1FBillActivatesTimeCapsuleScript:
	pause 30
	playsound SFX_EXIT_BUILDING
	appear ECRUTEAKPOKECENTER1F_BILL
	waitsfx
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement1
	applymovement PLAYER, EcruteakPokecenter1FPlayerMovement1
	turnobject ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	turnobject ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 30
	turnobject ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	turnobject ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 20
	turnobject ECRUTEAKPOKECENTER1F_BILL, DOWN
	pause 10
	opentext
	writetext EcruteakPokecenter1F_BillText1
	promptbutton
	verbosegiveitem LAPTOP
	sjump .PointlessJump

.PointlessJump:
	writetext EcruteakPokecenter1F_BillText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement2
	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKPOKECENTER1F_BILL
	clearevent EVENT_MET_BILL
	setflag ENGINE_TIME_CAPSULE
	setscene SCENE_ECRUTEAKPOKECENTER1F_NOOP
	waitsfx
	end

EcruteakPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

EcruteakPokecenter1FPokefanMScript:
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
	line "after some."

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

EcruteakPokecenter1FCooltrainerFScript:
	jumptextfaceplayer EcruteakPokecenter1FCooltrainerFText

EcruteakPokecenter1FGymGuideScript:
	checkflag ENGINE_TIME_CAPSULE
	iffalse .justext
	checkitem LAPTOP
	iftrue .justext
	verbosegiveitem LAPTOP
.justext
	jumptextfaceplayer EcruteakPokecenter1FGymGuideText

EcruteakPokecenter1FBillMovement1:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

EcruteakPokecenter1FBillMovement2:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

EcruteakPokecenter1FPlayerMovement1:
	step UP
	step UP
	step UP
	step_end



EcruteakPokecenter1F_BillText1:
	text "Hi, I'm willow."
	line "Who are you?"

	para "Hmm, <PLAYER>, huh?"
	line "Nice to meet you."

	para "Here, have this"
	line "LAPTOP!"
	done

EcruteakPokecenter1F_BillText2:
	text "I was disabling"
	line "the link center"
	cont "upstairs."

	para "This world is too"
	line "powerful to trade"
	cont "with others!"
	

	para "Buh-bye!"
	done



EcruteakPokecenter1FCooltrainerFText:
	text "MORTY, the GYM"
	line "LEADER, is soooo"
	cont "hot."

	para "her #MON are"
	line "really tough too."
	done

EcruteakPokecenter1FGymGuideText:
	text "LAKE OF RAGE…"

	para "The appearance of"
	line "a GYARADOS swarm…"

	para "I smell a conspir-"
	line "acy. I know it!"
	done

EcruteakPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 6
	warp_event  4,  7, ECRUTEAK_CITY, 6
	;warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FPokefanMScript, -1
	object_event  1,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FCooltrainerFScript, -1
	object_event  7,  1, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FGymGuideScript, -1
	object_event  0,  7, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_POKE_CENTER_BILL
