extends RigidBody2D

@onready var balloon_pop_audio: AudioStreamPlayer = $BalloonPopAudio
@onready var balloon_anim: AnimationPlayer = $BalloonAnim
var is_popped: bool = false
func _on_body_entered(body: Node2D) -> void:
	if body is RigidBody2D and !is_popped:
		die()
		SignalManager.on_balloon_destroyed.emit()
		is_popped = true
	
func die()-> void:
	balloon_pop_audio.play()
	balloon_anim.play("balloon_pop")
	

func _on_balloon_anim_animation_finished(anim_name: StringName) -> void:
	queue_free()
