extends Sprite2D

@onready var hurt_component = $HurtComponent
@onready var damage_component = $DamageComponent

var stone_scene = preload("res://scenes/objects/rocks/stone.tscn")

func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damage_reached.connect(on_max_damage_reached)
	
func on_hurt(hit_damage : int) -> void:
	damage_component.apply_damage(hit_damage)
	material.set_shader_parameter("shake_intensity",0.3)
	await get_tree().create_timer(1.0).timeout
	material.set_shader_parameter("shake_intensity",0.0)
	
func on_max_damage_reached() -> void:
	call_deferred("add_stone_scene") # to do this in the next frame (and not get an error)
	print('max damage reached')
	queue_free()

func add_stone_scene() -> void:
	var stone_instance = stone_scene.instantiate() as Node2D
	stone_instance.global_position = global_position
	get_parent().add_child(stone_instance) # add the stone scene to the level scene
	
