extends Area2D

export(NodePath) var pin_joint

onready var pin:PinJoint2D = get_node(pin_joint)

func _input(event):
	if event.is_action_released("pickup"):
		if !pin.node_b.is_empty():
			pin.node_b = ""
		else:
			var obj:Node = get_overlapping_bodies().pop_front()
			if obj != null:
				pin.node_b = obj.get_path()

