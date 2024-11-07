extends Area2D


var in_object_area = false
@onready var ANIM =$"../AnimatedSprite2D"


func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if in_object_area == true and Input.is_action_just_pressed("take"):
		ANIM.play("off")
		Global.devices_off += 1

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		in_object_area = true
	else:
		in_object_area = false
