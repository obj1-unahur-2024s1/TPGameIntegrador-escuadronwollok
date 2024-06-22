import wollok.game.*
import juego.*
import pantalla.*
import personajes.*
import elementos.*

object laberinto {
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
		
//	method spawnearMinotaur() {
//		
//	}
	
	method spawnearParedes() {
		const n = "nada" 		//Las n serian en donde estan los muros de la imagen, pero en el codigo, los muros estarian alrededor de los de la image
		
		self.dibujarLineaDeParedes(29, [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])
		self.dibujarLineaDeParedes(28, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1])
		self.dibujarLineaDeParedes(27, [0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1])
		self.dibujarLineaDeParedes(26, [0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeParedes(25, [0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeParedes(24, [3,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,3,1,1,n,n,n,n,n,1,3,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,3,1,1,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeParedes(23, [0,1,1,n,n,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1])
		self.dibujarLineaDeParedes(22, [0,1,1,n,n,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1])
		self.dibujarLineaDeParedes(21, [0,1,1,n,n,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1])
		self.dibujarLineaDeParedes(20, [0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,0,1,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n])
		self.dibujarLineaDeParedes(19, [0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,0,0,0,0,0,0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n])
		self.dibujarLineaDeParedes(18, [0,1,1,n,n,1,0,1,1,n,n,1,3,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,1,1,1,1,1,1,1,1,1,n,n,1,3,1,1,n,n,n,n,n,n,n,n,n])
		self.dibujarLineaDeParedes(17, [0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,1,1,1,1,1,1,1,1,1])
		self.dibujarLineaDeParedes(16, [0,1,1,n,n,1,0,1,1,n,n,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,0,0,0,0,0,0,0,0,0,1,1])
		self.dibujarLineaDeParedes(15, [0,1,1,n,n,1,3,1,1,n,n,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,0,1,1,1,1,1,0,1,1])
		self.dibujarLineaDeParedes(14, [0,1,1,1,1,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,0,1,1,n,n,1,0,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,0,1,1,n,n,1,0,1,1])
		self.dibujarLineaDeParedes(13, [0,0,0,0,0,0,0,1,1,n,n,1,0,1,1,n,n,1,0,0,0,0,1,1,n,n,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,n,n,1,0,1,1])
		self.dibujarLineaDeParedes(12, [1,1,1,1,1,1,0,1,1,n,n,1,0,1,1,n,n,1,1,1,1,0,1,1,n,n,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,n,n,1,0,1,1])
		self.dibujarLineaDeParedes(11, [n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1])
		self.dibujarLineaDeParedes(10, [n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1])
		self.dibujarLineaDeParedes(09, [n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,1,3,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,3,1,1,n,n,1,0,1,1])
		self.dibujarLineaDeParedes(08, [1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,n,n,1,0,1,1])
		self.dibujarLineaDeParedes(07, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,n,n,1,0,1,1])
		self.dibujarLineaDeParedes(06, [0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,0,1,1,1,1,1,n,n,1,3,1,1])
		self.dibujarLineaDeParedes(05, [0,1,1,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,0,1,1,0,1,1,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeParedes(04, [0,1,1,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,1,0,0,0,0,0,0,0,1,1,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeParedes(03, [3,1,1,n,n,n,n,n,n,n,n,n,n,n,1,3,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,3,1,1,n,n,n,n,n,1,0,1,1,0,1,1,0,1,1,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeParedes(02, [0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1])
		self.dibujarLineaDeParedes(01, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1])
		self.dibujarLineaDeParedes(00, [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])
	}
	
	method dibujarLineaDeParedes(posicionY, vectorFila) {
		
		
		(0..vectorFila.size()-1).forEach({x=> 
			if(vectorFila.get(x) == 1 ) {
				self.agregarParedEn(x, posicionY)
			}
			else if(vectorFila.get(x) == 0 ) {
				juego.agregarMonedaEn(x, posicionY, 90)
			}
			else if(vectorFila.get(x) == 2) {
				const serpienteChance = if (juego.dificultadExtrema()) 30 else 50
				juego.agregarSerpienteEn(x, posicionY, serpienteChance)
			}
			else if(vectorFila.get(x) == 3) {
				const pinchoChance = if (juego.dificultadExtrema()) 20 else 50
				juego.agregarPinchoEn(x, posicionY, pinchoChance)
			}
		})
	}
	
	method agregarParedEn(x, y) {
		const pared = new Pared(position = game.at(x,y))
		game.addVisual(pared)
	}
	}