extends Button

var Recovery_Scene = load("res://Scenes/Battles/recovery_options_scene.tscn") as PackedScene

func _on_button_up():
	GlobalButtonClick.button_click()
	var recovery_scn = Recovery_Scene.instantiate()
	get_tree().current_scene.add_child(recovery_scn)
