import juego.*
import personajes.*
import pantalla.*
import laberintos.*
import wollok.game.*

class Items{
	
	const property image
	var property valor = 0

	var property position
	
	// Ver si hace falta borrar
	method chocarCon(){}
	
	method spawnear() {
		if(!game.hasVisual(self)) {
			game.addVisual(self)} 
			}
	
	method chocarCon(cosa){}
}

class Moneda inherits Items (	image ="./assets/items/moneda.png",
								valor = 200, position = game.at(0,0)){

	override method chocarCon(cosa){
		if (cosa.equals(player)) {
			score.aumentarPuntos(valor)
			game.removeVisual(self)
//			juego.spawnMoneda(valor)}
		}
	}
}

object medusa inherits Items(image ="./assets/items/medusa.png", 
								valor = 1000, position = game.at(12,16)){
	
	override method chocarCon(cosa){
		if (cosa.equals(player)) {
			score.aumentarPuntos(valor)
			game.say(player, "Activo la cabeza de Medusa")
			game.removeVisual(self)
			juego.enemigos().forEach({enemigo => enemigo.petrificarse()})
		}
	}

}


object llave inherits Items (image ="./assets/items/llave.png", 
								valor = 1000, position = game.at(51,7)){
	override method chocarCon(cosa){
		if (cosa.equals(player)) {
			player.agregarAlInventario(self)
			score.aumentarPuntos(valor)
			game.say(player, "Añado la llave del cofre al inventario")
			position = game.at(60,(game.height() - 11))
			//game.removeVisual(self)
		 }

	 }
}

object cofre inherits Items (image ="./assets/items/cofre.png", 
								valor = 1000, position = game.at(0,27)){
	
	override method chocarCon(cosa){
		if (cosa.equals(player) and player.tieneLlave()) {
			score.aumentarPuntos(valor)
			game.say(player, "He abierto el cofre")
			game.removeVisual(self)
			alas.spawnear()
		} else {
			game.say(self, "No posees la llave para abrir la cerradura")
		}
		}
	
}

object caliz inherits Items (image ="./assets/items/caliz.png", 
								valor = 1000, position = game.at(15,27)){
	
	override method chocarCon(cosa){
		if (cosa.equals(player) and vida.vidasActuales() < 5) {
			vida.ganarVida()
			game.removeVisual(self)
		}
		else {
			score.aumentarPuntos(valor)
			game.removeVisual(self)
		}
	}
	
}

object manzana inherits Items (image ="./assets/items/manzana.png", 
								valor = 2500, position = game.at(30,27)){
	override method chocarCon(cosa){
		if (cosa.equals(player)) {
			score.aumentarPuntos(valor)
			game.say(player, "Activo invencibilidad")
			player.invencible(true)
			game.removeVisual(self)
			game.schedule(10000, {player.invencible(false)})
		}
	}
}
object alas inherits Items (image ="./assets/items/alas.png", 
								valor = 1000, position = if(juego.dificultadExtrema()) game.at(39,20) else cofre.position()){
	
	override method chocarCon(cosa){
		if (cosa.equals(player)) {
			score.aumentarPuntos(valor)
			game.say(player, "¡Tengo las alas!")
			game.removeVisual(self)
			juego.ganar()
		 }
		 
	}
}

object contadorSalud {
	
	method position() = game.at(60, game.height()-6)
	method image() = "./assets/items/moneda.png"
	
	method text() = "Salud: " + player.salud().toString()
	
}

object vida inherits Items (image= "./assets/items/vidas.png" , position = game.at(60,game.height()-3)) { 
	
	var property vidasActuales = if(juego.dificultadExtrema()) 1 else 3
	var property nroVidas = new NroVidas(position = game.at(62,game.height()-3), image=self.image())
	 
	method addVisual(){
		nroVidas.spawnear()
	}
	
	method perderVida(){
		vidasActuales = 0.max(vidasActuales-1)
	}
	method ganarVida(){
		vidasActuales = 5.min(vidasActuales+1)
	}
}


class NroVidas inherits Items {
	
  
	override method image(){
		if (vida.vidasActuales() == 3){
			return "./assets/score/3.png"
		}else if (vida.vidasActuales() ==2 ){
			return "./assets/score/2.png"
		}else if (vida.vidasActuales() ==1){
			return "./assets/score/1.png"
		}else{
			return "./assets/score/0.png"
		}
	} 
}


object score inherits Items (image= "./assets/items/score.png" , position = game.at(60,game.height()-9)) {
	
	var property puntaje = 0
	const digitos = [
		new Digito(position = game.at(60,game.height()-10), image=self.image()),
		new Digito(position = game.at(61,game.height()-10), image=self.image()),
		new Digito(position = game.at(62,game.height()-10), image=self.image()),
		new Digito(position = game.at(63,game.height()-10), image=self.image()),
		new Digito(position = game.at(64,game.height()-10), image=self.image())
	]
	
	method addVisual() {
		digitos.forEach({d => d.spawnear()})
	}
	
	method puntaje(nuevoPuntaje) {
		puntaje = nuevoPuntaje
		var p = nuevoPuntaje
		
		(0..4).forEach({ i => 
			const d = (p % 10).truncate(0)
			digitos.get(i).numero(d)
			p = (p / 10).truncate(0);
		})
		
	}
	
	method aumentarPuntos(puntos) {
		self.puntaje(puntaje + puntos)
	}
	
		
	method perderPuntos(valor){
		 self.puntaje(0.max(puntaje - valor))
	}
	
	method reset() {
		puntaje = 0
	}


}

class Digito inherits Items {
	var property numero = 0
	
	override method image() = "./assets/score/" + numero + ".png" 
}


class Trap {
	var property posInicial
	var property image
	var property position = posInicial
	var property valor = 300
	
	method chocarCon(cosa){
		 if (cosa.equals(player)) {
			 score.perderPuntos(valor)
		     game.say(player, "perdi puntos")
		}
	}
}
class Fuego inherits Trap (image = "./assets/fuego/fuego0.png"){
	
	override method image() {
		return animacionFuego.image()
	}
	
	override method chocarCon(cosa) {
		if (cosa.equals(player)) {
			game.onTick(700, "quemadura", {
				if (player.position() == self.position()) {
					player.perderSalud(1)
				} else {
					game.removeTickEvent("quemadura")
				}
			})
		}
	} 	
}

object animacionFuego {
	
	var property fotograma = 0
	
	method image() = "./assets/fuego/fuego" + fotograma.toString() + ".png"
	
	method siguienteFotograma() {
		fotograma = (fotograma + 1) % 18
	}
	
}

class Pinchos inherits Trap (image = "./assets/pincho/pinchos-5.png"){
	
	var property estaActiva = false
	
	var property fotograma = 0
		
	override method chocarCon(cosa) {
		if (cosa.equals(player) and estaActiva) {
			player.perderVida()
		}
	}
	
	override method image() {
		return "./assets/pincho/pinchos-" + fotograma.toString() + ".png"
	}
	
	method cambiarEstado() {
		
		if (estaActiva) { 	//DESACTIVA
			estaActiva = false
			animacionPincho.animacionDesactivar(self)
		} else {			//ACTIVA
			estaActiva = true
			animacionPincho.animacionActivar(self)
			//Este IF comprueba que el jugador este parado sobre la trampa cuando se activa
			if (player.position() == self.position()) {
				player.perderVida()
			}
		}
	}
}

object animacionPincho inherits Animaciones{
	
	method animacionActivar(cosa) {
		game.onTick(100, self.identity().toString(), {cosa.fotograma(6.min(cosa.fotograma() + 1))})
		game.schedule(700, {game.removeTickEvent(self.identity().toString()); cosa.fotograma(6)})
	}
	
	method animacionDesactivar(cosa) {
		game.onTick(100, self.identity().toString(), {cosa.fotograma(8.min(cosa.fotograma() + 1))})
		game.schedule(200, {game.removeTickEvent(self.identity().toString()); cosa.fotograma(0)})
	}
	
}

class HitboxPincho inherits Pinchos {
	
	override method image() {
		return "./assets/assetInvisible.png"
	}
	
	override method cambiarEstado() {
		
		if (estaActiva) { 	//DESACTIVA
			estaActiva = false
		} else {			//ACTIVA
			estaActiva = true
			//Este IF comprueba que el jugador este parado sobre la trampa cuando se activa
			if (player.position() == self.position()) {
				player.perderVida()
			}
		}
	}
	
}

class Serpiente inherits Trap (image = "./assets/traps/serpiente.png"){
	
	override method chocarCon(cosa) {
		if (cosa.equals(player)) {
			player.perderSalud(1)
			player.envenenar()
			game.removeVisual(self)
		}
	}
	
}

		const trampas = #{new Fuego(posInicial = game.at(12,20)),
			              new Fuego(posInicial = game.at(48,20)) ,
			              new Fuego(posInicial = game.at(4,6)), 
			              new Fuego(posInicial = game.at(45,4))
			              }
			  
			  
//		const trampas2 = #{new Pinchos(posInicial = game.at(18,25)),
//			              new Pinchos(posInicial = game.at(48,25)) ,
//			              new Pinchos(posInicial = game.at(15,4)), 
//			              new Pinchos(posInicial = game.at(33,4))}
			  
		const trampas3 = #{new Serpiente(posInicial = game.at(0,15)),
			              new Serpiente(posInicial = game.at(57,10)) ,
			              new Serpiente(posInicial = game.at(4,27)),
			              new Serpiente(posInicial = game.at(47,12)), 
			              new Serpiente(posInicial = game.at(45,27))}
			  	  
		
