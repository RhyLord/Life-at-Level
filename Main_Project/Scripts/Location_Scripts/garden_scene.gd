extends Node2D

@onready var House_Scene = "res://Scenes/Locations/house_scene.tscn"
@onready var Catalogue_Scene = "res://Scenes/Menus/catalogue_menu.tscn"

var PushUp_Scene = load("res://Scenes/PopUp_Windows/push_up_window.tscn") as PackedScene
var Squat_Scene = load("res://Scenes/PopUp_Windows/squat_window.tscn") as PackedScene
var Run_Scene = load("res://Scenes/PopUp_Windows/run_window.tscn") as PackedScene


var bg_textures = [
	preload("res://Assets/Map_Art/Garden/Garden_Bg_Morning.png"),
	preload("res://Assets/Map_Art/Garden/Garden_Bg_Noon.png"),
	preload("res://Assets/Map_Art/Garden/Garden_Bg_Evening.png"),
	preload("res://Assets/Map_Art/Garden/Garden_Bg_Night.png"),
	preload("res://Assets/Map_Art/Garden/Garden_Bg_Midnight.png")
]

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
	
	Bg_Holder.texture = bg_textures[Global.Time_of_day]
	Day_txt.bbcode_text = "[right]Day %d\nTime is %s[/right]" % [Global.Day, Global.time_states[Global.Time_of_day]]


func update_and_refresh(func_ref):
	if func_ref and func_ref is Callable:
		func_ref.call()
		Set_Core_Stats()


func _on_inventory_button_button_up():
	GlobalButtonClick.button_click()
	Global.Map = 3
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
	var run_scene = Run_Scene.instantiate()
	get_tree().current_scene.add_child(run_scene)


func _on_option_button_4_button_up():
	GlobalButtonClick.button_click()
	var Pushup_scene = PushUp_Scene.instantiate()
	get_tree().current_scene.add_child(Pushup_scene)


func _on_option_button_5_button_up():
	GlobalButtonClick.button_click()
	var squat_scene = Squat_Scene.instantiate()
	get_tree().current_scene.add_child(squat_scene)
