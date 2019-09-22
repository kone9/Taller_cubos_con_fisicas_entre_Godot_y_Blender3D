extends Spatial

export(PackedScene) var cubo #empaqueta la escena para que luego la llamemos como instancia
var contador = 0

func _process(delta):
	$Fps.text = "Fps= " + str(Engine.get_frames_per_second())#esto nos muestra por pantalla los frames por segundos
	if contador == 150:#si contador llega a 300
		get_tree().reload_current_scene()#si contador llega a 300 reiniciamos la escena

func _on_timer_timeout():#señal cuando termina el tiempo
	var instanciarCubos = cubo.instance()#esto instancia el cubo
	add_child(instanciarCubos)#agrega el cubo al arbol de nodos
	instanciarCubos.translation = $Position_inicial_cubo.translation# la posicion del cubo va a ser igual a la posicion en el espacio del nodo
	contador += 1#contador que suma cada ves que termina el tiempo
	$contando_cubos.text = "Cantidad de cubos =" + str(contador) #texto que muestro en pantalla