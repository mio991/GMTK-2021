extends Node

class_name Level

export(NodePath) var initial_character

func _ready():
	print("Level Ready")
	$"/root/CharacterController".select(get_node(initial_character))
