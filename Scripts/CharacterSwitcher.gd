extends Node

export(NodePath) var Character_1
export(NodePath) var Character_2

var inactive: Node
var active: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	self.active = self.get_node(self.Character_2)
	self.inactive = self.get_node(self.Character_1)
	self.switch()

func switch():
	print("Switch!")
	
	var newActive = self.inactive
	
	self.inactive = self.active
	self.inactive.set_physics_process(false)
	
	self.active = newActive
	self.active.set_physics_process(true)

func _input(event):
	if event.is_action_released("switch_character"):
		self.switch()
