extends Button

var Attack_Scene = load("res://Scenes/Battles/attack_options_scene.tscn") as PackedScene

func _on_button_up():
	GlobalButtonClick.button_click()
	var attack_Scene = Attack_Scene.instantiate()
	get_tree().current_scene.add_child(attack_Scene)
