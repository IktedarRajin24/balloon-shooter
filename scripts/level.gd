extends Node2D

@onready var camera: Camera2D = $Camera2D
@onready var viewport_size: Vector2 = get_viewport_rect().size
@onready var cannon: CANNON = $Cannon
@onready var cannon_audio: AudioStreamPlayer = $cannon_audio

const CANNON_BALL = preload("res://scenes/cannon_ball/cannon_ball.tscn")

var force: int = 1000
var shake_intensity: float = 0.0
var shake_decay: float = 5.0 

func _ready() -> void:
	camera.position = Vector2(viewport_size.x / 2, viewport_size.y / 2)

func _process(delta: float) -> void:
	if shake_intensity > 0:
		camera.offset = Vector2(
			randf_range(-shake_intensity, shake_intensity),
			randf_range(-shake_intensity, shake_intensity)
		)
		shake_intensity = lerp(shake_intensity, 0.0, shake_decay * delta)
	else:
		camera.offset = Vector2.ZERO

func _on_shoot_button_pressed() -> void:
	cannon_audio.play()
	var cannon_ball = CANNON_BALL.instantiate()
	cannon_ball.global_position = cannon._get_ball_spawner_pos()
	get_parent().add_child(cannon_ball)
	var shoot_direction = cannon._get_throw_direction()
	cannon_ball.apply_central_impulse(shoot_direction * force)
	shake_intensity = 5.0
	SignalManager.on_attempt_made.emit() 
	await get_tree().create_timer(10.0).timeout
	if is_instance_valid(cannon_ball):
		cannon_ball.queue_free()
