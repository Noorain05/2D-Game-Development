extends Node



@onready var death_timer = $DeathTimer
@onready var knight = %Knight
@onready var hud = %HUD


var score = 0
var max_player_health := 100.0
var current_player_health := 100.0
var previous_player_health : float
var bee_damage := 40.0
var killzone_damage := max_player_health 


func add_point( point : int ):
	score+=point
	print(score)


func damage_player(damage_to_player : float ):
	previous_player_health = current_player_health
	current_player_health -= damage_to_player 
	hud.change_health(current_player_health)

func kill_player():
	print("You Died")
	Engine.time_scale = 0.5
	knight.get_node("CollisionShape2D").queue_free()
	death_timer.start()




func _on_death_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
