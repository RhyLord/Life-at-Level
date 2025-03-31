extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description

var stats_text =   "[center][b][font_size=24]== Player Stats ==[/font_size][/b][/center]\n\n" + \
					 "[color=red][b]HP (Health Points): " + str(Player.HP) + " / " + str(Player.MAX_HP) + "[/b][/color] - Determines how much damage the player can take.\n" + \
					 "[color=blue][b]MP (Mana Points): " + str(Player.MP) + " / " + str(Player.MAX_MP) + "[/b][/color] - Used for skills and abilities.\n" + \
					 "[color=purple][b]EN (Energy Points): " + str(Player.EN) + " / " + str(Player.MAX_EN) + "[/b][/color] - Consumed for physical actions like running, attacking, or dodging.\n\n" + \
					 
					 "[center][b][font_size=20]== Primary Stats ==[/font_size][/b][/center]\n\n" + \
					 "[b]STR (Strength): " + str(Player.STR) + "[/b] - Increases physical attack power.\n" + \
					 "[b]AGI (Agility): " + str(Player.AGI) + "[/b] - Affects movement speed and attack speed.\n" + \
					 "[b]INT (Intelligence): " + str(Player.INT) + "[/b] - Boosts magic power and mana pool.\n" + \
					 "[b]VIT (Vitality): " + str(Player.VIT) + "[/b] - Increases max HP.\n" + \
					 "[b]DEX (Dexterity): " + str(Player.DEX) + "[/b] - Improves accuracy, critical hits, and ranged attacks.\n" + \
					 "[b]END (Endurance): " + str(Player.END) + "[/b] - Increases Energy (EN) pool and physical defense.\n\n" + \
					 
					 "[center][b][font_size=20]== Additional Stats ==[/font_size][/b][/center]\n\n" + \
					 "[b]CHA (Charisma): " + str(Player.CHA) + "[/b] - Affects NPC interactions and persuasion.\n" + \
					 "[b]WIS (Wisdom): " + str(Player.WIS) + "[/b] - Increases mana pool and magical defense.\n" + \
					 "[b]LUK (Luck): " + str(Player.LUK) + "[/b] - Affects loot drops and random effects.\n" + \
					 "[b]CTRL (Control): " + str(Player.CTRL) + "[/b] - Governs precision in abilities, summoning, creation, and advanced magic."


func _ready():
	Level_txt.text = "Level : " + str(Player.LVL) 
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Player.XP) + " / " + str(Player.XP_NXT)
	desc.text = stats_text
