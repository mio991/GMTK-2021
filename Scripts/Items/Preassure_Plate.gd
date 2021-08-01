extends Area2D

signal change_state(enabled)

func _on_object_entered(_body):
	if $Preassure_Plate.frame != 1:
		$Preassure_Plate.frame = 1
		emit_signal("change_state", true)


func _on_object_exited(_body):
	if get_overlapping_bodies().size() == 0:
		$Preassure_Plate.frame = 0
		emit_signal("change_state", false)
