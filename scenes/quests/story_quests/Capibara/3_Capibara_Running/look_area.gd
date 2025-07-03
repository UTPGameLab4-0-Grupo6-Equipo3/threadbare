# SPDX-FileCopyrightText: The Threadbare Authors
# SPDX-License-Identifier: MPL-2.0
extends Area2D

var hola:bool = false

func set_hola(valor:bool):
	hola = valor

func _process(delta: float) -> void:
	print(str(hola))
