extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.Mana_Potion_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.Mana_Potion_XP) + " / " + str(Skill.Mana_Potion_NXT_XP)
	desc.text = "This skill reflects your ability to consume mana potions effectively. Higher skill levels allow you to restore more MP and improve mana efficiency in battle.Xp gain is affected by DEX"
	Off_combat_desc.text = "Active: Consume Minor Mana Potion to restore [" + str(500 + (10 * Skill.Potion_Proficiency_LVL) + (10 * Skill.Mana_Potion_LVL)) + "] MP."
	Combat_desc.text = "Passive: Gain EXP per use = [" + str((Player.DEX * 10) + (Skill.Mana_Potion_LVL * 10)) + "]. Minor Mana Potions Owned [" + str(Inventory.minor_mana_potion) + "]."
