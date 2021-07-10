extends Area2D

var active:bool = false

export(NodePath) var Animated_Sprite = "./AnimatedSprite"

onready var _sprite:AnimatedSprite = get_node(Animated_Sprite)

func _ready():
	_sprite.connect("animation_finished", self, "_on_AnimatedSprite_animation_finished")

func state_changed(state:bool):
	if self.active != state:
		if state:
			_sprite.play()
			$AudioStreamPlayer2D.play()
		else:
			_sprite.play("", true)
			$AudioStreamPlayer2D.play()
			self.active = false


func _on_AnimatedSprite_animation_finished():
	self.active = true
	if !get_overlapping_bodies().empty():
		get_tree().current_scene.load_level()


func _on_Exit_body_entered(body):
	if self.active:
		get_tree().current_scene.load_level()


