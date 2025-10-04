SnakeInput = require("objects/SnakeInput")
local Snake = Object:extend()

function Snake:new(x, y, girth)
	self.x = x
	self.y = y
	self.girth = girth
	self.links = {}

	self.speed = 400
	self.velocity = 0
end

function Snake:add()
	table.insert(self.links, Snake:new(math.random(300, 500), math.random(300, 500), self.girth))
end

function Snake:update(dt) end

function Snake:draw()
	love.graphics.setColor(1, 1, 1)
	love.graphics.circle("fill", self.x, self.y, self.girth, 100)
	for _, link in ipairs(self.links) do
		love.graphics.circle("fill", link.x, link.y, link.girth, 100)
	end
end

return Snake
