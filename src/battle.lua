function drawCubone()
    local rsz = 2.6
    love.graphics.draw(sprites[10], 0, WINDOW_HEIGHT - sprites[10]:getHeight()*rsz + 30, 0, rsz, rsz)
end

function drawBattleField()
    local background = sprites[91] 
    love.graphics.draw(background)
end

function drawEnemy()
    love.graphics.draw(enemies[e])
end