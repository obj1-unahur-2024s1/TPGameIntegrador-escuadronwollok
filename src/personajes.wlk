import wollok.game.*
import juego.*


object player {
	var position = game.origin
	var puntos = 0
	var vidas = 3

	method position(){
		return position}
	
/*	method position(nueva){
		position = nueva
	}
	Este metodo lo usa en el de Mario
 */

	method image() = "pepita.png"
	//por ahora probamos sin animar para animar tenemos que hacer lo de abajo
	//	method image() = "player" + numero.toSrting() + ".png"
	
	
	method moverArriba() = position.up(1)
	method moverDerecha() = position.right(1)
	method moverAbajo() = position.down(1)
	method moverIzquierda() = position.left(1)

}

object minotaur{
	var position = null
	method colisionPlayer(){//sacar vida}
	}
	method spawnMinotaur(){
		position = juego.game.center()
		game.addVisual(self)
	}
	method movimiento(){}
	
	method position() = position
	
	method image() = "minotaur.png"
	//por ahora probamos sin animar para animar tenemos que hacer lo de abajo
	//	method image() = "minotaur" + numero.toSrting() + ".png"
}

class Trap{var position = null
	const numero
	/*al crear una instancia de una clase que tiene un atribun no inicializado
	estoy obligado a pasar el valor del atributo y eso se logra con las lineas
	game.addVisual(new Trampa(numero = 1))
	game.addVisual(new Trampa(numero = 2))
	*/
	}
	
	method colisionPlayer(){//sacar vida}
	}
	method spawnTrap(){
		position = null
		game.addVisual(self)
	}
	//method movimiento(){} saco el movimiento ya que las trampas deben ser fijas supongo
	
	method position() = position
	
	method image() = "trap.png"
	//por ahora probamos sin animar para animar tenemos que hacer lo de abajo
	//	method image() = "badguy" + numero.toSrting() + ".png"}
	// en este caso que la trampa es aleatoria deberiamos tener una imagen que corresponda
	//con cada trampa y su respectiva animacion

