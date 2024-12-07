require("example")

function love.load()
	TICK = require("tick")
	RECT = require("rect")
	RECTANGALES = {}
	DRAW_REC = false

	TICK.delay(function()
		DRAW_REC = true
	end, 2)
end

function love.draw()
	for _, v in ipairs(RECTANGALES) do
		v:draw()
	end
end

local function createRect()
	local rect = RECT:new(100, 80, 100)
	table.insert(RECTANGALES, rect)
end

function love.keypressed(key)
	if key == "space" then
		createRect()
	end
end

function love.update(dt)
	TICK.update(dt)

	for _, v in ipairs(RECTANGALES) do
		v:update(dt)
	end
end
