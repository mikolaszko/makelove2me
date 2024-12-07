local Player = {}
Player.__index = Player

BULLET = require("bullet")
function Player:new()
    local player = {}
    player.img = love.graphics.newImage("assets/panda.png")
    player.x = 50
    player.y = 50

    setmetatable(player, Player)
    return player
end

function Player:draw()
    love.graphics.draw(self.img, self.x, self.y)
end

function Player:update(dt)
    local leftDown = love.keyboard.isDown("left")
    local rightDown = love.keyboard.isDown("right")

    if rightDown then
        self.x = self.x + (400 * dt)
    else if leftDown then
        self.x = self.x - (400 * dt)
    end
    end

end

function Player:keyPressed(key)
    if key == "space" then
        table.insert(BULLETS, BULLET:new(self.x, self.y))
    end
end


return Player