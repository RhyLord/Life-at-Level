extends Control


@onready var level_txt = $Panel/lvl
@onready var Nxt_Level_txt = $Panel/Nxt_Lvl_Txt
@onready var desc = $Panel/desc_txt
@onready var Off_combat_desc = $Panel/Off_combat_desc
@onready var Combat_desc = $Panel/Combat_desc

func update():
	level_txt.text = "Level : " + str(Skill.Squat_LVL)
	Nxt_Level_txt.text ="Progress to Next Level : " + str(Skill.Squat_XP) + " / " + str(Skill.Squat_NXT_XP)
	desc.text = "Squats are a fundamental lower-body exercise that enhances leg strength, endurance, and overall mobility. Regular squatting builds powerful thighs, improves stability, and supports athletic performance. Higher EN means higher xp gain."
	Off_combat_desc.text = "Active: Consumes [" + str(ceil(0.25 * Player.MAX_EN)) + "] EN, and grants [" + str((Skill.Squat_LVL * 10) + Player.MAX_EN) + "] Squat EXP."
	Combat_desc.text = "Passive: Grants [+10] MAX HP per Level. Current MAX HP = " + str(Player.MAX_HP)

func update_and_refresh(func_ref):
	if func_ref and func_ref is Callable:
		func_ref.call()

func _ready():
	update()


func _on_close_button_button_up():
	GlobalButtonClick.button_click()
	queue_free()


func _on_action_button_button_up():
	GlobalButtonClick.button_click()
	update_and_refresh(Skill.Active_Squat)
	update()
	if get_parent().has_method("Set_Core_Stats"):
		get_parent().Set_Core_Stats()
