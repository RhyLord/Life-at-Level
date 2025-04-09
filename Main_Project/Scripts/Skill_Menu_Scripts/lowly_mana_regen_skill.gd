extends Control


@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.Lowly_Mana_Regen_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.Lowly_Mana_Regen_XP) + " / " + str(Skill.Lowly_Mana_Regen_NXT_XP)
	desc.text = "A skill that restores a small amount of mana. Useful for recovering in low-energy situations. XP gain and MP is influenced by Wisdom (WIS)."

	var en_cost = 50
	var mp_restore = (5 * Skill.Lowly_Mana_Regen_LVL) + Player.WIS
	var xp_gain = (25 * Player.WIS) + (Skill.Lowly_Mana_Regen_LVL * 25)

	Off_combat_desc.text = "Active: Consume [" + str(en_cost) + "] EN to restore [" + str(mp_restore) + "] MP."
	Combat_desc.text = "Passive: Gain [" + str(xp_gain) + "] EXP on use. Current WIS = " + str(Player.WIS)
