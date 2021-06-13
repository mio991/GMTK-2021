extends Node

class_name Level

export(NodePath) var Spawn_1
export(NodePath) var Spawn_2

func spawn_characters(character1:Node2D, character2:Node2D):
	character1.global_transform = get_node(Spawn_1).global_transform
	character2.global_transform = get_node(Spawn_2).global_transform
