extends Node2D


@onready var spawners:Array[Vector2] = [
	$Spawners/Spawner.position, 
	$Spawners/Spawner2.position, 
	$Spawners/Spawner3.position, 
	$Spawners/Spawner4.position, 
	$Spawners/Spawner5.position, 
	$Spawners/Spawner6.position, 
	$Spawners/Spawner7.position, 
	$Spawners/Spawner8.position, 
	$Spawners/Spawner9.position, 
	$Spawners/Spawner10.position, 
	$Spawners/Spawner11.position, 
	$Spawners/Spawner12.position, 
	$Spawners/Spawner13.position, 
	$Spawners/Spawner14.position, 
	$Spawners/Spawner15.position, 
	$Spawners/Spawner16.position, 
	$Spawners/Spawner17.position, 
	$Spawners/Spawner18.position, 
	$Spawners/Spawner19.position, 
	$Spawners/Spawner20.position, 
	$Spawners/Spawner21.position, 
	$Spawners/Spawner22.position, 
	$Spawners/Spawner23.position, 
	$Spawners/Spawner24.position, 
	$Spawners/Spawner25.position
]

var enemy
@export var enemy_ins_freeze:PackedScene
@export var enemy_ins_not_freeze:PackedScene
var enemy_ins

# Called when the node enters the scene tree for the first time.
func _ready():
	enemy_ins = enemy_ins_freeze


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_cd_timeout():
	enemy = enemy_ins.instantiate()
	enemy.position = spawners.pick_random()
	get_parent().add_child(enemy)
