    object_const_def
    const POKEMANSION_POKE_BALL1

PokemonMansion_MapScripts:
	def_scene_scripts

	def_callbacks


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
	