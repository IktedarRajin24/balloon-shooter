extends Node

const DEFAULT_SCORE: int = 1000
const SCORE_PATH = "user://balloon_shooter.json"


var _level_selected: int = 1
var _level_scores: Dictionary = {}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_from_file()

func set_level_selected(level: int) -> void:
	_level_selected = level

func get_level_selected()-> int:
	return _level_selected

func check_and_add_level(level: String) -> void:
	if !_level_scores.has(level):
		_level_scores[level] = DEFAULT_SCORE

func set_level_score(score: int, level: String): 
	check_and_add_level(level)
	if _level_scores[level] > score:
		_level_scores[level] = score
		save_to_file()

func get_best_for_level(level: String) -> int:
	check_and_add_level(level)
	return _level_scores[level]

func save_to_file()-> void:
	var file = FileAccess.open(SCORE_PATH, FileAccess.WRITE)
	var score_str = JSON.stringify(_level_scores)
	file.store_string(score_str)
	
func load_from_file()-> void:
	var file = FileAccess.open(SCORE_PATH, FileAccess.READ)
	if file == null:
		save_to_file()
	else:
		var data = file.get_as_text()
		_level_scores = JSON.parse_string(data)
