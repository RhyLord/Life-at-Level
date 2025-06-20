extends Node

var dungeon_lvl = 0
var lowest_undead_dungeon_lvl = 0
var lowest_level_slime = 0
var lowest_level_undead = 0
var next_scene = ""

var lowest_level_slime_1_10 = true
var lowest_level_slime_11_20 = false
var lowest_level_slime_21_30 = false
var lowest_level_slime_31_40 = false
var lowest_level_slime_41_50 = false
var lowest_level_slime_51_60 = false
var lowest_level_slime_61_70 = false
var lowest_level_slime_71_80 = false
var lowest_level_slime_81_90 = false
var lowest_level_slime_91_100 = false

var lowest_level_undead_1_10 = false
var lowest_level_undead_11_20 = false
var lowest_level_undead_21_30 = false

func Lowest_Level_Slime_Dungeon():
	if dungeon_lvl == 1:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 1"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 1"
		PostBattleData.XP = 20
		PostBattleData.lowest_slime = 1
		Enemy1Data.Create_GreenSlime(1)
		next_scene = "Lowest_Level_Slime_Dungeon_1_2" 
	
	if dungeon_lvl == 2:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 2"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 2"
		PostBattleData.XP = 30
		PostBattleData.lowest_slime = 2
		Enemy1Data.Create_GreenSlime(1)
		Enemy2Data.Create_GreenSlime(1)
		next_scene = "Lowest_Level_Slime_Dungeon_1_3"
		
	if dungeon_lvl == 3:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 3"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 3"
		PostBattleData.XP = 40
		PostBattleData.lowest_slime = 2
		Enemy1Data.Create_GreenSlime(2)
		next_scene = "Lowest_Level_Slime_Dungeon_1_4"
		
	if dungeon_lvl == 4:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 4"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 4"
		PostBattleData.XP = 50
		PostBattleData.lowest_slime = 3
		Enemy1Data.Create_GreenSlime(1)
		Enemy2Data.Create_GreenSlime(2)
		next_scene = "Lowest_Level_Slime_Dungeon_1_5"
		
	if dungeon_lvl == 5:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 5"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 5"
		PostBattleData.XP = 60
		PostBattleData.lowest_slime = 3
		Enemy1Data.Create_GreenSlime(3)
		next_scene = "Lowest_Level_Slime_Dungeon_1_6"
	
	if dungeon_lvl == 6:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 6"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 6"
		PostBattleData.XP = 70
		PostBattleData.lowest_slime = 3
		Enemy1Data.Create_GreenSlime(1)
		Enemy2Data.Create_GreenSlime(1)
		Enemy3Data.Create_GreenSlime(1)
		next_scene = "Lowest_Level_Slime_Dungeon_1_7"
		
	if dungeon_lvl == 7:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 7"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 7"
		PostBattleData.XP = 80
		PostBattleData.lowest_slime = 4
		Enemy1Data.Create_AcidSlime(1)
		Enemy2Data.Create_GreenSlime(1)
		next_scene = "Lowest_Level_Slime_Dungeon_1_8"
		
	if dungeon_lvl == 8:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 8"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 8"
		PostBattleData.XP = 80
		PostBattleData.lowest_slime = 5
		Enemy1Data.Create_PoisonSlime(1)
		Enemy2Data.Create_GreenSlime(1)
		next_scene = "Lowest_Level_Slime_Dungeon_1_9"
		
	if dungeon_lvl == 9:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 9"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 9"
		PostBattleData.XP = 100
		PostBattleData.lowest_slime = 6
		Enemy1Data.Create_AcidSlime(2)
		Enemy2Data.Create_PoisonSlime(2)
		next_scene = "Lowest_Level_Slime_Dungeon_1_10"
	
	if dungeon_lvl == 10:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 10"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 10"
		PostBattleData.XP = 120
		PostBattleData.lowest_slime = 7
		lowest_level_slime_11_20 = true
		lowest_level_undead_1_10 = true
		Enemy1Data.Create_AquaSlime(1)
		Enemy2Data.Create_GreenSlime(3)
		next_scene = "Lowest_Level_Slime_Dungeon_1_11"
		
	if dungeon_lvl == 11:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 11"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 11"
		PostBattleData.XP = 130
		PostBattleData.lowest_slime = 8
		Enemy1Data.Create_GreenSlime(4)
		Enemy2Data.Create_GreenSlime(3)
		next_scene = "Lowest_Level_Slime_Dungeon_1_12"
		
	if dungeon_lvl == 12:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 12"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 12"
		PostBattleData.XP = 150
		PostBattleData.lowest_slime = 8
		Enemy1Data.Create_GreenSlime(5)
		Enemy2Data.Create_GreenSlime(3)
		Enemy3Data.Create_GreenSlime(3)
		next_scene = "Lowest_Level_Slime_Dungeon_1_13"
		
	if dungeon_lvl == 13:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 13"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 13"
		PostBattleData.XP = 180
		PostBattleData.lowest_slime = 9
		Enemy1Data.Create_LavaSlime(3)
		Enemy2Data.Create_MetallicSlime(1)
		next_scene = "Lowest_Level_Slime_Dungeon_1_14"

	if dungeon_lvl == 14:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 14"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 14"
		PostBattleData.XP = 200
		PostBattleData.lowest_slime = 10
		Enemy1Data.Create_PoisonSlime(3)
		Enemy2Data.Create_PoisonSlime(2)
		next_scene = "Lowest_Level_Slime_Dungeon_1_15"
		
	if dungeon_lvl == 15:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 15"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 15"
		PostBattleData.XP = 250
		PostBattleData.lowest_slime = 11
		Enemy1Data.Create_GreenSlime(6)
		Enemy2Data.Create_AquaSlime(2)
		Enemy3Data.Create_MetallicSlime(1)
		next_scene = "Lowest_Level_Slime_Dungeon_1_16"
		
	if dungeon_lvl == 16:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 16"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 16"
		PostBattleData.XP = 300
		PostBattleData.lowest_slime = 12
		Enemy1Data.Create_AcidSlime(3)
		Enemy2Data.Create_AcidSlime(3)
		Enemy3Data.Create_AquaSlime(2)
		next_scene = "Lowest_Level_Slime_Dungeon_1_17"
		
	if dungeon_lvl == 17:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 17"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 17"
		PostBattleData.XP = 400
		PostBattleData.lowest_slime = 13
		Enemy1Data.Create_GreenSlime(7)
		Enemy2Data.Create_MagicSlime(1)
		Enemy3Data.Create_GreenSlime(1)
		next_scene = "Lowest_Level_Slime_Dungeon_1_18"
		
	if dungeon_lvl == 18:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 18"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 18"
		PostBattleData.XP = 500
		PostBattleData.lowest_slime = 13
		Enemy1Data.Create_GreenSlime(6)
		Enemy2Data.Create_GreenSlime(5)
		Enemy3Data.Create_GreenSlime(4)
		next_scene = "Lowest_Level_Slime_Dungeon_1_19"
		
	if dungeon_lvl == 19:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 19"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 19"
		PostBattleData.XP = 600
		PostBattleData.lowest_slime = 14
		Enemy1Data.Create_AcidSlime(5)
		Enemy2Data.Create_PoisonSlime(5)
		next_scene = "Lowest_Level_Slime_Dungeon_1_20"
	
	if dungeon_lvl == 20:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 20"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 20"
		PostBattleData.XP = 700
		PostBattleData.lowest_slime = 14
		lowest_level_slime_21_30 = true
		Enemy1Data.Create_AcidSlime(7)
		Enemy2Data.Create_PoisonSlime(6)
		next_scene = "Lowest_Level_Slime_Dungeon_1_21"
		
	if dungeon_lvl == 21:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 21"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 21"
		PostBattleData.XP = 750
		PostBattleData.lowest_slime = 15
		Enemy1Data.Create_LavaSlime(4)
		Enemy2Data.Create_LavaSlime(3)
		Enemy3Data.Create_AcidSlime(2)
		next_scene = "Lowest_Level_Slime_Dungeon_1_22"
		
	if dungeon_lvl == 22:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 22"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 22"
		PostBattleData.XP = 900
		PostBattleData.lowest_slime = 16
		Enemy1Data.Create_AcidSlime(6)
		Enemy2Data.Create_MetallicSlime(2)
		Enemy3Data.Create_AcidSlime(4)
		next_scene = "Lowest_Level_Slime_Dungeon_1_23"
		
	if dungeon_lvl == 23:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 23"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 23"
		PostBattleData.XP = 1000
		PostBattleData.lowest_slime = 16
		Enemy1Data.Create_AcidSlime(7)
		Enemy2Data.Create_AcidSlime(5)
		Enemy3Data.Create_MetallicSlime(1)
		next_scene = "Lowest_Level_Slime_Dungeon_1_24"
		
	if dungeon_lvl == 24:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 24"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 24"
		PostBattleData.XP = 1250
		PostBattleData.lowest_slime = 17
		Enemy1Data.Create_MagicSlime(3)
		Enemy2Data.Create_GreenSlime(10)
		Enemy3Data.Create_GreenSlime(9)
		next_scene = "Lowest_Level_Slime_Dungeon_1_25"
		
	if dungeon_lvl == 25:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 25"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 25"
		PostBattleData.XP = 1500
		PostBattleData.lowest_slime = 18
		Enemy1Data.Create_PoisonSlime(8)
		Enemy2Data.Create_PoisonSlime(5)
		Enemy3Data.Create_AquaSlime(7)
		next_scene = "Lowest_Level_Slime_Dungeon_1_26"
		
	if dungeon_lvl == 26:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 26"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 26"
		PostBattleData.XP = 1750
		PostBattleData.lowest_slime = 18
		Enemy1Data.Create_AquaSlime(8)
		Enemy2Data.Create_PoisonSlime(6)
		Enemy3Data.Create_PoisonSlime(9)
		next_scene = "Lowest_Level_Slime_Dungeon_1_27"
		
	if dungeon_lvl == 27:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 27"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 27"
		PostBattleData.XP = 2000
		PostBattleData.lowest_slime = 19
		Enemy1Data.Create_LavaSlime(5)
		Enemy2Data.Create_LavaSlime(3)
		Enemy3Data.Create_AquaSlime(7)
		Enemy4Data.Create_AquaSlime(6)
		next_scene = "Lowest_Level_Slime_Dungeon_1_28"
		
	if dungeon_lvl == 28:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 28"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 28"
		PostBattleData.XP = 2500
		PostBattleData.lowest_slime = 20
		Enemy1Data.Create_MetallicSlime(6)
		Enemy2Data.Create_MetallicSlime(5)
		Enemy3Data.Create_MetallicSlime(4)
		next_scene = "Lowest_Level_Slime_Dungeon_1_29"
		
	if dungeon_lvl == 29:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 29"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 29"
		PostBattleData.XP = 2750
		PostBattleData.lowest_slime = 21
		Enemy1Data.Create_GreenSlime(10)
		Enemy2Data.Create_GreenSlime(10)
		Enemy3Data.Create_GreenSlime(10)
		next_scene = "Lowest_Level_Slime_Dungeon_1_30"
		
	if dungeon_lvl == 30:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 30"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 30"
		PostBattleData.XP = 3000
		PostBattleData.lowest_slime = 21
		Enemy1Data.Create_GreenSlime(50)
		lowest_level_slime_31_40 = true
		next_scene = "Lowest_Level_Slime_Dungeon_1_31"
		
	if dungeon_lvl == 31:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 31"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 31"
		PostBattleData.XP = 3500
		PostBattleData.lowest_slime = 21
		Enemy1Data.Create_GreenSlime(17)
		Enemy2Data.Create_GreenSlime(18)
		Enemy3Data.Create_GreenSlime(11)
		next_scene = "Lowest_Level_Slime_Dungeon_1_32"
		
	if dungeon_lvl == 32:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 32"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 32"
		PostBattleData.XP = 4000
		PostBattleData.lowest_slime = 22
		Enemy1Data.Create_AcidSlime(10)
		Enemy2Data.Create_AcidSlime(10)
		Enemy3Data.Create_MetallicSlime(7)
		next_scene = "Lowest_Level_Slime_Dungeon_1_33"
	
	if dungeon_lvl == 33:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 33"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 33"
		PostBattleData.XP = 5000
		PostBattleData.lowest_slime = 23
		Enemy1Data.Create_LavaSlime(7)
		Enemy2Data.Create_LavaSlime(6)
		Enemy3Data.Create_MetallicSlime(8)
		next_scene = "Lowest_Level_Slime_Dungeon_1_34"
		
	if dungeon_lvl == 34:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 34"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 34"
		PostBattleData.XP = 6000
		PostBattleData.lowest_slime = 24
		Enemy1Data.Create_MagicSlime(5)
		Enemy2Data.Create_MagicSlime(4)
		Enemy3Data.Create_AquaSlime(13)
		next_scene = "Lowest_Level_Slime_Dungeon_1_35"
	
	if dungeon_lvl == 35:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 35"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 35"
		PostBattleData.XP = 7000
		PostBattleData.lowest_slime = 25
		Enemy1Data.Create_PoisonSlime(16)
		Enemy2Data.Create_PoisonSlime(15)
		next_scene = "Lowest_Level_Slime_Dungeon_1_36"
		
	if dungeon_lvl == 36:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 36"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 36"
		PostBattleData.XP = 7500
		PostBattleData.lowest_slime = 26
		Enemy1Data.Create_GreenSlime(32)
		Enemy2Data.Create_GreenSlime(26)
		Enemy3Data.Create_GreenSlime(25)
		Enemy4Data.Create_GreenSlime(20)
		Enemy5Data.Create_GreenSlime(19)
		next_scene = "Lowest_Level_Slime_Dungeon_1_37"
		
	if dungeon_lvl == 37:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 37"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 37"
		PostBattleData.XP = 8000
		PostBattleData.lowest_slime = 27
		Enemy1Data.Create_MagicSlime(9)
		Enemy2Data.Create_AquaSlime(30)
		next_scene = "Lowest_Level_Slime_Dungeon_1_38"
	
	if dungeon_lvl == 38:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 38"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 38"
		PostBattleData.XP = 8500
		PostBattleData.lowest_slime = 28
		Enemy1Data.Create_PoisonSlime(20)
		Enemy2Data.Create_PoisonSlime(18)
		Enemy3Data.Create_PoisonSlime(15)
		next_scene = "Lowest_Level_Slime_Dungeon_1_39"
		
	if dungeon_lvl == 39:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 39"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 39"
		PostBattleData.XP = 9000
		PostBattleData.lowest_slime = 28
		Enemy1Data.Create_PoisonSlime(28)
		Enemy2Data.Create_PoisonSlime(26)
		Enemy3Data.Create_PoisonSlime(5)
		next_scene = "Lowest_Level_Slime_Dungeon_1_40"
		
	if dungeon_lvl == 40:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 40"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 40"
		PostBattleData.XP = 10000
		PostBattleData.lowest_slime = 29
		lowest_level_slime_41_50 = true
		Enemy1Data.Create_AquaSlime(50)
		next_scene = "Lowest_Level_Slime_Dungeon_1_41"
		
	if dungeon_lvl == 41:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 41"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 41"
		PostBattleData.XP = 12500
		PostBattleData.lowest_slime = 30
		Enemy1Data.Create_GreenSlime(45)
		Enemy2Data.Create_GreenSlime(41)
		Enemy3Data.Create_GreenSlime(39)
		next_scene = "Lowest_Level_Slime_Dungeon_1_42"
		
	if dungeon_lvl == 42:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 42"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 42"
		PostBattleData.XP = 15000
		PostBattleData.lowest_slime = 31
		Enemy1Data.Create_MagicSlime(10)
		Enemy2Data.Create_MagicSlime(8)
		Enemy3Data.Create_MagicSlime(5)
		next_scene = "Lowest_Level_Slime_Dungeon_1_43"
		
	if dungeon_lvl == 43:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 43"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 43"
		PostBattleData.XP = 16000
		PostBattleData.lowest_slime = 32
		Enemy1Data.Create_LavaSlime(10)
		Enemy2Data.Create_LavaSlime(9)
		Enemy3Data.Create_LavaSlime(8)
		next_scene = "Lowest_Level_Slime_Dungeon_1_44"
		
	if dungeon_lvl == 44:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 44"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 44"
		PostBattleData.XP = 17000
		PostBattleData.lowest_slime = 33
		Enemy1Data.Create_LavaSlime(10)
		Enemy2Data.Create_GreenSlime(40)
		Enemy3Data.Create_LavaSlime(10)
		next_scene = "Lowest_Level_Slime_Dungeon_1_45"
	
	if dungeon_lvl == 45:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 45"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 45"
		PostBattleData.XP = 17500
		PostBattleData.lowest_slime = 34
		Enemy1Data.Create_AcidSlime(22)
		Enemy2Data.Create_AcidSlime(21)
		Enemy3Data.Create_AcidSlime(17)
		next_scene = "Lowest_Level_Slime_Dungeon_1_46"
		
	if dungeon_lvl == 46:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 46"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 46"
		PostBattleData.XP = 18000
		PostBattleData.lowest_slime = 35
		Enemy1Data.Create_MetallicSlime(10)
		Enemy2Data.Create_MetallicSlime(8)
		Enemy3Data.Create_GreenSlime(45)
		next_scene = "Lowest_Level_Slime_Dungeon_1_47"
		
	if dungeon_lvl == 47:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 47"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 47"
		PostBattleData.XP = 19000
		PostBattleData.lowest_slime = 36
		Enemy1Data.Create_GreenSlime(50)
		Enemy2Data.Create_GreenSlime(49)
		Enemy3Data.Create_GreenSlime(46)
		Enemy4Data.Create_GreenSlime(41)
		next_scene = "Lowest_Level_Slime_Dungeon_1_48"
		
	if dungeon_lvl == 48:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 48"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 48"
		PostBattleData.XP = 20000
		PostBattleData.lowest_slime = 34
		Enemy1Data.Create_AcidSlime(25)
		Enemy2Data.Create_AcidSlime(25)
		next_scene = "Lowest_Level_Slime_Dungeon_1_49"
		
	if dungeon_lvl == 49:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 49"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 49"
		PostBattleData.XP = 22000
		PostBattleData.lowest_slime = 37
		Enemy1Data.Create_AquaSlime(50)
		Enemy2Data.Create_GreenSlime(60)
		next_scene = "Lowest_Level_Slime_Dungeon_1_50"
		
	if dungeon_lvl == 50:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 50"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 50"
		PostBattleData.XP = 22500
		PostBattleData.lowest_slime = 38
		lowest_level_slime_51_60 = true
		Enemy1Data.Create_GreenSlime(100)
		next_scene = "Lowest_Level_Slime_Dungeon_1_51"
	
	if dungeon_lvl == 51:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 51"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 51"
		PostBattleData.XP = 25000
		PostBattleData.lowest_slime = 39
		Enemy1Data.Create_MetallicSlime(20)
		Enemy2Data.Create_MetallicSlime(19)
		Enemy3Data.Create_MetallicSlime(18)
		next_scene = "Lowest_Level_Slime_Dungeon_1_52"
		
	if dungeon_lvl == 52:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 52"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 52"
		PostBattleData.XP = 30000
		PostBattleData.lowest_slime = 40
		Enemy1Data.Create_PoisonSlime(32)
		Enemy2Data.Create_PoisonSlime(27)
		Enemy3Data.Create_PoisonSlime(15)
		next_scene = "Lowest_Level_Slime_Dungeon_1_53"
		
	if dungeon_lvl == 53:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 53"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 53"
		PostBattleData.XP = 35000
		PostBattleData.lowest_slime = 41
		Enemy1Data.Create_LavaSlime(26)
		Enemy2Data.Create_LavaSlime(20)
		Enemy3Data.Create_LavaSlime(19)
		Enemy4Data.Create_LavaSlime(17)
		next_scene = "Lowest_Level_Slime_Dungeon_1_54"
		
	if dungeon_lvl == 54:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 54"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 54"
		PostBattleData.XP = 40000
		PostBattleData.lowest_slime = 42
		Enemy1Data.Create_AcidSlime(50)
		next_scene = "Lowest_Level_Slime_Dungeon_1_55"
		
	if dungeon_lvl == 55:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 55"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 55"
		PostBattleData.XP = 45000
		PostBattleData.lowest_slime = 43
		Enemy1Data.Create_PoisonSlime(50)
		next_scene = "Lowest_Level_Slime_Dungeon_1_56"
	
	if dungeon_lvl == 56:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 56"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 56"
		PostBattleData.XP = 50000
		PostBattleData.lowest_slime = 38
		Enemy1Data.Create_GreenSlime(85)
		Enemy2Data.Create_GreenSlime(80)
		Enemy3Data.Create_GreenSlime(75)
		Enemy4Data.Create_GreenSlime(70)
		next_scene = "Lowest_Level_Slime_Dungeon_1_57"
	
	if dungeon_lvl == 57:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 57"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 57"
		PostBattleData.XP = 60000
		PostBattleData.lowest_slime = 44
		Enemy1Data.Create_MagicSlime(25)
		Enemy2Data.Create_AcidSlime(40)
		Enemy3Data.Create_PoisonSlime(40)
		Enemy4Data.Create_LavaSlime(40)
		next_scene = "Lowest_Level_Slime_Dungeon_1_58"
	
	if dungeon_lvl == 58:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 58"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 58"
		PostBattleData.XP = 70000
		PostBattleData.lowest_slime = 45
		Enemy1Data.Create_AcidSlime(50)
		Enemy2Data.Create_PoisonSlime(50)
		next_scene = "Lowest_Level_Slime_Dungeon_1_59"
	
	if dungeon_lvl == 59:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 59"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 59"
		PostBattleData.XP = 75000
		PostBattleData.lowest_slime = 46
		Enemy1Data.Create_LavaSlime(50)
		Enemy2Data.Create_AquaSlime(100)
		next_scene = "Lowest_Level_Slime_Dungeon_1_60"
		
	if dungeon_lvl == 60:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 60"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 60"
		PostBattleData.XP = 80000
		PostBattleData.lowest_slime = 47
		lowest_level_slime_61_70 = true
		Enemy1Data.Create_MetallicSlime(70)
		next_scene = "Lowest_Level_Slime_Dungeon_1_61"
	
	if dungeon_lvl == 61:
		PreBattleData.bg_textures = "Plains"
		PreBattleData.Dungeon_start_name = "Slime Dungeon 1 - 61"
		PreBattleData.description_txt = "You have entered Slime Dungeon 1 - 61"
		PostBattleData.XP = 100000
		PostBattleData.lowest_slime = 47
		Enemy1Data.Create_AquaSlime(100)
		Enemy2Data.Create_MagicSlime(52)
		Enemy3Data.Create_LavaSlime(57)
		next_scene = "Lowest_Level_Slime_Dungeon_1_62"

func Lowest_Level_Undead_Dungeon():
	if lowest_undead_dungeon_lvl == 1:
		PreBattleData.bg_textures = "Undead"
		PreBattleData.Dungeon_start_name = "Undead Dungeon 1 - 1"
		PreBattleData.description_txt = "You have entered Undead Dungeon 1 - 1"
		PostBattleData.XP = 35
		PostBattleData.lowest_undead = 1
		Enemy1Data.Create_Skull(1)
		next_scene = "Lowest_Level_Undead_Dungeon_1_2" 
	
	if lowest_undead_dungeon_lvl == 2:
		PreBattleData.bg_textures = "Undead"
		PreBattleData.Dungeon_start_name = "Undead Dungeon 1 - 2"
		PreBattleData.description_txt = "You have entered Undead Dungeon 1 - 2"
		PostBattleData.XP = 48
		PostBattleData.lowest_undead = 2
		Enemy1Data.Create_Skull(2)
		next_scene = "Lowest_Level_Undead_Dungeon_1_3"
		
	if lowest_undead_dungeon_lvl == 3:
		PreBattleData.bg_textures = "Undead"
		PreBattleData.Dungeon_start_name = "Undead Dungeon 1 - 3"
		PreBattleData.description_txt = "You have entered Undead Dungeon 1 - 3"
		PostBattleData.XP = 65
		PostBattleData.lowest_undead = 3
		Enemy1Data.Create_Skull(3)
		next_scene = "Lowest_Level_Undead_Dungeon_1_4"
	
	if lowest_undead_dungeon_lvl == 4:
		PreBattleData.bg_textures = "Undead"
		PreBattleData.Dungeon_start_name = "Undead Dungeon 1 - 4"
		PreBattleData.description_txt = "You have entered Undead Dungeon 1 - 4"
		PostBattleData.XP = 98
		PostBattleData.lowest_undead = 4
		Enemy1Data.Create_Skull(1)
		Enemy2Data.Create_Skull(1)
		Enemy3Data.Create_Skull(1)
		next_scene = "Lowest_Level_Undead_Dungeon_1_5"
	
	if lowest_undead_dungeon_lvl == 5:
		PreBattleData.bg_textures = "Undead"
		PreBattleData.Dungeon_start_name = "Undead Dungeon 1 - 5"
		PreBattleData.description_txt = "You have entered Undead Dungeon 1 - 5"
		PostBattleData.XP = 144
		PostBattleData.lowest_undead = 5
		Enemy1Data.Create_Skull(3)
		Enemy2Data.Create_Skull(3)
		next_scene = "Lowest_Level_Undead_Dungeon_1_6"
	
	if lowest_undead_dungeon_lvl == 6:
		PreBattleData.bg_textures = "Undead"
		PreBattleData.Dungeon_start_name = "Undead Dungeon 1 - 6"
		PreBattleData.description_txt = "You have entered Undead Dungeon 1 - 6"
		PostBattleData.XP = 160
		PostBattleData.lowest_undead = 6
		Enemy1Data.Create_Skeleton(1)
		next_scene = "Lowest_Level_Undead_Dungeon_1_7"
		
	if lowest_undead_dungeon_lvl == 7:
		PreBattleData.bg_textures = "Undead"
		PreBattleData.Dungeon_start_name = "Undead Dungeon 1 - 7"
		PreBattleData.description_txt = "You have entered Undead Dungeon 1 - 7"
		PostBattleData.XP = 200
		PostBattleData.lowest_undead = 7
		Enemy1Data.Create_Skull(5)
		next_scene = "Lowest_Level_Undead_Dungeon_1_8"
		
	if lowest_undead_dungeon_lvl == 8:
		PreBattleData.bg_textures = "Undead"
		PreBattleData.Dungeon_start_name = "Undead Dungeon 1 - 8"
		PreBattleData.description_txt = "You have entered Undead Dungeon 1 - 8"
		PostBattleData.XP = 311
		PostBattleData.lowest_undead = 8
		Enemy1Data.Create_Skull(2)
		Enemy2Data.Create_Skull(2)
		Enemy3Data.Create_Skull(3)
		Enemy4Data.Create_Skull(1)
		next_scene = "Lowest_Level_Undead_Dungeon_1_9"
	
	if lowest_undead_dungeon_lvl == 9:
		PreBattleData.bg_textures = "Undead"
		PreBattleData.Dungeon_start_name = "Undead Dungeon 1 - 9"
		PreBattleData.description_txt = "You have entered Undead Dungeon 1 - 9"
		PostBattleData.XP = 499
		PostBattleData.lowest_undead = 9
		Enemy1Data.Create_Skull(4)
		Enemy2Data.Create_Skull(4)
		Enemy3Data.Create_Skull(1)
		Enemy4Data.Create_Skull(1)
		next_scene = "Lowest_Level_Undead_Dungeon_1_10"
	
	if lowest_undead_dungeon_lvl == 10:
		PreBattleData.bg_textures = "Undead"
		PreBattleData.Dungeon_start_name = "Undead Dungeon 1 - 10"
		PreBattleData.description_txt = "You have entered Undead Dungeon 1 - 10"
		PostBattleData.XP = 579
		PostBattleData.lowest_undead = 10
		Enemy1Data.Create_Skull(5)
		Enemy2Data.Create_Skull(5)
		lowest_level_undead_11_20 = true
		next_scene = "Lowest_Level_Undead_Dungeon_1_11"
	
	if lowest_undead_dungeon_lvl == 11:
		PreBattleData.bg_textures = "Undead"
		PreBattleData.Dungeon_start_name = "Undead Dungeon 1 - 11"
		PreBattleData.description_txt = "You have entered Undead Dungeon 1 - 11"
		PostBattleData.XP = 589
		PostBattleData.lowest_undead = 11
		Enemy1Data.Create_Skeleton(1)
		Enemy2Data.Create_Skeleton(1)
		next_scene = "Lowest_Level_Undead_Dungeon_1_12"
	
	if lowest_undead_dungeon_lvl == 12:
		PreBattleData.bg_textures = "Undead"
		PreBattleData.Dungeon_start_name = "Undead Dungeon 1 - 12"
		PreBattleData.description_txt = "You have entered Undead Dungeon 1 - 12"
		PostBattleData.XP = 700
		PostBattleData.lowest_undead = 12
		Enemy1Data.Create_Skeleton(2)
		Enemy2Data.Create_Skeleton(2)
		next_scene = "Lowest_Level_Undead_Dungeon_1_13"

func Next_lvl():
	if lowest_level_slime == 1:
		dungeon_lvl += 1
		Lowest_Level_Slime_Dungeon()
	
	elif lowest_level_undead == 1:
		lowest_undead_dungeon_lvl += 1
		Lowest_Level_Undead_Dungeon()
		

func Reset_Data():
	BattleMech.Set_Default()
	PreBattleData.Set_Default()
	Enemy1Data.Set_Default()
	Enemy2Data.Set_Default()
	Enemy3Data.Set_Default()
	Enemy4Data.Set_Default()
	Enemy5Data.Set_Default()
	dungeon_lvl = 0
	lowest_undead_dungeon_lvl = 0
	lowest_level_slime = 0
	lowest_level_undead = 0
	next_scene = "" 
