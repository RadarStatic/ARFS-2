/*
////////////////////////////
/  =--------------------=  /
/  ==  Body Markings   ==  /
/  =--------------------=  /
////////////////////////////
*/
/datum/sprite_accessory/marking
	icon = 'icons/mob/human_races/markings_arfs.dmi'
	do_colouration = 1 //Almost all of them have it, COLOR_ADD

	m_dragon_belly
		name = "Male Dragon Belly"
		icon_state = "male_dragon_belly"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_GROIN)
		species_allowed = list("Unathi")

	f_dragon_belly
		name = "Female Dragon Belly"
		icon_state = "female_dragon_belly"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_GROIN)
		species_allowed = list("Unathi")

	shark_tail_stripes
		name = "Tail Stripes (Akula)"
		icon_state = "sharktail_stripes"
		species_allowed = list("Akula")
		ignore_bodyparts = 1

	bird_oldbeak
		name = "Corvid Beak (Nevrean)"
		icon_state = "nevrean_oldbeak"
		body_parts = list(BP_HEAD)
		species_allowed = list("Nevrean")
