extends CharacterBody2D

#Varaibles


const SPEED = 300.0
const JUMP_VELOCITY = -500.0
@onready var direction = 0
@onready var dashtime = true
var attacking = false
var dashing = false
var dashing_on_floor = false
var damage_og_pos = Vector2(0,25) 

signal dash

func _ready() -> void:
	
	print("ready")
	$Damage_box.position.x = 100000
	
	
func reset():
	position.y = -100
	position.x = 0
	velocity = Vector2(0,-20)



func _physics_process(delta: float) -> void:
	
	
	velocity.y = clamp(velocity.y,-1000,1000)
	
	
	if attacking:
		pass
	
	elif !is_on_floor():
		if $AnimatedSprite2D.frame != 3:
			
			$AnimatedSprite2D.play("Jump")
		else:
			$AnimatedSprite2D.pause()
	elif !velocity:
		$AnimatedSprite2D.play("Idle")
	
	elif velocity.x !=0 and !dashing_on_floor:
		$AnimatedSprite2D.play("Walk")
	
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	

	
	
	if not is_on_floor():
		velocity += get_gravity()*2 * delta
		
	
	if position.y > 1000:
		reset()

	var newdirection = Input.get_axis("ui_left", "ui_right")
	
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y -= 700
	
	
	
	if Input.is_action_pressed("dash"):
		
		if dashtime:
			var dashdir = 0
			
			emit_signal("dash")
			
			dashing = true
			
			
			
			if direction == 0:
				dashdir = 0
			
			elif direction > 0:
				dashdir = 1
			
			else:
				dashdir = -1
			
	
			direction += dashdir*8

			$DashTimer.start()
			
			dashtime = false
			
			
			dashing_on_floor = true
			$DashOnFloorTimer.start()
	
	
	if Input.is_action_just_pressed("Melee"):
		
		$Damage_box.position = damage_og_pos
		
		$Damage_box.rotation = deg_to_rad(int($AnimatedSprite2D.flip_h))*180
		
		
		
		$AttackTimer.start()
		attacking = true
		
		print("attacking")
		$AnimatedSprite2D.play("Attack")
	
	
	
	if is_on_floor() and !dashing_on_floor:
		dashing = false
	
	if dashing or dashing_on_floor:
		direction = lerpf(direction,round(newdirection),0.1)
	else:
		direction = newdirection
	
	move_and_slide()
	
	#print(onladder)
	# Replace with function body.


func _on_dash_timer_timeout() -> void:

	dashtime = true
	print(dashtime)
	print("time out")
	


func _on_hitbox_body_entered(body: ) -> void:
	print("Reset")
	reset()
	
#Testing testiong testing

func _on_dash_on_floor_timer_timeout() -> void:
	dashing_on_floor = false


func _on_attack_timer_timeout() -> void:
	
	attacking = false
	
	$Damage_box.position.x = 1000000
	
	await get_tree().physics_frame

	print("stopped attacking")
	


func _on_hurt_box_area_entered(area: Area2D) -> void:
	print("HIT HIT")
	
