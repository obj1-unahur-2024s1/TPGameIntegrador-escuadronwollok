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
	
	method spawnear() =
		game.addVisual(self)
	
	method chocarCon(cosa){}
	//aca podemos poner armas, monedas, power ups
//	method chocarCon(){//sumar vida, puntos, dar poder... los powerups cofres son estaticos solo podemos chocarlo nosotros
//	}
}

class Moneda inherits Items (image ="./assets/items/moneda20x20.png", 
								valor = 200, position = game.at(0,0)){

	override method chocarCon(cosa){
		if (cosa.equals(player)) {
			player.aumentarPuntos(valor * 100)
			game.say(player, "Tengo " + player.puntos().toString() + " monedas")
			game.removeVisual(self)
			juego.spawnMoneda(valor)}
	}
	
}

object medusa inherits Items(image ="./assets/items/medusa.png", 
								valor = 300, position = game.at(12,16)){
	
	override method chocarCon(cosa){
		if (cosa.equals(player)) {
		player.aumentarPuntos(valor * 100)
		game.say(player, "Activo la cabeza de Medusa")
		game.removeVisual(self)
		enemigos.forEach({enemigo => enemigo.petrificarse()})
		}
	}

}


object llave inherits Items (image ="./assets/items/llave.png", 
								valor = 500, position = game.at(57,0)){
		
		
		
	override method chocarCon(cosa){
		if (cosa.equals(player)) {
			player.agregarAlInventario(self)
			player.aumentarPuntos(valor)
			game.say(player, "Añado la llave del cofre al inventario")
			game.removeVisual(self)
		 }

	 }
}

object cofre inherits Items (image ="./assets/items/cofre.png", 
								valor = 2000, position = game.at(0,27)){
	
	override method chocarCon(cosa){
		if (cosa.equals(player) and player.tieneLlave()) {
			player.aumentarPuntos(valor)
			game.say(player, "He abierto el cofre")
			game.removeVisual(self)
			alas.spawnear()
			}
		else {
			game.say(self, "No posees la llave para abrir la cerradura")
		}
		 }
	
}

object caliz inherits Items (image ="./assets/items/caliz.png", 
								valor = 1000, position = game.at(15,27)){
	
	override method chocarCon(cosa){
		if (cosa.equals(player) and vida.vidasActuales() < 3) {
			vida.ganarVida()
			game.removeVisual(self)
		}
		else {
			player.aumentarPuntos(500)
			game.removeVisual(self)
		}
	}
	
}

// falta un if que pregunte si el personaje es invencible al chocar un enemigo y perder una vida

object manzana inherits Items (image ="./assets/items/manzana.png", 
								valor = 1500, position = game.at(30,27)){
	
	override method chocarCon(cosa){
		if (cosa.equals(player)) {
			player.aumentarPuntos(valor)
			game.say(player, "Activo invencibilidad")
			player.invencible(true)
			game.removeVisual(self)
			game.schedule(800, {player.invencible(false)})
		}
	}
	
}


object alas inherits Items (image ="./assets/items/alas.png", 
								valor = 100, position = game.at(0,26)){
	
	override method chocarCon(cosa){
		if (cosa.equals(player)) {
			player.aumentarPuntos(valor)
			game.say(player, "¡Tengo las alas!")
			game.removeVisual(self)
			juego.ganar()
		 }
		 
	}
}

object vida inherits Items (image= "./assets/items/vidas.png" , position = game.at(60,game.height()-3)) { 
	
	var property vidasActuales = 3
	  
	 method text()= vidasActuales.toString()
	method perderVida(){
		vidasActuales = 0.max(vidasActuales-1)
	}
	method ganarVida(){
		vidasActuales = 3.min(vidasActuales+1)
	}
}


object score inherits Items (image= "./assets/items/score.png" , position = game.at(60,game.height()-6)) {
	
	method text()= player.puntos().toString()


}

class Trap {
	var property posInicial
	var property position = posInicial
	const valor = 300
	
	method chocarCon(cosa){
		 if (cosa.equals(player)) {
			 player.perderPuntos(valor)
		     game.say(player, "perdi puntos")
			}
	}
	method image()
		
	
}
class Fuego inherits Trap{ 
	
	override method  image() ="./assets/traps/fuego.png"
									 	
}

class Pinchos inherits Trap{
	override method  image() ="./assets/traps/pinchos.png"
}

class Serpiente inherits Trap{
	override method  image() ="./assets/traps/serpiente.png"
}

		const trampas = #{new Fuego(posInicial = game.at(12,20)),
			              new Fuego(posInicial = game.at(48,20)) ,
			              new Fuego(posInicial = game.at(4,6)), 
			              new Fuego(posInicial = game.at(45,4))
			              }
			  
			  
		const trampas2 = #{new Pinchos(posInicial = game.at(18,25)),
			              new Pinchos(posInicial = game.at(48,25)) ,
			              new Pinchos(posInicial = game.at(15,4)), 
			              new Pinchos(posInicial = game.at(33,4))}
			  
		const trampas3 = #{new Serpiente(posInicial = game.at(0,15)),
			              new Serpiente(posInicial = game.at(57,10)) ,
			              new Serpiente(posInicial = game.at(4,27)),
			              new Serpiente(posInicial = game.at(47,12)), 
			              new Serpiente(posInicial = game.at(45,27))}
			  	  
		
