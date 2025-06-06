extends Control

@export var Play_to_Scene = "res://Scenes/Menus/new_game_or_continue.tscn"
@export var Test = "res://Scenes/Locations/players_bedroom.tscn"
@export var Test_Scene = "res://Scenes/Story/intro_scene.tscn"


func _on_exit_button_button_up():
	get_tree().quit()


func _on_play_button_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Play_to_Scene)


func _on_test_button_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Test)
	


func _on_settings_button_button_up():
	GlobalButtonClick.button_click()
