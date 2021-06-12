extends KinematicBody2D

export(float) var speed = 500

onready var music_player:Node = self.get_node("AudioStreamPlayer");

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = Vector2(0,0)
	if Input.is_action_pressed("move_right"):
		direction += Vector2(1,0)
	if Input.is_action_pressed("move_left"):
		direction += Vector2(-1,0)
	if Input.is_action_pressed("move_up"):
		direction += Vector2(0,-1)
	if Input.is_action_pressed("move_down"):
		direction += Vector2(0,1)
	
	direction = direction.clamped(1)
	
	self.move_and_slide(direction * self.speed * delta)

#func _input(event):
#	if(event.is_action_released("interact")):
#		self.get

func start_charater_music():
	pass
