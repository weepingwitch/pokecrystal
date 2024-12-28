    object_const_def
    
    const ROUTE2_POKE_BALL1
    const ROUTE2_POKE_BALL2
	const ROUTE2_FRUIT_TREE

ViridianForest_MapScripts:
	def_scene_scripts

	def_callbacks


Route2DireHit:
    itemball DIRE_HIT

Route2MaxPotion:
    itemball MAX_POTION


Route2FruitTree:
    fruittree FRUITTREE_ROUTE_2

ViridianForest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 5, ROUTE_2, 6 ;1 north
	warp_event  21, 32, ROUTE_2, 8
    warp_event  21,33, ROUTE_2, 8 ;3 south
    

	def_coord_events

	def_bg_events
    bg_event  23, 20, BGEVENT_ITEM, Route2HiddenMaxEther
	bg_event  10, 2, BGEVENT_ITEM, Route2HiddenFullHeal
	bg_event  7, 17, BGEVENT_ITEM, Route2HiddenFullRestore
	bg_event 37, 29, BGEVENT_ITEM, Route2HiddenRevive


	def_object_events
    object_event  3, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2DireHit, EVENT_ROUTE_2_DIRE_HIT
	object_event  32, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2MaxPotion, EVENT_ROUTE_2_MAX_POTION
    object_event 37, 2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route2FruitTree, -1
