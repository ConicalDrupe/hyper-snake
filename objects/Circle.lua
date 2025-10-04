local Circle = Object:extend()

function Circle:new(x, y, radius)
	self.x = x
	self.y = y
	self.r = radius
	self.creation_time = os.time()
end

function Circle:update(dt) end

function Circle:draw()
	love.graphics.circle("fill", self.x, self.y, self.r, 100)
end

return Circle
