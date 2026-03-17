extends CharacterBody2D

signal in_area
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	
	var target = emit_signal("in_area")
