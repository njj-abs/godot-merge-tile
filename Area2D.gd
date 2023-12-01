extends Area2D
#
#var label: Label
#
#func _ready():
#	pass
#
#func _on_Area2D_area_entered(area):
#	print('entered')
#	var label = area.get_node("Label");
#	var parentLabel= self.get_node("Label").text;
#	var text = parentLabel.to_int() + label.text.to_int();
#
#	self.get_node("Label").text = str(text);
#	print(self.get_node("Label").text)
#
#
#	area.queue_free()
#
#func _on_Area2D_area_exited(area):
#	pass # Replace with function body.
