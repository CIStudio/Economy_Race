extends Area2D


var in_object_area = false
var ANIM = "on"


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if in_object_area == true and Input.is_action_just_pressed("take"):
		$"../AnimatedSprite2D".play("off")
		ANIM = "off"
		print("2")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		in_object_area = true
		print("1")
	else:
		in_object_area = false
		
		
