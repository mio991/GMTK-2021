extends Area2D

func _on_Area2D_body_entered(body):
	$Preassure_Plate.frame = 1


func _on_Area2D_body_exited(body):
	if get_overlapping_bodies().size() == 0:
		$Preassure_Plate.frame = 0
