extends Node

signal link_or_unlink(body_1, body_2)

export(NodePath) var Connector1
export(NodePath) var Connector2

onready var connector_1 = self.get_node(self.Connector1)
onready var connector_2 = self.get_node(self.Connector2)


func _ready():
	connector_1.connect("interacted_with", self, "try_link_or_unlink")
	connector_2.connect("interacted_with", self, "try_link_or_unlink")

func try_link_or_unlink():
	var body_1:Node = get_connectable_body(connector_1)
	var body_2:Node = get_connectable_body(connector_2)
	
	if body_1 != null and body_2 != null:
		self.emit_signal("link_or_unlink", body_1, body_2)

func get_connectable_body(area:Area2D):
	var res:Node = null
	
	for body in area.get_overlapping_bodies():
		if body.get_collision_layer_bit(1):
			res = body
			break
	return res
