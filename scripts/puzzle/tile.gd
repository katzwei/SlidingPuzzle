class_name Tile
extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var origin: Marker2D = $Origin
@onready var target_position := global_position

var value := 1

const SPEED := 1000.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	origin.global_position = target_position
	if global_position != target_position:
		global_position = global_position.move_toward(target_position, SPEED * delta)


func set_value(index: int) -> void:
	if index < 15:
		animated_sprite_2d.frame = index
		# Label strictly for debugging purposes - will be removed
		#$Label.text = "%d ORIGIN" % (index + 1)
		value = index + 1


func move(_position: Vector2) -> void:
	origin.global_position = _position
	target_position = _position
	Global.emit_tile_moved(value)
