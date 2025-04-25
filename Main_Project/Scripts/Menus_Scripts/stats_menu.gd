extends Control

@export var Stat_add_Scene = "res://Scenes/Menus/stat_allocation_menu.tscn"
@export var Catalogue_Scene = "res://Scenes/Menus/catalogue_menu.tscn"

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var alloc_desc = $Panel/Allocation_Text

var stats_text =   "[center][b][font_size=40] Player Stats [/font_size][/b][/center]\n\n" + \
					 "[color=red][b]HP (Health Points): " + str(Player.HP) + " / " + str(Player.MAX_HP) + "[/b][/color] - Keeps you alive.\n" + \
					 "[color=blue][b]MP (Mana Points): " + str(Player.MP) + " / " + str(Player.MAX_MP) + "[/b][/color] - Used for skills and abilities.\n" + \
					 "[color=purple][b]EN (Energy Points): " + str(Player.EN) + " / " + str(Player.MAX_EN) + "[/b][/color] - Consumed for physical actions.\n\n" + \
					 
					 "[center][b][font_size=30] Primary Stats [/font_size][/b][/center]\n\n" + \
					 "[b]STR (Strength): " + str(Player.STR) + "[/b] - Increases physical attack power.\n" + \
					 "[b]AGI (Agility): " + str(Player.AGI) + "[/b] - Affects speed based abilities.\n" + \
					 "[b]INT (Intelligence): " + str(Player.INT) + "[/b] - Boosts magic power and mana pool.\n" + \
					 "[b]VIT (Vitality): " + str(Player.VIT) + "[/b] - Increases max HP.\n" + \
					 "[b]DEX (Dexterity): " + str(Player.DEX) + "[/b] - Improves weapon handling and ranged attacks.\n" + \
					 "[b]END (Endurance): " + str(Player.END) + "[/b] - Increases Energy (EN) pool and physical defense.\n\n" + \
					 
					 "[center][b][font_size=25] Additional Stats [/font_size][/b][/center]\n\n" + \
					 "[b]CHA (Charisma): " + str(Player.CHA) + "[/b] - Affects NPC interactions and persuasion.\n" + \
					 "[b]WIS (Wisdom): " + str(Player.WIS) + "[/b] - Increases mana pool and magical defense.\n" + \
					 "[b]LUK (Luck): " + str(Player.LUK) + "[/b] - Affects loot drops and random effects.\n" + \
					 "[b]CTRL (Control): " + str(Player.CTRL) + "[/b] - Governs precision in abilities, summoning, creation, and advanced magic."

var alloc_text = "Available Allocation points [" + str(Player.Allocation_points) + "]."

func _ready():
	Level_txt.text = "Level : " + str(Player.LVL) 
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Player.XP) + " / " + str(Player.XP_NXT)
	desc.text = stats_text
	alloc_desc.text = alloc_text


func _on_allocation_button_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Stat_add_Scene)


func _on_go_back_button_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Catalogue_Scene)
