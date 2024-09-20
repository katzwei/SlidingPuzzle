class_name Tile
extends Node2D


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var origin: Marker2D = $Origin
@onready var target_position := global_position
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


var value := 1


const SPEED := 1000.0


func use_secret_tile() -> void:
	animated_sprite_2d.set_animation("secret")


func set_value(index: int) -> void:
	if index < 15:
		animated_sprite_2d.frame = index
		value = index + 1


func move(_position: Vector2) -> void:
	origin.global_position = _position
	target_position = _position
	audio_stream_player.play()
	Global.emit_tile_moved(value)


func _process(delta: float) -> void:
	origin.global_position = target_position
	if global_position != target_position:
		global_position = global_position.move_toward(target_position, SPEED * delta)
