extends Area2D

signal interacted_with

#onready var gloabls = get_node("/root/Globals")

func _input(event):
	if(event.is_action_released("interact")):
		for body in self.get_overlapping_bodies():
			#if body == self.gloabls.active_player:
				self.emit_signal("interacted_with")
