extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.Magic_Seeker_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.Magic_Seeker_XP) + " / " + str(Skill.Magic_Seeker_NXT_XP)

	desc.text = "Magic Seeker is a spell that targets all enemies with precise arcane projectiles. It symbolizes mastery over magical control and precision."

	Off_combat_desc.text = "Active: Consumes [500] MP, and grants [" + str((100 * Skill.Magic_Seeker_LVL) + (20 * Player.INT)) + "] Magic Seeker EXP."
	
	Combat_desc.text = "Unlock Requirement: Requires minimum INT 100 to unlock.\nActive: Attacks all enemies with Magic DMG [" + str((10 * Skill.Magic_Seeker_LVL) + (1 * Player.INT)) + "]."

	
