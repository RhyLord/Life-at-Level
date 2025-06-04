extends Control

@onready var Day_txt = $Day_Text

@onready var Lydia_scene = "res://Scenes/NPC/lydia_npc_scenes.tscn"

@onready var previous_scene = "res://Scenes/Locations/house_scene.tscn"
@onready var sell_scene = "res://Scenes/Shop/lydia_sell_shop.tscn"
@onready var buy_scene = "res://Scenes/Shop/lydia_buy_shop.tscn"

@onready var Quest_Button = $Grid2/Button11
@onready var grid1 = $GridContainer
@onready var grid2 = $Grid2
@onready var grid3 = $Grid3

func _ready():
	Set_Core_Stats()

func Set_Core_Stats():
	Day_txt.bbcode_text = "[right]Day %d\nTime is %s[/right]" % [Global.Day, Global.time_states[Global.Time_of_day]]
	if Global.claire_quest == 1:
		if Global.claire_sub_quest == 0:
			Quest_Button.text = "Claire Quest #1"


func _on_button_3_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(previous_scene)


func _on_button_2_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(sell_scene)


func _on_button_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(buy_scene)


func _on_button_4_button_up():
	GlobalButtonClick.button_click()
	grid1.global_position.x = -2000
	grid2.global_position.x = 37


func _on_button_12_button_up():
	GlobalButtonClick.button_click()
	grid2.global_position.x = -2000
	grid1.global_position.x = 37


func _on_button_11_button_up():
	GlobalButtonClick.button_click()
	if Global.claire_quest == 1:
		if Global.claire_sub_quest == 0:
			get_tree().change_scene_to_file(Lydia_scene)


func _on_button_31_button_up():
	GlobalButtonClick.button_click()
	Global.lydia = 2
	get_tree().change_scene_to_file(Lydia_scene)


func _on_button_10_button_up():
	GlobalButtonClick.button_click()
	if Global.lydia != 0:
		grid2.global_position.x = -2000
		grid3.global_position.x = 37


func _on_button_34_button_up():
	grid3.global_position.x = -2000
	grid2.global_position.x = 37


func _on_button_32_button_up():
	GlobalButtonClick.button_click()
	Global.lydia = 3
	get_tree().change_scene_to_file(Lydia_scene)


func _on_button_33_button_up():
	GlobalButtonClick.button_click()
	Global.lydia = 4
	get_tree().change_scene_to_file(Lydia_scene)
