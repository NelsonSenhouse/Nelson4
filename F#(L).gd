extends Node2D

@onready var text_box = get_node("%Text")
@onready var sound = get_node("%Area2D").get_node("%Note")
var play = false
var draggable = false
var is_inside_droppable = false
var body_ref
var offset: Vector2
var initialPos: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	text_box.set_text("\nF#(L)")
	sound.create_stream("res://F#(L).mp3")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			global.is_dragging = true
			sound.play()
			if Input.is_action_just_pressed("Lclick"):
				var new_node = duplicate()
				add_sibling(new_node)
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			global.is_dragging = false
			sound.stream_paused = true
			var tween = get_tree().create_tween()
			if is_inside_droppable:
				var x = body_ref.position.x + (text_box.size.x * (1 - 1 / scale.x))
				tween.tween_property(self, "position", Vector2(position.x, body_ref.position.y + 3), 0.2).set_ease(Tween.EASE_IN)
		elif Input.is_action_just_pressed("Scroll_d"):
			queue_free()
		elif Input.is_action_just_released("Wheel"):
			if scale == Vector2(1, 1):
				scale = Vector2(2, 1)
			else:
				scale = Vector2(1, 1)


func _on_area_2d_body_entered(body: StaticBody2D):
	if body.is_in_group("dropable"):
		is_inside_droppable = true
		body.modulate = Color(Color.REBECCA_PURPLE, 1)
		body_ref = body


func _on_area_2d_body_exited(body: StaticBody2D):
	if body.is_in_group("dropable"):
		is_inside_droppable = false
		body.modulate = Color(Color.MEDIUM_PURPLE, 0.7)


func _on_area_2d_mouse_entered():
	if not global.is_dragging:
		draggable = true


func _on_area_2d_mouse_exited():
	if not global.is_dragging:
		draggable = false

