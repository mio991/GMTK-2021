extends Node

func _on_link_or_unlink(body_1, body_2):
	print_debug(body_1, body_2)
	for link in get_children():
		if link is PinJoint2D and (
			(link.node_a == body_1.get_path() and link.node_b == body_2.get_path()) or
			(link.node_a == body_2.get_path() and link.node_b == body_1.get_path())
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
