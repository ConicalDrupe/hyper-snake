Object = require("libraries/classic/classic")
circle = require("objects/Circle")
Snake = require("objects/Snake")

Food = require("objects/Food")

function love.load()
	Food:new(200, 200, 10)

	Snake:new(400, 300, 30)
	SnakeInput:new(Snake)
end

function love.update(dt)
	Snake:update(dt)
end

function love.draw()
	Snake:draw()
	Food:draw()
end
