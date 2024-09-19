extends Node


signal tile_moved(value: int)


@onready var current_scene: Node = get_tree().root.get_child(-1)


func _deferred_goto_scene(path) -> void:
	current_scene.free()
	var scene = ResourceLoader.load(path)
	current_scene = scene.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene


func _go_to_scene(path) -> void:
	call_deferred("_deferred_goto_scene", path)


func go_to_game() -> void:
	_go_to_scene("res://scenes/game.tscn")


func go_to_help() -> void:
	_go_to_scene("res://scenes/ui/help.tscn")


func go_to_start() -> void:
	_go_to_scene("res://scenes/ui/start.tscn")


func quit() -> void:
	get_tree().quit()


func emit_tile_moved(value: int) -> void:
	tile_moved.emit(value)
