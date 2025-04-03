extends Control

@onready var Grid_List = $GridContainer
@onready var Skill_Button_1 = $GridContainer/Skill_Button_1
@onready var Skill_Button_2 = $GridContainer/Skill_Button_2

@onready var Skill_TXT_1 = $GridContainer/Skill_Button_1/Cost_TXT
@onready var Skill_TXT_2 = $GridContainer/Skill_Button_2/Cost_TXT

@onready var textures = {
	"unknown": preload("res://Assets/Skills_art/Unknown_Button.png"),
	"rest": preload("res://Assets/Skills_art/Rest_Button.png"),
	"minor_regen": preload("res://Assets/Skills_art/Minor_Regen_button.png")
}

func _ready():
	Skill_Button_1.texture_normal = textures["rest"]
	Skill_TXT_1.text = "[center]Recover EN[/center]"
	
	if Skill.Minor_Regen_Unlocked == true:
		Skill_Button_2.texture_normal = textures["minor_regen"]
		Skill_TXT_2.text = "[center]Regen HP[/center]"

func _on_go_back_button_button_up():
	queue_free()


func _on_skill_button_1_button_up():
	Skill.Combat_Rest()
	BattleMech.Player_Action_1()
	queue_free()


func _on_skill_button_2_button_up():
	if Skill.Minor_Regen_Unlocked == true:
		if Player.EN >= 50:
			Skill.Active_Minor_Regen()
			BattleMech.Player_Action_1()
			queue_free()
