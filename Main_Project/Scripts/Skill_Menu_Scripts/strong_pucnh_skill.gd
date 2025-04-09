extends Control


@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.Strong_Punch_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.Strong_Punch_XP) + " / " + str(Skill.Strong_Punch_NXT_XP)
	desc.text = "A brute-force skill that focuses on devastating physical blows. Perfect for delivering a powerful punch in close combat. Damage scales with STR"

	var en_cost = 100
	var dmg = (5 * Skill.Strong_Punch_LVL) + (5 * Player.STR)
	var xp_gain = (75 * Skill.Strong_Punch_LVL) + (15 * Player.STR)

	Off_combat_desc.text = "Active: Consumes [" + str(en_cost) + "] EN. Deals [" + str(dmg) + "] Physical DMG."
	Combat_desc.text = "Passive: Gain EXP = [" + str(xp_gain) + "] per use. Current STR = " + str(Player.STR)
