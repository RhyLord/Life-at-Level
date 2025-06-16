extends Node

var XP = 0
var VictoryText = "[center]You defeated all enemies. You gained " + str(XP) + " XP.[/center]"

var lowest_slime = 0
var lowest_undead = 0

var greenslime = 0
var acidslime = 0
var poisonslime = 0
var lavaslime = 0
var aquaslime = 0
var magicslime = 0
var metallicslime = 0
var ItemGainText = "You Got no Items"
var no_item = "You Got no Items"

func reset_data():
	XP = 0
	lowest_slime = 0
	
	
	ItemGainText = str(no_item)

func update():
	Player.XP += XP
	Player.level_up_player()
	Lowest_Level_Slime_1_10()
	Lowest_Level_Slime_11_30()
	Lowest_Level_Slime_31_40()
	Lowest_Level_Slime_41_50()
	Lowest_Level_Slime_51_60()
	
	Lowest_Level_Undead_1_10()
	Lowest_Level_Undead_11_20()
	
	VictoryText = "[center]You defeated all enemies. You gained " + str(XP) + " XP.[/center]"

	if metallicslime == 1:
		if Player.LUK > 10:
			Inventory.Metallic_Slime += 10
			ItemGainText = "You Got 10 Metallic Slime"
		elif Player.LUK > 5:
			Inventory.Metallic_Slime += 5
			ItemGainText = "You Got 5 Metallic Slime"
		else:
			Inventory.Metallic_Slime += 1
			ItemGainText = "You Got 1 Metallic Slime"

func Lowest_Level_Slime_1_10():
	if lowest_slime == 1:
		if Player.LUK > 30:
			Inventory.Green_Slime += 2
			ItemGainText = "You Got 2 Green Slime"
		elif Player.LUK > 15:
			Inventory.Green_Slime += 1
			ItemGainText = "You Got 1 Green Slime"
		else:
			ItemGainText = str(no_item)
	
	if lowest_slime == 2:
		if Player.LUK > 20:
			Inventory.Green_Slime += 3
			ItemGainText = "You Got 3 Green Slime"
		elif Player.LUK > 10:
			Inventory.Green_Slime += 2
			ItemGainText = "You Got 2 Green Slime"
		else:
			Inventory.Green_Slime += 1
			ItemGainText = "You Got 1 Green Slime"
			
	if lowest_slime == 3:
		if Player.LUK > 18:
			Inventory.Green_Slime += 3
			ItemGainText = "You Got 3 Green Slime"
		elif Player.LUK > 7:
			Inventory.Green_Slime += 2
			ItemGainText = "You Got 2 Green Slime"
		else:
			Inventory.Green_Slime += 1
			ItemGainText = "You Got 1 Green Slime"
	
	if lowest_slime == 4:
		if Player.LUK > 15:
			Inventory.Green_Slime += 2
			Inventory.Acid_Slime += 2
			ItemGainText = "You Got 2 Green Slime and 2 Acid Slime"
		elif Player.LUK > 7:
			Inventory.Green_Slime += 1
			Inventory.Acid_Slime += 1
			ItemGainText = "You Got 1 Green Slime and 1 Acid Slime"
		else:
			ItemGainText = str(no_item)
			
	if lowest_slime == 5:
		if Player.LUK > 15:
			Inventory.Green_Slime += 2
			Inventory.Poison_Slime += 2
			ItemGainText = "You Got 2 Green Slime and 2 Poisonous Slime"
		elif Player.LUK > 7:
			Inventory.Green_Slime += 1
			Inventory.Poison_Slime += 1
			ItemGainText = "You Got 1 Green Slime and 1 Poisonous Slime"
		else:
			ItemGainText = str(no_item)
	
	if lowest_slime == 6:
		if Player.LUK > 12:
			Inventory.Acid_Slime += 2
			Inventory.Poison_Slime += 2
			ItemGainText = "You Got 2 Acid Slime and 2 Poisonous Slime"
		elif Player.LUK > 4:
			Inventory.Acid_Slime += 1
			Inventory.Poison_Slime += 1
			ItemGainText = "You Got 1 Acid Slime and 1 Poisonous Slime"
		else:
			ItemGainText = str(no_item)
	
	if lowest_slime == 7:
		if Player.LUK > 12:
			Inventory.Aqua_Slime += 2
			Inventory.Green_Slime += 3
			ItemGainText = "You Got 2 Aqua Slime and 3 Green Slime, You also Unlocked Lowest Level Undead Dunegon."
		elif Player.LUK > 4:
			Inventory.Aqua_Slime += 1
			Inventory.Green_Slime += 2
			ItemGainText = "You Got 1 Aqua Slime and 2 Green Slime, You also Unlocked Lowest Level Undead Dunegon."
		else:
			Inventory.Green_Slime += 1
			ItemGainText = "You Got 1 Green Slime, You also Unlocked Lowest Level Undead Dunegon."

func Lowest_Level_Slime_11_30():
	if lowest_slime == 8:
		if Player.LUK > 10:
			Inventory.Green_Slime += 3
			ItemGainText = "You Got 3 Green Slime"
		elif Player.LUK > 4:
			Inventory.Green_Slime += 2
			ItemGainText = "You Got 2 Green Slime"
		else:
			Inventory.Green_Slime += 1
			ItemGainText = "You Got 1 Green Slime"
	
	if lowest_slime == 9:
		if Player.LUK > 10:
			Inventory.Lava_Slime += 2
			Inventory.Metallic_Slime += 1
			ItemGainText = "You Got 2 lava Slime and 1 Metallic Slime"
		elif Player.LUK > 4:
			Inventory.Lava_Slime += 1
			ItemGainText = "You Got 1 Lava Slime"
		else:
			ItemGainText = str(no_item)
	
	if lowest_slime == 10:
		if Player.LUK > 10:
			Inventory.Poison_Slime += 3
			ItemGainText = "You Got 3 Poisonous Slime"
		elif Player.LUK > 4:
			Inventory.Poison_Slime += 2
			ItemGainText = "You Got 2 Poisonous Slime"
		else:
			Inventory.Poison_Slime += 1
			ItemGainText = "You Got 1 Poisonous Slime"
			
	if lowest_slime == 11:
		if Player.LUK > 10:
			Inventory.Green_Slime += 5
			Inventory.Aqua_Slime += 2
			Inventory.Metallic_Slime += 1
			ItemGainText = "You Got 5 Green Slime, 2 Aqua Slime and 1 Metallic Slime."
		elif Player.LUK > 4:
			Inventory.Green_Slime += 3
			Inventory.Aqua_Slime += 1
			ItemGainText = "You Got 3 Green Slime and 1 Aqua Slime."
		else:
			Inventory.Green_Slime += 2
			ItemGainText = "You Got 2 Green Slime"
			
	if lowest_slime == 12:
		if Player.LUK > 10:
			Inventory.Acid_Slime += 5
			Inventory.Aqua_Slime += 2
			ItemGainText = "You Got 5 Acid Slime and 2 Aqua Slime."
		elif Player.LUK > 4:
			Inventory.Acid_Slime += 3
			Inventory.Aqua_Slime += 1
			ItemGainText = "You Got 3 Acid Slime and 1 Aqua Slime."
		else:
			Inventory.Acid_Slime += 2
			ItemGainText = "You Got 2 Acid Slime"
			
	if lowest_slime == 13:
		if Player.LUK > 10:
			Inventory.Green_Slime += 8
			Inventory.Magic_Slime += 1
			ItemGainText = "You Got 8 Green Slime and 1 Magic Slime."
		elif Player.LUK > 4:
			Inventory.Green_Slime += 5
			ItemGainText = "You Got 5 Green Slime."
		else:
			Inventory.Green_Slime += 3
			ItemGainText = "You Got 3 Green Slime"
	
	if lowest_slime == 14:
		if Player.LUK > 10:
			Inventory.Acid_Slime += 5
			Inventory.Poison_Slime += 5
			ItemGainText = "You Got 5 Acid Slime and 5 Poisonous Slime."
		elif Player.LUK > 4:
			Inventory.Acid_Slime += 3
			Inventory.Poison_Slime += 3
			ItemGainText = "You Got 3 Acid Slime and 3 Poisonous Slime."
		else:
			Inventory.Acid_Slime += 1
			Inventory.Poison_Slime += 1
			ItemGainText = "You Got 1 Acid Slime and 1 Poisonous Slime."
			
	if lowest_slime == 15:
		if Player.LUK > 10:
			Inventory.Acid_Slime += 2
			Inventory.Lava_Slime += 4
			ItemGainText = "You Got 2 Acid Slime and 4 Lava Slime."
		elif Player.LUK > 4:
			Inventory.Acid_Slime += 1
			Inventory.Lava_Slime += 2
			ItemGainText = "You Got 1 Acid Slime and 2 LavaSlime."
		else:
			Inventory.Lava_Slime += 1
			ItemGainText = "You Got 1 Lava Slime."
			
	if lowest_slime == 16:
		if Player.LUK >= 10:
			Inventory.Acid_Slime += 8
			Inventory.Metallic_Slime += 2
			ItemGainText = "You Got 8 Acid Slime and 2 Metallic Slime."
		elif Player.LUK > 4:
			Inventory.Acid_Slime += 5
			Inventory.Metallic_Slime += 1
			ItemGainText = "You Got 5 Acid Slime and 1 Metallic Slime."
		else:
			Inventory.Acid_Slime += 2
			ItemGainText = "You Got 2 Acid Slime."
			
	if lowest_slime == 17:
		if Player.LUK >= 10:
			Inventory.Green_Slime += 12
			Inventory.Magic_Slime += 2
			ItemGainText = "You Got 12 Green Slime and 2 Magic Slime."
		elif Player.LUK > 4:
			Inventory.Green_Slime  += 10
			Inventory.Magic_Slime += 1
			ItemGainText = "You Got 10 Green Slime and 1 Magic Slime."
		else:
			Inventory.Green_Slime += 5
			ItemGainText = "You Got 5 Green Slime."
			
	if lowest_slime == 18:
		if Player.LUK >= 10:
			Inventory.Poison_Slime += 8
			Inventory.Aqua_Slime += 5
			ItemGainText = "You Got 8 Poisonous Slime and 5 Aqua Slime."
		elif Player.LUK > 4:
			Inventory.Poison_Slime += 5
			Inventory.Aqua_Slime += 3
			ItemGainText = "You Got 5 Poisonous Slime and 3 Aqua Slime."
		else:
			Inventory.Poison_Slime += 3
			Inventory.Aqua_Slime += 1
			ItemGainText = "You Got 3 Poisonous Slime and 1 Aqua Slime."
			
	if lowest_slime == 19:
		if Player.LUK >= 10:
			Inventory.Lava_Slime += 10
			Inventory.Aqua_Slime += 10
			ItemGainText = "You Got 10 Lava Slime and 10 Aqua Slime."
		elif Player.LUK > 4:
			Inventory.Lava_Slime += 5
			Inventory.Aqua_Slime += 5
			ItemGainText = "You Got 5 lavaSlime and 5 Aqua Slime."
		else:
			Inventory.Lava_Slime += 3
			Inventory.Aqua_Slime += 3
			ItemGainText = "You Got 3 Lava Slime and 3 Aqua Slime."
	
	if lowest_slime == 20:
		if Player.LUK >= 10:
			Inventory.Metallic_Slime += 7
			ItemGainText = "You Got 7 Metallic Slime."
		elif Player.LUK > 4:
			Inventory.Metallic_Slime += 4
			ItemGainText = "You Got 4 Metallic Slime."
		else:
			Inventory.Metallic_Slime += 2
			ItemGainText = "You Got 2 Metallic Slime."
	
	if lowest_slime == 21:
		if Player.LUK >= 10:
			Inventory.Green_Slime += 25
			ItemGainText = "You Got 25 Green Slime."
		elif Player.LUK > 4:
			Inventory.Green_Slime  += 20
			ItemGainText = "You Got 20 Green Slime."
		else:
			Inventory.Green_Slime  += 10
			ItemGainText = "You Got 10 Green Slime."

func Lowest_Level_Slime_31_40():
	if lowest_slime == 22:
		if Player.LUK >= 10:
			Inventory.Metallic_Slime += 6
			Inventory.Acid_Slime += 12
			ItemGainText = "You Got 6 Metallic Slime and 12 Acid Slime."
		elif Player.LUK > 4:
			Inventory.Metallic_Slime += 3
			Inventory.Acid_Slime += 8
			ItemGainText = "You Got 3 Metallic Slime and 8 Acid Slime."
		else:
			Inventory.Metallic_Slime += 2
			Inventory.Acid_Slime += 5
			ItemGainText = "You Got 2 Metallic Slime and 5 Acid Slime."
			
	if lowest_slime == 23:
		if Player.LUK >= 10:
			Inventory.Metallic_Slime += 7
			Inventory.Lava_Slime += 10
			ItemGainText = "You Got 7 Metallic Slime and 10 Lava Slime."
		elif Player.LUK > 4:
			Inventory.Metallic_Slime += 4
			Inventory.Lava_Slime += 7
			ItemGainText = "You Got 4 Metallic Slime and 7 Lava Slime."
		else:
			Inventory.Metallic_Slime += 2
			Inventory.Lava_Slime += 3
			ItemGainText = "You Got 2 Metallic Slime and 3 Lava Slime."
			
	if lowest_slime == 24:
		if Player.LUK >= 10:
			Inventory.Aqua_Slime += 10
			Inventory.Magic_Slime += 5
			ItemGainText = "You Got 5 Magic Slime and 10 Aqua Slime."
		elif Player.LUK > 4:
			Inventory.Aqua_Slime += 5
			Inventory.Magic_Slime += 3
			ItemGainText = "You Got 3 Magic Slime and 5 Aqua Slime."
		else:
			Inventory.Aqua_Slime += 3
			Inventory.Magic_Slime += 1
			ItemGainText = "You Got 1 Magic Slime and 3 Aqua Slime."
			
	if lowest_slime == 25:
		if Player.LUK >= 10:
			Inventory.Poison_Slime += 15
			ItemGainText = "You Got 15 Poisonous Slime."
		elif Player.LUK > 4:
			Inventory.Poison_Slime += 10
			ItemGainText = "You Got 10 Poisonous Slime."
		else:
			Inventory.Poison_Slime += 5
			ItemGainText = "You Got 5 Poisonous Slime."
			
	if lowest_slime == 26:
		if Player.LUK >= 10:
			Inventory.Green_Slime += 50
			ItemGainText = "You Got 50 Green Slime."
		elif Player.LUK > 4:
			Inventory.Green_Slime  += 30
			ItemGainText = "You Got 30 Green Slime."
		else:
			Inventory.Green_Slime  += 20
			ItemGainText = "You Got 20 Green Slime."
			
	if lowest_slime == 27:
		if Player.LUK >= 10:
			Inventory.Aqua_Slime += 20
			Inventory.Magic_Slime += 6
			ItemGainText = "You Got 6 Magic Slime and 20 Aqua Slime."
		elif Player.LUK > 4:
			Inventory.Aqua_Slime += 15
			Inventory.Magic_Slime += 4
			ItemGainText = "You Got 4 Magic Slime and 15 Aqua Slime."
		else:
			Inventory.Aqua_Slime += 10
			Inventory.Magic_Slime += 2
			ItemGainText = "You Got 2 Magic Slime and 10 Aqua Slime."
	
	if lowest_slime == 28:
		if Player.LUK >= 10:
			Inventory.Poison_Slime += 30
			ItemGainText = "You Got 30 Poisonous Slime."
		elif Player.LUK > 4:
			Inventory.Poison_Slime += 20
			ItemGainText = "You Got 20 Poisonous Slime."
		else:
			Inventory.Poison_Slime += 10
			ItemGainText = "You Got 10 Poisonous Slime."
			
	if lowest_slime == 29:
		if Player.LUK >= 10:
			Inventory.Aqua_Slime += 25
			ItemGainText = "You Got 25 Aqua Slime."
		elif Player.LUK > 4:
			Inventory.Aqua_Slime  += 20
			ItemGainText = "You Got 20 Aqua Slime."
		else:
			Inventory.Aqua_Slime  += 10
			ItemGainText = "You Got 10 Aqua Slime."

func Lowest_Level_Slime_41_50():
	if lowest_slime == 30:
		if Player.LUK >= 10:
			Inventory.Green_Slime += 60
			ItemGainText = "You Got 60 Green Slime."
		elif Player.LUK > 4:
			Inventory.Green_Slime  += 40
			ItemGainText = "You Got 40 Green Slime."
		else:
			Inventory.Green_Slime  += 25
			ItemGainText = "You Got 25 Green Slime."
			
	if lowest_slime == 31:
		if Player.LUK >= 10:
			Inventory.Magic_Slime += 12
			ItemGainText = "You Got 12 Magic Slime."
		elif Player.LUK > 4:
			Inventory.Magic_Slime  += 10
			ItemGainText = "You Got 10 Magic Slime."
		else:
			Inventory.Magic_Slime  += 5
			ItemGainText = "You Got 5 Magic Slime."
	
	if lowest_slime == 32:
		if Player.LUK >= 10:
			Inventory.Lava_Slime += 15
			ItemGainText = "You Got 15 Lava Slime."
		elif Player.LUK > 4:
			Inventory.Lava_Slime  += 10
			ItemGainText = "You Got 10 Lava Slime."
		else:
			Inventory.Lava_Slime  += 5
			ItemGainText = "You Got 5 Lava Slime."
			
	if lowest_slime == 33:
		if Player.LUK >= 10:
			Inventory.Lava_Slime += 15
			Inventory.Green_Slime += 25
			ItemGainText = "You Got 15 Lava Slime and 25 Green Slime."
		elif Player.LUK > 4:
			Inventory.Lava_Slime  += 10
			Inventory.Green_Slime += 15
			ItemGainText = "You Got 10 Lava Slime and 15 Green Slime."
		else:
			Inventory.Lava_Slime  += 5
			Inventory.Green_Slime += 10
			ItemGainText = "You Got 5 Lava Slime and 10 Green Slime."
			
	if lowest_slime == 34:
		if Player.LUK >= 10:
			Inventory.Acid_Slime += 30
			ItemGainText = "You Got 30 Acid Slime."
		elif Player.LUK > 4:
			Inventory.Acid_Slime  += 20
			ItemGainText = "You Got 20 Acid Slime."
		else:
			Inventory.Acid_Slime  += 10
			ItemGainText = "You Got 10 Acid Slime."
	
	if lowest_slime == 35:
		if Player.LUK >= 10:
			Inventory.Metallic_Slime += 20
			Inventory.Green_Slime += 25
			ItemGainText = "You Got 20 Metallic Slime and 25 Green Slime."
		elif Player.LUK > 4:
			Inventory.Metallic_Slime  += 12
			Inventory.Green_Slime += 15
			ItemGainText = "You Got 12 Metallic Slime and 15 Green Slime."
		else:
			Inventory.Metallic_Slime  += 6
			Inventory.Green_Slime += 10
			ItemGainText = "You Got 6 Metallic Slime and 10 Green Slime."
	
	if lowest_slime == 36:
		if Player.LUK >= 10:
			Inventory.Green_Slime += 90
			ItemGainText = "You Got 90 Green Slime."
		elif Player.LUK > 4:
			Inventory.Green_Slime  += 50
			ItemGainText = "You Got 50 Green Slime."
		else:
			Inventory.Green_Slime  += 35
			ItemGainText = "You Got 35 Green Slime."
	
	if lowest_slime == 37:
		if Player.LUK >= 10:
			Inventory.Aqua_Slime += 40
			Inventory.Green_Slime += 50
			ItemGainText = "You Got 40 Aqua Slime and 50 Green Slime."
		elif Player.LUK > 4:
			Inventory.Aqua_Slime  += 20
			Inventory.Green_Slime += 25
			ItemGainText = "You Got 20 Aqua Slime and 25 Green Slime."
		else:
			Inventory.Aqua_Slime  += 10
			Inventory.Green_Slime += 15
			ItemGainText = "You Got 10 Aqua Slime and 15 Green Slime."
	
	if lowest_slime == 38:
		if Player.LUK >= 10:
			Inventory.Green_Slime += 100
			ItemGainText = "You Got 100 Green Slime."
		elif Player.LUK > 4:
			Inventory.Green_Slime  += 75
			ItemGainText = "You Got 75 Green Slime."
		else:
			Inventory.Green_Slime  += 50
			ItemGainText = "You Got 50 Green Slime."

func Lowest_Level_Slime_51_60():
	if lowest_slime == 39:
		if Player.LUK >= 10:
			Inventory.Metallic_Slime += 23
			ItemGainText = "You Got 23 Metallic Slime."
		elif Player.LUK > 4:
			Inventory.Metallic_Slime  += 16
			ItemGainText = "You Got 16 Metallic Slime."
		else:
			Inventory.Metallic_Slime  += 8
			ItemGainText = "You Got 8 Metallic Slime."
		
	if lowest_slime == 40:
		if Player.LUK >= 10:
			Inventory.Poison_Slime += 35
			ItemGainText = "You Got 35 Poisonous Slime."
		elif Player.LUK > 4:
			Inventory.Poison_Slime += 20
			ItemGainText = "You Got 20 Poisonous Slime."
		else:
			Inventory.Poison_Slime += 12
			ItemGainText = "You Got 12 Poisonous Slime."
	
	if lowest_slime == 41:
		if Player.LUK >= 10:
			Inventory.Lava_Slime += 30
			ItemGainText = "You Got 30 Lava Slime."
		elif Player.LUK > 4:
			Inventory.Lava_Slime += 20
			ItemGainText = "You Got 20 Lava Slime."
		else:
			Inventory.Lava_Slime += 10
			ItemGainText = "You Got 10 Lava Slime."
		
	if lowest_slime == 42:
		if Player.LUK >= 10:
			Inventory.Acid_Slime += 70
			ItemGainText = "You Got 70 Acid Slime."
		elif Player.LUK > 4:
			Inventory.Acid_Slime += 50
			ItemGainText = "You Got 50 Acid Slime."
		else:
			Inventory.Acid_Slime += 25
			ItemGainText = "You Got 25 Acid Slime."
	
	if lowest_slime == 43:
		if Player.LUK >= 10:
			Inventory.Poison_Slime += 70
			ItemGainText = "You Got 70 Poisonous Slime."
		elif Player.LUK > 4:
			Inventory.Poison_Slime += 50
			ItemGainText = "You Got 50 Poisonous Slime."
		else:
			Inventory.Poison_Slime += 25
			ItemGainText = "You Got 25 Poisonous Slime."
			
	if lowest_slime == 44:
		if Player.LUK >= 10:
			Inventory.Poison_Slime += 30
			Inventory.Acid_Slime += 30
			Inventory.Lava_Slime += 30
			Inventory.Magic_Slime += 20
			ItemGainText = "You Got 30 Poisonous, Acid, Lava Slime and 20 Magic Slime."
		elif Player.LUK > 4:
			Inventory.Poison_Slime += 20
			Inventory.Acid_Slime += 20
			Inventory.Lava_Slime += 20
			Inventory.Magic_Slime += 10
			ItemGainText = "You Got 20 Poisonous, Acid, Lava Slime and 10 Magic Slime."
		else:
			Inventory.Poison_Slime += 8
			Inventory.Acid_Slime += 8
			Inventory.Lava_Slime += 8
			Inventory.Magic_Slime += 5
			ItemGainText = "You Got 8 Poisonous, Acid, Lava Slime and 5 Magic Slime."
	
	if lowest_slime == 45:
		if Player.LUK >= 10:
			Inventory.Poison_Slime += 70
			Inventory.Acid_Slime += 70
			ItemGainText = "You Got 70 Poisonous and Acid Slime."
		elif Player.LUK > 4:
			Inventory.Poison_Slime += 50
			Inventory.Acid_Slime += 50
			ItemGainText = "You Got 50 Poisonous and Acid Slime."
		else:
			Inventory.Poison_Slime += 25
			Inventory.Acid_Slime += 25
			ItemGainText = "You Got 25 Poisonous and Acid Slime."
			
	if lowest_slime == 46:
		if Player.LUK >= 10:
			Inventory.Lava_Slime += 70
			Inventory.Aqua_Slime += 70
			ItemGainText = "You Got 70 Lava and Aqua Slime."
		elif Player.LUK > 4:
			Inventory.Lava_Slime += 50
			Inventory.Aqua_Slime += 50
			ItemGainText = "You Got 50 Lava and Aqua Slime."
		else:
			Inventory.Lava_Slime += 25
			Inventory.Aqua_Slime += 25
			ItemGainText = "You Got 25 Lava and Aqua Slime."
			
	if lowest_slime == 47:
		if Player.LUK >= 10:
			Inventory.Metallic_Slime += 75
			ItemGainText = "You Got 75 Metallic Slime."
		elif Player.LUK > 4:
			Inventory.Metallic_Slime  += 50
			ItemGainText = "You Got 50 Metallic Slime."
		else:
			Inventory.Metallic_Slime  += 25
			ItemGainText = "You Got 25 Metallic Slime."

func Lowest_Level_Undead_1_10():
	
	if lowest_undead == 1:
		if Player.LUK > 30:
			Inventory.Skull += 1
			ItemGainText = "You Got [color=#cccccc]1 Skull[/color]"
		else:
			ItemGainText = str(no_item)
			
	if lowest_undead == 2:
		if Player.LUK > 20:
			Inventory.Skull += 1
			ItemGainText = "You Got [color=#cccccc]1 Skull[/color]"
		else:
			ItemGainText = str(no_item)
			
	if lowest_undead == 3:
		if Player.LUK > 10:
			Inventory.Skull += 1
			ItemGainText = "You Got [color=#cccccc]1 Skull[/color]"
		else:
			ItemGainText = str(no_item)
	
	if lowest_undead == 4:
		if Player.LUK > 40:
			Inventory.Skull += 3
			ItemGainText = "You Got [color=#cccccc]3 Skull[/color]"
		elif Player.LUK > 19:
			Inventory.Skull += 2
			ItemGainText = "You Got [color=#cccccc]2 Skull[/color]"
		elif Player.LUK > 11:
			Inventory.Skull += 1
			ItemGainText = "You Got [color=#cccccc]1 Skull[/color]"
		else:
			ItemGainText = str(no_item)
			
	if lowest_undead == 5:
		if Player.LUK > 17:
			Inventory.Skull += 2
			ItemGainText = "You Got [color=#cccccc]2 Skull[/color]"
		if Player.LUK > 8:
			Inventory.Skull += 1
			ItemGainText = "You Got [color=#cccccc]1 Skull[/color]"
		else:
			ItemGainText = str(no_item)
	
	if lowest_undead == 6:
		if Player.LUK > 7:
			Inventory.Bone += 1
			ItemGainText = "You Got [color=#cccccc]1 Bone[/color]"
		else:
			ItemGainText = str(no_item)
	
	if lowest_undead == 7:
		if Player.LUK > 5:
			Inventory.Skull += 1
			ItemGainText = "You Got [color=#cccccc]1 Skull[/color]"
		else:
			ItemGainText = str(no_item)
			
	if lowest_undead == 8:
		if Player.LUK > 30:
			Inventory.Skull += 4
			ItemGainText = "You Got [color=#cccccc]4 Skull[/color]"
		elif Player.LUK > 20:
			Inventory.Skull += 3
			ItemGainText = "You Got [color=#cccccc]3 Skull[/color]"
		elif Player.LUK > 10:
			Inventory.Skull += 2
			ItemGainText = "You Got [color=#cccccc]2 Skull[/color]"
		elif Player.LUK > 5:
			Inventory.Skull += 1
			ItemGainText = "You Got [color=#cccccc]1 Skull[/color]"
		else:
			ItemGainText = str(no_item)
	
	if lowest_undead == 9:
		if Player.LUK > 21:
			Inventory.Skull += 4
			ItemGainText = "You Got [color=#cccccc]4 Skull[/color]"
		elif Player.LUK > 14:
			Inventory.Skull += 3
			ItemGainText = "You Got [color=#cccccc]3 Skull[/color]"
		elif Player.LUK > 8:
			Inventory.Skull += 2
			ItemGainText = "You Got [color=#cccccc]2 Skull[/color]"
		elif Player.LUK > 2:
			Inventory.Skull += 1
			ItemGainText = "You Got [color=#cccccc]1 Skull[/color]"
		else:
			ItemGainText = str(no_item)
	
	if lowest_undead == 10:
		if Player.LUK > 5:
			Inventory.Skull += 2
			ItemGainText = "You Got [color=#cccccc]2 Skull[/color]"
		else:
			Inventory.Skull += 1
			ItemGainText = "You Got [color=#cccccc]1 Skull[/color]"

func Lowest_Level_Undead_11_20():
	
	if lowest_undead == 11:
		if Player.LUK > 10:
			Inventory.Bone += 5
			ItemGainText = "You Got [color=#cccccc]5 Bones[/color]"
		elif Player.LUK > 5:
			Inventory.Bone += 2
			ItemGainText = "You Got [color=#cccccc]2 Bones[/color]"
		elif Player.LUK > 3:
			Inventory.Bone += 1
			ItemGainText = "You Got [color=#cccccc]1 Bone[/color]"
		else:
			ItemGainText = str(no_item)
	
	if lowest_undead == 12:
		if Player.LUK > 10:
			Inventory.Bone += 8
			ItemGainText = "You Got [color=#cccccc]8 Bones[/color]"
		elif Player.LUK > 5:
			Inventory.Skull += 4
			ItemGainText = "You Got [color=#cccccc]4 Bones[/color]"
		else:
			Inventory.Bone += 1
			ItemGainText = "You Got [color=#cccccc]1 Bone[/color]"
