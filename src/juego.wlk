import wollok.game.*


object player {
	var position = game.center()

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

