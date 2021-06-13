extends KinematicBody2D

export(String, "red", "blue") var type = "red"
	

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
export(AudioStream) var character_music

onready var music_player:AudioStreamPlayer = self.get_node("AudioStreamPlayer")
onready var animation_player:AnimationPlayer = self.get_node("AnimationPlayer")

var direction = ViewDirection.Right
var is_moving = false

func _ready():
	self.music_player.stream = self.character_music
	$CharacterSprite.animation = type

func _process(_delta):	
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):	
	if is_moving:
		#self.move_and_slide(self.get_direction_vector() * self.max_speed * delta, Vector2(0,0), false, 4, 0.785398, false)
		self.move_and_slide(self.get_direction_vector() * self.max_speed * delta)

func start_charater_music(position:float):
	self.music_player.play(position)
	self.animation_player.play("Fade_In")
	pass

func stop_charater_music():
	self.animation_player.play("Fade_Out")
	return self.music_player.get_playback_position()
