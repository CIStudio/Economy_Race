extends CharacterBody2D
@onready var ANIM = $AnimatedSprite2D
func _on_area_2d_body_entered(body: Node2D) -> void:
	ANIM.play("lamp_on")
	if body.name == "player" :
		if Global.is_off == true:
			ANIM.play("lamp_of")
			Global.devices_off += 1
			Global.is_off = false
				
	print(Global.devices_off)
func _on_area_2d_body_exited(body: Node2D) -> void:
	ANIM.play("lamp_on")
	if body.name == "player" :
		if Global.is_off == true:
			ANIM.play("lamp_of")
			Global.devices_off += 1
			Global.is_off = false
				
	
	
	
	
	move_and_slide()
