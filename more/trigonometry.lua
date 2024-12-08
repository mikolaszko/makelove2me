function love.load()
    love.window.setFullscreen(true)
    CIRCLE = {}

    CIRCLE.x = 100
    CIRCLE.y = 100
    CIRCLE.radius = 25
    CIRCLE.speed = 200
end

local function getDistance(x1, y1, x2, y2)
    local hor_dis = x1 - x2
    local ver_dis = y1 - y2

    local a = hor_dis^2
    local b = ver_dis^2
    local c = a + b
    local distance = math.sqrt(c)
    return distance
end

function love.draw()
    love.graphics.circle("line", CIRCLE.x, CIRCLE.y, CIRCLE.radius)

    love.graphics.line(CIRCLE.x, CIRCLE.y, mouse_x, CIRCLE.y)
    love.graphics.line(CIRCLE.x, CIRCLE.y, CIRCLE.x, mouse_y)
    love.graphics.line(CIRCLE.x, CIRCLE.y, mouse_x, mouse_y)
    local distance = getDistance(CIRCLE.x, CIRCLE.y, mouse_x, mouse_y)

    love.graphics.circle("line", CIRCLE.x, CIRCLE.y, distance);
end

function love.update(dt)
    mouse_x, mouse_y = love.mouse.getPosition()

    local angle = math.atan2((mouse_y - CIRCLE.y), (mouse_x - CIRCLE.x))
    
    local cos = math.cos(angle)
    local sin = math.sin(angle)
    local distance = getDistance(CIRCLE.x, CIRCLE.y, mouse_x, mouse_y)

    if distance < 400 then
        CIRCLE.x = CIRCLE.x + CIRCLE.speed * cos * (distance/100) * dt
        CIRCLE.y = CIRCLE.y + CIRCLE.speed * sin * (distance/100) * dt
    end
end
