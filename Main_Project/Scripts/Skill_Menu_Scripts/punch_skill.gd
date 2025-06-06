extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.Punch_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : [color=gold]" + str(Skill.Punch_XP) + " / " + str(Skill.Punch_NXT_XP) + "[/color]"
	
	desc.text = "Punch is a basic yet effective combat technique, relying on raw strength. Mastery of this skill enhances striking power and ensures better performance in physical confrontations."
	Off_combat_desc.text = "Active: Consumes [color=purple]5 EN[/color], and grants [color=cyan]" + str((50 * Skill.Punch_LVL) + (10 * Player.STR)) + " Punch EXP.[/color]"
	Combat_desc.text = "Active: [color=crimson]Physical DMG " + str(1 * Skill.Punch_LVL + 1 * Player.STR) + "[/color]."

