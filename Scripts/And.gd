extends Node

signal state_changed(state)

var state_1: bool;
var state_2: bool;

func _on_state_1_changed(state:bool):
	self.state_1 = state
	self.emit_signal("state_changed", self.state_1 and self.state_2)

func _on_state_2_changed(state:bool):
	self.state_2 = state
	self.emit_signal("state_changed", self.state_1 and self.state_2)

