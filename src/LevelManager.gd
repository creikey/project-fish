extends Node2D

const possible_levels := [
	[1.0, preload("res://levels/BasicLevel.tscn")],
	[0.5, preload("res://levels/AlternateLevel.tscn")],
]

# tiles are 180x180
# there are 11 tiles horizontally, 6 tiles vertically

var cur_level: Node2D = null

func _ready():
	
	_spawn_level(Vector2(1080.0, 0.0))

func _process(delta):
	position.x -= delta*get_parent().get_node("Player").cur_speed
	while cur_level.global_position.x < 1080.0*2.0:
		_spawn_level(Vector2(cur_level.global_position.x + 11.0*180.0, 0.0))

func _spawn_level(target_pos):
#	cur_level = .instance()
	cur_level = _get_random_level_pack().instance()
	add_child(cur_level)
	cur_level.global_position = target_pos

func _get_random_level_pack() -> PackedScene:
	var total_probability := 0.0
	for pack_array in possible_levels:
		total_probability += pack_array[0]
	
	var cur_choice := rand_range(0.0, total_probability)
	for pack_array in possible_levels:
		if cur_choice < pack_array[0]:
			return pack_array[1]
		cur_choice -= pack_array[0]
	return possible_levels.back()[1]
