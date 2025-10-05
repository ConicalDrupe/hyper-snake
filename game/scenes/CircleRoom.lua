Room = require("game/scenes/Room")

local CircleRoom = Room:extend()

function CircleRoom:draw()
	love.graphics.setColor(0, 1, 0)
	love.graphics.circle("line", 400, 300, 60)
end

function CircleRoom:activate()
	print("CircleRoom " .. self.room_name .. " Activated")
end

function CircleRoom:deactivate()
	_G[self.room_name] = nil
end

return CircleRoom
