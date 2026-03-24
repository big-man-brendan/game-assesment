extends Area2D

var direction = 0
var shooting = false
var speed = 1000
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(direction)
	
	if shooting:
		position += direction * speed * delta


	if Input.is_action_just_pressed("ui_accept"):
		shoot()


func shoot() -> void:
		
	position = Vector2(0,0)
	direction = ($"../../Charectir".global_position - global_position).normalized()
	rotation = direction.angle()
	shooting = true
	
	
	
	
func _on_area_entered(area: Area2D) -> void:
	
	await get_tree().physics_frame
	shooting = false
	print("Area_entered")
	position.x = 100000

#
#func _on_body_entered(body: Node2D) -> void:
	#
	#shooting = false
	#print("Area_entered")
	#position.x = 100000
