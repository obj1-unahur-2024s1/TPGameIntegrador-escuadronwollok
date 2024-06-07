import wollok.game.*
import juego.*

class Pantalla {
	var image
	var position
	
 	method image() = image
 	
 	method position() = position
 	
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


const gameOver = new Pantalla(image ="./assets/pantallas/gameOver.png", 
									position = game.at(0, 0))
									

const winScreen = new Pantalla(image = "./assets/pantallas/techo.png", 
									position = game.at(0, 0))

									
const creditos = new Pantalla(image = "./assets/pantallas/creditos.png",
									position = game.at(0,0))	