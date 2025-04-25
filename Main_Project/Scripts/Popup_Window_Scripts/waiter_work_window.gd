extends Control


@onready var Nxt_Level_txt = $Panel/Nxt_Lvl_Txt
var pay = min(Player.CHA * 2,50)


func update():
	Nxt_Level_txt.text = "Coins recieved on work : " + str(pay) + "\nCoins in possesion: " + str(Player.coin) + "\nYou earn more with higher points in Charisma."


func _ready():
	update()


func _on_close_button_button_up():
	GlobalButtonClick.button_click()
	queue_free()


func _on_action_button_button_up():
	GlobalButtonClick.button_click()
	Global.cycle_time()
	Player.coin += pay
	update()

