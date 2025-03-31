extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.Rest_LVL) 
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.Rest_XP) + " / " + str(Skill.Rest_NXT_XP)
	desc.text = "Rest is essential for recovery, allowing the body and mind to regain strength. Since ancient times, sleep has been a fundamental need, linked to healing and energy restoration. A well-rested state enhances focus, physical power, and overall well-being."
	
	var off_combat_restore = ceil((100 * Skill.Rest_LVL) + (0.25 * Player.MAX_HP) + (0.25 * Player.MAX_MP) + (0.25 * Player.MAX_EN))
	var off_combat_xp = ceil(0.5 * (Player.MAX_HP + Player.MAX_MP + Player.MAX_EN))
	
	var combat_restore = (5 * Skill.Rest_LVL) + Player.END
	var combat_xp = ceil(0.5 * Player.MAX_EN)
	
	Off_combat_desc.text = "Off-Combat: Advances time, restores [" + str(off_combat_restore) + "] HP, MP, and EN. Grants [" + str(off_combat_xp) + "] Rest EXP."
	Combat_desc.text = "Combat: Restores [" + str(combat_restore) + "] EN. Grants [" + str(combat_xp) + "] Rest EXP."


