class_name Player extends CharacterBody2D


@export var SPEED = 350.0
@export var JUMP_VELOCITY = -400.0
@onready var shoot_cd = $Shoot_CD
var health = 10
@onready var freeze_timer = $"Freeze Timer"

#signals
signal freeze
signal shoot

#shooting variables
var can_shoot = true

#Making the freeze state
var freeze_state = false

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction.normalized() * SPEED

	move_and_slide()
	
	#make shooting
	if Input.is_action_just_pressed("shoot") and can_shoot:
		var dir = get_global_mouse_position() - position
		shoot.emit(position, dir)
		can_shoot = false
		shoot_cd.start()
	
	$CanvasLayer/textpanel/text.text = "Health: " + str(health)


func _on_freeze_button_pressed():
	freeze.emit()


func _on_shoot_cd_timeout():
	can_shoot = true


func _on_hitbox_body_entered(body):
	if body.is_in_group("Enemy"):
		health -= 2
		body.queue_free()


func _on_heal_pressed():
	if freeze_state == false:
		SPEED = 0
		freeze_timer.start()
		freeze_state = true
	elif freeze_state:
		SPEED = 350.0
		freeze_timer.stop()
		freeze_state = false


func _on_freeze_timer_timeout():
	health += 1
