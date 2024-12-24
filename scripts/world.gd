extends Node2D

var enemy_freeze_state = true
@onready var enemy_spawner = $EnemySpawner
@onready var player = $Player
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if enemy_freeze_state == true:
		$EnemySpawner.enemy_ins = enemy_spawner.enemy_ins_freeze
	elif enemy_freeze_state == false:
		enemy_spawner.enemy_ins = enemy_spawner.enemy_ins_not_freeze
	
	if player.health <= 0:
		get_tree().change_scene_to_file("res://scenes/death.tscn")


func _on_player_freeze():
	enemy_freeze_state = !enemy_freeze_state
