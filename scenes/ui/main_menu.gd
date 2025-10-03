extends Control

func _ready() -> void:
	var start_btn   : Button = get_node_or_null("CenterContainer/VBoxContainer/Button")
	var options_btn : Button = get_node_or_null("CenterContainer/VBoxContainer/Button2")
	var credits_btn : Button = get_node_or_null("CenterContainer/VBoxContainer/Button3")
	print("[MainMenu] ready. start=%s options=%s credits=%s" % [start_btn != null, options_btn != null, credits_btn != null])
	if start_btn:   start_btn.pressed.connect(_on_start)
	if options_btn: options_btn.pressed.connect(_on_options)
	if credits_btn: credits_btn.pressed.connect(_on_credits)

func _on_start() -> void:
	var path := "res://scenes/ui/EraSelect.tscn"
	print("[MainMenu] Start pressed →", path, " exists=", ResourceLoader.exists(path))
	if ResourceLoader.exists(path): get_tree().change_scene_to_file(path)

func _on_options() -> void:
	var path := "res://scenes/ui/options.tscn"   # match your filename case exactly
	print("[MainMenu] Options pressed →", path, " exists=", ResourceLoader.exists(path))
	if ResourceLoader.exists(path): get_tree().change_scene_to_file(path)

func _on_credits() -> void:
	var path := "res://scenes/ui/credits.tscn"   # match your filename case exactly
	print("[MainMenu] Credits pressed →", path, " exists=", ResourceLoader.exists(path))
	if ResourceLoader.exists(path): get_tree().change_scene_to_file(path)
