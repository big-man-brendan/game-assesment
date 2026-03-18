extends Area2D


signal shoot
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	

	
	if position.distance_to($"../Charectir".position) < 500:
		print("In side")
		
		if Input.is_action_just_pressed("ui_accept"):
			emit_signal("shoot")
	
		if position.distance_to($"../Charectir".position) < 200:
			print("Really inside")
	else:
		print("outside")
	

	

	
	
