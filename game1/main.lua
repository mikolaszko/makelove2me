function love.load()
    local player = require("player")
    local enemy = require("enemy")
    require("bullet")
    love.window.setFullscreen(true);

    PANDA = player:new()
    SNAKE = enemy:new()
    BULLETS = {}
end

function love.draw()
    PANDA:draw();
    SNAKE:draw();

    for _, v in ipairs(BULLETS) do
        v:draw()
    end
end


local function collisionCheck(bullet, enemy)
    local bullet_left = bullet.x - 5
    local bullet_right = bullet.x + 5;
    local bullet_top = bullet.y - 5;
    local bullet_bottom = bullet.y + 5;

    local enemy_left = enemy.x
    local enemy_right = enemy.x + enemy.width;
    local enemy_top = enemy.y;
    local enemy_bottom = enemy.y + enemy.height;

    return bullet_right > enemy_left 
    and bullet_left < enemy_right 
    and bullet_bottom > enemy_top 
    and bullet_top < enemy_bottom
end

function love.keypressed(key)
    PANDA:keyPressed(key)
end

function love.update(dt)
    SNAKE:update(dt)
    PANDA:update(dt)
    for i, v in ipairs(BULLETS) do
        v:update(dt)
        local didHit = collisionCheck(v, SNAKE)
        print(didHit)
        if didHit then
            table.remove(BULLETS, i)
            SNAKE.speed = SNAKE.speed + 50
        end
    end
end


