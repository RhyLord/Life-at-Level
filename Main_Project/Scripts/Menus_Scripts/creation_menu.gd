extends Control

@export var Lowest_Slime = "res://Scenes/Dungeon_Menus/lowest_level_slime_selection.tscn"


func _on_button_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Lowest_Slime)
