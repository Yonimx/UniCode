extends StaticBody2D

@onready var interactible: Area2D = $interactible
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	interactible.interact = _on_interact
	
func _on_interact():
	if sprite_2d.frame ==0:
		sprite_2d.frame = 1
		interactible.is_interactable = true
		get_tree().change_scene_to_file("res://story/try scne.tscn")
	else:
		sprite_2d.frame= 0
		
