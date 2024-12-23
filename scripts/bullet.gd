extends Area2D


var speed = 500.0
var JUMP_VELOCITY = -400.0
var direction: Vector2


func _process(delta):
	position += speed * direction * delta


func _on_timer_timeout():
	queue_free()


func _on_body_entered(body):
	queue_free()
	if body.is_in_group("Enemy"):
		body.queue_free()
		queue_free()
