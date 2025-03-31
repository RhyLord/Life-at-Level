extends Control

var page = 1
var type_states = ["Off_combat", "Combat", "Recovery", "Physical"]
var type_set = 0

@export var Rest_Scene = "res://Scenes/Skills/rest_skill.tscn"
@export var Pushup_Scene = "res://Scenes/Skills/pushup_skill.tscn"
@export var Run_Scene = "res://Scenes/Skills/run_skill.tscn"
@export var Study_Scene = "res://Scenes/Skills/study_skill.tscn"
@export var Punch_Scene = "res://Scenes/Skills/punch_skill.tscn"
@export var Squat_Scene = "res://Scenes/Skills/squat_skill.tscn"

@onready var textures = {
	"unknown": preload("res://Assets/Skills_art/Unknown_Button.png"),
	"rest": preload("res://Assets/Skills_art/Rest_Button.png"),
	"pushup": preload("res://Assets/Skills_art/Pushup_button.png"),
	"run": preload("res://Assets/Skills_art/Run_Button.png"),
	"study": preload("res://Assets/Skills_art/Study_button.png"),
	"punch": preload("res://Assets/Skills_art/Punch_button.png"),
	"squat": preload("res://Assets/Skills_art/Squat_button.png")
}

@onready var buttons = {
	"off_combat": $Main_buttons/Button_1,
	"combat": $Main_buttons/Button_2,
	"recovery": $Main_buttons/Button_3,
	"physical": $Main_buttons/Button_4
}

@onready var skill_buttons = [
	$Skill_Buttons/GridContainer/Skill_Button_1,
	$Skill_Buttons/GridContainer/Skill_Button_2,
	$Skill_Buttons/GridContainer/Skill_Button_3,
	$Skill_Buttons/GridContainer/Skill_Button_4,
	$Skill_Buttons/GridContainer/Skill_Button_5
]

var skill_unlocks = {
	"rest": func(): return Skill.Rest_Unlocked,
	"pushup": func(): return Skill.PushUp_Unlocked,
	"run": func(): return Skill.Run_Unlocked,
	"study": func(): return Skill.Study_Unlocked,
	"punch": func(): return Skill.Punch_Unlocked,
	"squat": func(): return Skill.Squat_Unlocked
}

var skill_scenes = {
	"rest": Rest_Scene,
	"pushup": Pushup_Scene,
	"run": Run_Scene,
	"study": Study_Scene,
	"punch": Punch_Scene,
	"squat": Squat_Scene
}

func _ready():
	set_textures()

func set_textures():
	var unlocked_skills = []

	# Assign skills based on type_set
	match type_set:
		0: unlocked_skills = ["rest","pushup", "run", "study", "squat"]  # Off-Combat
		1: unlocked_skills = ["rest", "punch"]  # Combat
		2: unlocked_skills = ["rest"]  # Recovery
		3: unlocked_skills = ["punch"]  # Physical

	for i in range(skill_buttons.size()):
		if i < unlocked_skills.size():
			var skill_name = unlocked_skills[i]
			if skill_unlocks.has(skill_name) and skill_unlocks[skill_name].call():
				skill_buttons[i].texture_normal = textures[skill_name]
				skill_buttons[i].texture_hover = textures[skill_name]
			else:
				skill_buttons[i].texture_normal = textures["unknown"]
				skill_buttons[i].texture_hover = textures["unknown"]
		else:
			skill_buttons[i].texture_normal = textures["unknown"]
			skill_buttons[i].texture_hover = textures["unknown"]



func _on_skill_button_pressed(index):
	var skills_by_type = {
		0: ["rest", "pushup", "run", "study", "squat"],  # Off-Combat
		1: ["rest","punch"],  # Combat
		2: ["rest"],  # Recovery
		3: ["punch"]  # Physical
	}

	if type_set in skills_by_type:
		var skills = skills_by_type[type_set]
		if index < skills.size():
			var skill_name = skills[index]
			if skill_unlocks.has(skill_name) and skill_unlocks[skill_name].call():
				get_tree().change_scene_to_file(skill_scenes[skill_name])


func _on_skill_button_1_button_up(): _on_skill_button_pressed(0)
func _on_skill_button_2_button_up(): _on_skill_button_pressed(1)
func _on_skill_button_3_button_up(): _on_skill_button_pressed(2)
func _on_skill_button_4_pressed(): _on_skill_button_pressed(3)
func _on_skill_button_5_pressed(): _on_skill_button_pressed(4)

func _on_button_pressed(index):
	type_set = index
	set_textures()

func _on_button_1_pressed(): _on_button_pressed(0)
func _on_button_2_pressed(): _on_button_pressed(1)
func _on_button_3_pressed(): _on_button_pressed(2)
func _on_button_4_pressed(): _on_button_pressed(3)
func _on_button_5_pressed(): _on_button_pressed(4)


