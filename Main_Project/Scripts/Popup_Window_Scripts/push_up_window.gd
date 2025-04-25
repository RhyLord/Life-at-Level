extends Control

@onready var level_txt = $Panel/lvl
@onready var Nxt_Level_txt = $Panel/Nxt_Lvl_Txt
@onready var desc = $Panel/desc_txt
@onready var Off_combat_desc = $Panel/Off_combat_desc
@onready var Combat_desc = $Panel/Combat_desc

func update():
	level_txt.text = "Level : " + str(Skill.PushUp_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.PushUp_XP) + " / " + str(Skill.PushUp_NXT_XP)
	desc.text = "Push-ups are a fundamental exercise for building strength and discipline. Used in military training and fitness regimens worldwide, they enhance upper body power and core stability. Consistent training improves physical resilience and contributes to overall muscle growth. Higher the EN higher the xp gain."
	Off_combat_desc.text = "Active: Consumes [" + str(ceil(0.25 * Player.MAX_EN)) + "] EN, and grants [" + str((10 * Skill.PushUp_LVL) + Player.MAX_EN) + "] Push-Up EXP."
	Combat_desc.text = "Passive: Grants [" + str(1 * Skill.PushUp_LVL) + "] STR. Current STR = " + str(Player.STR)

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
	update_and_refresh(Skill.Active_PushUp)
	update()
	if get_parent().has_method("Set_Core_Stats"):
		get_parent().Set_Core_Stats()
