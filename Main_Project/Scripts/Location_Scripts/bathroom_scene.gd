extends Node2D


@onready var House_Scene = "res://Scenes/Locations/house_scene.tscn"
@onready var Catalogue_Scene = "res://Scenes/Menus/catalogue_menu.tscn"

var Shower_Scene = load("res://Scenes/PopUp_Windows/shower_window.tscn") as PackedScene
var Speech_Scene = load("res://Scenes/PopUp_Windows/speech_window.tscn") as PackedScene

@onready var Bg_Holder = $BG
@onready var Day_txt = $Day_Text
@onready var HP_Bar = $Options_holder/HealthBar
@onready var HP_TXT = $Options_holder/HealthBar/HPTXTLabel
@onready var MP_Bar = $Options_holder/ManaBar
@onready var MP_TXT = $Options_holder/ManaBar/MPTXTLabel
@onready var EN_Bar = $Options_holder/ENBar
@onready var EN_TXT = $Options_holder/ENBar/ENTXTLabel

func _ready():
	Set_Core_Stats()

func Set_Core_Stats():
	
	HP_Bar.max_value = Player.MAX_HP
	HP_Bar.value = Player.HP
	HP_TXT.bbcode_text = "[center]%d / %d[/center]" % [Player.HP, Player.MAX_HP]
	
	MP_Bar.max_value = Player.MAX_MP
	MP_Bar.value = Player.MP
	MP_TXT.bbcode_text = "[center]%d / %d[/center]" % [Player.MP, Player.MAX_MP]

	EN_Bar.max_value = Player.MAX_EN
	EN_Bar.value = Player.EN
	EN_TXT.bbcode_text = "[center]%d / %d[/center]" % [Player.EN, Player.MAX_EN]
	
	Day_txt.bbcode_text = "[right]Day %d\nTime is %s[/right]" % [Global.Day, Global.time_states[Global.Time_of_day]]

func update_and_refresh(func_ref):
	if func_ref and func_ref is Callable:
		func_ref.call()
		Set_Core_Stats()

func _on_inventory_button_button_up():
	GlobalButtonClick.button_click()
	Global.Map = 4
	get_tree().change_scene_to_file(Catalogue_Scene)


func _on_option_button_1_button_up():
	GlobalButtonClick.button_click()
	Global.Map = 2
	get_tree().change_scene_to_file(House_Scene)


func _on_option_button_2_button_up():
	GlobalButtonClick.button_click()
	update_and_refresh(Skill.Off_Combat_Rest)


func _on_option_button_3_button_up():
	GlobalButtonClick.button_click()
	var shower_scene = Shower_Scene.instantiate()
	get_tree().current_scene.add_child(shower_scene)


func _on_option_button_4_button_up():
	GlobalButtonClick.button_click()
	var speech_scene = Speech_Scene.instantiate()
	get_tree().current_scene.add_child(speech_scene)
