class_name Board
extends Node2D

@onready var tiles: CanvasGroup = $Tiles
@onready var empty_tile: EmptyTile = $EmptyTile

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tilesArray = tiles.get_children() as Array[Tile]
	for index in range(tilesArray.size()):
		var tile: Tile = tilesArray[index]
		tile.set_frame(index)

func shuffle(steps: int) -> void:
	Global.instantaneous = true
	var actions = empty_tile.action_raycast_dicitonary.keys()
	for step in steps:
		var random_action = actions[randi() % empty_tile.action_raycast_dicitonary.size()]
		empty_tile.aim_at_and_move_tile(empty_tile.action_raycast_dicitonary[random_action])
	Global.instantaneous = false

func set_up_easy() -> void:
	shuffle(8)
	
func set_up_normal() -> void:
	shuffle(15)
	
func set_up_hard() -> void:
	shuffle(25)
