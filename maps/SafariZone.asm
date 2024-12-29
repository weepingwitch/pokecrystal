    object_const_def
    const SAFARIZONE_POKE_BALL1
    const SAFARIZONE_POKE_BALL3

SafariZone_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneSign:
    jumptext SafariZoneSignText

SafariZoneSignText:
    text "Be warned - paths"
    line "are not cleared."
    done

SafariZoneMball:
    itemball LEAF_STONE

SafariZoneMball2:
    itemball SUN_STONE

SafariZone_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  26, 47, FUCHSIA_CITY, 7 ;1
	warp_event  27, 47, FUCHSIA_CITY, 7 ;2
    warp_event  53, 6, SAFARI_ZONE_2F, 1 ;3
    warp_event  53, 7, SAFARI_ZONE_2F, 1 ;4
    
	def_coord_events

	def_bg_events
    bg_event 29,  41, BGEVENT_READ, SafariZoneSign

	def_object_events
    object_event  13, 51, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneMball, EVENT_SAFARIZONE_BALL
	object_event  54, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariZoneMball2, EVENT_SAFARI_BALL3
	