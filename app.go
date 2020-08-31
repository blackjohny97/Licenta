package main
import "github.com/go-martini/martini"
import "github.com/martini-contrib/render"

func main() {
    app := martini.Classic()
    app.Use(render.Renderer())

    // run application
    app.Run()
}