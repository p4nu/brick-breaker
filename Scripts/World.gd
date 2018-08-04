extends Node2D

const BALL = preload("res://Entities/Ball/Ball.tscn") 

onready var paddle = $Paddle

func _unhandled_input(event):
	if event.is_action_pressed("click"):
		var ball = BALL.instance()
		get_tree().root.add_child(ball)
		ball.new_ball()
		set_process_unhandled_input(false)

func ball_lost():
	set_process_unhandled_input(true)