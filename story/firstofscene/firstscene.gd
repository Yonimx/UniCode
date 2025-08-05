extends Node2D

@onready var character = %character
@onready var dialog_ui = %dialogUi

var dialog_index : int = 0
const dialog_lines : Array = [
	{"speaker": "Mother", "text": "Wake up, Alex! Your breakfast is ready!"},
	{"speaker": "Mother", "text": "It’s your first day at school. You don’t want to be late!", "animation": "calling"},
	{"speaker": "Alex", "text": "Ugh… Just five more minutes..."},
	{"speaker": "Mother", "text": "No more sleeping! I’m counting to three!"},
	{"speaker": "Alex", "text": "Alright, alright! I’m coming!"}
]


func _ready():
	dialog_index= 0
	process_current_line()
	
	
func _input(event):
	if event.is_action_pressed("next_line"):
		if dialog_ui.animate_text:
			dialog_ui.skip_text_animation()
		else:
			if dialog_index < len(dialog_lines) - 1:
				dialog_index +=1
				process_current_line()

func parse_line(line: String):
	var line_info = line.split(":")
	assert(len(line_info) >= 2)
	return{
		"speaker_name": line_info[0],
		"dialog_line": line_info[1]
	}
	
func process_current_line():
	var line = dialog_lines[dialog_index]
	var speaker = line["speaker"]
	var text = line["text"]
	var anim = "talking"
	
	# Use custom animation if provided
	if line.has("animation"):
		anim = line["animation"]
	
	dialog_ui.change_line(speaker, text)
	character.change_character(speaker, anim)
