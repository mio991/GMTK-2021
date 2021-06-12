extends KinematicBody2D

export(float) var speed = 500
export(AudioStream) var character_music

onready var music_player:AudioStreamPlayer = self.get_node("AudioStreamPlayer")
onready var animation_player:AnimationPlayer = self.get_node("AnimationPlayer")

func _ready():
	self.music_player.stream = self.character_music

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

func start_charater_music(position:float):
	self.music_player.play(position)
	self.animation_player.play("Fade_In")

func stop_charater_music():
	self.animation_player.play("Fade_Out")
	return self.music_player.get_playback_position()
