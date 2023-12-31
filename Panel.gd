extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Panel_gui_input(event):
	if event is InputEventScreenDrag:
		rect_position += event.relative


func _on_Area2D_area_entered(area):
	var label = area.get_parent().get_node("Label")
	print('entered',label.text);
	if area is Area2D and area != self:
		self.queue_free()


func _on_Area2D_area_exited(area):
	print('exit')
