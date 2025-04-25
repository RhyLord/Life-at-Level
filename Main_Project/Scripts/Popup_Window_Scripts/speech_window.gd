extends Control


@onready var Level_txt = $Panel/lvl
@onready var Nxt_Level_txt = $Panel/Nxt_Lvl_Txt
@onready var desc = $Panel/desc_txt
@onready var Off_combat_desc = $Panel/Off_combat_desc
@onready var Combat_desc = $Panel/Combat_desc

func update():
	Level_txt.text = "Level : " + str(Skill.Speech_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.Speech_XP) + " / " + str(Skill.Speech_NXT_XP)
	desc.text = "Speech skill enhances charisma, enabling you to influence others, negotiate better outcomes, and succeed in social encounters. A must-have for smooth talkers and leaders. Higher Charisma leads to more XP gain."

	var en_cost = ceil(0.05 * Player.MAX_EN)
	var exp_gain = 50 + (25 * Player.CHA)
	var cha_bonus = 1 * Skill.Speech_LVL

	Off_combat_desc.text = "Active: Consumes [" + str(en_cost) + "] EN, and grants [" + str(exp_gain) + "] Speech EXP."
	Combat_desc.text = "Passive: Grants [" + str(cha_bonus) + "] CHA. Current CHA = " + str(Player.CHA)

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
	update_and_refresh(Skill.Active_Speech_XP)
	update()
	if get_parent().has_method("Set_Core_Stats"):
		get_parent().Set_Core_Stats()
