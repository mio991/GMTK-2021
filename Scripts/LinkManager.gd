extends Node

var movment_links = Array()

func _ready():
	self.set_physics_process(true)

func _physics_process(delta):
	for link in movment_links:
		var body_1:RigidBody2D = link[0]
		var body_2:RigidBody2D = link[1]
		var vel = (body_1.linear_velocity + body_2.linear_velocity) / 2
		body_1.apply_central_impulse(vel - body_1.linear_velocity)
		body_2.apply_central_impulse(vel - body_2.linear_velocity)
		
		var rot = (body_1.angular_velocity + body_2.angular_velocity) / 2
		body_1.apply_torque_impulse(rot - body_1.angular_velocity)
		body_2.apply_torque_impulse(rot - body_2.angular_velocity)
