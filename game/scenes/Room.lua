local Room = Object:extend()

function Room:new(room_name, room_id)
	self.room_name = room_name
	self.room_id = room_id
end

function Room:update(dt) end

function Room:draw() end

return Room
