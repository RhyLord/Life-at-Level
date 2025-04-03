extends Node

var XP = 0
var VictoryText = "[center]You defeated all enemies. You gained " + str(XP) + " XP.[/center]"
var greenslime = 0
var acidslime = 0
var poisonslime = 0
var lavaslime = 0
var aquaslime = 0
var ItemGainText = "You Got no Items"
var no_item = "You Got no Items"

func reset_data():
	XP = 0
	greenslime = 0
	acidslime = 0
	poisonslime = 0
	lavaslime = 0
	aquaslime = 0
	ItemGainText = str(no_item)

func update():
	Player.XP += XP
	Player.level_up_player()
	green_slime()
	acid_slime()
	poison_slime()
	lava_slime()
	aqua_slime()
	VictoryText = "[center]You defeated all enemies. You gained " + str(XP) + " XP.[/center]"

func green_slime():
	if greenslime == 1:
		if Player.LUK > 50:
			Inventory.Green_Slime += 2
			ItemGainText = "You Got 2 Green Slime"
		elif Player.LUK > 20:
			Inventory.Green_Slime += 1
			ItemGainText = "You Got 1 Green Slime"
		else:
			ItemGainText = str(no_item)
			
	if greenslime == 2:
		if Player.LUK > 20:
			Inventory.Green_Slime += 2
			ItemGainText = "You Got 2 Green Slime"
		elif Player.LUK > 10:
			Inventory.Green_Slime += 1
			ItemGainText = "You Got 1 Green Slime"
		else:
			ItemGainText = str(no_item)
	
	if greenslime == 3:
		if Player.LUK > 20:
			Inventory.Green_Slime += 3
			ItemGainText = "You Got 3 Green Slime"
		elif Player.LUK > 10:
			Inventory.Green_Slime += 2
			ItemGainText = "You Got 2 Green Slime"
		else:
			Inventory.Green_Slime += 1
			ItemGainText = "You Got 1 Green Slime"
			
	if greenslime == 4:
		if Player.LUK > 10:
			Inventory.Green_Slime += 3
			ItemGainText = "You Got 3 Green Slime"
		elif Player.LUK > 5:
			Inventory.Green_Slime += 2
			ItemGainText = "You Got 2 Green Slime"
		else:
			Inventory.Green_Slime += 1
			ItemGainText = "You Got 1 Green Slime"
			
	if greenslime == 5:
		if Player.LUK > 5:
			Inventory.Green_Slime += 3
			ItemGainText = "You Got 3 Green Slime"
		elif Player.LUK > 2:
			Inventory.Green_Slime += 2
			ItemGainText = "You Got 2 Green Slime"
		else:
			Inventory.Green_Slime += 1
			ItemGainText = "You Got 1 Green Slime"
			
	if greenslime == 6:
		if Player.LUK > 10:
			Inventory.Green_Slime += 5
			ItemGainText = "You Got 5 Green Slime"
		elif Player.LUK > 5:
			Inventory.Green_Slime += 3
			ItemGainText = "You Got 3 Green Slime"
		else:
			Inventory.Green_Slime += 2
			ItemGainText = "You Got 2 Green Slime"
			
	if greenslime == 7:
		if Player.LUK > 8:
			Inventory.Green_Slime += 7
			ItemGainText = "You Got 7 Green Slime"
		elif Player.LUK > 5:
			Inventory.Green_Slime += 5
			ItemGainText = "You Got 5 Green Slime"
		else:
			Inventory.Green_Slime += 2
			ItemGainText = "You Got 2 Green Slime"
			
	if greenslime == 8:
		if Player.LUK > 10:
			Inventory.Green_Slime += 10
			ItemGainText = "You Got 10 Green Slime"
		elif Player.LUK > 5:
			Inventory.Green_Slime += 5
			ItemGainText = "You Got 5 Green Slime"
		else:
			Inventory.Green_Slime += 3
			ItemGainText = "You Got 3 Green Slime"
			
	if greenslime == 9:
		if Player.LUK > 9:
			Inventory.Green_Slime += 12
			ItemGainText = "You Got 12 Green Slime"
		elif Player.LUK > 5:
			Inventory.Green_Slime += 7
			ItemGainText = "You Got 7 Green Slime"
		else:
			Inventory.Green_Slime += 4
			ItemGainText = "You Got 4 Green Slime"
			
	if greenslime == 10:
		if Player.LUK > 10:
			Inventory.Green_Slime += 15
			ItemGainText = "You Got 15 Green Slime"
		elif Player.LUK > 5:
			Inventory.Green_Slime += 10
			ItemGainText = "You Got 10 Green Slime"
		else:
			Inventory.Green_Slime += 5
			ItemGainText = "You Got 5 Green Slime"
			
	if greenslime == 11:
		if Player.LUK > 10:
			Inventory.Green_Slime += 25
			ItemGainText = "You Got 25 Green Slime"
		elif Player.LUK > 5:
			Inventory.Green_Slime += 15
			ItemGainText = "You Got 15 Green Slime"
		else:
			Inventory.Green_Slime += 8
			ItemGainText = "You Got 8 Green Slime"
			
	if greenslime == 12:
		if Player.LUK > 10:
			Inventory.Green_Slime += 30
			ItemGainText = "You Got 30 Green Slime"
		elif Player.LUK > 5:
			Inventory.Green_Slime += 20
			ItemGainText = "You Got 20 Green Slime"
		else:
			Inventory.Green_Slime += 10
			ItemGainText = "You Got 10 Green Slime"


func acid_slime():
	if acidslime == 1:
		if Player.LUK > 50:
			Inventory.Acid_Slime += 2
			ItemGainText = "You Got 2 Acidic Slime"
		elif Player.LUK > 20:
			Inventory.Acid_Slime += 1
			ItemGainText = "You Got 1 Acidic Slime"
		else:
			ItemGainText = str(no_item)
			
	if acidslime == 2:
		if Player.LUK > 50:
			Inventory.Acid_Slime += 3
			ItemGainText = "You Got 3 Acidic Slime"
		elif Player.LUK > 20:
			Inventory.Acid_Slime += 2
			ItemGainText = "You Got 2 Acidic Slime"
		else:
			Inventory.Acid_Slime += 1
			ItemGainText = "You Got 1 Acidic Slime"
			
	if acidslime == 3:
		if Player.LUK > 25:
			Inventory.Acid_Slime += 5
			ItemGainText = "You Got 5 Acidic Slime"
		elif Player.LUK > 10:
			Inventory.Acid_Slime += 3
			ItemGainText = "You Got 3 Acidic Slime"
		else:
			Inventory.Acid_Slime += 2
			ItemGainText = "You Got 2 Acidic Slime"
			
	if acidslime == 4:
		if Player.LUK > 20:
			Inventory.Acid_Slime += 6
			ItemGainText = "You Got 6 Acidic Slime"
		elif Player.LUK > 5:
			Inventory.Acid_Slime += 4
			ItemGainText = "You Got 4 Acidic Slime"
		else:
			Inventory.Acid_Slime += 3
			ItemGainText = "You Got 3 Acidic Slime"
			
	if acidslime == 5:
		if Player.LUK > 10:
			Inventory.Acid_Slime += 6
			ItemGainText = "You Got 6 Acidic Slime"
		elif Player.LUK > 5:
			Inventory.Acid_Slime += 5
			ItemGainText = "You Got 5 Acidic Slime"
		else:
			Inventory.Acid_Slime += 4
			ItemGainText = "You Got 4 Acidic Slime"
			
	if acidslime == 6:
		if Player.LUK > 10:
			Inventory.Acid_Slime += 20
			ItemGainText = "You Got 20 Acidic Slime"
		elif Player.LUK > 5:
			Inventory.Acid_Slime += 10
			ItemGainText = "You Got 10 Acidic Slime"
		else:
			Inventory.Acid_Slime += 5
			ItemGainText = "You Got 5 Acidic Slime"

func poison_slime():
	if poisonslime == 1:
		if Player.LUK > 50:
			Inventory.Poison_Slime += 2
			ItemGainText = "You Got 2 Poison Slime"
		elif Player.LUK > 20:
			Inventory.Poison_Slime += 1
			ItemGainText = "You Got 1 Poison Slime"
		else:
			ItemGainText = str(no_item)
			
	if poisonslime == 2:
		if Player.LUK > 50:
			Inventory.Poison_Slime += 3
			ItemGainText = "You Got 3 Poison Slime"
		elif Player.LUK > 20:
			Inventory.Poison_Slime += 2
			ItemGainText = "You Got 2 Poison Slime"
		else:
			Inventory.Poison_Slime += 1
			ItemGainText = "You Got 1 Poison Slime"
			
	if poisonslime == 3:
		if Player.LUK > 25:
			Inventory.Poison_Slime += 5
			ItemGainText = "You Got 5 Poison Slime"
		elif Player.LUK > 10:
			Inventory.Poison_Slime += 3
			ItemGainText = "You Got 3 Poison Slime"
		else:
			Inventory.Poison_Slime += 2
			ItemGainText = "You Got 2 Poison Slime"
			
	if poisonslime == 4:
		if Player.LUK > 20:
			Inventory.Poison_Slime += 6
			ItemGainText = "You Got 6 Poison Slime"
		elif Player.LUK > 10:
			Inventory.Poison_Slime += 4
			ItemGainText = "You Got 4 Poison Slime"
		else:
			Inventory.Poison_Slime += 3
			ItemGainText = "You Got 3 Poison Slime"
			
	if poisonslime == 5:
		if Player.LUK > 10:
			Inventory.Poison_Slime += 6
			ItemGainText = "You Got 6 Poison Slime"
		elif Player.LUK > 5:
			Inventory.Poison_Slime += 5
			ItemGainText = "You Got 5 Poison Slime"
		else:
			Inventory.Poison_Slime += 4
			ItemGainText = "You Got 4 Poison Slime"
			
	if poisonslime == 6:
		if Player.LUK > 10:
			Inventory.Poison_Slime += 10
			ItemGainText = "You Got 10 Poison Slime"
		elif Player.LUK > 5:
			Inventory.Poison_Slime += 7
			ItemGainText = "You Got 7 Poison Slime"
		else:
			Inventory.Poison_Slime += 5
			ItemGainText = "You Got 5 Poison Slime"


func lava_slime():
	if lavaslime == 1:
		if Player.LUK > 50:
			Inventory.Lava_Slime += 2
			ItemGainText = "You Got 2 Lava Slime"
		elif Player.LUK > 20:
			Inventory.Lava_Slime += 1
			ItemGainText = "You Got 1 Lava Slime"
		else:
			ItemGainText = str(no_item)
	
	if lavaslime == 2:
		if Player.LUK > 10:
			Inventory.Lava_Slime += 5
			ItemGainText = "You Got 5 Lava Slime"
		elif Player.LUK > 5:
			Inventory.Lava_Slime += 2
			ItemGainText = "You Got 2 Lava Slime"
		else:
			Inventory.Lava_Slime += 1
			ItemGainText = "You Got 1 Lava Slime"
			
	if lavaslime == 3:
		if Player.LUK > 10:
			Inventory.Lava_Slime += 10
			ItemGainText = "You Got 10 Lava Slime"
		elif Player.LUK > 5:
			Inventory.Lava_Slime += 5
			ItemGainText = "You Got 5 Lava Slime"
		else:
			Inventory.Lava_Slime += 2
			ItemGainText = "You Got 2 Lava Slime"
	
func aqua_slime():
	if aquaslime == 1:
		if Player.LUK > 50:
			Inventory.Aqua_Slime += 2
			ItemGainText = "You Got 2 Aqua Slime"
		elif Player.LUK > 20:
			Inventory.Aqua_Slime += 1
			ItemGainText = "You Got 1 Aqua Slime"
		else:
			ItemGainText = str(no_item)
			
	if aquaslime == 2:
		if Player.LUK > 10:
			Inventory.Aqua_Slime += 3
			ItemGainText = "You Got 3 Aqua Slime"
		elif Player.LUK > 5:
			Inventory.Aqua_Slime += 2
			ItemGainText = "You Got 2 Aqua Slime"
		else:
			Inventory.Aqua_Slime += 1
			ItemGainText = "You Got 1 Aqua Slime"
	
	if aquaslime == 3:
		if Player.LUK > 10:
			Inventory.Aqua_Slime += 5
			ItemGainText = "You Got 5 Aqua Slime"
		elif Player.LUK > 5:
			Inventory.Aqua_Slime += 3
			ItemGainText = "You Got 3 Aqua Slime"
		else:
			Inventory.Aqua_Slime += 2
			ItemGainText = "You Got 2 Aqua Slime"
		
	if aquaslime == 4:
		if Player.LUK > 10:
			Inventory.Aqua_Slime += 10
			ItemGainText = "You Got 10 Aqua Slime"
		elif Player.LUK > 5:
			Inventory.Aqua_Slime += 5
			ItemGainText = "You Got 5 Aqua Slime"
		else:
			Inventory.Aqua_Slime += 3
			ItemGainText = "You Got 3 Aqua Slime"
	
	if aquaslime == 5:
		if Player.LUK > 10:
			Inventory.Aqua_Slime += 25
			ItemGainText = "You Got 25 Aqua Slime"
		elif Player.LUK > 5:
			Inventory.Aqua_Slime += 15
			ItemGainText = "You Got 15 Aqua Slime"
		else:
			Inventory.Aqua_Slime += 5
			ItemGainText = "You Got 5 Aqua Slime"
