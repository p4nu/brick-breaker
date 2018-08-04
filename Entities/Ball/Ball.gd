extends RigidBody2D

export (int) var speed_up = 4
export (int) var max_speed = 300

onready var world = $"/root/World"
onready var paddle = $"/root/World/Paddle"

func new_ball():
	position = Vector2(paddle.position.x, paddle.position.y - 16)
	linear_velocity = Vector2(200, -200)

func _on_Ball_body_entered(body):
	# Called when received collision signal from the Ball node.
	# Signal connected via Godot's UI.
	if body.has_method("hit"):
		body.hit()
	
	elif body.get_name() == "Paddle":
		# Linear velocity returns Vector2. We calculate the
		# length of those two values which is the current
		# speed of the ball.
		var speed = linear_velocity.length()
		var direction = position - body.get_node("Anchor").global_position
		linear_velocity = direction.normalized() * min(speed + speed_up, max_speed)


func _on_Visibility_screen_exited():
	# Called when Visibility node signals it has exited the screen.
	# Signal connected via Godot's UI.
	world.ball_lost()
	queue_free()
