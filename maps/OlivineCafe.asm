	object_const_def
	const OLIVINECAFE_SAILOR1
	const OLIVINECAFE_FISHING_GURU
	const OLIVINECAFE_SAILOR2

OlivineCafe_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM04_STRENGTH
	iftrue .GotStrength
	writetext OlivineCafeStrengthSailorText
	promptbutton
	verbosegiveitem HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
.GotStrength:
	writetext OlivineCafeStrengthSailorText_GotStrength
	waitbutton
	closetext
	end

OlivineCafeFishingGuruScript:
	jumptextfaceplayer OlivineCafeFishingGuruText

OlivineCafeSailorScript:
	opentext
	writetext OFisher1Text_Snarfle
	waitbutton
	closetext
	faceplayer
	opentext
	writetext OFisher1Text_Concentration
	waitbutton
	yesorno
	iffalse .NOHOTSAUCE
	takeitem HOT_SAUCE
	iffalse .NOHOTSAUCE
	clearevent EVENT_GOT_HOTSAUCE
	writetext OFisher1Text_Yummy
	waitbutton
	closetext
	loadtrainer FIREBREATHER, DICK
	startbattle
	reloadmapafterbattle
	opentext
	writetext OFisher1Text_Beaten
	waitbutton
	closetext
	turnobject OLIVINECAFE_SAILOR2, UP
	end
.NOHOTSAUCE:
	writetext OFisher1_Disappointed
	waitbutton
	closetext
	turnobject OLIVINECAFE_SAILOR2, UP
	end

OlivineCafeStrengthSailorText:
	text "Hah! Your #MON"
	line "sure look like"
	cont "lightweights!"



	para "Here, use this"
	line "and teach them"
	cont "STRENGTH!"
	done

OlivineCafeStrengthSailorText_GotStrength:
	text "On the sea, the"
	line "only thing you can"

	para "count on is your"
	line "own good self!"

	para "I'm so proud of my"
	line "buff bod!"
	done

OlivineCafeFishingGuruText:
	text "OLIVINE CAFE's"
	line "menu is chock full"

	para "of hearty fare for"
	line "beefy SAILORS!"

	para "The fried SLOW-"
	line "POKETAIL is very"
	cont "good!"
	done

OFisher1Text_Snarfle:
	text "…Snarfle, chew…"
	
	para "I wish I had some"
	line "HOT SAUCE..."
	done

OFisher1Text_Concentration:
	text "Can you give me"
	line "some?"

	done

OFisher1Text_Yummy:
	text "Delicious!"

	para "I'm all fired up"
	line "for battle!"
	done

OFisher1_Disappointed:
	text "Aww, come on..."
	done

OFisher1Text_Beaten:
	text "What a delicious"
	line "battle!"
	done

OlivineCafe_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 7
	warp_event  3,  7, OLIVINE_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeStrengthSailorScript, -1
	object_event  7,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeFishingGuruScript, -1
	object_event  6,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeSailorScript, -1
