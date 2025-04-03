extends Control

@export var Play_to_Scene = "res://Scenes/new_game_or_continue.tscn"

func _on_exit_button_button_up():
	get_tree().quit()


func _on_play_button_button_up():
	get_tree().change_scene_to_file(Play_to_Scene)
