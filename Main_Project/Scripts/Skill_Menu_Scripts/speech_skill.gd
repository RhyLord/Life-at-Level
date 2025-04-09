extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.Speech_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.Speech_XP) + " / " + str(Skill.Speech_NXT_XP)
	desc.text = "Speech skill enhances charisma, enabling you to influence others, negotiate better outcomes, and succeed in social encounters. A must-have for smooth talkers and leaders. Higher Charisma leads to more XP gain."

	var en_cost = ceil(0.05 * Player.MAX_EN)
	var exp_gain = 50 + (25 * Player.CHA)
	var cha_bonus = 1 * Skill.Speech_LVL

	Off_combat_desc.text = "Active: Consumes [" + str(en_cost) + "] EN, and grants [" + str(exp_gain) + "] Speech EXP."
	Combat_desc.text = "Passive: Grants [" + str(cha_bonus) + "] CHA. Current CHA = " + str(Player.CHA)
