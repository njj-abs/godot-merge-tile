extends Node

export(PackedScene) var tile_scene = preload("res://demoOne/Tile.tscn")

const tiles = [
	{
		"value": 2,
		"position": {
			"x": 200,
			"y": 300
		}
	},
	{
		"value": 3,
		"position": {
			"x": 250,
			"y": 300
		}
	},
]

func _ready():
	var hammer = tile_scene.instance()
	hammer.get_node("Sprite").texture = load("res://icon.png")
	hammer.get_node("Label").value = 'hammer'
	hammer.rect_position = Vector2(200, 350)
	hammer.get_node("Sprite").region_rect = Rect2(0,0,64,64)
	add_child(hammer)
	
	for tile in tiles:
		var x = tile.position.x;
		var y = tile.position.y;
		
		var instance = tile_scene.instance();
		instance.rect_position = Vector2(x, y)
		instance.get_node("Label").text = str(tile.value)
		instance.get_node("Label").value = tile.value
		add_child(instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
