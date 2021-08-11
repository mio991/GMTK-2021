extends Node

func crosfade_to(stream:AudioStream):
	if $AudioStreamPlayer1.playing and $AudioStreamPlayer2.playing:
		return false
	
	var next_player:AudioStreamPlayer
	var current_player:AudioStreamPlayer
	if $AudioStreamPlayer1.playing:
		next_player = $AudioStreamPlayer2
		current_player = $AudioStreamPlayer1
	else:
		next_player = $AudioStreamPlayer1
		current_player = $AudioStreamPlayer2
		
	next_player.stream = stream
	next_player.play(current_player.get_playback_position())
	
	$Tween.interpolate_property(next_player, "volume_db", -80, 1, 1, Tween.TRANS_CUBIC)
	$Tween.interpolate_property(current_player, "volume_db", 1, -80, 1, Tween.TRANS_CUBIC)
	$Tween.start()
	
	yield($Tween, "tween_all_completed")
	current_player.stop()
