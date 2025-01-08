Music_LookHiker:
	channel_count 4
	channel 1, Music_LookHiker_Ch1
	channel 2, Music_LookHiker_Ch2
	channel 3, Music_LookHiker_Ch3
	channel 4, Music_LookHiker_Ch4

Music_LookHiker_Ch1:
	tempo 132
	volume 7, 7
	pitch_offset 1
	vibrato 18, 2, 4
	duty_cycle 2
	stereo_panning FALSE, TRUE
	note_type 12, 6, 8
	rest 16
	rest 16
.mainloop:
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 4
	note E_, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note E_, 2
	octave 3
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	octave 4
	note E_, 2
	octave 3
	note A_, 2
	note B_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	sound_loop 0, .mainloop

Music_LookHiker_Ch2:
	duty_cycle 0
	note_type 12, 10, 1
	stereo_panning TRUE, FALSE
	volume_envelope 10, 1
	
.mainloop:
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 4
	note E_, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note E_, 2
	octave 3
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	octave 4
	note E_, 2
	octave 3
	note A_, 2
	note B_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	sound_loop 0, .mainloop

Music_LookHiker_Ch3:
	vibrato 18, 2, 4
	
	note_type 12, 1, 4
	
	rest 16
	rest 16
	rest 16
	rest 16
.mainloop:
	octave 2
	note A_, 2
	rest 2
	octave 3
	note A_, 2
	rest 2
	octave 2
	note A_, 2
	rest 2
	octave 3
	note A_, 2
	rest 2
	octave 2
	note A_, 2
	rest 2
	octave 3
	note A_, 2
	rest 2
	note E_, 2
	rest 2
	note E_, 2
	rest 2
	sound_loop 0, .mainloop


Music_LookHiker_Ch4:
	toggle_noise 3
	drum_speed 12
	rest 16
	rest 16
	rest 16
	rest 16
.mainloop:
	drum_note 2, 2
	drum_note 11, 2
	drum_note 6, 2
	drum_note 11, 2
	drum_note 2, 2
	drum_note 11, 2
	drum_note 6, 2
	drum_note 11, 2
	drum_note 2, 2
	drum_note 11, 2
	drum_note 6, 2
	drum_note 11, 2
	drum_note 2, 1
	drum_note 11, 1
	drum_note 6, 1
	drum_note 11, 1
	drum_note 2, 1
	drum_note 11, 1
	drum_note 6, 1
	drum_note 11, 1
	sound_loop 0, .mainloop
