extends Sprite

const hot = 200

const default_color = Color(1,1,1,1)
const hot_color = Color(1, 0.1,0.1,1)

func _on_state_changed(object):
	self.modulate = default_color.linear_interpolate(hot_color, object.temperature / hot)
