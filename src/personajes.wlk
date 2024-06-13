import wollok.game.*
import juego.*
import pantalla.*
import elementos.*


object player {
	const inventarioPlayer = []
	var property position = game.origin()
	var property ultimoMovimiento = "arriba"
	//var property ultimaPosicion 
	var property puntos = 0
	var property invencible = false
	
	method image() {
		return animacionPlayer.image()	
	}
	//por ahora probamos sin animar para animar tenemos que hacer lo de abajo
	//	method image() = "player" + numero.toSrting() + ".png"
	
	
	method agregarAlInventario(cosa){
		inventarioPlayer.add(cosa)
	}
	
	method quitarDelInventario(cosa){
		inventarioPlayer.remove(cosa)
	}
	
	method tieneLlave() =
		inventarioPlayer.contains(llave)
	
	method aumentarPuntos(valor){
		puntos += valor
	}
	
	method perderPuntos(valor){
		puntos = 0.max(puntos - valor)
	}
	
	method perderVida(){
		if (vida.vidasActuales()>=1){
			vida.perderVida()
			//agregar sonido new Sonido(sound = "").reproducir()
			self.resetPosition()
		
		}
		else{
			 game.addVisual(gameOver)
			 juego.finalizar()
			//agregar sonido new Sonido(sound = "").reproducir()
		}
	}
	
	method resetPosition(){
		position = game.origin()
	}
	
	method chocarCon(cosa){
	
	}
	
	method chocarConTrap() {
		self.regresar()
		self.perderPuntos(5)
		self.checkVidas()
	}
	
	method checkVidas() {
		if (puntos == 0) {
	      self.perderVida()
	    }
	}
	method regresar() {
		//position = ultimaPosicion
	
		if (ultimoMovimiento == "arriba") {
			position = position.down(1)
		} else if (ultimoMovimiento == "abajo") {
			position = position.up(1)
		} else if (ultimoMovimiento == "izquierda") {
			position = position.right(1)
		} else {
			position = position.left(1)
		}
	}
	method bajar() {
		//ultimaPosicion = position.up(1)
		ultimoMovimiento = "abajo"
		animacionPlayer.direccion("sur")
		animacionPlayer.siguienteFotograma()
	}
	
	method subir() {
		//ultimaPosicion = position.down(1)
		ultimoMovimiento = "arriba"
		animacionPlayer.direccion("norte")
		animacionPlayer.siguienteFotograma()
	}
	
	method izquierda() {
		//ultimaPosicion = position.right(1)
		ultimoMovimiento = "izquierda"
		animacionPlayer.direccion("oeste")
		animacionPlayer.siguienteFotograma()
	}
	
	method derecha() {
		//ultimaPosicion = position.left(1)
		ultimoMovimiento = "derecha"
		animacionPlayer.direccion("este")
		animacionPlayer.siguienteFotograma()
	}
}

class Animaciones {
	var property fotograma = 0
	var property direccion = "este"
	
	method siguienteFotograma() {
		fotograma = (fotograma + 1) % 3
	}
}

object animacionPlayer inherits Animaciones{
	
	method image() {
		return "./assets/jugador/" + direccion + "-" + fotograma.toString() + ".png"
	}
}
	

class Minotaur {
	var property posInicial
	var property position = posInicial
	var property posicionAnterior = position
	var property petrificado = false
	
	method image() = "minotaur.png"
	method regresar(){
		position = posicionAnterior
	}
	
	method resetPosition() {position = posInicial}
	
	method acercarseA(player) {
		const otraPosicion = player.position()
		//var newX = position.x() + if (otraPosicion.x() > position.x()) 1 else -1
		//var newY = position.y() + if (otraPosicion.y() > position.y()) 1 else -1
		//evitamos que se posicione fuera del tablero
		//newX = newX.max(0).min(game.width()-1)
		//nexY = newY.max(0).min(game.height()-1)
		//position = game.at(newX,newY)
		const  newX = position.x() + if (otraPosicion.x() > position.x()) 1 else -1
		//const  newY = position.y() + if (otraPosicion.y() > position.y()) 1 else -1
		posicionAnterior = position
		position = game.at(newX,position.y())
	}
	
	method chocarCon(personaje){}

	
	method petrificarse() {
		game.removeTickEvent("movimiento")
		game.schedule(7000, { enemigos.forEach({enemigo =>
			game.onTick(1.randomUpTo(2) * 200 ,"movimiento",{
				enemigo.acercarseA(player)
			})
			})
	})
}

}
	
 const enemigos = #{new Minotaur(posInicial = game.at(53,21)), new Minotaur(posInicial = game.at(56,0))}	
	
	

//class Trap{var position = null
//	const numero
//	/*al crear una instancia de una clase que tiene un atributo no inicializado
//	estoy obligado a pasar el valor del atributo y eso se logra con las lineas
//	game.addVisual(new Trampa(numero = 1))
//	game.addVisual(new Trampa(numero = 2))
//	Esto lo hace luego con una coleccion y forEach minuto 52: https://www.youtube.com/watch?v=uJYTFKQQlqs
	
//	Luego agrega
//	 	if (personaje.juegoTerminado()){
//		game.stop()
		 
//	Yo lo que haria es si el perosnaje se queda sin corazones perder vida, y que el personaje vea
//	si se queda sin vidas que el juego sea game.stop()	 
//	
//	*/
//	

//	}

	
//	method chocarCon(){//sacar corazon/escudo, la trampa es estatica solo puede chocar con nosotros}
//	}
//	method spawnTrap(){
//		position = null
//		game.addVisual(self)
//	}
//	//method movimiento(){} saco el movimiento ya que las trampas deben ser fijas supongo
//	
//	method position() = position
	
//	method image() = "trap" + numero.toString() ".png"
//	//por ahora probamos sin animar para animar tenemos que hacer lo de abajo
//	//method image() = "badguy" + numero.toSrting() + ".png"}
//	//en este caso que la trampa es aleatoria deberiamos tener una imagen que corresponda
//	//con cada trampa y su respectiva animacion
