extends Area2D

var move = false

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if move:
		move_local_x(1.5)
	else:
		position = Vector2(0, 0)


func _on_area_entered(area: Area2D):
	if area.is_in_group("notes") and visible:
		area.play_sound()
	


func _on_area_exited(area):
	if area.is_in_group("notes"):
		area.pause_sound()


func _on_button_pressed():
	visible = !visible
	move = !move
