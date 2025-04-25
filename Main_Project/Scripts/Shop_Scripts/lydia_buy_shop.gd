extends Control

@export var previous_scene = "res://Scenes/Shop/lydia_potion_shop.tscn"

@onready var coin_txt = $Coin
@onready var text1 = $ScrollContainer/VBoxContainer/Panel1/Text1
@onready var text2 = $ScrollContainer/VBoxContainer/Panel2/Text1
@onready var text3 = $ScrollContainer/VBoxContainer/Panel3/Text1


func _ready():
	update_text()

func update_text():
	coin_txt.text = "[right]Coins: " + str(Player.coin) + "[/right]"
	text1.text = "Owned[" + str(Inventory.minor_health_potion) + "]"
	text2.text = "Owned[" + str(Inventory.minor_mana_potion) + "]"
	text3.text = "Owned[" + str(Inventory.Acid_potion) + "]"


func _on_button_1_button_up():
	if Player.coin >= 50:
		GlobalButtonClick.button_click()
		Skill.Health_Potion_Unlocked = true
		Inventory.minor_health_potion += 1
		Player.coin -= 50
		update_text()
		
func _on_button_2_button_up():
	if Player.coin >= 300:
		GlobalButtonClick.button_click()
		Skill.Mana_Potion_Unlocked = true
		Inventory.minor_mana_potion += 1
		Player.coin -= 300
		update_text()

func _on_button_3_button_up():
	if Player.coin >= 90:
		GlobalButtonClick.button_click()
		Skill.Acid_Potion_Unlocked = true
		Inventory.Acid_potion += 1
		Player.coin -= 90
		update_text()


func _on_go_back_button_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(previous_scene)


