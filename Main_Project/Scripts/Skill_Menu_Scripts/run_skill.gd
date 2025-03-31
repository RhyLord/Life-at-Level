extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.Run_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.Run_XP) + " / " + str(Skill.Run_NXT_XP)
	desc.text = "Running is a fundamental skill that enhances vitality, agility, and overall stamina. Essential for survival and athletic performance, it strengthens cardiovascular health and improves energy efficiency over time."
	Off_combat_desc.text = "Active: Consumes [" + str(ceil(0.25 * Player.MAX_EN)) + "] EN, advances time, and grants [" + str(50 + ceil(0.25 * Player.MAX_EN)) + "] Run EXP."
	Combat_desc.text = "Passive: Grants [+10] MAX EN per Level. Current MAX EN = " + str(Player.MAX_EN)


