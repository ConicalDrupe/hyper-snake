local PhysicsController = Object:extend()

function PhysicsController:new(Snake, World)
	self.Snake = Snake
	self.World = World

	self.Snake.body = love.physics.newBody(self.World, self.Snake.x, self.Snake.y, "dynamic")
	self.Snake.body:setMass(10) --relatively light?
	self.Snake.shape = love.physics.newCircleShape(self.Snake.girth)
	self.Snake.fixture = love.physics.newFixture(self.Snake.body, self.Snake.shape)
	self.Snake.fixture:setUserData("SnakeHead")
end

function PhysicsController:update(dt) end

return PhysicsController
