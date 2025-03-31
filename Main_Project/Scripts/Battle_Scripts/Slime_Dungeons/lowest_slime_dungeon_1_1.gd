extends Node2D

var Bg_Textures = [
	preload("res://Assets/Location_Art/Plains/Plains_Bg_Morning.png"),
	preload("res://Assets/Location_Art/Plains/Plains_Bg_Noon.png"),
	preload("res://Assets/Location_Art/Plains/Plains_Bg_Evening.png"),
	preload("res://Assets/Location_Art/Plains/Plains_Bg_Night.png"),
	preload("res://Assets/Location_Art/Plains/Plains_Bg_Midnight.png")
]

@onready var Bg_holder = $BG

func _ready():
	Bg_holder.texture = Bg_Textures[Global.Time_of_day]
