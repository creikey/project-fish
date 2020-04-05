extends Node2D

func _process(delta):
	if global_position.x <= -4000.0:
		queue_free()
