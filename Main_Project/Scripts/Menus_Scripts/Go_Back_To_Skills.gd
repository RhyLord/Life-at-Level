extends Button

@export var Previous_Scene = "res://Scenes/Menus/skills_menu.tscn"

func _on_button_up():
	GlobalButtonClick.button_click()
	Skill.Skill_Unlock_Check()
	get_tree().change_scene_to_file(Previous_Scene)
