extends Spatial

export(PackedScene) var tile_scene = load("res://3D/physics/Tile.tscn")

var drop = false
var entered = false
var area = null
var initial_position = 0

const tiles = [
	{
		"value": 2,
		"position": {
			"x": 1.5,
			"y": 0.3,
			"z": 0
		}
	},
	{
		"value": 3,
		"position": {
			"x": -1,
			"y": 0.3,
			"z": 0
		}
	},
]

# Called when the node enters the scene tree for the first time.
func _ready():
	var hammer = tile_scene.instance();
	hammer.translation = Vector3(-1, 0.3, 2)
	hammer.value = 'hammer'
	hammer.get_node("Label3D").pixel_size = 0.03

	hammer.get_node("Tile").get_node("Plane").set_surface_material(0, SpatialMaterial.new())
	hammer.get_node("Tile").get_node("Plane").get_surface_material(0).albedo_texture = load("res://3D/hammer.png")
	
	add_child(hammer)
	
	for tile in tiles:
		var x = tile.position.x;
		var y = tile.position.y;
		var z = tile.position.z;
		
		var instance = tile_scene.instance();
		instance.translation = Vector3(x, y, z)
#		instance.linear_velocity.x = 7
#		instance.linear_velocity.z = 7
		instance.get_node("Label3D").text = str(tile.value)
		instance.value = tile.value
		add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
