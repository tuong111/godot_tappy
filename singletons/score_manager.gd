extends Node

var _score:int = 0
var _high_score:int = 0
var _plane_die:bool = true

func get_scrore() -> int:
	return _score
	
func set_plane_die(is_died : bool) -> void:
	_plane_die = is_died

func get_plane_die_status() -> bool:
	return _plane_die

func get_high_score() -> int:
	return _high_score
	

func set_score(v:int) -> void:
	_score = v
	if _score > _high_score:
		_high_score = _score
	SignalManager.on_score_updated.emit()
		
func increment_score() -> void:
	set_score(_score + 1)


