extends Control

@onready var Grid_List = $GridContainer

var textures = {
	"rest": preload("res://Assets/Skills_art/Rest_Button.png"),
	"health_potion": preload("res://Assets/Skills_art/Health_Potion_button.png"),
	"minor_regen": preload("res://Assets/Skills_art/Minor_Regen_button.png"),
	"mana_potion": preload("res://Assets/Skills_art/Mana_Potion_button.png"),
	"lowly_mana_regen": preload("res://Assets/Skills_art/Lowly_Mana_Regen_button.png"),
	"unknown": preload("res://Assets/Skills_art/Unknown_Button.png")
}

func _ready():

	_add_skill_button("rest", _on_rest_pressed)

	if Skill.Health_Potion_Unlocked:
		_add_skill_button("health_potion", _on_health_potion_pressed)

	if Skill.Minor_Regen_Unlocked:
		_add_skill_button("minor_regen", _on_minor_regen_pressed)

	if Skill.Mana_Potion_Unlocked:
		_add_skill_button("mana_potion", _on_mana_potion_pressed)

	if Skill.Lowly_Mana_Regen_Unlocked:
		_add_skill_button("lowly_mana_regen", _on_lowly_mana_regen_pressed)


func _add_skill_button(texture_key: String, callback: Callable):
	var button = TextureButton.new()
	button.texture_normal = textures.get(texture_key, textures["unknown"])
	button.connect("button_up", callback)
	Grid_List.add_child(button)


# Callbacks

func _on_rest_pressed():
	GlobalButtonClick.button_click()
	Skill.Combat_Rest()
	BattleMech.Player_Action_1()
	queue_free()

func _on_health_potion_pressed():
	if Inventory.minor_health_potion > 0:
		GlobalButtonClick.button_click()
		Skill.Use_Health_Potion()
		BattleMech.Player_Action_1()
		queue_free()

func _on_minor_regen_pressed():
	if Player.EN >= 50:
		GlobalButtonClick.button_click()
		Skill.Active_Minor_Regen()
		BattleMech.Player_Action_1()
		queue_free()

func _on_mana_potion_pressed():
	if Inventory.minor_mana_potion > 0:
		GlobalButtonClick.button_click()
		Skill.Use_Mana_Potion()
		BattleMech.Player_Action_1()
		queue_free()

func _on_lowly_mana_regen_pressed():
	if Player.EN >= 50:
		GlobalButtonClick.button_click()
		Skill.Active_Lowly_Mana_Regen()
		BattleMech.Player_Action_1()
		queue_free()


func _on_go_back_button_button_up():
	GlobalButtonClick.button_click()
	queue_free()
