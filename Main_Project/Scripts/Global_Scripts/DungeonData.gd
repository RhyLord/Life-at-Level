extends Node

var dungeon_lvl = 0
var lowest_level_slime = 0
var next_scene = ""

func Lowest_Level_Slime_Dungeon():
	if dungeon_lvl == 1:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 1"
		PreBattleData.desciption_txt = "You have entered Slime Dungeon 1 - 1"
		PostBattleData.XP = 20
		var Enemy_name = "LVL - 1 Green Slime"
		Enemy1Data.Create_Enemy(Enemy_name,"green_slime", 10, 1, 1)
		next_scene = "Lowest_Level_Slime_Dungeon_1_2"  # Use a string instead of number
	
	if dungeon_lvl == 2:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 2"
		PreBattleData.desciption_txt = "You have entered Slime Dungeon 1 - 2"
		PostBattleData.XP = 30
		var Enemy_name = "LVL - 2 Green Slime"
		Enemy1Data.Create_Enemy(Enemy_name,"green_slime", 15, 1, 2)
		next_scene = "Lowest_Level_Slime_Dungeon_1_3"
		
	if dungeon_lvl == 3:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 3"
		PreBattleData.desciption_txt = "You have entered Slime Dungeon 1 - 3"
		PostBattleData.XP = 40
		Enemy1Data.Create_Enemy("LVL - 1 Green Slime","green_slime", 10, 1, 1)
		Enemy2Data.Create_Enemy("LVL - 1 Green Slime","green_slime", 10, 1, 1)
		next_scene = "Lowest_Level_Slime_Dungeon_1_4"
		
	if dungeon_lvl == 4:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 4"
		PreBattleData.desciption_txt = "You have entered Slime Dungeon 1 - 4"
		PostBattleData.XP = 40
		Enemy1Data.Create_Enemy("LVL - 2 Green Slime","green_slime", 15, 1, 2)
		Enemy2Data.Create_Enemy("LVL - 1 Green Slime","green_slime", 10, 1, 1)
		next_scene = "Lowest_Level_Slime_Dungeon_1_5"
		
	if dungeon_lvl == 5:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 5"
		PreBattleData.desciption_txt = "You have entered Slime Dungeon 1 - 5"
		PostBattleData.XP = 50
		Enemy1Data.Create_Enemy("LVL - 3 Green Slime","green_slime", 25, 1, 2)
		next_scene = "Lowest_Level_Slime_Dungeon_1_6"
	
	if dungeon_lvl == 6:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 6"
		PreBattleData.desciption_txt = "You have entered Slime Dungeon 1 - 6"
		PostBattleData.XP = 60
		Enemy1Data.Create_Enemy("LVL - 1 Green Slime","green_slime", 10, 1, 1)
		Enemy2Data.Create_Enemy("LVL - 1 Green Slime","green_slime", 10, 1, 1)
		Enemy3Data.Create_Enemy("LVL - 1 Green Slime","green_slime", 10, 1, 1)
		next_scene = "Lowest_Level_Slime_Dungeon_1_7"
		
	if dungeon_lvl == 7:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 7"
		PreBattleData.desciption_txt = "You have entered Slime Dungeon 1 - 7"
		PostBattleData.XP = 70
		Enemy1Data.Create_Enemy("LVL - 2 Green Slime","green_slime", 15, 1, 2)
		Enemy2Data.Create_Enemy("LVL - 2 Green Slime","green_slime", 15, 1, 2)
		next_scene = "Lowest_Level_Slime_Dungeon_1_8"
		
	if dungeon_lvl == 8:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 8"
		PreBattleData.desciption_txt = "You have entered Slime Dungeon 1 - 8"
		PostBattleData.XP = 80
		Enemy1Data.Create_Enemy("LVL - 3 Green Slime","green_slime", 25, 1, 2)
		Enemy2Data.Create_Enemy("LVL - 1 Green Slime","green_slime", 10, 1, 1)
		next_scene = "Lowest_Level_Slime_Dungeon_1_9"
		
	if dungeon_lvl == 9:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 9"
		PreBattleData.desciption_txt = "You have entered Slime Dungeon 1 - 9"
		PostBattleData.XP = 90
		Enemy1Data.Create_Enemy("LVL - 3 Green Slime","green_slime", 25, 1, 2)
		Enemy2Data.Create_Enemy("LVL - 1 Green Slime","green_slime", 10, 1, 1)
		Enemy3Data.Create_Enemy("LVL - 1 Green Slime","green_slime", 10, 1, 1)
		next_scene = "Lowest_Level_Slime_Dungeon_1_10"
	
	if dungeon_lvl == 10:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 10"
		PreBattleData.desciption_txt = "You have entered Slime Dungeon 1 - 10"
		PostBattleData.XP = 100
		Enemy1Data.Create_Enemy("LVL - 1 Green Slime","green_slime", 10, 1, 1)
		Enemy2Data.Create_Enemy("LVL - 1 Green Slime","green_slime", 10, 1, 1)
		Enemy3Data.Create_Enemy("LVL - 1 Green Slime","green_slime", 10, 1, 1)
		Enemy4Data.Create_Enemy("LVL - 1 Green Slime","green_slime", 10, 1, 1)
		Enemy5Data.Create_Enemy("LVL - 1 Green Slime","green_slime", 10, 1, 1)
		next_scene = "Lowest_Level_Slime_Dungeon_1_11"
		
	if dungeon_lvl == 11:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 11"
		PreBattleData.desciption_txt = "You have entered Slime Dungeon 1 - 11"
		PostBattleData.XP = 110
		Enemy1Data.Create_Enemy("LVL - 1 Green Slime","green_slime", 10, 1, 1)
		Enemy2Data.Create_Enemy("LVL - 4 Green Slime","green_slime", 30, 1, 3)
		next_scene = "Lowest_Level_Slime_Dungeon_1_12"
		
	if dungeon_lvl == 12:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 12"
		PreBattleData.desciption_txt = "You have entered Slime Dungeon 1 - 12"
		PostBattleData.XP = 150
		Enemy1Data.Create_Enemy("LVL - 5 Green Slime","green_slime", 50, 1, 5)
		next_scene = "Lowest_Level_Slime_Dungeon_1_13"
		
	if dungeon_lvl == 13:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 13"
		PreBattleData.desciption_txt = "You have entered Slime Dungeon 1 - 13"
		PostBattleData.XP = 160
		Enemy1Data.Create_Enemy("LVL - 3 Green Slime","green_slime", 25, 1, 2)
		Enemy2Data.Create_Enemy("LVL - 4 Green Slime","green_slime", 30, 1, 3)
		Enemy3Data.Create_Enemy("LVL - 2 Green Slime","green_slime", 15, 1, 2)
		next_scene = "Lowest_Level_Slime_Dungeon_1_14"


func Next_lvl():
	if lowest_level_slime == 1:
		dungeon_lvl += 1
		Lowest_Level_Slime_Dungeon()

func Reset_Data():
	BattleMech.Set_Default()
	PreBattleData.Set_Default()
	Enemy1Data.Set_Default()
	Enemy2Data.Set_Default()
	Enemy3Data.Set_Default()
	Enemy4Data.Set_Default()
	Enemy5Data.Set_Default()
	dungeon_lvl = 0
	lowest_level_slime = 0
	next_scene = ""  # Empty string instead of "unknown"
