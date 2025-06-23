extends RayCast2D

var ultimo_objeto = null
var ultima_direccion: Vector2 = Vector2.UP  # Dirección inicial por defecto

func _process(delta: float) -> void:
	var padre := get_parent()
	if padre != null:
		var direccion: Vector2 = padre.velocity
		if not direccion.is_zero_approx():
			ultima_direccion = direccion.normalized()
			rotation = ultima_direccion.angle() - PI / 2  # Ajuste por rotación inicial de -90°

	# --- Detección de colisiones ---
	if self.is_colliding():
		var objeto_en_vision := self.get_collider()
		if objeto_en_vision != ultimo_objeto:
			if ultimo_objeto != null and "hola" in ultimo_objeto:
				ultimo_objeto.hola = false
			ultimo_objeto = objeto_en_vision
		if "hola" in objeto_en_vision and not objeto_en_vision.hola:
			objeto_en_vision.hola = true
	else:
		if ultimo_objeto != null and "hola" in ultimo_objeto:
			ultimo_objeto.hola = false
		ultimo_objeto = null
