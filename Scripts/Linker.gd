extends Node

signal link(entities)

func _ready():
	for child in self.get_children():
		if child.has_signal("interacted_with"):
			child.connect("interacted_with", self, "try_link")

func try_link():
	var bodies = Array()
	for child in self.get_children():
		if child is Area2D:
			for body in child.get_overlapping_bodies():
				if body.get_collision_layer_bit(1):
					bodies.append(body)
	
	if bodies.size() >= 2:
		self.emit_signal("link", bodies)
