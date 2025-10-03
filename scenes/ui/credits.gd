extends Control

@onready var back_btn: Button = $"MarginContainer/VBoxContainer/BackButton"

func _ready():
	back_btn.pressed.connect(func():
		get_tree().change_scene_to_file("res://scenes/ui/MainMenu.tscn")
	)
