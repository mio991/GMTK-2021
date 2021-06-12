extends RigidBody2D

var temperature = 30

var lstBodyCollide = {}
onready var temperatureManager = get_node("../Node")

signal collide(typeObjectCollide, delta)

func _ready():
	contact_monitor = 2
	set_max_contacts_reported(15)
	pass

func _physics_process(delta):
	lstBodyCollide = get_colliding_bodies()

	if lstBodyCollide.size() >= 2 :
		if lstBodyCollide[1]: #collision
			emit_signal("collide", "hot", delta)
			pass
	print(temperature)
	
func _on_Node_decreaseTemp(temp):
	temperature+=temp

func _on_Node_increaseTemp(temp):
	temperature+=temp
