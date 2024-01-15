local Circle = Object:extend()

function Circle:new(x, y, radius)
  self.x = x or 0
  self.y = y or 0
  self.r = radius or 50
  self.creation_time = love.timer.getTime()
end

function Circle:update(dt)

end

function Circle:draw()
  if love.graphics then love.graphics.circle('fill', self.x, self.y ,self.r) end
end

return Circle
