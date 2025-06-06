extends Control

@export var Lowest_Slime = "res://Scenes/Dungeon_Menus/lowest_level_slime_selection.tscn"
@export var Lowest_Undead = "res://Scenes/Dungeon_Menus/lowest_level_undead_selection.tscn"

@onready var grid1 = $Grid1
@onready var grid2 = $Grid2
@onready var grid3 = $Grid3

@onready var Button2 = $Grid1/GridContainer/Button2

func _ready():
	if DungeonData.lowest_level_undead_1_10 == false:
		Button2.visible = false
		
func _on_button_10_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Lowest_Slime)


func _on_button_1_button_up():
	grid1.position.x = -9000
	grid2.position.x = 30


func _on_button_back_1_button_up():
	grid2.position.x = -9000
	grid1.position.x = 30




func _on_button_20_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Lowest_Undead)


func _on_button_back_2_button_up():
	grid3.position.x = -9000
	grid1.position.x = 30


func _on_button_2_button_up():
	grid1.position.x = -9000
	grid3.position.x = 30
