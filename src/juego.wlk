import wollok.game.*


object player {

	method position() = game.center()

	method image() = "pepita.png"

}

object tablero{
	method position() = game.center()

	method image() = "maze/maze_bg.png"
	
	//todo objeto debe tener por lo menos position. Image si necesitamos que se vea
}