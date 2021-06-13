extends Node2D

func _on_PreassuerPlate_change_state(enabled):
	if !enabled:
		$AnimationPlayer.play("Fade_Out")
