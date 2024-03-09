extends Control


@onready var go_label = $GoLabel
@onready var space_label = $SpaceLabel
@onready var timer = $Timer
@onready var sound = $Sound


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	SignalManager.on_plane_died.connect(on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if space_label.visible and Input.is_action_just_pressed("fly"):
		GameManager.load_main_scene()

func _input(event):
	if space_label.visible and event is InputEventScreenTouch:
		if event.pressed:
			GameManager.load_main_scene()

func run_sequence() -> void:
	go_label.hide()
	space_label.show()


func on_plane_died() -> void:
	sound.play()
	show()
	timer.start()


func _on_timer_timeout():
	run_sequence()
