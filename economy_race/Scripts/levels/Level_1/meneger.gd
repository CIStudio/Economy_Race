extends Node

@onready var pause_menu =$"../CanvasLayer/Pause menu"
@onready var end_menu =$"../CanvasLayer/End_Menu"
var game_paused: bool = false
var end:bool = false

var seconds = 0
var Dseconds = 30
var minutes = 0
var Dminutes = 1
var time = 0
var best_time = 0

func _ready():
	Reset_Timer()

func _on_timer_timeout():
	if Global.devices_off < 12:
		if seconds == 0:
			if minutes > 0:
				minutes -= 1
				seconds = 60
		seconds -= 1

	$"../CanvasLayer/Timer".text=str(minutes) + ":" + str(seconds)
func Reset_Timer():
	seconds = Dseconds
	minutes = Dminutes
	
func _process(_delta):
	if Global.devices_off == 12 or (minutes == 0 and seconds == 0):
		$"../AudioStreamPlayer".stop()
		end = true
		time = seconds
		if best_time<time:
			best_time = time
	if Input.is_action_just_pressed("ui_cancel"):
		game_paused = !game_paused
	if game_paused == true:
		get_tree().paused = true
		pause_menu.show()
	else:
		get_tree().paused = false
		pause_menu.hide()
	if end ==true :
		end_menu.show()
	else:
		end_menu.hide()
		
	$"../CanvasLayer/End_Menu/Panel/Score".text = "Сохранено энергии :" + str(Global.devices_off * 100) + "Вт*ч"
	$"../CanvasLayer/End_Menu/Panel/Time".text = "Время " + str(time)
	$"../CanvasLayer/End_Menu/Panel/Best_Time".text = "Лучшее время " + str(best_time)

func _on_resume_pressed() -> void:
	game_paused = !game_paused


func _on_quit_pressed() -> void:
	Global.devices_off = 0
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/menu/level_menu.tscn")


func _on_restart_pressed() -> void:
	Global.devices_off = 0
	game_paused = !game_paused
	get_tree().reload_current_scene()


func _on_menu_pressed() -> void:
	Global.devices_off = 0
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/menu/level_menu.tscn")
