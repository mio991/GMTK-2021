extends Node

enum zone {HOT=10, COLD=-10}

signal decreaseTemp (temp)
signal increaseTemp (temp)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_RigidBody2D2_collide(typeObjectCollide, delta):
	#top
	if typeObjectCollide == "cold":
		 emit_signal("decreaseTemp", zone.COLD*delta)
	elif typeObjectCollide == "hot":
		emit_signal("increaseTemp",zone.HOT*delta)

func _on_RigidBody2D_collide(typeObjectCollide, delta):
	#bottom
	if typeObjectCollide == "cold":
		 emit_signal("decreaseTemp", zone.COLD*delta)
	elif typeObjectCollide == "hot":
		emit_signal("increaseTemp",zone.HOT*delta)
