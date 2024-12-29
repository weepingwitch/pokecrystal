    object_const_def
    const UNDERPATHJOHTO_BOULDER
   

UnderPathJohto_MapScripts:
	def_scene_scripts

	def_callbacks

UnderPathJohtoBoulder:
    jumpstd StrengthBoulderScript
    

UnderPathJohto_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 15, ROUTE_30, 3 ;1
	warp_event  7, 7, UNDER_PATH_1F, 1 ;2
    
    
	def_coord_events

	def_bg_events
    

	def_object_events
    object_event 13, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, UnderPathJohtoBoulder, -1
