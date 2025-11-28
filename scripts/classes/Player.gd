class_name Player
extends Node

@export var base_stats: WarriorBaseStats 
var modifiers: Array[StatsModifier] = []

var final_health: int

var final_damage: float
var final_attack_speed: float
var final_move_speed: float


func _ready():
	_recalculate_stats()

func add_modifier(modifier: StatsModifier) -> void:
	modifiers.append(modifier)
	_recalculate_stats()

func _recalculate_stats() -> void:
	final_health = base_stats.base_health
	final_damage = base_stats.base_damage
	final_attack_speed = base_stats.base_attack_speed
	final_move_speed = base_stats.base_move_speed
	
	for m in modifiers:
		final_health += m.bonus_health
		final_damage *= m.damage_multiplier
		final_attack_speed *= m.attack_speed_multiplier
		final_move_speed *= m.move_speed_multiplier
