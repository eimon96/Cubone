require 'src/utils'

function love.load()
    initSprites()
    setupWindow()
    initSounds()
    initEnemies()

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

    if state == 'battle' then 
        drawBattleField()
        drawCubone()
        drawEnemy()

        if tackle then 
            taackle()
        end

        if bone then
            boone()
        end

        if run then 
            ruun()
        end
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
    if state == 'battle' and play_growl == true then
        wait = wait - 5
        if wait == 0 then
            enemies[e].growl:setVolume(0.3)
            enemies[e].growl:play()
            play_growl = false
        end
    end

    if state == 'battle' then
        battleModeOn()
    end
end