local Rect = {}
Rect.__index = Rect

function Rect:new(w, h, s)
	local rect = {}
	rect.width = w
	rect.height = h
	rect.s = s
	rect.y = math.random(100, 500)
	rect.x = math.random(100, 500)
	setmetatable(rect, Rect)
	return rect
end

function Rect:draw()
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

function Rect:update(dt)
	self.x = self.x + self.s * dt
end

return Rect
