extends Area2D

var active:bool = false

func _ready():
	$Sprite.connect("animation_finished", self, "_on_AnimatedSprite_animation_finished")

func state_changed(state:bool):
	if self.active != state:
		if state:
			$Sprite.play()
			$AudioStreamPlayer2D.play()
		else:
			$Sprite.play("", true)
			$AudioStreamPlayer2D.play()
			self.active = false


func _on_AnimatedSprite_animation_finished():
	self.active = true
	if !get_overlapping_bodies().empty():
		get_tree().current_scene.load_level()


func _on_Exit_body_entered(body):
	if self.active:
		get_tree().current_scene.load_level()


