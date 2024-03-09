extends CharacterBody2D

@onready var sprite : AnimatedSprite2D = $Sprite
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var engine_sound = $EngineSound


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

	
func _physics_process(delta):
	velocity.y += GameManager.PLANE_GRAVITY * delta
	fly()
	move_and_slide()
	
	if is_on_floor() == true:
		die()
		
		
func fly() -> void :
	if Input.is_action_just_pressed("fly") == true :
		if !ScoreManager.get_plane_die_status():
			velocity.y = GameManager.PLANE_POWER
			animation_player.play("power")
	
	
	
func die() -> void :
		engine_sound.stop()
		sprite.stop()
		set_physics_process(false)
		SignalManager.on_plane_died.emit()

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			if !ScoreManager.get_plane_die_status():
				velocity.y = GameManager.PLANE_POWER
				animation_player.play("power")
