extends Node

var Enemy_name = "?????"
var Alive = false
var type = "unknwon"
var attack_effect

var HP = 0
var MAX_HP = 0
var AGI = 0
var PHYSICAL_DMG = 0
var ACID_DMG = 0
var POISON_DMG = 0
var FIRE_DMG = 0
var WATER_DMG = 0
var MAGIC_DMG = 0

var PHYSICAL_DEF = 0
var TOTAL_DMG = 0
var TOTAL_DEF = 0

#For GreenSlime
func Create_GreenSlime(lvl):
	Enemy_name = "Level " + str(lvl) + " Green-Slime"
	type = "green_slime"
	MAX_HP = lvl * 10
	PHYSICAL_DMG = lvl * 1
	attack_effect = "greenslime"
	Set_HP()
	Alive = true
	
func Create_AcidSlime(lvl):
	Enemy_name = "Level " + str(lvl) + " Acid-Slime"
	type = "acid_slime"
	MAX_HP = 10 * lvl
	ACID_DMG = 5 * lvl
	attack_effect = "acidslime"
	Set_HP()
	Alive = true
	
func Create_PoisonSlime(lvl):
	Enemy_name = "Level " + str(lvl) + " Poison-Slime"
	type = "poison_slime"
	MAX_HP = 10 * lvl
	POISON_DMG = lvl * randi_range(3, 8)
	attack_effect = "poisonslime"
	Set_HP()
	Alive = true

func Create_LavaSlime(lvl):
	Enemy_name = "Level " + str(lvl) + " Lava-Slime"
	type = "lava_slime"
	MAX_HP = (lvl * 5) + 10
	FIRE_DMG = lvl * 10
	attack_effect = "lavaslime"
	Set_HP()
	Alive = true
	
func Create_AquaSlime(lvl):
	Enemy_name = "Level " + str(lvl) + " Aqua-Slime"
	type = "aqua_slime"
	MAX_HP = lvl * 20
	WATER_DMG = lvl * 1
	attack_effect = "aquaslime"
	Set_HP()
	Alive = true
	
func Create_MagicSlime(lvl):
	Enemy_name = "Level " + str(lvl) + " Magic-Slime"
	type = "magic_slime"
	MAX_HP = lvl * 10
	MAGIC_DMG = lvl * 25
	attack_effect = "magicslime"
	Set_HP()
	Alive = true

func Create_MetallicSlime(lvl):
	Enemy_name = "Level " + str(lvl) + " Metallic-Slime"
	type = "metallic_slime"
	MAX_HP = lvl * 25
	PHYSICAL_DMG = lvl * 1
	attack_effect = "metallicslime"
	PHYSICAL_DEF = 5 * lvl
	Set_HP()
	Alive = true
	
func Create_Skull(lvl):
	Enemy_name = "Level " + str(lvl) + " Skull"
	type = "skull"
	MAX_HP = (10 * lvl) + 10
	PHYSICAL_DMG = ceil(2.5 * lvl) + 5
	attack_effect = "hit"
	Set_HP()
	Alive = true

func Set_Default():
	HP = 0
	MAX_HP = 0
	AGI = 0
	PHYSICAL_DMG = 0
	ACID_DMG = 0
	POISON_DMG = 0
	FIRE_DMG = 0
	WATER_DMG = 0
	MAGIC_DMG = 0
	TOTAL_DMG = 0
	
	PHYSICAL_DEF = 0
	TOTAL_DEF = 0
	type = "unknown"
	Alive = false

func Set_HP():
	HP = MAX_HP

func Health_Check():
	if HP <= 0:
		HP = 0
		Alive = false
	elif HP > MAX_HP:
		HP = MAX_HP

func compute_total_dmg():
	var PHYSICAL_DMG_new = max(PHYSICAL_DMG - Player.PHYSICAL_DEF, 0)
	var WATER_DMG_new = max(WATER_DMG - Player.WATER_DEF, 0)
	TOTAL_DMG = PHYSICAL_DMG_new + ACID_DMG + POISON_DMG + FIRE_DMG + WATER_DMG_new + MAGIC_DMG
	if Skill.Physical_Endurance_Unlocked == true:
		Skill.Active_Physical_Endurance_XP(PHYSICAL_DMG)
	return TOTAL_DMG
