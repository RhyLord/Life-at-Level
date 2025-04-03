extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.Minor_Regen_LVL) 
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.Minor_Regen_XP) + " / " + str(Skill.Minor_Regen_NXT_XP)
	desc.text = "Minor Regeneration is a basic healing technique, utilizing internal vitality to restore health. With higher proficiency, the skill becomes more effective, promoting faster recovery during combat."

	var en_cost = 50
	var restore_amount = (10 * Skill.Minor_Regen_LVL) + Player.VIT
	var xp_gain = ceil((25 * Player.VIT) + (Skill.Minor_Regen_LVL * 25))

	Off_combat_desc.text = "Consumes [" + str(en_cost) + "] EN, and restores [" + str(restore_amount) + "] HP."
	Combat_desc.text = "Grants [" + str(xp_gain) + "] Minor Regen EXP."

