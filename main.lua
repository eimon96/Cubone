require 'utils'

function love.load()
    initSprites()
    setupWindow()

    cubone = sprites[1].image
    speed = 120
    x = VIRTUAL_WIDTH
    y = VIRTUAL_HEIGHT / 2
    anime = Animation {
        frames = {cubone},
        interval = 0.2
    }
end
 
function love.draw()
    love.graphics.draw(anime:getCurrentFrame(), x, y, 0, 2, 2) 
    displayFPS()
end

function love.update(dt)
    if love.keyboard.isDown('w', 'up') then
        walkUp(dt)
    elseif love.keyboard.isDown('a', 'left') then
        walkLeft(dt)
    elseif love.keyboard.isDown('d', 'right') then
        walkRight(dt)
    elseif love.keyboard.isDown('s', 'down') then
        walkDown(dt)
    end
end