extends CharacterBody2D

@export var speed = 300
@export var gravity = 30
@export var jump_force = 700
@export var throw_force = 1.5
var canPick = true

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000
	if Input.is_action_just_pressed("jump"):
		velocity.y = -jump_force
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	velocity.x = speed * horizontal_direction
	move_and_slide()
