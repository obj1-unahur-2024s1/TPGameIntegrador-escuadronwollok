import wollok.game.*
import personajes.*

object juego{
	method iniciar(){
			game.addVisualCharacter(player)
			
			game.onCollideDo(player,{algo =>algo.chocarCon()})
			
			self.spawnBadGuys()
			self.spawnPowerUps()
	}
	method spawnMinotaur(){}
		//crear metodo para spawnear trampas, minotauro
		//en el video de Mario lo hace recurrentemente
		//https://www.youtube.com/watch?v=gAkqZ19bpaM
		}
		
	method spawnTrap(){}
	
	method spawnPowerUps(){
		//crear metodo para spawnear armas, monedas, vidas
		//en el video de Mario lo hace recurrentemente
		//https://www.youtube.com/watch?v=gAkqZ19bpaM
		game.schedule(500,{self.spawnMoneda(100)})
		}
		method spawnMoneda(valor){
			const pos = self.posicionAleatoria()
			const moneda = new Moneda(valor = valor)
			game.addVisual(moneda)
			moneda.animarse()
		}
		method posicionAleatoria(){
			game.at(
				0.randomUpTo(game.width()),
				0.randomUpto(game.height())
			)
}



object tablero{
	method position() = game.center()

	method image() = "maze/maze_bg.png"
	
	//todo objeto debe tener por lo menos position. Image si necesitamos que se vea
	//Las paredes invisibles del pacman no usan image
}



class Items{
	//aca podemos poner armas, monedas, power ups
	method chocarCon(){//sumar vida, puntos, dar poder... los powerups cofres son estaticos solo podemos chocarlo nosotros
	}
}

class Moneda{
	var image = "moneda.png"
	var = valor
	const position //son fijas
	method chocarCon(){
		//sumas puntos solo puede colisionar con player
	method animarse(){
		}
	method image() = image
	method position() =
	}
}


