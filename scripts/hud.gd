extends Control

const MAIN_MENU = preload("res://scenes/main_menu/main_menu.tscn")

@onready var level_label: Label = $MarginContainer/VBoxContainer/LevelLabel
@onready var attemps_label: Label = $MarginContainer/VBoxContainer/AttempsLabel
@onready var v_box_container_2: VBoxContainer = $MarginContainer/VBoxContainer2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_label.text = "LEVEL %s" % ScoreManager.get_level_selected()
	update_attempts(0)
	SignalManager.on_score_updated.connect(update_attempts)
	SignalManager.on_level_complete.connect(on_level_complete)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		get_tree().change_scene_to_packed(MAIN_MENU)

func update_attempts(attempts: int)-> void:
	attemps_label.text = "ATTEMPTS %s" %attempts

func on_level_complete()-> void:
	v_box_container_2.show()
	
