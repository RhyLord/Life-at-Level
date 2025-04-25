extends Node2D

@export var Lowest_Slime_1_1 = "res://Scenes/Battles/Slime_Dungeons/Lowest_Slime_Dungeons/lowest_slime_dungeon_1_1.tscn"

var Bg_Texture = null

var Plain_Textures = [
	preload("res://Assets/Location_Art/Plains/Plains_Bg_Morning.png"),
	preload("res://Assets/Location_Art/Plains/Plains_Bg_Noon.png"),
	preload("res://Assets/Location_Art/Plains/Plains_Bg_Evening.png"),
	preload("res://Assets/Location_Art/Plains/Plains_Bg_Night.png"),
	preload("res://Assets/Location_Art/Plains/Plains_Bg_Midnight.png")
]


@onready var Player_Card = $Player_Card
@onready var Player_Grid = $GridContainer
@onready var Ready_button = $Ready_button
@onready var Bg_holder = $BG
@onready var HP_Bar = $HealthBar
@onready var HP_TXT = $HealthBar/HPTXTLabel
@onready var MP_Bar = $ManaBar
@onready var MP_TXT = $ManaBar/MPTXTLabel
@onready var EN_Bar = $ENBar
@onready var EN_TXT = $ENBar/ENTXTLabel
@onready var Dungeon_Name_TXT = $Dungeon_Name_Txt

var player_buttons = []


func _ready():
	collect_buttons()
	assign_default_position()
	Set_Core_Stats()


func set_bg_texture():
	if PreBattleData.bg_textures == "Plains":
		Bg_Texture = Plain_Textures[Global.Time_of_day]
	else:
		Bg_Texture = null
	

func Set_Core_Stats():
	set_bg_texture()
	HP_Bar.max_value = Player.MAX_HP
	HP_Bar.value = Player.HP
	HP_TXT.bbcode_text = "[center]%d / %d[/center]" % [Player.HP, Player.MAX_HP]
	
	MP_Bar.max_value = Player.MAX_MP
	MP_Bar.value = Player.MP
	MP_TXT.bbcode_text = "[center]%d / %d[/center]" % [Player.MP, Player.MAX_MP]

	EN_Bar.max_value = Player.MAX_EN
	EN_Bar.value = Player.EN
	EN_TXT.bbcode_text = "[center]%d / %d[/center]" % [Player.EN, Player.MAX_EN]
	
	Dungeon_Name_TXT.text = "[center][b][outline_size=3][outline_color=#000000][font_size=50]" + PreBattleData.Dungeon_name + "[/font_size][/outline_color][/outline_size][/b][/center]"
	
	if Bg_Texture:
		Bg_holder.set_deferred("texture", Bg_Texture)


func collect_buttons():
	"""Collects all buttons from the player grid and connects them."""
	player_buttons = Player_Grid.get_children().filter(func(b): return b is Button)

	for button in player_buttons:
		button.connect("pressed", Callable(self, "_on_player_button_pressed").bind(button))

func assign_default_position():
	"""Assigns Player_Card to the first button in the grid."""
	if player_buttons.size() > 0:
		Player_Card.global_position = player_buttons[0].global_position  # First button

func _on_player_button_pressed(button):
	"""Snaps Player_Card to the clicked button."""
	GlobalButtonClick.button_click()
	Player_Card.global_position = button.global_position

func _on_ready_button_button_up():
	"""Hides the Player Grid and Ready Button when clicked."""
	Player_Grid.hide()
	Ready_button.hide()
	GlobalButtonClick.button_click()
	PreBattleData.Player_position_x = Player_Card.global_position.x
	PreBattleData.Player_position_y = Player_Card.global_position.y
	if DungeonData.lowest_level_slime > 0:
		get_tree().change_scene_to_file(Lowest_Slime_1_1)
