extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.Squat_LVL)
	Nxt_Level_txt.text ="Progress to Next Level : " + str(Skill.Squat_XP) + " / " + str(Skill.Squat_NXT_XP)
	desc.text = "Squats are a fundamental lower-body exercise that enhances leg strength, endurance, and overall mobility. Regular squatting builds powerful thighs, improves stability, and supports athletic performance. Higher EN means higher xp gain."
	Off_combat_desc.text = "Active: Consumes [" + str(ceil(0.25 * Player.MAX_EN)) + "] EN, and grants [" + str((Skill.Squat_LVL * 10) + Player.MAX_EN) + "] Squat EXP."
	Combat_desc.text = "Passive: Grants [+10] MAX HP per Level. Current MAX HP = " + str(Player.MAX_HP)


