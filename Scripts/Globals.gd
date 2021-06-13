extends Node

var active_player:Node = null

func load_level(id:int):
	get_tree().current_scene.load_level(id)
