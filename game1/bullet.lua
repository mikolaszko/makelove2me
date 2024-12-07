local Bullet = {}
Bullet.__index = Bullet

function Bullet:new(x, y)
    local bullet = {}
    bullet.x = x
    bullet.y = y
    bullet.speed = 750
    bullet.width = 10
    bullet.height = 10

    setmetatable(bullet, Bullet)
    return bullet
end

function Bullet:update(dt)
    self.y = self.y + (self.speed * dt)

    if self.y > love.graphics.getHeight() then
        love.load()
    end
end

function Bullet:draw()
    love.graphics.circle("fill", self.x, self.y, 10)
end


return Bullet