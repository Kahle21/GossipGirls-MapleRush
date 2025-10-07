# res://scenes/ui/main_menu.gd
extends Control

# Buttons (match your scene tree on the left)
@onready var start_btn   : Button = $"CenterContainer/VBoxContainer/StartButton"
@onready var options_btn : Button = $"CenterContainer/VBoxContainer/OptionsButton"
@onready var credits_btn : Button = $"CenterContainer/VBoxContainer/CreditsButton"

# Scene paths (edit if your filenames/paths differ)
const PATH_ERA_SELECT := "res://scenes/ui/EraSelect.tscn"
const PATH_OPTIONS    := "res://scenes/ui/options.tscn"
const PATH_CREDITS    := "res://scenes/ui/credits.tscn"

func _ready() -> void:
	print("[MainMenu] ready. start=%s options=%s credits=%s"
		% [start_btn != null, options_btn != null, credits_btn != null])

	if not start_btn:   push_error("StartButton path is wrong");   return
	if not options_btn: push_error("OptionsButton path is wrong"); return
	if not credits_btn: push_error("CreditsButton path is wrong"); return

	start_btn.pressed.connect(_on_start)
	options_btn.pressed.connect(_on_options)
	credits_btn.pressed.connect(_on_credits)

func _on_start() -> void:
	print("[MainMenu] Start → ", PATH_ERA_SELECT, " exists=", ResourceLoader.exists(PATH_ERA_SELECT))
	if ResourceLoader.exists(PATH_ERA_SELECT):
		get_tree().change_scene_to_file(PATH_ERA_SELECT)
	else:
		push_error("[MainMenu] EraSelect scene not found. Right-click it in FileSystem → Copy Path and update PATH_ERA_SELECT.")

func _on_options() -> void:
	print("[MainMenu] Options → ", PATH_OPTIONS, " exists=", ResourceLoader.exists(PATH_OPTIONS))
	if ResourceLoader.exists(PATH_OPTIONS):
		get_tree().change_scene_to_file(PATH_OPTIONS)
	else:
		push_error("[MainMenu] Options scene not found. Copy its exact path and update PATH_OPTIONS.")

func _on_credits() -> void:
	print("[MainMenu] Credits → ", PATH_CREDITS, " exists=", ResourceLoader.exists(PATH_CREDITS))
	if ResourceLoader.exists(PATH_CREDITS):
		get_tree().change_scene_to_file(PATH_CREDITS)
	else:
		push_error("[MainMenu] Credits scene not found. Copy its exact path and update PATH_CREDITS.")
