extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.Punch_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.Punch_XP) + " / " + str(Skill.Punch_NXT_XP)
	
	desc.text = "Punch is a basic yet effective combat technique, relying on raw strength. Mastery of this skill enhances striking power and ensures better performance in physical confrontations."
	Off_combat_desc.text = "Active: Consumes [5] EN, and grants [" + str(50 + (10 * Player.STR)) + "] Punch EXP."
	Combat_desc.text = "Active: Accuracy [" + str(100 + (1 * Player.DEX)) + "], Physical DMG [" + str(1 * Skill.Punch_LVL + 1 * Player.STR) + "]."

