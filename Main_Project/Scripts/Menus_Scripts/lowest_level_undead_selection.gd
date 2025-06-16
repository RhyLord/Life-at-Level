extends Control

@export var Previous_Scene = "res://Scenes/Menus/creation_menu.tscn"

@export var Battle_Setup = "res://Scenes/Battles/battle_setup.tscn"

@onready var Button1 = $GridContainer/Button_1_10
@onready var Button2 = $GridContainer/Button_11_20
@onready var Button3 = $GridContainer/Button_21_30

func _on_go_back_button_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Previous_Scene)

func _ready():
	if DungeonData.lowest_level_undead_1_10 == false:
		Button1.visible = false
	if DungeonData.lowest_level_undead_11_20 == false:
		Button2.visible = false
	if DungeonData.lowest_level_undead_21_30 == false:
		Button3.visible = false

func _on_button_1_10_button_up():
	if DungeonData.lowest_level_undead_1_10 == true:
		GlobalButtonClick.button_click()
		PreBattleData.Dungeon_name = "Lowest LVL Undead Dungeon"
		DungeonData.lowest_level_undead = 1
		DungeonData.Next_lvl()
		get_tree().change_scene_to_file(Battle_Setup)


func _on_button_11_20_button_up():
	if DungeonData.lowest_level_undead_11_20 == true:
		GlobalButtonClick.button_click()
		PreBattleData.Dungeon_name = "Lowest LVL Undead Dungeon"
		DungeonData.lowest_level_undead = 1
		DungeonData.lowest_undead_dungeon_lvl = 10
		DungeonData.Next_lvl()
		get_tree().change_scene_to_file(Battle_Setup)


func _on_button_21_30_button_up():
	if DungeonData.lowest_level_undead_21_30 == true:
		GlobalButtonClick.button_click()
		PreBattleData.Dungeon_name = "Lowest LVL Undead Dungeon"
		DungeonData.lowest_level_undead = 1
		DungeonData.lowest_undead_dungeon_lvl = 20
		DungeonData.Next_lvl()
		get_tree().change_scene_to_file(Battle_Setup)
