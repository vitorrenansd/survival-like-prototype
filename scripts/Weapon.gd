class_name Weapon
extends Area2D

const BULLET = preload("res://assets/weapons/bullet.tscn")


func _physics_process(_delta): ## Função que locka no inimigo
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range[0]
		look_at(target_enemy.global_position)

func fire():
	pass
