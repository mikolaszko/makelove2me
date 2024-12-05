function love.draw()
	love.graphics.rectangle("fill", X, Y, 50, 80)

	for i, value in ipairs(NPCS) do
		love.graphics.print(value, 100, 100 + 50 * i)
	end
end

function love.load()
	NPCS = { "fish1", "fish2" }
	X = 100
	Y = 100
	table.insert(NPCS, "shrimp")
end

function love.update(dt)
	if love.keyboard.isDown("right") then
		X = X + 40 * dt
	end
	if love.keyboard.isDown("left") then
		X = X - 40 * dt
	end
	-- reverse euclidian right?
	if love.keyboard.isDown("up") then
		Y = Y - 40 * dt
	end
	if love.keyboard.isDown("down") then
		Y = Y + 40 * dt
	end
end
