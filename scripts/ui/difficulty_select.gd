class_name DifficultySelect
extends Control

signal select_easy
signal select_normal
signal select_hard

func _on_button_easy_pressed() -> void:
	select_easy.emit()


func _on_button_normal_pressed() -> void:
	select_normal.emit()


func _on_button_hard_pressed() -> void:
	select_hard.emit()
