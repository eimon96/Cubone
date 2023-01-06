function drawCubone()
    rsz = 2.6
    love.graphics.draw(pose, r, WINDOW_HEIGHT - sprites[10]:getHeight()*rsz + 30, 0, rsz, rsz)
end

function drawBattleField()
    local background = sprites[91] 
    love.graphics.draw(background)

    love.graphics.print('1: Tackle', WINDOW_WIDTH - 190, WINDOW_HEIGHT - 90)
    love.graphics.print('2: Bone Throw', WINDOW_WIDTH - 190, WINDOW_HEIGHT - 60)
    love.graphics.print('R: Run', WINDOW_WIDTH - 190, WINDOW_HEIGHT - 30)
end

function drawEnemy()
    local rsz = 3
    if i > WINDOW_WIDTH - enemies[e].image:getWidth()*rsz - 5 then
        i = i - 3
    end
    
    love.graphics.draw(enemies[e].image, i, 5, 0, rsz, rsz)

    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.setLineWidth(2)
    love.graphics.rectangle("line", 40, 35, 250, 18, 7, 7)

    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.rectangle("fill", 40 + 2, 35 + 2, enemies[e].health - 4, 18 - 4, 7, 7)


    love.graphics.setLineWidth(1)
    love.graphics.setColor(1, 1, 1, 1)
end

function battleModeOn()
    if love.keyboard.isDown('r') then
        run = true
    end

    if not run then
        if love.keyboard.isDown('1') then
            time = 3
            tackle = true
        elseif love.keyboard.isDown('2') then
            time = 3
            bone = true
        end
    end
end

function taackle()
    pose = sprites[11]
    if ( enemies[e].health > 42 ) then
        enemies[e].health = enemies[e].health - 5
    else
        enemies[e].health = 4.2
    end
    sounds['tackle']:play()
    if time == 0 then 
        pose  = sprites[10]
        tackle = false
    end
end

function boone()
    pose = sprites[11]
    if ( enemies[e].health > 42 ) then
        enemies[e].health = enemies[e].health - 10
    else
        enemies[e].health = 4.2
    end
    sounds['bone']:play()
    if time == 0 then 
        pose  = sprites[10]
        bone = false
    end
end

function ruun()
    if r > - sprites[10]:getHeight()*rsz then 
        r = r - 6
    else 
        run = false
        sounds['battle']:stop()
        sounds['music']:setLooping(true)
        sounds['music']:play()
        state = 'world'
    end
end