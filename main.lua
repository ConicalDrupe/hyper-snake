Timer = require("libraries/hump/timer")
Object = require("libraries/classic/classic")

Circle = require("game/entities/Circle")
Snake = require("game/entities/Snake")
Food = require("game/entities/Food")

function love.load()
	timer = Timer:new()
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
