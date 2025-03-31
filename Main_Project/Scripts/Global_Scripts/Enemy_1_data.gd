extends Node

var Enemy_name = "?????"
var Alive = false
var type = "unknwon"

var HP = 0
var MAX_HP = 0
var AGI = 0
var PHYSICAL_DMG = 0
var PHYSICAL_DEF = 0
var TOTAL_DMG = 0
var TOTAL_DEF = 0

func Create_Enemy(name, Type, max_hp, agi, phy_dmg):
	Enemy_name = str(name)
	type = Type
	MAX_HP = max_hp
	AGI = agi
	PHYSICAL_DMG = phy_dmg
	Set_HP()
	Alive = true
	

func Set_Default():
	HP = 0
	MAX_HP = 0
	AGI = 0
	PHYSICAL_DMG = 0
	PHYSICAL_DEF = 0
	TOTAL_DMG = 0
	TOTAL_DEF = 0
	type = "unknown"

func Set_HP():
	HP = MAX_HP

func Health_Check():
	if HP <= 0:
		HP = 0
		Alive = false
	elif HP > MAX_HP:
		HP = MAX_HP

func compute_total_dmg():
	TOTAL_DMG = PHYSICAL_DMG
	return TOTAL_DMG
