extends CharacterBody2D



var shooting = false
var arrow_speed = 1000
var direction = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	if !is_on_floor():
		velocity = get_gravity()
	
	
	
	
	
	if shooting:
		
		$Arrow.position += direction * arrow_speed * delta
	
	if position.distance_to($"../Charectir".position) < 500:
		pass
		
		if Input.is_action_just_pressed("ui_accept"):
			shoot()
	
		if position.distance_to($"../Charectir".position) < 200:
			pass
	else:
		pass
		
	move_and_slide()

func shoot():
	
	$Arrow.position = Vector2(0,0)
	direction = ($"../Charectir".global_position - global_position).normalized()
	$Arrow.rotation = direction.angle()
	shooting = true


func _on_samurai_archer_shoot() -> void:
	position = Vector2(0,0)
	direction = ($"../../Charectir".global_position - global_position).normalized()
	rotation = direction.angle()
	shooting = true
	


func _on_area_entered(area: Area2D) -> void:
	pass


func _on_arrow_area_entered(area: Area2D) -> void:
	
	shooting = false
	print("Area_entered")
	$Arrow.position.x = 100000
