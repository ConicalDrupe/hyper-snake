Timer = require("libraries/hump/timer")
Object = require("libraries/classic/classic")

Circle = require("game/entities/Circle")
Snake = require("game/entities/Snake")
Food = require("game/entities/Food")

CircleRoom = require("game/scenes/CircleRoom")

function love.load()
	Rooms = {}
	CurrentRoom = nil
	CircleRoom("CircleRoom", 1)
	Timer = Timer:new()

	Food:new(200, 200, 10)
	Snake:new(400, 300, 30)
	SnakeInput:new(Snake)
end

function love.update(dt)
	if CurrentRoom then
		CurrentRoom:update()
	end
	Snake:update(dt)
end

function love.draw()
	if CurrentRoom then
		CurrentRoom:draw()
	end
	Snake:draw()
	Food:draw()
end

function love.keypressed(key, scancode, isrepeat)
	if scancode == "f1" then
		GotoRoom("CircleRoom", 1)
	end
end

function AddRoom(room_name, room_id, ...)
	local room = _G[room_name](room_id, ...)
	Rooms[room_name] = room
	return room
end

-- Function for going to rooms, where rooms can be persistent.
-- Room_name is a string, room_id is a unique identifier

function GotoRoom(room_name, room_id, ...)
	if CurrentRoom and Rooms[room_name] then
		-- deactivate will de-reference variables
		if CurrentRoom.deactivate then
			CurrentRoom:deactivate()
		end

		CurrentRoom = Rooms[room_name]

		-- activate will help load data from disk
		if CurrentRoom.activate then
			CurrentRoom:activate()
		end
	else
		CurrentRoom = AddRoom(room_name, room_id, ...)
	end
end
