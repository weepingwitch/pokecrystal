	object_const_def
	const ECRUTEAKITEMFINDERHOUSE_COOLTRAINER_M
	const ECRUTEAKITEMFINDERHOUSE_POKEDEX

EcruteakItemfinderHouse_MapScripts:
	def_scene_scripts

	def_callbacks

EcruteakItemfinderGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_ITEMFINDER
	iftrue .itemfinder
	writetext EcruteakItemfinderAdventureText
	yesorno
	iffalse .no
	writetext EcruteakItemfinderTrueSpiritText
	promptbutton
	verbosegiveitem NUGGET
	giveitem NUGGET
	giveitem NUGGET
	giveitem NUGGET
	setevent EVENT_GOT_ITEMFINDER
.itemfinder:
	writetext ItemfinderExplanationText
	waitbutton
	closetext
	end

.no:
	writetext EcruteakItemfinderToEachHisOwnText
	waitbutton
	closetext
	end

EcruteakHistoryBook:
	opentext
	writetext EcruteakHistoryBookText
	yesorno
	iftrue .ReadBook
	closetext
	end

.ReadBook:
	writetext EcruteakTwoTowersText
	yesorno
	iftrue .KeepReading
	closetext
	end

.KeepReading:
	writetext EcruteakThreeMonText
	waitbutton
	closetext
	end

ItemFinderHouseRadio:
	jumpstd Radio2Script

EcruteakItemfinderAdventureText:
	text "Ah. You're on an"
	line "adventure with"
	cont "your #MON?"

	para "You look poor."
	
	done

EcruteakItemfinderTrueSpiritText:

	text "I like that! Take"
	line "these with you."
	done

ItemfinderExplanationText:
	text "Don't expect that"
	line "again!"

	
	done

EcruteakItemfinderToEachHisOwnText:
	text "Oh… To each her"
	line "own, I suppose…"
	done

EcruteakHistoryBookText:
	text "HISTORY OF"
	line "ECRUTEAK"

	para "Want to read it?"
	done

EcruteakTwoTowersText:
	text "In ECRUTEAK, there"
	line "were two towers."

	para "Each tower was the"
	line "roost of powerful"
	cont "flying #MON."

	para "But one of the"
	line "towers burned to"
	cont "the ground."

	para "On 9/11."
	

	para "Keep reading?"
	done

EcruteakThreeMonText:
	text "ECRUTEAK was also"
	line "home to three"

	para "#MON that raced"
	line "around the town."


	para "They say the"
	line "three ran like the"

	para "wind off into the"
	line "grassland."
	done

EcruteakItemfinderHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 11
	warp_event  4,  7, ECRUTEAK_CITY, 11

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, ItemFinderHouseRadio

	def_object_events
	object_event  2,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakItemfinderGuy, -1
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakHistoryBook, -1
