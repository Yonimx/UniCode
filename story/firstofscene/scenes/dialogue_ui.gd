extends Control

@onready var dialog_line = %dialogLine
@onready var speaker_name = %"speaker name"


const ANIMATION_SPEED : int = 30
var animate_text : bool = false
var current_visible_characters : int = 0


func _ready():
	pass 


func _process(delta):
	if animate_text:
		if dialog_line.visible_ratio <1:
			dialog_line.visible_ratio += (1.0/dialog_line.text.length() * ANIMATION_SPEED*delta)
			current_visible_characters = dialog_line.visible_characters
		else:
			animate_text = false
			
func change_line(speaker: String, line: String):
	speaker_name.text = speaker
	current_visible_characters= 0
	dialog_line.text = line
	dialog_line.visible_characters = 0
	animate_text = true

func skip_text_animation():
	dialog_line.visible_ratio = 1
