extends Control


@onready var Level_txt = $Leveltxt
@onready var Nxt_Level_txt = $Nxt_Lvl_Txt
@onready var desc = $Description
@onready var Off_combat_desc = $"Off-Combat_Desc"
@onready var Combat_desc = $Combat_Desc

func _ready():
	Level_txt.text = "Level : " + str(Skill.Shower_LVL) 
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.Shower_XP) + " / " + str(Skill.Shower_NXT_XP)
	desc.text = "A refreshing shower rejuvenates both body and mind. It cleanses fatigue, restores vitality, and strengthens your natural resistance to water-based attacks."
	
	var off_combat_restore = ceil((100 * Skill.Shower_LVL) + (0.15 * Player.MAX_HP) + (0.15 * Player.MAX_MP) + (0.15 * Player.MAX_EN))
	var off_combat_xp = 50 + ceil((0.5 * Player.MAX_HP) * Skill.Shower_LVL)
	
	Off_combat_desc.text = "Off-Combat: Advances time, restores [" + str(off_combat_restore) + "] HP, MP, and EN. Grants [" + str(off_combat_xp) + "] Shower EXP."
	Combat_desc.text = "Passive: Grants [+1] WATER DEF per Level. Current WATER DEF = " + str(Player.WATER_DEF)
