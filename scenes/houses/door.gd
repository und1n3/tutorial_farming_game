extends StaticBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var interactable_component = $InteractableComponent

func _ready() -> void:
	interactable_component.interactable_activated.connect(on_interactable_activated)
	interactable_component.interactable_deactivated.connect(on_interactable_deactivated)
	collision_layer = 1 #ground layer

func on_interactable_activated() -> void:
	animated_sprite_2d.play("open_door")
	collision_layer = 2 # player layer to let the player through
	print("door activated")



func on_interactable_deactivated() -> void:
	animated_sprite_2d.play("close_door")
	collision_layer = 1 # change back to ground layer 
	print("door deactivated")
