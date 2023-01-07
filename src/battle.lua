function drawCubone()
    love.graphics.draw(sprites[12], bone_x, bone_y, bone_r)
    
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
    
    love.graphics.draw(enemies[e].image, i, e_h, 0, rsz, rsz)

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
        sounds['cubone_growl']:setVolume(0.3)
        sounds['cubone_growl']:play()
        
        run = true
    end

    if not run and not play_growl and not dead then
        if love.keyboard.isDown('1') then
            time = 3
            tackle = true
            bone = false
        elseif love.keyboard.isDown('2') then
            time = 3
            bone = true
            tackle = false
        end
    end

    if enemies[e].health <= 4.2 then 
        if e_h == 5 then 
            enemies[e].growl:setVolume(0.3)
            enemies[e].growl:play()
        end
        if e_h > WINDOW_HEIGHT + enemies[e].image:getHeight() + 30 then
            backToWorld()        
        end

        e_h = e_h + 12
    end
end

function taackle()
    pose = sprites[11]
    if ( enemies[e].health > 42 ) then
        enemies[e].health = enemies[e].health - 5
    else
        enemies[e].health = 4.2
        dead = true
    end
    sounds['tackle']:play()
    if time == 0 then 
        pose = sprites[10]
        tackle = false
    end
end

function boone()
    pose = sprites[11]

    bone_x = bone_x + 70
    bone_y = bone_y - 35
    bone_r = bone_r - 0.6
    
    if ( enemies[e].health > 42 ) then
        enemies[e].health = enemies[e].health - 10
    else
        enemies[e].health = 4.2
        dead = true
    end
    sounds['bone']:play()
    if time == 0 then 
        pose = sprites[10]
        bone_x = sprites[10]:getWidth() - 20
        bone_y = WINDOW_HEIGHT - sprites[10]:getHeight()
        bone_r = 0
        bone = false
    end
end

function ruun()
    bone_x = -50
    bone_y = -50

    if r > - sprites[10]:getHeight()*rsz then 
        r = r - 6
    else 
        run = false
        backToWorld()
    end
end

function backToWorld()
    sounds['battle']:stop()
    sounds['music']:setLooping(true)
    sounds['music']:play()
    state = 'world'
end