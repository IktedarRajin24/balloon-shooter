extends TextureButton

const MAIN_MENU = preload("res://scenes/main_menu/main_menu.tscn")

const HOVER_SCALE: Vector2 = Vector2(0.5, 0.5)
const DEFAULT_SCALE: Vector2 = Vector2(0.4, 0.4) 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	get_tree().change_scene_to_packed(MAIN_MENU)


func _on_mouse_entered() -> void:
	scale = HOVER_SCALE


func _on_mouse_exited() -> void:
	scale = DEFAULT_SCALE
