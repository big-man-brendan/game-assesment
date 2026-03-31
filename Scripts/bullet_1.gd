extends Area2D

var hits = 0
var shooting_dir = 0
signal hit()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	position.x -= 10 * shooting_dir 
	

func _on_area_entered(area: Area2D) -> void:
	
	
	hits += 1
	
	if hits == 2:
		print("Hit")
		
		emit_signal("hit")
		
		hits = 0
		position.x = 100000
		
		


func _on_enemy_1_shoot() -> void:
	
	hits = 0
	
	print("bullet shoot")
	
	position = $"../Enemy1".position
	
	if $"../Enemy1".is_flipped == false:
		shooting_dir = -1
		
	else:
		shooting_dir = 1
		
	
	
