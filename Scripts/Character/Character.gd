extends KinematicBody2D

signal state_change(direction, moving)

enum ViewDirection {
	Unknow = 0,
	Right = 1,
	Up = 2
	RightUp = 3,
	Left = 4,
	LeftUp = 6,
	Down = 8,
	RightDown = 9,
	LeftDown = 12
}

func get_direction_vector():
	var res = Vector2(0,0)
	if self.direction & ViewDirection.Right:
		res.x = 1
	elif self.direction & ViewDirection.Left:
		res.x = -1
	if self.direction & ViewDirection.Up:
		res.y = -1
	elif self.direction & ViewDirection.Down:
		res.y = 1
	
	return res.clamped(1)

export(float) var max_speed = 5000

var direction = ViewDirection.Right
var is_moving = false

func _process(_delta):
	var old_direction = self.direction
	var old_moving = self.is_moving
	
	var view_direction = ViewDirection.Unknow
	if Input.is_action_pressed("move_right"):
		view_direction += ViewDirection.Right
	elif Input.is_action_pressed("move_left"):
		view_direction += ViewDirection.Left
	if Input.is_action_pressed("move_up"):
		view_direction += ViewDirection.Up
	elif Input.is_action_pressed("move_down"):
		view_direction += ViewDirection.Down
	
	if(view_direction != ViewDirection.Unknow):
		self.direction = view_direction
		
	is_moving = view_direction != ViewDirection.Unknow
	
	if old_direction != self.direction or old_moving != self.is_moving:
		self.emit_signal("state_change", self.direction, self.is_moving)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):	
	if is_moving:
		self.move_and_slide(self.get_direction_vector() * self.max_speed * delta, Vector2(0,0), false, 4, 0.785398, false)
		#self.move_and_slide(self.get_direction_vector() * self.max_speed * delta)

