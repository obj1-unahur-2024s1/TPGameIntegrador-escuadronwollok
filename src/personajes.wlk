import wollok.game.*
import juego.*


object player {
	var property position = game.origin()
	var property ultimoMovimiento = "arriba"
	//var property ultimaPosicion 
	var puntos = 0
<<<<<<< HEAD
	const vidas =3
=======
>>>>>>> 914721b6c2e10c71944b51bd9d8b6a26469c3812
	
	method image() = "pepita.png"
	//por ahora probamos sin animar para animar tenemos que hacer lo de abajo
	//	method image() = "player" + numero.toSrting() + ".png"
	method puntaje() = puntos
<<<<<<< HEAD
	method chocarCon(minotaur){
		 self.perderVida()
	}
	
	method vidasRestantes() = vidas
	
=======
>>>>>>> 914721b6c2e10c71944b51bd9d8b6a26469c3812
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
<<<<<<< HEAD
			self.resetPosition()	
=======
			self.resetPosition()
>>>>>>> 914721b6c2e10c71944b51bd9d8b6a26469c3812
		}
		else{
			 juego.finalizar()
			//agregar sonido new Sonido(sound = "").reproducir()
		}
	}
	method resetPosition(){
		position = game.origin()
	}
<<<<<<< HEAD
	
	
	  method checkVidas() {
	    if (puntos == 0) {
	      self.perderVida()
	    }
	  }
	
	  method ganarPuntos(valor) {
	    self.aumentarPuntos(valor)
	  }
	

	// PARA CUANDO CHOCA CON UN MURO, REGRESA
	 
=======
	method chocarCon(cosa){
		self.perderVida()
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
>>>>>>> 914721b6c2e10c71944b51bd9d8b6a26469c3812
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
<<<<<<< HEAD

}

 class Minotaur {
 	
	var property position
=======
	
//	method perderVida(){
//		vidas = vidas -1
//		//aca en el pacman tira la linea de abajo porque pierde la vida y spawnea en el centro
//		//position = pacman.origin()
//		//Nosotros podriamos hacer lo mismo, pero tener dos metodos, uno que sea onCollide/whenCollideDo
//		//que pierda un corazon y uno que cuando se quede sin corazones haga lo del pacman
//		self.resetPosition()
//		minotaur.resetPosition()
		//habria que poner un spawnTraps() y spawnItems()
//		if(self.juegoTerminado()){
//			game.stop()
//		}
//}		


//	method juegoTerminado() = vidas == 0 {
//		
//	}
	


}

class Minotaur {
	var property posInicial
	var property position = posInicial
	var property posicionAnterior = position
	//const minotaurs = []
	//const minotaur1 =new Minotaur(position = game.at(10,11))
	//const minotaur2 =new Minotaur(position = game.at(10,11))
	
	method image() = "minotaur.png"
	method regresar(){
		position = posicionAnterior
	}
	method resetPosition() {position = posInicial}
	method acercarseA(player){
		const otraPosicion = player.position()

	
	



	
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



