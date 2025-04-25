extends Control

var page = 1
var type_states = ["Off_combat", "Combat", "Recovery", "Physical", "Magic"]
var type_set = 0


@export var Catalogue_Scene = "res://Scenes/Menus/catalogue_menu.tscn"


@export var Rest_Scene = "res://Scenes/Skills/rest_skill.tscn"
@export var Pushup_Scene = "res://Scenes/Skills/pushup_skill.tscn"
@export var Run_Scene = "res://Scenes/Skills/run_skill.tscn"
@export var Study_Scene = "res://Scenes/Skills/study_skill.tscn"
@export var Punch_Scene = "res://Scenes/Skills/punch_skill.tscn"
@export var Squat_Scene = "res://Scenes/Skills/squat_skill.tscn"
@export var Physical_Endurance_Scene = "res://Scenes/Skills/physical_endurance_skill.tscn"
@export var Kick_Scene = "res://Scenes/Skills/kick_skill.tscn"
@export var Minor_Regen_Scene = "res://Scenes/Skills/minor_regen_skill.tscn"
@export var Magic_Blast_Scene = "res://Scenes/Skills/magic_blast_skill.tscn"
@export var Meditate_Scene = "res://Scenes/Skills/meditate_skill.tscn"
@export var Shower_Scene = "res://Scenes/Skills/shower_skill.tscn"
@export var Potion_Proficiency_Scene = "res://Scenes/Skills/potion_proficiency_skill.tscn"
@export var Health_Potion_Scene = "res://Scenes/Skills/health_potion_skill.tscn"
@export var Magic_Seeker_Scene = "res://Scenes/Skills/magic_seeker_scene.tscn"
@export var Mana_Potion_Scene = "res://Scenes/Skills/mana_potion_skill.tscn"
@export var Acid_Potion_Scene = "res://Scenes/Skills/acidpotion_skill.tscn"
@export var Speech_Scene = "res://Scenes/Skills/speech_skill.tscn"
@export var Strong_Punch_Scene = "res://Scenes/Skills/strong_punch_skill.tscn"
@export var Lowly_Mana_Regen_Scene = "res://Scenes/Skills/lowly_mana_regen_skill.tscn"


@onready var textures = {
	"unknown": preload("res://Assets/Skills_art/Unknown_Button.png"),
	"rest": preload("res://Assets/Skills_art/Rest_Button.png"),
	"pushup": preload("res://Assets/Skills_art/Pushup_button.png"),
	"run": preload("res://Assets/Skills_art/Run_button.png"),
	"study": preload("res://Assets/Skills_art/Study_button.png"),
	"punch": preload("res://Assets/Skills_art/Punch_button.png"),
	"squat": preload("res://Assets/Skills_art/Squat_button.png"),
	"physical_endurance": preload("res://Assets/Skills_art/Physical_Endurance_button.png"),
	"kick": preload("res://Assets/Skills_art/Kick_button.png"),
	"minor_regen": preload("res://Assets/Skills_art/Minor_Regen_button.png"),
	"magic_blast": preload("res://Assets/Skills_art/Magic_Blast_button.png"),
	"meditate": preload("res://Assets/Skills_art/Meditate_button.png"),
	"shower": preload("res://Assets/Skills_art/Shower_button.png"),
	"potion_proficiency": preload("res://Assets/Skills_art/Potion_Proficiency_button.png"),
	"health_potion": preload("res://Assets/Skills_art/Health_Potion_button.png"),
	"magic_seeker": preload("res://Assets/Skills_art/Magic_Seeker_button.png"),
	"mana_potion": preload("res://Assets/Skills_art/Mana_Potion_button.png"),
	"acid_potion": preload("res://Assets/Skills_art/AcidPotion_Button.png"),
	"speech": preload("res://Assets/Skills_art/Speech_Button.png"),
	"strong_punch": preload("res://Assets/Skills_art/Strong_Punch_Button.png"),
	"lowly_mana_regen": preload("res://Assets/Skills_art/Lowly_Mana_Regen_button.png")
}

@onready var buttons = {
	"off_combat": $ScrollContainer/HBoxContainer/Button_1,
	"combat": $ScrollContainer/HBoxContainer/Button_2,
	"recovery": $ScrollContainer/HBoxContainer/Button_3,
	"physical": $ScrollContainer/HBoxContainer/Button_4,
	"magic": $ScrollContainer/HBoxContainer/Button_5,
	"elemental": $ScrollContainer/HBoxContainer/Button_6
}

@onready var skill_buttons = [
	$ScrollContainer2/GridContainer/Skill_Button_1,
	$ScrollContainer2/GridContainer/Skill_Button_2,
	$ScrollContainer2/GridContainer/Skill_Button_3,
	$ScrollContainer2/GridContainer/Skill_Button_4,
	$ScrollContainer2/GridContainer/Skill_Button_5,
	$ScrollContainer2/GridContainer/Skill_Button_6,
	$ScrollContainer2/GridContainer/Skill_Button_7,
	$ScrollContainer2/GridContainer/Skill_Button_8,
	$ScrollContainer2/GridContainer/Skill_Button_9,
	$ScrollContainer2/GridContainer/Skill_Button_10
]

var skill_unlocks = {
	"rest": func(): return Skill.Rest_Unlocked,
	"pushup": func(): return Skill.PushUp_Unlocked,
	"run": func(): return Skill.Run_Unlocked,
	"study": func(): return Skill.Study_Unlocked,
	"punch": func(): return Skill.Punch_Unlocked,
	"squat": func(): return Skill.Squat_Unlocked,
	"physical_endurance": func(): return Skill.Physical_Endurance_Unlocked,
	"kick": func(): return Skill.Kick_Unlocked,
	"minor_regen": func(): return Skill.Minor_Regen_Unlocked,
	"magic_blast": func(): return Skill.Magic_Blast_Unlocked,
	"meditate": func(): return Skill.Meditate_Unlocked,
	"shower": func(): return Skill.Shower_Unlocked,
	"potion_proficiency": func(): return Skill.Potion_Proficiency_Unlocked,
	"health_potion": func(): return Skill.Health_Potion_Unlocked,
	"magic_seeker": func(): return Skill.Magic_Seeker_Unlocked,
	"mana_potion": func(): return Skill.Mana_Potion_Unlocked,
	"acid_potion": func(): return Skill.Acid_Potion_Unlocked,
	"speech": func(): return Skill.Speech_Unlocked,
	"strong_punch": func(): return Skill.Strong_Punch_Unlocked,
	"lowly_mana_regen": func(): return Skill.Lowly_Mana_Regen_Unlocked
}

var skill_scenes = {
	"rest": Rest_Scene,
	"pushup": Pushup_Scene,
	"run": Run_Scene,
	"study": Study_Scene,
	"punch": Punch_Scene,
	"squat": Squat_Scene,
	"physical_endurance": Physical_Endurance_Scene,
	"kick": Kick_Scene,
	"minor_regen": Minor_Regen_Scene,
	"magic_blast": Magic_Blast_Scene,
	"meditate": Meditate_Scene,
	"shower": Shower_Scene,
	"potion_proficiency": Potion_Proficiency_Scene,
	"health_potion": Health_Potion_Scene,
	"magic_seeker": Magic_Seeker_Scene,
	"mana_potion": Mana_Potion_Scene,
	"acid_potion": Acid_Potion_Scene,
	"speech": Speech_Scene,
	"strong_punch": Strong_Punch_Scene,
	"lowly_mana_regen": Lowly_Mana_Regen_Scene
}

func _ready():
	set_textures()

func set_textures():
	var unlocked_skills = []

	# Assign skills based on type_set
	match type_set:
		0: unlocked_skills = ["pushup", "run", "study", "squat","meditate","speech","potion_proficiency","physical_endurance"]  # Off-Combat
		1: unlocked_skills = ["rest", "punch","kick","minor_regen","acid_potion","magic_blast","magic_seeker","strong_punch"]  # Combat
		2: unlocked_skills = ["rest","shower","health_potion","mana_potion","minor_regen","lowly_mana_regen"]  # Recovery
		3: unlocked_skills = ["punch","kick","physical_endurance","strong_punch"]  # Physical
		4: unlocked_skills = ["magic_blast","magic_seeker"] # Magic
		5: unlocked_skills = ["acid_potion"]

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
		0: ["pushup", "run", "study", "squat","meditate","speech","potion_proficiency","physical_endurance"],  # Off-Combat
		1: ["rest","punch","kick","minor_regen","acid_potion","magic_blast","magic_seeker","strong_punch"],  # Combat
		2: ["rest","shower","health_potion","mana_potion","minor_regen","lowly_mana_regen"],  # Recovery
		3: ["punch","kick","physical_endurance","strong_punch"],  # Physical
		4: ["magic_blast","magic_seeker"], # Magic
		5: ["acid_potion"] #Elemental
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
func _on_skill_button_4_button_up(): _on_skill_button_pressed(3)
func _on_skill_button_5_button_up(): _on_skill_button_pressed(4)
func _on_skill_button_6_button_up(): _on_skill_button_pressed(5)
func _on_skill_button_7_button_up(): _on_skill_button_pressed(6)
func _on_skill_button_8_button_up(): _on_skill_button_pressed(7)
func _on_skill_button_9_button_up(): _on_skill_button_pressed(8)

func _on_button_pressed(index):
	type_set = index
	set_textures()

func _on_button_1_pressed(): _on_button_pressed(0)
func _on_button_2_pressed(): _on_button_pressed(1)
func _on_button_3_pressed(): _on_button_pressed(2)
func _on_button_4_pressed(): _on_button_pressed(3)
func _on_button_5_pressed(): _on_button_pressed(4)
func _on_button_6_pressed(): _on_button_pressed(5)
func _on_button_7_pressed(): _on_button_pressed(6)


func _on_go_back_button_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Catalogue_Scene)






	
