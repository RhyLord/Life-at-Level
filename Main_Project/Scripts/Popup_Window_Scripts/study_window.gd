extends Control


@onready var Level_txt = $Panel/lvl
@onready var Nxt_Level_txt = $Panel/Nxt_Lvl_Txt
@onready var desc = $Panel/desc_txt
@onready var Off_combat_desc = $Panel/Off_combat_desc
@onready var Combat_desc = $Panel/Combat_desc

func update():
	Level_txt.text = "Level : " + str(Skill.Study_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.Study_XP) + " / " + str(Skill.Study_NXT_XP)
	desc.text = "Studying enhances intelligence, improving problem-solving and critical thinking. It is essential for mastering knowledge-based tasks and unlocking greater understanding over time."
	
	var en_cost = ceil(0.05 * Player.MAX_EN)
	Off_combat_desc.text = "Active: Consumes [" + str(en_cost) + "] EN, and grants [" + str(25 * Player.INT) + "] Study EXP."
	Combat_desc.text = "Passive: Grants [" + str(1 * Skill.Study_LVL) + "] INT. Current INT = " + str(Player.INT)

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
	update_and_refresh(Skill.Active_Study)
	update()
	if get_parent().has_method("Set_Core_Stats"):
		get_parent().Set_Core_Stats()
