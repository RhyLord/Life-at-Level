extends Control

@export var Stat_Scene = "res://Scenes/Menus/stats_menu.tscn"

@onready var title = $Title
@onready var TXT_STR = $Panel/TXT_STR
@onready var TXT_AGI = $Panel2/TXT_AGI
@onready var TXT_INT = $Panel3/TXT_INT
@onready var TXT_VIT = $Panel4/TXT_VIT
@onready var TXT_DEX = $Panel5/TXT_DEX
@onready var TXT_END = $Panel6/TXT_END
@onready var TXT_CHA = $Panel7/TXT_CHA
@onready var TXT_WIS = $Panel8/TXT_WIS
@onready var TXT_LUK = $Panel9/TXT_LUK
@onready var TXT_CTRL = $Panel10/TXT_CTRL


#Dev func- Delete before export
func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_Q:
		Player.Allocation_points += 10
		update_TXT()
	
	if event is InputEventKey and event.pressed and event.keycode == KEY_W:
		Player.MAX_MP += 500
		Player.MAX_HP += 500
		update_TXT()

func update_TXT():
	
	
	var title_text = "Available Allocation Points [" + str(Player.Allocation_points) + "]"

	var STR_TXT = "STR [STRENGTH] : [" + str(Player.STR) + "]"
	var DEX_TXT = "DEX [DEXTERITY] : [" + str(Player.DEX) + "]"
	var AGI_TXT = "AGI [AGILITY] : [" + str(Player.AGI) + "]"
	var INT_TXT = "INT [INTELLIGENCE] : [" + str(Player.INT) + "] Increases Max Mana by 10"
	var WIS_TXT = "WIS [WISDOM] : [" + str(Player.WIS) + "] Increases Max Mana by 25"
	var CHA_TXT = "CHA [CHARISMA] : [" + str(Player.CHA) + "]"
	var LUK_TXT = "LUK [LUCK] : [" + str(Player.LUK) + "]"
	var CTRL_TXT = "CTRL [CONTROL] : [" + str(Player.CTRL) + "]"
	var END_TXT = "END [ENDURANCE] : [" + str(Player.END) + "] Increases Max Energy by 10"
	var VIT_TXT = "VIT [VITALITY] : [" + str(Player.VIT) + "] Increases Max Health by 10"
	
	
	title.text = title_text
	
	TXT_STR.text = STR_TXT
	TXT_DEX.text = DEX_TXT
	TXT_AGI.text = AGI_TXT
	TXT_VIT.text = VIT_TXT
	TXT_INT.text = INT_TXT
	TXT_WIS.text = WIS_TXT
	TXT_CHA.text = CHA_TXT
	TXT_LUK.text = LUK_TXT
	TXT_CTRL.text = CTRL_TXT
	TXT_END.text = END_TXT
	
	Skill.Skill_Unlock_Check()



func _ready():
	update_TXT()

func _on_go_back_button_button_up():
	Skill.Skill_Unlock_Check()
	get_tree().change_scene_to_file(Stat_Scene)
	



func _on_adder_button_str_button_up():
	if Player.Allocation_points > 0:
		Player.STR += 1
		Player.Allocation_points -= 1
		update_TXT()


func _on_adder_button_agi_button_up():
	if Player.Allocation_points > 0:
		Player.AGI += 1
		Player.Allocation_points -= 1
		update_TXT()

func _on_adder_button_int_button_up():
	if Player.Allocation_points > 0:
		Player.INT += 1
		Player.MAX_MP += 10
		Player.Allocation_points -= 1
		update_TXT()

func _on_adder_button_vit_button_up():
	if Player.Allocation_points > 0:
		Player.VIT += 1
		Player.MAX_HP += 10
		Player.Allocation_points -= 1
		update_TXT()

func _on_adder_button_dex_button_up():
	if Player.Allocation_points > 0:
		Player.DEX += 1
		Player.Allocation_points -= 1
		update_TXT()

func _on_adder_button_end_button_up():
	if Player.Allocation_points > 0:
		Player.END += 1
		Player.MAX_EN += 10
		Player.Allocation_points -= 1
		update_TXT()

func _on_adder_button_cha_button_up():
	if Player.Allocation_points > 0:
		Player.CHA += 1
		Player.Allocation_points -= 1
		update_TXT()

func _on_adder_button_wis_button_up():
	if Player.Allocation_points > 0:
		Player.WIS += 1
		Player.MAX_MP += 25
		Player.Allocation_points -= 1
		update_TXT()

func _on_adder_button_luk_button_up():
	if Player.Allocation_points > 0:
		Player.LUK += 1
		Player.Allocation_points -= 1
		update_TXT()

func _on_adder_button_ctrl_button_up():
	if Player.Allocation_points > 0:
		Player.CTRL += 1
		Player.Allocation_points -= 1
		update_TXT()
