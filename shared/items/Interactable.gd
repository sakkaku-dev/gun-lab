class_name Interactable extends Area2D

signal interacted(actor)
signal unhightlight()

export var sprite_path: NodePath
onready var sprite: Sprite = get_node(sprite_path) if sprite_path else get_parent()

const outline_material = preload("res://shared/items/sprite_outline.tres")


func highlight():
	if sprite and not sprite.material:
		sprite.material = outline_material


func unhighlight():
	if sprite and sprite.material:
		sprite.material = null
		emit_signal("unhightlight")


func interact(actor):
	emit_signal("interacted", actor)
