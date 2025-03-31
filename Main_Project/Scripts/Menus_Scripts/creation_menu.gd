extends Control

@export var Lowest_Slime_Dungeon_Scene = "res://Scenes/Battles/battle_setup.tscn"


func _on_button_button_up():
	PreBattleData.Dungeon_name = "Lowest LVL Slime Dungeon"
	DungeonData.lowest_level_slime = 1
	DungeonData.Next_lvl()
	get_tree().change_scene_to_file(Lowest_Slime_Dungeon_Scene)
