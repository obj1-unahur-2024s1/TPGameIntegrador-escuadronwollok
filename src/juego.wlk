import wollok.game.*


object juego{
	method iniciar(){
			game.addVisualCharacter(player)
			
			game.onCollideDo(player,{algo =>algo.colisionPlayer()})
			
			self.spawnBadGuys()
			self.spawnPowerUps()
	}
	method spawnBadGuys(){}
		//crear metodo para spawnear trampas, minotauro
		//en el video de Mario lo hace recurrentemente
		//https://www.youtube.com/watch?v=gAkqZ19bpaM
		}
	
	method spawnPowerUps(){
		//crear metodo para spawnear armas, monedas, vidas
		//en el video de Mario lo hace recurrentemente
		//https://www.youtube.com/watch?v=gAkqZ19bpaM
		game.schedule(500,{self.spawnMoneda(100)})
		}
		method spawnMoneda(valor){
			const moneda = new Moneda(valor = valor)
			game.addVisual(moneda)
			moneda.animarse()
		}
}

object player {
	var position = game.center()
	var puntos 0
	var vidas = 3

	method position(){
		return position
		

	}

	method image() = "pepita.png"
	
	method moverArriba() = position.up(1)
	method moverDerecha() = position.right(1)
	method moverAbajo() = position.down(1)
	method moverIzquierda() = position.left(1)

}

object tablero{
	method position() = game.center()

	method image() = "maze/maze_bg.png"
	
	//todo objeto debe tener por lo menos position. Image si necesitamos que se vea
}

class BadGuy{
	method colisionPlayer(){//sacar vida}
	}
	method spawnBadGuy(){
		game.addVisual(self)
	}
	method movimiento(){}
}

class Items{
	//aca podemos poner armas, monedas, power ups
	method colisionPlayer(){//sumar vida, puntos, dar poder
	}
}

class Moneda{
	var = valor
	method colisionPlayer(){
		//sumas puntos
	method animarse(){
		}
	}
}
