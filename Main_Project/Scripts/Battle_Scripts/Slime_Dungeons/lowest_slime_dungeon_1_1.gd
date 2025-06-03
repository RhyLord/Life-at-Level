extends Node2D

var Bg_Textures = preload("res://Assets/Location_Art/Plains/SlimePlainsTexture.png")
	

@onready var Bg_holder = $BG

func _ready():
	Bg_holder.texture = Bg_Textures
