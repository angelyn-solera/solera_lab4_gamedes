
# Name: Angelyn Florence P. Solera
# Course Code: GAMDES1
# Date: October 10, 2026
# enemy.gd
# Detects when the Player touches the Enemy and sends the Player back to the start.
# Attach this script to the Enemy node (a CharacterBody2D).

extends CharacterBody2D


func _ready() -> void:
	$Hitbox.body_entered.connect(_on_hitbox_body_entered)


func _on_hitbox_body_entered(body) -> void:
	if body.is_in_group("player"):
		print("Player touched the enemy!")

		
		body.respawn()
