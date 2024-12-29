    object_const_def
    const POKEMANSION_POKE_BALL1
	const POKEMANSION_MEDIUM_1
	const POKEMANSION_FIREBREATHER_1
	const POKEMANSION_GRUNT_1

PokemonMansion_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerFireNed:
	trainer FIREBREATHER, NED, EVENT_BEAT_FIREBREATHER_NED, NedSeenText, NedBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext NedAfterBattleText
	waitbutton
	closetext
	end

NedSeenText:
	text "You interrupted"
	line "my practice!"

	done

NedBeatenText:
	text "I wanted to"
	line "practice alone."
	done

NedAfterBattleText:
	text "Leave me alone."
	

	done

TrainerMediumBethany:
	trainer MEDIUM, BETHANY, EVENT_BEAT_MEDIUM_BETHANY, BethanySeenText, BethanyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BethanyAfterBattleText
	waitbutton
	closetext
	end

BethanySeenText:
	text "You interrupted"
	line "my meditation!"

	done

BethanyBeatenText:
	text "How could you do"
	line "this to me?"
	done

BethanyAfterBattleText:
	text "I was trying to"
	line "sense a rare"
	cont "item..."

	done

TrainerMansionGrunt:
	trainer GRUNTM, GRUNTM_30, EVENT_BEAT_ROCKET_GRUNTM_30, GruntSeenText, GruntBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntAfterBattleText
	waitbutton
	closetext
	end

GruntSeenText:
	text "(grunt)"
	done

GruntBeatenText:
	text "(grunt)"
	done

GruntAfterBattleText:
	text "(grunt)"
	done


PokemansionMball:
    itemball MASTER_BALL

PokemonMansion_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6, 49, CINNABAR_ISLAND, 2 ;1
	warp_event  7, 49, CINNABAR_ISLAND, 2
    warp_event  35, 28, POKEMON_MANSION, 4 ;3
    warp_event  35, 2, POKEMON_MANSION, 3 ;4
    warp_event 17, 10, POKEMON_MANSION, 6 ;5
    warp_event 1, 0, POKEMON_MANSION, 5 ;6

	def_coord_events

	def_bg_events

	def_object_events
    object_event  0, 1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemansionMball, EVENT_POKEMANSION_BALL
	object_event 24,  39, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerMediumBethany, -1
	object_event 10,  30, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFireNed, -1
	object_event 14,  48, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerMansionGrunt, -1
	