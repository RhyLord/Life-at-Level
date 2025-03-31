extends Control

@onready var Grid_List = $GridContainer
@onready var Skill_Button_1 = $GridContainer/Skill_Button_1

@onready var textures = {
	"unknown": preload("res://Assets/Skills_art/Unknown_Button.png"),
	"punch": preload("res://Assets/Skills_art/Punch_button.png")
}

func _ready():
	Skill_Button_1.texture_normal = textures["punch"]

func _on_go_back_button_button_up():
	queue_free()


func _on_skill_button_1_button_up():
	if Player.EN >= 5:
		BattleMech.Selected_Skill = Skill.Punch.bind()
		BattleMech.Selected_Action = BattleMech.Player_Attack_1.bind()
		BattleMech.turn_order = 1
		queue_free()


