extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.Acid_Potion_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.Acid_Potion_XP) + " / " + str(Skill.Acid_Potion_NXT_XP)

	desc.text = "Acid Potion skill empowers your ability to use acid-based consumables for offensive capabilities. As the level increases, the acidic damage scales with your Dexterity. EXP gain is affected by DEX."
	Off_combat_desc.text = "Active: Consume Acid Potion to deal [" + str(100 + (10 * Skill.Acid_Potion_LVL) + (5 * Player.DEX)) + "] Acid DMG to a target."
	Combat_desc.text = "Passive: Gain EXP per use = [" + str((Player.DEX * 10) + (Skill.Acid_Potion_LVL * 20)) + "]. Acid Potions Owned [" + str(Inventory.Acid_potion) + "]."
