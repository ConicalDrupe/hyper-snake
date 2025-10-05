Timer = require("libraries/hump/timer")
Object = require("libraries/classic/classic")
Circle = require("objects/Circle")
Snake = require("objects/Snake")
-- require("libraries/utils/recursiveRequire")

Food = require("objects/Food")

-- We Need Stage, Area, GameObject Classes
-- Then we add a camera

function love.load()
	world = love.physics.newWorld(0, 0, true)
	local timer = Timer:new()
	new_food = Food(200, 200, 10, world) -- uses the __call metamethod, which returns a Food:new() object as defined by Classic library

	Snake:new(400, 300, 30, world)
	SnakePhysics:new(Snake, world)
	SnakeInput:new(Snake)
end

function love.update(dt)
	world:update(dt)
	Snake:update(dt)
end

function love.draw()
	Snake:draw()
	new_food:draw()
end
