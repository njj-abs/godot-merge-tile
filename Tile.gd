extends Panel

export(PackedScene) var tile_scene = load("res://demoOne/Tile.tscn")

var drop = false
var entered = false
var area = null
var initial_position = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	initial_position = rect_position

func get_text():
	print(area.get_parent().get_node("Label").value)
	var colliedText = area.get_parent().get_node("Label").text.to_int();
	var selfText = self.get_node("Label").text.to_int();
	var text = colliedText + selfText;
	
	return text

func add_new_tile():
	var tile_instance = tile_scene.instance();

	tile_instance.rect_position = Vector2(area.get_parent().rect_position.x, area.get_parent().rect_position.y)
	tile_instance.get_node("Label").text = str(get_text())
	area.get_parent().queue_free()
	queue_free()
	$"..".add_child(tile_instance)

func get_split_tile():
	return [
		{
		"value": 3,
		"position": {
			"x": 500,
			"y": 300
		}
	},
	{
		"value": 7,
		"position": {
			"x": 550,
			"y": 300
		}
	},
	]

func add_split_tile():
	for tile in get_split_tile():
		var tile_instance = tile_scene.instance();

		tile_instance.rect_position = Vector2(tile.position.x, tile.position.y)
		tile_instance.get_node("Label").text = str(tile.value)
		area.get_parent().queue_free()

		$"..".add_child(tile_instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if drop and entered:
		drop = false
		entered = false
		if (str(self.get_node("Label").value) != ('hammer')):
			add_new_tile()
		else:
			rect_position = initial_position
			add_split_tile()
			
	elif drop and not entered and rect_position != initial_position:
		rect_position = initial_position

func _on_Tile_gui_input(event):
	if event is InputEventScreenDrag:
		rect_position += event.relative
		drop = false
	elif event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			drop = true

func _on_Area2D_area_entered(data):
	entered = true
	area = data

func _on_Area2D_area_exited(area):
	entered = false
