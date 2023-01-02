function drawCubone()
    rsz = 2.6
    love.graphics.draw(sprites[10], 0, WINDOW_HEIGHT - sprites[10]:getHeight()*rsz + 30, 0, rsz, rsz)
end

function drawBattleField()
    background = sprites[91] 
    love.graphics.draw(background)
end