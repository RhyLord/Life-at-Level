extends Button

@export var Previous_Scene = "res://Scenes/skills_menu.tscn"

func _on_button_up():
	get_tree().change_scene_to_file(Previous_Scene)
