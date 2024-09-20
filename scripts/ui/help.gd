class_name Help
extends Control


@export var show_quit_button := false
@export var show_reset_button := false


@onready var button_reset: Button = %ButtonReset
@onready var button_quit: Button = %ButtonQuit


func _ready() -> void:
	button_reset.visible = show_reset_button
	button_quit.visible = show_quit_button


func _on_button_back_pressed() -> void:
	visible = false


func _on_button_reset_pressed() -> void:
		Global.reload()


func _on_button_quit_pressed() -> void:
	Global.quit()
