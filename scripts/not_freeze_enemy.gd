class_name Enemy extends CharacterBody2D


var SPEED = 300.0
var JUMP_VELOCITY = -400.0
@onready var player = $"../Player"


func _physics_process(delta):
	# Add the gravity.
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * SPEED
	move_and_slide()
