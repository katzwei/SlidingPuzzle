class_name MoveCounter
extends Control


@onready var label_count: Label = %LabelCount


func set_count(value: int) -> void:
	label_count.text = str(value)
