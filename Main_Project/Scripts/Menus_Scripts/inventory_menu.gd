extends Control

@onready var Previous_Scene = "res://Scenes/Menus/catalogue_menu.tscn"

@onready var Coin_TXT = $Coin

@onready var text1 = $ScrollContainer/VBoxContainer/Panel1/Text1
@onready var text2 = $ScrollContainer/VBoxContainer/Panel2/Text1
@onready var text3 = $ScrollContainer/VBoxContainer/Panel3/Text1
@onready var text4 = $ScrollContainer/VBoxContainer/Panel4/Text1
@onready var text5 = $ScrollContainer/VBoxContainer/Panel5/Text1
@onready var text6 = $ScrollContainer/VBoxContainer/Panel6/Text1
@onready var text7 = $ScrollContainer/VBoxContainer/Panel7/Text1


#Dev func Delete before export
func _process(delta):
	if Input.is_key_pressed(KEY_Q):
		Player.coin += 10
		Coin_TXT.text = "[right]Coins: " + str(Player.coin) + "[/right]"


func page_1():
	Coin_TXT.text = "[right]Coins: " + str(Player.coin) + "[/right]"
	
	text1.text = "Owned[" + str(Inventory.Green_Slime) + "]"
	text2.text = "Owned[" + str(Inventory.Acid_Slime) + "]"
	text3.text = "Owned[" + str(Inventory.Poison_Slime) + "]"
	text4.text = "Owned[" + str(Inventory.Lava_Slime) + "]"
	text5.text = "Owned[" + str(Inventory.Aqua_Slime) + "]"
	text6.text = "Owned[" + str(Inventory.Magic_Slime) + "]"
	text7.text = "Owned[" + str(Inventory.Metallic_Slime) + "]"
	
	
	
func _ready():
	page_1()

func _on_go_back_button_button_up():
	get_tree().change_scene_to_file(Previous_Scene)
