extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"


func _ready():
	Level_txt.text = "Level : " + str(Skill.Potion_Proficiency_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : [color=gold]" + str(Skill.Potion_Proficiency_XP) + " / " + str(Skill.Potion_Proficiency_NXT_XP) + "[/color]"
	desc.text = "Potion Proficiency reflects your growing knowledge in alchemy and potion usage. The more you craft or use potions, the better you get at maximizing their effect and mastering new concoctions.You gain more XP with higher DEX."
	Off_combat_desc.text = "Passive: Gain EXP when crafting or using potions. [color=cyan]EXP Gain = " + str(50 + (Player.DEX *  + Skill.Potion_Proficiency_LVL)) + ".[/color]"

