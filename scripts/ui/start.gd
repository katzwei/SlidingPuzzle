class_name Start
extends Control


@onready var help: Help = %Help


func _on_button_play_pressed() -> void:
	Global.go_to_game()


func _on_button_options_pressed() -> void:
	help.visible = true


func _on_button_quit_pressed() -> void:
	Global.quit()
