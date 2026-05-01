extends Node2D


@onready var levels = [$"Level 1",$"Level 2"]
@onready var level = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	#sets up the main menu and the first level for playing
	
	$ui.hide()
	
	for i in levels:
		i.position = Vector2(0,100000000)
	
	levels[0].position = Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	

func _on_charectir_next_level() -> void:
	
	#simpley moves the current level away then move the next level into place
	
	print("next level")
	
	levels[level].position = Vector2(0,99999999)
	
	level += 1
	
	levels[level].position = Vector2(0,0)
	
	print(level)
	

func _on_menu_start_game() -> void:
	#starts once you press the start button
	print("Game started")
	
	$ui.show()
	$Menu.hide()
