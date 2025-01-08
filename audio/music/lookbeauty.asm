Music_LookBeauty:
	channel_count 4
	channel 1, Music_LookBeauty_Ch1
	channel 2, Music_LookBeauty_Ch2
	channel 3, Music_LookBeauty_Ch3
	channel 4, Music_LookBeauty_Ch4

Music_LookBeauty_Ch1:
	stereo_panning FALSE, TRUE
	vibrato 18, 2, 5
	duty_cycle 3
	tempo 128
	volume 7, 7
	note_type 12, 10, 3
.mainloop:
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	note G_, 2
	note C_, 2
	; 8
	octave 4
	note C_, 4
	rest 2
	note C_, 4
	note C_, 4	
	note C_, 4
	note C_, 4	
	note C_, 4
	; 24
	note C_, 2
	octave 3
	note D#, 2
	note F_, 2
	octave 4
	note C_, 2
	octave 2
	note A#, 2
	octave 4
	note C_, 2
	octave 2
	note G_, 2
	; 38
	octave 4
	note C_, 4
	rest 2
	note C_, 4
	note C_, 4	
	note C_, 4
	note C_, 4	
	note C_, 4
	;
	note C_, 2
	octave 3
	note D#, 2
	note F_, 2
	
	sound_loop 0, .mainloop

Music_LookBeauty_Ch2:
	stereo_panning TRUE, FALSE
	vibrato 16, 2, 3
	duty_cycle 2
	note_type 12, 12, 7
	volume_envelope 10, 3
	
.mainloop:
	rest 8
	;8
	octave 3
	note E_, 4
	rest 2
	note E_, 4
	note E_, 4	
	note F_, 4
	note F_, 4	
	note G_, 4
	;24
	note F_, 4
	rest 10
	;
	octave 3
	note E_, 4
	rest 2
	note E_, 4
	note E_, 4	
	note F_, 4
	note F_, 4	
	note G_, 4
	;
	note F_, 4
	rest 2

	sound_loop 0, .mainloop

Music_LookBeauty_Ch3:
	stereo_panning TRUE, TRUE
	vibrato 8, 1, 2
	note_type 12, 1, 5
	volume_envelope 10, 5
	
.mainloop:
	rest 8
	;8
	octave 3
	note G_, 4
	rest 2
	note G_, 4
	note G_, 4	
	octave 4
	note C#, 4
	note C#, 4	
	note D#, 4
	;
	note D#, 4
	rest 10

	octave 3
	note G_, 4
	rest 2
	note G_, 4
	note G_, 4	
	octave 4
	note C#, 4
	note C#, 4	
	note D#, 4
	;
	note D#, 4
	rest 2

	sound_loop 0, .mainloop

Music_LookBeauty_Ch4:
	toggle_noise 3
	drum_speed 12
	rest 16
	rest 16
.mainloop:
	drum_note 7, 2
	drum_note 8, 2
	drum_note 3, 2
	drum_note 8, 2
	drum_note 8, 2
	drum_note 3, 2
	drum_note 8, 2
	drum_note 8, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 8, 2
	drum_note 3, 2
	drum_note 8, 2
	drum_note 8, 2
	drum_note 3, 2
	drum_note 8, 2
	sound_loop 0, .mainloop
