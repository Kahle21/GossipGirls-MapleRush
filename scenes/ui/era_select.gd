extends Control

@onready var back_btn : Button = get_node_or_null("ColorRect/VBoxContainer/BackButton")
@onready var pre_btn  : Button = get_node_or_null("ColorRect/VBoxContainer/PreColonialButton")
@onready var conf_btn : Button = get_node_or_null("ColorRect/VBoxContainer/ConfederationButton")
@onready var mod_btn  : Button = get_node_or_null("ColorRect/VBoxContainer/ModernButton")

func _ready() -> void:
	print("[EraSelect] ready")
	print_tree_pretty()  # shows the live node tree in Output

	if not back_btn:  push_error("Bad path for BackButton");  return
	if not pre_btn:   push_error("Bad path for PreColonialButton");  return
	if not conf_btn:  push_error("Bad path for ConfederationButton");  return
	if not mod_btn:   push_error("Bad path for ModernButton");  return

	back_btn.pressed.connect(_on_back)
	pre_btn.pressed.connect(func(): print("Era = precolonial"))
	conf_btn.pressed.connect(func(): print("Era = confederation"))
	mod_btn.pressed.connect(func(): print("Era = modern"))

func _on_back() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/MainMenu.tscn")
