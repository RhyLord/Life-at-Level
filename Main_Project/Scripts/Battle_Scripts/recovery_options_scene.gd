extends Control

@onready var Grid_List = $GridContainer
@onready var Skill_Button_1 = $GridContainer/Skill_Button_1

@onready var textures = {
	"unknown": preload("res://Assets/Skills_art/Unknown_Button.png"),
	"rest": preload("res://Assets/Skills_art/Rest_Button.png")
}

func _ready():
	Skill_Button_1.texture_normal = textures["rest"]

func _on_go_back_button_button_up():
	queue_free()


func _on_skill_button_1_button_up():
	Skill.Combat_Rest()
	BattleMech.Player_Action_1()
	queue_free()
