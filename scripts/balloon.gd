extends RigidBody2D

@onready var balloon_anim: AnimationPlayer = $BalloonAnim

func _on_body_entered(body: Node2D) -> void:
	if body is RigidBody2D and get_contact_count()<= 1:
		body.queue_free()
		die()
	
func die()-> void:
	balloon_anim.play("balloon_pop")

func _on_balloon_anim_animation_finished(anim_name: StringName) -> void:
	queue_free()
