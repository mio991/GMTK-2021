extends PhysicsBody2D

class_name Character

export(NodePath) var sprite = "./Sprite"

onready var sprite_node = get_node(sprite)

var next_movment:Vector2 = Vector2.ZERO

func activate():
	print_debug(self," Activate")
	set_process_input(true)
	print_debug($AnimationPlayer)
	$AnimationPlayer.play("activated")

func deactivate():
	print_debug(self," Deactivate")
	set_process_input(false)

func _ready():
	deactivate()

func _input(event):
	if event.is_action_pressed("move_left", true):
		next_movment = Vector2.LEFT
	elif event.is_action_pressed("move_right", true):
		next_movment = Vector2.RIGHT
	elif event.is_action_pressed("move_up", true):
		next_movment = Vector2.UP
	elif event.is_action_pressed("move_down", true):
		next_movment = Vector2.DOWN
	
	if (event.is_action_released("move_left") or event.is_action_released("move_right") 
	or event.is_action_released("move_up") or event.is_action_released("move_down")):
		next_movment = Vector2.ZERO

func _process(delta):
	try_move(next_movment)

func try_move(move:Vector2):
	if sprite_node == null:
		return move
	
	if $Tween.is_active():
		return move
	
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
	
	$Ray.clear_exceptions()
	$Ray.set_cast_to(move * 32)
	$Ray.force_raycast_update()
	if $Ray.is_colliding():
		var collision = $Ray.get_collider() as PhysicsBody2D
		if collision.is_in_group("Moveable"):
			$Ray.add_exception(collision)
			$Ray.set_cast_to(move * 64)
			$Ray.force_raycast_update()
			if $Ray.is_colliding():
				return move
			$Tween.interpolate_property(collision, "position", collision.position, collision.position + move * 32, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT_IN)
		else:
			return move
	
	$Tween.interpolate_property(self, "position", position, position + move * 32, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT_IN)
	$Tween.start()
	
	return Vector2.ZERO


export(float) var outline_with = 0.0 setget _set_outline_width, _get_outline_width

func _set_outline_width(width:float):
	(self.material as ShaderMaterial).set_shader_param("width", width)

func _get_outline_width():
	return (self.material as ShaderMaterial).get_shader_param("width")
