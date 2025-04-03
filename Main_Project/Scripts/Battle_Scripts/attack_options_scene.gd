extends Control

@onready var Grid_List = $GridContainer
@onready var Skill_Button_1 = $GridContainer/Skill_Button_1
@onready var Skill_Button_2 = $GridContainer/Skill_Button_2
@onready var Skill_Button_3 = $GridContainer/Skill_Button_3

@onready var Skill_TXT_1 = $GridContainer/Skill_Button_1/Cost_TXT
@onready var Skill_TXT_2 = $GridContainer/Skill_Button_2/Cost_TXT
@onready var Skill_TXT_3 = $GridContainer/Skill_Button_3/Cost_TXT

@onready var textures = {
	"unknown": preload("res://Assets/Skills_art/Unknown_Button.png"),
	"punch": preload("res://Assets/Skills_art/Punch_button.png"),
	"kick": preload("res://Assets/Skills_art/Kick_button.png"),
	"magic_blast": preload("res://Assets/Skills_art/Magic_Blast_button.png")
}

func _ready():
	Skill_Button_1.texture_normal = textures["punch"]
	Skill_TXT_1.text = "[center][-5] EN [/center]"
	if Skill.Kick_Unlocked == true:
		Skill_Button_2.texture_normal = textures["kick"]
		Skill_TXT_2.text = "[center][-25] EN[/center]"
	
	if Skill.Magic_Blast_Unlocked == true:
		Skill_Button_3.texture_normal = textures["magic_blast"]
		Skill_TXT_3.text = "[center][-50] MP[/center]"

func _on_go_back_button_button_up():
	queue_free()


func _on_skill_button_1_button_up():
	if Player.EN >= 5:
		BattleMech.Selected_Skill = Skill.Punch.bind()
		BattleMech.Selected_Action = BattleMech.Player_Attack_1.bind()
		BattleMech.turn_order = 1
		queue_free()




func _on_skill_button_2_button_up():
	if (Player.EN >= 25) and (Skill.Kick_Unlocked == true):
		BattleMech.Selected_Skill = Skill.Kick.bind()
		BattleMech.Selected_Action = BattleMech.Player_Attack_1.bind()
		BattleMech.turn_order = 1
		queue_free()


func _on_skill_button_3_button_up():
	if (Player.MP >= 50) and (Skill.Magic_Blast_Unlocked == true):
		BattleMech.Selected_Skill = Skill.Active_Magic_Blast.bind()
		BattleMech.Selected_Action = BattleMech.Player_Attack_1.bind()
		BattleMech.turn_order = 1
		queue_free()
