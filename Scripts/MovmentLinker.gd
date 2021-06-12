extends Node

onready var link_manager = self.get_node("/root/LinkManager")

func _on_link_or_unlink(body_1:RigidBody2D, body_2:RigidBody2D):
		# if link exist remove it and early return
	for link in link_manager.movment_links:
		if (link[0] == body_1 and link[1] == body_2) or (link[0] == body_2 and link[1] == body_1):
			link_manager.movment_links.erase(link) 
			return
	
	link_manager.movment_links.append([
		body_1,
		body_2
	])
	
	print_debug(link_manager.movment_links)
