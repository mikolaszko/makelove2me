function love.draw()
	for i, v in ipairs(rectangles) do
		love.graphics.rectangle("line", v.x, v.y, v.width, v.height)
	end
end

function createRect()
	RECT = {}
	RECT.width = 100
	RECT.height = 50
	RECT.x = 100
	RECT.y = 100
	RECT.speed = 80

	table.insert(rectangles, RECT)
end

function love.load()
	rectangles = {}
end

function love.keypressed(key)
	if key == "space" then
		createRect()
	end
end

function love.update(dt)
	for i, v in ipairs(rectangles) do
		v.x = v.x + v.speed * dt
	end
end
