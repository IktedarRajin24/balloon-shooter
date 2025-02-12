extends Area2D

@onready var balloon_anim: AnimationPlayer = $BalloonAnim

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	die()
	
	
	
func die()-> void:
	balloon_anim.play("balloon_pop")


func _on_balloon_anim_animation_finished(anim_name: StringName) -> void:
	queue_free()
