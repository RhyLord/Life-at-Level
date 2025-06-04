extends Control

@onready var Day_txt = $Day_Text
@onready var Bg_Holder = $Bg

@onready var previous_scene = "res://Scenes/Locations/house_scene.tscn"
@onready var veronica_scene = "res://Scenes/NPC/veronica_npc_scenes.tscn"

@onready var grid1 = $GridContainer
@onready var grid2 = $Grid2
@onready var grid3 = $Grid3

@onready var Quest_Button = $Grid2/Button11

var bg_textures = [
	preload("res://Assets/Map_Art/Soldier_Barracks/Soldier_Barrack_Morning.png"),
	preload("res://Assets/Map_Art/Soldier_Barracks/Soldier_Barrack_Noon.png"),
	preload("res://Assets/Map_Art/Soldier_Barracks/Soldier_Barrack_Evening.png"),
	preload("res://Assets/Map_Art/Soldier_Barracks/Soldier_Barrack_Night.png"),
	preload("res://Assets/Map_Art/Soldier_Barracks/Soldier_Barrack_Midnight.png")
]


func _ready():
	Set_Core_Stats()

func Set_Core_Stats():
	Day_txt.bbcode_text = "[right]Day %d\nTime is %s[/right]" % [Global.Day, Global.time_states[Global.Time_of_day]]
	Bg_Holder.texture = bg_textures[Global.Time_of_day]
	
	if Global.claire_quest == 1:
		if Global.claire_sub_quest == 2:
			Quest_Button.text = "Claire Quest #1"
		if Global.claire_sub_quest == 3:
			Quest_Button.text = "Claire Quest #1"

func _on_button_2_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(previous_scene)


func _on_button_button_up():
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
		if Global.claire_sub_quest == 2:
			get_tree().change_scene_to_file(veronica_scene)
		elif Global.claire_sub_quest == 3:
			get_tree().change_scene_to_file(veronica_scene)


func _on_button_10_button_up():
	GlobalButtonClick.button_click()
	grid2.global_position.x = -2000
	grid3.global_position.x = 37


func _on_button_34_button_up():
	GlobalButtonClick.button_click()
	grid3.global_position.x = -2000
	grid2.global_position.x = 37


func _on_button_31_button_up():
	GlobalButtonClick.button_click()
	if Global.veronica == 1:
		Global.veronica = 2
		get_tree().change_scene_to_file(veronica_scene)


func _on_button_32_button_up():
	GlobalButtonClick.button_click()
	if Global.veronica == 1:
		Global.veronica = 3
		get_tree().change_scene_to_file(veronica_scene)


func _on_button_33_button_up():
	GlobalButtonClick.button_click()
	if Global.veronica == 1:
		Global.veronica = 4
		get_tree().change_scene_to_file(veronica_scene)
