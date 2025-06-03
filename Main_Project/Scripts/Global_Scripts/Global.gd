extends Node

var Day = 1
var Time_of_day = 0
var time_states = ["Morning", "Noon", "Evening", "Night", "Midnight"]
var Map = 1

func cycle_time():
	Time_of_day += 1
	if Time_of_day >= time_states.size():
		Time_of_day = 0
		Day += 1

func update():
	pass

#NPC Dialogues
var claire = 0
var lydia = 0
var veronica = 0

#NPC Quests
var claire_quest = 0
var claire_sub_quest = 0
var lydia_quest = 0
var lydia_sub_quest = 0
var veronica_quest = 0
var veronica_sub_quest = 0

