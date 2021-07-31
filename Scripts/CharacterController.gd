extends Node

var characters = {};

func _ready():
	get_tree().connect("node_added", self, "_on_node_added");

func _on_node_added(node:Node):
	if node is Character:
		characters[node.type] = node;

func _on_node_removed(node:Node):
	characters.values().has()
	pass
