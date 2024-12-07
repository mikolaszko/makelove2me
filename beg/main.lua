function love.load()
	RECT = require("rect")
	RECTANGALES = {}
	R1 = RECT:new(100, 80, 100, 100, 100)
	R2 = RECT:new(150, 120, 100, 250, 120)

	love.graphics.setBackgroundColor(125/255, 204/255, 255/255, 180/255)
end

function love.draw()
	local mode 
	if checkCollsions(R1, R2) then 
		mode = "fill"
	else
		mode = "line"
	end

	R1:draw(mode)
	R2:draw(mode)
end


--function love.keypressed(key)
function love.update(dt)
	R1:update(dt)
end

function checkCollsions(a,b)
	local a_left = a.x
	local a_right = a.x + a.width
	local a_top = a.y
	local a_bottom = a.y + a.height

	local b_left = b.x
	local b_right = b.x + b.width
	local b_top = b.y
	local b_bottom = b.y + b.height

	return a_right > b_left
	and a_left < b_right
	and a_bottom >  b_top
	and a_top < b_bottom
end