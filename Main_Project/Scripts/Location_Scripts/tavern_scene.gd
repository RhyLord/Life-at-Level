extends Control


@onready var House_Scene = "res://Scenes/Locations/house_scene.tscn"

var Waiter_Scene = load("res://Scenes/PopUp_Windows/waiter_work_window.tscn") as PackedScene


func _on_button_button_up():
	GlobalButtonClick.button_click()
	Global.Map = 2
	get_tree().change_scene_to_file(House_Scene)


func _on_button_2_button_up():
	var waiter_scene = Waiter_Scene.instantiate()
	get_tree().current_scene.add_child(waiter_scene)
