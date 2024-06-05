import wollok.game.*
import juego.*


object player {
	var property position = game.origin()
	var property ultimoMovimiento = "arriba"
	//var property ultimaPosicion 
	var puntos = 0
	const vidas =3
	
/*	method position(nueva){
		position = nueva
	}
	Este metodo lo usa en el de Mario
 */

	method image() = "pepita.png"
	//por ahora probamos sin animar para animar tenemos que hacer lo de abajo
	//	method image() = "player" + numero.toSrting() + ".png"


	method puntaje() = puntos
	method chocarCon(minotaur){
		 self.perderVida()
	}
	
	method vidasRestantes() = vidas
	
	method aumentarPuntos(valor){
		puntos += valor
	}
	method perderPuntos(valor){
		puntos = 0.max(puntos - valor)
	}
	
	method perderVida(){
		if (vida.vidasActuales()>1){
			vida.perderVida()
			//agregar sonido new Sonido(sound = "").reproducir()
			self.resetPosition()	
		}
		else{
			 juego.finalizar()
			//agregar sonido new Sonido(sound = "").reproducir()
		}		
	}
	
	method resetPosition(){
		position = game.origin()
	}
	
	
	  method checkVidas() {
	    if (puntos == 0) {
	      self.perderVida()
	    }
	  }
	
	  method ganarPuntos(valor) {
	    self.aumentarPuntos(valor)
	  }
	

	// PARA CUANDO CHOCA CON UN MURO, REGRESA
	 
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
	}
	
	method subir() {
		//ultimaPosicion = position.down(1)
		ultimoMovimiento = "arriba"
	}
	
	method izquierda() {
		//ultimaPosicion = position.right(1)
		ultimoMovimiento = "izquierda"
	}
	
	method derecha() {
		//ultimaPosicion = position.left(1)
		ultimoMovimiento = "derecha"
	}

}

 class Minotaur {
 	
	var property position
	var property posicionAnterior = position
	//const minotaurs = []
	//const minotaur1 =new Minotaur(position = game.at(10,11))
	//const minotaur2 =new Minotaur(position = game.at(10,11))
	
	method image() = "minotaur.png"
	method regresar(){
		position = posicionAnterior
	}
	method resetPosition() {position = game.at(10,11)}
	method acercarseA(player){
		const otraPosicion = player.position()

		 var newX = position.x() + if (otraPosicion.x() > position.x()) 1 else -1
		 var newY = position.y() + if (otraPosicion.y() > position.y()) 1 else -1
		//evitamos que se posicione fuera del tablero
		newX =newX.max(0).min(game.width()-1)
		newY = newY.max(0).min(game.height()-1)
		
		const newX = position.x() + if (otraPosicion.x() > position.x()) 1 else -1
		posicionAnterior = position
	    position = game.at(newX, position.y())
	
	}
	
	
	




	
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



