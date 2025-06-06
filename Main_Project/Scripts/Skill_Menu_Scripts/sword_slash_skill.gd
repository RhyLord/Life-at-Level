extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.Sword_Slash_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : [color=gold]" + str(Skill.Sword_Slash_XP) + " / " + str(Skill.Sword_Slash_NXT_XP) + "[/color]"
	
	desc.text = "Sword Slash is a disciplined combat skill focused on precise, devastating strikes. Combining physical strength with dexterity and blade control, it deals high sharp damage in battle."
	
	var exp_gain = (50 * Skill.Sword_Slash_LVL) + (5 * Player.STR) + (5 * Player.DEX) + (5 * Skill.Sword_Mastery_LVL)
	Off_combat_desc.text = "Active: Consumes [color=purple]20 EN[/color], and grants [color=cyan]" + str(exp_gain) + " Sword Slash EXP.[/color]"
	
	var dmg = (2 * Skill.Sword_Slash_LVL) + ceil(1.25 * Player.STR) + ceil(1.25 * Player.DEX) + (5 * Skill.Sword_Mastery_LVL) + Player.SWORD_DMG
	Combat_desc.text = "Active: [color=crimson]Sharp DMG " + str(dmg) + "[/color]."
