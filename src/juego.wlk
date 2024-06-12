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
	
	const property enemigos = #{new Minotaur(posInicial = game.at(30,21)), new Minotaur(posInicial = game.at(39,12))}
	var iniciado = false
	
	method iniciar() {
		game.title("Maze of Crete")
<<<<<<< HEAD
		game.width(60)  // Triple 60 - Original 20
		game.height(30) // Triple 42 - Original 14 - Para que me entre en el monitor 34
		game.cellSize(20) //20 - 50 - Hay que hacer que los assets sean 60x60


=======
		game.width(66)  // Triple 60 - Original 20
		game.height(30) // Triple 42 - Original 14 - Para que me entre en el monitor 34
		game.cellSize(20) //20 - 50 - Hay que hacer que los assets sean 60x60
		// Hacer un metodo aparte para los visual de pantalla
>>>>>>> 2d9763179962e5364a245631d17ecfe9247a39e8
		
		game.addVisual(tablero1)
		game.addVisual(inventario)
		game.addVisualCharacter(player)
		game.addVisual(vida)
<<<<<<< HEAD
		game.addVisual(fuego)
		game.addVisual(score)
		const enemigos = #{new Minotaur(posInicial = game.at(57,30)), new Minotaur(posInicial = game.at(56,0))}
=======
		
		
>>>>>>> 2d9763179962e5364a245631d17ecfe9247a39e8
		enemigos.forEach({enemigo =>
			game.addVisual(enemigo)
			game.onTick(1.randomUpTo(2) * 300 ,"movimiento",{
				enemigo.acercarseA(player)
			})
			game.onCollideDo(enemigo,{algo => algo.chocarCon(enemigo)})
		})
		
		
		//agregando Traps
		//game.addVisual(new Trap(numero = 1))
        //game.addVisual(new Trap(numero = 2))
        self.mostrarImagenesIniciales()
		laberinto.decidirTablero()
		self.configurarTeclas()
		self.spawnearMonedas()
		game.onCollideDo(player,{algo => algo.chocarCon(player)})
		
		
		
		
		//self.spawnEnemigos()
		//self.spawnPowerUps()
		
	}
	
	method finalizar(){
		game.clear()
		game.addVisual(gameOver)
		game.schedule(3000, {=>game.stop()})
		

	}
	
	method mostrarImagenesIniciales(){
		titulo.addVisual()
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
<<<<<<< HEAD
	var property valor=0
=======
	var property valor = 0
>>>>>>> 2d9763179962e5364a245631d17ecfe9247a39e8
	var property position
	
	
	method chocarCon(){}
	method chocarCon(cosa){}
	//aca podemos poner armas, monedas, power ups
//	method chocarCon(){//sumar vida, puntos, dar poder... los powerups cofres son estaticos solo podemos chocarlo nosotros
//	}
}

class Moneda inherits Items (image ="./assets/items/moneda20x20.png", 
								valor = 100, position = game.at(0,0)){

	override method chocarCon(cosa){
		if (cosa.equals(player)) {
			player.aumentarPuntos(valor)
			game.say(player, "Tengo " + player.puntaje().toString() + " monedas")
			game.removeVisual(self)
			//juego.spawnMoneda(valor)}
	}
	
}
}
}
object medusa inherits Items(image ="./assets/items/medusa.png", 
								valor = 300, position = game.at(0,0)){
	
	override method chocarCon(cosa){
		if (cosa.equals(player)) {
			
		 }

	 }
}


<<<<<<< HEAD
=======

>>>>>>> 2d9763179962e5364a245631d17ecfe9247a39e8
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

object vida inherits Items (image ="./assets/items/vidas.png", 
								valor = 0, position = game.at(48,game.height()-2)) { 
	var property vidasActuales = 3
	  
	 method text()= vidasActuales.toString()
	 method positionText()= game.at(51,game.height()-2)
	
	method perderVida(){
		vidasActuales = 0.max(vidasActuales-1)
	}
	method ganarVida(){
		vidasActuales = 3.min(vidasActuales+1)
	}
}


object score inherits Items(image= "./assets/items/score.png", position = game.at(40, game.height()-2)){
	
	method text()= player.puntaje().toString()
	
}



object  fuego  inherits Items (image ="./assets/traps/fuego.png", 
								valor = 300, position = game.at(38,-3)){
	
	override method chocarCon(cosa){
		if (cosa == player) {
			player.perderPuntos(valor)
			game.say(player, "perdi puntos")
			
			}
			
	
	}
	
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

