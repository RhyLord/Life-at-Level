extends Node2D

@onready var Creation_Scene = "res://Scenes/Menus/creation_menu.tscn"
@onready var House_Scene = "res://Scenes/Locations/house_scene.tscn"

var Meditate_Scene = load("res://Scenes/PopUp_Windows/meditate_window.tscn") as PackedScene
var Study_Scene = load("res://Scenes/PopUp_Windows/study_window.tscn") as PackedScene


#Sprites for Bg
var bedroom_bg_textures = [
	preload("res://Assets/Map_Art/Player_bedroom/Player_Bedroom_Morning.png"),
	preload("res://Assets/Map_Art/Player_bedroom/Player_Bedroom_Noon.png"),
	preload("res://Assets/Map_Art/Player_bedroom/Player_Bedroom_Evening.png"),
	preload("res://Assets/Map_Art/Player_bedroom/Player_Bedroom_Night.png"),
	preload("res://Assets/Map_Art/Player_bedroom/Player_Bedroom_Midnight.png")
]

@onready var Bg_holder = $Bedroom_Bg
@onready var HP_Bar = $Options_holder/HealthBar
@onready var HP_TXT = $Options_holder/HealthBar/HPTXTLabel
@onready var MP_Bar = $Options_holder/ManaBar
@onready var MP_TXT = $Options_holder/ManaBar/MPTXTLabel
@onready var EN_Bar = $Options_holder/ENBar
@onready var EN_TXT = $Options_holder/ENBar/ENTXTLabel
@onready var Day_txt = $Day_Text

var current_Bg_index = 0

func _ready():
	Set_Core_Stats()

func Set_Core_Stats():
	HP_Bar.max_value = Player.MAX_HP
	HP_Bar.value = Player.HP
	HP_TXT.bbcode_text = "[center]%d / %d[/center]" % [Player.HP, Player.MAX_HP]
	
	MP_Bar.max_value = Player.MAX_MP
	MP_Bar.value = Player.MP
	MP_TXT.bbcode_text = "[center]%d / %d[/center]" % [Player.MP, Player.MAX_MP]

	EN_Bar.max_value = Player.MAX_EN
	EN_Bar.value = Player.EN
	EN_TXT.bbcode_text = "[center]%d / %d[/center]" % [Player.EN, Player.MAX_EN]
	
	Bg_holder.texture = bedroom_bg_textures[Global.Time_of_day]
	Day_txt.bbcode_text = "[right]Day %d\nTime is %s[/right]" % [Global.Day, Global.time_states[Global.Time_of_day]]

func update_and_refresh(func_ref):
	if func_ref and func_ref is Callable:
		func_ref.call()
		Set_Core_Stats()


func _on_option_button_1_button_up():
	GlobalButtonClick.button_click()
	update_and_refresh(Skill.Off_Combat_Rest)


func _on_option_button_3_pressed():
	GlobalButtonClick.button_click()
	var meditate_scene = Meditate_Scene.instantiate()
	get_tree().current_scene.add_child(meditate_scene)

func _on_option_button_4_pressed():
	GlobalButtonClick.button_click()
	var study_scene = Study_Scene.instantiate()
	get_tree().current_scene.add_child(study_scene)


func _on_option_button_5_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Creation_Scene)



func _on_option_button_7_button_up():
	GlobalButtonClick.button_click()
	Global.Map = 2
	get_tree().change_scene_to_file(House_Scene)
