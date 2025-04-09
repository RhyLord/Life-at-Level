extends Control

@export var previous_scene = "res://Scenes/Shop/lydia_potion_shop.tscn"

@onready var coin_txt = $Coin
@onready var text1 = $ScrollContainer/VBoxContainer/Panel1/Text1
@onready var text2 = $ScrollContainer/VBoxContainer/Panel2/Text1
@onready var text3 = $ScrollContainer/VBoxContainer/Panel3/Text1
@onready var text4 = $ScrollContainer/VBoxContainer/Panel4/Text1
@onready var text5 = $ScrollContainer/VBoxContainer/Panel5/Text1
@onready var text6 = $ScrollContainer/VBoxContainer/Panel6/Text1
@onready var text7 = $ScrollContainer/VBoxContainer/Panel7/Text1


func _ready():
	update_text()

func update_text():
	coin_txt.text = "[right]Coins: " + str(Player.coin) + "[/right]"
	text1.text = "Owned[" + str(Inventory.Green_Slime) + "]"
	text2.text = "Owned[" + str(Inventory.Acid_Slime) + "]"
	text3.text = "Owned[" + str(Inventory.Poison_Slime) + "]"
	text4.text = "Owned[" + str(Inventory.Lava_Slime) + "]"
	text5.text = "Owned[" + str(Inventory.Aqua_Slime) + "]"
	text6.text = "Owned[" + str(Inventory.Magic_Slime) + "]"
	text7.text = "Owned[" + str(Inventory.Metallic_Slime) + "]"

func _on_button_1_button_up():
	if Inventory.Green_Slime > 0:
		Player.coin += 1
		Inventory.Green_Slime -= 1
		update_text()

func _on_button_2_button_up():
	if Inventory.Green_Slime > 9:
		Player.coin += 10
		Inventory.Green_Slime -= 10
		update_text()

func _on_button_3_button_up():
	var amount = Inventory.Green_Slime
	Player.coin += (amount)
	Inventory.Green_Slime -= amount
	update_text()

func _on_go_back_button_button_up():
	get_tree().change_scene_to_file(previous_scene)

func _on_button_4_button_up():
	if Inventory.Acid_Slime > 0:
		Player.coin += 10
		Inventory.Acid_Slime -= 1
		update_text()

func _on_button_5_button_up():
	if Inventory.Acid_Slime > 9:
		Player.coin += 100
		Inventory.Acid_Slime -= 10
		update_text()

func _on_button_6_button_up():
	var amount = Inventory.Acid_Slime
	Player.coin += (amount * 10)
	Inventory.Acid_Slime -= amount
	update_text()

func _on_button_7_button_up():
	if Inventory.Poison_Slime > 0:
		Player.coin += 10
		Inventory.Poison_Slime -= 1
		update_text()

func _on_button_8_button_up():
	if Inventory.Poison_Slime > 9:
		Player.coin += 100
		Inventory.Poison_Slime -= 10
		update_text()

func _on_button_9_button_up():
	var amount = Inventory.Poison_Slime
	Player.coin += (amount * 10)
	Inventory.Poison_Slime -= amount
	update_text()

func _on_button_10_button_up():
	if Inventory.Lava_Slime > 0:
		Player.coin += 20
		Inventory.Lava_Slime -= 1
		update_text()

func _on_button_11_button_up():
	if Inventory.Lava_Slime > 9:
		Player.coin += 200
		Inventory.Lava_Slime -= 10
		update_text()

func _on_button_12_button_up():
	var amount = Inventory.Lava_Slime
	Player.coin += (amount * 20)
	Inventory.Lava_Slime -= amount
	update_text()

func _on_button_13_button_up():
	if Inventory.Aqua_Slime > 0:
		Player.coin += 10
		Inventory.Aqua_Slime -= 1
		update_text()

func _on_button_14_button_up():
	if Inventory.Aqua_Slime > 9:
		Player.coin += 100
		Inventory.Aqua_Slime -= 10
		update_text()

func _on_button_15_button_up():
	var amount = Inventory.Aqua_Slime
	Player.coin += (amount * 10)
	Inventory.Aqua_Slime -= amount
	update_text()

func _on_button_16_button_up():
	if Inventory.Magic_Slime > 0:
		Player.coin += 50
		Inventory.Magic_Slime -= 1
		update_text()

func _on_button_17_button_up():
	if Inventory.Magic_Slime > 9:
		Player.coin += 500
		Inventory.Magic_Slime -= 10
		update_text()

func _on_button_18_button_up():
	var amount = Inventory.Magic_Slime
	Player.coin += (amount * 50)
	Inventory.Magic_Slime -= amount
	update_text()

func _on_button_19_button_up():
	if Inventory.Metallic_Slime > 0:
		Player.coin += 50
		Inventory.Metallic_Slime -= 1
		update_text()

func _on_button_20_button_up():
	if Inventory.Metallic_Slime> 9:
		Player.coin += 500
		Inventory.Metallic_Slime -= 10
		update_text()

func _on_button_21_button_up():
	var amount = Inventory.Metallic_Slime
	Player.coin += (amount * 50)
	Inventory.Metallic_Slime -= amount
	update_text()
