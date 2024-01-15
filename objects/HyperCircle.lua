local Circle = require('objects/Circle')
local HyperCircle = Circle:extend()

function HyperCircle:new(x, y, radius, outer_radius, line_width)
  Circle.super.new(self, x, y, radius)
  self.x = x or 0
  self.y = y or 0
  self.r = radius or 50
  self.outer_radius = outer_radius or 120
  self.line_width = line_width or 10
end

function HyperCircle:update(dt)

end

function HyperCircle:draw()
  if love.graphics then
    love.graphics.setColor(1, 1 ,1) -- set white
    love.graphics.circle('fill', self.x, self.y, self.outer_radius)
    love.graphics.setColor(0, 0, 0) -- set black
    love.graphics.circle('fill', self.x, self.y, self.outer_radius - self.line_width)
    love.graphics.setColor(1, 1, 1) -- set white for center
    love.graphics.circle('fill', self.x, self.y, self.r)
  end
end

return HyperCircle
