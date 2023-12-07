extends RigidBody

export(PackedScene) var tile_scene = load("res://3D/physics/Tile.tscn")

var is_drop = false
var is_entered = false
var colliedBody = null
var initial_position = 0
var value

# Called when the node enters the scene tree for the first time.
func _ready():
	initial_position = get_translation()

func add_new_tile():
	var tile_instance = tile_scene.instance();

	tile_instance.translation = colliedBody.translation
	tile_instance.get_node("Label3D").text = str(value + colliedBody.value)
	colliedBody.queue_free()
	queue_free()
	$"..".add_child(tile_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_drop and is_entered:
		is_drop = false
		is_entered = false
		
		add_new_tile()
#
	elif is_drop and not is_entered and translation != initial_position:
		translation = initial_position


func _on_Draggable_drag_move(node, cast):
	var x = cast['position'].x
	set_translation(Vector3(x, 0.5, 0))


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
