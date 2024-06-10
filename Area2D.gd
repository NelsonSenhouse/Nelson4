extends Area2D

@onready var sound = get_node("%Note")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play_sound():
	sound.play()
	
func pause_sound():
	sound.stream_paused = true
