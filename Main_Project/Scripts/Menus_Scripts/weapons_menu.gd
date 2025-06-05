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
	else:
		if Inventory.Wooden_Sword > 0:
			button1.text = "Equip"


func _ready():
	page_1()

func _on_go_back_button_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Previous_Scene)
