extends RigidBody2D
var picked = false

func _physics_process(delta):
	if picked == true:
		self.position = get_node("../Player/Marker2D").global_position

func _input(event):
	if Input.is_action_just_pressed("interact") and picked == false:
		var bodies = $Area2D.get_overlapping_bodies()
		for body in bodies:
			if body.name == "Player" and get_node("../Player").canPick == true:
				picked = true
				get_node("../Player").canPick = false
	elif Input.is_action_just_pressed("interact") and picked == true:
		picked = false
		get_node("../Player").canPick = true
		print(get_node("../Player").velocity, get_node("../Player").throw_force, get_node("../Player").velocity * get_node("../Player").throw_force)
		apply_impulse(get_node("../Player").velocity * get_node("../Player").throw_force, Vector2())
