class_name GameTimer
extends Control


@onready var label = %Label
@onready var timer = %Timer


var elapsed_time := 36000
var minutes := 0
var seconds := 0


func start() -> void:
	timer.start()


func stop() -> void:
	timer.stop()


func _on_timer_timeout() -> void:
	elapsed_time += 1
	if elapsed_time % 60 == 0:
		minutes += 1
		seconds = 0
	else:
		seconds += 1
	label.text = "%02d:%02d" % [minutes, seconds]
