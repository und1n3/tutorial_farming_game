extends Node

var inventory: Dictionary = Dictionary()

signal inventory_changed

func add_collectable(collectable_name: String) -> void:
	inventory.get_or_add(collectable_name) # to add the key if it is not in the dicctionary
	if inventory[collectable_name] == null: # if it wasnt in the dictionary, the get_or_add added Null
		inventory[collectable_name] = 1
	else:
		inventory[collectable_name] += 1
		
	inventory_changed.emit()


func remove_collectable(collectable_name:String) -> void:
	if inventory[collectable_name] == null: # if it wasnt in the dictionary, the get_or_add added Null
		inventory[collectable_name] = 0
	else:
		if inventory[collectable_name] > 0:
			inventory[collectable_name] -= 1
		
	inventory_changed.emit()
