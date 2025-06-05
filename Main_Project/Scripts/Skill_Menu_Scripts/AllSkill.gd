extends Control

@export var Skill_Scene = "res://Scenes/Menus/catalogue_menu.tscn"

@onready var skill_list = $ScrollContainer/SkillList

# All skill data (icon + scene paths)
var all_skills = {
	
	"Punch": {
		"icon": preload("res://Assets/Skills_art/Punch_button.png"),
		"scene": "res://Scenes/Skills/punch_skill.tscn"
	},
	"Kick": {
		"icon": preload("res://Assets/Skills_art/Kick_button.png"),
		"scene": "res://Scenes/Skills/kick_skill.tscn"
	},
	"Strong_Punch": {
		"icon": preload("res://Assets/Skills_art/Strong_Punch_Button.png"),
		"scene": "res://Scenes/Skills/strong_punch_skill.tscn"
	},
	"Magic_Blast": {
		"icon": preload("res://Assets/Skills_art/Magic_Blast_button.png"),
		"scene": "res://Scenes/Skills/magic_blast_skill.tscn"
	},
	"Magic_Seeker": {
		"icon": preload("res://Assets/Skills_art/Magic_Seeker_button.png"),
		"scene": "res://Scenes/Skills/magic_seeker_scene.tscn"
	},
	"Lowly_Mana_Regen": {
		"icon": preload("res://Assets/Skills_art/Lowly_Mana_Regen_button.png"),
		"scene": "res://Scenes/Skills/lowly_mana_regen_skill.tscn"
	},
	"Minor_Regen": {
		"icon": preload("res://Assets/Skills_art/Minor_Regen_button.png"),
		"scene": "res://Scenes/Skills/minor_regen_skill.tscn"
	},
	"Potion_Proficiency": {
		"icon": preload("res://Assets/Skills_art/Potion_Proficiency_button.png"),
		"scene": "res://Scenes/Skills/potion_proficiency_skill.tscn"
	},
	"Acid_Potion": {
		"icon": preload("res://Assets/Skills_art/AcidPotion_Button.png"),
		"scene": "res://Scenes/Skills/acidpotion_skill.tscn"
	},
	"Health_Potion": {
		"icon": preload("res://Assets/Skills_art/Health_Potion_button.png"),
		"scene": "res://Scenes/Skills/health_potion_skill.tscn"
	},
	"Mana_Potion": {
		"icon": preload("res://Assets/Skills_art/Mana_Potion_button.png"),
		"scene": "res://Scenes/Skills/mana_potion_skill.tscn"
	},
	"Physical_Endurance": {
		"icon": preload("res://Assets/Skills_art/Physical_Endurance_button.png"),
		"scene": "res://Scenes/Skills/physical_endurance_skill.tscn"
	},
	"Rest": {
		"icon": preload("res://Assets/Skills_art/Rest_Button.png"),
		"scene": "res://Scenes/Skills/rest_skill.tscn"
	},
	"PushUp": {
		"icon": preload("res://Assets/Skills_art/Pushup_button.png"),
		"scene": "res://Scenes/Skills/pushup_skill.tscn"
	},
	"Run": {
		"icon": preload("res://Assets/Skills_art/Run_button.png"),
		"scene": "res://Scenes/Skills/run_skill.tscn"
	},
	"Shower": {
		"icon": preload("res://Assets/Skills_art/Shower_button.png"),
		"scene": "res://Scenes/Skills/shower_skill.tscn"
	},
	"Meditate": {
		"icon": preload("res://Assets/Skills_art/Meditate_button.png"),
		"scene": "res://Scenes/Skills/meditate_skill.tscn"
	},
	"Speech": {
		"icon": preload("res://Assets/Skills_art/Speech_Button.png"),
		"scene": "res://Scenes/Skills/speech_skill.tscn"
	},
	"Squat": {
		"icon": preload("res://Assets/Skills_art/Squat_button.png"),
		"scene": "res://Scenes/Skills/squat_skill.tscn"
	},
	"Study": {
		"icon": preload("res://Assets/Skills_art/Study_button.png"),
		"scene": "res://Scenes/Skills/study_skill.tscn"
	}
}

func _ready():
	populate_skills()

func populate_skills():
	for child in skill_list.get_children():
		child.queue_free()

	for skill_name in all_skills:
		var unlock_flag = skill_name + "_Unlocked"
		if !Skill.get(unlock_flag):
			continue

		var skill = all_skills[skill_name]

		var icon_button = TextureButton.new()
		icon_button.texture_normal = skill.icon

		icon_button.connect("pressed", _on_skill_pressed.bind(skill.scene))
		skill_list.add_child(icon_button)

func _on_skill_pressed(scene_path: String):
	var packed_scene = load(scene_path)
	if packed_scene:
		get_tree().change_scene_to_packed(packed_scene)
	else:
		push_error("Scene not found: " + scene_path)


func _on_go_back_button_button_up():
	GlobalButtonClick.button_click()
	get_tree().change_scene_to_file(Skill_Scene)
