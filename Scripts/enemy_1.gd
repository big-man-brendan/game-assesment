extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -400.0
var is_flipped = false
var shot = false
@onready var start_pos = position
@onready var player = $"../../Charectir"
@onready var bullet = $"../Bullet1"

signal shoot()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	
	if player.position > global_position:
		velocity.x = SPEED
		$AnimatedSprite2D.flip_h = false
		is_flipped = false
	
	else:
			
		$AnimatedSprite2D.flip_h = true
		is_flipped = true
	
	
	#randomly jump
	
	if randf()>0.99 and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if player.global_position.distance_to(global_position) < 500 and player.global_position.distance_to(global_position) > 250:
		
		
		if player.position > global_position:
			velocity.x = SPEED
			$AnimatedSprite2D.flip_h = false
			is_flipped = false
		
		else:
			velocity.x = -SPEED
			$AnimatedSprite2D.flip_h = true
			is_flipped = true

	else:
		
		velocity.x = 0
	
	if player.global_position.distance_to(global_position) < 280:
		
		
		$AnimatedSprite2D.play("Walk")
		
		if shot == false:
			print("Shoot")
			emit_signal("shoot")
			shot = true
			$Shottimer.start()
	
	if velocity.x == 0:
		$AnimatedSprite2D.play("Shoot")
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_shottimer_timeout() -> void:
	shot = false


func _on_bullet_1_hit() -> void:
	pass


func _on_hurtbox_area_entered(area: Area2D) -> void:

	position.x = 100000


func _on_charectir_death() -> void:
	await get_tree().create_timer(2).timeout
	print("death")
	position = start_pos
