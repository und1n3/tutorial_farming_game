class_name CollectableComponent
extends Area2D

@export var collectable_name : String


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("Collected: ", collectable_name)
		get_parent().queue_free() # parent because will add this to the collectable object scene
								  # and we want to remove the full scene
