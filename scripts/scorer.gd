extends Node

var _attempts: int = 0
var _balloons_destroyed: int = 0
var _total_balloons: int = 0
var _level_number: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_total_balloons = get_tree().get_nodes_in_group("balloon").size()
	_level_number = ScoreManager.get_level_selected()
	SignalManager.on_attempt_made.connect(on_attempt_made)
	SignalManager.on_balloon_destroyed.connect(on_balloon_destroyed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_attempt_made() -> void:
	_attempts += 1
	SignalManager.on_score_updated.emit(_attempts)
	

func on_balloon_destroyed() -> void:
	_balloons_destroyed += 1
	print(_balloons_destroyed)
	if _balloons_destroyed == _total_balloons:
		SignalManager.on_level_complete.emit()
		ScoreManager.set_level_score(_attempts, str(_level_number))
