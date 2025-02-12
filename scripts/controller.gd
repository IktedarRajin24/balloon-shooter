extends Control

var incrementing = false
var decrementing = false

@onready var angle_label: Label = $HBoxContainer/Angle/AngleLabel
@onready var cannon: CANNON = $"../Cannon"

func _ready() -> void:
	add_to_group("UI")

func _process(delta: float) -> void:
	var angle = GameManager.get_angle()
	angle_label.text = str(int(angle))

	if incrementing and angle < 90:
		GameManager.increase_angle()
		cannon.set_cannon_rotation(1)

	if decrementing and angle > 0:
		GameManager.decrease_angle()
		cannon.set_cannon_rotation(-1)

func _on_increment_button_button_down() -> void:
	incrementing = true

func _on_increment_button_button_up() -> void:
	incrementing = false

func _on_decrement_button_button_down() -> void:
	decrementing = true

func _on_decrement_button_button_up() -> void:
	decrementing = false
		
func update_label(angle: float)-> void:
	angle_label.text = str(int(angle))
	
