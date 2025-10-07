# res://scenes/ui/options.gd
extends Control

@onready var back_btn: Button = get_node_or_null("MarginContainer/VBoxContainer/BackButton")
# If you rename that node to BackButton, change the line above to:
# @onready var back_btn: Button = get_node_or_null("MarginContainer/VBoxContainer/BackButton")

func _ready() -> void:
	print("[Options] ready")
	if back_btn:
		back_btn.pressed.connect(_go_main)
	else:
		push_error("[Options] Back button path is wrong. Right-click the Button → Copy Node Path and paste here.")

func _go_main() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/MainMenu.tscn")
