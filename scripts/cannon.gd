extends StaticBody2D

class_name CANNON

var rotation_amount = GameManager.rotation_amount
@onready var ball_spawner: Marker2D = $ball_spawner


func _process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		rotation += -rotation_amount * delta
		SignalManager.on_angle_change.emit(self.rotation_degrees)
	if Input.is_action_pressed("right"):
		rotation += rotation_amount * delta
		SignalManager.on_angle_change.emit(self.rotation_degrees)
	rotation = clamp(rotation, 0, deg_to_rad(90))

func _get_throw_direction()-> Vector2:
	return (ball_spawner.global_position - self.global_position).normalized()
	
func _get_ball_spawner_pos()-> Vector2:
	return ball_spawner.global_position
	
func _get_rotation_degrees()-> float:
	return self.rotation_degrees
	
func set_cannon_rotation(amount: float)-> void:
	rotation += amount
