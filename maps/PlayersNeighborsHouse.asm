	object_const_def
	const PLAYERSNEIGHBORSHOUSE_COOLTRAINER_F
	const PLAYERSNEIGHBORSHOUSE_POKEFAN_F

PlayersNeighborsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

PlayersNeighborsDaughterScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PICNICKER_SARA
	iftrue .regular
	readvar VAR_BADGES
	if_equal 16, .doBattle
.regular:
	writetext PlayersNeighborsDaughterText
	waitbutton
	closetext
	end
.doBattle
	writetext SaraSeenText
	waitbutton
	closetext
	winlosstext SaraBeatenText, 0
	loadtrainer PICNICKER, SARA
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PICNICKER_SARA
	end

PlayersNeighborScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_POKEFANF_MILF
	iftrue .regular
	readvar VAR_BADGES
	if_equal 16, .doBattle
.regular:
	writetext PlayersNeighborText
	waitbutton
	closetext
	end
.doBattle:
	writetext MILFSeenText
	waitbutton
	closetext
	winlosstext MILFBeatenText, 0
	loadtrainer POKEFANF, MILF
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEFANF_MILF
	end


	

PlayersNeighborsHouseBookshelfScript:
	jumpstd MagazineBookshelfScript

PlayersNeighborsHouseRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext PlayerNeighborRadioText1
	pause 20
	writetext PlayerNeighborRadioText2
	pause 20
	writetext PlayerNeighborRadioText3
	pause 20
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext PlayerNeighborRadioText4
	pause 20
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end
.NormalRadio:
	jumpstd Radio1Script
.AbbreviatedRadio:
	opentext
	writetext PlayerNeighborRadioText4
	pause 20
	closetext
	end

PlayersNeighborsDaughterText:
	text "I'm willow's"
	line "friend."

	para "I don't know"
	line "anything about"
	cont "#MON."

	done

PlayersNeighborText:
	text "My daughter is"
	line "not interested in"
	cont "#MON."


	para "What a shame!"

	done

SaraSeenText:
	text "willow told me to"
	line "pick six #MON"

	para "Here we go!"
	done

SaraBeatenText:
	text "Bummer!"
	done

MILFSeenText:
	text "Ok, I'll battle"
	line "you!"
	done

MILFBeatenText:
	text "Ooh, you're so"
	line "strong..."
	done

PlayerNeighborRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

PlayerNeighborRadioText2:
	text "#MON CHANNEL!"
	done

PlayerNeighborRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

PlayerNeighborRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done

PlayersNeighborsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 3
	warp_event  3,  7, NEW_BARK_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  1,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  7,  1, BGEVENT_READ, PlayersNeighborsHouseRadioScript

	def_object_events
	object_event  2,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PlayersNeighborsDaughterScript, -1
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PlayersNeighborScript, EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
