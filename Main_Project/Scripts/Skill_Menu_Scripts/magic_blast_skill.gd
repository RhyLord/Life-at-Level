extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.Magic_Blast_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.Magic_Blast_XP) + " / " + str(Skill.Magic_Blast_NXT_XP)

	desc.text = "Magic Blast is a fundamental magical attack, channeling raw energy into a concentrated force. Mastery of this spell increases its destructive potential."
	Off_combat_desc.text = "Active: Consumes [50] MP, and grants [" + str((50 * Skill.Magic_Blast_LVL) + (5 * Player.INT)) + "] Magic Blast EXP."
	Combat_desc.text = "Unlock Requirement: Requires minimum INT 10 to unlock. \nActive: Magic DMG [" + str((5 * Skill.Magic_Blast_LVL) + (5 * Player.INT)) + "]."

