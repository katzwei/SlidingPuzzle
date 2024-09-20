class_name DifficultySelect
extends Control


@onready var message: Message = %Message


signal select_easy
signal select_normal
signal select_hard
signal enable_secret


var secret := "cat"
var secret_inputs: Array[String] = []


func _on_button_easy_pressed() -> void:
	select_easy.emit()


func _on_button_normal_pressed() -> void:
	select_normal.emit()


func _on_button_hard_pressed() -> void:
	select_hard.emit()


func _push_secret_input(value: String) -> void:
	if secret_inputs.size() >= 3:
		secret_inputs.pop_front()
	secret_inputs.append(value)
	if "".join(secret_inputs) == secret:
		message.slide_in()
		enable_secret.emit()

func _unhandled_input(event: InputEvent) -> void:
	if visible && event is InputEventKey && !event.is_pressed():
		var key := event as InputEventKey
		_push_secret_input(key.as_text_keycode().to_lower())
