extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.Study_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.Study_XP) + " / " + str(Skill.Study_NXT_XP)
	desc.text = "Studying enhances intelligence, improving problem-solving and critical thinking. It is essential for mastering knowledge-based tasks and unlocking greater understanding over time."
	
	var en_cost = ceil(0.05 * Player.MAX_EN)
	Off_combat_desc.text = "Active: Consumes [" + str(en_cost) + "] EN, and grants [" + str(10 * Player.INT) + "] Study EXP."
	Combat_desc.text = "Passive: Grants [" + str(1 * Skill.Study_LVL) + "] INT. Current INT = " + str(Player.INT)

