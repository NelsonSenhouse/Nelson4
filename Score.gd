extends TextEdit

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_text("\n  Score: " + str(score) + "/15")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func update_score():
	score += 1
	if score <= 15:
		set_text("\n  Score: " + str(score) + "/15")
