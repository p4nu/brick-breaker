extends StaticBody2D

export (int) var health = 1
export (int) var points = 5

onready var scoreText = $"/root/World/ScoreText"

func hit():
	# Called when the ball hits the brick.
	
	# Update Score Text
	scoreText.score += points
	health -= 1
	if health <= 0:
		queue_free()
