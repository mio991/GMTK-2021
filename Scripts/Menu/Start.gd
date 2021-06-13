extends Button

export(int) var Level = 0

func _on_pressed():
	get_tree().change_scene("res://LevelContainer.tscn")
	$"/root/Globals".call_deferred("load_level", self.Level)
