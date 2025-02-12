extends Node2D

const CANNON_BALL = preload("res://scenes/cannon_ball/cannon_ball.tscn")

@onready var cannon: CANNON = $Cannon
var force: int = 1000

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_shoot_button_pressed() -> void:
	var cannon_ball = CANNON_BALL.instantiate()
	cannon_ball.global_position = cannon._get_ball_spawner_pos()
	get_parent().add_child(cannon_ball)
	var shoot_direction = cannon._get_throw_direction()
	cannon_ball.apply_central_impulse(shoot_direction * force)
