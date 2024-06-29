import wollok.game.*
import juego.*
import pantalla.*
import personajes.*
import elementos.*

object laberinto {
		
	method decidirTablero() {
		
		const numeroTablero = (1..3).anyOne() // PONER DE 1 A 5
		
		if (numeroTablero == 1) {
			game.addVisual(tablero1Prueba)
			self.spawnearElementos1()
		} else if (numeroTablero == 2){
			game.addVisual(tablero2)
			self.spawnearElementos2()
		} else if (numeroTablero == 3){
			game.addVisual(tablero3)
			self.spawnearElementos3()
		} else if (numeroTablero == 4) {
			self.spawnearElementos4()
		} else {
			self.spawnearElementos5()
		}
	}
		
//	method spawnearMinotaur() {
//		
//	}
	
	method spawnearElementos1() {
		const n = "nada" 		//Las n serian en donde estan los muros de la imagen, pero en el codigo, los muros estarian alrededor de los de la image
		
		self.dibujarLineaDeElementos(29, [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])
		self.dibujarLineaDeElementos(28, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1])
		self.dibujarLineaDeElementos(27, [0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1])
		self.dibujarLineaDeElementos(26, [0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(25, [0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(24, [3,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,3,1,1,n,n,n,n,n,1,3,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,3,1,1,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(23, [0,1,1,n,n,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1])
		self.dibujarLineaDeElementos(22, [0,1,1,n,n,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1])
		self.dibujarLineaDeElementos(21, [0,1,1,n,n,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,0,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1])
		self.dibujarLineaDeElementos(20, [0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,0,1,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n])
		self.dibujarLineaDeElementos(19, [0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,0,0,0,0,0,0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n])
		self.dibujarLineaDeElementos(18, [0,1,1,n,n,1,0,1,1,n,n,1,3,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,1,1,1,1,1,1,1,1,1,n,n,1,3,1,1,n,n,n,n,n,n,n,n,n])
		self.dibujarLineaDeElementos(17, [0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,1,1,1,1,1,1,1,1,1])
		self.dibujarLineaDeElementos(16, [0,1,1,n,n,1,0,1,1,n,n,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,0,0,0,0,0,0,0,0,0,1,1])
		self.dibujarLineaDeElementos(15, [0,1,1,n,n,1,3,1,1,n,n,1,0,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,0,1,1,1,1,1,0,1,1])
		self.dibujarLineaDeElementos(14, [0,1,1,1,1,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,0,1,1,n,n,1,0,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,0,1,1,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(13, [0,0,0,0,0,0,0,1,1,n,n,1,0,1,1,n,n,1,0,0,0,0,1,1,n,n,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(12, [1,1,1,1,1,1,0,1,1,n,n,1,0,1,1,n,n,1,1,1,1,0,1,1,n,n,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(11, [n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(10, [n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(09, [n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,1,3,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,3,1,1,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(08, [1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(07, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(06, [0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,0,1,1,1,1,1,n,n,1,3,1,1])
		self.dibujarLineaDeElementos(05, [0,1,1,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,0,1,1,0,1,1,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(04, [0,1,1,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,1,0,0,0,0,0,0,0,1,1,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(03, [3,1,1,n,n,n,n,n,n,n,n,n,n,n,1,3,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,3,1,1,n,n,n,n,n,1,0,1,1,0,1,1,0,1,1,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(02, [0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1])
		self.dibujarLineaDeElementos(01, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1])
		self.dibujarLineaDeElementos(00, [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])
	}
	
	method spawnearElementos2() {
		const n = "nada" 		//Las n serian en donde estan los muros de la imagen, pero en el codigo, los muros estarian alrededor de los de la image
		
		self.dibujarLineaDeElementos(29, [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])
		self.dibujarLineaDeElementos(28, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
		self.dibujarLineaDeElementos(27, [0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1])
		self.dibujarLineaDeElementos(26, [0,1,1,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(25, [0,1,1,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(24, [0,1,1,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(23, [0,1,1,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(22, [0,1,1,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(21, [0,1,1,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(20, [0,1,1,n,n,1,0,1,1,n,n,1,1,1,1,0,1,1,1,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1])
		self.dibujarLineaDeElementos(19, [0,1,1,n,n,1,0,1,1,n,n,1,0,0,0,0,0,0,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1])
		self.dibujarLineaDeElementos(18, [0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,1,1,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1])
		self.dibujarLineaDeElementos(17, [0,1,1,1,1,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(16, [0,0,0,0,0,0,0,1,1,n,n,1,0,1,1,n,n,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(15, [1,1,1,1,1,1,0,1,1,n,n,1,0,1,1,n,n,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(14, [n,n,n,n,n,1,0,1,1,1,1,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(13, [n,n,n,n,n,1,0,0,0,0,0,0,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(12, [n,n,n,n,n,1,0,1,1,1,1,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(11, [1,1,1,1,1,1,0,1,1,n,n,1,0,1,1,1,1,1,1,1,1,n,n,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1])
		self.dibujarLineaDeElementos(10, [0,0,0,0,0,0,0,1,1,n,n,1,0,0,0,0,0,0,0,1,1,n,n,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1])
		self.dibujarLineaDeElementos(09, [0,1,1,1,1,1,0,1,1,n,n,1,0,1,1,1,1,1,0,1,1,n,n,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1])
		self.dibujarLineaDeElementos(08, [0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(07, [0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(06, [0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(05, [0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(04, [0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(03, [0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(02, [0,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1])
		self.dibujarLineaDeElementos(01, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1])
		self.dibujarLineaDeElementos(00, [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])
	}
	
	method spawnearElementos3() {
		const n = "nada" 		//Las n serian en donde estan los muros de la imagen, pero en el codigo, los muros estarian alrededor de los de la image
		
		self.dibujarLineaDeElementos(29, [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n])
		self.dibujarLineaDeElementos(28, [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n])
		self.dibujarLineaDeElementos(27, [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n])
		self.dibujarLineaDeElementos(26, [n,n,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,n,n,n])
		self.dibujarLineaDeElementos(25, [n,n,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,3,0,0,0,0,0,0,0,0,0,0,0,0,1,1,n,n,n])
		self.dibujarLineaDeElementos(24, [n,n,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,n,n,n])
		self.dibujarLineaDeElementos(23, [n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n])
		self.dibujarLineaDeElementos(22, [n,n,1,3,1,1,n,n,n,n,n,n,n,n,n,n,n,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n])
		self.dibujarLineaDeElementos(21, [n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n])
		self.dibujarLineaDeElementos(20, [n,n,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n])
		self.dibujarLineaDeElementos(19, [n,n,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,3,1,1,n,n,n,n,n,n,n,n,n,n,n,1,3,1,1,n,n,n])
		self.dibujarLineaDeElementos(18, [n,n,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n])
		self.dibujarLineaDeElementos(17, [n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1])
		self.dibujarLineaDeElementos(16, [n,n,1,3,1,1,n,n,n,n,n,n,n,n,n,n,n,1,3,1,1,n,n,n,n,n,n,n,n,n,n,n,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1])
		self.dibujarLineaDeElementos(15, [n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,0,1,1])
		self.dibujarLineaDeElementos(14, [1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(13, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(12, [0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,n,n,n,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(11, [0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(10, [3,1,1,n,n,1,3,1,1,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,3,1,1,n,n,1,3,1,1,n,n,1,3,1,1])
		self.dibujarLineaDeElementos(09, [0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,n,n,1,0,1,1,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(08, [0,1,1,n,n,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,n,n,n,n,n,n,n,n,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,0,1,1])
		self.dibujarLineaDeElementos(07, [0,1,1,n,n,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,n,n,n,n,n,n,n,n,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1])
		self.dibujarLineaDeElementos(06, [0,1,1,n,n,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1])
		self.dibujarLineaDeElementos(05, [0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(04, [0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,n,n,n,n,n,1,3,1,1,n,n,n,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(03, [0,1,1,n,n,1,0,1,1,n,n,n,n,n,n,n,n,n,n,n,n,n,n,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,n,n,n,n,n,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1])
		self.dibujarLineaDeElementos(02, [0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,n,n,n,n,n,n,n,n,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1])
		self.dibujarLineaDeElementos(01, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,n,n,n,n,n,n,n,n,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0])
		self.dibujarLineaDeElementos(00, [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,n,n,n,n,n,n,n,n,n,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])
	}
	
	method spawnearElementos4() {
		const n = "nada" 		//Las n serian en donde estan los muros de la imagen, pero en el codigo, los muros estarian alrededor de los de la image
		
		self.dibujarLineaDeElementos(29, [0])
		self.dibujarLineaDeElementos(28, [])
		self.dibujarLineaDeElementos(27, [])
		self.dibujarLineaDeElementos(26, [])
		self.dibujarLineaDeElementos(25, [])
		self.dibujarLineaDeElementos(24, [])
		self.dibujarLineaDeElementos(23, [])
		self.dibujarLineaDeElementos(22, [])
		self.dibujarLineaDeElementos(21, [])
		self.dibujarLineaDeElementos(20, [])
		self.dibujarLineaDeElementos(19, [])
		self.dibujarLineaDeElementos(18, [])
		self.dibujarLineaDeElementos(17, [])
		self.dibujarLineaDeElementos(16, [])
		self.dibujarLineaDeElementos(15, [])
		self.dibujarLineaDeElementos(14, [])
		self.dibujarLineaDeElementos(13, [])
		self.dibujarLineaDeElementos(12, [])
		self.dibujarLineaDeElementos(11, [])
		self.dibujarLineaDeElementos(10, [])
		self.dibujarLineaDeElementos(09, [])
		self.dibujarLineaDeElementos(08, [])
		self.dibujarLineaDeElementos(07, [])
		self.dibujarLineaDeElementos(06, [])
		self.dibujarLineaDeElementos(05, [])
		self.dibujarLineaDeElementos(04, [])
		self.dibujarLineaDeElementos(03, [])
		self.dibujarLineaDeElementos(02, [])
		self.dibujarLineaDeElementos(01, [])
		self.dibujarLineaDeElementos(00, [])
	}
	
	method spawnearElementos5() {
		const n = "nada" 		//Las n serian en donde estan los muros de la imagen, pero en el codigo, los muros estarian alrededor de los de la image
		
		self.dibujarLineaDeElementos(29, [])
		self.dibujarLineaDeElementos(28, [])
		self.dibujarLineaDeElementos(27, [])
		self.dibujarLineaDeElementos(26, [])
		self.dibujarLineaDeElementos(25, [])
		self.dibujarLineaDeElementos(24, [])
		self.dibujarLineaDeElementos(23, [])
		self.dibujarLineaDeElementos(22, [])
		self.dibujarLineaDeElementos(21, [])
		self.dibujarLineaDeElementos(20, [])
		self.dibujarLineaDeElementos(19, [])
		self.dibujarLineaDeElementos(18, [])
		self.dibujarLineaDeElementos(17, [])
		self.dibujarLineaDeElementos(16, [])
		self.dibujarLineaDeElementos(15, [])
		self.dibujarLineaDeElementos(14, [])
		self.dibujarLineaDeElementos(13, [])
		self.dibujarLineaDeElementos(12, [])
		self.dibujarLineaDeElementos(11, [])
		self.dibujarLineaDeElementos(10, [])
		self.dibujarLineaDeElementos(09, [])
		self.dibujarLineaDeElementos(08, [])
		self.dibujarLineaDeElementos(07, [])
		self.dibujarLineaDeElementos(06, [])
		self.dibujarLineaDeElementos(05, [])
		self.dibujarLineaDeElementos(04, [])
		self.dibujarLineaDeElementos(03, [])
		self.dibujarLineaDeElementos(02, [])
		self.dibujarLineaDeElementos(01, [])
		self.dibujarLineaDeElementos(00, [])
	}
	
	method dibujarLineaDeElementos(posicionY, vectorFila) {
		
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
	
object tablero1Prueba {
	method position() = game.origin()
	method image() = "./assets/maze/tableroJuegoFinal1.png"
	
	method chocarCon(algo) {
		
	}
	
}

object tablero2 {
	method position() = game.origin()
	method image() = "./assets/maze/tableroJuegoFinal2.png"
	
	method chocarCon(algo) {
		
	}
}

object tablero3 {
	method position() = game.origin()
	method image() = "./assets/maze/tableroJuegoFinal3.png"
	
	method chocarCon(algo) {
		
	} 
}