extends Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Panel_gui_input(event):
	if event is InputEventScreenDrag:
		rect_position += event.relative
