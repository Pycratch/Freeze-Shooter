extends Node2D


@export var bullet_ins :PackedScene
var bullet
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_shoot(pos, dir):
	print("shot2")
	bullet = bullet_ins.instantiate()
	add_child(bullet)
	bullet.position = pos
	bullet.direction = dir.normalized()
	bullet.add_to_group("bullets")
