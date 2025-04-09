extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.Health_Potion_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.Health_Potion_XP) + " / " + str(Skill.Health_Potion_NXT_XP)
	desc.text = "This skill represents your expertise in using health potions effectively. As your level increases, the potency of the healing effect grows, making your survivability in combat much greater. EXP gain is affected by DEX "
	Off_combat_desc.text = "Active: Consume Minor Health Potion to heal [" + str(500 + (10 * Skill.Potion_Proficiency_LVL) + (10 * Skill.Health_Potion_LVL)) + "] HP."
	Combat_desc.text = "Passive: Gain EXP per use = [" + str((Player.DEX * 10) + (Skill.Health_Potion_LVL * 10)) + "]. Minor Health Potions Owned [" + str(Inventory.minor_health_potion) + "]."
