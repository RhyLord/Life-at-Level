extends Control

@onready var New_Game_Scene = "res://Scenes/Story/intro_scene.tscn"
@onready var Continue = "res://Scenes/Locations/players_bedroom.tscn"
@onready var Main_Menu = "res://Scenes/Menus/main_menu.tscn"


func _on_new_game_button_button_up():
	GlobalButtonClick.button_click()

	Player.New_Game()
	get_tree().change_scene_to_file(New_Game_Scene)


func _on_continue_button_button_up():
	GlobalButtonClick.button_click()
	Player.load_data()
	get_tree().change_scene_to_file(Continue)



func _on_go_back_button_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Main_Menu)
