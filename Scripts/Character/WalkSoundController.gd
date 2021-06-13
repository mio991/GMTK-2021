extends AudioStreamPlayer2D

func _on_Character_state_change(direction, moving):
	if self.playing != moving:
		self.playing = moving
