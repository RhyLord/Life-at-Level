extends Control

@export var Back_to_Scene = "res://Scenes/Menus/catalogue_menu.tscn"
@onready var Main_Menu = "res://Scenes/Menus/main_menu.tscn"

func _on_no_button_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Back_to_Scene)


func _on_yes_button_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Main_Menu)
