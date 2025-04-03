extends Control

@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.Physical_Endurance_LVL)
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.Physical_Endurance_XP) + " / " + str(Skill.Physical_Endurance_NXT_XP)
	desc.text = "Physical Endurance represents the body's ability to withstand and adapt to physical damage. By enduring hits, the body strengthens itself, improving resilience and toughness over time."
	Off_combat_desc.text = "Unlock Requirement: Requires END of minimum 10 to unlock. EXP is gained when taking physical damage."
	Combat_desc.text = "Passive: Grants [" + str((Skill.Physical_Endurance_LVL)-1) + "] PHYSICAL DEF. Total Physical Defense [" + str(Player.PHYSICAL_DEF) + "]."
