extends Control

@export var Bedroom: PackedScene = preload("res://Scenes/Locations/players_bedroom.tscn")

func _on_respawn_button_up():
	GlobalButtonClick.button_click()
	BattleMech.Set_Default()
	PreBattleData.Set_Default()
	Enemy1Data.Set_Default()
	Enemy2Data.Set_Default()
	Enemy3Data.Set_Default()
	Enemy4Data.Set_Default()
	Enemy5Data.Set_Default()
	PostBattleData.reset_data()
	Skill.Skill_Unlock_Check()
	DungeonData.Reset_Data()
	Player.HP = 1
	Global.Day += 1
	get_tree().change_scene_to_packed(Bedroom)
