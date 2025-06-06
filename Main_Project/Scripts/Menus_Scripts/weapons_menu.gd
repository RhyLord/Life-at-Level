extends Control

@onready var Previous_Scene = "res://Scenes/Menus/catalogue_menu.tscn"

@onready var Coin_TXT = $Coin

@onready var text1 = $ScrollContainer/VBoxContainer/Panel1/Text1

@onready var button1 = $ScrollContainer/VBoxContainer/Panel1/Button1

func page_1():
	Coin_TXT.text = "[right]Coins: " + str(Player.coin) + "[/right]"
	
	text1.text = "Owned[" + str(Inventory.Wooden_Sword) + "]"
	
	if Player.Weapon == "Wooden_Sword":
		button1.text = "Unequip"
	elif Inventory.Wooden_Sword > 0:
		button1.text = "Equip"
	else:
		button1.text = "Unavailable"


func _ready():
	page_1()

func _on_go_back_button_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Previous_Scene)


func _on_button_1_button_up():
	GlobalButtonClick.button_click()
	if Player.Weapon == "Wooden_Sword":
		Inventory.Wooden_Sword += 1
		Player.Weapon_Type = "None"
		Player.SWORD_DMG = 0
		Player.Weapon = "None"
		page_1()
	elif Inventory.Wooden_Sword > 0:
		Player.Weapon = "Wooden_Sword"
		Player.Weapon_Type = "Sword"
		Player.SWORD_DMG = 5
		Inventory.Wooden_Sword -= 1
		page_1()
