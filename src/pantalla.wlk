import wollok.game.*
import juego.*
import elementos.*

class Pantalla inherits Items{
	
	
 	override method image() = image
 	
 	override method position() = position
 	
 	method addVisual(){
		if(!game.hasVisual(self)) {
			game.addVisual(self)
		}
	}
	method removeVisual(){
		if(game.hasVisual(self)) {
			game.removeVisual(self)		
		}
	}
 	
 	method ocultaryLuegoEjecutar(accion) {
 		self.removeVisual()
		accion.apply()
 	}

 	method mostrarPorMilisegundosYLuegoEjecutar(timeout, accion) {
 		self.addVisual()
 		
	  	game.schedule(timeout,{
			self.removeVisual()
			accion.apply()
	  	})
 	}
}

const titulo = new Pantalla(image = "./assets/pantallas/titulo.png",
						position = game.at(0, 0))
						
						
const controles = new Pantalla(image = "./assets/pantallas/controles.png",
						position = game.at(0, 0))
						
						
const reglas = new Pantalla(image = "./assets/pantallas/reglas.png",
						position = game.at(0, 0))
						

const gameOver = new Pantalla(image ="./assets/pantallas/gameOver.png", 
									position = game.at(0, 0))
									

const winScreen = new Pantalla(image = "./assets/pantallas/winScreen.png", 
									position = game.at(0, 0))

									
const creditos = new Pantalla(image = "./assets/pantallas/creditos.png",
									position = game.at(0,0))
									
const inventario = new Pantalla(image = "./assets/pantallas/inventarioFinal.png", position = game.at(game.width()-6,0))