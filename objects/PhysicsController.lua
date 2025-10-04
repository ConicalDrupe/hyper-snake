local PhysicsController = Object:extend()

function PhysicsController:new(Snake)
	self.Snake = Snake
end

function PhysicsController:update(dt) end

return PhysicsController
