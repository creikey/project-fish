extends Area2D

const target_speed = 500.0

class_name Player

var red_amount := 0.0
var cur_speed := 0.0
onready var target_y_pos := position.y
onready var cur_y_pos = target_y_pos
onready var last_target_y_pos_set := target_y_pos

func _process(delta):
	target_y_pos = clamp(target_y_pos, 0.0, 1080.0)
	# try to go target_speed and go to target y position
	cur_speed = ((target_speed - cur_speed) * delta * 2.0) + cur_speed
	cur_y_pos = ((target_y_pos - cur_y_pos) * delta * 9.0) + cur_y_pos
	position.y = cur_y_pos
	
	# red damage indicator
	red_amount -= 2.0*delta
	red_amount = clamp(red_amount, 0.0, 1.0)
	
	modulate.b = 1.0 - red_amount
	modulate.g = 1.0 - red_amount

func _input(event: InputEvent):
	if event.is_action_pressed("g_up"):
		go_up_lane()
	elif event.is_action_pressed("g_down"):
		go_down_lane()

func go_up_lane():
	last_target_y_pos_set = target_y_pos
	target_y_pos -= 180.0

func go_down_lane():
	last_target_y_pos_set = target_y_pos
	target_y_pos += 180.0

func _on_Player_body_entered(body):
	if body.is_in_group("obstacles"):
#		target_y_pos = last_target_y_pos_set
		cur_speed = -1.5*target_speed
		red_amount = 1.0
	


func _on_Player_area_entered(area):
	if area.is_in_group("plankton"):
		var cur_effect = area.effect_pack.instance() # no type because cyclic
		add_child(cur_effect)
