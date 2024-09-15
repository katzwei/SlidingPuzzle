extends Node

@onready var board: Board = %Board

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#await get_tree().create_timer(5.0).timeout
	#print_debug("set up")
	#board.set_up_easy()

func _on_easy_pressed() -> void:
	board.set_up_easy()

func _on_normal_pressed() -> void:
	board.set_up_normal()

func _on_hard_pressed() -> void:
	board.set_up_hard()
