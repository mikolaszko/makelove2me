local Enemy = {}
Enemy.__index = Enemy


function Enemy:new()
    local enemy = {}
    enemy.img = love.graphics.newImage("assets/snake.png")
    enemy.x = 50
    enemy.y = 700
    enemy.width = enemy.img:getWidth()
    enemy.height = enemy.img:getHeight()
    enemy.speed = 250
    enemy.dir = "right"

    setmetatable(enemy, Enemy)
    return enemy
end

function Enemy:draw()
    love.graphics.draw(self.img, self.x, 700)
end

function Enemy:update(dt)
    local width = love.graphics.getWidth();

    if self.x < 0 then
        self.dir = "right"
    elseif  self.x > width then
        self.dir = "left"
    end

    if self.dir == "right" then
        self.x = self.x + (self.speed * dt)
    else 
        self.x = self.x - (self.speed * dt)
    end

end

return Enemy