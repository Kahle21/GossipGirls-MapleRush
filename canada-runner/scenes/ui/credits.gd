# res://ui/Credits.gd
extends Control
@onready var back_btn: Button = %BackButton
func _ready(): back_btn.pressed.connect(func(): get_tree().change_scene_to_file("res://ui/MainMenu.tscn"))
