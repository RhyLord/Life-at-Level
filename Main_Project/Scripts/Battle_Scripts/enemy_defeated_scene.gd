extends Control

@export var Bedroom: PackedScene = preload("res://Scenes/Locations/players_bedroom.tscn")
@export var Lowest_Level_Slime_Dungeon_1_2: PackedScene = preload("res://Scenes/Battles/Slime_Dungeons/Lowest_Slime_Dungeons/lowest_slime_dungeon_1_2.tscn")
@export var Lowest_Level_Slime_Dungeon_1_1: PackedScene = preload("res://Scenes/Battles/Slime_Dungeons/Lowest_Slime_Dungeons/lowest_slime_dungeon_1_1.tscn")

@onready var details = $Details

func _ready():
	Player.XP += PostBattleData.XP
	Player.level_up_player()
	details.text = "[center]You defeated all enemies. You gained " + str(PostBattleData.XP) + " XP.[/center]"
	BattleMech.Set_Default()
	PreBattleData.Set_Default()
	Enemy1Data.Set_Default()
	Enemy2Data.Set_Default()
	Enemy3Data.Set_Default()
	Enemy4Data.Set_Default()
	Enemy5Data.Set_Default()

func _on_go_back_button_button_up():
	DungeonData.Reset_Data()
	get_tree().change_scene_to_packed(Bedroom)

func _on_return_button_button_up():
	DungeonData.Reset_Data()
	get_tree().change_scene_to_packed(Bedroom)

func _on_next_button_button_up():
	DungeonData.Next_lvl()
	
	# Check the `next_scene` string and switch accordingly
	match DungeonData.next_scene:
		"Lowest_Level_Slime_Dungeon_1_2":
			get_tree().change_scene_to_packed(Lowest_Level_Slime_Dungeon_1_2)
		"Lowest_Level_Slime_Dungeon_1_3":
			get_tree().change_scene_to_packed(Lowest_Level_Slime_Dungeon_1_1)
		"Lowest_Level_Slime_Dungeon_1_4":
			get_tree().change_scene_to_packed(Lowest_Level_Slime_Dungeon_1_2)
		"Lowest_Level_Slime_Dungeon_1_5":
			get_tree().change_scene_to_packed(Lowest_Level_Slime_Dungeon_1_1)
		"Lowest_Level_Slime_Dungeon_1_6":
			get_tree().change_scene_to_packed(Lowest_Level_Slime_Dungeon_1_2)
		"Lowest_Level_Slime_Dungeon_1_7":
			get_tree().change_scene_to_packed(Lowest_Level_Slime_Dungeon_1_1)
		"Lowest_Level_Slime_Dungeon_1_8":
			get_tree().change_scene_to_packed(Lowest_Level_Slime_Dungeon_1_2)
		"Lowest_Level_Slime_Dungeon_1_9":
			get_tree().change_scene_to_packed(Lowest_Level_Slime_Dungeon_1_1)
		"Lowest_Level_Slime_Dungeon_1_10":
			get_tree().change_scene_to_packed(Lowest_Level_Slime_Dungeon_1_2)
		"Lowest_Level_Slime_Dungeon_1_11":
			get_tree().change_scene_to_packed(Lowest_Level_Slime_Dungeon_1_1)
		"Lowest_Level_Slime_Dungeon_1_12":
			get_tree().change_scene_to_packed(Lowest_Level_Slime_Dungeon_1_2)
		"Lowest_Level_Slime_Dungeon_1_13":
			get_tree().change_scene_to_packed(Lowest_Level_Slime_Dungeon_1_1)
		"Lowest_Level_Slime_Dungeon_1_14":
			get_tree().change_scene_to_packed(Lowest_Level_Slime_Dungeon_1_2)
		_:
			print("Error: Unknown scene -", DungeonData.next_scene)
