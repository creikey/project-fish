extends Button

#func _input(event):
#	print("Input event: ", event)

#func _gui_input(event):
#	if event is InputEventScreenTouch:
#		print("pressing...")
#		var click_input_event: InputEventMouseButton = InputEventMouseButton.new()
#		click_input_event.pressed = true
#		self._gui_input(click_input_event)
#		click_input_event.pressed = false
#		self._gui_input(click_input_event)
#	print("Gui input event: ", event)

func _on_PlayButton_pressed():
#	print("Pressed!")
	get_tree().change_scene("res://Main.tscn")
