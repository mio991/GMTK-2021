extends KinematicBody2D

class Pickup:
	var node: KinematicBody2D
	var og_parent:Node
	var og_collision_layers: int
	var og_collision_mask:int
	
	func _init(node:KinematicBody2D, par:Node, coll:int, mask:int):
		self.node = node
		self.og_parent = par
		self.og_collision_layers = coll
		self.og_collision_mask = mask


export(float) var speed = 500
export(AudioStream) var character_music

onready var music_player:AudioStreamPlayer = self.get_node("AudioStreamPlayer")
onready var animation_player:AnimationPlayer = self.get_node("AnimationPlayer")

onready var pick_area:Area2D = self.get_node("PickArea")

var held: Pickup

var move:Vector2 = Vector2(0,-1)

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
	
	if direction.length() != 0:
		self.move = direction
	
	self.move_and_slide(direction * self.speed * delta)


func _input(event):
	if event.is_action_released("pickup"):
		if self.held != null:
			self.drop()
			return
		
		var pickables = self.pick_area.get_overlapping_bodies()
		print_debug(pickables)
		if !pickables.empty():
			self.pickup(pickables.front())
			

func pickup(obj:KinematicBody2D):
	self.held = Pickup.new(obj, obj.get_parent(), obj.collision_layer, obj.collision_mask)
	self.held.og_parent.remove_child(obj)
	self.add_child(obj)
	self.move_child(obj, 0)
	
	obj.collision_layer = 0
	obj.collision_mask = 0
	obj.set_position(Vector2(12,12))

func drop():
	self.held.node.set_position(move * 36)
	var transform = self.held.node.get_global_transform()
	
	self.remove_child(self.held.node)
	self.held.og_parent.add_child(self.held.node)
	
	self.held.node.set_global_transform(transform)
	self.held.node.collision_layer = self.held.og_collision_layers
	self.held.node.collision_mask = self.held.og_collision_mask
	
	self.held = null

func start_charater_music(position:float):
	self.music_player.play(position)
	self.animation_player.play("Fade_In")

func stop_charater_music():
	self.animation_player.play("Fade_Out")
	return self.music_player.get_playback_position()
