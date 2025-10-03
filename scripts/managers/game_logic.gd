extends Node

@onready var score_label: Label = $"../HUD/ScoreLabel"
var score := 0

func _ready() -> void:
	_update_ui()

func _update_ui() -> void:
	score_label.text = "Score: %d" % score

func _on_item_collected() -> void:
	score += 1
	_update_ui()
