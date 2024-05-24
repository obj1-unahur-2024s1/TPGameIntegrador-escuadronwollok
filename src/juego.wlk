import wollok.game.*
import personajes.*

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



object tablero{
	method position() = game.center()

	method image() = "maze/maze_bg.png"
	
	//todo objeto debe tener por lo menos position. Image si necesitamos que se vea
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


