extends RigidBody

var drop = false
var entered = false
var area = null
var initial_position = 0
var value

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Draggable_drag_move(node, cast):
	var x = cast['position'].x
	set_translation(Vector3(x, 0.5, 0))


func _on_Tile_body_entered(body):
	entered = true
	area = body
