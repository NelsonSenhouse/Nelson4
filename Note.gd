extends AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func create_stream(p):
	var path = p
	var file = FileAccess.open(path, FileAccess.READ)
	var new_stream = AudioStreamMP3.new()
	var buffer = file.get_buffer(file.get_length())
	new_stream.data = buffer
	stream = new_stream
