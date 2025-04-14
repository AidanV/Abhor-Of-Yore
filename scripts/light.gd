extends StaticBody2D



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if get_node("../Player").canPick == false:
			get_tree().reload_current_scene()
		else:
			body.global_position = get_node("../Coffin").global_position
