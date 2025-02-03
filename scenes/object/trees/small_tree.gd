extends Sprite2D

@onready var hurt_component = $HurtComponent
@onready var damage_component = $DamageComponent

var log_scene = preload("res://scenes/object/trees/log.tscn")

func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damage_reached.connect(on_max_damage_reached)
	
func on_hurt(hit_damage : int) -> void:
	damage_component.apply_damage(hit_damage)

func on_max_damage_reached() -> void:
	call_deferred("add_log_scene") # to do this in the next frame (and not get an error)
	print('max damage reached')
	queue_free()

func add_log_scene() -> void:
	var log_instance = log_scene.instantiate() as Node2D
	log_instance.global_position = global_position
	get_parent().add_child(log_instance) # add the log scene to the level scene
	
