Object = require("libraries/classic/classic")
circle = require("objects/Circle")
Snake = require("objects/Snake")
SnakeController = require("objects/SnakeController")

function love.load()
	Snake:new(400, 300, 50)
	SnakeController:new(Snake)
end

function love.update(dt)
	SnakeController:update(dt)
end

function love.draw()
	Snake:draw()
end
