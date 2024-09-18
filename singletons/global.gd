extends Node

signal tile_moved(value: int)


func emit_tile_moved(value: int) -> void:
	tile_moved.emit(value)
