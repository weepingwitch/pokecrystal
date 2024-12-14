Music_RuinsOfAlphRadio:
	channel_count 3
	channel 1, Music_RuinsOfAlphRadio_Ch1
	channel 2, Music_RuinsOfAlphRadio_Ch2
	channel 3, Music_RuinsOfAlphRadio_Ch3

Music_RuinsOfAlphRadio_Ch1:
	tempo 160
	volume 7, 7
	duty_cycle 0
	pitch_offset 280
	vibrato 0, 15, 0
	stereo_panning TRUE, FALSE
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

Music_RuinsOfAlphRadio_Ch2:
	duty_cycle 1
	vibrato 1, 14, 0
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

Music_RuinsOfAlphRadio_Ch3:
	note_type 6, 2, 6
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