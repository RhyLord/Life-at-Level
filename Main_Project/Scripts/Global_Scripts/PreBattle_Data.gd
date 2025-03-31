extends Node

var Player_position_x = 0
var Player_position_y = 0

var Dungeon_name = "Unknown"
var bg_textures = "res://Assets/Location_Art/Plains/Plains_Bg_Night.png"
var Dungeon_start_name = "0-0"

var Refresh_Active = true

var desciption_txt = "The Battle Begins"

func Set_Default():
	Dungeon_name = "Unknown"
	bg_textures = "res://Assets/Location_Art/Plains/Plains_Bg_Night.png"
	Dungeon_start_name = "0-0"
	Refresh_Active = true
	desciption_txt = "The Battle Begins"
