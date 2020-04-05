extends Area2D

export (PackedScene) var effect_pack
export var chance_to_spawn := 1.0

func _ready():
	randomize()
	if rand_range(0.0, 1.0) >= 1.0 - chance_to_spawn:
		pass # stay spawned in
	else:
		queue_free()
