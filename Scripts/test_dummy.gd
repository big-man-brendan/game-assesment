extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_area_entered(area: Area2D) -> void:
	print("Hit")
	print(get_overlapping_areas())
	scale = Vector2(0.5,0.5)
	$HitTimer.start()
	

func _on_hit_timer_timeout() -> void:
	print("unhit")
	
	print(get_overlapping_areas())

	reset_physics_interpolation()
	

	monitoring = false
	monitoring = true
	scale = Vector2(1,1)
	
