extends Node2D





func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/levels/3_level/level_3.tscn")


func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/levels/2_level/level_2.tscn")


func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/levels/1_level/level_1.tscn")
