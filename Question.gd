extends TextEdit

var rand = RandomNumberGenerator.new()
var index = 0
var used = []


# Called when the node enters the scene tree for the first time.
func _ready():
	#generateQuestion()
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



var questions = []

func generateQuestion():
	var file = FileAccess.open("res://Questions.txt", FileAccess.READ)
	var content = file.get_line()
	var already_used = true
	var indx = 0
	while already_used:
		indx = rand.randi_range(0, 71)
		if !used.has(indx):
			already_used = false
	for i in range(indx):
		content = file.get_line()
	set_text("\nQuestion: " + content)
	index = indx
	used.append(indx)
	
