require 'src/utils'

function love.load()
    initSprites()
    setupWindow()
    initSounds()

    cubone = sprites[1]
    speed = 120
    x = VIRTUAL_WIDTH
    y = VIRTUAL_HEIGHT / 2
    anime = Animation {
        frames = {cubone},
        interval = 0.2
    }

    sounds['music']:setLooping(true)
    sounds['music']:play()
end
 
function love.draw()
    drawBackground()
    love.graphics.draw(anime:getCurrentFrame(), x, y, 0, 2.6, 2.6) 
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