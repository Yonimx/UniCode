extends Control

var button_type = null


func _on_start_pressed() -> void:
	button_type = "start"
	$fade_transition.show()
	$fade_transition/fade_timer.start()
	$fade_transition/AnimationPlayer.play("fade_in")





func _on_settings_pressed() -> void:
	button_type = "settings"
	$fade_transition.show()
	$fade_transition/fade_timer.start()
	$fade_transition/AnimationPlayer.play("fade_in")
	get_tree().change_scene_to_file("")





func _on_quit_pressed() -> void:
	get_tree().quit()




func _on_fade_timer_timeout() -> void:
	if button_type == "start":
		get_tree().change_scene_to_file("res://world.tscn")
	elif button_type == "settings":
		get_tree().change_scene_to_file("")
