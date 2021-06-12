extends Area2D

signal change_state(enabled)

func _on_Area2D_body_entered(body):
	if $Preassure_Plate.frame != 1:
		$Preassure_Plate.frame = 1
		emit_signal("change_state", true)


func _on_Area2D_body_exited(body):
	if get_overlapping_bodies().size() == 0:
		$Preassure_Plate.frame = 0
		emit_signal("change_state", false)
