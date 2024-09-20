extends Node


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("debug_reload"):
		Global.reload()
