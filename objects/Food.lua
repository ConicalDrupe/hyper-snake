local Food = Object:extend()

function Food:new(x, y, radius, world)
	self.x = x
	self.y = y
	self.r = radius

	self.Body = love.physics.newBody(world, self.x, self.y, "static")
	self.Shape = love.physics.newCircleShape(self.r)
	self.Fixture = love.physics.newFixture(self.Body, self.Shape)
	self.Fixture:setUserData("Food")
end

function Food:draw()
	love.graphics.setColor(1, 0, 0)
	love.graphics.circle("fill", self.x, self.y, self.r, 6)
end

return Food
