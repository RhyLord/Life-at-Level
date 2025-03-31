extends Control

@export var Stat_Scene = "res://Scenes/stats_menu.tscn"


func _on_button_3_button_up():
	get_tree().change_scene_to_file(Stat_Scene)
