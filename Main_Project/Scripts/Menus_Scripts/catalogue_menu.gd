extends Control

@export var Stat_Scene = "res://Scenes/Menus/stats_menu.tscn"
@export var Exit_Scene = "res://Scenes/Menus/exit_to_main_menu_confirm.tscn"
@export var Bedroom_Scene = "res://Scenes/Locations/players_bedroom.tscn"
@onready var House_Scene = "res://Scenes/Locations/house_scene.tscn"
@onready var Garden_Scene = "res://Scenes/Locations/garden_scene.tscn"
@onready var Bathroom_Scene = "res://Scenes/Locations/bathroom_scene.tscn"
@onready var Tavern_Scene = "res://Scenes/Locations/tavern_scene.tscn"
@onready var Claire_Room = "res://Scenes/Locations/claires_room.tscn"


@onready var Inventory_Scene = "res://Scenes/Menus/inventory_menu.tscn"

func _on_button_3_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Stat_Scene)


func _on_button_6_pressed():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Exit_Scene)

func _on_save_button_button_up():
	GlobalButtonClick.button_click()
	Player.Save_Game()

func _on_go_back_button_button_up():
	GlobalButtonClick.button_click()
	if Global.Map == 1:
		get_tree().change_scene_to_file(Bedroom_Scene)
	elif Global.Map == 2:
		get_tree().change_scene_to_file(House_Scene)
	elif Global.Map == 3:
		get_tree().change_scene_to_file(Garden_Scene)
	elif Global.Map == 4:
		get_tree().change_scene_to_file(Bathroom_Scene)
	elif Global.Map == 5:
		get_tree().change_scene_to_file(Tavern_Scene)
	elif Global.Map == 6:
		get_tree().change_scene_to_file(Claire_Room)



func _on_button_2_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Inventory_Scene)


func _on_debug_button_up():
	pass
