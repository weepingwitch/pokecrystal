	object_const_def
	const ELMSHOUSE_ELMS_WIFE
	const ELMSHOUSE_ELMS_SON
	const ELMSHOUSE_ELM

ElmsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ElmBattle:
	readvar VAR_BADGES
	if_greater_than 7, .doBattle
	faceplayer
	opentext
	writetext ElmNotYetText
	waitbutton
	closetext
	end
.doBattle:
	faceplayer
	opentext
	writetext ElmBattleText
	waitbutton
	closetext
	winlosstext ElmBeatenText, 0
	loadtrainer POKEMON_PROF, ELM
	startbattle
	reloadmapafterbattle
	opentext
	writetext ElmBackToWorkText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement ELMSHOUSE_ELM, ElmToWorkMovement
	disappear ELMSHOUSE_ELM

ElmsWife:
	jumptextfaceplayer ElmsWifeText

ElmsSon:
	jumptextfaceplayer ElmsSonText

ElmsHousePC:
	jumptext ElmsHousePCText

ElmsHouseBookshelf:
	jumpstd DifficultBookshelfScript

ElmToWorkMovement:
	teleport_from
	step_end

ElmBackToWorkText:
	text "Time to get"
	line "back to the"
	cont "lab!"
	done

ElmNotYetText:
	text "Come back one"
	line "evening, when"
	cont "you have all"

	para "8 JOHTO badges!"
	done

ElmBattleText:
	text "Ok, <PLAY_G>,"
	line "let's battle!"

	para "Show me what"
	line "you've learned!"
	done

ElmBeatenText:
	text "Wow, good job!"

	para "More people in"
	line "NEW BARK TOWN"
	cont "will battle you"

	para "after you have"
	line "16 badges!"

	done

ElmsWifeText:
	text "Hi, <PLAY_G>! My"
	line "wife's always"

	para "so busy--I hope"
	line "she's OK."

	para "When she's caught"
	line "up in her #MON"

	para "research, she even"
	line "forgets to eat."
	done

ElmsSonText:
	text "When I grow up,"
	line "I'm going to help"
	cont "my mom!"

	para "I'm going to be a"
	line "great #MON"
	cont "professor!"
	done

ElmsHouseLabFoodText: ; unreferenced
	text "There's some food"
	line "here. It must be"
	cont "for the LAB."
	done

ElmsHousePokemonFoodText: ; unreferenced
	text "There's some food"
	line "here. This must be"
	cont "for #MON."
	done

ElmsHousePCText:
	text "#MON. How do they"
	line "reproduce? "

	
	para "…"

	para "It's a part of"
	line "PROF.ELM's"
	cont "search history."
	done

ElmsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 4
	warp_event  3,  7, NEW_BARK_TOWN, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, ElmsHousePC
	bg_event  6,  1, BGEVENT_READ, ElmsHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsHouseBookshelf

	def_object_events
	object_event  1,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ElmsWife, -1
	object_event  5,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElmsSon, -1
	object_event  2,  1, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, ElmBattle, -1