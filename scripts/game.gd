extends Node

@onready var board: Board = %Board
@onready var move_counter: MoveCounter = %MoveCounter
@onready var timer: GameTimer = %Timer
@onready var difficulty_select: DifficultySelect = $DifficultySelect

var moves := 0


func _on_board_solved() -> void:
	print_debug("you win!")


func _start(difficulty: int) -> void:
	match difficulty:
		1:
			board.set_easy()
		2:
			board.set_normal()
		3:
			board.set_hard()
	difficulty_select.visible = false
	timer.start()


func _on_difficulty_select_select_easy() -> void:
	_start(1)


func _on_difficulty_select_select_normal() -> void:
	_start(2)


func _on_difficulty_select_select_hard() -> void:
	_start(3)


func move_tile(value: int) -> void:
	moves += 1
	board.swap_piece_with_empty(value)
	move_counter.set_count(moves)


func _ready() -> void:
	Global.tile_moved.connect(move_tile)
