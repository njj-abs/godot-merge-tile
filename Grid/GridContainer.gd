extends GridContainer

export(PackedScene) var panel_scene = load("res://Grid/Panel.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var instance = panel_scene.instance()
	instance.modulate = Color(80,40,50)
	instance.rect_position = Vector2(104, 0) 
	add_child(instance)
	print(instance.rect_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
