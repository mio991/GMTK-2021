extends Node

var needs_update = Array()

func _process(_delta):
	for obj in self.needs_update:
		obj.apply_changes()
	
	self.needs_update.clear()
