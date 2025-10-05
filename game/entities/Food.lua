local Food = Object:extend()

function Food:new(x, y, radius)
	self.x = x
	self.y = y
	self.r = radius
end

function Food:draw()
	love.graphics.setColor(1, 0, 0)
	love.graphics.circle("fill", self.x, self.y, self.r, 6)
end

return Food
