extends Control

@onready var New_Game_Scene = "res://Scenes/Locations/players_bedroom.tscn"
@onready var Main_Menu = "res://Scenes/Menus/main_menu.tscn"

func _on_new_game_button_button_up():
	Player.New_Game()
	get_tree().change_scene_to_file(New_Game_Scene)


func _on_continue_button_button_up():
	Player.load_data()
	get_tree().change_scene_to_file(New_Game_Scene)


func _on_go_back_button_button_up():
	get_tree().change_scene_to_file(Main_Menu)
