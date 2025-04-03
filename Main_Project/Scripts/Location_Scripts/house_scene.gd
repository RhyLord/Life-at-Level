extends Node2D

@onready var Bedroom_Scene = "res://Scenes/Locations/players_bedroom.tscn"
@onready var Garden_Scene = "res://Scenes/Locations/garden_scene.tscn"
@onready var Bathroom_Scene = "res://Scenes/Locations/bathroom_scene.tscn"

var bg_textures = [
	preload("res://Assets/Map_Art/House_Bg_Morning.png"),
	preload("res://Assets/Map_Art/House_Bg_Noon.png"),
	preload("res://Assets/Map_Art/House_Bg_Evening.png"),
	preload("res://Assets/Map_Art/House_Bg_Night.png"),
	preload("res://Assets/Map_Art/House_Bg_Midnight.png")
]

@onready var Bg_Holder = $BG
@onready var Day_txt = $Day_Text

func _ready():
	Set_Core_Stats()

func Set_Core_Stats():
	Bg_Holder.texture = bg_textures[Global.Time_of_day]
	Day_txt.bbcode_text = "[right]Day %d\nTime is %s[/right]" % [Global.Day, Global.time_states[Global.Time_of_day]]


func _on_button_button_up():
	Global.Map = 1
	get_tree().change_scene_to_file(Bedroom_Scene)


func _on_button_2_button_up():
	Global.Map = 3
	get_tree().change_scene_to_file(Garden_Scene)


func _on_button_3_button_up():
	Global.Map = 4
	get_tree().change_scene_to_file(Bathroom_Scene)
