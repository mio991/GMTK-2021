extends StaticBody2D

class_name Interactable, "res://Assets/Icons/pan_tool.svg"

signal is_used_by(user)

func _init():
	self.set_collision_layer_bit(2, true)
