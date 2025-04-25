extends Control


@onready var Level_txt = $Panel/lvl
@onready var Nxt_Level_txt = $Panel/Nxt_Lvl_Txt
@onready var desc = $Panel/desc_txt
@onready var Off_combat_desc = $Panel/Off_combat_desc
@onready var Combat_desc = $Panel/Combat_desc

func update():
	Level_txt.text = "Level : " + str(Skill.Shower_LVL) 
	Nxt_Level_txt.text = "Progress to Next Level : " + str(Skill.Shower_XP) + " / " + str(Skill.Shower_NXT_XP)
	desc.text = "A refreshing shower rejuvenates both body and mind. It cleanses fatigue, restores vitality, and strengthens your natural resistance to water-based attacks."
	
	var off_combat_restore = ceil((100 * Skill.Shower_LVL) + (0.15 * Player.MAX_HP) + (0.15 * Player.MAX_MP) + (0.15 * Player.MAX_EN))
	var off_combat_xp = 50 + ceil((0.5 * Player.MAX_HP) * Skill.Shower_LVL)
	
	Off_combat_desc.text = "Off-Combat: Advances time, restores [" + str(off_combat_restore) + "] HP, MP, and EN. Grants [" + str(off_combat_xp) + "] Shower EXP."
	Combat_desc.text = "Passive: Grants [+1] WATER DEF per Level. Current WATER DEF = " + str(Player.WATER_DEF)

func update_and_refresh(func_ref):
	if func_ref and func_ref is Callable:
		func_ref.call()

func _ready():
	update()


func _on_close_button_button_up():
	GlobalButtonClick.button_click()
	queue_free()


func _on_action_button_button_up():
	GlobalButtonClick.button_click()
	update_and_refresh(Skill.Active_Shower)
	update()
	if get_parent().has_method("Set_Core_Stats"):
		get_parent().Set_Core_Stats()
