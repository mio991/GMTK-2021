extends Button

export(PackedScene) var level

func _on_pressed():
	get_tree().change_scene_to(level)
