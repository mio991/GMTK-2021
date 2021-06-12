extends RigidBody2D

var ball = {
	temp=30
}
var lstBodyCollide = {}
onready var temperatureManager = get_node("../Node")

func _ready():
	contact_monitor = 2
	set_max_contacts_reported(15)
	pass

func _physics_process(delta):
	lstBodyCollide = get_colliding_bodies()
	
	if lstBodyCollide.size() >= 2 :
		if lstBodyCollide[1]: #collision
			ball = temperatureManager.updateTemperature(ball, "hot")
			print(ball.temp)
