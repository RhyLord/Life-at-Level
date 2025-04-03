extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.Meditate_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.Meditate_XP) + " / " + str(Skill.Meditate_NXT_XP)
	desc.text = "Meditation is a practice of mental clarity and focus, allowing for deep introspection and spiritual growth. With each level, practitioners enhance their ability to recover and expand their mana."
	
	var en_cost = ceil(0.25 * Player.MAX_EN)
	var xp_gain = 50 + Player.MAX_MP
	
	Off_combat_desc.text = "Active: Consumes [" + str(en_cost) + "] EN, and grants [" + str(xp_gain) + "] Meditate EXP."
	Combat_desc.text = "Passive: Grants [+10] MAX MP per Level. Current MAX MP = " + str(Player.MAX_MP)
