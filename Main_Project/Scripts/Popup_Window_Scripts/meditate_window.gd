extends Control

@onready var Level_txt = $Panel/lvl
@onready var Nxt_Level_txt = $Panel/Nxt_Lvl_Txt
@onready var desc = $Panel/desc_txt
@onready var Off_combat_desc = $Panel/Off_combat_desc
@onready var Combat_desc = $Panel/Combat_desc

func update():
	Level_txt.text = "Level : " + str(Skill.Meditate_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.Meditate_XP) + " / " + str(Skill.Meditate_NXT_XP)
	desc.text = "Meditation is a practice of mental clarity and focus, allowing for deep introspection and spiritual growth. With each level, practitioners enhance their ability to recover and expand their mana. You gain more xp with higher MP."
	
	var en_cost = ceil(0.25 * Player.MAX_EN)
	var xp_gain = (10 * Skill.Meditate_LVL) + Player.MAX_MP
	
	Off_combat_desc.text = "Active: Consumes [" + str(en_cost) + "] EN, and grants [" + str(xp_gain) + "] Meditate EXP."
	Combat_desc.text = "Passive: Grants [+10] MAX MP per Level. Current MAX MP = " + str(Player.MAX_MP)

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
	update_and_refresh(Skill.Active_Meditate)
	update()
	if get_parent().has_method("Set_Core_Stats"):
		get_parent().Set_Core_Stats()

