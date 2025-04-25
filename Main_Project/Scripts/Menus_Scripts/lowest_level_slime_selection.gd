extends Control

@export var Previous_Scene = "res://Scenes/Menus/creation_menu.tscn"

@export var Battle_Setup = "res://Scenes/Battles/battle_setup.tscn"

@onready var button_2 = $GridContainer/Button_11_20
@onready var button_3 = $GridContainer/Button_21_30
@onready var button_4 = $GridContainer/Button_31_40
@onready var button_5 = $GridContainer/Button_41_50
@onready var button_6 = $GridContainer/Button_51_60
@onready var button_7 = $GridContainer/Button_61_70


func _on_go_back_button_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Previous_Scene)

func _ready():
	if DungeonData.lowest_level_slime_11_20 == false:
		button_2.visible = false
	if DungeonData.lowest_level_slime_21_30 == false:
		button_3.visible = false
	if DungeonData.lowest_level_slime_31_40 == false:
		button_4.visible = false
	if DungeonData.lowest_level_slime_41_50 == false:
		button_5.visible = false
	if DungeonData.lowest_level_slime_51_60 == false:
		button_6.visible = false
	if DungeonData.lowest_level_slime_61_70 == false:
		button_7.visible = false

func _on_button_1_10_button_up():
	if DungeonData.lowest_level_slime_1_10 == true:
		GlobalButtonClick.button_click()
		PreBattleData.Dungeon_name = "Lowest LVL Slime Dungeon"
		DungeonData.lowest_level_slime = 1
		DungeonData.Next_lvl()
		get_tree().change_scene_to_file(Battle_Setup)


func _on_button_11_20_button_up():
	if DungeonData.lowest_level_slime_11_20 == true:
		GlobalButtonClick.button_click()
		PreBattleData.Dungeon_name = "Lowest LVL Slime Dungeon"
		DungeonData.lowest_level_slime = 1
		DungeonData.dungeon_lvl = 10
		DungeonData.Next_lvl()
		get_tree().change_scene_to_file(Battle_Setup)


func _on_button_21_30_button_up():
	if DungeonData.lowest_level_slime_21_30 == true:
		GlobalButtonClick.button_click()
		PreBattleData.Dungeon_name = "Lowest LVL Slime Dungeon"
		DungeonData.lowest_level_slime = 1
		DungeonData.dungeon_lvl = 20
		DungeonData.Next_lvl()
		get_tree().change_scene_to_file(Battle_Setup)


func _on_button_31_40_button_up():
	if DungeonData.lowest_level_slime_31_40 == true:
		GlobalButtonClick.button_click()
		PreBattleData.Dungeon_name = "Lowest LVL Slime Dungeon"
		DungeonData.lowest_level_slime = 1
		DungeonData.dungeon_lvl = 30
		DungeonData.Next_lvl()
		get_tree().change_scene_to_file(Battle_Setup)


func _on_button_41_50_button_up():
	if DungeonData.lowest_level_slime_41_50 == true:
		GlobalButtonClick.button_click()
		PreBattleData.Dungeon_name = "Lowest LVL Slime Dungeon"
		DungeonData.lowest_level_slime = 1
		DungeonData.dungeon_lvl = 40
		DungeonData.Next_lvl()
		get_tree().change_scene_to_file(Battle_Setup)


func _on_button_51_60_button_up():
	if DungeonData.lowest_level_slime_51_60 == true:
		GlobalButtonClick.button_click()
		PreBattleData.Dungeon_name = "Lowest LVL Slime Dungeon"
		DungeonData.lowest_level_slime = 1
		DungeonData.dungeon_lvl = 50
		DungeonData.Next_lvl()
		get_tree().change_scene_to_file(Battle_Setup)


func _on_button_61_70_button_up():
	if DungeonData.lowest_level_slime_61_70 == true:
		GlobalButtonClick.button_click()
		PreBattleData.Dungeon_name = "Lowest LVL Slime Dungeon"
		DungeonData.lowest_level_slime = 1
		DungeonData.dungeon_lvl = 60
		DungeonData.Next_lvl()
		get_tree().change_scene_to_file(Battle_Setup)
