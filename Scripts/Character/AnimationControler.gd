extends AnimatedSprite

enum ViewDirection {
	Unknow = 0,
	Right = 1,
	Up = 2
	RightUp = 3,
	Left = 4,
	LeftUp = 6,
	Down = 8,
	RightDown = 9,
	LeftDown = 12
}

func _on_Character_state_change(direction, moving):
	if moving:
		if direction & ViewDirection.Right:
			self.animation = "right"
		elif direction & ViewDirection.Left:
			self.animation = "left"
		elif direction & ViewDirection.Up:
			self.animation = "up"
		elif direction & ViewDirection.Down:
			self.animation = "down"
	else:
		self.animation = "default"
