extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func updateTemperature(ball,typeZone): 
	if typeZone == "cold":
		ball.temp += -15
		pass
	elif typeZone == "hot":
		ball.temp += 15
		pass
	return ball
