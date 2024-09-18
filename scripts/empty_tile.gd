class_name EmptyTile
extends Node2D

var last_action := ""
var action_raycast_dicitonary := {
	"move_up": "RayCastBottom",
	"move_right": "RayCastLeft",
	"move_down": "RayCastTop",
	"move_left": "RayCastRight"
}


func aim_at_and_move_tile(raycast_path: String) -> void:
	var raycast_node: RayCast2D = get_node(raycast_path)
	if raycast_node.is_colliding():
		var tile: Tile = raycast_node.get_collider()
		var old_position = tile.origin.global_position
		tile.move(global_position)
		global_position = old_position


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if last_action == "":
			for action in action_raycast_dicitonary:
				if event.is_action_pressed(action):
					last_action = action
					aim_at_and_move_tile(action_raycast_dicitonary[action])
		elif event.is_action_released(last_action):
			last_action = ""
