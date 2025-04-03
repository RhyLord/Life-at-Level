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
