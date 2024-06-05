import wollok.game.*
import personajes.*



class Pared {
	const property position
	
	method chocarCon(personaje) {
		personaje.regresar()
		//game.say(player, "choque algo")
	}
}


object juego {
	
	method iniciar() {
		game.title("Maze of Crete")
		game.width(20)
		game.height(14)
		game.cellSize(50)
		
		game.addVisualCharacter(player)
		game.addVisual(vida)
		
		const enemigos = #{new Minotaur(posInicial = game.at(10,11)), new Minotaur(posInicial = game.at(12,2))}
		enemigos.forEach({enemigo =>
			game.addVisual(enemigo)
			game.onTick(1.randomUpTo(5) * 300,"movimiento",{
				enemigo.acercarseA(player)
			})
			game.onCollideDo(enemigo,{algo => algo.chocarCon(enemigo)})
		})
		
		self.spawnearMonedas()
		//agregando Traps
		//game.addVisual(new Trap(numero = 1))
        //game.addVisual(new Trap(numero = 2))
		self.decidirTablero()
		self.configurarTeclas()
		game.boardGround("casilleroJuego.jpg")
		game.onCollideDo(player,{algo => algo.chocarCon(player)})
		
		
		
		
		//self.spawnEnemigos()
		//self.spawnPowerUps()
		

			//agregando Traps
			//game.addVisual(new Trap(numero = 1))
            //game.addVisual(new Trap(numero = 2))
			//game.addVisual(minotaur1)
			//self.decidirTablero()
			//self.configurarTeclas()
			//game.boardGround("casilleroJuego.jpg")
			//game.onCollideDo(player,{algo => algo.chocarCon(player)})
			
			//const minotaurs = [new Minotaur(position = game.at(10,11)) , new Minotaur (position = game.at(15,2))]
			//minotaurs.forEach{
			//	minotaur => game.addVisual(minotaur)
				          //  game.onCollideDo(minotaur,{player => player.chocarCon(minotaur)})
		                  //  game.onTick(500,"movimiento",{ minotaur.acercarseA(player)})
			                
			/}
			//self.spawnEnemigos()
			//self.spawnPowerUps()
			//self.spawnearMonedas()
=======

	}
	
	method finalizar(){
		game.stop()
		game.clear()
		game.addVisual("gameOver.png")
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
	method spawnearMinotaur() {
		
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



 
class Moneda {
	const image = "./items/moneda.png"
	var valor
	const position//son fijas
	
	method chocarCon(player){
		player.aumentarPuntos(valor)
		game.say(player, "Tengo " + player.puntaje().toString() + " monedas")
		game.removeVisual(self)
		juego.spawnMoneda(valor * 2)
=======

class Items{
	
	method chocarCon(){}
	method chocarCon(cosa){}
	//aca podemos poner armas, monedas, power ups
//	method chocarCon(){//sumar vida, puntos, dar poder... los powerups cofres son estaticos solo podemos chocarlo nosotros
//	}
}

class Moneda inherits Items {
	const image = "./items/moneda.png"
	var valor
	const position
	override method chocarCon(cosa){
		if (cosa == player) {
			player.aumentarPuntos(valor)
			game.say(player, "Tengo " + player.puntaje().toString() + " monedas")
			game.removeVisual(self)
			juego.spawnMoneda(valor)}
>>>>>>> 914721b6c2e10c71944b51bd9d8b6a26469c3812
	}
	method animarse(){}
	
	method image() = image
	
	method position() = position
}

class Trap {
	const numero
	method image() = "trap" + numero.toString() + ".png"
	method position() = game.center()
	
	method  chocaCon(){
		player.regresar()
	   	player.perderPuntos(5)
	  	player.checkVidas()
	}
	
}

object vida inherits Items { 
	var property vidasActuales = 3
<<<<<<< HEAD
	const position = game.at (10,13)
=======
>>>>>>> 914721b6c2e10c71944b51bd9d8b6a26469c3812
	
//	falta agregarle un texto/número al lado de la imagen, que indique la cantidad de vidas que quedan
//	y ponerle una imagen de corazón o algo parecido

	method position() = game.at(0,game.height()-1)
	method image() = "items/manzana.png"
	
	method perderVida(){
		vidasActuales = 0.max(vidasActuales-1)
	}
	method ganarVida(){
		vidasActuales = 3.min(vidasActuales+1)
	}
}

