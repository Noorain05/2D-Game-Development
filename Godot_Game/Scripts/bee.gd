extends Node2D


# Called when the node enters the scene tree for the first time.
@onready var game_manager = %GameManager


func _on_damage_zone_body_entered(_body):
	game_manager.damage_player(game_manager.bee_damage)
