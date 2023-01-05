function drawCubone()
    local rsz = 2.6
    love.graphics.draw(sprites[10], 0, WINDOW_HEIGHT - sprites[10]:getHeight()*rsz + 30, 0, rsz, rsz)
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

    enemies[e].health = 250 
    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.rectangle("fill", 40 + 2, 35 + 2, enemies[e].health - 4, 18 - 4, 7, 7)


    love.graphics.setLineWidth(1)
    love.graphics.setColor(1, 1, 1, 1)
end