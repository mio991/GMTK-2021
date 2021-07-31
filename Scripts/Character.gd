extends Area2D

class_name Character

export(NodePath) var sprite = "./Sprite"

onready var sprite_node = get_node(sprite)

var next_movment:Vector2 = Vector2.ZERO

func _unhandled_input(event):
	if event.is_action_pressed("move_left"):
		next_movment = Vector2.LEFT
	if event.is_action_pressed("move_right"):
		next_movment = Vector2.RIGHT
	if event.is_action_pressed("move_up"):
		next_movment = Vector2.UP
	if event.is_action_pressed("move_down"):
		next_movment = Vector2.DOWN
	
	if !$Tween.is_active():
		next_movment = try_move(next_movment)

func try_move(move:Vector2):
	if sprite_node == null:
		return move
	
	$Ray.set_cast_to(move * 32)
	$Ray.force_raycast_update()
	if $Ray.is_colliding():
		return move
	$Tween.interpolate_property(self, "position", position, position + move * 32, 1, Tween.TRANS_LINEAR)
	$Tween.start()
	
	match move:
		Vector2.LEFT:
			sprite_node.animation = "left"
		Vector2.RIGHT:
			sprite_node.animation = "right"
		Vector2.UP:
			sprite_node.animation = "up"
		Vector2.DOWN:
			sprite_node.animation = "down"
		Vector2.ZERO:
			sprite_node.animation = "default"
			
	return Vector2.ZERO

func _on_tween_completed():
	next_movment = try_move(next_movment)

func _process(delta):
	if !$Tween.is_active():
		next_movment = try_move(next_movment)
