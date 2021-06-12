extends RigidBody2D

var char1 = {
	temp=30
}

var char2 = char1

# Called when the node enters the scene tree for the first time.
func _ready():
	print('ready')

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_RigidBody2D_body_entered(body):
	print("ss")
	if body.get_name() == "Character1":
		print("Character1")
		#manage temperarure of Character1
	elif body.get_name() == "Character2":
		print("Character2")
		#manage temperarure of Character2
