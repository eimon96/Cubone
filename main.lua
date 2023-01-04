require 'src/utils'

function love.load()
    initSprites()
    setupWindow()
    initSounds()

    state = 'world'
    pkmn = false

    cubone = sprites[1]
    SPEED = 120
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
    if state == 'world' then
        drawBackground()
        love.graphics.draw(anime:getCurrentFrame(), x, y, 0, 2.6, 2.6) 
    end
    
    displayFPS()

    if pkmn then
        changeMusic()
        state = 'battle'
    end

    if state == 'battle' then 
        drawBattleField()
        drawCubone()
        drawEnemy()
    end
end

function love.update(dt)
    if state == 'world' then
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
end