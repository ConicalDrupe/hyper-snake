vector = require("libraries/hump/vector")
local SnakeController = Object:extend()

function SnakeController:new(Snake)
	self.Snake = Snake
end

function SnakeController:update(dt)
	local x, y = love.mouse.getPosition()
	local mv = vector.new(x, y)
	local head = vector.new(self.Snake.x, self.Snake.y)

	local mouse_head_distance = head - mv

	-- Checking if mouse is further away than girth radius
	if mouse_head_distance:len() > self.Snake.girth then
		local new_dir = mouse_head_distance:normalizeInplace()

		self.Snake.x = self.Snake.x - dt * self.Snake.speed * new_dir.x
		self.Snake.y = self.Snake.y - dt * self.Snake.speed * new_dir.y
	end
end

return SnakeController
