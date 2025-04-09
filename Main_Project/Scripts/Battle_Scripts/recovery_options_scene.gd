extends Control

@onready var Grid_List = $GridContainer
@onready var Skill_Button_1 = $GridContainer/Skill_Button_1
@onready var Skill_Button_2 = $GridContainer/Skill_Button_2
@onready var Skill_Button_3 = $GridContainer/Skill_Button_3
@onready var Skill_Button_4 = $GridContainer/Skill_Button_4
@onready var Skill_Button_5 = $GridContainer/Skill_Button_5

@onready var Skill_TXT_1 = $GridContainer/Skill_Button_1/Cost_TXT
@onready var Skill_TXT_2 = $GridContainer/Skill_Button_2/Cost_TXT
@onready var Skill_TXT_3 = $GridContainer/Skill_Button_3/Cost_TXT
@onready var Skill_TXT_4 = $GridContainer/Skill_Button_4/Cost_TXT
@onready var Skill_TXT_5 = $GridContainer/Skill_Button_5/Cost_TXT

@onready var textures = {
	"unknown": preload("res://Assets/Skills_art/Unknown_Button.png"),
	"rest": preload("res://Assets/Skills_art/Rest_Button.png"),
	"health_potion": preload("res://Assets/Skills_art/Health_Potion_button.png"),
	"minor_regen": preload("res://Assets/Skills_art/Minor_Regen_button.png"),
	"mana_potion": preload("res://Assets/Skills_art/Mana_Potion_button.png"),
	"lowly_mana_regen": preload("res://Assets/Skills_art/Lowly_Mana_Regen_button.png")
}

func _ready():
	Skill_Button_1.texture_normal = textures["rest"]
	Skill_TXT_1.text = "[center]Recover EN[/center]"
	
	if Skill.Health_Potion_Unlocked == true:
		Skill_Button_2.texture_normal = textures["health_potion"]
		Skill_TXT_2.text = "[center]Available[" + str(Inventory.minor_health_potion) + "].[/center]"
	
	if Skill.Minor_Regen_Unlocked == true:
		Skill_Button_3.texture_normal = textures["minor_regen"]
		Skill_TXT_3.text = "[center]Regen HP[/center]"
	
	if Skill.Mana_Potion_Unlocked == true:
		Skill_Button_4.texture_normal = textures["mana_potion"]
		Skill_TXT_4.text = "[center]Available[" + str(Inventory.minor_mana_potion) + "].[/center]"
		
	if Skill.Lowly_Mana_Regen_Unlocked == true:
		Skill_Button_5.texture_normal = textures["lowly_mana_regen"]
		Skill_TXT_5.text = "[center]Regen MP[/center]"

func _on_go_back_button_button_up():
	queue_free()


func _on_skill_button_1_button_up():
	Skill.Combat_Rest()
	BattleMech.Player_Action_1()
	queue_free()


func _on_skill_button_2_button_up():
	if Inventory.minor_health_potion > 0:
		Skill.Use_Health_Potion()
		BattleMech.Player_Action_1()
		queue_free()


func _on_skill_button_3_button_up():
	if Skill.Minor_Regen_Unlocked == true:
		if Player.EN >= 50:
			Skill.Active_Minor_Regen()
			BattleMech.Player_Action_1()
			queue_free()


func _on_skill_button_4_button_up():
	if Inventory.minor_mana_potion > 0:
		Skill.Use_Mana_Potion()
		BattleMech.Player_Action_1()
		queue_free()


func _on_skill_button_5_button_up():
	if Skill.Lowly_Mana_Regen_Unlocked == true:
		if Player.EN >= 50:
			Skill.Active_Lowly_Mana_Regen()
			BattleMech.Player_Action_1()
			queue_free()
