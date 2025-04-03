extends Control

@export var Previous_Scene = "res://Scenes/catalogue_menu.tscn"

@onready var Item1_TXT = $Item1/Item_TXT_1
@onready var Item1_TXT2 = $Item2/Item_TXT_1
@onready var Item1_TXT3 = $Item3/Item_TXT_1
@onready var Item1_TXT4 = $Item4/Item_TXT_1
@onready var Item1_TXT5 = $Item5/Item_TXT_1

func page_1():
	Item1_TXT.text = "[center]Green Slime\n" + str(Inventory.Green_Slime) + "[/center]"
	Item1_TXT2.text = "[center]Acidic Slime\n" + str(Inventory.Acid_Slime) + "[/center]"
	Item1_TXT3.text = "[center]Poisonous Slime\n" + str(Inventory.Poison_Slime) + "[/center]"
	Item1_TXT4.text = "[center]Lava Slime\n" + str(Inventory.Lava_Slime) + "[/center]"
	Item1_TXT5.text = "[center]Aqua Slime\n" + str(Inventory.Aqua_Slime) + "[/center]"
func _ready():
	page_1()

func _on_go_back_button_button_up():
	get_tree().change_scene_to_file(Previous_Scene)
