extends Node

const GROUP_PLAYER:String = "player"
const PLANE_GRAVITY : float = 880.0
const PLANE_POWER:float = -380.0
const PIPES_SCROLL_SPEED:float = 120.0

var game_scence:PackedScene = preload("res://scenes/game/game.tscn")
var main_scence:PackedScene = preload("res://scenes/main/main.tscn")


func load_game_scence() -> void:
	get_tree().change_scene_to_packed(game_scence)
	
func load_main_scene() -> void:
	get_tree().change_scene_to_packed(main_scence)
