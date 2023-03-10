extends Node2D

onready var player := $Player
onready var ui := $GameUI
onready var gameover := $GameOver

func _on_Player_ammo_changed(ammo, max_ammo):
	ui.update_ammo(ammo, max_ammo)


func _on_Player_weapon_changed(weapon, slot):
	ui.changed_weapon(weapon, slot)


func _on_Player_died():
	gameover.show()
