extends Node2D

func _input(event):
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
