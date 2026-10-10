

extends CharacterBody2D


const SPEED: float = 300.0
const JUMP_VELOCITY: float = -450.0


var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")


var start_position: Vector2


var facing_direction: int = 1



func _ready() -> void:
	start_position = global_position
	add_to_group("player")
	$AnimatedSprite2D.play("default")



func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity.y += gravity * delta

	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	
	var direction: float = Input.get_axis("move_left", "move_right")

	
	velocity.x = direction * SPEED

	
	if direction < 0:
		facing_direction = -1
	elif direction > 0:
		facing_direction = 1

	
	if not is_on_floor():
		if facing_direction < 0:
			$AnimatedSprite2D.play("jump_left")
		else:
			$AnimatedSprite2D.play("jump_right")
	elif direction < 0:
		$AnimatedSprite2D.play("move_left")
	elif direction > 0:
		$AnimatedSprite2D.play("move_right")
	else:
		$AnimatedSprite2D.play("default")

	
	move_and_slide()



func respawn() -> void:
	global_position = start_position
	velocity = Vector2.ZERO
	facing_direction = 1
	$AnimatedSprite2D.play("default")
