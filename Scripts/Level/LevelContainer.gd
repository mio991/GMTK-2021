extends Node2D

class_name LevelContainer

const Levels = [
	preload("res://Levels/00.tscn"),
	preload("res://Levels/01.tscn"),
	preload("res://Levels/02.tscn"),
	preload("res://Levels/03.tscn"),
	preload("res://Levels/03.tscn")
]

var currentLevel = -1
var level:Level = null

# Called when the node enters the scene tree for the first time.
func _ready():
	load_level()

func load_level(idx:int = -1):
	if self.level != null:
		self.remove_child(self.level)
	
	if idx >= 0:
		currentLevel = idx
	else:
		currentLevel += 1
	
	var scene:PackedScene = Levels[currentLevel]
	self.level = scene.instance()
	add_child(level)
	level.spawn_characters($CharacterSwitcher/Character1, $CharacterSwitcher/Character2)
	
	pass

func _input(event):
	if event.is_action_released("reload"):
		load_level(self.currentLevel)
