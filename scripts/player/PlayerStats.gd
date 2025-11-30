class_name PlayerStats
extends Node

@export var health: float
@export var current_health: float
@export var damage: float
@export var attack_speed: float
@export var move_speed: float
@export var health_regen: int
var player: Player


func _init(p): # Construtor da classe: necessita Player
	player = p

func recalculate_stats() -> void:
	# Primeiro volta aos valores base, dps aplica todos os modificadores ativos
	health = player.base_stats.health
	damage = player.base_stats.damage
	attack_speed = player.base_stats.attack_speed
	move_speed = player.base_stats.move_speed
	health_regen = player.base_stats.health_regen
	
	for m in player.modifiers:
		health += m.bonus_health
		damage *= m.damage_multiplier
		attack_speed *= m.attack_speed_multiplier
		move_speed *= m.move_speed_multiplier
