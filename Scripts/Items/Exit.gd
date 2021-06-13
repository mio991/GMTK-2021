extends Node2D

var active:bool = false

func state_changed(active:bool):
	self.active = active

func _on_Exit_interacted_with():
	if active:
		var container = get_tree().current_scene
		container.load_level()
