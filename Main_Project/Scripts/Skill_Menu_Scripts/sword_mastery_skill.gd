extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"

func _ready():
	Level_txt.text = "Level : " + str(Skill.Sword_Mastery_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : [color=gold]" + str(Skill.Sword_Mastery_XP) + " / " + str(Skill.Sword_Mastery_NXT_XP) + "[/color]"
	
	desc.text = "Sword Mastery represents your increasing efficiency and technique when wielding swords. As your mastery grows, you deal more consistent and powerful attacks."
	
	var dex_gain = 25 + (Player.DEX * Skill.Sword_Mastery_LVL)
	var str_gain = 25 + (Player.STR * Skill.Sword_Mastery_LVL)
	var total_gain = dex_gain + str_gain
	
	Off_combat_desc.text = "Passive: Gain EXP when using swords or training with them. [color=cyan]EXP Gain = " + str(total_gain) + ".[/color]"
