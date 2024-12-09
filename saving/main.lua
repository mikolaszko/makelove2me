function love.load()
    lume = require("lume")
    player = {
        x = 100,
        y = 125,
        size = 25
    }

    coins  =  {}

    if love.filesystem.getInfo("savedata.txt") then
        file = love.filesystem.read("savedata.txt")
        data = lume.deserialize(file)

        player.x = data.player.x
        player.y = data.player.y
        player.size = data.player.size


        for i,v in ipairs(data.coins) do
            table.insert(
                coins,
                {
                    x = v.x,
                    y = v.y,
                    size = 10,
                    image = love.graphics.newImage("dollar.png")
                }
            )
        end
    else 
        for i=1,25 do
            table.insert(
                coins,
                {
                    -- already seeded with os.time
                    x = love.math.random(50, 650),
                    y = love.math.random(50, 450),
                    size = 10,
                    image = love.graphics.newImage("dollar.png")
                }
            )
        end
    end
end

function love.update(dt)
    if love.keyboard.isDown("left") then
        player.x = player.x - (200 * dt)
    elseif  love.keyboard.isDown("right") then
        player.x = player.x + (200 * dt)
    end

    --rev euclidian
    if love.keyboard.isDown("up") then
        player.y = player.y - (200 * dt)
    elseif love.keyboard.isDown("down") then
        player.y = player.y + (200 * dt)
    end


    for i=#coins,1, -1 do
        if checkCollsions(player, coins[i]) then
            table.remove(coins, i)
            player.size = player.size + 2
        end
    end
end

function love.draw()
    love.graphics.circle("fill", player.x, player.y, player.size)

    for i, v in ipairs(coins) do
        love.graphics.circle("line", v.x, v.y, v.size)
        love.graphics.draw(v.image, v.x, v.y, 0, 1, 1, v.image:getWidth()/2, v.image:getHeight()/2)
    end
end

function checkCollsions(a, b) 
    local distance = math.sqrt((a.x - b.x)^2 + (a.y - b.y)^2)

    return distance < a.size + b.size
end

function saveGame()
    data = {}
    data.player = {
        x = player.x,
        y = player.y,
        size = player.size
    }

    data.coins = {}
    for i,v in ipairs(coins) do
        data.coins[i] = {x = v.x, y = v.y}
    end

    serialized = lume.serialize(data)
    local success, message = love.filesystem.write("savedata.txt", serialized)
    if success then
        print('file created')
    else
        print('file not created:', message)
    end
end

function love.keypressed(key)
    print(key)
    if key == "space" then
        saveGame()
    elseif key == "f2" then
        love.filesystem.remove("savedata.txt")
        love.event.quit("restart")
    end
end
