extends ColorPickerButton


func get_drag_data(_pos):
	# Use another colorpicker as drag preview.
	print('getdrag', _pos)
	var cpb = ColorPickerButton.new()
	print(color)
	cpb.color = color
	cpb.rect_size = Vector2(50, 50)
	set_drag_preview(cpb)
	# Return color as drag data.
	return color


func can_drop_data(_pos, data):
	print('canDrop_Data', _pos, data)
	return typeof(data) == TYPE_COLOR


func drop_data(_pos, data):
	print('dropData', _pos, data)
	color = data
