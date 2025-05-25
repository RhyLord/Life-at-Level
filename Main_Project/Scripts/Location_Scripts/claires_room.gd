extends Control

@onready var Bg_Holder = $Bg
@onready var Day_txt = $Day_Text
@onready var House_Scene = "res://Scenes/Locations/house_scene.tscn"
@onready var Claire_Scene = "res://Scenes/NPC/claire_npc_scenes.tscn"

@onready var grid1 = $Grid1
@onready var grid2 = $Grid2
@onready var grid3 = $Grid3
@onready var grid4 = $Grid4


var bg_textures = [
	preload("res://Assets/Map_Art/ClaireRoom/ClaireBedroomMorning.png"),
	preload("res://Assets/Map_Art/ClaireRoom/ClaireBedroomNoon.png"),
	preload("res://Assets/Map_Art/ClaireRoom/ClaireBedroomEvening.png"),
	preload("res://Assets/Map_Art/ClaireRoom/ClaireBedroomNight.png"),
	preload("res://Assets/Map_Art/ClaireRoom/ClaireBedroomMidnight.png")
]

func _ready():
	Set_Core_Stats()

func Set_Core_Stats():
	Day_txt.bbcode_text = "[right]Day %d\nTime is %s[/right]" % [Global.Day, Global.time_states[Global.Time_of_day]]
	Bg_Holder.texture = bg_textures[Global.Time_of_day]




func _on_button_button_up():
	GlobalButtonClick.button_click()
	Global.Map = 2
	get_tree().change_scene_to_file(House_Scene)


func _on_button_2_button_up():
	GlobalButtonClick.button_click()
	grid1.global_position.x = -2000
	grid2.global_position.x = 37


func _on_button_10_button_up():
	GlobalButtonClick.button_click()
	grid2.global_position.x = -2000
	grid3.global_position.x = 37


func _on_button_11_button_up():
	GlobalButtonClick.button_click()
	grid2.global_position.x = -2000
	grid4.global_position.x = 37
	

func _on_button_12_button_up():
	GlobalButtonClick.button_click()
	Global.claire = 7
	get_tree().change_scene_to_file(Claire_Scene)
	

func _on_button_13_button_up():
	GlobalButtonClick.button_click()
	grid1.global_position.x = 37
	grid2.global_position.x = -2000


func _on_button_21_button_up():
	GlobalButtonClick.button_click()
	Global.claire = 1
	get_tree().change_scene_to_file(Claire_Scene)



func _on_button_22_button_up():
	GlobalButtonClick.button_click()
	Global.claire = 2
	get_tree().change_scene_to_file(Claire_Scene)


func _on_button_23_button_up():
	GlobalButtonClick.button_click()
	Global.claire = 3
	get_tree().change_scene_to_file(Claire_Scene)
	
func _on_button_24_button_up():
	GlobalButtonClick.button_click()
	grid3.global_position.x = -2000
	grid2.global_position.x = 37


func _on_button_31_button_up():
	GlobalButtonClick.button_click()
	Global.claire = 4
	get_tree().change_scene_to_file(Claire_Scene)


func _on_button_32_button_up():
	GlobalButtonClick.button_click()
	Global.claire = 5
	get_tree().change_scene_to_file(Claire_Scene)


func _on_button_33_button_up():
	GlobalButtonClick.button_click()
	Global.claire = 6
	get_tree().change_scene_to_file(Claire_Scene)


func _on_button_34_button_up():
	GlobalButtonClick.button_click()
	grid4.global_position.x = -2000
	grid2.global_position.x = 37
