extends Control

@export var Bedroom: PackedScene = preload("res://Scenes/Locations/players_bedroom.tscn")
@export var Lowest_Level_Slime_Dungeon_1_2: PackedScene = preload("res://Scenes/Battles/Slime_Dungeons/Lowest_Slime_Dungeons/lowest_slime_dungeon_1_2.tscn")
@export var Lowest_Level_Slime_Dungeon_1_1: PackedScene = preload("res://Scenes/Battles/Slime_Dungeons/Lowest_Slime_Dungeons/lowest_slime_dungeon_1_1.tscn")

@onready var details = $Details
@onready var ItemTxT = $ItemGainTXT
@onready var Nxt_Button = $Next_Button

func _ready():
	PostBattleData.update()
	details.text = PostBattleData.VictoryText
	ItemTxT.text = "[center]" + str(PostBattleData.ItemGainText) + "[/center]"
	BattleMech.Set_Default()
	PreBattleData.Set_Default()
	Enemy1Data.Set_Default()
	Enemy2Data.Set_Default()
	Enemy3Data.Set_Default()
	Enemy4Data.Set_Default()
	Enemy5Data.Set_Default()
	PostBattleData.reset_data()
	Skill.Skill_Unlock_Check()

func _on_go_back_button_button_up():
	DungeonData.Reset_Data()
	get_tree().change_scene_to_packed(Bedroom)

func _on_return_button_button_up():
	DungeonData.Reset_Data()
	get_tree().change_scene_to_packed(Bedroom)

func _on_next_button_button_up():
	DungeonData.Next_lvl()
	if DungeonData.lowest_level_slime == 1:
		Lowest_Level_Slime_Dungeons()

func Lowest_Level_Slime_Dungeons():
	if DungeonData.lowest_level_slime == 1:
		if DungeonData.next_scene == "Lowest_Level_Slime_Dungeon_1_101":
			Nxt_Button.visible = false
			return

		var dungeon_map = {}

		for i in range(2, 101):  # Dungeon_1_2 to Dungeon_1_100
			var key = "Lowest_Level_Slime_Dungeon_1_" + str(i)
			dungeon_map[key] = (
				Lowest_Level_Slime_Dungeon_1_2 if i % 2 == 0 else Lowest_Level_Slime_Dungeon_1_1
			)

		var scene = dungeon_map.get(DungeonData.next_scene)
		if scene:
			get_tree().change_scene_to_packed(scene)
		else:
			push_error("Invalid next_scene: " + str(DungeonData.next_scene))
		
		
