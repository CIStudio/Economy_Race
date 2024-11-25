extends Node

@onready var pause_menu =$"../CanvasLayer/Pause menu"
var game_paused: bool = false

var seconds = 0
var Dseconds = 30
var minutes = 0
var Dminutes = 1


func _ready():
	Reset_Timer()

func _on_timer_timeout():
	if seconds == 0:
		if minutes > 0:
			minutes -= 1
			seconds = 60
	seconds -= 1

	$"../CanvasLayer/Timer".text=str(minutes) + ":" + str(seconds)

func Reset_Timer():
	seconds = Dseconds
	minutes = Dminutes
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		game_paused = !game_paused
	if game_paused == true:
		get_tree().paused = true
		pause_menu.show()
	else:
		get_tree().paused = false
		pause_menu.hide()


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
