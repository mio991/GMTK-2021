extends RigidBody2D

const Temperature_Exchange_Speed = 0.5

class_name SystemsObject

signal state_changed(object)

onready var manager = get_node("/root/SystemManager")

var temprature:float = 20
var temprature_delta:float = 0

func _process(delta):
	for body in get_colliding_bodies():
		if body.has_method('apply_state'):
			body.apply_state(delta, self.temprature)
	if temprature_delta != 0:
		manager.needs_update.append(self)
	
func apply_state(delta:float, temp:float):
	temprature_delta += ((temp + self.temprature) / 2 - self.temprature) * Temperature_Exchange_Speed*delta
	pass


func apply_changes():
	if self.temprature_delta != 0:
		self.temprature += self.temprature_delta
		self.temprature_delta = 0
		self.emit_signal("state_changed", self)

