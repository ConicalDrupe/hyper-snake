Object = require("libraries/classic/classic")
circle = require("objects/Circle")
Snake = require("objects/Snake")
SnakeController = require("objects/SnakeController")

Food = require("objects/Food")

function love.load()
	Food:new(200, 200, 10)

	Snake:new(400, 300, 30)
	SnakeController:new(Snake)
end

function love.update(dt)
	SnakeController:update(dt)
end

function love.draw()
	Snake:draw()
	Food:draw()
end
