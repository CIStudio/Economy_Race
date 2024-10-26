extends CharacterBody2D


const SPEED = 100.0


@onready var ANIM = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		velocity.x += 1
		ANIM.play("right_run")
	elif Input.is_action_pressed("left"):
		velocity.x -= 1
		ANIM.play("left_run")
	elif Input.is_action_pressed("up"):
		velocity.y -= 1
		ANIM.play("back_run")
	elif Input.is_action_pressed("down"):
		velocity.y += 1
		ANIM.play("front_run")
	else:
		ANIM.play("front_idle")
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED


	move_and_slide()
