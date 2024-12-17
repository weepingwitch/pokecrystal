MACRO mon_prob
; percent, index
	db \1, \2 * 2
ENDM

GrassMonProbTable:
	table_width 2, GrassMonProbTable
	mon_prob 27,  0 ; 27% chance
	mon_prob 50,  1 ; 23% chance
	mon_prob 67,  2 ; 17% chance
	mon_prob 80,  3 ; 13% chance
	mon_prob 90,  4 ;  10% chance
	mon_prob 97,  5 ;  7% chance
	mon_prob 100, 6 ;  3% chance
	assert_table_length NUM_GRASSMON

WaterMonProbTable:
	table_width 2, WaterMonProbTable
	mon_prob 60,  0 ; 60% chance
	mon_prob 90,  1 ; 30% chance
	mon_prob 100, 2 ; 10% chance
	assert_table_length NUM_WATERMON
