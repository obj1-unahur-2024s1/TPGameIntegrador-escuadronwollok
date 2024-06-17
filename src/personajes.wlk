import wollok.game.*
import juego.*
import pantalla.*
import elementos.*


object player {
	const inventarioPlayer = []
	var property position = game.at(1,1)
	var property ultimoMovimiento = "arriba"
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
	
	method chocarCon(cosa){}
	
	method checkVidas() {
		if (puntos == 0) {
	      self.perderVida()
	    }
	}
	
	method regresar() {
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
		ultimoMovimiento = "abajo"
		animacionPlayer.direccion("sur")
		animacionPlayer.siguienteFotograma()
	}
	
	method subir() {
		ultimoMovimiento = "arriba"
		animacionPlayer.direccion("norte")
		animacionPlayer.siguienteFotograma()
	}
	
	method izquierda() {
		ultimoMovimiento = "izquierda"
		animacionPlayer.direccion("oeste")
		animacionPlayer.siguienteFotograma()
	}
	
	method derecha() {
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
	
	method image() = "minotaur.png"
	method regresar(){
		position = posicionAnterior
	}
	
	method resetPosition() {position = posInicial}
	
	method acercarseAPlayer() {
		const otraPosicion = player.position()
		const  newX = position.x() + if (otraPosicion.x() > position.x()) 1 else -1
		posicionAnterior = position
		position = game.at(newX,position.y())
	}
	method chocarCon(cosa){
		if (cosa.equals(player) and player.invencible()) {
			self.resetPosition()
			player.invencible(false)
		}
		else if (cosa.equals(player) and !player.invencible()) {
			player.perderVida()
			self.resetPosition()
		}
	}
	method petrificarse() {
		game.removeTickEvent("movimiento")
		game.schedule(7000, { 
			juego.enemigos().forEach({enemigo =>
				game.onTick(1.randomUpTo(2) * 400 ,"movimiento",{
					enemigo.acercarseAPlayer()
				})
			})
		})
	}
	
}