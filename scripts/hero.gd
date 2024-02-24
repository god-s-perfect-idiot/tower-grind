extends CharacterBody2D

const speed = 200
var direction = "none"
var facing = "none"

func _ready():
	$AnimatedSprite2D.play("idle_right")
	facing="right"

func _physics_process(delta):
	player_movement(delta)
	
func player_movement(delta):
	
	if Input.is_action_pressed("ui_right"):
		direction = "right"
		facing = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
		
		
	elif Input.is_action_pressed("ui_left"):
		direction = "left"
		facing = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0	
		
	elif Input.is_action_pressed("ui_down"):
		direction = "down"
		play_anim(1)
		velocity.x = 0
		velocity.y = speed
		
	elif Input.is_action_pressed("ui_up"):
		direction = "up"
		play_anim(1)
		velocity.x = 0
		velocity.y = -speed
		
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
		
func play_anim(movement):
	var _direction = facing
	var anim = $AnimatedSprite2D
	
	if _direction == "right":
		if movement == 1:
			anim.speed_scale = 2
			anim.play("move_right")
		else:
			anim.speed_scale = 1
			anim.play("idle_right")
	elif _direction == "left":
		if movement == 1:
			anim.speed_scale = 2
			anim.play("move_left")
		else:
			anim.speed_scale = 1
			anim.play("idle_left")
	
