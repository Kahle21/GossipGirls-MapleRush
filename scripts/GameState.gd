# res://scripts/GameState.gd
extends Node

var current_era: String = ""
var collected_artifacts: = {} # { "artifact_id": true }

const SAVE_PATH := "user://save.cfg"
const ALL_ARTIFACTS := [
	"precolonial_totem",
	"confederation_act",
	"modern_flag"
]

func _ready():
	load_game()

func set_era(era: String) -> void:
	current_era = era

func collect_artifact(id: String) -> void:
	collected_artifacts[id] = true
	save_game()

func has_artifact(id: String) -> bool:
	return collected_artifacts.get(id, false)

func save_game() -> void:
	var cfg := ConfigFile.new()
	cfg.set_value("save", "collected", collected_artifacts)
	var err := cfg.save(SAVE_PATH)
	if err != OK:
		push_warning("Save failed: %s" % err)

func load_game() -> void:
	var cfg := ConfigFile.new()
	var err := cfg.load(SAVE_PATH)
	if err == OK:
		collected_artifacts = cfg.get_value("save", "collected", {})
