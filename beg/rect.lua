local Rect = {}
Rect.__index = Rect

function Rect:new(w, h, s, x, y)
	local rect = {}
	rect.width = w
	rect.height = h
	rect.s = s
	rect.y = y
	rect.x = x 
	setmetatable(rect, Rect)
	return rect
end

function Rect:draw(mode)
	love.graphics.rectangle(mode, self.x, self.y, self.width, self.height)
end

function Rect:update(dt)
	self.x = self.x + self.s * dt
end

return Rect
