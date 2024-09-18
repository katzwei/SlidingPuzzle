extends Node

@onready var board: Board = %Board


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.tile_moved.connect(board.swap_tile_with_empty)
	board.set_easy()


func _on_easy_pressed() -> void:
	board.set_easy()


func _on_normal_pressed() -> void:
	board.set_normal()


func _on_hard_pressed() -> void:
	board.set_hard()


func _on_board_solved() -> void:
	print_debug("you win!")
