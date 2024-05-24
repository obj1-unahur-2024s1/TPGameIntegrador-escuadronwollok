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

class BadGuy{
	method colisionPlayer(){//sacar vida}
	}
	method spawnBadGuy(){
		game.addVisual(self)
	}
	method movimiento(){}
}
