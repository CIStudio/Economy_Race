extends Node2D





func _on_play_pressed() -> void:
	pass # Replace with function body.


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scripts/menu/level_menu.tscn")
