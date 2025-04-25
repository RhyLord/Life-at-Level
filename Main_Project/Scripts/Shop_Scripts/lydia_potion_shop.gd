extends Control

@onready var previous_scene = "res://Scenes/Locations/house_scene.tscn"
@onready var sell_scene = "res://Scenes/Shop/lydia_sell_shop.tscn"
@onready var buy_scene = "res://Scenes/Shop/lydia_buy_shop.tscn"

func _on_button_3_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(previous_scene)


func _on_button_2_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(sell_scene)


func _on_button_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(buy_scene)
