extends VBoxContainer

export(AudioStream) var music

# Called when the node enters the scene tree for the first time.
func _ready():
	$"/root/BackgroundMusic".crosfade_to(music)
	$Level0.grab_focus()
