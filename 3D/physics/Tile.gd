extends RigidBody

export(PackedScene) var tile_scene = load("res://3D/physics/Tile.tscn")

var is_drop = false
var is_entered = false
var colliedBody = null
var initial_position = 0
var value

func get_split_tile():
	var position = colliedBody.translation
	
	return [
		{
			"value": 4,
			"position": {
				"x": position.x + 0.8,
				"y": position.y,
				"z": position.z
			},
			"velocity": 15
		},
		{
			"value": 1,
			"position": {
				"x": position.x - 0.8,
				"y": position.y,
				"z": position.z
			},
			"velocity": -15
		},
	]

# Called when the node enters the scene tree for the first time.
func _ready():
	initial_position = get_translation()

func add_new_tile():
	var tile_instance = tile_scene.instance();
	tile_instance.translation = colliedBody.translation
	tile_instance.get_node("Label3D").text = str(value + colliedBody.value) 
	tile_instance.value = value + colliedBody.value
	colliedBody.queue_free()
	queue_free()
	$"..".add_child(tile_instance)

func add_split_tile():
	for tile in get_split_tile():
		var tween = $Tween
		var tile_instance = tile_scene.instance();
		var position = tile.position;
		var initial_scale = Vector3(0, 0.5, 0)
		var final_scale = Vector3(1, 1, 1)
		tile_instance.translation = Vector3(position.x, position.y, position.z)
		tween.interpolate_property(tile_instance, "scale", initial_scale, final_scale, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tile_instance.apply_impulse(Vector3(0.1, 0, 0), Vector3(0,0,tile.velocity))

		tile_instance.get_node("Label3D").text = str(tile.value)
		tile_instance.value = tile.value
		colliedBody.queue_free()

		$"..".add_child(tile_instance)
		tween.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_drop and is_entered:
		is_drop = false
		is_entered = false
		if str(self.value) == 'hammer':
			add_split_tile()
		elif str(colliedBody.value) != 'hammer':
			add_new_tile()
	elif (str(self.value) != 'hammer') and is_drop and (not is_entered) and  translation.x != initial_position.x:
		translation = initial_position


func _on_Draggable_drag_move(node, cast):
	var x = cast['position'].x
	var z = cast['position'].z
	
	set_translation(Vector3(x, ($Tile.scale.y / 2), z))


func _on_Tile_body_entered(body):
	if body.name.find('Tile') > -1:
		is_entered = true
		colliedBody = body


func _on_Tile_body_exited(body):
	if body.name.find('Tile') > -1:
		is_entered = false


func _on_Draggable_drag_start(node):
	is_drop = false


func _on_Draggable_drag_stop(node):
	is_drop = true
