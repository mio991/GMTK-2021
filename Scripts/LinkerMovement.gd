extends Node2D

class_name LinkerMovement

var current_body: PhysicsBody2D = null

export(NodePath) var other_end

onready var other_linker: LinkerMovement = get_node(other_end)

func _on_Interactable_is_used_by(user:Character):
	if other_linker.current_body != null and self.current_body != null:
		# ToDo: implement Link
		pass

func _on_Joiner_body_entered(body:PhysicsBody2D):
	current_body = body

func _on_Joiner_body_exited(body:PhysicsBody2D):
	if self.current_body == body:
		current_body = null
