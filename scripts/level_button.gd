extends TextureButton

const HOVER_SCALE: Vector2 = Vector2(1.1, 1.1)
const DEFAULT_SCALE: Vector2 = Vector2(1.0, 1.0) 

@export var level_number: int = 01

@onready var level_label: Label = $MarginContainer/VBoxContainer/LevelLabel
@onready var score_label: Label = $MarginContainer/VBoxContainer/ScoreLabel
@onready var wood_audio: AudioStreamPlayer = $wood_audio
var level_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_label.text = str(level_number)
	var best_score = ScoreManager.get_best_for_level(str(level_number))
	score_label.text = str(best_score)
	level_scene = load("res://scenes/level/level_%s.tscn" % level_number)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	wood_audio.play()
	await get_tree().create_timer(1.0).timeout
	ScoreManager.set_level_selected(level_number)
	get_tree().change_scene_to_packed(level_scene)
	GameManager.set_angle(0)
	


func _on_mouse_entered() -> void:
	scale = HOVER_SCALE


func _on_mouse_exited() -> void:
	scale = DEFAULT_SCALE
