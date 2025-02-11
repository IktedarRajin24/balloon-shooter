extends Control

var angle: float = GameManager.get_angle()
@onready var angle_label: Label = $HBoxContainer/Angle/AngleLabel
@onready var cannon: CANNON = $"../Cannon"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	angle = GameManager.get_angle()
	angle_label.text = str(int(angle))


func _on_increment_button_pressed() -> void:
	if angle < 90:
		GameManager.increase_angle()
		cannon.set_cannon_rotation(1)
		SignalManager.on_angle_change.emit(angle)


func _on_decrement_button_pressed() -> void:
	if angle > 0:
		GameManager.decrease_angle()
		cannon.set_cannon_rotation(-1)
		SignalManager.on_angle_change.emit(angle)
		
