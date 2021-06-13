extends Node

var needs_update = Array()

func _process(delta):
	print_debug(self.needs_update)
	for obj in self.needs_update:
		obj.apply_changes()
	
	self.needs_update.clear()
