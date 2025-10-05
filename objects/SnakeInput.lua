vector = require("libraries/hump/vector")
local SnakeInput = Object:extend()

function SnakeInput:new(Snake)
	self.Snake = Snake
end

function SnakeInput:update(dt)
	local x, y = love.mouse.getPosition()
	local mv = vector.new(x, y)
	local head = vector.new(self.Snake.x, self.Snake.y)

	local mouse_head_distance = head - mv

	-- Checking if mouse is further away than girth radius
	if mouse_head_distance:len() > self.Snake.girth then
		local new_dir = mouse_head_distance:normalizeInplace()

		-- self.Snake.x = self.Snake.x - dt * self.Snake.speed * new_dir.x
		-- self.Snake.y = self.Snake.y - dt * self.Snake.speed * new_dir.y
		local xf = dt * self.Snake.speed * new_dir.x
		local yf = dt * self.Snake.speed * new_dir.y
		self.Snake.Body:applyForce(xf, yf)
	end
end

return SnakeInput
