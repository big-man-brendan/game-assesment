extends CharacterBody2D

#Varaibles
#Fuck you
const SPEED = 500.0
const JUMP_VELOCITY = -500.0
@onready var direction = 0
@onready var dashtime = true
var dashing = false
var dashing_on_floor = false
signal dash

func _ready() -> void:
	print("ready")
	
	
func reset():
	position.y = -100
	position.x = 0
	velocity = Vector2(0,-20)



func _physics_process(delta: float) -> void:
	
	
	velocity.y = clamp(velocity.y,-1000,1000)
	
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
