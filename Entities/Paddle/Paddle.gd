extends KinematicBody2D

func _physics_process(delta):
	movement()

func movement():
	var mouse_x_position = get_viewport().get_mouse_position().x
	position = Vector2(mouse_x_position, position.y)