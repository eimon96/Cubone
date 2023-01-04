function drawCubone()
    local rsz = 2.6
    love.graphics.draw(sprites[10], 0, WINDOW_HEIGHT - sprites[10]:getHeight()*rsz + 30, 0, rsz, rsz)
end

function drawBattleField()
    local background = sprites[91] 
    love.graphics.draw(background)
end

function drawEnemy()
    local rsz = 3
    if x > WINDOW_WIDTH - enemies[e].image:getWidth()*rsz - 5 then
        x = x - 3
    end
    
    love.graphics.draw(enemies[e].image, x, 5, 0, rsz, rsz)
end