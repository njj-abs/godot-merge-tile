extends RigidBody


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Dragable_drag_move(node, cast):
	var x =cast['position'].x

	set_translation(Vector3(x,1.5,0))


func _on_RigidBody_body_entered(body):
	print('entered', self) 


func _on_Dragable_drag_stop(node):
	var x = get_translation().x
	set_translation(Vector3(x, 1, 0))
	set_physics_process(true)
