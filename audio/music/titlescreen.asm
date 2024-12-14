Music_TitleScreen:
	channel_count 4
	channel 1, Music_TitleScreen_Ch1
	channel 2, Music_TitleScreen_Ch2
	channel 3, Music_TitleScreen_Ch3
	channel 4, Music_TitleScreen_Ch4

Music_TitleScreen_Ch1:
	tempo 134
	volume 7, 7
	duty_cycle 3
	pitch_offset 0
	vibrato 16, 1, 2
	stereo_panning TRUE, FALSE
	note_type 12, 10, 7
	volume_envelope 10, 0
.loop1
	octave 3
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note G_, 8
	octave 3
	note F#, 2
	note F#, 2
	note E_, 2
	note D#, 1
	note E_, 1
	note D#, 8
	note G_, 2
	note G_, 2
	rest 2
	note G_, 2
	note E_, 8
	note G_, 2
	note G_, 2
	rest 2
	note G_, 2
	note D#, 4
	octave 4
	note C_, 4
	sound_loop 0, .loop1

Music_TitleScreen_Ch2:
	duty_cycle 3
	vibrato 20, 1, 2
	note_type 12, 12, 7
	volume_envelope 10, 4
.loop1
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	note G_, 2
	octave 3
	note G_, 2
	note B_, 2
	note G_, 2
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note F#, 2
	note D#, 2
	octave 3
	note B_, 2
	note B_, 2
	octave 4
	note F#, 2
	note D#, 2
	octave 3
	note B_, 2
	octave 4
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
	stereo_panning FALSE, TRUE
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
	toggle_noise 5
	stereo_panning TRUE, FALSE
	drum_speed 12
	
.loop1
	drum_note 1, 2
	drum_note 8, 4
	drum_note 8, 2
	drum_note 1, 4
	drum_note 8, 2
	drum_note 8, 2
	sound_loop 0, .loop1
	sound_ret
