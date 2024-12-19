Music_TitleScreen:
	channel_count 4
	channel 1, Music_TitleScreen_Ch1
	channel 2, Music_TitleScreen_Ch2
	channel 3, Music_TitleScreen_Ch3
	channel 4, Music_TitleScreen_Ch4

Music_TitleScreen_Ch1:
	tempo 186
	volume 9, 9
	duty_cycle 3
	pitch_offset 0
	vibrato 16, 1, 2
	stereo_panning TRUE, FALSE
	note_type 12, 10, 7
	volume_envelope 10, 0
.loop1
	octave 4
	note D_, 1
	note A_, 1
	note G_, 1
	note F#, 1 ;4
	rest 1
	note F#, 1 ;6
	note G_, 4 ;10
	rest 2     ;12
	note D_, 1
	rest 1
	note G_, 1
	rest 1      ;16

	note G_, 1
	rest 1
	note G_, 1
	note G_, 1   ;20
	note G_, 1
	rest 1 ;22
	note F#, 6 ;28
	rest 4  ;32


	note D_, 1
	note A_, 1 ;34
	note G_, 1
	rest 1   ;36
	note F#, 1
	rest 1  
	note G_, 2  ;40
	rest 2 ;42
	note E_, 4 ;46
	rest 2 ;48

	note D_, 1 
	note A_, 1 ;50
	note G_, 1 
	rest 1 ;52
	note F#, 2 ;54
	note G_, 6 ;60
	rest 4
	sound_loop 0, .loop1

Music_TitleScreen_Ch2:
	duty_cycle 3
	stereo_panning FALSE, TRUE
	vibrato 20, 1, 2
	note_type 12, 12, 7
	volume_envelope 10, 4
.loop1
	octave 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note B_, 2
	note G_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	octave 3
	note D_, 2
	octave 2
	note B_, 2
	octave 3
	note F#, 2
	note D#, 2
	octave 2
	note B_, 2
	note B_, 2
	octave 3
	note F#, 2
	note D#, 2
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	note G_, 2
	note E_, 2
	note C_, 2
	note C_, 2
	note E_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note D#, 2
	note C_, 2
	note C_, 2
	note G_, 2
	note D#, 2
	note C_, 2
	sound_loop 0, .loop1

Music_TitleScreen_Ch3:
	stereo_panning TRUE, TRUE
	vibrato 16, 1, 4
	pitch_offset 1
	note_type 12, 1, 6
.loop1
	octave 2
	note G_, 6
	rest 2
	note G_, 1
	rest 1
	note G_, 1
	rest 3
	note G_, 1
	rest 1
	note B_, 6
	rest 2
	note B_, 1
	rest 1
	note B_, 1
	rest 3
	note B_, 1
	rest 1
	octave 3
	note C_, 6
	rest 2
	note C_, 1
	rest 1
	note C_, 1
	rest 3
	note C_, 1
	rest 1
	note C_, 6
	rest 2
	note C_, 1
	rest 1
	note C_, 1
	rest 3
	note C_, 1
	rest 1
	sound_loop 0, .loop1

Music_TitleScreen_Ch4:
	toggle_noise 4
	volume 10, 10
	stereo_panning TRUE, TRUE
	drum_speed 12
	
.loop1
	drum_note 2, 4
	drum_note 10, 2
	rest 2
	drum_note 5, 4
	drum_note 10, 2
	drum_note 2, 1
	drum_note 2, 1
	sound_loop 0, .loop1
	sound_ret
