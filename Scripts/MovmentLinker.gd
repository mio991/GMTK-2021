extends Node

func _on_link_or_unlink(body_1, body_2):
	for link in get_children():
		print_debug(link.node_a)
		if link is PinJoint2D:
			var node_a = link.get_node(link.node_a)
			var node_b = link.get_node(link.node_b)
			if(
				(node_a == body_1 and node_b == body_2) or
				(node_a == body_2 and node_b == body_1)
				):
					remove_child(link)
					return
	var link = PinJoint2D.new()
	link.node_a = body_1.get_path()
	link.node_b = body_2.get_path()
	link.bias = 0.5
	link.softness = 1
	add_child(link)
	pass
