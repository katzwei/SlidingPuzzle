class_name Message
extends Control


@export var text := ""
@export var slide_out := false
@export var target_in: Marker2D = null
@export var target_out: Marker2D = null


@onready var label: Label = %Label
@onready var timer: Timer = %Timer
@onready var target_position := global_position


var sliding_in := true


const SPEED = 100.0


func _ready() -> void:
	label.text = text


func slide_in() -> void:
	if target_in != null:
		visible = true
		target_position = target_in.global_position


func _on_timer_timeout() -> void:
	if target_out != null:
		sliding_in = false
		target_position = target_out.global_position


func _process(delta: float) -> void:
	if global_position != target_position:
		global_position = global_position.move_toward(target_position, SPEED * delta)
		if slide_out && sliding_in:
			timer.start()
