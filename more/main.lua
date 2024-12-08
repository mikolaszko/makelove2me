function love.load()
    image = love.graphics.newImage("quad_row_antibleed.png")
    frames = {}

    local frame_width = 117
    local frame_height = 223
    local img_width = image:getWidth()
    local img_height = image:getHeight()

    for i=0,1 do
        for j=0,2 do
            table.insert(frames,
                love.graphics.newQuad(
                    1 + j * (frame_width + 2),
                    1 + i * (frame_height + 2),
                    frame_width,
                    frame_height,
                    img_width,
                    img_height
            ))
            if #frames == 5 then
                break
            end
        end
    end
    currentFrame = 1
end
function love.update(dt)
    currentFrame = currentFrame + 10 * dt
    if currentFrame > 5 then
        currentFrame = 1
    end
end

function love.draw()
    love.graphics.draw(image, frames[math.floor(currentFrame)], 100, 100)
end