extends TextEdit

var rand = RandomNumberGenerator.new()
var used = []
var answer 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	#generateAnswers(q.index)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func generateAnswers(num):
	var choices = []
	var file = FileAccess.open("res://Answers.txt", FileAccess.READ)
	var correct = file.get_line()
	for i in range(num):
		correct = file.get_line()
	answer = correct
	choices.append(correct)
	used.append(correct)
	file.close()
	for i in range(3):
		var other = generate_choice()
		choices.append(other)
	assign_answers(choices, 1)
	used.clear()
	
func generate_choice():
	var file = FileAccess.open("res://Answers.txt", FileAccess.READ)
	var word = file.get_line()
	var already_used = true
	while already_used:
		var indx = rand.randi_range(0, 5)
		for i in range(indx):
			word = file.get_line()
		if !used.has(word):
			already_used = false
	file.close()
	used.append(word)
	return word
	
func assign_answers(list, num):
	if num > 4:
		return
	var option
	if num == 1:
		option = get_node("%A")
	if num == 2:
		option = get_node("%B")
	if num == 3:
		option = get_node("%C")
	if num == 4:
		option = get_node("%D")
	var indx = rand.randi_range(0, list.size() - 1)
	option.display(list[indx])
	list.pop_at(indx)
	assign_answers(list, num + 1)
