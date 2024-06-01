import wollok.game.*
import personajes.*

class Pared {
	const property position
	method image() = "pepita.png"
	
	method chocarCon() {
		player.regresar()
		game.say(player, "choque algo")
	}
}


object juego {
	
	method iniciar() {
			
			game.title("Maze of Crete")
			game.width(20)
			game.height(14)
			game.cellSize(50)
			
			game.addVisualCharacter(player)
			game.onCollideDo(player,{algo => algo.chocarCon()})

			self.decidirTablero()
			game.boardGround("casilleroJuego.jpg")
			self.configurarTeclas()
			
			//self.spawnEnemigos()
			//self.spawnPowerUps()
			self.spawnearMonedas()
	}
	
	method decidirTablero() {
		// UNA FORMA DE IMPLEMENTAR DISTINTOS TIPOS DE TABLEROS QUE SE CARGAN AL INICIO. FALTA IMPLEMENTAR
		// POR AHORA SE UTILIZA UN UNICO TABLERO
//		var numeroTablero = (1..3).anyOne
//		if numeroTablero == 1 {
//			self.spawnearParedes1()
//		} else if {
//			self.spawnearParedes2()
//		} else {
//			self.spawnearParedes3()
//		}
		self.spawnearParedes()
	}
	
	method spawnearParedes() {
		self.dibujarLineaDeParedes(13, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1])
		self.dibujarLineaDeParedes(12, [0,1,1,0,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,0,1])
		self.dibujarLineaDeParedes(11, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1])
		self.dibujarLineaDeParedes(10, [0,1,1,0,1,1,1,1,0,1,1,1,1,0,1,1,1,0,1,0,1])
		self.dibujarLineaDeParedes(09, [0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,1])
		self.dibujarLineaDeParedes(08, [0,1,0,1,0,1,0,1,1,1,1,1,1,0,1,0,1,0,0,0,1])
		self.dibujarLineaDeParedes(07, [0,1,0,1,0,1,0,1,0,0,0,0,1,0,1,0,0,0,1,1,1])
		self.dibujarLineaDeParedes(06, [0,1,0,1,0,1,0,1,0,0,0,0,1,0,1,1,1,0,0,0,1])
		self.dibujarLineaDeParedes(05, [0,0,0,1,0,1,0,1,0,0,0,0,1,0,1,0,1,0,1,0,1])
		self.dibujarLineaDeParedes(04, [1,1,0,1,0,0,0,1,0,0,0,0,1,0,0,0,1,0,1,0,1])
		self.dibujarLineaDeParedes(03, [0,0,0,1,0,1,1,1,0,1,1,1,1,1,1,0,1,0,1,0,1])
		self.dibujarLineaDeParedes(02, [0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,1])
		self.dibujarLineaDeParedes(01, [0,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1,0,1])
		self.dibujarLineaDeParedes(00, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1])
	}
	
	method dibujarLineaDeParedes(posicionY, vectorFila) {
		(0..vectorFila.size()-1).forEach({x=> 
			if(vectorFila.get(x) > 0 ) {
				self.agregarParedEn(x, posicionY)
			}
		})
	}
	
	method agregarParedEn(x, y) {
		const pared = new Pared(position = game.at(x,y))
		game.addVisual(pared)
	}
	
	method spawnMinotaur(){}
	
	method configurarTeclas() {
		keyboard.up().onPressDo({player.subir()})
		keyboard.down().onPressDo({player.bajar()})
		keyboard.left().onPressDo({player.izquierda()})
		keyboard.right().onPressDo({player.derecha()})
		keyboard.p().onPressDo({player.regresar()})
		keyboard.enter().onPressDo({game.say(player, "toque enter")})
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
			moneda.animarse()
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



//class Items{
	//aca podemos poner armas, monedas, power ups
//	method chocarCon(){//sumar vida, puntos, dar poder... los powerups cofres son estaticos solo podemos chocarlo nosotros
//	}
//}

class Moneda {
	const image = "./items/moneda.png"
	var valor
	const position//son fijas
	
	method chocarCon(){
		player.aumentar(valor)
		game.say(player, "Tengo " + player.puntaje().toString() + " monedas")
		game.removeVisual(self)
		juego.spawnMoneda(valor * 2)
	}
	
		//sumas puntos solo puede colisionar con player
	method animarse(){}
	
	method image() = image
	
	method position() = position
	
}





