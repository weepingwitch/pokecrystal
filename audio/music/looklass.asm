Music_LookLass:
	channel_count 4
	channel 1, Music_LookLass_Ch1
	channel 2, Music_LookLass_Ch2
	channel 3, Music_LookLass_Ch3
	channel 4, Music_LookLass_Ch4

Music_LookLass_Ch1:
	tempo 120
	volume 7, 7
	pitch_offset 1
	duty_cycle 2
	note_type 12, 10, 7
	volume_envelope 10,2
.mainloop:
	octave 4
	note A_, 4
	note C_, 4
	note F_, 4
	note C_, 4
	note A_, 4
	note C_, 4
	note F_, 4
	note C_, 4
	note A_, 4
	note C_, 4
	note F_, 4
	note C_, 4
	octave 3
	note A#, 4
	octave 4
	note C#, 4
	note F_, 4
	note G_, 4

	sound_loop 0, .mainloop

Music_LookLass_Ch2:
	stereo_panning TRUE, FALSE
	duty_cycle 0
	note_type 12, 8, 3
	rest 16
	rest 16
	rest 16
	rest 16
.mainloop:
	octave 2
	note F_, 2
	rest 2
	note F_, 2
	rest 2
	note F_, 2
	rest 2
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 2
	rest 2
	note F_, 2
	rest 2
	note F_, 2
	rest 2
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 2
	rest 2
	note F_, 2
	rest 2
	note F_, 2
	rest 2
	note F_, 1
	rest 1
	note F_, 2
	note C#, 1
	rest 1
	note C#, 2
	rest 2
	note C#, 2
	rest 2
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note C#, 2


	sound_loop 0, .mainloop

Music_LookLass_Ch3:
	note_type 12, 1, 0
	
.mainloop:
	
	octave 4
	note A_, 4
	rest 4
	note F_, 2
	rest 2
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note A_, 4
	rest 4
	note F_, 2
	rest 2
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note A_, 4
	rest 4
	note F_, 2
	rest 2
	note F_, 1
	rest 1
	note F_, 1
	rest 1

	note A#, 1
	rest 1
	note A#, 2
	rest 2
	note A_, 2
	rest 2
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	sound_loop 0, .mainloop

Music_LookLass_Ch4:
	toggle_noise 4
	drum_speed 12
	rest 16
	rest 16
	rest 16
	rest 16
.mainloop:
	drum_note 2, 4
	rest 4
	drum_note 8, 4
	rest 2
	drum_note 8, 2
	drum_note 2, 2
	rest 2
	drum_note 2, 2
	rest 2
	drum_note 8, 4,
	rest 4
	
	sound_loop 0, .mainloop
