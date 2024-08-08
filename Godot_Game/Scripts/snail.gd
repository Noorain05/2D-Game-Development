extends Node2D

@onready var game_manager = %GameManager






func _on_area_2d_body_entered(_body):
	game_manager.damage_player(game_manager.snail_damage)
