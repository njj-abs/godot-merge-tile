extends Spatial

export(PackedScene) var tile_scene = preload("res://3D/physics/Tile.tscn")

var drop = false
var entered = false
var area = null
var initial_position = 0

const tiles = [
	{
		"value": 2,
		"position": {
			"x": 0,
			"y": 0.1,
			"z": 0
		}
	},
	{
		"value": 3,
		"position": {
			"x":0,
			"y": 0.1,
			"z": 0
		}
	},
]

# Called when the node enters the scene tree for the first time.
func _ready():
	for tile in tiles:
		var x = tile.position.x;
		var y = tile.position.y;
		var z = tile.position.z;
		
		var instance = tile_scene.instance();
		print(instance.translation)
		instance.translation = Vector3(x, y, z)
#		instance.linear_velocity.x = 7
#		instance.linear_velocity.z = 7
		instance.get_node("Label3D").text = str(tile.value)
		instance.get_node("Label3D").value = tile.value
		add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
