import wollok.game.*
import juego.*


object player {
	var property position = game.origin()
	var property ultimoMovimiento = "arriba"
	//var property ultimaPosicion 
	var puntos = 0
	var vidas =3
	
/*	method position(nueva){
		position = nueva
	}
	Este metodo lo usa en el de Mario
 */

	method image() = "pepita.png"
	//por ahora probamos sin animar para animar tenemos que hacer lo de abajo
	//	method image() = "player" + numero.toSrting() + ".png"


	method puntaje() = puntos
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
			minotaur.resetPosition()
		}
		else{
			 juego.finalizar()
			//agregar sonido new Sonido(sound = "").reproducir()
		}		
	}
	
	method resetPosition(){
		position = game.origin()
	}
	
	method chocarCon(cosa){
		if (cosa == minotaur) { self.perderVida() }
	}
	method chocarConTrap() {
	   self.regresar()
	   self.perderPuntos(5)
	   self.checkVidas()
	  }

	 method chocarConMinotaur() {
	    self.perderVida()
	    
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
	var property position
	var property posicionAnterior = position
	method image() = "minotaur.png"
	method regresar(){
		position = posicionAnterior
	}
	method resetPosition() {position = game.at(10,11)}
	method acercarseA(player){
		const otraPosicion = player.position()
<<<<<<< HEAD
		var newX = position.x() + if (otraPosicion.x() > position.x()) 1 else -1
		var newY = position.y() + if (otraPosicion.y() > position.y()) 1 else -1
		//evitamos que se posicione fuera del tablero
		newX =newX.max(0).min(game.width()-1)
		nexY = newY.max(0).min(game.height()-1)
		position = game.at(newX,newY)
=======
		const  newX = position.x() + if (otraPosicion.x() > position.x()) 1 else -1
		//const  newY = position.y() + if (otraPosicion.y() > position.y()) 1 else -1
		posicionAnterior = position
		position = game.at(newX,position.y())
	}
	
	method chocarCon(personaje){
>>>>>>> a1b76b41decc02de0910926ae7dfc3a130785564
		
	}
}
	
	

//	var posicionPrevia = position    //esta la vamos a usar al chocar con paredes
//	var property position = null
//	method chocarCon(){//sacar vida si es rival, parar si es pared
//	}
//	method spawnMinotaur(){
//		position = game.at(3,3)
//		game.addVisual(self)
//	}
//	method movimiento(){ //este esta 1:14:00 de aca https://www.youtube.com/watch?v=uJYTFKQQlqs
//		game.onTick(1.randomUpTo(5) * 1000, "movimiento",{
//			self.acercarseA(player)
//		})
//aca el video dice rival.acercarseA, yo use self, "movimiento" esta porque el onTick lleva un nombre
//	}
	
//	method acercarseA(player){ //lo explica 1:20:12 aca https://www.youtube.com/watch?v=uJYTFKQQlqs
//		const otraPosicion = player.position()
//		var newX = position.x() + if (otraPosicion.x() > position.x()) 1 else -1
//		position = game.at(newX)
//		posicionPrevia = position
//	}
	
//	method chocarCon(otro){
//		self.resetPosicionPrevia()
//	}
	
//	method resetPosicionPrevia(){position = posicionPrevia} //esto es para que al chocar con una pared
//	//o contra nuestro personaje, no se encime, sino que queden un al lado del otro
//	//me parece que player necesita un metodo igual para no superponerse con nada
	
	
//	method position() = position
	
//	method image() = "minotaur.png"
//	//por ahora probamos sin animar para animar tenemos que hacer lo de abajo
//	//	method image() = "minotaur" + numero.toSrting() + ".png"
//}
class Trap {
	const numero
	method image() = "trap" + numero.toString() + ".png"
	method position() = game.center()
	
	method hacerDanio(){}
	
}

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



