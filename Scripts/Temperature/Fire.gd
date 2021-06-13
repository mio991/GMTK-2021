extends Area2D

export(float) var temperature = 200

func _process(delta):
	for body in get_overlapping_bodies():
		if body.has_method('apply_state'):
			body.apply_state(delta, self.temperature)
