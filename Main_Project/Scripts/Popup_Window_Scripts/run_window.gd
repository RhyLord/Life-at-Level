extends Control


@onready var level_txt = $Panel/lvl
@onready var Nxt_Level_txt = $Panel/Nxt_Lvl_Txt
@onready var desc = $Panel/desc_txt
@onready var Off_combat_desc = $Panel/Off_combat_desc
@onready var Combat_desc = $Panel/Combat_desc

func update():
	level_txt.text = "Level : " + str(Skill.Run_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.Run_XP) + " / " + str(Skill.Run_NXT_XP)
	desc.text = "Running is a fundamental skill that enhances overall stamina. Essential for survival and athletic performance, it strengthens cardiovascular health and improves energy efficiency over time. Xp gain scales with higher EN."
	Off_combat_desc.text = "Active: Consumes [" + str(ceil(0.25 * Player.MAX_EN)) + "] EN, advances time, and grants [" + str((10 * Skill.Run_LVL) + ceil(Player.MAX_EN)) + "] Run EXP."
	Combat_desc.text = "Passive: Grants [+10] MAX EN per Level. Current MAX EN = " + str(Player.MAX_EN)

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
	update_and_refresh(Skill.Active_Run)
	update()
	if get_parent().has_method("Set_Core_Stats"):
		get_parent().Set_Core_Stats()
