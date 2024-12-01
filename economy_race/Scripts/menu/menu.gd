extends Node2D





func _on_play_pressed() -> void:
	pass # Replace with function body.


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu/level_menu.tscn")


func _on_info_pressed() -> void:
	OS.shell_open("https://github.com/CIStudio")
