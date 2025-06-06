extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.Kick_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : [color=gold]" + str(Skill.Kick_XP) + " / " + str(Skill.Kick_NXT_XP) + "[/color]"
	
	desc.text = "Kick is a powerful martial technique that utilizes lower body strength to deliver forceful strikes. Mastery of this skill increases damage output and enhances combat efficiency."
	Off_combat_desc.text = "Active: Consumes [color=purple]25 EN[/color], and grants [color=cyan]" + str((50 * Skill.Kick_LVL) + (10 * Player.STR)) + " Kick EXP.[/color]"
	Combat_desc.text = "Active: [color=crimson]Physical DMG " + str((1 * Skill.Kick_LVL) + (2 * Player.STR)) + "[/color]."
