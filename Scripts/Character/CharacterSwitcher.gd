extends Node

export(NodePath) var Character_1
export(NodePath) var Character_2

onready var gloabls = get_node("/root/Globals")

var inactive: Node
var active: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	self.active = self.get_node(self.Character_2)
	self.inactive = self.get_node(self.Character_1)
	self.switch()

func switch():	
	var newActive = self.inactive
	
	self.inactive = self.active
	# Stop Inactive Character here
	self.inactive.set_physics_process(false)
	self.inactive.set_process(false)
	var playback = self.inactive.stop_charater_music()
	
	
	self.active = newActive
	# Start active Character here
	self.active.set_physics_process(true)
	self.active.set_process(true)
	self.active.start_charater_music(playback)
	self.gloabls.active_player = self.active

func _input(event):
	if event.is_action_released("switch_character"):
		self.switch()
