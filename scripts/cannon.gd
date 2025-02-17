extends StaticBody2D

class_name CANNON
var angle = GameManager.get_angle()
var rotation_amount = GameManager.rotation_amount
@onready var ball_spawner: Marker2D = $ball_spawner
@onready var controller: Control = $"../Controller"
@onready var aim_direction: Line2D = $aim_direction

func _ready() -> void:
	_update_aim_line()
func _process(delta: float) -> void:
	angle = GameManager.get_angle()
	if Input.is_action_pressed("left") and angle > 0:
		rotation += -rotation_amount * delta
		GameManager.decrease_angle()
		controller.update_label(angle)
	if Input.is_action_pressed("right") and angle < 90:
		rotation += rotation_amount * delta
		GameManager.increase_angle()
		controller.update_label(angle)
	rotation = clamp(rotation, 0, deg_to_rad(90))
	
	
	

func _get_throw_direction()-> Vector2:
	return (ball_spawner.global_position - self.global_position).normalized()
	
func _get_ball_spawner_pos()-> Vector2:
	return ball_spawner.global_position
	
func _get_rotation_degrees()-> float:
	return self.rotation_degrees
	
func set_cannon_rotation(amount: float)-> void:
	rotation += amount

func _update_aim_line():
	var start_pos = ball_spawner.position
	var direction = _get_throw_direction()
	var end_pos = start_pos + direction * 120  # Adjust length as needed

	aim_direction.clear_points()
	aim_direction.add_point(start_pos)
	aim_direction.add_point(end_pos)
