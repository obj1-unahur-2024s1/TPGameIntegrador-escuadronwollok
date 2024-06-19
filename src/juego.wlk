import wollok.game.*
import personajes.*
import pantalla.*
import laberintos.*
import elementos.*

class Pared {
	const property position
	
	method chocarCon(personaje) {
		personaje.regresar()
	}
}

object juego {
	var iniciado = false
	const property enemigos = #{new Minotaur(posInicial = game.at(50,22)), new Minotaur(posInicial = game.at(45,1))}	
	
	method iniciar() {
		game.title("Maze of Crete")
		game.width(66)  // Triple 60 - Original 20
		game.height(30) // Triple 42 - Original 14 - Para que me entre en el monitor 34
		game.cellSize(20) //20 - 50 - Hay que hacer que los assets sean 60x60
		
		
		self.agregarVisuals()
		
		
		laberinto.decidirTablero()
		self.configurarTeclas()
//		self.spawnearMonedas() esto me parece que está al pedo
		self.spawnPowerUps()
		game.onCollideDo(player,{algo => algo.chocarCon(player)})
		self.spawnTraps()
		self.spawnMinotauros()
		
		
		self.mostrarImagenesIniciales()
	}
	
	
	
	method spawnMinotauros() {
		enemigos.forEach({enemigo =>
			game.addVisual(enemigo)
			game.onTick(1.randomUpTo(2) * 300 ,"movimiento",{
				enemigo.acercarseAPlayer()
			})
			game.onCollideDo(enemigo,{algo => algo.chocarCon(enemigo)})
		})
	}
	method spawnTraps() {
		trampas.forEach({trampa => game.addVisual(trampa)})
		trampas2.forEach({trampa => game.addVisual(trampa)})
		trampas3.forEach({trampa => game.addVisual(trampa)})
	}
	
	method agregarVisuals(){
		game.addVisual(tablero1)
		game.addVisual(inventario)
		game.addVisualCharacter(player)
		game.addVisual(vida)
		game.addVisual(score)
	}
	
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
	method agregarMonedaEn(x, y, chance) {
		const valor = 1.randomUpTo(100)
		//chance igual a 90
		if (valor > chance) {
			const moneda = new Moneda(position = game.at(x,y), valor=1, image = "./items/moneda.png")
			game.addVisual(moneda)
		}
	}
	
	method agregarSerpienteEn(x, y, chance) {
		const valor = 1.randomUpTo(100)
		//chance igual a 50
		if (valor > chance) {
			const serpiente = new Serpiente(posInicial = game.at(x,y), image = "./assets/traps/serpiente.png")
			game.addVisual(serpiente)	
		}
	}
	
	method agregarPinchoEn(x, y, chance) {
		const valor = 1.randomUpTo(100)
		//chance igual a 50
		if (valor > chance) {
			const pincho = new Pinchos(posInicial = game.at(x,y))
			game.addVisual(pincho)	
			game.onTick(5000, "togglearTrampa", {pincho.cambiarEstado(); pincho.decirEstado(pincho)})
		}
	}
	
	method configurarTeclas() {
		keyboard.up().onPressDo({player.subir()})
		keyboard.down().onPressDo({player.bajar()})
		keyboard.left().onPressDo({player.izquierda()})
		keyboard.right().onPressDo({player.derecha()})
	}
	
	method spawnPowerUps(){
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
}

