extends Control

@onready var Previous_Scene = "res://Scenes/Menus/catalogue_menu.tscn"
@onready var Monster_Loot = "res://Scenes/Menus/Monster_Loot_menu.tscn"
@onready var Weapons = "res://Scenes/Menus/weapons_menu.tscn"

func _ready():
	pass # Replace with function body.


func _on_go_back_button_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Previous_Scene)


func _on_monster_loot_button_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Monster_Loot)


func _on_weapons_button_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Weapons)
