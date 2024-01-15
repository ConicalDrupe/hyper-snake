#!/bin/love
Object = require('libraries/classic/classic')
lovebpm = require('libraries/lovebpm/lovebpm')
-- Timer has important methods -> after, every, tween
--  You can implement every via an implementation of after -- useful for making an event stop after a state
Timer = require('libraries/EnhancedTimer')

local Test = require('objects/Test')
local Circle = require('objects/Circle')
local HyperCircle = require('objects/HyperCircle')

function love.load()
  timer = Timer()
  hyper_rad = {radius = 24, inner_rad = 50}
  timer:after(1, function()
    timer:tween(5, hyper_rad, {radius = 50,inner_rad = 120}, 'in-out-cubic', function()
      timer:tween(5, hyper_rad, {radius = 24, inner_rad = 100}, 'in-out-cubic')
    end)
  end)
  -- HC1 = HyperCircle(400,300,hyper_rad.radius,120,10)
  -- C1 = Circle(400,300,50)
end

function love.update(dt)
  timer:update(dt)
end

function love.draw()
  HC1 = HyperCircle(400,300,hyper_rad.radius,hyper_rad.inner_rad,10)
  HC1:draw()
end

function love.keypressed(key)
    print(key)
    if key == 'r' then
      timer:after('r_key_press', 2, function() print(love.math.random()) end)
    end
end

function love.keyreleased(key)
    print(key)
end

function love.mousepressed(x, y, button)
    print(x, y, button)
end

function love.mousereleased(x, y, button)
    print(x, y, button)
end

-- game loop
function love.run()
    if love.math then
	love.math.setRandomSeed(os.time())
    end

    if love.load then love.load(arg) end

    -- We don't want the first frame's dt to include time taken by love.load.
    if love.timer then love.timer.step() end

    local dt = 0
    local fixed_dt = 1 / 60
    local accumulator = 0

    -- Main loop time.
    while true do
        -- Process events.
        if love.event then
	    love.event.pump()
	    for name, a,b,c,d,e,f in love.event.poll() do
	        if name == "quit" then
		    if not love.quit or not love.quit() then
		        return a
		    end
	        end
		love.handlers[name](a,b,c,d,e,f)
	    end
        end

	-- Update dt, as we'll be passing it to update
  -- Options:
  --  1) Fixed Delta Time - dt is just a constant
  --  2) Variable Delta Time - this is default game loop option
  --  3) Semi-Fixed timestep - sets a max on dt...
  --  4) Free The Physics
	if love.timer then
	    love.timer.step() -- stages a new timepoint
	    dt = love.timer.getDelta() -- gets time difference from previous timepoint, and current timepoint
	end

  -- Free the Phisics
  accumulator = accumulator + dt
  while accumulator >= fixed_dt do
    if love.update then love.update(fixed_dt) end
    accumulator = accumulator - fixed_dt
  end

  -- Semi-Fixed Delta Time
  -- while dt > 0 do
  --   local current_dt = math.min(dt, upper_dt)
  --   if love.update then love.update(current_dt) end
  --   dt = dt - current_dt
  -- end


	-- Call update and draw - For Dynamic DT (default)
	-- if love.update then love.update(dt) end -- will pass 0 if love.timer is disabled

	if love.graphics and love.graphics.isActive() then
	    love.graphics.clear(love.graphics.getBackgroundColor())
	    love.graphics.origin()
            if love.draw then love.draw() end
	    love.graphics.present()
	end

	if love.timer then love.timer.sleep(0.001) end
    end
end
