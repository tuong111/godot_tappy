extends Control

@onready var hs_score = $MC/HsScore


func _ready():
	hs_score.text = str(ScoreManager.get_high_score())
	
	
func _process(_delta):
	if Input.is_action_just_pressed("fly") == true :
		GameManager.load_game_scence()


func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			GameManager.load_game_scence()
