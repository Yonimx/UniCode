extends Node2D

@onready var animated_sprite = $AnimatedSprite2D

const CHARACTER_FRAMES = {
	"Mother": preload( "res://story/firstofscene/assets/character/mcmother/mother_sprites.tres"),
	"Alex": preload("res://story/firstofscene/assets/character/mc/alex_sprites.tres")
}
func _ready():
	pass

func change_character(character_name: String, animation: String = "idle"):
	animated_sprite.sprite_frames = CHARACTER_FRAMES[character_name]
	if animated_sprite.sprite_frames.has_animation(animation):
		animated_sprite.play(animation)
	else:
		animated_sprite.play("idle")
