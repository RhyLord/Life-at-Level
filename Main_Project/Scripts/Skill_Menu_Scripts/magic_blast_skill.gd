extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.Magic_Blast_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : [color=gold]" + str(Skill.Magic_Blast_XP) + " / " + str(Skill.Magic_Blast_NXT_XP) + "[/color]"

	desc.text = "Magic Blast is a fundamental magical attack, channeling raw energy into a concentrated force. Mastery of this spell increases its destructive potential."
	Off_combat_desc.text = "Active: Consumes [color=blue]50 MP[/color], and grants [color=cyan]" + str((50 * Skill.Magic_Blast_LVL) + (5 * Player.INT)) + " Magic Blast EXP.[/color]"
	Combat_desc.text = "Active: [color=red]Magic DMG " + str((5 * Skill.Magic_Blast_LVL) + (5 * Player.INT)) + "[/color]."

