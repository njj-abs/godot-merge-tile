extends Node2D

export(PackedScene) var tile_scene = load("res://physics/RigidBody2D.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(delta, floor(delta * pow(10, 3)) / pow(10, 3))

	if (floor(delta * pow(10, 3)) / pow(10, 3)) == 0.005:
		var instance = tile_scene.instance()
		
		instance.position = Vector2(340, 393)
		
		add_child(instance)
