class_name Board
extends Node2D


signal solved


@onready var tiles: CanvasGroup = $Tiles
@onready var empty_tile: EmptyTile = $EmptyTile
@onready var tiles_array = tiles.get_children() as Array[Tile]


var puzzle := [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,EMPTY_VALUE] as Array[int]
var solution := puzzle.duplicate()
var empty_piece_index := puzzle.size() - 1


const WIDTH = 4
const HEIGHT = 4
const EMPTY_VALUE = 16
const EASY_STEP_COUNT = 8
const EASY_NORMAL_COUNT = 16
const EASY_HARD_COUNT = 24

func set_puzzle() -> void:
	for index in range(tiles_array.size()):
		var tile: Tile = tiles_array[index]
		tile.set_value(puzzle[index] - 1)


func get_left_piece(z, x) -> int:
	return -1 if x == 0 else z - 1


func get_up_piece(z, w, y) -> int:
	return -1 if y == 0 else z - w


func get_right_piece(z, w, x) -> int:
	return -1 if x == w - 1 else z + 1


func get_down_piece(z, w, h, y) -> int:
	return -1 if y == h - 1 else z + w


func get_surrounding_pieces(z: int, w: int, h: int) -> Array[int]:
	var x := z % w
	var y := z / h
	var left := get_left_piece(z, x)
	var up := get_up_piece(z, w, y)
	var right := get_right_piece(z, w, x)
	var down := get_down_piece(z, w, h, y)
	var pieces := [left, up, right, down] as Array[int]
	return pieces.filter(func(n): return n > 0)


func swap_puzzle_pieces(index_a: int, index_b: int) -> void:
	var first_value := puzzle[index_a]
	puzzle[index_a] = puzzle[index_b]
	puzzle[index_b] = first_value


func swap_piece_with_empty(value: int) -> void:
	var index := puzzle.find(value)
	swap_puzzle_pieces(index, empty_piece_index)
	empty_piece_index = index
	if puzzle == solution:
		solved.emit()


func shuffle(steps: int) -> void:
	var last_piece_index := empty_piece_index
	# play n random moves
	for n in range(steps):
		var pieces := get_surrounding_pieces(empty_piece_index, WIDTH, HEIGHT)
		if pieces.has(last_piece_index):
			pieces.erase(last_piece_index)
		var piece_index := pieces[randi_range(0, pieces.size() - 1)]
		swap_puzzle_pieces(empty_piece_index, piece_index)
		last_piece_index = empty_piece_index
		empty_piece_index = piece_index
		
	# move the empty tile back to its starting point
	while empty_piece_index < puzzle.size() - 1:
		var piece_index := get_down_piece(empty_piece_index, WIDTH, HEIGHT, empty_piece_index / HEIGHT)
		if piece_index < 0:
			piece_index = get_right_piece(empty_piece_index, WIDTH, empty_piece_index % WIDTH)
		swap_puzzle_pieces(empty_piece_index, piece_index)
		empty_piece_index = piece_index


func reset() -> void:
	puzzle = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
	set_puzzle()


func set_easy() -> void:
	shuffle(EASY_STEP_COUNT)
	set_puzzle()


func set_normal() -> void:
	shuffle(EASY_NORMAL_COUNT)
	set_puzzle()


func set_hard() -> void:
	shuffle(EASY_HARD_COUNT)
	set_puzzle()

func use_secret_board() -> void:
	for tile in tiles_array:
		tile.use_secret_tile()


func _ready() -> void:
	set_puzzle()
