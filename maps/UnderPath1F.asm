    object_const_def
    const UNDERPATH1_BOULDER
    const UNDERPATH2_BOULDER
    const UNDERPATH_POKE_BALL1
	const UNDERPATH_POKE_BALL2
   

UnderPath1F_MapScripts:
	def_scene_scripts

	def_callbacks

UnderPathB1:
    itemball NUGGET

UnderPathB2:
    itemball MASTER_BALL

UnderPath1Boulder:
    jumpstd StrengthBoulderScript


UnderPath1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 27, UNDER_PATH_JOHTO, 2 ;1
	warp_event  55, 23, PEWTER_CITY, 8 ;2
    warp_event 13, 21, UNDER_PATH_2F, 1 ;3
    warp_event 25, 7, UNDER_PATH_2F, 2 ;4
    
    
	def_coord_events

	def_bg_events
    

	def_object_events
    object_event 24, 4, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, UnderPath1Boulder, -1
    object_event 3,28, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, UnderPath1Boulder, -1
    object_event  7, 5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnderPathB1, EVENT_UNDER_BALL_1
	object_event  34, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnderPathB2, EVENT_UNDER_BALL_2
	
  
  