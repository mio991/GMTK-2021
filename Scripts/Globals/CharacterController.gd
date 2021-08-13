extends Node

var selected_character:Character = null

func _input(event):
	if event.is_action_pressed("switch_character"):
		var characters = get_tree().get_nodes_in_group("Character")
		print_debug("Characters: ",characters)
		if !characters.empty():
			select(characters[(characters.find(self.selected_character) + 1) % characters.size()])

func select(character:Character):
	if self.selected_character != null:
		self.selected_character.deactivate()
	character.activate()
	self.selected_character = character

func remove(character:Character):
	if self.selected_character == character:
		self.selected_character = null
