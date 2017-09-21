/mob/living/carbon/human/proc/examine_weight()
	var/message = ""
	var/weight_examine = round(weight)
	var/t_He 	= "It" //capitalised for use at the start of each line.
	var/t_he	= "it"
	var/t_his 	= "its"
	var/t_His 	= "Its"
	var/t_is 	= "is"
	var/t_has 	= "has"
	var/t_heavy = "heavy"
	switch(identifying_gender) //Gender is their "real" gender. Identifying_gender is their "chosen" gender.
		if(MALE)
			t_He 	= "He"
			t_he 	= "he"
			t_His 	= "His"
			t_his 	= "his"
			t_heavy = "bulky"
		if(FEMALE)
			t_He 	= "She"
			t_he	= "she"
			t_His 	= "Her"
			t_his 	= "her"
			t_heavy = "curvy"
		if(PLURAL)
			t_He	= "They"
			t_he	= "they"
			t_His 	= "Their"
			t_his 	= "their"
			t_is 	= "are"
			t_has 	= "have"
		if(NEUTER)
			t_He 	= "It"
			t_he	= "it"
			t_His 	= "Its"
			t_his 	= "its"

	switch(weight_examine)
		if(0 to 74)
			message = "<span class='warning'>[t_He] [t_is] terribly lithe and frail!</span>\n"
		if(75 to 99)
			message = "[t_He] [t_has] a very slender frame.\n"
		if(100 to 124)
			message = "[t_He] [t_has] a lightweight, athletic build.\n"
		if(125 to 174)
			message = "[t_He] [t_has] a healthy, average body.\n"
		if(175 to 224)
			message = "[t_He] [t_has] a thick, [t_heavy] physique.\n"
		if(225 to 274)
			message = "[t_He] [t_has] a plush, chubby figure.\n"
		if(275 to 325)
			message = "[t_He] [t_has] an especially plump body with a round potbelly and large hips.\n"
		if(325 to 374)
			message = "[t_He] [t_has] a very fat frame with a bulging potbelly, squishy rolls of pudge, very wide hips, and plump set of jiggling thighs.\n"
		if(375 to 474)
			message = "<span class='warning'>[t_He] [t_is] incredibly obese. [t_His] massive potbelly sags over [t_his] waistline while [t_his] fat ass would probably require two chairs to sit down comfortably!</span>\n"
		else
			message += "<span class='warning'>[t_He] [t_is] so morbidly obese, you wonder how [t_he] can even stand, let alone waddle around the station. [t_He] can't get any fatter without being immobilized.</span>\n"
	return message //Credit to Aronai for helping me actually get this working!

/mob/living/carbon/human/proc/examine_bellies()
	var/message = ""

	for (var/I in src.vore_organs)
		var/datum/belly/B = vore_organs[I]
		message += B.get_examine_msg()

	return message

//For OmniHUD records access for appropriate models
/proc/hasHUD_vr(mob/living/carbon/human/H, hudtype)
	if(!(istype(H.glasses, /obj/item/clothing/glasses/omnihud)))
		return 0 //Not wearing omnis, don't care.

	var/obj/item/clothing/glasses/omnihud/omni = H.glasses

	switch(hudtype)
		if("security")
			return omni.mode == "sec" || omni.mode == "best"
		if("medical")
			return omni.mode == "med" || omni.mode == "best"
		else
			return 0