import wollok.game.*
import personajes.*
import pantalla.*
import laberintos.*
import elementos.*

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
		
		laberinto.decidirTablero()
		self.configurarTeclas()
		self.spawnearMonedas()
		self.spawnPowerUps()
		game.onCollideDo(player,{algo => algo.chocarCon(player)})
		
		    enemigos.forEach({enemigo =>
			game.addVisual(enemigo)
			game.onTick(1.randomUpTo(2) * 300 ,"movimiento",{
				enemigo.acercarseA(player)
			})
			game.onCollideDo(enemigo,{algo => algo.chocarCon(enemigo)})
		})
		trampas.forEach({trampa => game.addVisual(trampa)})
		trampas2.forEach({trampa => game.addVisual(trampa)})
		trampas3.forEach({trampa => game.addVisual(trampa)})  
		self.mostrarImagenesIniciales()
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
	
	method ganar() {
		game.clear()
		game.addVisual(winScreen)
		game.schedule(3000, {=>game.addVisual(creditos)})
		game.schedule(8000, {=>game.stop()})
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
		medusa.spawnear()
		caliz.spawnear()
		manzana.spawnear()
		llave.spawnear()
		cofre.spawnear()
		}
		
	method spawnearMonedas(){
		game.schedule(10000, {self.spawnMoneda(100)})
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

