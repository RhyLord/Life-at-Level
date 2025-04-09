extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.PushUp_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.PushUp_XP) + " / " + str(Skill.PushUp_NXT_XP)
	desc.text = "Push-ups are a fundamental exercise for building strength, endurance, and discipline. Used in military training and fitness regimens worldwide, they enhance upper body power and core stability. Consistent training improves physical resilience and contributes to overall muscle growth."
	Off_combat_desc.text = "Active: Consumes [" + str(ceil(0.25 * Player.MAX_EN)) + "] EN, and grants [" + str((10 * Skill.PushUp_LVL) + Player.MAX_EN) + "] Push-Up EXP."
	Combat_desc.text = "Passive: Grants [" + str(1 * Skill.PushUp_LVL) + "] STR. Current STR = " + str(Player.STR)

