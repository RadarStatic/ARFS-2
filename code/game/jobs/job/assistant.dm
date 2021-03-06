/datum/job/assistant
	title = "Assistant"
	flag = ASSISTANT
	department = "Civilian"
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "absolutely everyone"
	selection_color = "#515151"
	economic_modifier = 1
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	alt_titles = list("Technical Assistant","Medical Intern","Research Assistant","Passenger", "Entertainer", "Lifeguard", "Waiter", 
	"Waitress", "Secretary", "Delivery Staff", "Holo-Gladiator", "Musician", "Masseuse", "Massager", "Test Subject")

/datum/job/assistant/equip(var/mob/living/carbon/human/H, var/alt_title)
	if(!H)	return 0
	switch(H.backbag)
		if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack(H), slot_back)
		if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel/norm(H), slot_back)
		if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		if(5) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/messenger(H), slot_back)
	if(has_alt_title(H, alt_title,"Visitor")) //I doubt someone visiting the station would want to wear an ugly grey uniform
		H.equip_to_slot_or_del(new /obj/item/clothing/under/assistantformal(H), slot_w_uniform)
	else if(has_alt_title(H, alt_title,"Resident"))
		H.equip_to_slot_or_del(new /obj/item/clothing/under/color/white(H), slot_w_uniform)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/under/color/grey(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/black(H), slot_shoes)
	return 1

/datum/job/assistant/get_access()
	if(config.assistant_maint)
		return list(access_maint_tunnels)
	else
		return list()
