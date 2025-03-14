class_name TestSceneSaveDataManagerComponent
extends Node


func _ready() -> void:
	call_deferred("load_test_scene") # to check the scenes have been laoded to the tree first


func load_test_scene():
	SaveGameManager.load_game()
