extends Node

var LVL = 1
var XP = 0
var XP_NXT = calculate_xp_needed(LVL)

func calculate_xp_needed(level: int) -> int:
	return 100 * (level * level)

func level_up_player():
	while XP >= XP_NXT:
		XP -= XP_NXT
		LVL += 1
		XP_NXT = calculate_xp_needed(LVL)


var HP = 10
var MAX_HP = 10
var MP = 10
var MAX_MP = 10
var EN = 10
var MAX_EN = 10

var STR = 1
var DEX = 1
var AGI = 1
var VIT = 0
var END = 0
var INT = 1

var WIS = 0
var CHA = 1
var LUK = 1
var CTRL = 1

var ACCURACY = 0

#DAMAGE
var PHYSICAL_DMG = 0
var SHARP_DMG = 0
var MAGIC_DMG = 0
var WATER_DMG = 0
var EARTH_DMG = 0
var AIR_DMG = 0
var DARK_DMG = 0
var LIGHT_DMG = 0
var POISON_DMG = 0
var ELECTRIC_DMG = 0
var MIND_DMG = 0
var FIRE_DMG = 0
var DIVINE_DMG = 0
var TOTAL_DMG = 0

#DEFENSE
var PHYSICAL_DEF = 0
var TOTAL_DEF = 0

func Set_Health():
	HP = MAX_HP

func Health_Check():
	if HP < 0:
		HP = 0
	elif HP > MAX_HP:
		HP = MAX_HP

func compute_total_dmg():
	TOTAL_DMG = (
		PHYSICAL_DMG + SHARP_DMG + MAGIC_DMG + WATER_DMG + EARTH_DMG + 
		AIR_DMG + DARK_DMG + LIGHT_DMG + POISON_DMG + ELECTRIC_DMG + 
		MIND_DMG + FIRE_DMG + DIVINE_DMG
	)
	return TOTAL_DMG
	
func reset_all_dmg():
	PHYSICAL_DMG = 0
	SHARP_DMG = 0
	MAGIC_DMG = 0
	WATER_DMG = 0
	EARTH_DMG = 0
	AIR_DMG = 0
	DARK_DMG = 0
	LIGHT_DMG = 0
	POISON_DMG = 0
	ELECTRIC_DMG = 0
	MIND_DMG = 0
	FIRE_DMG = 0
	DIVINE_DMG = 0
	TOTAL_DMG = 0
