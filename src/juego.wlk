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
	var property dificultadExtrema
	var iniciado = false
	var reglasVisibles = false
	var controlesVisibles = false
	const property enemigos = []
	const menu = game.sound("./assets/sonidosYMusica/menuMusic.mp3")
	const combat = game.sound("./assets/sonidosYMusica/combatMusic.mp3")
	const victoria = game.sound("./assets/sonidosYMusica/victoria.mp3")
	const muerte = game.sound("./assets/sonidosYMusica/muerte.mp3")
	
	method iniciar() {
		game.title("Maze of Crete")
		game.width(66)
		game.height(30)
		game.cellSize(20) 
		game.schedule(500, {menu.play()})
		self.mostrarImagenesIniciales()
		self.configurarTeclas()		
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
	
	method agregarVisuals(){
		game.addVisual(inventario)
		game.addVisual(vida)
		vida.addVisual()
		game.addVisual(score)
		game.addVisual(contadorSalud)
		game.addVisual(indicadorReglas)
		game.addVisual(indicadorControles)
		score.addVisual()
		self.spawnMinotauros()
		self.spawnPowerUps()
		game.addVisualCharacter(player)
		game.onCollideDo(player,{algo => algo.chocarCon(player)})
	}
	
	method finalizar(){
		game.clear()
		combat.stop()
		muerte.play()
		game.addVisual(gameOver)
		game.schedule(6000, {=>game.stop()})
	}
	
	method ganar() {
		game.clear()
		combat.stop()
		victoria.play()
		game.addVisual(winScreen)
		game.schedule(3000, {=>game.addVisual(creditos)})
		game.schedule(8000, {=>game.stop()})
	}
	
	method configurarVisuals() {
		titulo.removeVisual()
		iniciado = true
		self.agregarVisuals()

	}
	
	method mostrarImagenesIniciales(){
		game.addVisual(titulo)

		keyboard.num1().onPressDo({
		if(!iniciado){
			dificultadExtrema = false
			laberinto.decidirTablero()
			const minotauro1 = new Minotaur(posInicial = game.at(ubicacionMinotauro.decidirUbicacion1X(),ubicacionMinotauro.decidirUbicacion1Y()))
			const minotauro2 = new Minotaur(posInicial = game.at(ubicacionMinotauro.decidirUbicacion2X(),ubicacionMinotauro.decidirUbicacion2Y()))
			enemigos.add(minotauro1)
			enemigos.add(minotauro2)
			self.configurarVisuals()
			menu.stop()
			combat.play()
		}
		})
	   	
	   	keyboard.num2().onPressDo({
		if(!iniciado){
			dificultadExtrema = true
			laberinto.decidirTablero()
			const minotauro1 = new Minotaur(posInicial = game.at(ubicacionMinotauro.decidirUbicacion1X(),ubicacionMinotauro.decidirUbicacion1Y()))
			const minotauro2 = new Minotaur(posInicial = game.at(ubicacionMinotauro.decidirUbicacion2X(),ubicacionMinotauro.decidirUbicacion2Y()))
			enemigos.add(minotauro1)
			enemigos.add(minotauro2)
			self.configurarVisuals()
			menu.stop()
			combat.play()
		}
		})
	}
	
	method mostrarReglas(){
		if(!reglasVisibles){
			reglasVisibles = true
			game.addVisual(reglas)
		}
		else {
			reglasVisibles = false
			game.removeVisual(reglas)
		}
	}
	
	method mostrarControles(){
		if(!controlesVisibles){
			controlesVisibles = true
			game.addVisual(controles)
		}
		else {
			controlesVisibles = false
			game.removeVisual(controles)
		}
	}

	
	method agregarMonedaEn(x, y, chance) {
		const valor = 1.randomUpTo(100)
		//chance igual a 90
		if (valor > chance) {
			const moneda = new Moneda(position = game.at(x,y), valor = 100, image = "./items/moneda.png")
			game.addVisual(moneda)
		}
	}
	
	method agregarSerpienteEn(x, y, chance) {
		const valor = 1.randomUpTo(100)
		//chance igual a 50
		if (valor > chance) {
			const serpiente = new Serpiente(posInicial = game.at(x,y), image = "./assets/traps/serpiente.png")
			game.addVisual(serpiente)	
		} else {
			self.agregarMonedaEn(x, y, chance)
		}
	}
	
	method agregarPinchoEn(x, y, chance) {
		const valor = 1.randomUpTo(100)
		//chance igual a 50
		if (valor > chance) {
			const pincho = new Pinchos(posInicial = game.at(x,y))
			game.addVisual(pincho)
			game.onTick(5000, "togglearTrampa", {pincho.cambiarEstado()})
			const hitBoxPincho1 = new HitboxPincho(posInicial = game.at(x,y+1))
			const hitBoxPincho2 = new HitboxPincho(posInicial = game.at(x,y+2))
			game.addVisual(hitBoxPincho1)
			game.addVisual(hitBoxPincho2)			
			game.onTick(5000, "togglearHitboxTrampa", {	hitBoxPincho1.cambiarEstado();
														hitBoxPincho2.cambiarEstado()
			})
		} else {
			self.agregarMonedaEn(x, y, chance)
		}
	}
	
	method agregarFuegoEn(x, y, chance) {
		const valor = 1.randomUpTo(100)
		//chance igual a 50
		if (valor > chance) {
			const fuego = new Fuego(posInicial = game.at(x,y))
			game.addVisual(fuego)
			game.onTick(100, "animacionFuego", {animacionFuego.siguienteFotograma()})
			const hitBoxFuego1 = new HitboxFuego(posInicial = game.at(x,y+1))
			const hitBoxFuego2 = new HitboxFuego(posInicial = game.at(x+1,y))
			const hitBoxFuego3 = new HitboxFuego(posInicial = game.at(x-1,y))
			game.addVisual(hitBoxFuego1)
			game.addVisual(hitBoxFuego2)
			game.addVisual(hitBoxFuego3)
		} else {
			self.agregarMonedaEn(x, y, chance)
		}
	}
	
	method configurarTeclas() {
		keyboard.up().onPressDo({player.subir()})
		keyboard.down().onPressDo({player.bajar()})
		keyboard.left().onPressDo({player.izquierda()})
		keyboard.right().onPressDo({player.derecha()})
		keyboard.r().onPressDo({self.mostrarReglas()})
		keyboard.c().onPressDo({self.mostrarControles()})
	}
	
	method spawnPowerUps(){
		medusa.spawnear()
		caliz.spawnear()
		manzana.spawnear()
		llave.spawnear()
		cofre.spawnear()
	}
	
	method posicionAleatoria() = 
		game.at(
				0.randomUpTo(game.width()),
				0.randomUpTo(game.height())
				)
}

