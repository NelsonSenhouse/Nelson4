extends Node2D

@onready var q = get_node("%Question")
@onready var a = get_node("%Answers")
@onready var s = get_node("%Score")
@onready var b = get_node("%Back")
var go_on
var tries = 15

# Called when the node enters the scene tree for the first time.
func _ready():
	test(tries)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func test(num):
	if num < 1:
		b.set_visible(true)
		return
	q.generateQuestion()
	a.generateAnswers(q.index)


func _on_a_pressed():
	var button = get_node("%Answers").get_node("%A")
	if button.get_text() == a.answer and tries > 0:
		s.update_score()
	tries -= 1
	test(tries)


func _on_b_pressed():
	var button = get_node("%Answers").get_node("%B")
	if button.get_text() == a.answer and tries > 0:
		s.update_score()
	tries -= 1
	test(tries)


func _on_c_pressed():
	var button = get_node("%Answers").get_node("%C")
	if button.get_text() == a.answer and tries > 0:
		s.update_score()
	tries -= 1
	test(tries)


func _on_d_pressed():
	var button = get_node("%Answers").get_node("%D")
	if button.get_text() == a.answer and tries > 0:
		s.update_score()
	tries -= 1
	test(tries)
