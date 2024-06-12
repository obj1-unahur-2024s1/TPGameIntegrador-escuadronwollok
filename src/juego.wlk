import wollok.game.*
import personajes.*
import pantalla.*
import laberintos.*

class Pared {
	const property position
	
	method chocarCon(personaje) {
		personaje.regresar()
		//game.say(player, "choque algo")
	}
}

object juego {
	
	var iniciado = false
	
	method iniciar() {
		game.title("Maze of Crete")
		game.width(66)  // Triple 60 - Original 20
		game.height(30) // Triple 42 - Original 14 - Para que me entre en el monitor 34
		game.cellSize(20) //20 - 50 - Hay que hacer que los assets sean 60x60
		
		self.agregarVisuals()
		self.mostrarImagenesIniciales()
		laberinto.decidirTablero()
		self.configurarTeclas()
		self.spawnearMonedas()
		game.onCollideDo(player,{algo => algo.chocarCon(player)})
		const enemigos = #{new Minotaur(posInicial = game.at(53,21)), new Minotaur(posInicial = game.at(56,0))}
		    enemigos.forEach({enemigo =>
			game.addVisual(enemigo)
			game.onTick(1.randomUpTo(2) * 300 ,"movimiento",{
				enemigo.acercarseA(player)
			})
			game.onCollideDo(enemigo,{algo => algo.chocarCon(enemigo)})
		})
		const trampas = #{new Fuego(posInicial = game.at(13,20)),
			              new Fuego(posInicial = game.at(49,20)) ,
			              new Fuego(posInicial = game.at(4,7)), 
			              new Fuego(posInicial = game.at(45,4))}
			  trampas.forEach({trampa => game.addVisual(trampa)})
			  
		const trampas2 = #{new Pinchos(posInicial = game.at(19,25)),
			              new Pinchos(posInicial = game.at(49,25)) ,
			              new Pinchos(posInicial = game.at(16,4)), 
			              new Pinchos(posInicial = game.at(34,4))}
			  trampas2.forEach({trampa => game.addVisual(trampa)})
		const trampas3 = #{new Serpiente(posInicial = game.at(1,15)),
			              new Serpiente(posInicial = game.at(57,10)) ,
			              new Serpiente(posInicial = game.at(4,28)),
			              new Serpiente(posInicial = game.at(47,12)), 
			              new Serpiente(posInicial = game.at(45,28))}
			  trampas3.forEach({trampa => game.addVisual(trampa)})	  
		}
		
	method agregarVisuals(){
		game.addVisual(tablero1)
		game.addVisual(inventario)
		game.addVisualCharacter(player)
		game.addVisual(vida)
		game.addVisual(score)
		
		
		}
		
		//agregando Traps
		//game.addVisual(new Trap(numero = 1))
        //game.addVisual(new Trap(numero = 2))

		
		//self.spawnEnemigos()
		//self.spawnPowerUps()
		
	
	method finalizar(){
		game.clear()
		game.addVisual(gameOver)
		game.schedule(3000, {=>game.stop()})
		

	}
	
	method mostrarImagenesIniciales(){
		game.addVisual(titulo)
		keyboard.space().onPressDo({
			if(!iniciado){
				titulo.removeVisual();
			   	iniciado = true
		   	}
	   	})						
	}
	
	

	method agregarMonedaEn(x, y) {
		const chance = 1.randomUpTo(100)
		if (chance > 90) {
			const moneda = new Moneda(position = game.at(x,y), valor=1)
			game.addVisual(moneda)			
		}
	}

	method configurarTeclas() {
		keyboard.up().onPressDo({player.subir()})
		keyboard.down().onPressDo({player.bajar()})
		keyboard.left().onPressDo({player.izquierda()})
		keyboard.right().onPressDo({player.derecha()})
	}
	
	
	
		//crear metodo para spawnear trampas, minotauro
		//en el video de Mario lo hace recurrentemente
		//https://www.youtube.com/watch?v=gAkqZ19bpaM
		
	//method spawnTrap(){}
	
	method spawnPowerUps(){
//		//crear metodo para spawnear armas, monedas, vidas
//		//en el video de Mario lo hace recurrentemente
//		//https://www.youtube.com/watch?v=gAkqZ19bpaM
//		game.schedule(500,{self.spawnMoneda(100)})
		}
		
	method spawnearMonedas(){
		game.schedule(500, {self.spawnMoneda(100)})
	}
	
	method spawnMoneda(valor){
			const pos = self.posicionAleatoria()
			const moneda = new Moneda(position = pos, valor = valor)
			game.addVisual(moneda)
	}
	
	method posicionAleatoria() = 
		game.at(
				0.randomUpTo(game.width()),
				0.randomUpTo(game.height())
				)
}


object tablero{
	method position() = game.center()
	method image() = "maze/maze_bg.png"
	//todo objeto debe tener por lo menos position. Image si necesitamos que se vea
	//Las paredes invisibles del pacman no usan image
}



class Items{
	
	const property image
	var property valor=0

	var property position
	
	// Ver si hace falta borrar
	method chocarCon(){}
	
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
								valor = 300, position = game.at(0,0)){
	
	override method chocarCon(cosa){
		if (cosa.equals(player)) {
			
		 }

	 }
}


object llave inherits Items (image ="./assets/items/llave.png", 
								valor = 500, position = game.at(0,0)){
}

object cofre inherits Items (image ="./assets/items/cofre.png", 
								valor = 200, position = game.at(0,0)){
	
}

object caliz inherits Items (image ="./assets/items/caliz.png", 
								valor = 1000, position = game.at(0,0)){
	
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

object alas inherits Items (image ="./assets/items/moneda.png", 
								valor = 100, position = game.at(0,0)){

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




/*
self.dibujarLineaDeParedes(41, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1])
self.dibujarLineaDeParedes(40, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1])
self.dibujarLineaDeParedes(39, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1])
self.dibujarLineaDeParedes(38, [0,0,0,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(37, [0,0,0,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(36, [0,0,0,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(35, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(34, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(33, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(32, [0,0,0,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(31, [0,0,0,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(30, [0,0,0,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(29, [0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(28, [0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(27, [0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(26, [0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1])
self.dibujarLineaDeParedes(25, [0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1])
self.dibujarLineaDeParedes(24, [0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1])
self.dibujarLineaDeParedes(23, [0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1])
self.dibujarLineaDeParedes(22, [0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1])
self.dibujarLineaDeParedes(21, [0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1])
self.dibujarLineaDeParedes(20, [0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1])
self.dibujarLineaDeParedes(19, [0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1])
self.dibujarLineaDeParedes(18, [0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1])
self.dibujarLineaDeParedes(17, [0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(16, [0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(15, [0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(14, [1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(13, [1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(12, [1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(11, [0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(10, [0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(9, [0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(8, [0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(7, [0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(6, [0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(5, [0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(4, [0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(3, [0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1])
self.dibujarLineaDeParedes(2, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1])
self.dibujarLineaDeParedes(1, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1])
self.dibujarLineaDeParedes(0, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1])
 */

