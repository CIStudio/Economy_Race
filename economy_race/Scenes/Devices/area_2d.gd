extends Area2D


var in_object_area: bool = false
var device_turned_off: bool = false
var presse_mh: bool = true
@onready var ANIM = $"../AnimatedSprite2D"
@onready var PRESSE = $"../PressE"


func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if in_object_area == true and presse_mh == true:
		PRESSE.show()
	else:
		PRESSE.hide()
	if in_object_area == true and Input.is_action_just_pressed("take") and not device_turned_off:
		Global.devices_off += 1
		device_turned_off = true
		ANIM.play("off")
		presse_mh = false
		PRESSE.hide()
		
func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		in_object_area = true
	else:
		in_object_area = false


func _on_body_exited(body: Node2D) -> void:
	if body.name == "player":
		in_object_area = false
