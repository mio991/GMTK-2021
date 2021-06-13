extends Area2D

export(String, "red", "blue") var type = "red"

var active:bool = false

func _ready():
	print_debug(type)
	$AnimatedSprite.animation = type

func state_changed(state:bool):
	if state:
		$AnimatedSprite.play(type)
	else:
		$AnimatedSprite.play(type, true)
		self.active = false


func _on_AnimatedSprite_animation_finished():
	self.active = true
	if !get_overlapping_bodies().empty():
		get_tree().current_scene.load_level()


func _on_Exit_body_entered(body):
	if self.active:
		get_tree().current_scene.load_level()
