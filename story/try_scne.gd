extends Node2D

func _ready():
	# Connect the signal when the timeline ends
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	
	# Start the timeline
	Dialogic.start("unangbungad")

func _on_timeline_ended(timeline_name: String):
	if timeline_name == "unangbungad":
		# Change to the next scene after dialog ends
		get_tree().change_scene_to_file("res://world.tscn")
