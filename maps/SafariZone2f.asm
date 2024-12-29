    object_const_def
    const SAFARIZONE_POKE_BALL2

SafariZone2F_MapScripts:
	def_scene_scripts

	def_callbacks


SafariZone2Mball:
    itemball MASTER_BALL

SafariZone2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 31, SAFARI_ZONE, 3 ;1
	
    
	def_coord_events

	def_bg_events
   
	def_object_events
    object_event  17, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZone2Mball, EVENT_SAFARIZONE2_BALL
	